Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A49C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf2DivPwbmJdUWRBFSFTroNCiCL6YTrpmILuoravIaU=; b=OwsHr/PuaIvkia
	hRfAhv/OqWA2oqNbnvNv9+2CgSrhwSJps92bwDhDfY8YwiT8VUZJTjM49Pi/LHlvems/UqDn6Fn7c
	2wOReYaA/9oRm4ZCiNBx1P71wd05O/jSt2CnzNIr36RmAZMF7dPQwv/vjAGbUBMBoceVtI3KqL6bi
	/pcgD1BICx8cYZVD5/jSsBX354opAOhwsHjn1NRat71Et/T45h/Nu70E4IxtHR9nKM+dhrxOscYFQ
	gj6x8AQnM/69QeM7IFPOfMyX55GACegouB553QAARp+16mAMGT3nI0BxmOzJeYN3S7R7qJ16Tt1Ox
	kVZCL3xVEIncSz3WW/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGp-00Dwol-KC; Thu, 02 Feb 2023 00:16:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrLg-FE
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id n13so64868plf.11
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkY3EWeU1LTw6pYs6jsSn394Fmj6mNxxFmTZJ/r/6Fw=;
        b=v5yR+GT5kNDuy09HsCvQQBHRvPIOPhleEkaWdEuJwWPbG+O1zThjPirpZrAn+dS0DT
         MRQe+JG1iYmbzHZNIkYaRAnHDfgIUrr+dO2gT625AC/k5ORVxwqlcH/snaXLFw6M57+X
         vYgM4n358Wezo65HwGYTROA9DDAPt0LvvWPaA3iMZ63c8l3ZhrzQCwU5Dlu5kBsJx828
         YSnKllNhpjofnWSS2NsOBmAYd/dwdyxZjlZDa6SWfuGLI5aJzLIoeQlm/dfNjGxjxUPx
         BWwbO8MO939kEnOl1lZ3Ja/wUkW4eRfFnOerz4kDDCnXMuaWfuAPQp59DNTYKNo7m+KZ
         uxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkY3EWeU1LTw6pYs6jsSn394Fmj6mNxxFmTZJ/r/6Fw=;
        b=x4riv5iDL+u6cbHAllJ4rA0PqjVirkuohP3RkV5ch/+KGK0j5W1M24NtMGiTOqVKPq
         1T0/0IFhomBhpSK6W8cCpaT8Cee5m4A1N90H7I2CyppqZhjVrsQrgiNyU7EIXi406ZQs
         nc+bfMPMc3jkBUZz2333M9FO/kFBNi3S3dVtX1TSJpz/VMsQ92GigyWWiRJZSuY2VJ/+
         kdb/N61/Vpt4ZMTWmg01/T8uracVKB6Hugm3C3SL+WGG3D4vk2QKf6wD53NFHkwrgArT
         YFau3KHgKW5wWmnq1Dorj8Sv2tvRS1i6sZQLU/WfaHoBULMQSdFM4iGkpD5nFLscgPtZ
         2X2w==
X-Gm-Message-State: AO0yUKW+JbJcYm4/Lkybu+GoU89Ni0UULTI+j4A0PFZgPZdQWjzmNosw
	VnRT29C2lDyA1AVG2adjaMc9gw==
X-Google-Smtp-Source: AK7set8M7BxMKnP4mtYD/neYgq9e6Glju769aNklpuCO9NlUl2b5JydTq5RVxsQQ5H/xwLFDM/rirQ==
X-Received: by 2002:a17:90b:1bc7:b0:225:a226:9fbb with SMTP id oa7-20020a17090b1bc700b00225a2269fbbmr4020988pjb.39.1675293178348;
        Wed, 01 Feb 2023 15:12:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 06/14] RISC-V: KVM: Modify SBI extension handler to return SBI error code
Date: Wed,  1 Feb 2023 15:12:42 -0800
Message-Id: <20230201231250.3806412-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_705580_9D601F57 
X-CRM114-Status: GOOD (  28.57  )
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

Currently, the SBI extension handle is expected to return Linux error code.
The top SBI layer converts the Linux error code to SBI specific error code
that can be returned to guest invoking the SBI calls. This model works
as long as SBI error codes have 1-to-1 mappings between them.
However, that may not be true always. This patch attempts to disassociate
both these error codes by allowing the SBI extension implementation to
return SBI specific error codes as well.

The extension will continue to return the Linux error specific code which
will indicate any problem *with* the extension emulation while the
SBI specific error will indicate the problem *of* the emulation.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 10 ++++-
 arch/riscv/kvm/vcpu_sbi.c             | 61 +++++++++++----------------
 arch/riscv/kvm/vcpu_sbi_base.c        | 36 +++++++---------
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 28 ++++++------
 arch/riscv/kvm/vcpu_sbi_replace.c     | 43 +++++++++----------
 arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++++----
 6 files changed, 90 insertions(+), 106 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 45ba341..8425556 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -18,6 +18,13 @@ struct kvm_vcpu_sbi_context {
 	int return_handled;
 };
 
+struct kvm_vcpu_sbi_return {
+	unsigned long out_val;
+	unsigned long err_val;
+	struct kvm_cpu_trap *utrap;
+	bool uexit;
+};
+
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
 	unsigned long extid_end;
@@ -27,8 +34,7 @@ struct kvm_vcpu_sbi_extension {
 	 * specific error codes.
 	 */
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
-		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
-		       bool *exit);
+		       struct kvm_vcpu_sbi_return *retdata);
 
 	/* Extension specific probe function */
 	unsigned long (*probe)(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index f96991d..fe2897e 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -12,26 +12,6 @@
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
-static int kvm_linux_err_map_sbi(int err)
-{
-	switch (err) {
-	case 0:
-		return SBI_SUCCESS;
-	case -EPERM:
-		return SBI_ERR_DENIED;
-	case -EINVAL:
-		return SBI_ERR_INVALID_PARAM;
-	case -EFAULT:
-		return SBI_ERR_INVALID_ADDRESS;
-	case -EOPNOTSUPP:
-		return SBI_ERR_NOT_SUPPORTED;
-	case -EALREADY:
-		return SBI_ERR_ALREADY_AVAILABLE;
-	default:
-		return SBI_ERR_FAILURE;
-	};
-}
-
 #ifndef CONFIG_RISCV_SBI_V01
 static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 	.extid_start = -1UL,
@@ -125,11 +105,14 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	int ret = 1;
 	bool next_sepc = true;
-	bool userspace_exit = false;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	const struct kvm_vcpu_sbi_extension *sbi_ext;
-	struct kvm_cpu_trap utrap = { 0 };
-	unsigned long out_val = 0;
+	struct kvm_cpu_trap utrap = {0};
+	struct kvm_vcpu_sbi_return sbi_ret = {
+		.out_val = 0,
+		.err_val = 0,
+		.utrap = &utrap,
+	};
 	bool ext_is_v01 = false;
 
 	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
@@ -139,42 +122,46 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		    cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
 			ext_is_v01 = true;
 #endif
-		ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
+		ret = sbi_ext->handler(vcpu, run, &sbi_ret);
 	} else {
 		/* Return error for unsupported SBI calls */
 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
 		goto ecall_done;
 	}
 
+	/*
+	 * When the SBI extension returns a Linux error code, it exits the ioctl
+	 * loop and forwards the error to userspace.
+	 */
+	if (ret < 0) {
+		next_sepc = false;
+		goto ecall_done;
+	}
+
 	/* Handle special error cases i.e trap, exit or userspace forward */
-	if (utrap.scause) {
+	if (sbi_ret.utrap->scause) {
 		/* No need to increment sepc or exit ioctl loop */
 		ret = 1;
-		utrap.sepc = cp->sepc;
-		kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+		sbi_ret.utrap->sepc = cp->sepc;
+		kvm_riscv_vcpu_trap_redirect(vcpu, sbi_ret.utrap);
 		next_sepc = false;
 		goto ecall_done;
 	}
 
 	/* Exit ioctl loop or Propagate the error code the guest */
-	if (userspace_exit) {
+	if (sbi_ret.uexit) {
 		next_sepc = false;
 		ret = 0;
 	} else {
-		/**
-		 * SBI extension handler always returns an Linux error code. Convert
-		 * it to the SBI specific error code that can be propagated the SBI
-		 * caller.
-		 */
-		ret = kvm_linux_err_map_sbi(ret);
-		cp->a0 = ret;
+		cp->a0 = sbi_ret.err_val;
 		ret = 1;
 	}
 ecall_done:
 	if (next_sepc)
 		cp->sepc += 4;
-	if (!ext_is_v01)
-		cp->a1 = out_val;
+	/* a1 should only be updated when we continue the ioctl loop */
+	if (!ext_is_v01 && ret == 1)
+		cp->a1 = sbi_ret.out_val;
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 846d518..69f4202 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -14,24 +14,22 @@
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *trap, bool *exit)
+				    struct kvm_vcpu_sbi_return *retdata)
 {
-	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
-		*out_val = (KVM_SBI_VERSION_MAJOR <<
+		retdata->out_val = (KVM_SBI_VERSION_MAJOR <<
 			    SBI_SPEC_VERSION_MAJOR_SHIFT) |
 			    KVM_SBI_VERSION_MINOR;
 		break;
 	case SBI_EXT_BASE_GET_IMP_ID:
-		*out_val = KVM_SBI_IMPID;
+		retdata->out_val = KVM_SBI_IMPID;
 		break;
 	case SBI_EXT_BASE_GET_IMP_VERSION:
-		*out_val = LINUX_VERSION_CODE;
+		retdata->out_val = LINUX_VERSION_CODE;
 		break;
 	case SBI_EXT_BASE_PROBE_EXT:
 		if ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
@@ -43,33 +41,33 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 * forward it to the userspace
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
-			*exit = true;
+			retdata->uexit = true;
 		} else {
 			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
 			if (sbi_ext) {
 				if (sbi_ext->probe)
-					*out_val = sbi_ext->probe(vcpu);
+					retdata->out_val = sbi_ext->probe(vcpu);
 				else
-					*out_val = 1;
+					retdata->out_val = 1;
 			} else
-				*out_val = 0;
+				retdata->out_val = 0;
 		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
-		*out_val = vcpu->arch.mvendorid;
+		retdata->out_val = vcpu->arch.mvendorid;
 		break;
 	case SBI_EXT_BASE_GET_MARCHID:
-		*out_val = vcpu->arch.marchid;
+		retdata->out_val = vcpu->arch.marchid;
 		break;
 	case SBI_EXT_BASE_GET_MIMPID:
-		*out_val = vcpu->arch.mimpid;
+		retdata->out_val = vcpu->arch.mimpid;
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
@@ -79,17 +77,15 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
 };
 
 static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
-					struct kvm_run *run,
-					unsigned long *out_val,
-					struct kvm_cpu_trap *utrap,
-					bool *exit)
+				       struct kvm_run *run,
+				       struct kvm_vcpu_sbi_return *retdata)
 {
 	/*
 	 * Both SBI experimental and vendor extensions are
 	 * unconditionally forwarded to userspace.
 	 */
 	kvm_riscv_vcpu_sbi_forward(vcpu, run);
-	*exit = true;
+	retdata->uexit = true;
 	return 0;
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 619ac0f..7dca0e9 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -21,9 +21,9 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
-		return -EINVAL;
+		return SBI_ERR_INVALID_PARAM;
 	if (!target_vcpu->arch.power_off)
-		return -EALREADY;
+		return SBI_ERR_ALREADY_AVAILABLE;
 
 	reset_cntx = &target_vcpu->arch.guest_reset_context;
 	/* start address */
@@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.power_off)
-		return -EACCES;
+		return SBI_ERR_FAILURE;
 
 	kvm_riscv_vcpu_power_off(vcpu);
 
@@ -57,7 +57,7 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
-		return -EINVAL;
+		return SBI_ERR_INVALID_PARAM;
 	if (!target_vcpu->arch.power_off)
 		return SBI_HSM_STATE_STARTED;
 	else if (vcpu->stat.generic.blocking)
@@ -67,9 +67,7 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 }
 
 static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				   unsigned long *out_val,
-				   struct kvm_cpu_trap *utrap,
-				   bool *exit)
+				   struct kvm_vcpu_sbi_return *retdata)
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
@@ -88,27 +86,29 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_HSM_HART_STATUS:
 		ret = kvm_sbi_hsm_vcpu_get_status(vcpu);
 		if (ret >= 0) {
-			*out_val = ret;
-			ret = 0;
+			retdata->out_val = ret;
+			retdata->err_val = 0;
 		}
-		break;
+		return 0;
 	case SBI_EXT_HSM_HART_SUSPEND:
 		switch (cp->a0) {
 		case SBI_HSM_SUSPEND_RET_DEFAULT:
 			kvm_riscv_vcpu_wfi(vcpu);
 			break;
 		case SBI_HSM_SUSPEND_NON_RET_DEFAULT:
-			ret = -EOPNOTSUPP;
+			ret = SBI_ERR_NOT_SUPPORTED;
 			break;
 		default:
-			ret = -EINVAL;
+			ret = SBI_ERR_INVALID_PARAM;
 		}
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		ret = SBI_ERR_NOT_SUPPORTED;
 	}
 
-	return ret;
+	retdata->err_val = ret;
+
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm = {
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 03a0198..38fa4c0 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -14,15 +14,15 @@
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *utrap, bool *exit)
+				    struct kvm_vcpu_sbi_return *retdata)
 {
-	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	u64 next_cycle;
 
-	if (cp->a6 != SBI_EXT_TIME_SET_TIMER)
-		return -EINVAL;
+	if (cp->a6 != SBI_EXT_TIME_SET_TIMER) {
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
 
 #if __riscv_xlen == 32
 	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
@@ -31,7 +31,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 	kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
@@ -41,8 +41,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
 };
 
 static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				   unsigned long *out_val,
-				   struct kvm_cpu_trap *utrap, bool *exit)
+				   struct kvm_vcpu_sbi_return *retdata)
 {
 	int ret = 0;
 	unsigned long i;
@@ -51,8 +50,10 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
 
-	if (cp->a6 != SBI_EXT_IPI_SEND_IPI)
-		return -EINVAL;
+	if (cp->a6 != SBI_EXT_IPI_SEND_IPI) {
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
 
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 		if (hbase != -1UL) {
@@ -76,10 +77,8 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi = {
 };
 
 static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				      unsigned long *out_val,
-				      struct kvm_cpu_trap *utrap, bool *exit)
+				      struct kvm_vcpu_sbi_return *retdata)
 {
-	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
@@ -116,10 +115,10 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		 */
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
@@ -130,14 +129,12 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
 
 static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
 				    struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *utrap, bool *exit)
+				    struct kvm_vcpu_sbi_return *retdata)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	unsigned long funcid = cp->a6;
 	u32 reason = cp->a1;
 	u32 type = cp->a0;
-	int ret = 0;
 
 	switch (funcid) {
 	case SBI_EXT_SRST_RESET:
@@ -146,24 +143,24 @@ static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
 			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
 						KVM_SYSTEM_EVENT_SHUTDOWN,
 						reason);
-			*exit = true;
+			retdata->uexit = true;
 			break;
 		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
 			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
 						KVM_SYSTEM_EVENT_RESET,
 						reason);
-			*exit = true;
+			retdata->uexit = true;
 			break;
 		default:
-			ret = -EOPNOTSUPP;
+			retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		}
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 489f225..0269e08 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -14,9 +14,7 @@
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				      unsigned long *out_val,
-				      struct kvm_cpu_trap *utrap,
-				      bool *exit)
+				   struct kvm_vcpu_sbi_return *retdata)
 {
 	ulong hmask;
 	int i, ret = 0;
@@ -33,7 +31,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		 * handled in kernel so we forward these to user-space
 		 */
 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		*exit = true;
+		retdata->uexit = true;
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
@@ -49,10 +47,10 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_0_1_SEND_IPI:
 		if (cp->a0)
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
+							   retdata->utrap);
 		else
 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
+		if (retdata->utrap->scause)
 			break;
 
 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
@@ -65,17 +63,17 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_0_1_SHUTDOWN:
 		kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
 						KVM_SYSTEM_EVENT_SHUTDOWN, 0);
-		*exit = true;
+		retdata->uexit = true;
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
 		if (cp->a0)
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
+							   retdata->utrap);
 		else
 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
+		if (retdata->utrap->scause)
 			break;
 
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
@@ -103,7 +101,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		break;
 	default:
-		ret = -EINVAL;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		break;
 	}
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
