resource "aws_ecr_repository" "app_repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE" # معناها نقدر نعدل ونرفع نفس الـ Image tag أكتر من مرة

  # عشان نمسح الـ images القديمة لو ملهاش لازمة ونوفر مساحة
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true # هيعمل فحص أمني للـ Image أول ما تترفع (Trivy هيعمل كده برضه بس دي زيادة أمان)
  }

  tags = {
    Name = var.repo_name
  }
}