Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E50C49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cl5TmvnMjt8CP6WC+v693ZWjXc09iZs80FWdp9mGcws=; b=EQoNJZF5bxmyEl
	9VYT+57tOMsG6Hd/vYh7IWl90K0vGjSWsEOW7uj2K+TG5IZI6XbEyXnKWjKUIn8lqILmSg7p7qMZa
	wpXvlrjM+sSB8GeqftiY4DNbkcsB3sH8S1kZgmW3aqBgS04l12vmLWtEsjFibLoXIuojs+FaHSQhi
	NVme6szMoHwP6u/WqCKkWYv874Xbx6gjTWavD/WfBHBuEufaEiTfrWoPE1gyHLvmiaxNwScN29ska
	r3mpyk94z723Byiy37pssd4rvjuVpPu6xHM2Swtt22ZAqwIiXHfsiUvcOuZmsMHBg6BhPBaZfrt0a
	CaL7H09qVKlx6XD+l7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJoX-00000001bQC-3vR5;
	Tue, 06 Aug 2024 13:01:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJoU-00000001bP4-30Rd
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1722949278; x=1754485278;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rkmgOQl8py7qDrXITLdHSVEmk/LLPYkUA7Pt/ny9N3g=;
  b=FGivsRnI8Y+v7c8wxODpbWwnQ9YfAPe72bCtxjhhyhlUGZYebI3lATuz
   YcCbX/wL8kWcEF/0kqaKqO3CICyVephNZjQAcVK03YSDcCdwpn9F7T8eh
   NFHITwxjDiEIpgzHlJueGfz2l8u/wujTi0Lh2ym+iLuMjiPK7b9Jygbgv
   JdEVyvvUyH/0VGI7XOxjhEiFe/qr+PHmWvdRUytRvXzTMj5PMHbXr1Qzl
   uykqp0BCBpYkAAi8kAuLF4DB1vtFlZNJAn83ZbglQIJRBwv7+Pu7dbrTp
   KRn85QCOhWq2Ioeb8rlfdTCGP6zdqs0R+KZ0TRrUmeVTgD5SMJfX64lk9
   w==;
X-CSE-ConnectionGUID: 35PzH48ZQt27K00Yyxlz1w==
X-CSE-MsgGUID: k16G+AKURLKjaYeL/9QOog==
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="197573430"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Aug 2024 06:01:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Aug 2024 06:01:01 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 6 Aug 2024 06:01:00 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <linux-usb@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <gregkh@linuxfoundation.org>,
	<b-liu@ti.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] usb: musb: poll ID pin status in dual-role mode in mpfs glue layer
Date: Tue, 6 Aug 2024 14:14:07 +0100
Message-ID: <20240806131407.1542306-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_060118_966043_10F84E3E 
X-CRM114-Status: GOOD (  21.78  )
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

Similar to other platforms using the MUSB driver, PolarFire SoC lacks
an ID pin interrupt event, preventing several OTG-critical status
change events from being exposed. We need to rely on polling to detect
USB attach events for the dual-role port.

The otg state machine implementation is based on Texas Instruments
DA8xx/OMAP-L1x glue layer.

This has been tested on BeagleV-Fire with couple of devices in host mode
and with the Ethernet gadget driver in peripheral mode, in a wide
variety of plug orders.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 drivers/usb/musb/mpfs.c | 160 ++++++++++++++++++++++++++++++++++------
 1 file changed, 136 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 29c7e5cdb230..00e13214aa76 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -49,30 +49,6 @@ static const struct musb_hdrc_config mpfs_musb_hdrc_config = {
 	.ram_bits = MPFS_MUSB_RAM_BITS,
 };
 
-static irqreturn_t mpfs_musb_interrupt(int irq, void *__hci)
-{
-	unsigned long flags;
-	irqreturn_t ret = IRQ_NONE;
-	struct musb *musb = __hci;
-
-	spin_lock_irqsave(&musb->lock, flags);
-
-	musb->int_usb = musb_readb(musb->mregs, MUSB_INTRUSB);
-	musb->int_tx = musb_readw(musb->mregs, MUSB_INTRTX);
-	musb->int_rx = musb_readw(musb->mregs, MUSB_INTRRX);
-
-	if (musb->int_usb || musb->int_tx || musb->int_rx) {
-		musb_writeb(musb->mregs, MUSB_INTRUSB, musb->int_usb);
-		musb_writew(musb->mregs, MUSB_INTRTX, musb->int_tx);
-		musb_writew(musb->mregs, MUSB_INTRRX, musb->int_rx);
-		ret = musb_interrupt(musb);
-	}
-
-	spin_unlock_irqrestore(&musb->lock, flags);
-
-	return ret;
-}
-
 static void mpfs_musb_set_vbus(struct musb *musb, int is_on)
 {
 	u8 devctl;
@@ -111,6 +87,129 @@ static void mpfs_musb_set_vbus(struct musb *musb, int is_on)
 		musb_readb(musb->mregs, MUSB_DEVCTL));
 }
 
+#define	POLL_SECONDS	2
+
+static void otg_timer(struct timer_list *t)
+{
+	struct musb		*musb = from_timer(musb, t, dev_timer);
+	void __iomem		*mregs = musb->mregs;
+	u8			devctl;
+	unsigned long		flags;
+
+	/*
+	 * We poll because PolarFire SoC won't expose several OTG-critical
+	 * status change events (from the transceiver) otherwise.
+	 */
+	devctl = musb_readb(mregs, MUSB_DEVCTL);
+	dev_dbg(musb->controller, "Poll devctl %02x (%s)\n", devctl,
+		usb_otg_state_string(musb->xceiv->otg->state));
+
+	spin_lock_irqsave(&musb->lock, flags);
+	switch (musb->xceiv->otg->state) {
+	case OTG_STATE_A_WAIT_BCON:
+		devctl &= ~MUSB_DEVCTL_SESSION;
+		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+
+		devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
+		if (devctl & MUSB_DEVCTL_BDEVICE) {
+			musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+			MUSB_DEV_MODE(musb);
+			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+		} else {
+			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+			MUSB_HST_MODE(musb);
+		}
+		break;
+	case OTG_STATE_A_WAIT_VFALL:
+		if (devctl & MUSB_DEVCTL_VBUS) {
+			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+			break;
+		}
+		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
+		break;
+	case OTG_STATE_B_IDLE:
+		/*
+		 * There's no ID-changed IRQ, so we have no good way to tell
+		 * when to switch to the A-Default state machine (by setting
+		 * the DEVCTL.Session bit).
+		 *
+		 * Workaround:  whenever we're in B_IDLE, try setting the
+		 * session flag every few seconds.  If it works, ID was
+		 * grounded and we're now in the A-Default state machine.
+		 *
+		 * NOTE: setting the session flag is _supposed_ to trigger
+		 * SRP but clearly it doesn't.
+		 */
+		musb_writeb(mregs, MUSB_DEVCTL, devctl | MUSB_DEVCTL_SESSION);
+		devctl = musb_readb(mregs, MUSB_DEVCTL);
+		if (devctl & MUSB_DEVCTL_BDEVICE)
+			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+		else
+			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+		break;
+	default:
+		break;
+	}
+	spin_unlock_irqrestore(&musb->lock, flags);
+}
+
+static void __maybe_unused mpfs_musb_try_idle(struct musb *musb, unsigned long timeout)
+{
+	static unsigned long last_timer;
+
+	if (timeout == 0)
+		timeout = jiffies + msecs_to_jiffies(3);
+
+	/* Never idle if active, or when VBUS timeout is not set as host */
+	if (musb->is_active || (musb->a_wait_bcon == 0 &&
+				musb->xceiv->otg->state == OTG_STATE_A_WAIT_BCON)) {
+		dev_dbg(musb->controller, "%s active, deleting timer\n",
+			usb_otg_state_string(musb->xceiv->otg->state));
+		del_timer(&musb->dev_timer);
+		last_timer = jiffies;
+		return;
+	}
+
+	if (time_after(last_timer, timeout) && timer_pending(&musb->dev_timer)) {
+		dev_dbg(musb->controller, "Longer idle timer already pending, ignoring...\n");
+		return;
+	}
+	last_timer = timeout;
+
+	dev_dbg(musb->controller, "%s inactive, starting idle timer for %u ms\n",
+		usb_otg_state_string(musb->xceiv->otg->state),
+		jiffies_to_msecs(timeout - jiffies));
+	mod_timer(&musb->dev_timer, timeout);
+}
+
+static irqreturn_t mpfs_musb_interrupt(int irq, void *__hci)
+{
+	unsigned long flags;
+	irqreturn_t ret = IRQ_NONE;
+	struct musb *musb = __hci;
+
+	spin_lock_irqsave(&musb->lock, flags);
+
+	musb->int_usb = musb_readb(musb->mregs, MUSB_INTRUSB);
+	musb->int_tx = musb_readw(musb->mregs, MUSB_INTRTX);
+	musb->int_rx = musb_readw(musb->mregs, MUSB_INTRRX);
+
+	if (musb->int_usb || musb->int_tx || musb->int_rx) {
+		musb_writeb(musb->mregs, MUSB_INTRUSB, musb->int_usb);
+		musb_writew(musb->mregs, MUSB_INTRTX, musb->int_tx);
+		musb_writew(musb->mregs, MUSB_INTRRX, musb->int_rx);
+		ret = musb_interrupt(musb);
+	}
+
+	/* Poll for ID change */
+	if (musb->xceiv->otg->state == OTG_STATE_B_IDLE)
+		mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
+
+	spin_unlock_irqrestore(&musb->lock, flags);
+
+	return ret;
+}
+
 static int mpfs_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller;
@@ -121,6 +220,8 @@ static int mpfs_musb_init(struct musb *musb)
 		return PTR_ERR(musb->xceiv);
 	}
 
+	timer_setup(&musb->dev_timer, otg_timer, 0);
+
 	musb->dyn_fifo = true;
 	musb->isr = mpfs_musb_interrupt;
 
@@ -129,13 +230,24 @@ static int mpfs_musb_init(struct musb *musb)
 	return 0;
 }
 
+static int mpfs_musb_exit(struct musb *musb)
+{
+	del_timer_sync(&musb->dev_timer);
+
+	return 0;
+}
+
 static const struct musb_platform_ops mpfs_ops = {
 	.quirks		= MUSB_DMA_INVENTRA,
 	.init		= mpfs_musb_init,
+	.exit		= mpfs_musb_exit,
 	.fifo_mode	= 2,
 #ifdef CONFIG_USB_INVENTRA_DMA
 	.dma_init	= musbhs_dma_controller_create,
 	.dma_exit	= musbhs_dma_controller_destroy,
+#endif
+#ifndef CONFIG_USB_MUSB_HOST
+	.try_idle	= mpfs_musb_try_idle,
 #endif
 	.set_vbus	= mpfs_musb_set_vbus
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
