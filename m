Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167F6C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXomjQoR3LdCj5AfdlWOAb0RLPfyhDyfrJ0wGbWUdyM=; b=0ycG8rXFBlz0eM
	u8XAIndvd1rBOVEvAxTExr8TaHH0cQMTcFGetnSsiJkk2DgNyF3pBDJpRmVVZhYV14FqT+M1/W1J7
	Jr9FVYrk4K2EbDIFkv9geXHZEk2NeHZhXSKrToGDSZni/xqSddFXr69yFRD1JVDP58QOEbFyOC3Z3
	2J0B5vCYt6keuQ1BDTHD77Hoan3pXMiIcKG/IuFhd9jWo5RLOEINXqVQTBQdd35C5Zdcy1oJKQVvO
	rNbLnmvckQS83SHqSzO8qThErcX11FlaPitp3Xvmk1qe6K7g/ENOVDzLSLt08DOvOKEtT3Cg/u87J
	WDQRs7uiKjqHUN+R90iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxOw-003I8n-32; Tue, 16 Aug 2022 14:18:38 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxOt-003I3u-4F
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 14:18:37 +0000
Received: from ramsan.of.borg ([84.195.186.194])
	by andre.telenet-ops.be with bizsmtp
	id 8EJV280024C55Sk01EJVAL; Tue, 16 Aug 2022 16:18:29 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oNxOm-001LhP-HE; Tue, 16 Aug 2022 16:18:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oNxOl-00Gv2j-Ey; Tue, 16 Aug 2022 16:18:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: mpfs: Remove printing of stray CR
Date: Tue, 16 Aug 2022 16:18:25 +0200
Message-Id: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_071835_362822_0F3444B7 
X-CRM114-Status: GOOD (  11.57  )
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

During boot, the driver prints out a stray carriage return character.
Remove it, together with the preceding space character.

While at it, change prescaler to "unsigned long", as returned by
clk_get_rate(), to avoid truncating very large clock rates, and update
the format specifiers.

Fixes: 0b31d703598dc199 ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Apparently updating the RTC when Debian userspace starts fails, causing
an infinite stream of:

    mpfs_rtc 20124000.rtc: timed out uploading time to rtc

Increasing UPLOAD_TIMEOUT_US from 50 to 50000 doesn't help.
---
 drivers/rtc/rtc-mpfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index f14d1925e0c94dfb..944ad10365164c4d 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -233,7 +233,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 {
 	struct mpfs_rtc_dev *rtcdev;
 	struct clk *clk;
-	u32 prescaler;
+	unsigned long prescaler;
 	int wakeup_irq, ret;
 
 	rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
@@ -275,14 +275,13 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 
 	/* prescaler hardware adds 1 to reg value */
 	prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
-
 	if (prescaler > MAX_PRESCALER_COUNT) {
-		dev_dbg(&pdev->dev, "invalid prescaler %d\n", prescaler);
+		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
 		return -EINVAL;
 	}
 
 	writel(prescaler, rtcdev->base + PRESCALER_REG);
-	dev_info(&pdev->dev, "prescaler set to: 0x%X \r\n", prescaler);
+	dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);
 
 	device_init_wakeup(&pdev->dev, true);
 	ret = dev_pm_set_wake_irq(&pdev->dev, wakeup_irq);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
