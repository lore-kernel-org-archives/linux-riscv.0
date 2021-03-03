Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC65C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 19:58:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77210600EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 19:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77210600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8qbU2llr8j9QSfSIyFrWKJ46n44W2QFMvNerpIsciFw=; b=UXrIvLanxE3Zr+5pxCXjHZeB23
	c5S8y+NzfhKxgrAKnsGlzvx+oWwW00/arrgOK0tw1SarkdA49c0D7pVdk+N84yk1mmR6Riz/1vPUJ
	jlJ3Ah1WkzFh141Lq1a8uzR43fyfHU6xFhb9YcU4JpXqVPfEmM1wu/748TDWNU/597jdLHp2PICth
	xSxklGcdRbCrOYYdicBnc9JRf0VtfiGCATJD68i9sfLl7dODXZVxlz5CHq5K9FfenpRzgjGS4S1jb
	mx54Y8PTRIKc+ZVD9fJOeBCYaoRjn2zQdu+BSD512gcQ1bUcndqPW5XltH3BWDLbT9TFrvYadvTWT
	vkabpuqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXdR-006KCI-Dk; Wed, 03 Mar 2021 19:58:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4Y-005IQa-V9; Wed, 03 Mar 2021 15:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=t22v+HnzVs7LdEIG5TuRhDYBmx8d4AzH0ENeoP0zgE0=; b=oBz/f0FerEyFuqiyf0p1zy/gcb
 y59kQ62riyub2UaT7WmTtJzyHTz04Y2+j2Odq4DMFZMiKnHImHeNSCjvY/IIOcNnvrcuoMcvfsQA1
 DfktcqruNd6tEMfw9KaQkjleVt8CLcBykP80AGCZM+qMItk+8k3JW8kKbvchdQhrokXS8t2voWrw9
 sgF8SagoFIqwZEhYeh4Qkaeyzghdp8UCaIP05viBnJhcuQKXRW0W1s1y5V6IzKLNp2O8SsOEcDbcN
 04Ul1Un0pNRtyi0/C9XHp4Mu+sdTGd5oCLAOudF97sg2nKpC273gVRM19JQZ6UnAmgb3mlMWGK3H/
 uQ67iByA==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLoJ-001eZ5-Vb; Wed, 03 Mar 2021 07:20:44 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dr52Y1xnwz7Rpq;
 Wed,  3 Mar 2021 15:18:45 +0800 (CST)
Received: from ubuntu-82.huawei.com (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 15:20:18 +0800
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
 <wangkefeng.wang@huawei.com>
Subject: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
Date: Wed, 3 Mar 2021 15:33:12 +0800
Message-ID: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_072044_560714_EB17CD81 
X-CRM114-Status: UNSURE (   3.66  )
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

Using two distinct DMA zones turned out to be problematic. Here's an
attempt go back to a saner default.

Ard Biesheuvel (1):
  arm64: mm: Set ZONE_DMA size based on early IORT scan

Nicolas Saenz Julienne (6):
  arm64: mm: Move reserve_crashkernel() into mem_init()
  arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
  of/address: Introduce of_dma_get_max_cpu_address()
  of: unittest: Add test for of_dma_get_max_cpu_address()
  arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
  mm: Remove examples from enum zone_type comment

 arch/arm64/mm/init.c      | 22 +++++++++-------
 drivers/acpi/arm64/iort.c | 55 +++++++++++++++++++++++++++++++++++++++
 drivers/of/address.c      | 42 ++++++++++++++++++++++++++++++
 drivers/of/unittest.c     | 18 +++++++++++++
 include/linux/acpi_iort.h |  4 +++
 include/linux/mmzone.h    | 20 --------------
 include/linux/of.h        |  7 +++++
 7 files changed, 139 insertions(+), 29 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
