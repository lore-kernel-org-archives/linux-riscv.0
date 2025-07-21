Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A2DC83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLjl1aasJARY5kQKjuc64D6oGAFABapwQb3pVIARVGA=; b=46q4swr2ZnnchG
	X2um1aD3dj0xQd1xmHldCKNLZoT/JZTWq3fhiOWMVOndhLvN5cwUzDn7BNt+maWfe0iCUoNI4/mPB
	qXcj1//zJXsN6x8F2Kek5ssRiGJQXFt8WFL6OrDp2OeABsSDGOOKFAJL5notrc9liBogu4GZhER0b
	QayJHA8kgzPY5hCu256UZEmlZI2oWts/1R4qf3LYvYmMu6wA2kYrGK09kBLlNUt3Ot0GtQV52OZDh
	7eAjji3Ym/a20GsEJdgd+ztXh7IZdTJfedzI5N313VRhREpoSYJ16wZRUmuMny5igpMTuF2zjzPk6
	748Cy4tx0MA/dV5h8adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduTv-00000000L6H-2hjX;
	Mon, 21 Jul 2025 17:39:19 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtm1-00000000EqK-2KAV
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 16:53:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753116835; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MKAPnVyAcTHGD+zLp1oAroZ0g42bjNGxG74ebGA4Wub8AMmJFQKCsSXwMJS6d8r+SI6x0GGrd6KhAPLiPO5k78JvguWlApugNfk6kQuxzzZ059VVxOCURTFmvmnPSRDVlx2sd/uzbTZydb+CdOlC/mwSAD69DvOysl+HGKCztPI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753116835; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kOSUOhO+RbomU5EIsPS0wq8BSGTy/PI3+gve27nrjhE=; 
	b=Ly4QgOo6mpps86mRMGc/frhg7yA1aTVPwTipr5P8+dHYaGmlDWrx8Fo9N4AkHdIB6oFRYvVX+dlnWQxkJ3QFNYCi0i8mU0XDw5G6WU+hnLNUEMAj6GwOG8SCY808kaf4137ZytIL6Ji6ru89K3S7P7YuqSCcYN0M0E5aKfUuzP4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753116835;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kOSUOhO+RbomU5EIsPS0wq8BSGTy/PI3+gve27nrjhE=;
	b=hfbxxqgJgMPBclMxpiTg4iHu03N6Y+wPv5w4XUtHcY5FXv2gbibnn7Dk/n+iwqqd
	DusVKiiEQOga5I1oGgwrstyjA1oGbpcNqhz9IxRLscSKrnliol7A1kws33sK7ysiMAv
	sdbqxuSOL+gbPAzfFuraksZrKze4wzSB4nyWI91U=
Received: by mx.zohomail.com with SMTPS id 1753116832957800.6724570677823;
	Mon, 21 Jul 2025 09:53:52 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 22 Jul 2025 00:53:11 +0800
Subject: [PATCH 2/2] riscv: mm: Use mmu-type from FDT to limit SATP mode
MIME-Version: 1.0
Message-Id: <20250722-satp-from-fdt-v1-2-5ba22218fa5f@pigmoral.tech>
References: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
In-Reply-To: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753116810; l=4789;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=QJ1AN3pgrnkRRFsHQd3dral3Q97mnmgEr/XJyZFBQpY=;
 b=JLx3Nl7w18vU5d64OvMojdv/RWuMH0wtWLmMVHao9FJBV9OAYA1hNAWy0VzTm6MOyGD4g6jGF
 vVItPnxfRdqBwy7/Eo6kWc7Bxf7ioZmrPhH385zbEp8fx4eoRbUFZpx
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_095357_632857_52A063D0 
X-CRM114-Status: GOOD (  19.76  )
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

Some RISC-V implementations may hang when attempting to write an
unsupported SATP mode, even though the latest RISC-V specification
states such writes should have no effect. To avoid this issue, the
logic for selecting SATP mode has been refined:

The kernel now determines the SATP mode limit by taking the minimum of
the value specified by the kernel command line (noXlvl) and the
"mmu-type" property in the device tree (FDT). If only one is specified,
use that.
- If the resulting limit is sv48 or higher, the kernel will probe SATP
  modes from this limit downward until a supported mode is found.
- If the limit is sv39, the kernel will directly use sv39 without
  probing.

This ensures SATP mode selection is safe and compatible with both
hardware and user configuration, minimizing the risk of hangs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/kernel/pi/fdt_early.c | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/pi/pi.h        |  1 +
 arch/riscv/mm/init.c             | 11 ++++++++---
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index 9bdee2fafe47e4a889132ebe2d0d360717c464e9..a12ff8090f190331f555d9e22ce4d1b3e940bceb 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -3,6 +3,7 @@
 #include <linux/init.h>
 #include <linux/libfdt.h>
 #include <linux/ctype.h>
+#include <asm/csr.h>
 
 #include "pi.h"
 
@@ -183,3 +184,42 @@ bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name)
 
 	return ret;
 }
+
+/**
+ *  set_satp_mode_from_fdt - determine SATP mode based on the MMU type in fdt
+ *
+ * @dtb_pa: physical address of the device tree blob
+ *
+ *  Returns the SATP mode corresponding to the MMU type of the first enabled CPU,
+ *  0 otherwise
+ */
+u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
+{
+	const void *fdt = (const void *)dtb_pa;
+	const char *mmu_type;
+	int node, parent;
+
+	parent = fdt_path_offset(fdt, "/cpus");
+	if (parent < 0)
+		return 0;
+
+	fdt_for_each_subnode(node, fdt, parent) {
+		if (!fdt_node_name_eq(fdt, node, "cpu"))
+			continue;
+
+		if (!fdt_device_is_available(fdt, node))
+			continue;
+
+		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
+		if (!mmu_type)
+			break;
+
+		if (!strcmp(mmu_type, "riscv,sv39"))
+			return SATP_MODE_39;
+		else if (!strcmp(mmu_type, "riscv,sv48"))
+			return SATP_MODE_48;
+		break;
+	}
+
+	return 0;
+}
diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
index 21141d84fea603fdfc439e12a8c3216f1527c65f..3fee2cfddf7cfb8179af6f2d9b69a0d5e412fad7 100644
--- a/arch/riscv/kernel/pi/pi.h
+++ b/arch/riscv/kernel/pi/pi.h
@@ -14,6 +14,7 @@ u64 get_kaslr_seed(uintptr_t dtb_pa);
 u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa);
 bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
+u64 set_satp_mode_from_fdt(uintptr_t dtb_pa);
 
 bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name);
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d03e02a92379f2338a4f4df0ab797a7859b83dfc..0f30fa875abf92a201579ac6469958b0d95b5a58 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -816,6 +816,7 @@ static __meminit pgprot_t pgprot_from_va(uintptr_t va)
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
 u64 __pi_set_satp_mode_from_cmdline(uintptr_t dtb_pa);
+u64 __pi_set_satp_mode_from_fdt(uintptr_t dtb_pa);
 
 static void __init disable_pgtable_l5(void)
 {
@@ -855,18 +856,22 @@ static void __init set_mmap_rnd_bits_max(void)
  * underlying hardware: establish 1:1 mapping in 4-level page table mode
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
+ * The maximum SATP mode is limited by both the command line and the "mmu-type"
+ * property in the device tree, since some platforms may hang if an unsupported
+ * SATP mode is attempted.
  */
 static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
-	u64 satp_mode_cmdline = __pi_set_satp_mode_from_cmdline(dtb_pa);
+	u64 satp_mode_limit = min_not_zero(__pi_set_satp_mode_from_cmdline(dtb_pa),
+					   __pi_set_satp_mode_from_fdt(dtb_pa));
 
 	kernel_map.page_offset = PAGE_OFFSET_L5;
 
-	if (satp_mode_cmdline == SATP_MODE_48) {
+	if (satp_mode_limit == SATP_MODE_48) {
 		disable_pgtable_l5();
-	} else if (satp_mode_cmdline == SATP_MODE_39) {
+	} else if (satp_mode_limit == SATP_MODE_39) {
 		disable_pgtable_l5();
 		disable_pgtable_l4();
 		return;

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
