Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F6BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu7wOzzgDh1etw0YcDm7rAt3dQaGVmrOfms6clcLi24=; b=10w4layFcKiUdH
	IiZhr15iOfATXEy9vkeWPjFv8w6uF7M02ePXw0JloUZcaFR96/wiL5RgiXY4hSR83+QDbdkoX12et
	MBTqZqHqh7pp9k7PkVpzbuDv7PhOZjJ5+p5jzwHdi1p8JphwRRymeKKPobg+0j6NR/XVJPbIcyHn4
	1LBke6NIC2r/mXY/azbMOdiF9q9PowFkQa2ZDyqw2SzQd6KgmO4XFr9SkARKopxf8B3cISKJaj5TG
	hKXcnM34IWRf8Pd6pp4G5cf0E/FmNAJMLLD5YDNaHd3mDUo7qssYVcF7813LyNL6vTl3XalxbZ9bq
	Qg1MxeLQuJriAZaps8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFem-004Q4o-57; Mon, 06 Dec 2021 15:11:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFe6-004Pon-10
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6542A6132C;
 Mon,  6 Dec 2021 15:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38DDC341C9;
 Mon,  6 Dec 2021 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803472;
 bh=X4sDq1AysZLgZ/CXaf2/6j6xZAfoF8ID51G9Lzvmb9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ehl/4Ziqd/eXWLxbnMmRqC7wPoiimhuy5+C1OlIZYMrvbQEUQ9k3uPtTyR1WfEvXj
 59UcE96mzT0QQJFHqgXKLfnUcjCUUzrytNmULKwayMyL+gjUB/IPD5/26O+zu3iUl4
 ueDPkGzfs7v7NxcABOsM0atdwNdH9RrY65sHfIFy/eWcuLenwYGWiIKOmvG7CHut5Q
 lYGq7vdyPSM7ByTpCHgoa7mlt7Yf2VRAF613/48JRgTA6qWFGyXXVUGFEiH1SsDCzf
 d76TmMHRrjRcfyP12p8WOTf3JvM8g3WuvesC3kLwfmSvIw9gJx4R59M4UoNuGIQ6UE
 Olx3rUcwrl63w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] riscv: mm: init: remove _pt_ops and use pt_ops directly
Date: Mon,  6 Dec 2021 23:03:51 +0800
Message-Id: <20211206150353.731-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
References: <20211206150353.731-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071114_138101_BEA22892 
X-CRM114-Status: GOOD (  10.03  )
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

Except "pt_ops", other global vars when CONFIG_XIP_KERNEL=y is defined
as below:

|foo_type foo;
|#ifdef CONFIG_XIP_KERNEL
|#define foo	(*(foo_type *)XIP_FIXUP(&foo))
|#endif

Follow the same way for pt_ops to unify the style and to simplify code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4edf5600bea9..9c5816971f40 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -227,12 +227,10 @@ static void __init setup_bootmem(void)
 }
 
 #ifdef CONFIG_MMU
-static struct pt_alloc_ops _pt_ops __initdata;
+static struct pt_alloc_ops pt_ops __initdata;
 
 #ifdef CONFIG_XIP_KERNEL
-#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
-#else
-#define pt_ops _pt_ops
+#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
 #endif
 
 unsigned long riscv_pfn_base __ro_after_init;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
