Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B0C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIfz1bnhQw8XDm+qtulo2/vFJlsmpFc6kNYwmbEG9ek=; b=lZca3842FgLtco
	eduw4Otm3ZbLF9AZsKWQzTM3VOO6C9ip5y6P8Lm/aQ6Pu5pask9ilT3EEm4qoCWmGWzQEnkfo/Fqc
	kHvzhEqtfRQfoWDWS7eLuE3Uz/odXT6QI0C/6b5tUYL3izFYUBUpMmvAixcT0t3raeBvtSoJnxc62
	eit+EsTMle3nlKg5VxYqXQw6cweJ1mCuAi/JvsQRiRnICh7uns8IpgVtRK549VJMj+ig40Vnml029
	xoNiMLh6kcAJ9aOkrnktfBNturbi6qYxXbRZ+SZal177YdZ9phY8rx2zP88IZDgj3zYOCqUPm79wd
	ywnZnfpUHaoyrkCQiEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsX-009Lyo-0l;
	Thu, 03 Aug 2023 14:00:37 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsT-009Ltd-2a
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:36 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b9ec15e014so990583a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071232; x=1691676032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K28DdTTdGk7YSOwV6m7UlxbgGJgXu2t414sxoXFAN+k=;
        b=K1PjG5OxgW7zsvW8WYR1aDxkq0+NR8SovTC6K0kg/rENPsdizzSj5UlBbiOiG5KEEf
         tarozhy2BOCoBsD8Ox87S3q/4SrohoyVBrqAxFkWbTirJ3bN+93Qa0qX5NEsExhF7dY5
         3Jjj7sQ0NW40H6TnBZmaDn4IxcaA+JwEnEG4uXOIUzgjoF5hXSG2Rqu1x8f+OBTCdS5V
         SguuQxFkmrze0/1iOit6k8Ubl+mQtNzeeDurZ7lZ9jwGYfidhSj+S2VDrpLAWyIDpEx1
         5xdYLTay4I7/D2/TtchzfTwCL96IoL0jbBsP1uX8DxyR+Gurz5d+kkLOeUUhYs0esKdp
         WH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071232; x=1691676032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K28DdTTdGk7YSOwV6m7UlxbgGJgXu2t414sxoXFAN+k=;
        b=Bf+kkWAiOjo7VKfpYAtPPcfKChzVhBvjc6AOyNnKvhsUCxZ/lk/yXUZ37nnv+iaKl8
         8V7xkYIpP76CGcMBreg981+91vXe4bA2DpiX41rJ7nW6HEUm06oxpyHXnYeEljTwu0fS
         qOUzAo54njnGYTKZ5JYFQfMtnBpmCi1Ps/A9uTFQK7TMsvrITFuh3TOS9n4ypfRvtH/7
         1Ka/10oigStZ/Pv+8On2f80wZDmz08zu5FnH5uuQz5pK5e6EC0uGXtLerbxYhIEi9FkS
         tEstHjPVnuggVQCe89f0ZnT+aOUVt/5QA6ZYsgOtSXKajw3wVFapNrxJtkuWswK5OXe5
         ONgg==
X-Gm-Message-State: ABy/qLZZoyupDSnTzu08fsLS0yjn0i7PcCGHpYCrNYSH/NFAfFtrY5Yj
	/Op/6KQEg0LcrAiMA+/6UxU5iA==
X-Google-Smtp-Source: APBJJlGIim+//XCIS8Fp7Qcax+UvUCEZn3g+Vw4AHrDx06sxbP0B1uxNLWfvegXeZkAGomXN2Lmjhg==
X-Received: by 2002:a05:6830:1cd:b0:6b9:a98c:c9da with SMTP id r13-20020a05683001cd00b006b9a98cc9damr19149707ota.38.1691071231807;
        Thu, 03 Aug 2023 07:00:31 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 01/10] RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
Date: Thu,  3 Aug 2023 11:00:13 -0300
Message-ID: <20230803140022.399333-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070033_840037_639206AD 
X-CRM114-Status: GOOD (  19.88  )
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

get_one_reg() and set_one_reg() are returning EINVAL errors for almost
everything: if a reg doesn't exist, if a reg ID is malformatted, if the
associated CPU extension that implements the reg isn't present in the
host, and for set_one_reg() if the value being written is invalid.

This isn't wrong according to the existing KVM API docs (EINVAL can be
used when there's no such register) but adding more ENOENT instances
will make easier for userspace to understand what went wrong.

Existing userspaces can be affected by this error code change. We
checked a few. As of current upstream code, crosvm doesn't check for any
particular errno code when using kvm_(get|set)_one_reg(). Neither does
QEMU. rust-vmm doesn't have kvm-riscv support yet. Thus we have a good
chance of changing these error codes now while the KVM RISC-V ecosystem
is still new, minimizing user impact.

Change all get_one_reg() and set_one_reg() implementations to return
-ENOENT at all "no such register" cases.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/aia.c         |  4 ++--
 arch/riscv/kvm/vcpu_fp.c     | 12 ++++++------
 arch/riscv/kvm/vcpu_onereg.c | 30 +++++++++++++++---------------
 arch/riscv/kvm/vcpu_sbi.c    | 16 +++++++++-------
 arch/riscv/kvm/vcpu_timer.c  |  8 ++++----
 5 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 585a3b42c52c..74bb27440527 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -176,7 +176,7 @@ int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	*out_val = 0;
 	if (kvm_riscv_aia_available())
@@ -192,7 +192,7 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (kvm_riscv_aia_available()) {
 		((unsigned long *)csr)[reg_num] = val;
diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 9d8cbc42057a..08ba48a395aa 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -96,7 +96,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
 			reg_val = &cntx->fp.f.f[reg_num];
 		else
-			return -EINVAL;
+			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
 		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
@@ -109,9 +109,9 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 				return -EINVAL;
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
-			return -EINVAL;
+			return -ENOENT;
 	} else
-		return -EINVAL;
+		return -ENOENT;
 
 	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -141,7 +141,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
 			reg_val = &cntx->fp.f.f[reg_num];
 		else
-			return -EINVAL;
+			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
 		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
@@ -154,9 +154,9 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 				return -EINVAL;
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
-			return -EINVAL;
+			return -ENOENT;
 	} else
-		return -EINVAL;
+		return -ENOENT;
 
 	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 85773e858120..65607f80f8db 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -156,7 +156,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = satp_mode >> SATP_MODE_SHIFT;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
@@ -242,7 +242,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	return 0;
@@ -262,7 +262,7 @@ static int kvm_riscv_vcpu_get_reg_core(struct kvm_vcpu *vcpu,
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
 	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (reg_num == KVM_REG_RISCV_CORE_REG(regs.pc))
 		reg_val = cntx->sepc;
@@ -273,7 +273,7 @@ static int kvm_riscv_vcpu_get_reg_core(struct kvm_vcpu *vcpu,
 		reg_val = (cntx->sstatus & SR_SPP) ?
 				KVM_RISCV_MODE_S : KVM_RISCV_MODE_U;
 	else
-		return -EINVAL;
+		return -ENOENT;
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -295,7 +295,7 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
 	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -311,7 +311,7 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 		else
 			cntx->sstatus &= ~SR_SPP;
 	} else
-		return -EINVAL;
+		return -ENOENT;
 
 	return 0;
 }
@@ -323,7 +323,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
@@ -342,7 +342,7 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		reg_val &= VSIP_VALID_MASK;
@@ -381,7 +381,7 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
 		break;
 	default:
-		rc = -EINVAL;
+		rc = -ENOENT;
 		break;
 	}
 	if (rc)
@@ -420,7 +420,7 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
 		break;
 	default:
-		rc = -EINVAL;
+		rc = -ENOENT;
 		break;
 	}
 	if (rc)
@@ -437,7 +437,7 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
 
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
-		return -EINVAL;
+		return -ENOENT;
 
 	*reg_val = 0;
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
@@ -455,7 +455,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
-		return -EINVAL;
+		return -ENOENT;
 
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
@@ -554,7 +554,7 @@ static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
 			reg_val = ~reg_val;
 		break;
 	default:
-		rc = -EINVAL;
+		rc = -ENOENT;
 	}
 	if (rc)
 		return rc;
@@ -592,7 +592,7 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_MULTI_DIS:
 		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	return 0;
@@ -659,5 +659,5 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		break;
 	}
 
-	return -EINVAL;
+	return -ENOENT;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 7b46e04fb667..9cd97091c723 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -140,8 +140,10 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	const struct kvm_riscv_sbi_extension_entry *sext = NULL;
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 
-	if (reg_num >= KVM_RISCV_SBI_EXT_MAX ||
-	    (reg_val != 1 && reg_val != 0))
+	if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
+		return -ENOENT;
+
+	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
@@ -175,7 +177,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 
 	if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
-		return -EINVAL;
+		return -ENOENT;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
 		if (sbi_ext[i].ext_idx == reg_num) {
@@ -206,7 +208,7 @@ static int riscv_vcpu_set_sbi_ext_multi(struct kvm_vcpu *vcpu,
 	unsigned long i, ext_id;
 
 	if (reg_num > KVM_REG_RISCV_SBI_MULTI_REG_LAST)
-		return -EINVAL;
+		return -ENOENT;
 
 	for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
 		ext_id = i + reg_num * BITS_PER_LONG;
@@ -226,7 +228,7 @@ static int riscv_vcpu_get_sbi_ext_multi(struct kvm_vcpu *vcpu,
 	unsigned long i, ext_id, ext_val;
 
 	if (reg_num > KVM_REG_RISCV_SBI_MULTI_REG_LAST)
-		return -EINVAL;
+		return -ENOENT;
 
 	for (i = 0; i < BITS_PER_LONG; i++) {
 		ext_id = i + reg_num * BITS_PER_LONG;
@@ -272,7 +274,7 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_SBI_MULTI_DIS:
 		return riscv_vcpu_set_sbi_ext_multi(vcpu, reg_num, reg_val, false);
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	return 0;
@@ -307,7 +309,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 			reg_val = ~reg_val;
 		break;
 	default:
-		rc = -EINVAL;
+		rc = -ENOENT;
 	}
 	if (rc)
 		return rc;
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 3ac2ff6a65da..527d269cafff 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -170,7 +170,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 	if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 		return -EINVAL;
 	if (reg_num >= sizeof(struct kvm_riscv_timer) / sizeof(u64))
-		return -EINVAL;
+		return -ENOENT;
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_TIMER_REG(frequency):
@@ -187,7 +187,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 					  KVM_RISCV_TIMER_STATE_OFF;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
@@ -211,7 +211,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 	if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 		return -EINVAL;
 	if (reg_num >= sizeof(struct kvm_riscv_timer) / sizeof(u64))
-		return -EINVAL;
+		return -ENOENT;
 
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -233,7 +233,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 			ret = kvm_riscv_vcpu_timer_cancel(t);
 		break;
 	default:
-		ret = -EINVAL;
+		ret = -ENOENT;
 		break;
 	}
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
