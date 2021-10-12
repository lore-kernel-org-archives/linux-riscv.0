Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32857C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0305660E94
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0305660E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl2127vfqvDHY39KHoIBceatUkDUg1+y5JahMmraEvQ=; b=baZ3hX7b/Fh8Md
	3uOy+70eK/Ejaa3MnvCerfLZayaO2ya/Hc13JTn8oYSf2s9+Wzs8cgiy/JBhOa7LFeGHK/QfPlh2i
	S3wahl20rNFpnEq+JzphTPPhEmNjYkJjmc4fB3DMW00jVujfruzIczWK8I1K3EDaE6yXZWzMAORjm
	01KTzQEQxN2Nn6uU0IXkSGL6yJsp8ACUnXHB1GBsPaP/GZSCO7+25U40sajuTEQ9IRN/6+CQ4CQuF
	jRHY7I1Q7C0i4h9EMD9wa8SAd4n1XyfTk1EvV/nkqyG73o93eTMQ81Wx9PKjCPP45q5tDhdi5/jp6
	WRuI/Og3k6Hi15CwkHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI40-00D3OJ-JG; Tue, 12 Oct 2021 13:43:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2v-00D2jD-OG
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:42:23 +0000
Received: by mail-lf1-x135.google.com with SMTP id u18so87638704lfd.12
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvxmJqCnzTrLj1Lk8VsTVozn/1nTi8+XXqTdTbOzc7E=;
 b=gyS8mK9BeY9rImNNHupqoTLQ//AjDrjAg6RzBzZZlvCkN4qYhU9QtyfX3c8vv6Uh69
 HS58i1QObwOgsJPzeXA+F6CKpzOdn+Vwtjea9nSfisXp4sNLWoapXR9EZITycET/66E0
 uZNJAKSyg56wzyusFKZRMWZL6gk1p/U8L5UnHo9dO+DubBVzrsztu03Xp5WWkfUsHcyw
 zLgg9NQKkhQWMj33zIVse7FZvVHf4cIm4LDJQidZNjuIRYUqUx2tPcKFyN6goGOuNSlY
 9TOx4Egzz5w2rQBxf2JKP5XoMRktlPLQ4GBYOHEOt0FIDRGyNG9QeqEINuvLUMlIh9uw
 nZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LvxmJqCnzTrLj1Lk8VsTVozn/1nTi8+XXqTdTbOzc7E=;
 b=5buxU37gEQuqOGHEuM6fZgacoi53vCLQoSJ0i5lpD+9wRbX8Xt3iBYQnQyWgtZxYK9
 7eTX1Qy0DMvlayY7sNy4yebhQ7R75/LVQ3C/7Ubjj14UfOi/Z/ZwsnzPWVGt6v58XZkE
 KuZBpRMwXUiwIXdu6WlABP5I1aQEd1G9msFqvLAzmHofSgP96o6IXUMKaLkHBLBrhJw0
 2ZeKAviTCXu/cZh8LoJAUfJHGPBsg75qA/KpsivFTojCE2pLTYPwAsPcppsJd64uzn6S
 7Ums2fwQqazqyFQ1kUMUDO5AiyhOuQqyeu+BzfFcfpGYjDXCAr+0XtFEDm4P3fPxmtZ3
 aEOg==
X-Gm-Message-State: AOAM530pIN1+VPlkVGAmJPY0cJejPykk2H5apMtCrpcE8usbjmvCA93A
 9s7KC7vKS12jnWeu/iYjm9LYXNgKT1aW+w==
X-Google-Smtp-Source: ABdhPJwMquktNt2X9WrmpAzx7SS52yV8JYLyAzxa4lRbFyIoobAtJtzqqhKD2ufoWHalRzQYNF+Jxg==
X-Received: by 2002:a19:6742:: with SMTP id e2mr4264528lfj.568.1634046137382; 
 Tue, 12 Oct 2021 06:42:17 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:42:16 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
Date: Tue, 12 Oct 2021 15:40:25 +0200
Message-Id: <20211012134027.684712-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064221_860687_D3CE0250 
X-CRM114-Status: GOOD (  19.74  )
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

On the StarFive JH7100 SoC the uart core clocks can't be set to exactly
16 * 115200Hz and many other common bitrates. Trying this will only
result in a higher input clock, but low enough that the uart's internal
divisor can't come close enough to the baud rate target. So rather than
try to set the input clock it's better to rely solely on the uart's
internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a3a0154da567..dee26c0909fd 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -51,6 +51,7 @@ struct dw8250_data {
 
 	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
+	unsigned int		skip_clk_set_rate:1;
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -334,21 +335,23 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	long rate;
 	int ret;
 
-	clk_disable_unprepare(d->clk);
-	rate = clk_round_rate(d->clk, newrate);
-	if (rate > 0) {
-		/*
-		 * Premilinary set the uartclk to the new clock rate so the
-		 * clock update event handler caused by the clk_set_rate()
-		 * calling wouldn't actually update the UART divisor since
-		 * we about to do this anyway.
-		 */
-		swap(p->uartclk, rate);
-		ret = clk_set_rate(d->clk, newrate);
-		if (ret)
+	if (!d->skip_clk_set_rate) {
+		clk_disable_unprepare(d->clk);
+		rate = clk_round_rate(d->clk, newrate);
+		if (rate > 0) {
+			/*
+			 * Premilinary set the uartclk to the new clock rate so
+			 * the clock update event handler caused by the
+			 * clk_set_rate() calling wouldn't actually update the
+			 * UART divisor since we about to do this anyway.
+			 */
 			swap(p->uartclk, rate);
+			ret = clk_set_rate(d->clk, newrate);
+			if (ret)
+				swap(p->uartclk, rate);
+		}
+		clk_prepare_enable(d->clk);
 	}
-	clk_prepare_enable(d->clk);
 
 	p->status &= ~UPSTAT_AUTOCTS;
 	if (termios->c_cflag & CRTSCTS)
@@ -418,6 +421,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		}
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			data->skip_clk_set_rate = true;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -700,6 +705,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
 	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "starfive,jh7100-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
