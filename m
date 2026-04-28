Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304FDFF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 05:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2es9bC2792SUvpnqurPK+j98UaHsj9syNqyolnEaYk=; b=srQVJsDRnZeoMf
	xizOnfOa2Ujpy60IWKcspusdv1SPvguD0/EvC1uRRTD2T+wtFLXmU/h3jvWCPa6uFJMhExluf9PIa
	vUykcist6WcIeiBY1CmgXXUE6atJ5tcx7NUoMuINIhpVXhl4VK2AxO4XjkgTCWj8BiOSaFHyFEMJ1
	VWdp5qHq0lebPIaMgUAjInNObzCAqq/qhzKhuoMK2A8Q6a83BZZL3h23GnDfaSY/lGSqQ/ryKkyFD
	Lh63OQzyfQPZHS1gd455zU6DnJB41+OeOa6Pb1i21FZSbuFmkzUHlQraw+P3cSoLVNuRDKbhzz/Ex
	VFdCKi4C7gm5eG6B2ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHayK-00000000Zrx-0SyJ;
	Tue, 28 Apr 2026 05:27:00 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHayG-00000000Zqs-3Hbn
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 05:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=9i7uFJ3TqgWZcNGBsH0cl+nq2vGVqjL
	Xv8OMC9b26W0=; b=F0UDzJ5NTUIg4y1RQ+QTRZRwykmA6gMWpmMp4tXhdoIfW0G
	oMi+CsoNFJLehyqH9mbn5Z6ZxI+8ZoZ55TwLQEVeaQ+FU4eGX/7Ex4thslxa9CdU
	2Jbg4clEOszSmBUGBXXU+gK6Nb22l7cRNh++fx7uDGj8SL58/wDp/1NWSyhg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIxRfBpJRMDAA--.1785S6;
	Tue, 28 Apr 2026 13:27:25 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 28 Apr 2026 13:26:29 +0800
Subject: [PATCH v5 4/4] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
MIME-Version: 1.0
Message-Id: <20260428-ultrarisc-serial-v5-4-97de63b1e3eb@ultrarisc.com>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
In-Reply-To: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777353989; l=1780;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=X9UYu1zooc3rzPodVEod6KEBoXrIW4ahtjph2K7oVQU=;
 b=z+2OmzPT06i+BL/PBMHsAPWM0CsEXx/6xG+PPE3jq0YSHs39Q5ti1ZP9xbKZURiMVfPvf/5d/
 zBZDV04HI7cCP2hu7of2SeqMcacmTLJKgz7AEUYULBpuVZVgX8ojZDY
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUIxRfBpJRMDAA--.1785S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4UJFyfJr1UCF48Xr4kXrb_yoW8Aw4DpF
	42krZ0vrySgF4Yg3WIya1vvFWfua1Yvry2k3srK347tFn8tryUJrnayryay3ZIgFySqr1j
	yF1YvrW7Aa18u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAmsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_222657_595683_AED41180 
X-CRM114-Status: GOOD (  10.16  )
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

The UltraRISC DP1000 UART does not provide the standard CPR register used
by 8250_dw to discover port capabilities.

Provide a fixed CPR value for the DP1000-specific compatible so the
driver can configure the port correctly.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5cf3bb74b285..6fa7c8440919 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -960,6 +960,16 @@ static const struct dw8250_platform_data dw8250_intc10ee = {
 	.quirks = DW_UART_QUIRK_IER_KICK,
 };
 
+static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
+	.usr_reg = DW_UART_USR,
+	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
+		     DW_UART_CPR_THRE_MODE |
+		     DW_UART_CPR_DMA_EXTRA |
+		     FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE,
+				      DW_UART_CPR_FIFO_MODE_FROM_SIZE(32)),
+	.quirks = DW_UART_QUIRK_CPR_VALUE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
@@ -967,6 +977,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
 	{ .compatible = "sophgo,sg2044-uart", .data = &dw8250_skip_set_rate_data },
 	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
+	{ .compatible = "ultrarisc,dp1000-uart", .data = &dw8250_ultrarisc_dp1000_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
