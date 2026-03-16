Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2836F30298
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnmLmr1Lqy5niMw34BCLG9dhWYUQjoD1J07Y5magDmM=; b=XQqzFdHFakOSeb
	BekkRrq36Tsw8v1q8ai/ISYrDn6dB/arDg9q9YL/4HQs9YbhP8ih6JUiYzmMww+cVl8OSH4Ydtv3n
	BChViqbJn1qWzQwUz+zNSAXnljtiWBEcOYn4G4EA39XKhsgGmLMXw9JMXMGL1UNIdhKCgvjMEaWbU
	fMhhaJ1wRsvy/dWRcFQDnrBX8k/qC0YgkAzOLvkgWxbdbINMQLN4DilhRonit73Gb8zHwwMNWaXER
	1wYCTeoCAfPlxrKf7ukSXbRkTHJQfRww9XVar2jHuHEFt3Ui1xO6muAeSRFViDb6A8aGPPH82xQmo
	NA7g18XayhS9HoaLPtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wv2-0000000374z-0yNN;
	Mon, 16 Mar 2026 01:38:56 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wub-000000036ju-1NZX
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=8ig7C87ryqsS5WSVgx5+YTbbHZo9k9s
	uFES/R2cgBPM=; b=RxbYvFP+WXSiVet5Nca9wzp9u3WbkOu3WMQNw9LgeQHuAx7
	pjLYGt/jV/Dl7cZqm1LGzF/LXLMsp+NpQL2UrqUe1G5HdP1liwI69YpJNZTRUb3x
	tWHwj2QbxUS2ILIBG7w+ZRo+ozZxAaEfQtDFUoXvGEMG1eXg05wd1cFkj3EY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAHtSQNX7dpnx0BAA--.1023S3;
	Mon, 16 Mar 2026 09:38:21 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 16 Mar 2026 09:36:18 +0800
Subject: [PATCH 1/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-serial-v1-1-c464f3e933a5@ultrarisc.com>
References: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
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
 Jia Wang <wangjia@ultrarisc.com>, 
 Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15-dev-5b4ea
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773625052; l=2191;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=gRRSp55pRniZyx6sAoUvfL+vjmmUJve5ICYBYJttQq0=;
 b=RduBJkDDCED22b0LiiHvOkF8LTSkbNYBogdJGNCfFTZ6l3d2XVzTwddUvq4DnBO5zK7XFCBRe
 k4okA57GlhgD5iOZSCGd4+wwIk1H27b1IaTfY5i8R7+esuBWUs11txm
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAHtSQNX7dpnx0BAA--.1023S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1UGr4DCr18Cr4UCF1xKrg_yoW8tw4DpF
	W7KrZ0yF9Yqa1a93WxAan0vFZ7u3WrZryay39rK343trn8Kr1DAF1xKw4Yy3Z0gryIvr12
	kF1jvryxZa47XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQlb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
	xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRZ0eHDUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQADEWmxBggAFQAEsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183829_769883_EFD9759A 
X-CRM114-Status: GOOD (  10.43  )
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

From: Zhang Xincheng <zhangxincheng@ultrarisc.com>

The UART of DP1000 does not support automatic detection of
buffer size. skip_autocfg needs to be set to true

Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index db73b2ae17fa..6a2acf173331 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -56,6 +56,7 @@
 #define DW_UART_QUIRK_IS_DMA_FC		BIT(3)
 #define DW_UART_QUIRK_APMC0D08		BIT(4)
 #define DW_UART_QUIRK_CPR_VALUE		BIT(5)
+#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)
 
 struct dw8250_platform_data {
 	u8 usr_reg;
@@ -514,6 +515,11 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
 		data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
 	}
+	if (quirks & DW_UART_QUIRK_FIXED_TYPE) {
+		p->flags |= UPF_FIXED_TYPE;
+		p->type = PORT_16550A;
+		data->skip_autocfg = true;
+	}
 	if (quirks & DW_UART_QUIRK_APMC0D08) {
 		p->iotype = UPIO_MEM32;
 		p->regshift = 2;
@@ -789,6 +795,11 @@ static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
 
+static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_FIXED_TYPE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
@@ -796,6 +807,7 @@ static const struct of_device_id dw8250_of_match[] = {
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
