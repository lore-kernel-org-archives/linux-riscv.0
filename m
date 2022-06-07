Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06385C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kD5cMMxOr7WBM3ihX0MU6Y2oVoufSHAYE8MWkYgUzs=; b=bl4M5N6vxFkrKp
	EtUBNE6buxIjvqfZ+0BaHqsm6wPEkbOA7Jncxjqjqj8bumU6/ubMOmJJxovkaqpIG0EtT7LaxUWGS
	v4T/tnpHTWNa5k02pnP1NO/qaeq8t6/q2uS84aCOzv81SMBEy8NGqHxOaBa8CBcfCDfQyjz8aZKG2
	B4jWuqc4KxkeyJm2pHicSlRMA1wCrGow0SlIGE3d6PZhIdSMHx1GxpevF521uaLP5rOtBX1s3HIR9
	kYDjufzJ16G0c/OMQ+92zl3o/a0wHnx3Ghz7r1zc+75PnREGxaiMESKlm8oQKJU3Z7nM74kWZTlWg
	JatQjEOxVsFN6g5UkYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVdC-006Hbx-Ez; Tue, 07 Jun 2022 09:36:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKr-0068n6-4q; Tue, 07 Jun 2022 09:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/g+TAC9AohIKbBhCH909PGl0acKhOq6taPJcYK6MzTs=; b=J4Tu5C+NqHrqwNK4Lwmk7PQW89
	vzQw2lrRRYNnt8EJidtLziy0GREV9Xk0IzJOCIRUCnUzuz04k4VZogzMqoshQbYra6uuUFK4o60BT
	OESZM4MUWwP+Az+LPWeDMBI5IlFtHSguncH/3XJnzNFdml0pRR03SEbdNeEVAJ7ECFo3qOalpHEhe
	AJ7rNDgunZ9cAnmS8SANCFjmxPLVU0km5flAapDKCSNn4mcthxitv1ggtoJ5QXVPE84mTP8aG0/p9
	wIaERm2yaJNE7zWRb3+VtCF0U/wft02kjetUlchO9CN8ggQVtKGYMfcW+cuF7qssajcEAlYJz34Lw
	XLTN6OEA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKk-005h1C-SF; Tue, 07 Jun 2022 09:17:11 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LHPpY6XYQzjdM9;
	Tue,  7 Jun 2022 17:15:33 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:52 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:51 +0800
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
Subject: [PATCH v3 6/6] efi: Disable mirror feature if kernelcore is not specified
Date: Tue, 7 Jun 2022 17:38:05 +0800
Message-ID: <20220607093805.1354256-7-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607093805.1354256-1-mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_101708_366616_A08C386E 
X-CRM114-Status: GOOD (  13.00  )
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

To fix this, variable mirrored_kernelcore will be checked before calling
efi_find_mirror() which will enable basic mirrored feature and this
variable is true if kernelcore=mirror is added in the kernel parameters.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
---
 drivers/firmware/efi/efi.c | 3 +++
 include/linux/mm.h         | 2 ++
 mm/page_alloc.c            | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 79c232e07de7..8a5edcb0dd82 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -454,6 +454,9 @@ void __init efi_find_mirror(void)
 	if (!efi_enabled(EFI_MEMMAP))
 		return;
 
+	if (!mirrored_kernelcore)
+		return;
+
 	for_each_efi_memory_desc(md) {
 		unsigned long long start = md->phys_addr;
 		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc8f326be0ce..741ac7d022c3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2540,6 +2540,8 @@ extern void get_pfn_range_for_nid(unsigned int nid,
 			unsigned long *start_pfn, unsigned long *end_pfn);
 extern unsigned long find_min_pfn_with_active_regions(void);
 
+extern bool mirrored_kernelcore;
+
 #ifndef CONFIG_NUMA
 static inline int early_pfn_to_nid(unsigned long pfn)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e008a3df0485..cf6f70aba787 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
 static unsigned long required_movablecore __initdata;
 static unsigned long required_movablecore_percent __initdata;
 static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
-static bool mirrored_kernelcore __meminitdata;
+bool mirrored_kernelcore __meminitdata;
 
 /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
 int movable_zone;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
