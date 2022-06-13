Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F4C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9VE4waSSEigDorsZPVLRHtlWGirb6IORoL/lRubWc8=; b=Kjhvqh8QM7QLn2
	gTVDgcGPNDcXGJB07WvzX4sVqeM8lJFn7NRFt3adFi8jbMMfzrz89Gyq1m0jrcTwUIDotx/K85ZNs
	yxiSocUyYkVWo9yZcUcY0HKQxd7s6x3Fueuh1rJQdvOS2maYZCjNSA85/tiws4MjSNttpqYzKBwcU
	CZ5CA5ck+Z4yc1hA18xS5gq2sHs9hfMxF/xA8oqnVajwpj8digRqIFSexal1GX7TkMsXdWH+dJJ37
	uvZ1VrFPo57SaHYz4tq449CMvvsxlyDF3NQVopSHN+Oh11nJjm2jF3dPwjPwm2/Y1bJPy5bAAFK7A
	NmpQUWunNuW1h5f1GY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f36-0028MX-PE; Mon, 13 Jun 2022 08:03:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f0N-0026cG-1J; Mon, 13 Jun 2022 08:01:00 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LM3sF3Gy1zDqtf;
	Mon, 13 Jun 2022 16:00:33 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:30 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:28 +0800
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
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, Mike Rapoport
	<rppt@linux.ibm.com>
Subject: [PATCH v4 3/6] mm: Ratelimited mirrored memory related warning messages
Date: Mon, 13 Jun 2022 16:21:44 +0800
Message-ID: <20220613082147.183145-4-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613082147.183145-1-mawupeng1@huawei.com>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_010059_321646_A821AAA7 
X-CRM114-Status: UNSURE (   9.69  )
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
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
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
