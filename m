Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0DCCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=EmwPYQiUITDM/wJFf3VU4E92ASTYJgrxf36V/LytOlM=; b=FWlfTY1hvCQzUq
	FXFWvueEVhcqUR10c8pJGtyd1lcRlk+k0qt3J4iUKkUw/uYQkP8EMwkHlk8mxgdgkz8t5wTJnNY21
	WwhcZwvdvEty/T5sLncPdUQsp3lyjRbxtNWwS3c4fu8h4Udq5ujNA1fxRQVEpGwgknHzrvNG0Hd4O
	w9QmK2v3tB1aLTwMeC8N4PYq2f6QiSDPMniNmBGZRDKMUtZe2HXn9EAKVxSiHjfxmgYW56mX9NDOg
	aoNxQe1yTcn/dmcggy3SpAsJ/blSKAUQ+ZuOqCjbFr0cWT4MlCiVjYlc12iw+sLSYSrzN6di3RkGn
	9cnHO/bgWu0D4thMuqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCl-00000009zU2-3o2T;
	Mon, 03 Nov 2025 14:06:43 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCj-00000009zSx-0D4z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 14:06:42 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251103140639euoutp02fe1d4ceff6d04d05ab084123862fb31a~0hEga7now2440124401euoutp02J
	for <linux-riscv@lists.infradead.org>; Mon,  3 Nov 2025 14:06:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251103140639euoutp02fe1d4ceff6d04d05ab084123862fb31a~0hEga7now2440124401euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762178799;
	bh=jIsQV5IMTHhT7DC2lYgjoEGYfvMVIeBmL6dCrfsczNM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=TOQ3h/UO+25asCX3yZgpjMYz80lXYJqtFJbadZXQOFt7DE96aoclQC1YUAn74B8N2
	 QCc9jZp90hpJirCntATla1Q6c6JJD6XEL8epNxV+SwGeCNiBwXYbAdRkeMtGEbOzPK
	 OthxEA3oy11Ma7XuIDpmlrOA9EqZ7DJT0jSJawMo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251103140639eucas1p2eed021e71c5f027bf324a9d038f7a9fa~0hEgCWKpz2757627576eucas1p27;
	Mon,  3 Nov 2025 14:06:39 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140638eusmtip1b479530be9b246ffdd1174159d17363c~0hEfmHymj1005810058eusmtip1o;
	Mon,  3 Nov 2025 14:06:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] riscv: defconfig: enable RESET_GPIO driver
Date: Mon,  3 Nov 2025 15:06:30 +0100
Message-Id: <20251103140630.2364367-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20251103140639eucas1p2eed021e71c5f027bf324a9d038f7a9fa
X-Msg-Generator: CA
X-RootMTR: 20251103140639eucas1p2eed021e71c5f027bf324a9d038f7a9fa
X-EPHeader: CA
X-CMS-RootMailID: 20251103140639eucas1p2eed021e71c5f027bf324a9d038f7a9fa
References: <CGME20251103140639eucas1p2eed021e71c5f027bf324a9d038f7a9fa@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_060641_223051_D8D4F96D 
X-CRM114-Status: UNSURE (   8.52  )
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

Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
driver") reworked GPIO-based reset controller initialization, so now
RESET_GPIO driver is required to properly instantiate MMC device for
most of WLAN and SDIO chips.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca18..e69a27624923 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -263,6 +263,7 @@ CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_PWM=y
 CONFIG_PWM_PXA=m
+CONFIG_RESET_GPIO=y
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
