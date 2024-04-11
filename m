Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B938CD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSersxwhOdveYL10mm64njVnW9y7BbDvWbN3WedZ50s=; b=sfLotXmaMXXSz3
	fg2q65AfRjC9c3yLivY5+Bh712efy2s45Z9zH0+ATv61r6rv1HMrMPg0PbBF/5T2StJGfJNG2nKNn
	4Km3u09lIEEulqY3IW+mzh/DLqaEL2gSRuV4EOwF2mlWGoWl41EMz2BVawU1e2gWDscQfdvDdfFDr
	qkRs/u+N4tQH24qPkFxtbriOjgndC1zqJJck85RRmECFUX1NJmGzy2kkcTJ9j/j7qPXstYQmfqr8L
	o2TYgATGbxupjVDXKUDLIOzdFT9tZVg/XhSqAhQHCIgL5qyRpHi3Ux11wPj2kcvhYND2vvQFtiYyB
	AIsoyDNyBRwMsUIN01dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOf-0000000BF6o-07Im;
	Thu, 11 Apr 2024 09:07:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOa-0000000BEzY-0zLR
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:07:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so454465b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712826413; x=1713431213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo8k+jtku3GLugoqX/2jDzvY4YtbrVgAtt9TNzdVCZA=;
        b=HflkoXsKcmGJiCdDifj4QK1L2/G4nNCFI7tmyPVNuVJ7zW7Nz1PLYMkG4/X2c5ttZF
         eiVMhr5cv1+I1HszNFwEKSgzu1WO1pegTZ/3Ru8VY+4hnvpYkN0BtpUyvCQ6ybTBDahs
         N+34Dzp6I2NVIoH19Y2/1CospTsexVpE4e8RBoh3C+kwb6MDi7JtNlBG7j1Bzq+TDeHt
         fCKAAFbl9jGyq6EGMszwai8+I+NewsYP3lrbHG/O5ylbPPeAOI74cd80MgsK5HB/BfqK
         oFU/zNEer+KzA5bLv6kKTaENwtPrd/KFAKEMPB7e1PU6bIqbHqnHixNxEWGzpnNyHoRE
         UkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826413; x=1713431213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo8k+jtku3GLugoqX/2jDzvY4YtbrVgAtt9TNzdVCZA=;
        b=AACALXI801lQ1ExUP2iTBqkXCGXp3VM2T+dRMh/ZfeNfZ6J5egChPBnf9YXarGxfF/
         zk32yKbvltWMg7iSJqphoxCwpt8KmR6vFiRYySePDZwqaO1Rg1A6bDqxpVTbzxrgGjTl
         IQDU0m0xVX2JUjIe7/ML1zKS5/2HAn5H4brrL571F1WJU1lztYRTefKVj4pvPzF7AMWE
         RUbzCf1nALvNxpuJ8gycLWBQerFSf7/M5SiZNs5C94ikC45ixn6OTOFC8C1kseVlWQOF
         LP1z8X/6QqgpeQwBmVMwq3tlx8+h6e+ujl3ZLt1w/vHpvEmnAONEIjeCXweRPnhg0lem
         s3CA==
X-Forwarded-Encrypted: i=1; AJvYcCUfAlZ+xqG2PbaVKX4O0HzzciGJBuCJNvog5QcXZLZT4NTevMD1tasXKdFBtkh2qJ7qSGj1KQ6LM/J5DEDsIB9n4WSxX9E2rx3J2166CsSr
X-Gm-Message-State: AOJu0Yz1vBoqoN4LQF8veCJhNBe4EVAPlh7bo8jDqNBJDxCBvFFvZQL6
	QhbPZhhlNDtaKJS7quHF9GgpRoFqfO+MNlA7Bn7lX91/tq9E3sKW6tSbT3OqxgI=
X-Google-Smtp-Source: AGHT+IGZP6juHrol3fKL1x66YwON+Qtfij0V69IuBhzViScGhPXqaDbsuXNlmAWPVoD/pCLNE2ePRg==
X-Received: by 2002:a05:6a00:10c7:b0:6ed:825b:30c0 with SMTP id d7-20020a056a0010c700b006ed825b30c0mr2579203pfu.15.1712826412404;
        Thu, 11 Apr 2024 02:06:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.118])
        by smtp.gmail.com with ESMTPSA id e21-20020aa78c55000000b006e729dd12d5sm816738pfd.48.2024.04.11.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:06:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
Date: Thu, 11 Apr 2024 14:36:38 +0530
Message-Id: <20240411090639.237119-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
References: <20240411090639.237119-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_020700_453754_82922750 
X-CRM114-Status: GOOD (  11.58  )
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

We have common APLIC and IMSIC headers available under
include/linux/irqchip/ directory which are used by APLIC
and IMSIC irqchip drivers. Let us replace the use of
kvm_aia_*.h headers with include/linux/irqchip/riscv-*.h
headers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia_aplic.h | 58 --------------------------
 arch/riscv/include/asm/kvm_aia_imsic.h | 38 -----------------
 arch/riscv/kvm/aia.c                   |  2 +-
 arch/riscv/kvm/aia_aplic.c             |  2 +-
 arch/riscv/kvm/aia_device.c            |  2 +-
 arch/riscv/kvm/aia_imsic.c             |  2 +-
 6 files changed, 4 insertions(+), 100 deletions(-)
 delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h

diff --git a/arch/riscv/include/asm/kvm_aia_aplic.h b/arch/riscv/include/asm/kvm_aia_aplic.h
deleted file mode 100644
index 6dd1a4809ec1..000000000000
--- a/arch/riscv/include/asm/kvm_aia_aplic.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2021 Western Digital Corporation or its affiliates.
- * Copyright (C) 2022 Ventana Micro Systems Inc.
- */
-#ifndef __KVM_RISCV_AIA_IMSIC_H
-#define __KVM_RISCV_AIA_IMSIC_H
-
-#include <linux/bitops.h>
-
-#define APLIC_MAX_IDC			BIT(14)
-#define APLIC_MAX_SOURCE		1024
-
-#define APLIC_DOMAINCFG			0x0000
-#define APLIC_DOMAINCFG_RDONLY		0x80000000
-#define APLIC_DOMAINCFG_IE		BIT(8)
-#define APLIC_DOMAINCFG_DM		BIT(2)
-#define APLIC_DOMAINCFG_BE		BIT(0)
-
-#define APLIC_SOURCECFG_BASE		0x0004
-#define APLIC_SOURCECFG_D		BIT(10)
-#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
-#define APLIC_SOURCECFG_SM_MASK	0x00000007
-#define APLIC_SOURCECFG_SM_INACTIVE	0x0
-#define APLIC_SOURCECFG_SM_DETACH	0x1
-#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
-#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
-#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
-#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
-
-#define APLIC_IRQBITS_PER_REG		32
-
-#define APLIC_SETIP_BASE		0x1c00
-#define APLIC_SETIPNUM			0x1cdc
-
-#define APLIC_CLRIP_BASE		0x1d00
-#define APLIC_CLRIPNUM			0x1ddc
-
-#define APLIC_SETIE_BASE		0x1e00
-#define APLIC_SETIENUM			0x1edc
-
-#define APLIC_CLRIE_BASE		0x1f00
-#define APLIC_CLRIENUM			0x1fdc
-
-#define APLIC_SETIPNUM_LE		0x2000
-#define APLIC_SETIPNUM_BE		0x2004
-
-#define APLIC_GENMSI			0x3000
-
-#define APLIC_TARGET_BASE		0x3004
-#define APLIC_TARGET_HART_IDX_SHIFT	18
-#define APLIC_TARGET_HART_IDX_MASK	0x3fff
-#define APLIC_TARGET_GUEST_IDX_SHIFT	12
-#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
-#define APLIC_TARGET_IPRIO_MASK	0xff
-#define APLIC_TARGET_EIID_MASK	0x7ff
-
-#endif
diff --git a/arch/riscv/include/asm/kvm_aia_imsic.h b/arch/riscv/include/asm/kvm_aia_imsic.h
deleted file mode 100644
index da5881d2bde0..000000000000
--- a/arch/riscv/include/asm/kvm_aia_imsic.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2021 Western Digital Corporation or its affiliates.
- * Copyright (C) 2022 Ventana Micro Systems Inc.
- */
-#ifndef __KVM_RISCV_AIA_IMSIC_H
-#define __KVM_RISCV_AIA_IMSIC_H
-
-#include <linux/types.h>
-#include <asm/csr.h>
-
-#define IMSIC_MMIO_PAGE_SHIFT		12
-#define IMSIC_MMIO_PAGE_SZ		(1UL << IMSIC_MMIO_PAGE_SHIFT)
-#define IMSIC_MMIO_PAGE_LE		0x00
-#define IMSIC_MMIO_PAGE_BE		0x04
-
-#define IMSIC_MIN_ID			63
-#define IMSIC_MAX_ID			2048
-
-#define IMSIC_EIDELIVERY		0x70
-
-#define IMSIC_EITHRESHOLD		0x72
-
-#define IMSIC_EIP0			0x80
-#define IMSIC_EIP63			0xbf
-#define IMSIC_EIPx_BITS			32
-
-#define IMSIC_EIE0			0xc0
-#define IMSIC_EIE63			0xff
-#define IMSIC_EIEx_BITS			32
-
-#define IMSIC_FIRST			IMSIC_EIDELIVERY
-#define IMSIC_LAST			IMSIC_EIE63
-
-#define IMSIC_MMIO_SETIPNUM_LE		0x00
-#define IMSIC_MMIO_SETIPNUM_BE		0x04
-
-#endif
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a944294f6f23..8ea51a791371 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -10,12 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/bitops.h>
 #include <linux/irq.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
 #include <linux/kvm_host.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/cpufeature.h>
-#include <asm/kvm_aia_imsic.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index b467ba5ed910..da6ff1bade0d 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -7,12 +7,12 @@
  *	Anup Patel <apatel@ventanamicro.com>
  */
 
+#include <linux/irqchip/riscv-aplic.h>
 #include <linux/kvm_host.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
-#include <asm/kvm_aia_aplic.h>
 
 struct aplic_irq {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 0eb689351b7d..308b3bbede33 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -8,9 +8,9 @@
  */
 
 #include <linux/bits.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
-#include <asm/kvm_aia_imsic.h>
 
 static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
 {
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e808723a85f1..0a1e859323b4 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -9,13 +9,13 @@
 
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
-#include <asm/kvm_aia_imsic.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
