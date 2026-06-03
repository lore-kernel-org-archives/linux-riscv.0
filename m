Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C224CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=wDB5dbLXynMIA2iCuQ+9qdZ3A37fiwTU2sHU/S0o2ao=; b=smzk4ue7OJgHb/
	h+0LZjsm6JutXFhyIoNtCryewOItxgue293h6QyGSoNsPoXmMI2ZGvlmXHRe3OhVufHKDSB1BNtzN
	F+KQY+cAddoJzr+1Kvep6yHz6/YzrwcmN51iYQ0lWY+pnyDDKzJ0lXKpiX8LzyxmKO1jqOp33kbLJ
	ZmkAZl++UvWN+8Qk4vUmPJA+IfIPxHzGBrTUDG2tvmebsCPeRg/oCBMutWz1zGJD9QNZPbwrnrKff
	2/R7ZW7SQSCNWdxQm/dB4OCCFlGPjuJhEh2hI3MVk+jzL4lZYn986ZOehWmX3kkGAiU5z5FqSHHpN
	Zq8kqMav7ykiRCHYaOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgt9-0000000EaRR-26nx;
	Wed, 03 Jun 2026 08:23:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgt8-0000000EaRE-1alJ
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=Zs3WwQs+RVXnymBdQxAPfzSp+wBwse81m2k35fLq5OM=; b=D+YCVKZHMoG68IpKznEYwQPGAQ
	C2mF0zVVqKX4UWieGFuzUznngbBTMnCgCcFPm4l4JT4+8572s0CqPl81+61dNPshsbGQrD4QZi6Yq
	dyXTc9vMZgmAJG5HSTEErT5mTCRN/OtZ7PDzP31AJbz8SrmldwvCq9kXDtpxlDC12Gq/+lscKt1Lj
	cmQwfrFKeHdqCiAT643RyKGJVxd4bgqRlTnbAn8xrsgISTEOuk1h+vKRvHfZQ65UKTAqA6WAXjR4T
	u+73Yyp17ycP/T4V5/xZqpn0igG/dYrFimp6maFLFavKq1Ig92QirwG1WsL7RWHB1btBDvY0k5f6N
	kk5NC8ig==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgt5-0000000BZAb-2LJD
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:23:45 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260603082338euoutp02854bdf7c0c4592db78f960823adba5b8~1hJiSBg8r1820918209euoutp02s
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 08:23:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260603082338euoutp02854bdf7c0c4592db78f960823adba5b8~1hJiSBg8r1820918209euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780475018;
	bh=Zs3WwQs+RVXnymBdQxAPfzSp+wBwse81m2k35fLq5OM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jxbKrTBjjFrU5QAZYAaUwo+UPwoOiL0mIIw/bbLK38+FSoqIB2ngFg7QEeUHru9/A
	 AclbfAh/g5rLHJTVEUcuj6ZGhxqs55/luF8w5y0SJAICH/JefryIbk0fNfKfxXGYrs
	 b/L3P86BEpAh8pDjEOLRmvReSEjQ2XuRZN6bmxBs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260603082338eucas1p2ec88154477479bf0547e5221e0919b07~1hJh3kR9-2543625436eucas1p28;
	Wed,  3 Jun 2026 08:23:38 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260603082337eusmtip1d363b6a634f66c3a628f646a55fce2b1~1hJhdo1tE0717907179eusmtip1I;
	Wed,  3 Jun 2026 08:23:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>
Subject: [PATCH] riscv: defconfig: spacemit: enable i2c driver for K1 SoC
Date: Wed,  3 Jun 2026 10:23:32 +0200
Message-Id: <20260603082332.3200814-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
X-Msg-Generator: CA
X-RootMTR: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
X-EPHeader: CA
X-CMS-RootMailID: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
References: <CGME20260603082338eucas1p2ec88154477479bf0547e5221e0919b07@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_092343_741572_015F0F95 
X-CRM114-Status: UNSURE (   8.50  )
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

Enable K1 SoC I2C driver to properly probe PMIC chip on BananaPiF3 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b987..08445df56006 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_JH7110=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_K1=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
