Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A02C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJ4uZQ4PlFvr/ru+/vEH6qxRJ+DurouVnOb7BwHiNDw=; b=fhzgFaajuNwChJ
	Tdj9P9+tEHnR9H9M3sdGJ9kKZCe+5pigt7GISGztx6DRCaCgbyG5UCXU+LvffpzmblsdAjmY9DEjD
	3fLRX01zFPbMaiiPrQLoyeRU2odYl3PZ/tKyKoGajDqe4O9JCU7bV9nTFWucTGlQFZRS8+elSloiS
	VpWrjrHDOBm3qVevmmQoH5nYir6AHwJYhs1Ib5/CgvIu9QPl+/izaPGsGABYmbvGvGTLjnnZnu3Tr
	0+u+QC+dGIj9tRo5K4Dw4T2ktdbx0Xn58Gt/B1WS5WcaAPPVggBmU1nEJ3vMeRiMO8XB3DjIjO0KD
	obfrPZwj79DSCQhnCmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxt-0000000BNVX-24WQ;
	Mon, 06 Jul 2026 02:21:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxq-0000000BNSp-3dal
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8454160043aso2405924b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304502; x=1783909302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y30ERfh8jZXt371ovIH8Ihu+zosp/a2nmR6ZkJ+0tQ=;
        b=eGOrFOtDal+U5ECsmnIbon82hDWeea/V2/64Wz08hF+L1SPJDLEPq75R+lq3HaxQ1X
         tmclTg1zHQEk2Wqb9gLpT8UztIEs+EoiX9oET3Ko4xGYsqKX1W642fk+k8FPCfdE0poN
         PDLDI0IIgAH2kFP5BcjhAaDM5MRDlTzP8DNvkLZF85Py6bwNl4LsLUCo9xs2egnq5kHK
         e+ObAsV+OTI00naXQYo+KN67kcLtPMRq1lNDH1A+PD5UdROwweIcUlhQR489muSK4LTH
         UtNVCjMAZE3iIIlph58NRfeDiXviV7OktvwbKdiWVyeQv70nQMeEBLpeA9maYQ9ETmyK
         yuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304502; x=1783909302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9y30ERfh8jZXt371ovIH8Ihu+zosp/a2nmR6ZkJ+0tQ=;
        b=sPtF28dsFoNgeVDuY/VBe2qtCzI+Le5v0RGa6egRQaI/AHOVJPnnWpazwbzbXawpmx
         Tc2yprro01kofrK1qdqOABKZr81p6kD2fFQBAPokoeuNz2UHpkhGQJkxvcKMB3kNIZ8V
         NKOelg2C8RwDgJcyVyVDxiDkAPUllVEZka80DkeU/uCRpjMPlY2L8lupW4jf4a2XLIIM
         N9j7CN+yvwr06oKw1SSVRm6rVpe+FTIKARx2Vs7hkAnryBcZXequNJG3+INnFOP6+qEW
         10CJOUL2DjCYEiI9f1ZBUrBTt0xHblsV5k4AIdXGfrMUCOSZygbtQ6MA8HFvRuhOPyY1
         rDQg==
X-Gm-Message-State: AOJu0YxvGWbF1/D+93ninpsuCRdVaL/aDwF/2lW8ZuAghUEjfKHnuJpM
	PvFlRV3bGlMvFMjNU9l/pXx3NfDTnuSfGWmeIP2lfw/AzQb+d9wRaF7S
X-Gm-Gg: AfdE7ckXMbstqh0xCKYCYw3orR1Hzpl2PShY6y4XadiKESMkEZT58sJ8xoLArzfgtn/
	TYd47nYDGfRBWvKgKKknXjD8S5DzJEUeGXmHMYpRGq1i5DubQi8MSJVKDpKR31/wXA8OlXBeJl9
	jBWbVir2SZQUMHH/ctwE3go0bvhd/deJd5DQlgns9PpzCx8dNypvRIG+Fn16IdQT8K51CL5YhTA
	wWRUdcwgA90kZaLksbJq2JsKzKI2ScbfdExWLzBpAqRBqYbLsNGJ3e236aueSxeCLGVPF90qsp5
	DmZ83W9gTGJomrNsiTF0eSsihRiS1GaMksM4HL989s/inotPH9+nE0zh86INrQPp1Nynihjapu6
	ytFg/pR7g4Bf52+IU9gRjDX12ZSZLODwaZ5xoXKXmjq5jG6ZbRt9SrwaZCqI4OKpac+2ACfEw/e
	A=
X-Received: by 2002:a05:6a00:218b:b0:842:6004:3fcf with SMTP id d2e1a72fcca58-847f6efef03mr7388312b3a.29.1783304501843;
        Sun, 05 Jul 2026 19:21:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db0eaasm2851550b3a.52.2026.07.05.19.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/8] RISC-V: KVM: Add ssp context save/restore
Date: Mon,  6 Jul 2026 10:20:40 +0800
Message-ID: <20260706022046.214956-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192142_915801_44E5FB50 
X-CRM114-Status: GOOD (  19.15  )
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

Add ssp context save/restore for guest VCPUs and also add it to the
ONE_REG interface to allow its access from user space.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 ++++
 arch/riscv/include/uapi/asm/kvm.h |  8 ++++
 arch/riscv/kvm/vcpu.c             |  7 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 68 ++++++++++++++++++++++++++++++-
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec9d2..e5ed3b0e5a55 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -163,6 +163,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_zicfiss_csr {
+	unsigned long ssp;
+};
+
 struct kvm_vcpu_reset_state {
 	spinlock_t lock;
 	unsigned long pc;
@@ -203,6 +207,9 @@ struct kvm_vcpu_arch {
 	/* CPU Smstateen CSR context of Guest VCPU */
 	struct kvm_vcpu_smstateen_csr smstateen_csr;
 
+	/* CPU Zicfiss CSR context of Guest VCPU */
+	struct kvm_vcpu_zicfiss_csr zicfiss_csr;
+
 	/* CPU reset state of Guest VCPU */
 	struct kvm_vcpu_reset_state reset_state;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index a27de850fa4c..fd4c81697617 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -102,6 +102,11 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* Zicfiss CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_zicfiss_csr {
+	unsigned long ssp;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -266,12 +271,15 @@ struct kvm_riscv_sbi_fwft {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_ZICFISS	(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_ZICFISS_REG(name)  \
+	(offsetof(struct kvm_riscv_zicfiss_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..acdb12fcdb69 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -63,6 +63,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	memset(cntx, 0, sizeof(*cntx));
 	memset(csr, 0, sizeof(*csr));
 	memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
+	memset(&vcpu->arch.zicfiss_csr, 0, sizeof(vcpu->arch.zicfiss_csr));
 
 	/* Restore datap as it's not a part of the guest context. */
 	cntx->vector.datap = vector_datap;
@@ -720,6 +721,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -727,10 +729,13 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		csr_write(CSR_SSP, zicficsr->ssp);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -738,6 +743,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		zicficsr->ssp = csr_swap(CSR_SSP, 0);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..dd9519438546 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -355,6 +355,44 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_zicfiss_set_csr(struct kvm_vcpu *vcpu,
+						 unsigned long reg_num,
+						 unsigned long reg_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_zicfiss_get_csr(struct kvm_vcpu *vcpu,
+					  unsigned long reg_num,
+					  unsigned long *out_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -381,6 +419,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -423,6 +464,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -680,6 +724,8 @@ static inline unsigned long num_csr_regs(const struct kvm_vcpu *vcpu)
 		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 	if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
 		n += sizeof(struct kvm_riscv_smstateen_csr) / sizeof(unsigned long);
+	if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		n += sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsigned long);
 
 	return n;
 }
@@ -688,7 +734,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -740,7 +786,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy Zicfiss csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS)) {
+		n4 = sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_ZICFISS | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
