Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE7EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 18:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUGRejn4vNXzCc36GZQRFmiT3Kr/d43UgoZp6dgVeW0=; b=GuifUFfuuFr3nX
	Rx6gzqPwcZW7qsNr4BHNCqkh2bnTMRd+KT1D7XJabo2qpW1LadoeAPhf5rnUlrkDgkmwMJez4kz/v
	4AnyTvdTv7PZENk85QTA/+YaZAVUXbVykWBLo7Grls94vWwgn0fwSBnzCqYMnLkEsQTD9BXuuNw1t
	I6f73wYD9tRlN7alAi7NF5dwVMhF/phftwdgpA8a1OgNLz3WyyPz//K2oZjYo6N8CGUBbVthtZ0bO
	Z8SI0D+9DJL3Dhw8TCHlnHwIAVp9bLxW2atl+dTO2xO/1VnPDx9wXai6zxOhKqMAAUbpAtu+EZUIw
	lz7pfjPdombp4ZTCTUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mCM-00Bfz5-2R;
	Thu, 30 Nov 2023 18:55:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mCK-00Bfx7-02
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 18:55:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bc743c7f7so1734363e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 10:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701370536; x=1701975336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNRAv65UYhdtMb5DSSQT6+9OSsILt03cd0EnmIoYr4c=;
        b=iHWwwY+5OlE+nDlJ93f1FX5Fsiv0sttcJoMoJayPIh9ILCPrUTUYBtx1E/z1YAX29I
         sptA/fkZu9Jdl6UpE7EZmKg9ya0NwcCFZhHiT3mHOIlVYeTWF8AWDciuRz/zjp0A+YVk
         V17jxPkP9vvvCXKMY+dY+M8SYldBrAG4b3C9Rjt9+cGVkA3MuoCVxqv/D+ex20lSsoDY
         /jxdw8R0eDDRPLI0MuJExCIN6IDar7+ZXrJMhNdCKy+A6cJD/TE9iYzvdRSm1k650xwV
         YQKlbem51B6RIEtz33BRzy68gY74703YboBd18XPYyHnYV8OaoNRGaL5fg7gjEWHFQfd
         VnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701370536; x=1701975336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNRAv65UYhdtMb5DSSQT6+9OSsILt03cd0EnmIoYr4c=;
        b=OfG3ekyfeXHKo4n8oQa2ig8reafeNPt6RNga2JuVvL+FFXeFQ6h6gd5TyyC4VCPaFz
         +chPuu2IgKHOCrCYIssvzZG5P4rbUA+myINRfyxBvrJprq40xCJvhShHMEX/u6+aKPBD
         j6L5t4g/dmZxRe09A1nX6h6b5/unwoVeWQlf9k9lE1hrrzdFuYQBUMBYUhP5aU1Bc17s
         C5gVk45fqyAczwwpOKvBwMXk96Z8z30ZT7SCwIw2Fh4fglsvOZHs94ACD3hTLKhdbAuN
         XzJ+hfxL7WYAfIBUkZwubdU59SRNA14ErMIJIsvFv8frwrZFwlLEJzuwBafAgvBJgVg8
         ageg==
X-Gm-Message-State: AOJu0YxNP4qrEE/g29XlnvfydQ+dc3VyMbDIzEvdiwIyEPJv/ELH5PIk
	YE+Fc//Ia6fBbMtPeJvKlc9ejncBV1WqHFsFhDg=
X-Google-Smtp-Source: AGHT+IHNy7LvxaEPQcHkfAtoZ0LyUJnp8NvxDl0nm5+OPhZ8S2LNpSc33+rVX89N9BrVaaKxyWf0iQ==
X-Received: by 2002:a50:c08a:0:b0:54b:1530:df8 with SMTP id k10-20020a50c08a000000b0054b15300df8mr238edf.22.1701369541010;
        Thu, 30 Nov 2023 10:39:01 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k12-20020a05640212cc00b0054bbd297de0sm813619edx.4.2023.11.30.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:39:00 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 4/6] KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
Date: Thu, 30 Nov 2023 19:39:00 +0100
Message-ID: <20231130183859.55829-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_105540_045183_3B4F881F 
X-CRM114-Status: GOOD (  11.00  )
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
