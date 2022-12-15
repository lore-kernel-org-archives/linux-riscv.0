Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ABFC2D0CC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZHQgVShFaGaiECCar35NKqNMjDydSK17XQwCHJPfos=; b=TUs75dOsGyEJCz
	B3IGJH/deL05f+dGyIAem0Y6EQa1cVUKTUdad9neDZIxd/hk0Lt06YW1qoM9JbyNGWHhl9EaU1sXi
	XrHk0sP2MkMa08kAGGJGivGFKf/ALc5werhc0yy6j6TTDRBuqwIiXJtnCSxNx86ji2lfUeBFqQGgK
	hDlaeNCQmTxiAskqbyFPH41/HTngdzVP7q9uMCOhZctsD+Gf7F9EB3T2olYFbfxITnfxKWimFgLdC
	QpR1BhwYSnXrP6fBcPzArwjrnl1/zReTrko7C7S3AwKttUgctGmKcTXaIC9038ZpHS/Be9DfnyKBq
	rL3V8rLSbc4BKMDx0zZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rc3-00ARiJ-H3; Thu, 15 Dec 2022 17:01:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbh-00ARSz-B8
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so3278590pjm.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK2vEcQhA1P41OOuDWA8wE18vwUASQSBlysoDq+3PyI=;
        b=snqv/WonWiwp9a2UF+kYFlyI+9RfEelyIEXXq2QUejDT4iK/2gvR+P4QzSUzGrwoLW
         U09NeF9JnYDuWQG7HlBXwy6cwHMQi93ljRg10yLM8PtDLa8zaRuvjwIAtZY2eO6dhzak
         xwH3UyFdJaJ3DwgqaWZ8odB0efjvCok5Z23fX1tZF5Y9NFNGFN092130TPUn/OwcAuFE
         0doNxcQi9P1N5PiC1JHXcaf9i+rXrzivHHJOdl1hnDV3PYCw+O0QzlpMYjg4qJyZ0+eZ
         THwBLH2B/S8EM8S0hA3iXbkVElpLd+DABh7IdGY2CJn+iOi7eWZj9jijz1v/WGOh/u5T
         pBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dK2vEcQhA1P41OOuDWA8wE18vwUASQSBlysoDq+3PyI=;
        b=pnoBrAmjAyiPfzoZxka7QPvm30NiGXwXIxIVQdgpKzC+MWe7tQpRLC3pWYxOOwUwkP
         cvz5b9yuVMvp0dW7U/2NZrv2hafDUGBRpjznO3H3kigTP89iz7XReo6r0sknDifoWj7U
         e7JL67z2jT+baqEzBO2teFkbAWyQ/MdCqGygCogU43K7V/v9hKZ7f7uqRTEVbcK1JEKa
         64B8frmS33co/NoBJox2GcOsyokTEGW11bYMnC+y+lZUYTfpKkxg8vzSA1wwAvENJM0b
         cQctXsXl4SKWDCjVF55HGI/h6/+580xcWl6C0Znf3/hdOuHUkDM7QoG8P+PLI+avttFj
         mj2w==
X-Gm-Message-State: ANoB5pmCWaD8Ggn8ug4Y8w5pc9pGcNTm74J3OpZliGawd0OQgPdyzBJF
	6U2PJgRxAmYGc2OjXRIxuL1v3Q==
X-Google-Smtp-Source: AA0mqf59SsJ5z06BF09x6JVPv+MacXlUBwMjwNQ3lvgAr2Q+gDmKBNPukBOrMS6IiygnVLpdouz44A==
X-Received: by 2002:a17:902:8548:b0:18c:fd25:a934 with SMTP id d8-20020a170902854800b0018cfd25a934mr25842768plo.61.1671123676827;
        Thu, 15 Dec 2022 09:01:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 04/11] RISC-V: KVM: Modify SBI extension handler to return SBI error code
Date: Thu, 15 Dec 2022 09:00:39 -0800
Message-Id: <20221215170046.2010255-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090117_423685_EF41EF91 
X-CRM114-Status: GOOD (  26.12  )
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
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 10 ++++--
 arch/riscv/kvm/vcpu_sbi.c             | 45 ++++++++-------------------
 arch/riscv/kvm/vcpu_sbi_base.c        | 38 +++++++++++-----------
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 22 +++++++------
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++-------------
 5 files changed, 74 insertions(+), 85 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 61dac1b..fee9253 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -18,6 +18,12 @@ struct kvm_vcpu_sbi_context {
 	int return_handled;
 };
 
+struct kvm_vcpu_sbi_ext_data {
+	unsigned long out_val;
+	unsigned long err_val;
+	bool uexit;
+};
+
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
 	unsigned long extid_end;
@@ -27,8 +33,8 @@ struct kvm_vcpu_sbi_extension {
 	 * specific error codes.
 	 */
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
-		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
-		       bool *exit);
+		       struct kvm_vcpu_sbi_ext_data *edata,
+		       struct kvm_cpu_trap *utrap);
 
 	/* Extension specific probe function */
 	unsigned long (*probe)(struct kvm_vcpu *vcpu, unsigned long extid);
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index f96991d..50c5472 100644
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
@@ -125,11 +105,10 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	int ret = 1;
 	bool next_sepc = true;
-	bool userspace_exit = false;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	const struct kvm_vcpu_sbi_extension *sbi_ext;
 	struct kvm_cpu_trap utrap = { 0 };
-	unsigned long out_val = 0;
+	struct kvm_vcpu_sbi_ext_data edata_out = { 0 };
 	bool ext_is_v01 = false;
 
 	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
@@ -139,7 +118,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		    cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
 			ext_is_v01 = true;
 #endif
-		ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
+		ret = sbi_ext->handler(vcpu, run, &edata_out, &utrap);
 	} else {
 		/* Return error for unsupported SBI calls */
 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
@@ -156,25 +135,27 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		goto ecall_done;
 	}
 
+	/* The SBI extension returns Linux error code. Exits the ioctl loop
+	 * and forwards the error to the userspace.
+	 */
+	if (ret < 0) {
+		next_sepc = false;
+		goto ecall_done;
+	}
+
 	/* Exit ioctl loop or Propagate the error code the guest */
-	if (userspace_exit) {
+	if (edata_out.uexit) {
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
+		cp->a0 = edata_out.err_val;
 		ret = 1;
 	}
 ecall_done:
 	if (next_sepc)
 		cp->sepc += 4;
 	if (!ext_is_v01)
-		cp->a1 = out_val;
+		cp->a1 = edata_out.out_val;
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 89e2415..487828d 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -14,24 +14,23 @@
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *trap, bool *exit)
+				    struct kvm_vcpu_sbi_ext_data *edata,
+				    struct kvm_cpu_trap *trap)
 {
-	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
-		*out_val = (KVM_SBI_VERSION_MAJOR <<
+		edata->out_val = (KVM_SBI_VERSION_MAJOR <<
 			    SBI_SPEC_VERSION_MAJOR_SHIFT) |
 			    KVM_SBI_VERSION_MINOR;
 		break;
 	case SBI_EXT_BASE_GET_IMP_ID:
-		*out_val = KVM_SBI_IMPID;
+		edata->out_val = KVM_SBI_IMPID;
 		break;
 	case SBI_EXT_BASE_GET_IMP_VERSION:
-		*out_val = LINUX_VERSION_CODE;
+		edata->out_val = LINUX_VERSION_CODE;
 		break;
 	case SBI_EXT_BASE_PROBE_EXT:
 		if ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
@@ -43,33 +42,33 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 * forward it to the userspace
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
-			*exit = true;
+			edata->uexit = true;
 		} else {
 			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
 			if (sbi_ext) {
 				if (sbi_ext->probe)
-					*out_val = sbi_ext->probe(vcpu, cp->a0);
+					edata->out_val = sbi_ext->probe(vcpu, cp->a0);
 				else
-					*out_val = 1;
+					edata->out_val = 1;
 			} else
-				*out_val = 0;
+				edata->out_val = 0;
 		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
-		*out_val = vcpu->arch.mvendorid;
+		edata->out_val = vcpu->arch.mvendorid;
 		break;
 	case SBI_EXT_BASE_GET_MARCHID:
-		*out_val = vcpu->arch.marchid;
+		edata->out_val = vcpu->arch.marchid;
 		break;
 	case SBI_EXT_BASE_GET_MIMPID:
-		*out_val = vcpu->arch.mimpid;
+		edata->out_val = vcpu->arch.mimpid;
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		edata->err_val = SBI_ERR_NOT_SUPPORTED;
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
@@ -79,17 +78,16 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
 };
 
 static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
-					struct kvm_run *run,
-					unsigned long *out_val,
-					struct kvm_cpu_trap *utrap,
-					bool *exit)
+				       struct kvm_run *run,
+				       struct kvm_vcpu_sbi_ext_data *edata,
+				       struct kvm_cpu_trap *utrap)
 {
 	/*
 	 * Both SBI experimental and vendor extensions are
 	 * unconditionally forwarded to userspace.
 	 */
 	kvm_riscv_vcpu_sbi_forward(vcpu, run);
-	*exit = true;
+	edata->uexit = true;
 	return 0;
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 0f8d9fe..4188f21 100644
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
-		return -EPERM;
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
@@ -66,10 +66,10 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 		return SBI_HSM_STATE_STOPPED;
 }
 
+
 static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				   unsigned long *out_val,
-				   struct kvm_cpu_trap *utrap,
-				   bool *exit)
+				   struct kvm_vcpu_sbi_ext_data *edata,
+				   struct kvm_cpu_trap *utrap)
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
@@ -88,8 +88,8 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_HSM_HART_STATUS:
 		ret = kvm_sbi_hsm_vcpu_get_status(vcpu);
 		if (ret >= 0) {
-			*out_val = ret;
-			ret = 0;
+			edata->out_val = ret;
+			edata->err_val = 0;
 		}
 		break;
 	case SBI_EXT_HSM_HART_SUSPEND:
@@ -108,7 +108,9 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = -EOPNOTSUPP;
 	}
 
-	return ret;
+	edata->err_val = ret;
+
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm = {
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 03a0198..d029136 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -14,15 +14,17 @@
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *utrap, bool *exit)
+				    struct kvm_vcpu_sbi_ext_data *edata,
+				    struct kvm_cpu_trap *utrap)
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	u64 next_cycle;
 
-	if (cp->a6 != SBI_EXT_TIME_SET_TIMER)
-		return -EINVAL;
+	if (cp->a6 != SBI_EXT_TIME_SET_TIMER) {
+		edata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
 
 #if __riscv_xlen == 32
 	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
@@ -41,8 +43,8 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
 };
 
 static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				   unsigned long *out_val,
-				   struct kvm_cpu_trap *utrap, bool *exit)
+				   struct kvm_vcpu_sbi_ext_data *edata,
+				   struct kvm_cpu_trap *utrap)
 {
 	int ret = 0;
 	unsigned long i;
@@ -51,8 +53,10 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
 
-	if (cp->a6 != SBI_EXT_IPI_SEND_IPI)
-		return -EINVAL;
+	if (cp->a6 != SBI_EXT_IPI_SEND_IPI) {
+		edata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
 
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 		if (hbase != -1UL) {
@@ -76,10 +80,9 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi = {
 };
 
 static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				      unsigned long *out_val,
-				      struct kvm_cpu_trap *utrap, bool *exit)
+				      struct kvm_vcpu_sbi_ext_data *edata,
+				      struct kvm_cpu_trap *utrap)
 {
-	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
@@ -116,10 +119,10 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		 */
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		edata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
@@ -130,14 +133,13 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
 
 static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
 				    struct kvm_run *run,
-				    unsigned long *out_val,
-				    struct kvm_cpu_trap *utrap, bool *exit)
+				    struct kvm_vcpu_sbi_ext_data *edata,
+				    struct kvm_cpu_trap *utrap)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	unsigned long funcid = cp->a6;
 	u32 reason = cp->a1;
 	u32 type = cp->a0;
-	int ret = 0;
 
 	switch (funcid) {
 	case SBI_EXT_SRST_RESET:
@@ -146,24 +148,24 @@ static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
 			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
 						KVM_SYSTEM_EVENT_SHUTDOWN,
 						reason);
-			*exit = true;
+			edata->uexit = true;
 			break;
 		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
 			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
 						KVM_SYSTEM_EVENT_RESET,
 						reason);
-			*exit = true;
+			edata->uexit = true;
 			break;
 		default:
-			ret = -EOPNOTSUPP;
+			edata->err_val = SBI_ERR_NOT_SUPPORTED;
 		}
 		break;
 	default:
-		ret = -EOPNOTSUPP;
+		edata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
 
-	return ret;
+	return 0;
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
