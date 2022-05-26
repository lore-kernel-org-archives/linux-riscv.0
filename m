Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D8DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5327kIjQOi3h37AHexLja/55L5gfjZr64V92eDEDLg=; b=HZaCu0qvH0J4y8
	yFJeNeJ1Jz9M/2H+Z8WCIJGjwpYkEW0rm/Bg9mmaM1Z2+2WnpIKcdNyKCCssGxGXt4VsijFc2wr3j
	LaO7kyrfjYTl7kQLWJpQtRKToNVLxOAK3P41EgeTwCuMKnETJdkCe+1rg2O/thTBzUGWU/Jbp2Wal
	SnyVXv6JsC50dZYSfc9yTqhvQlEi+Zwz+qaq/GCUPErjHFRdXLiBC61EetPE1ZaP3glpAmF6LrQ58
	6WMUjaiGqHgiUf3u7vKzzZBO8Fi+aihIdQg52IAuVBLWzMR821xvNVO6tnD5bAju7e4m462r2JnVG
	2bbxKoYKerYfhNcGmbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKi9-00FyHK-Eu; Thu, 26 May 2022 21:08:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKXP-00Fu2Z-Uf
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 20:56:57 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuKXK-0006ZH-8K; Thu, 26 May 2022 22:56:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	mick@ics.forth.gr,
	samuel@sholland.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 2/5] riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
Date: Thu, 26 May 2022 22:56:43 +0200
Message-Id: <20220526205646.258337-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526205646.258337-1-heiko@sntech.de>
References: <20220526205646.258337-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_135656_043457_155C396E 
X-CRM114-Status: GOOD (  11.47  )
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

This improves the symbol's description to make it easier for
people to understand what it is about.

Suggested-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 65285b980134..a4b299ad4473 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -356,8 +356,13 @@ config RISCV_ISA_SVPBMT
 	select RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the SVPBMT extension
-	   (Supervisor-mode: page-based memory types) and enable its usage.
+	   Adds support to dynamically detect the presence of the SVPBMT
+	   ISA-extension (Supervisor-mode: page-based memory types) and
+	   enable its usage.
+
+	   The memory type for a page contains a combination of attributes
+	   that indicate the cacheability, idempotency, and ordering
+	   properties for access to that page.
 
 	   The SVPBMT extension is only available on 64Bit cpus.
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
