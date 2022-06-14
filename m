Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0996C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL++GWLJrnkf/Spo4L26Vk3SloXx5YzSzoyUOCAPb24=; b=SbI0W5GKu8JvZ3
	2tC769nAAXy1h2YSas2BUUItZmE/PgMcgcW+qzWXSFiBPcaaG0YCbS/jZpiyZg+yvNLCFBKlB67Sh
	V2Wn3kmfH8mZJJD4FiPR9S+X9HyJUGTDkGUAQI6jRHOqChRaoA4v75lEIjF1sldWaHRAXtc2WuzaJ
	sWqkV1axvKhrvYQQoEfwguBBwKUcndM8yrrSd0M0/gdy156OnTMYWFuAEsl02bdNPN2Y3j4j+E7OT
	i5ygDfg/XXOm8ualcRRKMlMsdRwK2qAfIrLneOJLO2iFXI6npbfwkNh5wFJu6RQYQzbeXqOEcllRj
	v3tfoj564e/bNzZ6fcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12fB-008dDl-DM; Tue, 14 Jun 2022 09:16:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12Ql-008VNt-8y; Tue, 14 Jun 2022 09:01:49 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LMj783mwBzgZDS;
	Tue, 14 Jun 2022 16:59:48 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 14 Jun 2022 17:00:43 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 14 Jun 2022 17:00:41 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <corbet@lwn.net>, <will@kernel.org>, <ardb@kernel.org>,
	<catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<mawupeng1@huawei.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 5/5] memblock: Disable mirror feature if kernelcore is not specified
Date: Tue, 14 Jun 2022 17:21:56 +0800
Message-ID: <20220614092156.1972846-6-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614092156.1972846-1-mawupeng1@huawei.com>
References: <20220614092156.1972846-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_020147_736014_74E7CF29 
X-CRM114-Status: GOOD (  12.71  )
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

From: Ma Wupeng <mawupeng1@huawei.com>

If system have some mirrored memory and mirrored feature is not specified
in boot parameter, the basic mirrored feature will be enabled and this will
lead to the following situations:

- memblock memory allocation prefers mirrored region. This may have some
  unexpected influence on numa affinity.

- contiguous memory will be split into several parts if parts of them
  is mirrored memory via memblock_mark_mirror().

To fix this, variable mirrored_kernelcore will be checked in
memblock_mark_mirror(). Mark mirrored memory with flag MEMBLOCK_MIRROR iff
kernelcore=mirror is added in the kernel parameters.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 mm/internal.h   | 2 ++
 mm/memblock.c   | 3 +++
 mm/page_alloc.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index c0f8fbe0445b..ddd2d6a46f1b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -861,4 +861,6 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags);
 
 DECLARE_PER_CPU(struct per_cpu_nodestat, boot_nodestats);
 
+extern bool mirrored_kernelcore;
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memblock.c b/mm/memblock.c
index b1d2a0009733..a9f18b988b7f 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -924,6 +924,9 @@ int __init_memblock memblock_clear_hotplug(phys_addr_t base, phys_addr_t size)
  */
 int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
 {
+	if (!mirrored_kernelcore)
+		return 0;
+
 	system_has_some_mirror = true;
 
 	return memblock_setclr_flag(base, size, 1, MEMBLOCK_MIRROR);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e008a3df0485..10dc35ec7479 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
 static unsigned long required_movablecore __initdata;
 static unsigned long required_movablecore_percent __initdata;
 static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
-static bool mirrored_kernelcore __meminitdata;
+bool mirrored_kernelcore __initdata_memblock;
 
 /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
 int movable_zone;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
