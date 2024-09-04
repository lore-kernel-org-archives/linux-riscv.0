Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCE5CD37BD
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFmPdFt9yL7MnwLt1M5DSD9c3DICCflv0b/Lel+QArI=; b=2WORLHpFylgy9E
	4RRdhxpRLakYIfMy1WqniERPrSFzRr8O2psEIed56s/JuRlWxMZhkXE8wy6XA0vPAZnjuo+fBHnQJ
	RxrMcmlgf8e2mXE+R9u9oGayIgu38bhUcn/NudIdMVLeKxnkto53/IZ3eAeRiF5YlBFD966UPPt/z
	2oMZiU7Pox4aoYCF5Lvt+jUp2KN6G/mTD0sy7Y1k7ABGX3cbTs/R9d/eX74U+73Li0qEQBJr3INsP
	n7BND4ieHRqCeCnihWryjlaBui3d2y5m5WwpG5EVtqcv08CIGZLNjo0F4xIUbYQSQnplx0r2qzhyV
	K/2yhOloIqBOGRyYkm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slem0-00000002TOE-242h;
	Wed, 04 Sep 2024 01:25:28 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slelv-00000002TI1-3nlL
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 01:25:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wz4W568Pnz1xwwy;
	Wed,  4 Sep 2024 09:23:13 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 70E141A016C;
	Wed,  4 Sep 2024 09:25:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 09:25:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<charlie@rivosinc.com>, <mcgrof@kernel.org>, <dan.carpenter@linaro.org>,
	<rppt@kernel.org>, <alexghiti@rivosinc.com>, <kernel@esmil.dk>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] riscv: Use LIST_HEAD() to simplify code
Date: Wed, 4 Sep 2024 09:33:44 +0800
Message-ID: <20240904013344.2026738-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_182524_221840_97DC2603 
X-CRM114-Status: UNSURE (   7.89  )
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

list_head can be initialized automatically with LIST_HEAD()
instead of calling INIT_LIST_HEAD().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/kernel/module.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 906f9a3a5d65..1cd461f3d872 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -787,8 +787,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	int res;
 	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
 	struct hlist_head *relocation_hashtable;
-	struct list_head used_buckets_list;
 	unsigned int hashtable_bits;
+	LIST_HEAD(used_buckets_list);
 
 	hashtable_bits = initialize_relocation_hashtable(num_relocations,
 							 &relocation_hashtable);
@@ -796,8 +796,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	if (!relocation_hashtable)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&used_buckets_list);
-
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
