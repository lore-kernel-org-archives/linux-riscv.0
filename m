Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2538C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4633A239EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4633A239EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PKZiNVnTxnITmDYsh/PhLUBV8KvEjqRrg0An0vHfog=; b=Mkvw3++pkhuv2vBiTtTrWdxZK
	hYqLJeuo560xgUxKDUBar8bieT7I+UXquWXSCjHALa6ItfKt4vudDQEUw6+EXwy2oYgDRpZqnpW+3
	RhvC23D+cmMXTIpzsEL3gx5bAng52UnossgXdo5Gp3iDxzwbjWZhJEurDTue2V4QHjMrWaYP8RsDP
	xiTc1gREEx3lshOLjtlz6hfGwkgW/vKi2aMS7TkcQIRr5vHV6ey2iosb8ZAd7jBitm4Cb9VYCf63g
	CE/wgV6/AzJXkjCeXj6GKPn/p42E8rf4T+gPmK0XkcjCU6STrpOrEIfUoz8qbJnVBYE1O3CRm1GQE
	EY3QFjT1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0HrC-0002F3-MD; Fri, 15 Jan 2021 05:41:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Hr4-0002CE-6o; Fri, 15 Jan 2021 05:41:04 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH9431tJJzj7ns;
 Fri, 15 Jan 2021 13:39:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 13:40:42 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v3 3/4] ARM: Covert to reserve_initrd_mem()
Date: Fri, 15 Jan 2021 13:46:05 +0800
Message-ID: <20210115054606.124502-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_004102_540890_91B54BE5 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: guoren@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Covert to the generic reserve_initrd_mem() function.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm/mm/init.c | 43 +------------------------------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 828a2561b229..a29e14cd626c 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -153,47 +153,6 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
 	return phys;
 }
 
-static void __init arm_initrd_init(void)
-{
-#ifdef CONFIG_BLK_DEV_INITRD
-	phys_addr_t start;
-	unsigned long size;
-
-	initrd_start = initrd_end = 0;
-
-	if (!phys_initrd_size)
-		return;
-
-	/*
-	 * Round the memory region to page boundaries as per free_initrd_mem()
-	 * This allows us to detect whether the pages overlapping the initrd
-	 * are in use, but more importantly, reserves the entire set of pages
-	 * as we don't want these pages allocated for other purposes.
-	 */
-	start = round_down(phys_initrd_start, PAGE_SIZE);
-	size = phys_initrd_size + (phys_initrd_start - start);
-	size = round_up(size, PAGE_SIZE);
-
-	if (!memblock_is_region_memory(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
-		       (u64)start, size);
-		return;
-	}
-
-	if (memblock_is_region_reserved(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region - disabling initrd\n",
-		       (u64)start, size);
-		return;
-	}
-
-	memblock_reserve(start, size);
-
-	/* Now convert initrd to virtual addresses */
-	initrd_start = __phys_to_virt(phys_initrd_start);
-	initrd_end = initrd_start + phys_initrd_size;
-#endif
-}
-
 #ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
 void check_cpu_icache_size(int cpuid)
 {
@@ -215,7 +174,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
-	arm_initrd_init();
+	reserve_initrd_mem();
 
 	arm_mm_memblock_reserve();
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
