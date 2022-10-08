Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A35C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkNvoqtQwY5BsZs7v/j5wDDOdzHWneDKiRnJPdwBQl8=; b=2bRZqPMFoLZbDc
	6KDdsd5InxRl8HmKLOnpLMqL3TvuE7f89ZE5MrdoxY9KFumnV8160lCLrhlaj0bDIVQEKN7ChoNyG
	OYgLc5c9HBL4dAqaD3aEQEEnhe7ililAhQZkOParjWuroYw+WKtVBYSUxk9dqSa4nODBaPXqoXlfR
	hEUJi8iwkqErHLnfETHEXMdVRKgyeDm0CxuwEiD3QD+VqNWUj7pbUnzQ6KkgZUPW9BHJ1vjzyoGjy
	HGOKbzKP++01phanbC0JWpx/b+25BLcA43T33x0X8lcbo5NWOG3dO38cuTL7NilYw1ccR8RJbinBb
	l8wkYUVgcwLZ8eDpwcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9gZ-00DF6k-K5; Sat, 08 Oct 2022 13:16:11 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9gU-00DF4M-H8
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 13:16:08 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ml5GH4P39zkXwV;
	Sat,  8 Oct 2022 21:13:27 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 21:15:55 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 8 Oct
 2022 21:15:54 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Conor Dooley <conor@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH v2 2/2] riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT
Date: Sat, 8 Oct 2022 22:05:06 +0800
Message-ID: <20221008140506.1066805-3-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221008140506.1066805-1-liushixin2@huawei.com>
References: <20221008140506.1066805-1-liushixin2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_061606_772262_B2FB5638 
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

After we support HAVE_ARCH_HUGE_VMAP, we can now enbale HAVE_ARCH_HUGE_VMALLOC
too. This feature has been used in kvmalloc and alloc_large_system_hash
for now. This feature can be disabled by kernel parameters "nohugevmalloc".

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4d597203bd9..fded181c9e50 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
