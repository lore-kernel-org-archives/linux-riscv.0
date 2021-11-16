Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B6EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B636D61178
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B636D61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ11D0QNhOEEAtFa+LO0VOFhdUUY5B440IU2GpB18LM=; b=X8vdSpw4YqZrCy
	nJvDQSMKeCGSxZXiDe7/ySrE4JmgOAGAd9NLcha+EEUpoDXJDPdjK51E4HXay95sglWcBTwy8KJ8L
	Qo7/EkD4QC+xT0A9xl/HKwybJV+mOCMQnGB25zIzHfMv69oo9V9IwqKT+x/KAE5x60HKOVIwZZM3L
	lLvRrBWjs+W0EDzaLzdt1HxBCaFLRtr/dzf7ur8B1MPJWVmVtQZc8elGBt2pRdwoK7FL7X2gKyFu4
	lN3f9qWl+1Fa/bI4LUnmd8cLiwNcVifnUzfnyt1LbQxMbOQ1MwDRchFvJT00qbiwT7hsQE2Y5mBos
	9mPOZEV+X3jIb/yVdcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzyt-0024CP-Ct; Tue, 16 Nov 2021 15:02:43 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyb-0023x1-3k
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id x15so89212422edv.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pprlQQrC3e4SR43dlURXybUN17p6YfB+zpLDI5SbPMo=;
 b=Ihg2ksTlUfZMj2Xi4GUUAqtc7R5Kf8Oh833r/M1+6NwUDNPDVkV1IvkoyzvaoJkOGH
 7htZt2TN4YvCdsRRa8dcj+9eKk7xFFjWu8eELhNsLqGAIWsw4XUcRfaxyoV3b50YIZHP
 ovXfZgvJlvgrENvNoLGBRBH4IfByp2ZKKyZcQJjWsTRRmDmGJreHltD6pAsKIc5ynfhn
 yYejvbFEQ3LLeC2b9jew0MOLPsnTqpvnJiumS1Fizq4jrJun8MKf4fDGSgiHVeK+Yy1q
 jScCO+SFRuLjY8dcw99PH5yAkjhCWlTQSLqwfdu3q3HT08nFkn13pi36jK1G2Ft0MPxd
 FHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pprlQQrC3e4SR43dlURXybUN17p6YfB+zpLDI5SbPMo=;
 b=AZgj+vNkcfSNhq83fqNPMpbdS/FsSqqMZi5nrK+OiL1gAvycBHDdYjZCbjX0x+EM55
 u+ViQjz2zuz4Uxe5hJ3dEqS9Ck1YBzAeEOQVJ2htFaESg5KovimWC+G485b49OAsftkK
 gF2rPyXHUUNI6eoKoE9WSDyr8PcFYOzTilsOiuY1uYx4EKZR72yiW88mWMgnXLrvVckz
 u9hDsNYl25mD2eS+86dVqgednL61rr08cQmnGCTkYI14MrxYhdoWIX++5iN0JINcE2TS
 mywgqs9NpDxwzR6c6kaAUdI1U/rqUJVTvo+v/J1U7SHcWKfg5vjrTvy9hDPNMWyeFL9s
 cFGw==
X-Gm-Message-State: AOAM5336t7vxy8z0KJg9klTdjp3d54RbJXC7adftzf5Y03ARNga7fwke
 8ougbOYlx2nnBQlLqGga9jiSfgIEmKvBBA==
X-Google-Smtp-Source: ABdhPJwRgX8E9uRvMmlHIDeM54xPkwChrHpz2rq7KpOqT3ij+uMWBF5Hl3T5cQbXnKSNpsSqfkll0w==
X-Received: by 2002:a17:906:b51:: with SMTP id
 v17mr11014072ejg.262.1637074940749; 
 Tue, 16 Nov 2021 07:02:20 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:02:20 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
Date: Tue, 16 Nov 2021 16:01:17 +0100
Message-Id: <20211116150119.2171-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070225_196611_F970128B 
X-CRM114-Status: GOOD (  14.40  )
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
