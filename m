Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68654C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMqMHcupNfPtwb7AaepHGEJqE1YNw3iCZ0ckQ+WuwOA=; b=VuTjxQXNvGD2sO
	CMGisiV7eJqCLsApGEZ/Do217GByDnlNf9carDy8sn8ybMY1lzHCTRrCmFq/1Og8T5Bm3A0kFONi2
	6rNf4dmq6Si/eWJbKNcqnYy2RpCo+z8pMDn+wkvR4tiOH3RI9t7yIeF82HpMJ7/UkNFdFVL9rreW8
	IkxfUXvNTs/sGRsfSnA2oLOzYAKb0Y2Useu57p1yGhnRPlz39CnU3uHL/9Yw3txCa4cye8s0wy+ND
	DNkcY8+UHlrNLP5MIF//a4LYRoDj33TngQKXkYe3zgG+68ANLAiP0tY/k65FrV4hkfbnHlQCIDK7Q
	c16W/y5iKkF+xL7+/+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f2H-0027rI-Fo; Mon, 13 Jun 2022 08:02:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f02-0026RJ-ED; Mon, 13 Jun 2022 08:00:43 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LM3q34Qssz1K9Sy;
	Mon, 13 Jun 2022 15:58:39 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:34 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:33 +0800
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
Subject: [PATCH v4 6/6] memblock: Disable mirror feature if kernelcore is not specified
Date: Mon, 13 Jun 2022 16:21:47 +0800
Message-ID: <20220613082147.183145-7-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613082147.183145-1-mawupeng1@huawei.com>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_010038_863157_D7CBCD5B 
X-CRM114-Status: GOOD (  12.42  )
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
index e008a3df0485..9b030aeb4983 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
 static unsigned long required_movablecore __initdata;
 static unsigned long required_movablecore_percent __initdata;
 static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
-static bool mirrored_kernelcore __meminitdata;
+bool mirrored_kernelcore __initdata;
 
 /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
 int movable_zone;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
