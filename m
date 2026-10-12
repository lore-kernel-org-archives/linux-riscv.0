Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20988CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rh30xZ7gyGE9lVzqJs3gQ+d0bNikZi9QJlqds9/b0GE=; b=F9YDlx2YNFznCW
	X1QI55ZZwnIGHLnvNi08+qniFuELK13wkAKWQ2T1Ueib/4pbb6Yd9nqLMdVXyg6tCVOLAfE+4wMvZ
	iuWLfGpB2HVQqy1RdSnWx29gvilpZtdIJBBurYAsPDV1IGqB5AHEW9OFHqCGdt2RzI5AILIk9B+//
	bKhVi6YTkTwyQTBFuDwOg0d+fpOXzHxGyiKcrHKhgk8XEx1Q1igtuQHbXFcoktaXMvrfK/yIpgDjF
	/ODYDL9EM1PfQCoTfSzVrOvLdKSp/CJTjNnRjK3x5K90K2Dhi/5UqpdwMfWz6lShvkyT7KGWyjCBF
	Y+K+BoRmyBVHARHfPYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFoC-0000000AXJe-3zBK;
	Mon, 12 Oct 2026 13:11:16 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFo8-0000000AXIO-001m
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 13:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791810660; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6RfKdx5FdAu3miw0erxA7X0WAeA1bc5udK2v4s0HIwo=;
	b=iNbxD+KAN68ckN3DP35oerndAdxkPkwTWVdFjCcpBlVzvQr+5eqTqvsMll1f3qTE5EMc10gq9yrlXSDUcrSTTS+wahQ/DcnZlgd61dJEFEyvEHRc8fqQE4C1qRi7Z5G/uEylKWqlB4U+RijlzLEc7rTqMZZgnkR9p097HaPb00Y=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XCgVPlj_1791810634;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCgVPlj_1791810634 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 21:10:59 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: sudeep.holla@kernel.org,
	conor.dooley@microchip.com,
	atishp@rivosinc.com,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Populate boot CPU topology on UP kernels
Date: Mon, 12 Oct 2026 21:10:33 +0800
Message-ID: <20261012131034.1026-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_061113_981589_1FF5253D 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
zero-initialized and its sibling masks are empty.

The sysfs topology interface is available on UP kernels too. As a
result, cpu0 exports empty thread_siblings_list and core_siblings_list
attributes rather than masks containing itself, violating the expected
topology semantics of this stable ABI.

Initialize and store the boot CPU topology in a UP-only early initcall.
This runs after DT and ACPI CPU discovery and after the memory allocator
is available, before the topology is exposed through sysfs.

SMP kernels continue to initialize topology in smp_prepare_cpus(). NUMA
needs no additional handling because it depends on SMP.

Fixes: fbd92809997a ("riscv: topology: fix default topology reporting")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Tested on QEMU virt (RV64):
- UP, default DT: cpu0 thread_siblings_list, core_cpus_list,
  core_siblings_list and package_cpus_list all contain CPU0.
- UP, DT with 32 KiB L1 instruction/data caches: the same topology
  checks pass, and both caches appear in sysfs with shared_cpu_list=0.
- SMP, 8 CPUs: each CPU's thread_siblings_list and core_cpus_list
  contain itself; core_siblings_list and package_cpus_list are 0-7.

 arch/riscv/kernel/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..234d9af414b7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arch_topology.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/mm.h>
@@ -370,6 +371,17 @@ void __init setup_arch(char **cmdline_p)
 	riscv_clear_hypervisor_csr();
 }
 
+#ifndef CONFIG_SMP
+static int __init riscv_init_cpu_topology(void)
+{
+	init_cpu_topology();
+	store_cpu_topology(0);
+
+	return 0;
+}
+early_initcall(riscv_init_cpu_topology);
+#endif
+
 bool arch_cpu_is_hotpluggable(int cpu)
 {
 	return cpu_has_hotplug(cpu);

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
