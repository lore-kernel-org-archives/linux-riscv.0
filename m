Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2640DC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 23:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955AB21479
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 23:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eepZBFTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BjdmrdUY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955AB21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LrtPtZ7WnqZfLCEbxKuVHMa5R/FiF8OyebbfP1dj0RI=; b=eep
	ZBFTiTlAFWLIm5QS3U9NbHX73fZ68jXRfMWRdfx+R+8V1t6McHQXHdKkwen6WcU7gZ+qf4Jc1ZHld
	+q6bqxLKz+jU4kQu3hAPdM7Z/qxPcjPR+hPckoVMuDRYIY4F5T6Wgfna3VlcH6X6vvtDXPZeBwhku
	mPXlfFP532Re/immq60/skdxdqiDFI+CBYFt/wjX+KEDp92GxwRkhP3osb6LnpZx53NW2Ia1EGQV8
	MGe1pPZ/8tHD58sS1Rs5C35VyhY58rFqnF1UUbXUSUuYi3zY3OhPer4j66wLG2hW6fISANhHcL+7M
	+MPXLZoO2yG6B07N42c/DuAI+Xr6AYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPF7v-00021t-Jy; Tue, 20 Nov 2018 23:08:15 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPF7s-000215-JU
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 23:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542755293; x=1574291293;
 h=from:to:cc:subject:date:message-id;
 bh=gWNVaT5q2FRSp5GUYA68hoc8M4aM1LrstfAQE97W0LA=;
 b=BjdmrdUYsP0tXIpf7uHBELB60hlxOAbHoqyAC/Jb2b0VCC7UKE7t/kE9
 5Gaw4P/rMd8L5TOPO6PNPxa/vNJINdfJIvT6eTOx/R+LuQtTFPvQ8NRUT
 UtqrX5UmJfga5sUTGQ+FsxrgGZ/G8MAmlW3c5QeGzU6GdU8vd8RbXKoOf
 oNq/L10ougvv/ZW1/f+3grSgM5mnqw15HVEPFntMdFVg+eoW8q3AK4DdY
 gScMSZhy2XoH8Q7cqWOVBHKCPX4p54+SSaZxwccTMbesOoXTglnUsjNrB
 vdrKrbg6VTmjFE7iuCgLVqB1i20qAGSXA2vb6Oa/InswQ1UIdpKe9kMDT g==;
X-IronPort-AV: E=Sophos;i="5.56,258,1539619200"; d="scan'208";a="95916969"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Nov 2018 07:07:52 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 20 Nov 2018 14:50:37 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Nov 2018 15:07:52 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Fix of_node_* refcount
Date: Tue, 20 Nov 2018 15:07:50 -0800
Message-Id: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_150812_747704_CBE9CA67 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, atish.patra@wdc.com, sudeep.holla@arm.com,
 schwab@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120230750.5M-JfVedkhLJxIZvpnwYTbkeu564PFFpwGT1WvzkIZM@z>

Fix of_node* refcount at various places by using of_node_put.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cacheinfo.c  | 11 +++++++++++
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  2 ++
 arch/riscv/kernel/perf_event.c |  1 +
 arch/riscv/kernel/smpboot.c    |  6 +++++-
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index cb35ffd8..638dee3f 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -28,6 +28,7 @@ static int __init_cache_level(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
 	int levels = 0, leaves = 0, level;
 
 	if (of_property_read_bool(np, "cache-size"))
@@ -39,7 +40,10 @@ static int __init_cache_level(unsigned int cpu)
 	if (leaves > 0)
 		levels = 1;
 
+	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
+		of_node_put(prev);
+		prev = np;
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
@@ -55,8 +59,10 @@ static int __init_cache_level(unsigned int cpu)
 		levels = level;
 	}
 
+	of_node_put(np);
 	this_cpu_ci->num_levels = levels;
 	this_cpu_ci->num_leaves = leaves;
+
 	return 0;
 }
 
@@ -65,6 +71,7 @@ static int __populate_cache_leaves(unsigned int cpu)
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
 	if (of_property_read_bool(np, "cache-size"))
@@ -74,7 +81,10 @@ static int __populate_cache_leaves(unsigned int cpu)
 	if (of_property_read_bool(np, "d-cache-size"))
 		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 
+	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
+		of_node_put(prev);
+		prev = np;
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
@@ -89,6 +99,7 @@ static int __populate_cache_leaves(unsigned int cpu)
 			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
+	of_node_put(np);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3a5a2ee3..7b3eb970 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -155,6 +155,7 @@ static int c_show(struct seq_file *m, void *v)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_puts(m, "\n");
+	of_node_put(node);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0339087a..a6e369ed 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -56,8 +56,10 @@ void riscv_fill_hwcap(void)
 
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
+		of_node_put(node);
 		return;
 	}
+	of_node_put(node);
 
 	for (i = 0; i < strlen(isa); ++i)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index a243fae1..667ee70d 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -476,6 +476,7 @@ int __init init_hw_perf_events(void)
 
 		if (of_id)
 			riscv_pmu = of_id->data;
+		of_node_put(node);
 	}
 
 	perf_pmu_register(riscv_pmu->pmu, "cpu", PERF_TYPE_RAW);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 18cda0e8..fc185eca 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -57,12 +57,15 @@ void __init setup_smp(void)
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
-		if (hart < 0)
+		if (hart < 0) {
+			of_node_put(dn);
 			continue;
+		}
 
 		if (hart == cpuid_to_hartid_map(0)) {
 			BUG_ON(found_boot_cpu);
 			found_boot_cpu = 1;
+			of_node_put(dn);
 			continue;
 		}
 
@@ -70,6 +73,7 @@ void __init setup_smp(void)
 		set_cpu_possible(cpuid, true);
 		set_cpu_present(cpuid, true);
 		cpuid++;
+		of_node_put(dn);
 	}
 
 	BUG_ON(!found_boot_cpu);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
