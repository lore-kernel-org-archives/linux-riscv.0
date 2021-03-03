Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A56C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 20:29:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B38E64EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 20:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B38E64EF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jix9+3vfdVBA3J3tXXSEtywM2LNc2Gv5/4EtJcwZbxQ=; b=okoswCeFBkEZQG68Jv5GsDkjD
	r/ggDcGjc4kHB3lWni23X/NnK3Q4U0VdYlHn7IEiGQEnV2amGvGGuhFoeVsMCj32dgxgddSUeroiK
	QB722RARFf2YecCSZwNTlp+gjymXspZELAD9eSlU/sYzhT1Ldo221VRYSDoVfThrhNvCYuHV2/0zj
	B1ZVVP8l9qHzxmTJqGH4VTSmHUXLqsMs32TgbfpAkQeamZ6+9+o8XPc0sp32/TJHnfJNZyQkrYIXt
	MW4q3/TTwtIT1kh78lyrxYNYaJxozfnF4RFd2aqPDBy4SBNtxBI2MoDklPsXPYlW2mMil37UgSe18
	SZM84HyBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHY7K-006Q1e-Fy; Wed, 03 Mar 2021 20:29:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT5b-005IoA-C9; Wed, 03 Mar 2021 15:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=lwG8rNchQ7g+iAJHSOjXlAevdi8/PajULSmg4+o0Ork=; b=WkMCwkdTnTJ2+6XpF0sXYwWkkf
 B8Qe/mLm3E6jVbDqpAFFGPZ5Mov/7zdWQ5E5MSlLpoms5FMRkXlwzwZr5S5GyUYwtTMFiFI90E0fz
 +D2PcWutdP5oblQ6oS2fhZRc3emTSLV+5wK999Ay4c4SDWxoSH72F80QdvlbZ1K9SnJBlCkXr4GRP
 KGNulm1211mVN5xd57+BN5qFkN3hV8oU5LMh7bci9jgP3rgMQpTGxQsWIZniW20+6oT2c9km16dbM
 ok/iVNPdoR6+GYvHihECiT+dEIeP29+yiW4Ce/rMW5EGFyh7KCyCQgGOHXXR7H+mfb6re0JkC2MVg
 gBJhVc4Q==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLoL-001eZF-G4; Wed, 03 Mar 2021 07:20:46 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dr5361dK8zjTJM;
 Wed,  3 Mar 2021 15:19:14 +0800 (CST)
Received: from ubuntu-82.huawei.com (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 15:20:27 +0800
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
 <wangkefeng.wang@huawei.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH stable v5.10 7/7] mm: Remove examples from enum zone_type
 comment
Date: Wed, 3 Mar 2021 15:33:19 +0800
Message-ID: <20210303073319.2215839-8-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_072046_339681_FF420375 
X-CRM114-Status: UNSURE (   7.10  )
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

commit 04435217f96869ac3a8f055ff68c5237a60bcd7e upstream

We can't really list every setup in common code. On top of that they are
unlikely to stay true for long as things change in the arch trees
independently of this comment.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/r/20201119175400.9995-8-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 include/linux/mmzone.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index fb3bf696c05e..9d0c454d23cd 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -354,26 +354,6 @@ enum zone_type {
 	 * DMA mask is assumed when ZONE_DMA32 is defined. Some 64-bit
 	 * platforms may need both zones as they support peripherals with
 	 * different DMA addressing limitations.
-	 *
-	 * Some examples:
-	 *
-	 *  - i386 and x86_64 have a fixed 16M ZONE_DMA and ZONE_DMA32 for the
-	 *    rest of the lower 4G.
-	 *
-	 *  - arm only uses ZONE_DMA, the size, up to 4G, may vary depending on
-	 *    the specific device.
-	 *
-	 *  - arm64 has a fixed 1G ZONE_DMA and ZONE_DMA32 for the rest of the
-	 *    lower 4G.
-	 *
-	 *  - powerpc only uses ZONE_DMA, the size, up to 2G, may vary
-	 *    depending on the specific device.
-	 *
-	 *  - s390 uses ZONE_DMA fixed to the lower 2G.
-	 *
-	 *  - ia64 and riscv only use ZONE_DMA32.
-	 *
-	 *  - parisc uses neither.
 	 */
 #ifdef CONFIG_ZONE_DMA
 	ZONE_DMA,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
