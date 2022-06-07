Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E0ACCA47C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l6OfVSpIZgRtZN1KCC3D+zIOBHmxR0A4SbqjmNlE1A=; b=x6pCvj9kbEgJFH
	XJx/ST/IBtIn0o0+LEz4I87kcDri4VfnwD1zp9yhLMg9v9J1K8h6rzBHJM2sHilI5NMG6U8gvmpAA
	A4azIMJwklsksUInj/gyLOtbPB8D6qK3Pg2K8Iysdf5zOQ/r5/7l4PJrVYcbw1eqaD56YKZHCSE30
	+AT6gYb8aZBwxSEBAIL3c1P0+cthqCITVsHhDRhCuI9L9DRDv53oF4i2xTe59n6mSWAkurg92HaZw
	MNpRXhEUoFkTCOft80WOaiiX30Aul/JOvL/3efwxtPEyZKti/PCkX1XVu7QL8mIos3Q90VP9Uug0t
	iwsgXGkdQ1ZJEe4OEZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVbA-006GRl-5c; Tue, 07 Jun 2022 09:34:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKW-0068UQ-J9; Tue, 07 Jun 2022 09:17:05 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LHPpS5pBrzjcSw;
	Tue,  7 Jun 2022 17:15:28 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:47 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:45 +0800
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
	<chenzhou10@huawei.com>, <vijayb@linux.microsoft.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-efi@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 3/6] mm: Ratelimited mirrored memory related warning messages
Date: Tue, 7 Jun 2022 17:38:02 +0800
Message-ID: <20220607093805.1354256-4-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607093805.1354256-1-mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_021652_910972_FED1A4D8 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Ma Wupeng <mawupeng1@huawei.com>

If system has mirrored memory, memblock will try to allocate mirrored
memory firstly and fallback to non-mirrored memory when fails, but if with
limited mirrored memory or some numa node without mirrored memory, lots of
warning message about memblock allocation will occur.

This patch ratelimit the warning message to avoid a very long print during
bootup.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
---
 mm/memblock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index e4f03a6e8e56..b1d2a0009733 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -327,7 +327,7 @@ static phys_addr_t __init_memblock memblock_find_in_range(phys_addr_t start,
 					    NUMA_NO_NODE, flags);
 
 	if (!ret && (flags & MEMBLOCK_MIRROR)) {
-		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
+		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
 			&size);
 		flags &= ~MEMBLOCK_MIRROR;
 		goto again;
@@ -1384,7 +1384,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
 
 	if (flags & MEMBLOCK_MIRROR) {
 		flags &= ~MEMBLOCK_MIRROR;
-		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
+		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
 			&size);
 		goto again;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
