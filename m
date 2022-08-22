Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276AC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvRVIScTPLdT612D/CTi9eN187CfVcx8N+j+2nk9uj4=; b=YeqEVhGjJQfUMG
	W/r+RPsO4glGwxu9tvHWY3auibJaxP3qRVOdArj6pgH8l7OZb43JPEb+buZKGs6no8sCEl5f+xsZK
	4hoWIC4iOaZlBQKPxu7xWonmFkVqdRNz0yJnRxcPGeEB7ByG9IILZui99mGQaVoKmfpmRFsLoZ2wD
	mZpkyjIo0mIfzSYrP7WJ+wRl7nHWuAU+/veDXnTsjggMFqLA2xXPswfcXtM4L02RBG8OmH8HDJftg
	fb3JRx8qgLT0gQ7ytal7WHIJoADxwbnTgM9/WJz8qFtKNCoqxU7p4Jf9wcgN3XWi+cHDGyln6pMVE
	YwUNQXvn2EWrlrNMj/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2zP-006ZoE-U8; Mon, 22 Aug 2022 08:40:56 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2if-006QGc-Eg; Mon, 22 Aug 2022 08:23:44 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MB4zR2LXtz1N7HW;
	Mon, 22 Aug 2022 16:20:03 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:23:30 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <anshuman.khandual@arm.com>, Barry Song
	<v-songbaohua@oppo.com>
Subject: [PATCH v3 1/4] Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
Date: Mon, 22 Aug 2022 16:21:17 +0800
Message-ID: <20220822082120.8347-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220822082120.8347-1-yangyicong@huawei.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_012338_172702_D9D2481C 
X-CRM114-Status: GOOD (  11.76  )
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

From: Barry Song <v-songbaohua@oppo.com>

This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.

I was wrong. Though ARM64 has hardware TLB flush, but it is not free
and it is still expensive.
We still have a good chance to enable batched and deferred TLB flush
on ARM64 for memory reclamation. A possible way is that we only queue
tlbi instructions in hardware's queue. When we have to broadcast TLB,
we broadcast it by dsb. We just need to get adapted the existing
BATCHED_UNMAP_TLB_FLUSH.

Tested-by: Xin Hao <xhao@linux.alibaba.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/features/arch-support.txt        | 1 -
 Documentation/features/vm/TLB/arch-support.txt | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
index 118ae031840b..d22a1095e661 100644
--- a/Documentation/features/arch-support.txt
+++ b/Documentation/features/arch-support.txt
@@ -8,5 +8,4 @@ The meaning of entries in the tables is:
     | ok |  # feature supported by the architecture
     |TODO|  # feature not yet supported by the architecture
     | .. |  # feature cannot be supported by the hardware
-    | N/A|  # feature doesn't apply to the architecture
 
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 039e4e91ada3..1c009312b9c1 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | N/A  |
+    |       arm64: | TODO |
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
