Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B216C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AUhIdKSJWSn47ZCGAVg519eHT8EwVVoHFK0ucJ22UPQ=; b=AtReaw7hX+pBzY
	oVyVnFSkiJF4PtHPCkhBRH1wUGao6cRnS/sSnpicxwRnMRFLCJL099ikkAL5bJlZz8gQ7mArp4WGp
	6QQIUj6qx5vuPHnqH2K69qdgeppH0UADukErxkCHLELgCqHc+OR0D03/0W1R4wKUlMP72W21gA1XU
	AQUYtTwg2/p7IuicuAKs2WrHB+FvSMhzabEf1pJTmlRpwJyEPIcJFkhh5mUBi/27BplI1XVlKJhZa
	T4S/mDRejMttIv1tosWtpXUdXKzyZi27OQ4bfvRbzEeY0+H3reEbLO/nZ/Bkp3ZhdiPGTetkjTpNM
	3oHh+EXdx7gCFNGo9DIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ2j9-000000004UQ-14BC;
	Sat, 06 Jul 2024 10:33:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ2j6-000000004U0-2bhy
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 10:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5C7E61C67;
	Sat,  6 Jul 2024 10:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F85C2BD10;
	Sat,  6 Jul 2024 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720261985;
	bh=KHWR0ANV7dBwgxd07y4BVHXxMvo2nDwvqCjPmc0nIok=;
	h=From:To:Cc:Subject:Date:From;
	b=Ktys9FIj674M4QOSW/gHzV2j7FwCyknm8wUw/DtGW5jDwID9nC3kKUBLUUbOCcXKv
	 5HAkJAvKTtbrSuW6wKJyWsUz+UDB1re0xAAluflP2ur5Y/zdbU6zPbgYRwh9jfspqu
	 I8PtYqaZQxzaH+EKsyw4b+0rV074OcsxwEshTklcehbiqzQ9fnESyT3V5l//qnRYvQ
	 Dmh0Zu4KQht0G0+m0vqixxmLnqkNLqVckSw1JWN0z1X4YWgl5I6Z4bsZ5cXXr56g3U
	 jgw8Nu1yJtYGvZtVsrwdLjNFCLai6lxJZJ3yBOg6TMSbH/6Rx1PaoGC0m23qSSQSA6
	 NQr80OZ8RUIlg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] serial: 8250: move mmp|pxa uart earlycon code and add xscale earlycon
Date: Sat,  6 Jul 2024 18:18:56 +0800
Message-ID: <20240706101856.3077-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_033308_747923_7AD90308 
X-CRM114-Status: GOOD (  10.90  )
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

There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
and the 8250_pxa. The previous one is generic and the latter is binded
to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
HW to support, making use of the generic 8250_of seems a good idea.
However, there's no earlycon support if we go with this solution. So
move the mmp|pxa-uart earlycon code to core 8250_early.c.

At the same, add xscale earlycon support too, only build test since
I have no xscale machine any more.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/serial/8250/8250_early.c | 11 +++++++++++
 drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index e3f482fd3de4..6176083d0341 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -171,6 +171,17 @@ OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
 
+static int __init early_serial8250_rs2_setup(struct earlycon_device *device,
+					     const char *options)
+{
+	device->port.regshift = 2;
+
+	return early_serial8250_setup(device, options);
+}
+OF_EARLYCON_DECLARE(uart, "intel,xscale-uart", early_serial8250_rs2_setup);
+OF_EARLYCON_DECLARE(uart, "mrvl,mmp-uart", early_serial8250_rs2_setup);
+OF_EARLYCON_DECLARE(uart, "mrvl,pxa-uart", early_serial8250_rs2_setup);
+
 #ifdef CONFIG_SERIAL_8250_OMAP
 
 static int __init early_omap8250_setup(struct earlycon_device *device,
diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
index ba96fa913e7f..b5d937f6f3f9 100644
--- a/drivers/tty/serial/8250/8250_pxa.c
+++ b/drivers/tty/serial/8250/8250_pxa.c
@@ -165,22 +165,6 @@ static struct platform_driver serial_pxa_driver = {
 
 module_platform_driver(serial_pxa_driver);
 
-#ifdef CONFIG_SERIAL_8250_CONSOLE
-static int __init early_serial_pxa_setup(struct earlycon_device *device,
-				  const char *options)
-{
-	struct uart_port *port = &device->port;
-
-	if (!(device->port.membase || device->port.iobase))
-		return -ENODEV;
-
-	port->regshift = 2;
-	return early_serial8250_setup(device, NULL);
-}
-OF_EARLYCON_DECLARE(early_pxa, "mrvl,pxa-uart", early_serial_pxa_setup);
-OF_EARLYCON_DECLARE(mmp, "mrvl,mmp-uart", early_serial_pxa_setup);
-#endif
-
 MODULE_AUTHOR("Sergei Ianovich");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:pxa2xx-uart");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
