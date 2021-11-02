Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9A3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC0960D42
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAC0960D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12I7q/sgUf8hgvoBWnr+C+NhyqFN+nzr/QJiuu6BAlc=; b=fwdwKacV03snek
	1UKhqwwWIRhmcyHTqTqokw5yO/0JfKOwm33jZrVhACW7oHApZ6x/8Q96LRhG01X7BRuH7L3hZfG0w
	1DTxB8ftRxcnGkfcTVr2tKcBMU6Fp+RqqCo6wdXQWf+f89riQ+Gb1CoLkNA1r2XERAZVJmIm+KWSE
	C9lA7metjMXcTT+FO3t+qDgoRW/XJRaX+CiLnsg1TpT1x7jyUnmV8rVAyJntP6NUSekyou5bUI/aq
	8JRTW/BOrXKaq+rfXNWgZfg8Hie220pU3+3YlJrpVDB63Jp2k6Ub35KDv38lSIe0aM//xDvrsprsf
	iPolRiRi9ZBS1WvRCrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwP7-002G6J-9E; Tue, 02 Nov 2021 16:12:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwON-002FZ3-Pf
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:12:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id o8so5957356edc.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oChZexBEmg8WI6ndsB5CJakRHDalhGMyW/tZtwb938=;
 b=CSQu+c6XJ4HC0m0lZYLU7Mx4nM7OgTqV9JwueDBcTBjvnKXGS+F/DYFBFwDLSMzt4Y
 9JL1FX5cXyElKUOQ+K9kFe8NXCv+FzZBwdEGRL+e14D3d2xFunWrjGfqLS9u10vYGRJ0
 huFtRvcf08YqwDCV49oAa0YaQKaVWK4pL1WDggTYR59IvC9icz9GzW+mVza4dq38glsB
 374ooxSyPWUWvMl9Kc6z6gNfoudslieJYCaCRruwcGUkYUqYi6encphKnzgYj4Fb44hh
 KRF0CaLF//10/he2VKMEhIx/xnRHq26zpHYt0UT6cUxv2drM/v6mi1OLdUxcaTwnBFNH
 BtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6oChZexBEmg8WI6ndsB5CJakRHDalhGMyW/tZtwb938=;
 b=jn1yM8gEW56R5mpzReC0OT9hSmb4uoz90yU/6igR+XLi+9EnsFjLwpLa0jb3RX5Jia
 Y8k9lwxY31MtQEuPoeaz+lIe4XFa96D4pXcrPJHhy3UoOe66na7QScqWcbUwVvX9/CuT
 tDEZ1jLViotGuNN/qtyFKV8SKHGW9k7DmNGxMZrHe0FPK9zqL4wcMfvziRxKiEg4tkLJ
 O35LHvRJUavA+53Q2INB16SeiTvHK9xPXGnU4WbIuEq8H9r5kNWK8HNDMmTd5wXI+zG1
 enjbkjrxR62fe1D98BiIYDKG8LE8bBGCZtOjrxHuPolVyf0KnErf9zu+ua3I/NdZwHcU
 EVsA==
X-Gm-Message-State: AOAM530VS3OLyU+b4fakfxIPJoMWsMpEd2R/03DzMgI3OndZAY/IIlMz
 rAD/8z09zfpudNwuim1cVhDoXcEDX8w+Cw==
X-Google-Smtp-Source: ABdhPJzCcM1ilYetQYchEbynzYayVj4dcnnIvN2Lr2gg/jgfWC+GfAtxp+cw9X1a2VGUZ28otSthzw==
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr44714597ejm.37.1635869526247; 
 Tue, 02 Nov 2021 09:12:06 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:12:05 -0700 (PDT)
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
Subject: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
Date: Tue,  2 Nov 2021 17:11:23 +0100
Message-Id: <20211102161125.1144023-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091207_891214_96479270 
X-CRM114-Status: GOOD (  14.87  )
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

On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
exactly 16 * 115200Hz and many other common bitrates. Trying this will
only result in a higher input clock, but low enough that the UART's
internal divisor can't come close enough to the baud rate target.
So rather than try to set the input clock it's better to skip the
clk_set_rate call and rely solely on the UART's internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 53f57c3b9f42..1769808031c5 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			p->set_termios = dw8250_do_set_termios;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -696,6 +698,7 @@ static const struct of_device_id dw8250_of_match[] = {
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
