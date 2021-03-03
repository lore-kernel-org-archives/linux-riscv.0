Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3089AC433E6
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 22:28:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956F564EEF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 22:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 956F564EEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8tN61XAxL2e7NtoKrHd3+WKkNGqD+UfUhdXIVp7SZd4=; b=Iik29x5cGjxltWHWVQhHgJ2fO
	uH30hdvqxS9vmD+6ziQ50tOqMoatXWvpgA7PaS3JIlpjBWUNlgy1e3lMKxQnJTgY0289eCrABa4eB
	cJ4gWPgWYWT8eFy3Spoi2mUhYvUlYKvlF7GnHdF+qiAiTKCFcCtoKAAozzQjYgKLx93vz55YBV1xG
	HWi0WPBMP1O5xOi0b9IWwQxvUourm0ItqQtXDv6yncJnXdeVzdjVA6cgVP5WVgDIVjhKOLLOKcgHu
	Dr6wVylLjbieu63yYfyEqqYNy0LtKQvmim935/uQai0IByez7f1niBT+MTjiUrwehfTugsKZEX1RA
	qvJuu7Amw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZya-006l4s-DJ; Wed, 03 Mar 2021 22:28:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAz-005Kn4-KG; Wed, 03 Mar 2021 15:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=OyBUGy1JvVG2FfVS+8WUNejhry9Y6dTtVf8qk90wxcQ=; b=jSHxgB6x2xoI36sKYC4i7ZqO0o
 uIMBylD5j4o9gJeu+cyk99dBN5k1HZ5wnBTY3n3hZ8kJEaTUVcNOIGP8BZksX6z+n4WqJX/rvjYMa
 xGeo++RbHpeDnLd5nMp2p+7yDqcZyV/jxLKhq8k2qRt5KoRUOMEwejMEY7O6j5gU+fYPqHnEGLzJ3
 oCG+kgN/CHmRuzR7veNKjrfHtxsZjSrdrI7ffmFoAiX0tcnzIyPGfyaQt+m9RvsiZfvYShHsQjRyQ
 Idf5aHMANzN1WxD7ujqMgRWkKGOpDZRP4v7IyU7HjKy1ScccRu4iWvp6/KloS7u+PlcSfZIEoLUdF
 5ZGoWl6Q==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLoI-001eYj-OX; Wed, 03 Mar 2021 07:20:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dr5270f0CzMgPf;
 Wed,  3 Mar 2021 15:18:23 +0800 (CST)
Received: from ubuntu-82.huawei.com (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 15:20:23 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
 <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>,
 <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, 
 <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
CC: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <frowand.list@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>,
 <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH stable v5.10 4/7] of: unittest: Add test for
 of_dma_get_max_cpu_address()
Date: Wed, 3 Mar 2021 15:33:16 +0800
Message-ID: <20210303073319.2215839-5-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_072043_680932_F98F0B56 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

commit 07d13a1d6120d453c3c1f020578693d072deded5 upstream

Introduce a test for of_dma_get_max_cup_address(), it uses the same DT
data as the rest of dma-ranges unit tests.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20201119175400.9995-5-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/of/unittest.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 06cc988faf78..98cc0163301b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -869,6 +869,23 @@ static void __init of_unittest_changeset(void)
 #endif
 }
 
+static void __init of_unittest_dma_get_max_cpu_address(void)
+{
+	struct device_node *np;
+	phys_addr_t cpu_addr;
+
+	np = of_find_node_by_path("/testcase-data/address-tests");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	cpu_addr = of_dma_get_max_cpu_address(np);
+	unittest(cpu_addr == 0x4fffffff,
+		 "of_dma_get_max_cpu_address: wrong CPU addr %pad (expecting %x)\n",
+		 &cpu_addr, 0x4fffffff);
+}
+
 static void __init of_unittest_dma_ranges_one(const char *path,
 		u64 expect_dma_addr, u64 expect_paddr)
 {
@@ -3266,6 +3283,7 @@ static int __init of_unittest(void)
 	of_unittest_changeset();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
+	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
 	of_unittest_match_node();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
