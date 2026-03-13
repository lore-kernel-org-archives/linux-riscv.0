Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A78D106FD9F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgnBfTKU5Nz+YBaaX063t0EopXrmltjJ4rmYKApyLYA=; b=vk1p0yd3Vm1ffn
	NEnLxd+PIafZvDKCEmFOqh6adNpe9jfCPVS2XBiGyMixp40RKlnJSbgNFoNCRxZQRdZNXT+wrHGaR
	j+UlgnxTVSzxKwQRCniXrjvzWwIZVPt7ihyqZwWN0FbSNBHsuDJjeEcsgQZBszd6GNzcrLwX4ObEM
	Kh/ac8HYFg/8W8vc4DTdUu1n/6ReilJQTCOcfLImbuvQN7x0HlMC5TpqNv8fnmhUm7Pscpv8yk68y
	NyT/Im/Vtwn6fFxgSYHmFKM+9JZyQE07Y+EBryYcepImivmOzjlR/2aG2bss50LCIyLsqx03vRdVP
	7CSxutgtfbPJh7Lc+s3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yA9-0000000HIkk-1r68;
	Fri, 13 Mar 2026 08:46:30 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yA6-0000000HIjv-42uB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:28 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso34253076d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391585; x=1773996385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBaSA4PPgKGdLClMsOczDD6vsUzPlduQ3XSws58AOJE=;
        b=WuaOuzAhNWkar3AvFAq1elwSxhWrCqM54A7geAd+2JswXjOVFtMoy2ALwiebNA1DTu
         Wlz/aAUNfihjsvkQRFiuCbGWBH7l9nQAuO0NSkC8KsBNxKKkaMwXqzQL0YN4mjs8gVhh
         Y5DiimTVvIG0McMKcoyvZWepFSNlrgH7x6ybUo9XcUpTtQsLewWUW60mxAjiPYXamPck
         DorjslSgQytbzOQWvqGen18Dvft2sqoULTOX1U6HtK3kq9fap14o0wIArkcJX/MpMn3x
         T1RxAlzwxJqmgZX8rdQmq2U0yEITF2A8bki8lYA+8vc4/7NR2VlUrEzxN2ipbG6/JN0Y
         Hilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391585; x=1773996385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBaSA4PPgKGdLClMsOczDD6vsUzPlduQ3XSws58AOJE=;
        b=jnkeSuYtELLL6eD/hZRJ0qDtt4hAgwC8jz9j/ucrdgIMmFUBfIgM9goZzKmEUP0p/h
         53oc0UhzB0uHlBvoyMxjyKMfy1nNy7rUBl1GDDoVOGpiAi9mgEBhcJ6nB2V2wVmIiV0c
         2ynoXnpbbSTMFsoGYu2y7VAZTA2HHa3NlnaPqkVgwYTJkl0V9wurNZg2eNLXTxjDFIGu
         /wYegw4PNGz1PdBU8j/xdt7K/50+LBLJ9NgB7/ScUGL/VF5d45pGIAnN65dZEqqKL17/
         rmsskYGB5V548+YH0oU37+oVvkzxC90fJqMSX55AU0TsAPHu0/gnuGjfUTgzJFrwfEYR
         wgPw==
X-Gm-Message-State: AOJu0YwH+NtETqWxRtralP1UJbr939LhL7KafI6skRS3IkGFSYQm79U4
	E3YW/erkv6tBswFogefW4ejaBgrp2mDeN4OdyhFhV1kP4xPtKmv8ZGqIjwoKRBiL
X-Gm-Gg: ATEYQzwBv5VRGvrciXwIQD2mqP9j33zKSWSmAr+mlV7IZgwheG25X5eH04EgzryxLWK
	ZRQG7mg44qg/WyNUaf2Jp4lwHiTpbYcBmM4z3sZziv5CN9nKOscsJb7AoLU9xucr0P27arceF1U
	mDAKEHOh2Q09cqGPMcD+2XwCdySdY2twtRU8P9AYE23Wk5SBBoHjj7N+N71nLXDEKMMaZRTMDWz
	gffazLSzdW8O1GALfeEHnejTHO0CZNvQWELOV/leFqj5+lHrmr1TXpIGXXPOOm8PMhGvyjrMUrc
	aXUPYazqhUpOSFoG8j39e2PUgMvKb6uGhIbz//a1OWqOFMLizK7dneznU/23eT046rfKMjyIj9r
	Co85ArjV4lW/x4k7BTFoo1B5iMcjjHyhU9VXYPIX8PscodHXwcRxnTW28yLTKXHmAFiwxNomLSS
	+b45hOHadEAwYGy1pG5HBZzC3P
X-Received: by 2002:a05:6214:27ca:b0:89a:2fe7:91cd with SMTP id 6a1803df08f44-89a82032d29mr38700396d6.56.1773391585091;
        Fri, 13 Mar 2026 01:46:25 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:24 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/6] riscv: Add a custom, simplified version of Svpbmt "XPbmtUC"
Date: Fri, 13 Mar 2026 01:44:02 -0700
Message-Id: <20260313084407.29669-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014627_014460_F0AF2C98 
X-CRM114-Status: GOOD (  17.94  )
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

On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
sometimes map the system memory twice in physical address space, one
as cached, and the other as uncached. Through the uncached window,
device drivers will be able to map DMA buffer for noncoherent devices.
Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
Make use of such feature by modeling it as "XPbmtUC", a customized
version of Svpbmt, where a single bit in PTE is used for UC control.
There's no IO bit with such scheme, as it's assumed that the PMA
(usually hard-wired on these SoCs) will properly convey the strongly-
ordered, non-idempotent attribute of the MMIO region.

The enablement of such position of "XPbmtUC" is controlled by the
device-tree property "riscv,xpbmt-uncache-bit".

Example:

Starfive JH7110 (Sifive U74):
           [0x0,   0x40000000) Low MMIO
    [0x40000000, 0x2_40000000) Cached Mem
  [0x4_40000000, 0x6_40000000) Uncached Mem UC+
  [0x9_00000000, 0x9_d0000000) High MMIO

Device-tree:
  riscv,xpbmt-uncache-bit = <32>;

Use PTE bit 32 (PPN bit 34) as UC (uncache) control to perfectly
match the memory map of the SoC.

ESWIN EIC770X (Sifive U84/P550):
           [0x0,    0x20000000) Core Internal
    [0x20000000,    0x40000000) Core Internal (Die 1)
    [0x40000000,    0x60000000) Low MMIO
    [0x60000000,    0x80000000) Low MMIO (Die 1)
    [0x80000000, 0x10_80000000) Cached Mem
 [0x20_00000000, 0x30_00000000) Cached Mem (Die 1)
 [0x80_00000000, 0xa0_00000000) High MMIO
 [0xa0_00000000, 0xc0_00000000) High MMIO (Die 1)
 [0xc0_00000000, 0xd0_00000000) Uncached Mem
 [0xe0_00000000, 0xf0_00000000) Uncached Mem (Die 1)

EIC770X is not directly compatible to this model, as the uncached
regions are offsetted, and the offset is different among the Dies
in the dual-die version (EIC7702). so we expect the firmware to
provide a thin layer of hypervisor to transparently re-map:

    [0x80000000,  0x10_80000000) Cached Mem
 [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
 [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
 [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
[0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
[0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'

With that, the firmware/bootloader can set the following at boot:
  riscv,xpbmt-uncache-bit = <38>;

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/Kconfig                  | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/pgtable-64.h |  8 ++++++++
 arch/riscv/kernel/cpufeature.c      |  8 ++++++++
 arch/riscv/mm/pgtable.c             |  7 +++++++
 5 files changed, 36 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b39f37f769a2..f2b4da6a3deb1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -893,6 +893,18 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RISCV_ISA_XPBMTUC
+	bool "Support XPbmtUC (customized pbmt uncache bit)"
+	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
+	default n
+	select DMA_DIRECT_REMAP
+	help
+	  Add support for "riscv,xpbmt-uncache-bit" device-tree property.
+	  The bit denotes the bit in PTE that marks the page as uncached.
+
+	  If you don't know what to do here, say N.
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4369a23385413..6baa6566cf4cc 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -111,6 +111,7 @@
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
 
+#define RISCV_ISA_EXT_XPBMTUC		126
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
 #define RISCV_ISA_EXT_MAX		128
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514c..1a6d04884111d 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -140,6 +140,14 @@ enum napot_cont_order {
 #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
 #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
 
+#ifdef CONFIG_RISCV_ISA_XPBMTUC
+extern int riscv_xpbmtuc_bit;
+extern u64 riscv_xpbmtuc_mask;
+#endif
+
+#define XPBMTUC_HAS_PAGE_NOCACHE CONFIG_RISCV_ISA_XPBMTUC
+#define XPBMTUC_HAS_PAGE_MTMASK  CONFIG_RISCV_ISA_XPBMTUC
+
 static inline u64 riscv_page_mtmask(void)
 {
 	u64 val;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fa591aff9d335..faec169004b4a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1118,6 +1118,14 @@ void __init riscv_fill_hwcap(void)
 		riscv_v_setup_vsize();
 	}
 
+#ifdef CONFIG_RISCV_ISA_XPBMTUC
+	if (!of_property_read_u32(of_root, "riscv,xpbmt-uncache-bit",
+				  &riscv_xpbmtuc_bit)) {
+		riscv_xpbmtuc_mask = 1UL << riscv_xpbmtuc_bit;
+		set_bit(RISCV_ISA_EXT_XPBMTUC, riscv_isa);
+		pr_info("Using XPbmtUC bit=%d\n", riscv_xpbmtuc_bit);
+	}
+#endif
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 807c0a0de1827..4ca442bc8595d 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -5,6 +5,13 @@
 #include <linux/kernel.h>
 #include <linux/pgtable.h>
 
+#ifdef CONFIG_RISCV_ISA_XPBMTUC
+int riscv_xpbmtuc_bit;
+
+u64 riscv_xpbmtuc_mask;
+EXPORT_SYMBOL(riscv_xpbmtuc_mask);
+#endif
+
 int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
