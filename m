Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7631C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njAaXhGHY0podj49oUsf7vHs/+T02kjosrjNpNvnJik=; b=DzZRB3STD8fMAb
	h3rDgDyBCwtELr4mopiY9ym26HUEhyGi04e4JR6C3aPaoL6+0B8Mq16B+uk/Ycba9UW+1LyUiIvAh
	8A1f1BiY5MCAsEuNc/05b0CB6t8mha12vdXVx5GxU9RGgWxsu29GiifhDOPbx0ZVXpot+gu96LMwo
	UjGuBnkitgUezbOur8XKxC2V0lO4nm2NrkpYvyGA3Jl6MLoWvq38ZGcR3ihUa6aWt8iHanB/Xpz2O
	WGIACnE/fbvXbln1cmLM08k3lIcFu/qlmzXlov+dVLbXvaVstgO6PfJh+4AT5k3tsHjm+OXpAVWcC
	Pq2Ff01rsLwExiSwjaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsQ-005RCs-AS; Fri, 23 Sep 2022 18:58:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrt-005QgG-OC
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 25B1ACE25A7;
	Fri, 23 Sep 2022 18:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58CAC433D7;
	Fri, 23 Sep 2022 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959462;
	bh=nEAyYG0+yZlMeQkwsgjrD0O3Hhbsi2XdAizjKNQ+JAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7VW02PdoxtJVodBn5qtAGlJ4nfZWLpi4Rq9XPzt2ii0Av8tFb2sU5OtUCZbe8uIf
	 JONyZhV7Kv4RX2p3qztr+MISr1Wjdt8KurnzfSXxUfFEPubz9zaE34R9OCYKZfgt40
	 ohBk4MDLF2RDz3dJwI7n94Gsbr+YPm/qxR+55i+sY7b0gTSVEWZxTwxR7RQ0zsweTp
	 UKtF3Xo/E6F3hjf4gi5mkMVOBWmj+ZqWKStthMR7TRbChq0SI8YESuscIf5DVo9PHW
	 U2OyXQDOtale0jT+UDfn38sQBWQlkzeCw+AgZdvlHHabNPqgR1gKP3xCM6ZHSSQsJf
	 6l4a/uuG3RBlg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 15/27] serial: sifive: select by default if ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:54 +0100
Message-Id: <20220923185605.1900083-16-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115745_994064_32A8663C 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Conor Dooley <conor.dooley@microchip.com>

With the aim of dropping direct selects of drivers from Kconfig.socs,
default the SiFive serial drivers to the value of ARCH_SIFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/tty/serial/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 2a18a42a5004..daadcfe2703c 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -972,6 +972,7 @@ config SERIAL_OMAP_CONSOLE
 config SERIAL_SIFIVE
 	tristate "SiFive UART support"
 	depends on OF
+	default ARCH_SIFIVE
 	select SERIAL_CORE
 	help
 	  Select this option if you are building a kernel for a device that
@@ -981,6 +982,7 @@ config SERIAL_SIFIVE
 config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
+	default ARCH_SIFIVE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
