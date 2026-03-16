Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B6EF30273
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm+BIR+qQNa1O3NQZGzPsYgE+M4kUtKVwum6K6K/qHI=; b=oYSfpJovWgYW3A
	PzQ87Pf8GlSwsWySDbmcCXV32SlOIjAlnmpnwZ5ryxnPv+2FWCJMZH3CS2oNIAlW96xMAU0me4j/Z
	M6hn399Z3TZVLqmlrLC96Oyjx14pWB/059Ajk9bbSZ9OcsxJIsz/C2u76kd+KMR72HIuB7NejSjLG
	8uCOLJc745hGOUlO/9WkNz6Wv8FYB9/8186/0YJTNaN+00c4zu4DGnnSmYY/R5NB/ffxguV0+vnq6
	NGkU++/KmUlPxuCk+Q+HmeRQ8Uba3OH+C/QgtwCOw364BpqX2MsugG7rU6C0v4YJ7EaDhJ7G0y4HD
	zIqHTBPdMIof0G4KORVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215V-00000003Nu8-10aC;
	Mon, 16 Mar 2026 06:06:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215O-00000003NsE-1VQ3
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 06:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HQag27lfnL4r4x+dLynVrrgTLbk7YwnU84xBzCA2Pic=; b=IJWQ+C/AXp7Ylzx+xoQ8SefcIS
	7RQMHfNmvkL0hSAl0pZEEoTLCMgCxKqflCKu0dWOKgLpuPHE60f3xAt8+zRJp/z6q2SzySkEVncGN
	j2aNbDQHEjGbuQEARReYPppc9R39qw7ZEQ4CeaEh+LX82ftuOtxu+oSnsKcX7yM7hrlM4jLJdyBc7
	BcoshsJomA2aI91YC7eQ22jVHuP917LESV7OSRKIRzc8xFaa7pggBblY/tYUqRX6+kI6WM29dHkdq
	ceSMgv4P+93e0sVMHSKP7PSv0XYXp3uRa0WHxVhWmnHSPgJJdmLWtYzsfRAgoS5xyhPg3q9mGNOkH
	MBSSxceQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215K-000000065wD-2yTf
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:05:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8298fad2063so2398404b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 23:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641148; x=1774245948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQag27lfnL4r4x+dLynVrrgTLbk7YwnU84xBzCA2Pic=;
        b=hJwIgfThYKahrHfjsv2B2sa3uZvmRCpgSI0pz+PoztUU2z4zuWkRW4rBYQZG89QX4m
         EmzcoVnooqH809uwe8KCU9QP9Q5Y6nWd3HHZu4DEdI6k+mO2/Bvf3iafUx77CnyGFNjc
         Q41oDUvFCBW1pYaMwU+lvH2KevLzpHpzCnkJUCAduPu3pvxuLtDnEKfjEkY8pD5GuILy
         whCijNb1dFLfTc3FImljxqssNHjI/HIwiWGlg2ttieszLq0YkR7JB3E7HIuFRGK3sHK1
         Lsq6jsJqDZ/YJwhzjc4Xd4YrSdFqZL4kbHttd5VcogUUw6BUZVLkQdPv3V5UnjhemDmW
         EyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641148; x=1774245948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQag27lfnL4r4x+dLynVrrgTLbk7YwnU84xBzCA2Pic=;
        b=bi17IKMlG0nCIh2+GMokrfSDgbOXh2z38tXrdevGriffOZ265Mr57K2REihmxFzesE
         T8Tqih+BozPFAfBPighyB1Ru9cz63P4IxT6MJ3+0C/yv3NrzbfzW1hnFP/+319SniPeq
         RzuFiZNJb1CfGEXtcxiIA3VZggenstBqTnJHjkbDtP0CZoIc8TKQosq0dTe7v8IuemP/
         nGwvb3G6koSXf0UdGts6eVVwLCQkJF3d9/KPR7azBwWr6dhllEOYPb/NlzdAwvLKTweO
         H09LSvsedtkK6V1VGWdRzJmafAvqtTG+yJ0m5Z78CJVMbkzZLDTscc2tdHuR5cV0wTSl
         O+Ew==
X-Gm-Message-State: AOJu0YynRYAswoqqlbPjzPrc6aoVxDoyR/0I67wACCPOrPl+DWxpRxfs
	8kFkxXVrjYMSnHINRAU+HaBt+tPehDhSOyMe15QN2wy36Y+bUjITwtkaSr2iNw==
X-Gm-Gg: ATEYQzwsZKzUcTz72z8NVCXoQPi+qQHsvSdBqY89oRgdezteJhDaWur/xbIoPXl5cRU
	u3SKulyxgbdbx3FWUj1/WlgJMp3FiJ9f3eFPGbt5i9BggBCpF+E+pZt9e5bhfRZPtnSfNi2XrDq
	HGeYVMiXsMYQ/VfHuEElIogspzlcQVIzT6+L/uKhzAXVM4LpSIiww+0J9d2pHhM6dMTbcSWVc+9
	7gngHK5lwCKSEgidRaskCZq2dkOeTN2nRC5mL36lIcYITtwyrhrk+DKlAH5RT6BQQNYOlc0dZZB
	nC3e4NQTbv5W/9mkr8rERAeoMOwphPYAGU36hKOwIJaJ1xxGtv/XbfdLNf9OuNe4ZhcfAraUNVQ
	6wR5PlKYygV5hS5dP5ihXcx3G1oJcRtV2E2z5wwtLOcKCXmu3dAy3zJG0cuT5VeTixHHuMtZTsg
	iUHkaIuDTUPNCLo6rZqPKaA2au
X-Received: by 2002:a05:6a00:a0b:b0:829:9130:e699 with SMTP id d2e1a72fcca58-82a19907d1amr10824035b3a.52.1773641147891;
        Sun, 15 Mar 2026 23:05:47 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07393098sm12525226b3a.62.2026.03.15.23.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:05:46 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/3] riscv: errata: sifive: Add an "errata" to simulate Svpbmt on cores without
Date: Sun, 15 Mar 2026 23:03:28 -0700
Message-Id: <20260316060328.1173634-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
References: <20260316060328.1173634-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_060551_148472_3E7A030A 
X-CRM114-Status: GOOD (  27.82  )
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

On some platforms with pre-Svpbmt Sifive cores, they map the system
memory twice in physical address space, one as cached (through the
front port), and the other as uncached (through the system port), to
enable drivers working with non-cache-coherent devices. Drivers can map
the DMA buffers uncached through the uncached alias, and don't have to
flush caches explicitly. It eases the driver programming. For complex
device drivers, such as the GPU, this is a must have, as DMA pages can
be mmap'ed to user space, and the userspace can't do caches flushes due
to the lack of Zicbom on these older cores.

Introduce a Sifive "errata" to model such setup with a customized
version of Svpbmt, "XPbmtUC", where a single, artificial bit in the PTE
is used for cache/uncache control (UC), effectively offsetting the PPN
by power-of-2. I.e.,

Starfive JH7110 (Sifive U74):
           [0x0,   0x40000000) Low MMIO
    [0x40000000, 0x2_40000000) Cached Mem
  [0x4_40000000, 0x6_40000000) Uncached Mem UC+
  [0x9_00000000, 0x9_d0000000) High MMIO

Using PTE bit 32 (PPN bit 34) as UC (uncache) control perfectly matches
the memory map of the SoC.

Other SoCs like ESWIN EIC770X is not directly compatible to this model,
as the uncached regions are not power-of-2 offseted, and the offsets are
different between Dies in the dual-die version (EIC7702). The firmware,
however, could use G-stage page table to transparently re-map, and make
the address space suitable for XPbmtUC scheme to be applied:

             [0x0,     0x20000000) Core Internal
      [0x20000000,     0x40000000) Core Internal (Die 1)
      [0x40000000,     0x60000000) Low MMIO
      [0x60000000,     0x80000000) Low MMIO (Die 1)
      [0x80000000,  0x10_80000000) Cached Mem
   [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
   [0x80_00000000,  0xa0_00000000) High MMIO
   [0xa0_00000000,  0xc0_00000000) High MMIO (Die 1)
   [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
   [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
 with firmware/hypervisor re-mapping:                      |  |
 ------------------------------------                      |  |
  [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
  [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'

Such firmware capability is detected at boot time by sbi ecalls. The
firmware will provide us the UC bit position if re-map is in effect.

Note: currently this feature is gated by JH7110 and EIC770X SoCs to
avoid unnecessary sbi ecalls. There's also no IO bit in such XPbmtUC
scheme, as it's assumed that the PMA (hard-wired on these SoCs) will
convey the strongly-ordered, non-idempotent attribute of MMIO regions.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/Kconfig.errata                    | 13 ++++
 arch/riscv/errata/sifive/errata.c            | 72 ++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h         | 19 +++++-
 arch/riscv/include/asm/errata_list_vendors.h |  3 +-
 arch/riscv/include/asm/pgtable-64.h          |  9 ++-
 5 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d0..0722dc8df4a9e 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -76,6 +76,19 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_SIFIVE_XPBMTUC
+	bool "Support XPbmtUC (customized uncache bit)"
+	depends on ERRATA_SIFIVE && 64BIT && MMU
+	default y
+	select DMA_DIRECT_REMAP
+	help
+	  This will detect and enable the XPbmtUC, where a bit in PTE
+	  is chosen as the UC (uncache) control bit to emulate Svpbmt
+	  on supported SoCs. For SoCs with non-cache-coherent devices,
+	  enabling XPbmtUC allows drivers to map DMA buffers uncached.
+
+	  If you don't know what to do here, say "Y".
+
 config ERRATA_STARFIVE_JH7100
 	bool "StarFive JH7100 support"
 	depends on ARCH_STARFIVE
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index f26c997e04e59..fd804e53cfcaa 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -8,11 +8,37 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/bug.h>
+#include <linux/of.h>
 #include <asm/text-patching.h>
 #include <asm/alternative.h>
 #include <asm/vendorid_list.h>
 #include <asm/errata_list.h>
 #include <asm/vendor_extensions.h>
+#include <asm/cacheflush.h>
+#include <asm/sbi.h>
+
+#define SIFIVE_SBI_EXT_SIFIVE		0x09000489
+#define SIFIVE_SBI_EXT_XPBMTUC_PRESENT	0x50425543 // PBUC
+
+#ifdef CONFIG_ERRATA_SIFIVE_XPBMTUC
+
+u64 riscv_xpbmtuc_mask;
+EXPORT_SYMBOL(riscv_xpbmtuc_mask);
+
+static const struct {
+	const char *machine;
+	int xpbmtuc_bit;
+} xpbmtuc_platforms[] = {
+	{
+		.machine = "starfive,jh7110",
+		.xpbmtuc_bit = 32
+	},
+	{
+		.machine = "eswin,eic7700",
+		.xpbmtuc_bit = -1 // detect
+	},
+};
+#endif
 
 struct errata_info_t {
 	char name[32];
@@ -51,6 +77,46 @@ static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long imp
 	return true;
 }
 
+#ifdef CONFIG_ERRATA_SIFIVE_XPBMTUC
+static void detect_xpbmtuc(void)
+{
+	int riscv_xpbmtuc_bit = -1, i;
+	struct sbiret ret;
+
+	for (i = 0; i < ARRAY_SIZE(xpbmtuc_platforms); i++) {
+		if (!of_machine_is_compatible(xpbmtuc_platforms[i].machine))
+			continue;
+
+		riscv_xpbmtuc_bit = xpbmtuc_platforms[i].xpbmtuc_bit;
+		if (riscv_xpbmtuc_bit >= 0)
+			break;
+
+		ret = sbi_ecall(SIFIVE_SBI_EXT_SIFIVE,
+				SIFIVE_SBI_EXT_XPBMTUC_PRESENT,
+				0, 0, 0, 0, 0, 0);
+		riscv_xpbmtuc_bit = ret.error ? -1 : ret.value;
+		break;
+	}
+	if (riscv_xpbmtuc_bit < 0)
+		return;
+
+	riscv_xpbmtuc_mask = 1UL << riscv_xpbmtuc_bit;
+	pr_info("Using XPbmtUC bit %d\n", riscv_xpbmtuc_bit);
+}
+
+static bool errata_xpbmtuc_check_func(unsigned long arch_id, unsigned long impid)
+{
+	return riscv_xpbmtuc_mask != 0;
+}
+#else
+static void detect_xpbmtuc(void) { }
+
+static bool errata_xpbmtuc_check_func(unsigned long arch_id, unsigned long impid)
+{
+	return false;
+}
+#endif
+
 static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 	{
 		.name = "cip-453",
@@ -60,6 +126,10 @@ static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 		.name = "cip-1200",
 		.check_func = errata_cip_1200_check_func
 	},
+	{
+		.name = "xpbmtuc",
+		.check_func = errata_xpbmtuc_check_func
+	},
 };
 
 static u32 __init_or_module sifive_errata_probe(unsigned long archid,
@@ -88,6 +158,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
+	else if (stage == RISCV_ALTERNATIVES_BOOT)
+		detect_xpbmtuc();
 
 	cpu_req_errata = sifive_errata_probe(archid, impid);
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6694b5ccdcf85..a05086f05a0cf 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -53,18 +53,33 @@ asm(ALTERNATIVE(	\
 	: /* no inputs */	\
 	: "memory")
 
+#ifdef CONFIG_64BIT
+#define ALT_PAGE_CUST_BIT(_bit)						\
+asm(ALTERNATIVE("li %0, 0\t\nnop",					\
+		"1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
+		      "ld %0, %%pcrel_lo(1b)(%0)", SIFIVE_VENDOR_ID,	\
+			ERRATA_SIFIVE_XPBMTUC,				\
+			CONFIG_ERRATA_SIFIVE_XPBMTUC)			\
+		: "=r"(_bit))
+#endif
+
 /*
  * _val is marked as "will be overwritten", so need to set it to 0
  * in the default case.
  */
 #define ALT_SVPBMT_SHIFT 61
 #define ALT_THEAD_MAE_SHIFT 59
+#define HAS_XPBMTUC_PAGE_NOCACHE	CONFIG_ERRATA_SIFIVE_XPBMTUC
+#define HAS_XPBMTUC_PAGE_MTMASK		CONFIG_ERRATA_SIFIVE_XPBMTUC
 #define ALT_SVPBMT(_val, prot)						\
-asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
+asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
 		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
 			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
 		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
-			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE)	\
+			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE,	\
+		  "1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
+			"ld %0, %%pcrel_lo(1b)(%0)", SIFIVE_VENDOR_ID,	\
+			ERRATA_SIFIVE_XPBMTUC, HAS_XPBMTUC##prot)	\
 		: "=r"(_val)						\
 		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
 		  "I"(prot##_THEAD >> ALT_THEAD_MAE_SHIFT),		\
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index ec7eba3734371..b2bf8d7a52c30 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -11,7 +11,8 @@
 #ifdef CONFIG_ERRATA_SIFIVE
 #define	ERRATA_SIFIVE_CIP_453 0
 #define	ERRATA_SIFIVE_CIP_1200 1
-#define	ERRATA_SIFIVE_NUMBER 2
+#define	ERRATA_SIFIVE_XPBMTUC 2
+#define	ERRATA_SIFIVE_NUMBER 3
 #endif
 
 #ifdef CONFIG_ERRATA_THEAD
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514c..7f47a361d8003 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -76,7 +76,14 @@ typedef struct {
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
  *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
  */
-#define _PAGE_PFN_MASK  GENMASK(53, 10)
+static inline u64 riscv_pfn_mask(void)
+{
+	u64 cust_bit;
+
+	ALT_PAGE_CUST_BIT(cust_bit);
+	return GENMASK(53, 10) ^ cust_bit;
+}
+#define _PAGE_PFN_MASK  riscv_pfn_mask()
 
 /*
  * [63] Svnapot definitions:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
