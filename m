Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDE3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E5160E97
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19E5160E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC3L/LNLRS3dZzNRcRMlVQPkTdQn9FdOTCvsdpT2cQM=; b=BuwXaeDxUvXTx1
	wHhjaqIJvOxJQ5pMvOiHcuds8B3JAYk492dOMu9FIMGoG17NQy810isKVFmO2kryEIcs3dnE0XLHh
	NHMhqiLfp5w785cv9c9GiGTznGFJ56u59ufp4KVwt/MugCCvbEE6O2cPkcKNq9kaUU6tHZBJUhFI5
	llIAhB6h2zwJeENfpLkVsCXFTD4Tdk7knMxYQlqHIClX9jcXyeFnyTFfNgTzJAORrWc4B6gU+nYTA
	D1PukIK87j3Lgq154cTXWL1J4tGCl9yhiXimJBtYFcOQ5Rw95FYPkWMb+4eZ/xnAJQ2yKF2Jx3dgQ
	ciPcp3P10cO200VLVOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc6G-008Wra-5f; Thu, 21 Oct 2021 17:43:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5c-008WKF-8d
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id g8so3985397edb.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptUclAnClC/KmmGAr8nhcG6uMjRIYcBreeo6zNMjNJc=;
 b=FiKMgfWfdrsa0xi5VdPw2NT4Bn8OpRhZ+z70WsyehhOS6AA2ALCaezW4CeeQ9qymZP
 C2YvNEttXHPUeTLJhvR/QKgDx3j216qhepTFWRGYbVmoklBqi+W5hSOeXpunSOkrkkE0
 OHwEOgq6u6I5YinCiutlKNLpF6bTRst4ugRzdat/x0d4w2+ARfjaMWOLMDikLTQmXMhs
 5vwiZkC4WnieND7MBasl0SQsyYMvE52NtxK//G5o2vXzS4sI1cEjEuWdnPox3CbHl5Zg
 mpyIdwsTZfmVD05xKP9OLYNthwRrHpcNyd4k5yI/ZMaXspXfSOUl+1AjjBCMUVq+jMCD
 7tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ptUclAnClC/KmmGAr8nhcG6uMjRIYcBreeo6zNMjNJc=;
 b=1G/yEwcd3H7c+uS1lCk7E5Ek+CsaSd9Rr9P4QApAs/1QZnqeQ8INd/uSc59R+WHW0v
 zmjhQO3lmBFO5PxiYLI0nqZ5gkHhZgjvfZSNV09m48Gyy8YTKEP+oxsCmhfqWUMuhbrU
 d2JS/ug5SrtoumtfRQ6n4FGUCTtw9WaMl6AA2gjpl6Eb9AYjH9NSpzBYwho7bSMiflIS
 ex8XYl6k7KvjsiHMkpxZhWJXGj1caSuuFKKdoLKRVws60XFt8/t6Qs+6md4SNfU0bonH
 QadMzqr1tS2R+PtkIQVkIDGrzRvkhUpb06M62zhsxYp73pUvqUVAOjhC2ImTVssbcqVX
 jgYA==
X-Gm-Message-State: AOAM531beIjKCA68IDqkg9+YmI71egkms92EdBtGTG9kvvUaXgmnaC+6
 4FEWmxKiDFraOqC+G6+47BltuzdLyD0EYw==
X-Google-Smtp-Source: ABdhPJxw1sr2kfslrBtVHwBTMLw4gwFvfBhTBLh5oy3bCtzzxStQUaZw8hqDK+w6uOA4Vd/XkfmxzQ==
X-Received: by 2002:aa7:d14b:: with SMTP id r11mr9596878edo.173.1634838171073; 
 Thu, 21 Oct 2021 10:42:51 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:50 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
Date: Thu, 21 Oct 2021 19:42:21 +0200
Message-Id: <20211021174223.43310-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104252_387526_078B3EDF 
X-CRM114-Status: GOOD (  16.39  )
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

On the StarFive JH7100 SoC the UART core clocks can't be set to exactly
16 * 115200Hz and many other common bitrates. Trying this will only
result in a higher input clock, but low enough that the UART's internal
divisor can't come close enough to the baud rate target. So rather than
try to set the input clock it's better to rely solely on the UART's
internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5a2ff843ec5d..729b59b14ff1 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -50,6 +50,7 @@ struct dw8250_data {
 	struct reset_control	*rst;
 
 	unsigned int		skip_autocfg:1;
+	unsigned int		skip_clk_set_rate:1;
 	unsigned int		uart_16550_compatible:1;
 };
 
@@ -326,14 +327,18 @@ dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 		pm_runtime_put_sync_suspend(port->dev);
 }
 
-static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
-			       struct ktermios *old)
+static void dw8250_do_clk_set_rate(struct uart_port *p, struct ktermios *termios)
 {
-	unsigned long newrate = tty_termios_baud_rate(termios) * 16;
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
+	unsigned long newrate;
 	long rate;
 	int ret;
 
+	if (d->skip_clk_set_rate)
+		return;
+
+	newrate = tty_termios_baud_rate(termios) * 16;
+
 	clk_disable_unprepare(d->clk);
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
@@ -349,7 +354,12 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 			swap(p->uartclk, rate);
 	}
 	clk_prepare_enable(d->clk);
+}
 
+static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
+			       struct ktermios *old)
+{
+	dw8250_do_clk_set_rate(p, termios);
 	dw8250_do_set_termios(p, termios, old);
 }
 
@@ -417,6 +427,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			data->skip_clk_set_rate = true;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -699,6 +711,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
 	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "starfive,jh7100-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
