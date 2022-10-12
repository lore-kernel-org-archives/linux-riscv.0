Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50138C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOOV9xCzFJNyEMoFjG9rirgTfXMs9Z+zJzvpk9IK4sE=; b=hl8D41Ra7vD0dC
	siQApPcC886xX/flt9mFCjl7XzRX7Mw5vxstaAzqT9aEdtBOUUBJUS83y0hht0SRj0Z7YbYKcPrPk
	6s3Ks/Hd44nsdPRFMUDYcuBjroiRJLiFBXARmouYzMs8FzdpM5WAMHOBKJUfNvlwAFgRYb6/Y6ATH
	sTFgcwZrXx3u1A2QGS1AYWVSfobiNxT9iL+0/NQXW6HSKybedLMsXl1iHeV5H1qsc0y/SjugN29Df
	HDeuQTw3wM121yMRtXOidMM7UbBG0cFbNwPXyPcKZaAdwzNFo1qYmiUi4Wm/s9VpSy8qwhKy6ngzD
	eTC6Ay+u2gByK+CcA56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZeK-007nbY-RH; Wed, 12 Oct 2022 11:11:44 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZeG-007nY9-Vl
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 11:11:42 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MnVGX5tLzz1P73s;
	Wed, 12 Oct 2022 19:07:00 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 19:11:35 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 19:11:34 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Conor Dooley <conor@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH v3 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC
Date: Wed, 12 Oct 2022 20:00:36 +0800
Message-ID: <20221012120038.1034354-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_041141_198291_99B8D10B 
X-CRM114-Status: UNSURE (   6.11  )
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

riscv64 can support sv48 now, so we can add more hugepage-related features
which rely on 3th or 4th level of page table. These two patches will
enable HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC.

v2->v3: Fix the commit log.
v1->v2: Fix the build error reported by kernel-test.

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
