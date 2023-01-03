Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD05C53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpzgS+fWD5SJhF8+QHf3EnzgLL1EMlrH92zak7t2XvE=; b=YyiDOmwBi+zNno
	v/2ZqCt4TrGpk2pg30MZlUPjSCUwLL7b4TlcpaabxUR8esFyh9olFJucngCGXO5pVEeOwvhd4bzzo
	5cw8xI2H51hcG/RO2zBtJj1vNoTbF/3bNe3i+WRwhVKThyod9n2+Jp4mrb5I4uwe8RqMBFCbgDEqE
	rC7wGiPzwImC/BKw6IcZi1i+e4Vhds6MZeMkPbKpOqdHPGfXs8U78eNTLqNZS7phCyu3pvtIpFWt0
	wduKPJ+qtDMMnCbu92ymgjmwmoqZqqwWNBG3Skdoi7z69BaEGvfG6cTcKarrQg0PKwGg3NjFEkxiQ
	sV3TA/X/Fw4j2kkQw+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCYOP-00GFyy-Mt; Tue, 03 Jan 2023 03:55:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCYNL-00GFPI-UY
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 03:54:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8B48924E1E1;
	Tue,  3 Jan 2023 11:53:26 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 11:53:26 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 11:53:23 +0800
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ley
 Foon Tan" <lftan.linux@gmail.com>
Subject: [PATCH] riscv: Move call to init_cpu_topology() to later initialization stage
Date: Tue, 3 Jan 2023 11:53:16 +0800
Message-ID: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_195408_307982_B2CB1303 
X-CRM114-Status: GOOD (  10.85  )
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

topology_parse_cpu_capacity() is failed to allocate memory with kcalloc()
after read "capacity-dmips-mhz" DT parameter in CPU DT nodes. This
topology_parse_cpu_capacity() is called from init_cpu_topology(), move
call to init_cpu_topology() to later initialization  stage (after memory
allocation is available).

Note, this refers to ARM64 implementation, call init_cpu_topology() in
smp_prepare_cpus().

Tested on Qemu platform.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

---

In drivers/base/arch_topology.c: topology_parse_cpu_capacity():

	ret = of_property_read_u32(cpu_node, "capacity-dmips-mhz",
				   &cpu_capacity);
	if (!ret) {
		if (!raw_capacity) {
			raw_capacity = kcalloc(num_possible_cpus(),
					       sizeof(*raw_capacity),
					       GFP_KERNEL);
			if (!raw_capacity) {
				cap_parsing_failed = true;
				return false;
			}
---
 arch/riscv/kernel/smpboot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 3373df413c88..ddb2afba6d25 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
-	init_cpu_topology();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -48,6 +47,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	int ret;
 	unsigned int curr_cpuid;
 
+	init_cpu_topology();
+
 	curr_cpuid = smp_processor_id();
 	store_cpu_topology(curr_cpuid);
 	numa_store_cpu_info(curr_cpuid);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
