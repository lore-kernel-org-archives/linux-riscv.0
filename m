Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD316C433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F9B20658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skqF5Ito";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pRN8QE/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F9B20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RjzoVd+wy8vE//Vwuoh36hKHYvA5OGlb3IBcKk4410M=; b=skqF5Ito6lN6Wl4qWFKi+XwfA
	/gyFnz5b2DSpqNDoFk9+DhcSN65ivUdeVCk1NpdFJw2oNGiz6pV588PL6tXszjELlyKLw7InfRfif
	9DeXDRAYYBjP12Qyu5KqiuuzABfz4YSUqASL+27AswnypQLIxWZhFlfzLp20hzq7M++mT8BehCnbU
	7bkz57Smm2LFEfS0foSBxhOXVH5uI9rlP1yGXT4f97Bk5g39FjRZfCW2fHPHSOgExxBQphC70Z0Vy
	KVcHPhX7a/oRGR8GMg+C0Gy+tif4UTWYbk7EDh+RV119u0eac0E9sA0kkdBaQCANE4TWeptda15wU
	yhayYSanw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqr3-00072r-QN; Wed, 15 Jul 2020 23:30:25 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqqz-00070Y-PM
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 23:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594855824; x=1626391824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=twVd2hS4vHLegZi/5Yb2c/TlDfLbVg6CqN55yP8mnGU=;
 b=pRN8QE/i9Tn5deSc/bMF9aPUKO2U+8f8M0BQDGwvwIJvt8W2/8W3i2eC
 UzWux2E7PboduthcIy5GXTgbmmdCpjZLcDFJcMhh0jrratC/Nspcr1XCl
 zDP9UjfP5jcJ1Rx7K0QkSkL/L6iUuTKOO4M3shBG2SVsKXeltyUm7mHlu
 PMVoL00dPo05W4mjTarUoMIf7t4KKGIxCEwcWbxENbPMx0ZHWwLqsfYjd
 Jf1t6LrfHpr4QGxYo4tg8ziWDg5ayfQsjw4WJelRPOxvQhMjwrzjabtxL
 OwGe+G5iAE9AgIcFJ/qbo8+SPMV7i678ONVKT9kGij9P+knN4/FSNd+mt Q==;
IronPort-SDR: gobyFW7pzdHP4A5YS/M3cKRwn1LGsQ3LQKlI8ZoEG4ehUZyvCwZNO1ffTpQ11gB5Fk/VG53XKJ
 8fdLL5HhCYX+PeR9Lm0VnysiH94INOJtny1iNC+gHw9kxB80efC2mHJgiS5Hwmzyy5U3fqyNQE
 tUQ9C+K1XTMdPrubs30Cr/dzHV5mTirDihNUAYtvbWySK0iElQmaUVOCFZidUj8mEpdwDZ0frC
 z8rFyp4WNvKX1J8LhtDwk5zJqthLq7e6kB62r8cvDKqM7XSTKzwR7Zp1FhmlWpmXKZSSMRfUUg
 Lwc=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="245592882"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:30:23 +0800
IronPort-SDR: iI5dC46/GZmQahlQhsQj7b6Qso2xrrtbypGUPDeX1E3CDf2V/mSWLJKAfxuoNetFBk94gGnge9
 54mkdXCjF+uHTrHHwH/0ZTTWOn0CdXxR4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 16:18:13 -0700
IronPort-SDR: 1TTYe0RSrUU0ahO9ycR7q0BEobnWgWFg1uIOeSBYtrEvYohsOdcY2b28Lv3l2aiAAIgzG22WQB
 HIGAlkAB8iAA==
WDCIronportException: Internal
Received: from cnf009656.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 16:30:19 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] RISC-V: Do not rely on initrd_start/end computed during
 early dt parsing
Date: Wed, 15 Jul 2020 16:30:08 -0700
Message-Id: <20200715233009.27183-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200715233009.27183-1-atish.patra@wdc.com>
References: <20200715233009.27183-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_193021_974397_D6E7BCE4 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, initrd_start/end are computed during early_init_dt_scan
but used during arch_setup. We will get the following panic if initrd is used
and CONFIG_DEBUG_VIRTUAL is turned on.

[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at arch/riscv/mm/physaddr.c:33!
[    0.000000] Kernel BUG [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc4-00015-ged0b226fed02 #886
[    0.000000] epc: ffffffe0002058d2 ra : ffffffe0000053f0 sp : ffffffe001001f40
[    0.000000]  gp : ffffffe00106e250 tp : ffffffe001009d40 t0 : ffffffe00107ee28
[    0.000000]  t1 : 0000000000000000 t2 : ffffffe000a2e880 s0 : ffffffe001001f50
[    0.000000]  s1 : ffffffe0001383e8 a0 : ffffffe00c087e00 a1 : 0000000080200000
[    0.000000]  a2 : 00000000010bf000 a3 : ffffffe00106f3c8 a4 : ffffffe0010bf000
[    0.000000]  a5 : ffffffe000000000 a6 : 0000000000000006 a7 : 0000000000000001
[    0.000000]  s2 : ffffffe00106f068 s3 : ffffffe00106f070 s4 : 0000000080200000
[    0.000000]  s5 : 0000000082200000 s6 : 0000000000000000 s7 : 0000000000000000
[    0.000000]  s8 : 0000000080011010 s9 : 0000000080012700 s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : 000000000001fe30 t4 : 000000000001fe30
[    0.000000]  t5 : 0000000000000000 t6 : ffffffe00107c471
[    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] random: get_random_bytes called from print_oops_end_marker+0x22/0x46 with crng_init=0

To avoid the error, initrd_start/end can be computed from phys_initrd_start/size
in setup itself. It also improves the initrd placement by aligning the start
and size with the page size.

Fixes: 6435f773d81f (riscv: mm: add support for CONFIG_DEBUG_VIRTUAL)
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8d22973bde40..f818a47a72d1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -95,19 +95,40 @@ void __init mem_init(void)
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
+	phys_addr_t start;
 	unsigned long size;
 
-	if (initrd_start >= initrd_end) {
-		pr_info("initrd not found or empty");
+	/* Ignore the virtul address computed during device tree parsing */
+	initrd_start = initrd_end = 0;
+
+	if (!phys_initrd_size)
+		return;
+	/*
+	 * Round the memory region to page boundaries as per free_initrd_mem()
+	 * This allows us to detect whether the pages overlapping the initrd
+	 * are in use, but more importantly, reserves the entire set of pages
+	 * as we don't want these pages allocated for other purposes.
+	 */
+	start = round_down(phys_initrd_start, PAGE_SIZE);
+	size = phys_initrd_size + (phys_initrd_start - start);
+	size = round_up(size, PAGE_SIZE);
+
+	if (!memblock_is_region_memory(start, size)) {
+		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
+		       (u64)start, size);
 		goto disable;
 	}
-	if (__pa_symbol(initrd_end) > PFN_PHYS(max_low_pfn)) {
-		pr_err("initrd extends beyond end of memory");
+
+	if (memblock_is_region_reserved(start, size)) {
+		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
+		       (u64)start, size);
 		goto disable;
 	}
 
-	size = initrd_end - initrd_start;
-	memblock_reserve(__pa_symbol(initrd_start), size);
+	memblock_reserve(start, size);
+	/* Now convert initrd to virtual addresses */
+	initrd_start = (unsigned long)__va(phys_initrd_start);
+	initrd_end = initrd_start + phys_initrd_size;
 	initrd_below_start_ok = 1;
 
 	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
