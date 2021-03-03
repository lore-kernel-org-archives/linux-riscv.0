Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B4EC433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 19:15:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5794064E90
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 19:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5794064E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xn5ML0K7nLHe6vEX4p73BbZqjq4xqAg+CV2CZ61bI4=; b=cAHcLMwL0mvaAZaChfWjGUFK/
	Gny11GHPzzvODj+8FCqigtZb66oavEZTqZZcY6zppU2THbK7yPrZAg2BwAp96XZxwdcERWvOd3Wkt
	yTuwCDqkPdQyfFqOBDZhVI7iQfNVmcK4vKPkbgmTqtJHbIyFYBzkqBtXP9n3PePLe/813qtOmpSjX
	Bw0O4NmCWa2OEWnPXopZO0FXXZjHPYeUr50KTL98Yhgbu0n30cqvPhMZLkXKi5S8lvdFYI98zObft
	XDxLk89a9cX45/6bkbVcNxfRf3pgL6WsCNpwivSlTICxinIVUx5dpZ8o4qKyLKIhdL/KLY6XmPzJ9
	cdrk3rYjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWyB-006AZq-4e; Wed, 03 Mar 2021 19:15:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT2l-005HpZ-A0; Wed, 03 Mar 2021 15:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vZq08XFluVeBbsiP+7mRCueb5nV+n/mkDNmKMEKYBVY=; b=LxBXQlVnkh5KweT1ZcH6wFL1Yp
 H3543JYBHnP7fvQq2mClcshBHkiaM1utZgsg1zNjPvN0It4YjMCsazafFnCfb67nUBfoTdpJXn1M4
 8jlf25jT1UNZayD9v0wyj03JUJjFT9nfy1jV7yV2+vnHrIt9bD3E9OA+AY4q0cio/eJadEDsHdwR/
 2HFedFVMJPfSlwYckkOn+kNZmOEKlv/wmJxEHf4rcMycfg5NRfo4zcEehaRKESIUwNdBmI9tFM6X2
 VDMa808GUWTjjMiX0reFOHiGArAWdcZOReobi+bO29lAPDmWtsr9T6w/ujkSXUfZCF7ZR32ssziPt
 UHCAH8lA==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLoJ-001eYl-VV; Wed, 03 Mar 2021 07:20:44 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dr52Y2dg7z7rYg;
 Wed,  3 Mar 2021 15:18:45 +0800 (CST)
Received: from ubuntu-82.huawei.com (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 15:20:20 +0800
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
 <wangkefeng.wang@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH stable v5.10 1/7] arm64: mm: Move reserve_crashkernel() into
 mem_init()
Date: Wed, 3 Mar 2021 15:33:13 +0800
Message-ID: <20210303073319.2215839-2-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_072044_572226_F12FDB99 
X-CRM114-Status: UNSURE (   7.79  )
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

commit 0a30c53573b07d5561457e41fb0ab046cd857da5 upstream

crashkernel might reserve memory located in ZONE_DMA. We plan to delay
ZONE_DMA's initialization after unflattening the devicetree and ACPI's
boot table initialization, so move it later in the boot process.
Specifically into bootmem_init() since request_standard_resources()
depends on it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jeremy Linton <jeremy.linton@arm.com>
Link: https://lore.kernel.org/r/20201119175400.9995-2-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 arch/arm64/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 00576a960f11..686653e33250 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -386,8 +386,6 @@ void __init arm64_memblock_init(void)
 	else
 		arm64_dma32_phys_limit = PHYS_MASK + 1;
 
-	reserve_crashkernel();
-
 	reserve_elfcorehdr();
 
 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
@@ -427,6 +425,12 @@ void __init bootmem_init(void)
 	sparse_init();
 	zone_sizes_init(min, max);
 
+	/*
+	 * request_standard_resources() depends on crashkernel's memory being
+	 * reserved, so do it here.
+	 */
+	reserve_crashkernel();
+
 	memblock_dump_all();
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
