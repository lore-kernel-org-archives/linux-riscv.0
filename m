Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116EBC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y40hNxT1YH+6swgVTyNDEv89unwcREGnsR+v49jtIvM=; b=s3YnPG2SOm/q1d
	VCMJKWLFQhJ0MmIFQh6qGsEj5t3aJ9LvJz+NW/ZACzhisbtObCObwObbgj25sGOFei1b4gP1Jt3ET
	3ALG4Ing4gaeA2Eo4ffjibcHIQ/Re0Zl1h1nSYqKzF72/IvvEvsrNb4dhiI/y8PTzF9AyBZ59r1Rf
	JquZluGNl3NmTPcKMpp4I5Plp4GZC76QlujkE6CvmR1QJtyT54Mu2CuowgUBCw2pt+N1WM+2KLp9K
	GB6Bd9tQ/+lWq51WsjlcWETl4xCl02bQ04twA8QOxQ6bGn4TODfTP8vueBFpJXz4nRCjEzil8ws4z
	GrXz9TF35wQbVibpSosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYtA-009Miz-1J;
	Thu, 03 Aug 2023 14:01:16 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYss-009MKV-1d
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:01:00 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bb07d274feso918459a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071256; x=1691676056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkwDk8dXju8I9w7KpYFAws21Qd1+OBzn/0afxgdVQLI=;
        b=XW9PuJZm7znGzIG6HfPZZ/EGSS3Y+yBOiKzv2jqmphbRIf/VN2MPDFnaWNAm+VOGQP
         34QUrUiKUm4OkSD1al24yYdOf6sjR3/rCgLKIETf0kA2njYbv/lZDER/JT8cSlv6+na2
         aeTQfyDIjwwuX6RVsOiwhNVWY/uXkOLSHKP/UcIpeGGm5fohk16zPrWhL9FJiF16gKdc
         arFNZ5mDy52or5a3sBPZk8uMlAONYl/76yjBviZeEeRH8NVWytAEia2yJkI7REmXODFv
         QoUR1W9PhYUPdMM0u6yp3qAgn7LIAZuHkPSdefAC+ihmm+tyt2eb34SnZEUSmwgl60eT
         gvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071256; x=1691676056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkwDk8dXju8I9w7KpYFAws21Qd1+OBzn/0afxgdVQLI=;
        b=jphPSZwgv6IYzzrjDmDN4NW/AO900095b0ZusJ+loDdnr589UhiWaoJTkCuSDd83ZO
         SY1QDvIfxpQX9gx8zjQpsp+eF0tCSgsA/IbEDKQUgRTUQUN/hAmErj3P+9pFVC9H8D1b
         2/Qm1Q5JEaFi2glN/jpVj6EtQcRSAcSIOffYmQO26j6OuEwlrbI+NODEF5419uJmUr5G
         2fI9/VxMas33xMaBymUblmM7Khfcq43rhWFEfR+EAiRY2wIZdRtzPAdxETk53PmK54/E
         WNFw0SAkT43B74LyTwz1ThGQ4dwWblRef+b92LeXQZXzaCSjdXOKfZLjMlhzKGprjL50
         vf4g==
X-Gm-Message-State: ABy/qLYgLmniaMlrb8JqQgHsJYzdleEOIEeQMmhI6Es0mr/sT9tYkDH7
	WD7sZpHl9nuRlSp/9bPJZYg8Cw==
X-Google-Smtp-Source: APBJJlGZdJ8RVR9JidGuJDXr3yfjorlKS5cjnZTx47GbtEuo0utyyEwhjsgOyM7aj9j2Hz8lFiOMMA==
X-Received: by 2002:a9d:4e89:0:b0:6bc:8cd2:dd9c with SMTP id v9-20020a9d4e89000000b006bc8cd2dd9cmr17883841otk.36.1691071256311;
        Thu, 03 Aug 2023 07:00:56 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Subject: [PATCH v3 09/10] RISC-V: KVM: Improve vector save/restore errors
Date: Thu,  3 Aug 2023 11:00:21 -0300
Message-ID: <20230803140022.399333-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070058_685497_BCE3E901 
X-CRM114-Status: GOOD (  12.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Andrew Jones <ajones@ventanamicro.com>

kvm_riscv_vcpu_(get/set)_reg_vector() now returns ENOENT if V is not
available, EINVAL if reg type is not of VECTOR type, and any error that
might be thrown by kvm_riscv_vcpu_vreg_addr().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 60 ++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index edd2eecbddc2..39c5bceb4d1b 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -91,44 +91,44 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 }
 #endif
 
-static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
+static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 				      unsigned long reg_num,
-				      size_t reg_size)
+				      size_t reg_size,
+				      void **reg_val)
 {
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
-	void *reg_val;
 	size_t vlenb = riscv_v_vsize / 32;
 
 	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
 		if (reg_size != sizeof(unsigned long))
-			return NULL;
+			return -EINVAL;
 		switch (reg_num) {
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
-			reg_val = &cntx->vector.vstart;
+			*reg_val = &cntx->vector.vstart;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
-			reg_val = &cntx->vector.vl;
+			*reg_val = &cntx->vector.vl;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
-			reg_val = &cntx->vector.vtype;
+			*reg_val = &cntx->vector.vtype;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
-			reg_val = &cntx->vector.vcsr;
+			*reg_val = &cntx->vector.vcsr;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
-			return NULL;
+			return -ENOENT;
 		}
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
 		if (reg_size != vlenb)
-			return NULL;
-		reg_val = cntx->vector.datap
+			return -EINVAL;
+		*reg_val = cntx->vector.datap
 			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
 	} else {
-		return NULL;
+		return -ENOENT;
 	}
 
-	return reg_val;
+	return 0;
 }
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
@@ -141,17 +141,20 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
-	void *reg_val = NULL;
 	size_t reg_size = KVM_REG_SIZE(reg->id);
+	void *reg_val;
+	int rc;
 
-	if (rtype == KVM_REG_RISCV_VECTOR &&
-	    riscv_isa_extension_available(isa, v)) {
-		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
-	}
-
-	if (!reg_val)
+	if (rtype != KVM_REG_RISCV_VECTOR)
 		return -EINVAL;
 
+	if (!riscv_isa_extension_available(isa, v))
+		return -ENOENT;
+
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	if (rc)
+		return rc;
+
 	if (copy_to_user(uaddr, reg_val, reg_size))
 		return -EFAULT;
 
@@ -168,17 +171,20 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
-	void *reg_val = NULL;
 	size_t reg_size = KVM_REG_SIZE(reg->id);
+	void *reg_val;
+	int rc;
 
-	if (rtype == KVM_REG_RISCV_VECTOR &&
-	    riscv_isa_extension_available(isa, v)) {
-		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
-	}
-
-	if (!reg_val)
+	if (rtype != KVM_REG_RISCV_VECTOR)
 		return -EINVAL;
 
+	if (!riscv_isa_extension_available(isa, v))
+		return -ENOENT;
+
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	if (rc)
+		return rc;
+
 	if (copy_from_user(reg_val, uaddr, reg_size))
 		return -EFAULT;
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
