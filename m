Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vL2T4LP5H8sz9SIkRqGDwx8mByh6hJw0wBT+p0vpOis=; b=jRK8kHd6UwZfnr
	sM7dd39To7kNjD30kMsPtW6sknyOvjEvM1OjBZlJsIkN/ne5qczWxEsAe8YR5mFsPhD+2JxoGZwXk
	c4j63iqqcQWzr7jjgxTSWhxVWhY4azh0mUCN7qr5urM5xQCIW/9pucd15Az03u7tWNQZJxjK8sERg
	Zr+H2MpCQjqngoDPUGOWf8UltrHRPjqxng7+B3Uyp/ej9GPqLE8HnQm3JmAGTAqfZL/p3lyEZWJpG
	BIsHutcFBVkJJsy2pjffCRO032YIZCG+OEtk5P1SXy2T56EoglGNHHaIXdFRqwADn2Hm7J+j5HOMQ
	EFoP8B2uNd/eAkYoHi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoqE-00595r-Ug; Thu, 16 Dec 2021 11:22:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoi2-0055DZ-1v; Thu, 16 Dec 2021 11:14:04 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JF8ZQ0B4xz8vpZ;
 Thu, 16 Dec 2021 19:11:42 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:56 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:55 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <davem@davemloft.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH 0/4] mm: percpu: Cleanup percpu first chunk function
Date: Thu, 16 Dec 2021 19:23:55 +0800
Message-ID: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_031402_506361_20A3B213 
X-CRM114-Status: UNSURE (   6.72  )
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

When support page mapping percpu first chunk allocator on arm64, we
found there are lots of duplicated codes in percpu embed/page first
chunk allocator. This patchset is aimed to cleanup them and should
no function change. 

The currently supported status about 'embed' and 'page' in Archs shows
below,

embed: NEED_PER_CPU_PAGE_FIRST_CHUNK
page:  NEED_PER_CPU_EMBED_FIRST_CHUNK

	embed	page
------------------------
arm64	  Y	 Y
mips	  Y	 N
powerpc	  Y	 Y
riscv	  Y	 N
sparc	  Y	 Y
x86	  Y	 Y
------------------------

There are two interfaces about percpu first chunk allocator,

 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
                                size_t atom_size,
                                pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
-                               pcpu_fc_alloc_fn_t alloc_fn,
-                               pcpu_fc_free_fn_t free_fn);
+                               pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);


 extern int __init pcpu_page_first_chunk(size_t reserved_size,
-                               pcpu_fc_alloc_fn_t alloc_fn,
-                               pcpu_fc_free_fn_t free_fn,
-                               pcpu_fc_populate_pte_fn_t populate_pte_fn);
+                               pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);


The pcpu_fc_alloc_fn_t/pcpu_fc_free_fn_t is killed, we provide generic
pcpu_fc_alloc() and pcpu_fc_free() function, which are called in the
pcpu_embed/page_first_chunk().

1) For pcpu_embed_first_chunk(), pcpu_fc_cpu_to_node_fn_t is needed to be
   provided when archs supported NUMA.
2) For pcpu_page_first_chunk(), the pcpu_fc_populate_pte_fn_t is killed too,
   a generic pcpu_populate_pte() which marked '__weak' is provided, if you
   need a different function to populate pte on the arch(like x86), please
   provide its own implementation.

I have been built test on arm64/ia64/mips/powerpc/sparcx86/riscv based
on v5.16-rc4 on my machine, also all patches are in[1], which checked
by lkp too,
  [kevin78:percpu-cleanup] BUILD SUCCESS c14a59a0aad7db88ebddbeb5e914ddcccb406e1c.

[1] https://github.com/kevin78/linux.git percpu-cleanup

Changes since RFC
- Address Dennis's comments 

RFC:
https://lore.kernel.org/linux-mm/4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com/T/

Kefeng Wang (4):
  mm: percpu: Generalize percpu related config
  mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
  mm: percpu: Add generic pcpu_fc_alloc/free funciton
  mm: percpu: Add generic pcpu_populate_pte() function

 arch/arm64/Kconfig             |  20 +----
 arch/ia64/Kconfig              |   9 +-
 arch/mips/Kconfig              |  10 +--
 arch/mips/mm/init.c            |  14 +--
 arch/powerpc/Kconfig           |  17 +---
 arch/powerpc/kernel/setup_64.c |  97 ++-------------------
 arch/riscv/Kconfig             |  10 +--
 arch/sparc/Kconfig             |  12 +--
 arch/sparc/kernel/smp_64.c     | 103 +---------------------
 arch/x86/Kconfig               |  17 +---
 arch/x86/kernel/setup_percpu.c |  66 ++------------
 drivers/base/arch_numa.c       |  68 +--------------
 include/linux/percpu.h         |  13 +--
 mm/Kconfig                     |  12 +++
 mm/percpu.c                    | 154 +++++++++++++++++++++++++--------
 15 files changed, 180 insertions(+), 442 deletions(-)

-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
