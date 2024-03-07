Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D015AC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPEyzVy0hnYDfP/3Y/TiFJCekUj883CNH2LNT4g0WGo=; b=KTjly3A2n1PMNs
	bxAXnWCbPZkxG3u8tqOCA2X7Rj2W8+lMkRaqsuUTT3go7qj26ahLtMywo42nDCxdQStI/FLQdWY9k
	qSCsPpsOTG0n/apbsxX4j7zIjbCoxA7/tfh4xAPZUEy8tdE0o6dMXxDfmF0bQOGUxGZjKaE1p+hqL
	bTY5ohz94815lq82JFouqKqSsAgZk7+sp2RBDIzEBw48vyKYmm3gE87iyYb5BOa3nbiUUpbujQ43B
	6DqEPtyvb+SUkE385R43o+kbdOBjUnncB83AU3qTVoM5faZIRbsJjqrNrqo+NcQLfAGA5jjTD2TWR
	RKQhDtNfq9F8+q30uo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9lM-00000003lvb-1l5K;
	Thu, 07 Mar 2024 09:10:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9lH-00000003ltJ-0SK9
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 09:10:02 +0000
Date: Thu, 7 Mar 2024 10:09:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709802591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fGy8TOV/fhJE5oAAJ3MAEukbtM1398/CRgKOFV6eys=;
	b=mPVysM7EoFM4MwBJX5dLlMREizUcVcXH68EeHfMf1pN8zuiLtxnnrEGRK1G/i5Fvj+vUeV
	KfPvxIXfsPJF8mLiDPWUElFUhIChRZBPSzhhFrhOhg5ViJb/gMtEBT9UnLi7UfYObl5HJE
	yru3dCz5QQ2qng+gZBj9DGvjOWnrrnwNvrf0OiqpkWIUni09VnqZh6lsoFiUMI9AS7EDj/
	YUr5pEcHNG2Zjw9wYua7RLYC0yFRGDzCYFRu8j4OPNhWNXVl/7xgVNBdymlcEpXzM8rRG3
	NAjdcV3qZKN1p7MNR2vLjNWMPGyk02KEqs64zAYLNkQrLsX7ow0cmok8MnEwRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709802591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fGy8TOV/fhJE5oAAJ3MAEukbtM1398/CRgKOFV6eys=;
	b=yTSiicPW+BxkoaA11akToXnzY5400u66BAX3bq30g8xtpnXF+EDylMIy/6mMBf/he1xFZq
	qko7K2HqfY55xHCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] serial: sifive: Remove 0 from fu540-c000-uart0 binding.
Message-ID: <20240307090950.eLELkuyK@linutronix.de>
References: <20240304105947.SJcVAdr1@linutronix.de>
 <20240304-whomever-gladly-d43da7ad2fe6@spud>
 <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_010959_319604_035EEC5E 
X-CRM114-Status: GOOD (  18.64  )
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

The driver is using "sifive,fu540-c000-uart0" as a binding. The device
tree and documentation states "sifive,fu540-c000-uart" instead. This
means the binding is not matched and not used.

This did not cause any problems because the alternative binding, used in
the device tree, "sifive,uart0" is not handling the hardware any
different.

Align the binding in the driver with the documentation.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
On 2024-03-06 18:48:13 [-0800], Paul Walmsley wrote:
> On Mon, 4 Mar 2024, Conor Dooley wrote:
> > I suspect that the driver is what's incorrect, given there's little
> > value in putting the IP version in the SoC-specific compatible as it's
> > a fixed implementation. I'd change the driver to match the bindings.
> 
> Agreed

I didn't add any stable/ fixes tags as I guess there is no point in
backporting this.

> - Paul

 drivers/tty/serial/sifive.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 0670fd9f84967..cbfce65c9d221 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -761,7 +761,7 @@ static int __init early_sifive_serial_setup(struct earlycon_device *dev,
 }
 
 OF_EARLYCON_DECLARE(sifive, "sifive,uart0", early_sifive_serial_setup);
-OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart0",
+OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart",
 		    early_sifive_serial_setup);
 #endif /* CONFIG_SERIAL_EARLYCON */
 
@@ -1032,7 +1032,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
 				sifive_serial_resume);
 
 static const struct of_device_id sifive_serial_of_match[] = {
-	{ .compatible = "sifive,fu540-c000-uart0" },
+	{ .compatible = "sifive,fu540-c000-uart" },
 	{ .compatible = "sifive,uart0" },
 	{},
 };
-- 
2.43.0

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
