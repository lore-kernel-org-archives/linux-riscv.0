Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A91C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcQ0wGpDqkkMpeTtZxv2l1r7SG0TvNOudop4jvNb6u0=; b=tYIOezjTpKUZzs
	U+M/8gLYWwmFrYfxWQWfIArP4IAtp6jpk79q0K9WqIzvVL5CxvvHXxDuWVcmlojyapf70tRwJ+hKu
	KhGWYxqjvsLZq0KHnYBn6ZLgnOEy0Av5QQeyteRvsLtnFEhPZcC9Jetm0tFn/1UOIS2FJuwzjRNM5
	v6vDeTAH4H8AVZM8wI55KgCu6not2pFUfmOWNJHex9J9AZ36hfOL82h+8EJRMiefBdNL4tvN1+/iT
	ObBv249FJAGm2mI4gLGbL8XSNTDHkJaZVv6bKs4hrfN1BskMxREydiYSxDHH55+YY0454He6X4Qax
	a6rz/JmAplXmWGpvNidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yZ-00FNbq-Lv; Wed, 05 Oct 2022 17:14:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yX-00FNas-0U
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75B38615FA;
	Wed,  5 Oct 2022 17:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE015C43141;
	Wed,  5 Oct 2022 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990067;
	bh=xre7D3p9wYeZj6+yx2KL0N77FmYsyYWWTka8j0VWX5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZBCD8h7uQuNhjlcSS96cGwI5xKybHLO7BvB+He2Kt2jTfSBYPnOOKFhT8+a9PBO/
	 kTjYOM49Ya6AyKQS18MRMbx3QWxJQlxoU8uEWN2iBABWJzznTregD2EPz9tEaG91Ft
	 7f4jU+tifiXFq6g70/xYOPRMnX3C4UggqSymuP8moI47GWOAvNTJtGcdnbPGFCBZPl
	 qXMQTvEmhDCTEFNCzxdGFe7soaJr0Mlmxf+iu079ppqlqKCmQ7I1zSBzhLFM7bgpi1
	 oS9EvwHXKhta0Y3PDdnxsKwn2EetNc1nklRMmip1ksqYBXdHUsLisjo2uc7Hd/fgUY
	 94dLuNr7SlJGw==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/6] serial: sifive: select by default if SOC_SIFIVE
Date: Wed,  5 Oct 2022 18:13:45 +0100
Message-Id: <20221005171348.167476-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101429_115434_D43A3AD6 
X-CRM114-Status: GOOD (  10.72  )
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

From: Conor Dooley <conor.dooley@microchip.com>

With the aim of dropping direct selects of drivers from Kconfig.socs,
default the SiFive serial drivers to the value of SOC_SIFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/tty/serial/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 2a18a42a5004..768f1138c9fb 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -972,6 +972,7 @@ config SERIAL_OMAP_CONSOLE
 config SERIAL_SIFIVE
 	tristate "SiFive UART support"
 	depends on OF
+	default SOC_SIFIVE
 	select SERIAL_CORE
 	help
 	  Select this option if you are building a kernel for a device that
@@ -981,6 +982,7 @@ config SERIAL_SIFIVE
 config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
+	default SOC_SIFIVE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
