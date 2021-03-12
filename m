Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D16C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:46:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B5364FDD
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B5364FDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ccvmFro2/vAygswCHiPv/nClAnWvh1JkYu3SRaV/uvA=; b=j1Nf7yHr5rBZJNgR9nTI6JboWQ
	qfeFt9ajFDKi1loTiE3YVwTrZEJuwmlxlYf/uoUMp16aIStSSedSMVe5UqWarBb9IQCRJokPsgD7T
	2zdktx42EgwPXaOwOr8B+lmEn/3L+7MMIbUdXQwMiOLIOvuCrC1IuoQ8bFt7JNNHlEhFxiolgVzQB
	gmmt+A2ggpXFrOSALviGo9YFIzowppi6Frpn1cSSy9McQpTVAFQ2GMyy6Wct7HrFaImcZju9UedQb
	P7SMtWtePbsE3g3/O+4SNjdiNdvk7x+eN1iFGMoTGrJWj//UlmegJhm8cjAKqGaTsgTmVYWP2MCqa
	axsKQsVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKk00-00BrMn-5n; Fri, 12 Mar 2021 15:46:48 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjzu-00BrLT-DX
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 15:46:44 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f9e2:c536:b8cc:fbbc])
 by laurent.telenet-ops.be with bizsmtp
 id fTmc2400D1ACAb301Tmcmh; Fri, 12 Mar 2021 16:46:38 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lKjzn-0079iK-SM; Fri, 12 Mar 2021 16:46:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lKjzn-00ErPJ-8j; Fri, 12 Mar 2021 16:46:35 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] RISC-V: Fix out-of-bounds accesses in init_resources()
Date: Fri, 12 Mar 2021 16:46:34 +0100
Message-Id: <20210312154634.3541844-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_154643_095273_A5AEB627 
X-CRM114-Status: GOOD (  11.35  )
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

init_resources() allocates an array of resources, based on the current
total number of memory regions and reserved memory regions.  However,
allocating this array using memblock_alloc() might increase the number
of reserved memory regions.  If that happens, populating the array later
based on the new number of regions will cause out-of-bounds writes
beyond the end of the allocated array.

Fix this by allocating one more entry, which may or may not be used.

Fixes: 797f0375dd2ef5cd ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Tested on vexriscv, which works now using L1_CACHE_SHIFT = 6, too.

This issue may show up during early boot as:

    Unable to handle kernel paging request at virtual address c8000008
    Oops [#1]
    CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-orangecrab-00023-g7c4fc8e3e982-dirty #137
    epc: c04d6660 ra : c04d6560 sp : c05ddf70
     gp : c0678bc0 tp : c05e5b40 t0 : c8000000
     t1 : 00030000 t2 : ffffffff s0 : c05ddfc0
     s1 : c8000000 a0 : 00000000 a1 : c7ffffe0
     a2 : 00000005 a3 : 00000001 a4 : 0000000c
     a5 : 00000000 a6 : c04fe000 a7 : 0000000c
     s2 : c04fe098 s3 : 000000a0 s4 : c7ffff60
     s5 : c04fe0dc s6 : 80000200 s7 : c059f1d4
     s8 : 81000200 s9 : c059f1f0 s10: 80000200
     s11: c059f1d4 t3 : 405dbb60 t4 : c05e6f08
     t5 : 81000200 t6 : 40501000
    status: 00000100 badaddr: c8000008 cause: 0000000f
    random: get_random_bytes called from print_oops_end_marker+0x38/0x7c with crng_init=0
    ---[ end trace 0000000000000000 ]---

or much later as:

    Unable to handle kernel paging request at virtual address 69726573
---
 arch/riscv/kernel/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index e85bacff1b5075ee..f8f15332caa20263 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -147,7 +147,8 @@ static void __init init_resources(void)
 	bss_res.end = __pa_symbol(__bss_stop) - 1;
 	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
+	/* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
+	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt + 1) * sizeof(*mem_res);
 	mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
 	if (!mem_res)
 		panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
