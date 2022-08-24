Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57986C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ngWhT/Dz62AZ5+auFM0twMt0R1lig3mcUpKjaoPuIs=; b=bc9jGVd9TccFH5
	CTVMxrH3gw5ZWFdivM6GshrTjVWcb7hSlYcqG/oe2HKSLiPzsSHoGdo7anfucEeZSmZjw498NZV6p
	UPAAR+t3y26sd5BwXJ5Vh8xCDJRlrfL9lRy138ORqtkpdBJ9MlIA1bXBAcpw+OXfWthG+GkFW59+I
	TID2BzXB5t86GdozGrMd195H14Xg6ls6/zGssDV7TWiHiBbezUBaqzIUGJ91XfNKvJyve1k4H//tu
	jDr9RunVRJX98tWDLr1Lv08sUqifCgYNntqeUaFDXWi8nW81638d39DNNMMlvPjU1uOv0E5/dF1d8
	Mns7eg5rVQjyCMXahl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlau-00BQvY-1R; Wed, 24 Aug 2022 08:18:36 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlar-00BQtX-48
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 08:18:34 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id QlamoIOe1ez1rQlamoU0BV; Wed, 24 Aug 2022 10:18:29 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Aug 2022 10:18:29 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Date: Wed, 24 Aug 2022 10:18:25 +0200
Message-Id: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_011833_327877_4829AD42 
X-CRM114-Status: GOOD (  13.68  )
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

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code, the error handling paths and avoid the need of
a dedicated function used with devm_add_action_or_reset().

That said, mpfs_rtc_init_clk() is the same as devm_clk_get_enabled(), so
use this function directly instead.

This also fixes an (unlikely) unchecked devm_add_action_or_reset() error.

Based on my test with allyesconfig, this reduces the .o size from:
   text	   data	    bss	    dec	    hex	filename
   5330	   2208	      0	   7538	   1d72	drivers/rtc/rtc-mpfs.o
down to:
   5074	   2208	      0	   7282	   1c72	drivers/rtc/rtc-mpfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
devm_clk_get_enabled() is new and is part of 6.0-rc1
---
 drivers/rtc/rtc-mpfs.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 944ad1036516..2a479d44f198 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -193,23 +193,6 @@ static int mpfs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return 0;
 }
 
-static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, "rtc");
-	if (IS_ERR(clk))
-		return clk;
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ERR_PTR(ret);
-
-	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
-	return clk;
-}
-
 static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
 {
 	struct mpfs_rtc_dev *rtcdev = dev;
@@ -251,7 +234,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	/* range is capped by alarm max, lower reg is 31:0 & upper is 10:0 */
 	rtcdev->rtc->range_max = GENMASK_ULL(42, 0);
 
-	clk = mpfs_rtc_init_clk(&pdev->dev);
+	clk = devm_clk_get_enabled(&pdev->dev, "rtc");
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
