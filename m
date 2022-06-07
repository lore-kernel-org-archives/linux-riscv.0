Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52E7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeNItcJRrX4L4ZzHJ0GDSVivfNcmGrdFwXs3Wqshn8k=; b=SPsbAxDoIHFYpY
	sOeuoWaJPmQoEiL7f4YQkxmLrxjLAY3pn7T/koX6gkCbTqZp+hflPfhL+EsrazrexJqRXf+OQ5bO7
	S6tlBf2bjMKgqc91mroYx36UXF/dNJZm1mV9uvmFDDhmc4SMxGbcGJOdQwKPw4YGjRbGqzuMowEnv
	pE/Y8SSFJGDM2+S09pBviuGHDhw4rI2Sxtxo2pJX87DCzRCjg9vPRY+I1N7n7D99O3gmuVoMtkKDs
	G3dCSaaxNUmMf2dN2iyjK0giZqI5yh/80WLW/wgghyx80t2yn6F8ge/J7+lTgUapRKy78fzo2w7iz
	BsOBRyUAu9SL5XVzecQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVd5-006HXF-8I; Tue, 07 Jun 2022 09:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKr-0068n8-50; Tue, 07 Jun 2022 09:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HDU2Agi0cs0BJssyx6bBcVmtFTZ1ejcwUslok/HBdMI=; b=Kaxdjrn2K0gv9M5Uothriugp+4
	T6ZWNnUrtSfHkuXYQSvfLwZWB8qiCAKBRH1ErweTmyPIMzpGpGsrJuY5uCAeyHY1aE17SiAzJ9Ryb
	q9Sq2kpL1CJivRDHqls8HV13PGKGXmIr1B4XqJUZGiLSjOmOArm1zwC+3HE6CQZvQNO0m2F+bkYXc
	3YVvNkC+8gSKcmO2qMzHY8JhreeJBFZiVKqFZBtyGlWTBYu05kOXF5cy1CCU5V0txG4Fl2WjGh4cD
	UDXuyp2Gj2hZCItbFLmBBS3/y1HvTTWaFmWwlwtINDqcVfMScDtbmiQhvjpg5ukzwAk4CUoaDntma
	kVIxvFiQ==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKl-005h18-82; Tue, 07 Jun 2022 09:17:11 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LHPqj4SWXzpXwZ;
	Tue,  7 Jun 2022 17:16:33 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:51 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:49 +0800
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
Subject: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
Date: Tue, 7 Jun 2022 17:38:04 +0800
Message-ID: <20220607093805.1354256-6-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607093805.1354256-1-mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_101708_890702_F4A28BD0 
X-CRM114-Status: GOOD (  12.05  )
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

Initrd memory will be removed and then added in arm64_memblock_init() and this
will cause it to lose all of its memblock flags. The lost of MEMBLOCK_MIRROR
flag will lead to error log printed by find_zone_movable_pfns_for_nodes if
the lower 4G range has some non-mirrored memory.

In order to solve this problem, the lost MEMBLOCK_MIRROR flag will be
reinstalled if the origin memblock has this flag.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
---
 arch/arm64/mm/init.c     |  9 +++++++++
 include/linux/memblock.h |  1 +
 mm/memblock.c            | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 339ee84e5a61..11641f924d08 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -350,9 +350,18 @@ void __init arm64_memblock_init(void)
 			"initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
 			phys_initrd_size = 0;
 		} else {
+			int flags, ret;
+
+			ret = memblock_get_flags(base, &flags);
+			if (ret)
+				flags = 0;
+
 			memblock_remove(base, size); /* clear MEMBLOCK_ flags */
 			memblock_add(base, size);
 			memblock_reserve(base, size);
+
+			if (flags & MEMBLOCK_MIRROR)
+				memblock_mark_mirror(base, size);
 		}
 	}
 
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..3d6a382ac9c8 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -487,6 +487,7 @@ bool memblock_is_map_memory(phys_addr_t addr);
 bool memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
 bool memblock_is_reserved(phys_addr_t addr);
 bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
+int memblock_get_flags(phys_addr_t base, int *flags);
 
 void memblock_dump_all(void);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index b1d2a0009733..0c5b5699af6e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1796,6 +1796,26 @@ int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
 	return memblock_get_region_node(&type->regions[mid]);
 }
 
+/**
+ * memblock_get_flags - get a single memblock flags
+ * @base: base of memeblock to get
+ *
+ * Get the flags of memeblock with base: @base
+ *
+ * Return:
+ * 0 if ok, non-zero if fail
+ */
+int __init_memblock memblock_get_flags(phys_addr_t base, int *flags)
+{
+	int idx = memblock_search(&memblock.memory, base);
+
+	if (idx == -1)
+		return -EINVAL;
+
+	*flags = memblock.memory.regions[idx].flags;
+	return 0;
+}
+
 /**
  * memblock_is_region_memory - check if a region is a subset of memory
  * @base: base of region to check
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
