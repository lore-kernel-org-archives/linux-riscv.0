Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF5AC41513
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRghDfBf/tkgY5m1MeOY2xiOlZNSC+RbgFU/WQuuoqo=; b=tGE2Rw0cfCTPGP
	5wLKGuQ4AQKErd8/Jt5ivfIh4KjVZNYNw5N8OEy3TdeW/tmd2UfmPzYJlcDR70JPkDKYoHNr4qXPv
	GVLtzDbe2SxLH88J/QpMDnXM3KG95becmc0G0yLvCw02XJogjGFL+bzqF0HiOfJxhGXET7PyCtGj5
	1ISssftyiDo2G1R1t94cfWbkSYg9Au68mCw7I1f+jpMCpPjdKdE+eDdvLT/da9sXL3tVauIBe56ut
	tQxlOm2G4QaakCrwWZtJUc3ONdyQ980ssSbdLVum0x4ysCxNgH3pCNPlKn7D+jb/lxNP9OGjNhSxU
	mozxQmUlS00T4PCaB92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY5-0000000EfMC-2wpa;
	Thu, 11 Jul 2024 16:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY3-0000000EfKj-1iAl
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B807661D61;
	Thu, 11 Jul 2024 16:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D85BC32786;
	Thu, 11 Jul 2024 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720714894;
	bh=kNHny3bD8VDch0F9MiEblutk39fnAED3gZpYZyJpiTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJkAuBu8BGQfrTxOU94WRLVYywOsc+YTkwVy0X4fXTLbps+ERsMHMiFJtMkqzCoA5
	 mSLl2KbsD3qP+3uYNsIRRM6jsNYHLV4QmNtO3rJNr1TX5y9fYMuZcrEvQFdPBoYGZk
	 hEwR5W9yl3JlnvuZkZSPzYOXuRlNlBebVkjziMB1BmNMF+8LwZFIWhAlll6q3mOP+n
	 mNemBNeRsf3Hdqctqr5FYggu2emJRsLgn/JtVTjg48ZFcYQPYon7lV0LYjCtlGBSfJ
	 A/C1ckURiwPigDbA3zWD5+e35Xn9rJ7hfz5a2PjlL5r3ZugWH1PIm/1vZVYOE2SHqo
	 qy9cqGIgD7Rfg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] serial: 8250: move mmp|pxa uart earlycon code
Date: Fri, 12 Jul 2024 00:07:19 +0800
Message-ID: <20240711160720.3488-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711160720.3488-1-jszhang@kernel.org>
References: <20240711160720.3488-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_092135_531764_9B1B2C7A 
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

There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
and the 8250_pxa. The previous one is generic and the latter is binded
to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
HW to support, making use of the generic 8250_of seems a good idea.
However, there's no earlycon support if we go with this solution. So
move the mmp|pxa-uart earlycon code to core 8250_early.c.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/serial/8250/8250_early.c | 10 ++++++++++
 drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
index e3f482fd3de4..2ab61d6673d2 100644
--- a/drivers/tty/serial/8250/8250_early.c
+++ b/drivers/tty/serial/8250/8250_early.c
@@ -171,6 +171,16 @@ OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setup);
 OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
 
+static int __init early_serial8250_rs2_setup(struct earlycon_device *device,
+					     const char *options)
+{
+	device->port.regshift = 2;
+
+	return early_serial8250_setup(device, options);
+}
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
