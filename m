Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A938C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VKpTErCjZt21mqgDZKEqPDxihxM6+Szhyo/6HFndpk=; b=KZzudGO6kxdChC
	qBwk+yJtYXpr94eZNcBXc2D1cePPVA8jpt7EY6Hi9KYd6WrRyUJ1HDUtWvFENaLSsnI6eKRqvGoo6
	8JzHkYkxB3/cCU5gGO83wJQsRC5zuLyPLQiR0kb1+YkOlCtjKR5yRRCZQbeCVq+EO+6RS9v5MRjBh
	BDlrlvJsD1jbOBsXOHNp90AOWOg9K0j78nhyboWW4CyeppVu5Zxo3ogVJ8VhtwTrL3RvM+J48Qcuo
	jFJmz0CW4tFwW2QO27vRcRzha9bVLGh37ysmG1ToHhfTLtMxsxeP4VsaRS9kyJvxvgoejZMcY2hgE
	2X7TjRVqsVKhqdUeGJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvI3-00CYDH-0u;
	Fri, 04 Aug 2023 13:56:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvHz-00CYCW-2f
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 13:56:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so3607831e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691157379; x=1691762179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QrOExPsUyBczHQXXQ5sJfn4osY/IwWoyDKhrDQsw6fo=;
        b=CF3EHN/0xSuf8TCZRTkVnRptNWOrZkHeL9kMGOk36j7Td85jFlMmKsEYFWGp38YDrJ
         JtDFbc6/HW0lQeFgvRbgkfjcjSb18q/NkyfCu97Vk56YlqTo3rkrFM5KDUF03uBa/iXk
         unhb1HwTajj1A7/DzUkQZthNJ40eqDXPqrOQS759FRpl/FnykVgoDpSqYeBCpRqr1lZ2
         Z5SlTtTV+1AB/cGyyNTYGOiLJ/OTc4h0B26gX+Ri6HnuYrWPKEtwGycv/z/Mjggyqx8u
         lc1Y+6O+v8oL7l6cpd2Tz+GO3+NBfm2/cpHOtVRc5DbNtNu5w3WI/wz3w6tn82OMva8X
         Y34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157379; x=1691762179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrOExPsUyBczHQXXQ5sJfn4osY/IwWoyDKhrDQsw6fo=;
        b=EA0LWoLoBJ3rsdcuMnAqq5NocntkzHI02ByEgcnGEEdyulQJIL+q3KbPs/yltR/vFA
         Jddc/H5JpqhICR94Jb8dvMBi/RIYNROcYdFcWXgg4GG9eIcSj6te9kQl8S3IkzkhNCb4
         DpEehK79A57hYoXhLUecuNq/7Szf1I1bE3+BZlaWQ0KIUUOAOLL9aNBXR9dPfLbSaM7W
         c7Atp3D8tcNd7GYoFeUMG5Tm2pFUu+9Tw/iGocK6nrueoM6rLmocMBthf28qlmXimCSb
         hRaJqctQwo2r8WUKxvtkviNhkROahkOjDdcu4vxnYD0yicSYSI/RZMiwW/ICe+JCi2Vj
         aGhw==
X-Gm-Message-State: AOJu0YzkaxVeVmHkQiK/Nb8Jd7gszY4GiatjGFqpy0XUW5aJqRstaQv4
	eqVJQM7o5r7B3fyClp3woOCXHg==
X-Google-Smtp-Source: AGHT+IHrs3QRMgAqHJiBQNt6l9m2EpJZhJC4Zv8rCXUI9Jr4WvPO1a949jVBmhssZ/DLqzPsy2o22g==
X-Received: by 2002:ac2:58d6:0:b0:4fd:faa3:2352 with SMTP id u22-20020ac258d6000000b004fdfaa32352mr1225261lfo.14.1691157378758;
        Fri, 04 Aug 2023 06:56:18 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id w1-20020a170906184100b00993017b64a8sm1350677eje.224.2023.08.04.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:56:18 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	dbarboza@ventanamicro.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Improve vector save/restore functions
Date: Fri,  4 Aug 2023 16:56:18 +0300
Message-ID: <20230804135617.46188-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_065623_919834_8D11D4C2 
X-CRM114-Status: GOOD (  14.59  )
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

Make two nonfunctional changes to the vector get/set vector reg
functions and their supporting function for simplification and
readability. The first is to not pass KVM_REG_RISCV_VECTOR, but
rather integrate it directly into the masking. The second is to
rename reg_val to reg_addr where and address is used instead of
a value.

Also opportunistically touch up some of the code formatting for
a third nonfunctional change.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

This is based on "[PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg
error code"[1]
[1] https://lore.kernel.org/all/20230803163302.445167-1-dbarboza@ventanamicro.com/

 arch/riscv/include/asm/kvm_vcpu_vector.h |  6 ++--
 arch/riscv/kvm/vcpu_onereg.c             |  6 ++--
 arch/riscv/kvm/vcpu_vector.c             | 46 ++++++++++--------------
 3 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index ff994fdd6d0d..27f5bccdd8b0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -74,9 +74,7 @@ static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 #endif
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype);
+				  const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype);
+				  const struct kvm_one_reg *reg);
 #endif
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 989ea32dbcbe..9fee1c176fbb 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -645,8 +645,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
-						 KVM_REG_RISCV_VECTOR);
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
 	default:
 		break;
 	}
@@ -677,8 +676,7 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
 	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
-						 KVM_REG_RISCV_VECTOR);
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
 	default:
 		break;
 	}
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 39c5bceb4d1b..b430cbb69521 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -92,9 +92,9 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 #endif
 
 static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
-				      unsigned long reg_num,
-				      size_t reg_size,
-				      void **reg_val)
+				    unsigned long reg_num,
+				    size_t reg_size,
+				    void **reg_addr)
 {
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	size_t vlenb = riscv_v_vsize / 32;
@@ -104,16 +104,16 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		switch (reg_num) {
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
-			*reg_val = &cntx->vector.vstart;
+			*reg_addr = &cntx->vector.vstart;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
-			*reg_val = &cntx->vector.vl;
+			*reg_addr = &cntx->vector.vl;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
-			*reg_val = &cntx->vector.vtype;
+			*reg_addr = &cntx->vector.vtype;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
-			*reg_val = &cntx->vector.vcsr;
+			*reg_addr = &cntx->vector.vcsr;
 			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
@@ -122,8 +122,8 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
 		if (reg_size != vlenb)
 			return -EINVAL;
-		*reg_val = cntx->vector.datap
-			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
+		*reg_addr = cntx->vector.datap +
+			    (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
 	} else {
 		return -ENOENT;
 	}
@@ -132,60 +132,52 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 }
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype)
+				  const struct kvm_one_reg *reg)
 {
 	unsigned long *isa = vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
-					    rtype);
+					    KVM_REG_RISCV_VECTOR);
 	size_t reg_size = KVM_REG_SIZE(reg->id);
-	void *reg_val;
+	void *reg_addr;
 	int rc;
 
-	if (rtype != KVM_REG_RISCV_VECTOR)
-		return -EINVAL;
-
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
-	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
 
-	if (copy_to_user(uaddr, reg_val, reg_size))
+	if (copy_to_user(uaddr, reg_addr, reg_size))
 		return -EFAULT;
 
 	return 0;
 }
 
 int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
-				  const struct kvm_one_reg *reg,
-				  unsigned long rtype)
+				  const struct kvm_one_reg *reg)
 {
 	unsigned long *isa = vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
-					    rtype);
+					    KVM_REG_RISCV_VECTOR);
 	size_t reg_size = KVM_REG_SIZE(reg->id);
-	void *reg_val;
+	void *reg_addr;
 	int rc;
 
-	if (rtype != KVM_REG_RISCV_VECTOR)
-		return -EINVAL;
-
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
-	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_val);
+	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
 
-	if (copy_from_user(reg_val, uaddr, reg_size))
+	if (copy_from_user(reg_addr, uaddr, reg_size))
 		return -EFAULT;
 
 	return 0;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
