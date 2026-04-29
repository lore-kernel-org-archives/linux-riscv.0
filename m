Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E64FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L49lB+ueLV0I8jM3CL+TR8y59koy7Fuy6ace7ViheTA=; b=yvpWhL4GmqOoAw
	qrQ+ZY/LlSMY8T7fbCuo1VHta4pXuTi9PurHywXljAQMhxomKKqCIo0HZdKP9dW/3BHx5rTnmoLOK
	uht1z+3hXddRl2CcBGEmU/RaFNpJpCcCmJVJ7+j6z6vYdrt7nI7+4/TVhzwubhJqHCEpfLmzX3bms
	Lsm2jGymwxJsUQyB+Q02pFHYDe+r05ScpM62KmWOZl0XCdb7+WJOzm0QxBpCB1yTVHAzK9P4gcXYX
	HyhcMtpKaIjB/QoWDjPFDEExykeCfMZ5fGwDr0T3CwS9spfXe8W5UJg5AtX+AL1/Jh7DQyPmuyVjx
	WtXmfIeP+Ng1QfYdOEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0th-00000003IUK-17bS;
	Wed, 29 Apr 2026 09:07:59 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0tc-00000003ISQ-0GXM
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 09:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=W6qFc8IOjX0c5M+yiuQoc29Iohko0me
	7jng1y1x4BCM=; b=ePM4MGVpf9924uFeoKwkWH6Sw4vL3/gPeI1GfCL12EStSbP
	mLaA4gHrT+tyEcROYfbFJQoPrdeNMIRZ+L2VmlKximQqTpTATymifgNMpnxvFwsg
	HO//ddNKLQe7M8nRj50l8F4ogjZwl1Zz2lohXr6s6j7x1laOBto2z/5+B+/A=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUL1yfFp_SQDAA--.1731S6;
	Wed, 29 Apr 2026 17:06:10 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Wed, 29 Apr 2026 17:05:16 +0800
Subject: [PATCH v6 4/4] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
MIME-Version: 1.0
Message-Id: <20260429-ultrarisc-serial-v6-4-b2c852e0c4c3@ultrarisc.com>
References: <20260429-ultrarisc-serial-v6-0-b2c852e0c4c3@ultrarisc.com>
In-Reply-To: <20260429-ultrarisc-serial-v6-0-b2c852e0c4c3@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777453513; l=1792;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=+dtQ3f+XBoxv3HZDucz50ukJ2U/SQ+5U7lcx9cpy2/w=;
 b=hlZOX7ivuGaWLXDlOUGfAVrfPDA/0UViH6Qo0xE/YJCj8zdY3mqBetMt+L+KVGHX55O4+9kXC
 WHeiqaHbiOGCCSPoE3AsOgVveCcG2C3+pmFb3OdBPuQdRiqthSkXBQh
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUL1yfFp_SQDAA--.1731S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1kXw4fWry5Gw18AryfXrb_yoW8Cr4fpF
	47GrZ0vFySgF4Yg3WIy3WvvFZ7ua17Zry2k3srK347tFn8tFyUJrnakrWay3ZIgFySqw1a
	yF1Y9rW7Aa18Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwBFsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020754_288188_5CB705AA 
X-CRM114-Status: GOOD (  10.15  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 480f82d89856..55e40c10f46a 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -959,6 +959,15 @@ static const struct dw8250_platform_data dw8250_intc10ee = {
 	.quirks = DW_UART_QUIRK_IER_KICK,
 };
 
+static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
+	.usr_reg = DW_UART_USR,
+	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
+		     DW_UART_CPR_THRE_MODE |
+		     DW_UART_CPR_DMA_EXTRA |
+		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
+	.quirks = DW_UART_QUIRK_CPR_VALUE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
@@ -966,6 +975,7 @@ static const struct of_device_id dw8250_of_match[] = {
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
