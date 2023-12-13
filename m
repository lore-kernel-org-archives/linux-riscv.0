Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D29AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUGRejn4vNXzCc36GZQRFmiT3Kr/d43UgoZp6dgVeW0=; b=RFR3jABVjf++6m
	9gwUeK+VVHxEG33t4XAb8RpMsEbsDKZwRuEBrfIIck1zlkOLb82xJFuAxfdfLSMwr5uFpESpkJ/31
	OPReOOiSJgpc/uT2XmLmr2USpHyf/PEakqrz/CjINvoV7FSGu7tgGjfMC2vg10VZE6fkbboDJv/qB
	wvbTiHaDKwDaMw/RzdlDjRUXSX/PRHx+mjZjyKZYdIdu/WBOdeZSCGDgdJBh55MqzaQ7DT6RueWt7
	tv+D3WKncyGhyq9HtEQ9QBw6vux6pJVxxs6bNFi4obzXMcrV5rX4f8uww2/qIafnvlM7QdFGRYjId
	PANO4H854pumd7Au06QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkJ-00FY49-0B;
	Wed, 13 Dec 2023 17:10:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkE-00FXyL-2l
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:10:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c2308faedso73604945e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487398; x=1703092198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNRAv65UYhdtMb5DSSQT6+9OSsILt03cd0EnmIoYr4c=;
        b=h01AFgjdotYB8xNADRZdynSbyJy//HsOFPle93y5Bdb0nE2NtGcdMZ0G6JTieQdT6e
         prbR1HUm5VY27+x9LHGZerXZVI55PUrDh5257XLJ7T73JnH6eDYINZqG2XcBS1ZyaJGS
         LRh4G4uAUP05B1f0wpHEbBjrAGhn7j5tLQ1qM8wOULnIMjbBjBsn6efKOrX3S52CIV2E
         wH2m+ccW03rp6Lq38WdHN1XnEnZsWEvm/NUQZkICD0CC3P409EnbYTr5/vKs0VyVqHQx
         wglJ+F02GCu24hki/HHmFEcJRVmw1vPtA6YzpyUFQAV8IlB/z9YUCuDBY1x4p/S9RQGg
         +weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487398; x=1703092198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNRAv65UYhdtMb5DSSQT6+9OSsILt03cd0EnmIoYr4c=;
        b=UMRrJw3CjfA/L2k4aAIXi86lm7rEd4/dG0hpzZlKSlqgSk33jrTpovJKyNmujppZr7
         7UHB+QorsgD7f4dAkHub4zvvf5tODL0AkjNasanXn0Vkk77Ai2IirALDW/FdyM4V0uTw
         mUraBzeBhkyrHr8D9f/n252OsLUVRWUtzcwEpSrGiRD9Rw6Rz7cBUCACFBplMpbBS/kU
         Emyh3ckDXboEsLS1g42WstWiCEuvuT2vd/QPNEeHpZ9yqcvzbGs0zSRl21JAh0Xa7YUP
         iRNA6pSZtjl6QtPc0da2CakubO7XcZMiH6RkzKUbAbHcOtSVvkXDWn7TDVcUQD2tvyOV
         Qx3g==
X-Gm-Message-State: AOJu0Yyqmz80WIugWLVs5pTco39lTad69fIcZuukcxVZfh3FxvIzmf2Y
	lG8ojqrFybiYr2ySpwLM4P7Pcw==
X-Google-Smtp-Source: AGHT+IHUxdxU7j3tqi/YnelaxrAWAOV06AkZmubPrGcb1VaXfu4n7+6V6pt4SIWBEicpk8hbhD3pNA==
X-Received: by 2002:a05:600c:2147:b0:40c:1d29:fc5b with SMTP id v7-20020a05600c214700b0040c1d29fc5bmr4286155wml.81.1702487398088;
        Wed, 13 Dec 2023 09:09:58 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fj5-20020a05600c0c8500b0040b2976eb02sm21482264wmb.10.2023.12.13.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:09:57 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 4/6] KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
Date: Wed, 13 Dec 2023 18:09:56 +0100
Message-ID: <20231213170951.93453-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091002_944685_FE2BE531 
X-CRM114-Status: GOOD (  10.51  )
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

While adding RISCV_SBI_EXT_REG(), acknowledge that some registers
have subtypes and extend __kvm_reg_id() to take a subtype field.
Then, update all macros to set the new field appropriately. The
general CSR macro gets renamed to include "GENERAL", but the other
macros, like the new RISCV_SBI_EXT_REG, just use the SINGLE subtype.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 40 +++++++++++--------
 .../selftests/kvm/lib/riscv/processor.c       |  4 +-
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5b62a3d2aa9b..e70ccda2011b 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -10,10 +10,10 @@
 #include "kvm_util.h"
 #include <linux/stringify.h>
 
-static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
-				    uint64_t  size)
+static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
+				    uint64_t idx, uint64_t size)
 {
-	return KVM_REG_RISCV | type | idx | size;
+	return KVM_REG_RISCV | type | subtype | idx | size;
 }
 
 #if __riscv_xlen == 64
@@ -22,24 +22,30 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
-					     KVM_REG_RISCV_CONFIG_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_CONFIG_REG(name)		__kvm_reg_id(KVM_REG_RISCV_CONFIG, 0,		\
+						     KVM_REG_RISCV_CONFIG_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
-					     KVM_REG_RISCV_CORE_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_CORE_REG(name)		__kvm_reg_id(KVM_REG_RISCV_CORE, 0,		\
+						     KVM_REG_RISCV_CORE_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
-					     KVM_REG_RISCV_CSR_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_GENERAL_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR,			\
+						     KVM_REG_RISCV_CSR_GENERAL,		\
+						     KVM_REG_RISCV_CSR_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
-					     KVM_REG_RISCV_TIMER_REG(name), \
-					     KVM_REG_SIZE_U64)
+#define RISCV_TIMER_REG(name)		__kvm_reg_id(KVM_REG_RISCV_TIMER, 0,		\
+						     KVM_REG_RISCV_TIMER_REG(name),	\
+						     KVM_REG_SIZE_U64)
 
-#define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
-					     idx, KVM_REG_SIZE_ULONG)
+#define RISCV_ISA_EXT_REG(idx)		__kvm_reg_id(KVM_REG_RISCV_ISA_EXT,		\
+						     KVM_REG_RISCV_ISA_SINGLE,		\
+						     idx, KVM_REG_SIZE_ULONG)
+
+#define RISCV_SBI_EXT_REG(idx)		__kvm_reg_id(KVM_REG_RISCV_SBI_EXT,		\
+						     KVM_REG_RISCV_SBI_SINGLE,		\
+						     idx, KVM_REG_SIZE_ULONG)
 
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..6c25f7843ef4 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -201,7 +201,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 	satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
 	satp |= SATP_MODE_48;
 
-	vcpu_set_reg(vcpu, RISCV_CSR_REG(satp), satp);
+	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
 }
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, uint8_t indent)
@@ -315,7 +315,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
 
 	/* Setup default exception vector of guest */
-	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
+	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
 
 	return vcpu;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
