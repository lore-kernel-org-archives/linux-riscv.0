Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06709ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rj0rsqHhkczakaQWWQyIf6TgFiRZ/Q5rKFo+kNtoLF4=; b=3ycvWEvzq/UeWK
	y7dtauUFWOkhd/sjgmTht4aotLr7VMsM8/oT3qubSj772MDKM5K/v1R6XbIGSHC/7LBjwRHBv6WjT
	XF64agqbUn7GSXGnqobfXoj4jYFcJGed9BmKDsE8lZO3EMzzpLCnibK3A93C+s+/nzKQS5AV3v1Ik
	GiUMoD2AaegS8wsboib0X5FHcsGb2sMQAJhcyG53lEBQ4q1W5fR9yTFK5eJvuvY7f0N1D5uUL4atz
	EsByE1eKeXYgffwnO+SHNcYh5ZHfpLEcZS8b49ZLeEyRsQLYWEiwSyhmKCxa487G4a6KoOO9e0nww
	xl1dqi2i+NBQjden53qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiAx-001y6w-6E; Thu, 15 Sep 2022 06:16:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiAt-001y3N-EJ
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 06:16:37 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MSn1B5JzMzlVjH;
	Thu, 15 Sep 2022 14:12:30 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 14:16:29 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 14:16:29 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Liu Shixin
	<liushixin2@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC
Date: Thu, 15 Sep 2022 14:50:25 +0800
Message-ID: <20220915065027.3501044-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_231635_689758_A938DE4A 
X-CRM114-Status: UNSURE (   6.78  )
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

Since riscv64 has already support SATP_MODE_57 by default, it is time to
support more hugepage-related features. These two patches will enable
HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC.

Liu Shixin (2):
  riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
  riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT

 .../features/vm/huge-vmap/arch-support.txt    |  2 +-
 arch/riscv/Kconfig                            |  2 +
 arch/riscv/include/asm/vmalloc.h              | 18 ++++
 arch/riscv/mm/Makefile                        |  1 +
 arch/riscv/mm/pgtable.c                       | 83 +++++++++++++++++++
 5 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/mm/pgtable.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
