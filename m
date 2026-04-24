Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44102FB44A9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 05:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjwepNm2JGbySD9uNQmk46egwvvwHTGcamYo09Z0z7U=; b=JyQmV9MdIKjW4+
	O5OUwkcjFgikklb3r4/m8wuZYH4axaT1Gju7HYKjbR7ouu0tHAF5CA4qukGzyX+IQzHa/mvehMDJN
	oPAnrwHE81yqBwDelCnpq0CfglfwNsIDClvX4O0pDL4F4YLIPf6J26HfBdJRF7iKokdywLIFWMnsx
	aCSi2aBJBXNUqouJcdMIeNcjxstE5ETu9dH2I/InyUu8B7ZMoSMk3A02JKlSLpT1XEInxiy5l4Dqs
	WGR28wQerF2ZcuhFIo6czzu7bKzwx2blhyXZakuUOODOUAm7nM/S+o9jGyZfN902BMABRKYKaY1QF
	BjG5lA2calXA3PJxFaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HK-0000000Cfkp-1EGX;
	Fri, 24 Apr 2026 05:40:38 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HE-0000000Cfj3-10FP
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 05:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=8wrob9Daxto0frjCO9kTiDmebSamY8F
	0wvOiZo2Wv/A=; b=Dwjm1rh9Y72sdhjNTkxyPk21cMoqrvQHTu+KOH6UzPVq5Vl
	dpiLDzyRgiDkXQqv1AkJxPbkZXQGnf+xEDCbPVOGfcj86nRkjNiFhoERAy4XXTho
	hetmlqK8sj183qHGJszug/yiWJWF4nn6MsIP/V2xY21xi7UboH5tjRyM5hqQ=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJlAutpm8gCAA--.1607S4;
	Fri, 24 Apr 2026 13:41:01 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Fri, 24 Apr 2026 13:39:29 +0800
Subject: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value from
 DW_UART_CPR_* definitions
MIME-Version: 1.0
Message-Id: <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
In-Reply-To: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777009209; l=1168;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=HTHcMLZd+/gml+w6WBkPnmnH8R279yZcH3zi2ysECik=;
 b=QGIhKX7pZzdyO9ol3x1IAjT1O0fwef6z/6u5w9ldLj2mK4gRr9hxSu3IOK57oVxxpHRaq6iUw
 WcjaEeJuCQNC+5hFrzkCmYoflsBpUInmdef4bHnlFW2rdpTFE+muYoJ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJlAutpm8gCAA--.1607S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWDArW3XrW5GryDAw43ZFb_yoWkZFc_Ga
	ykWwn3Jr9Fk39aqw4kurs3uayFkwn0qFs7Z3W0qa4qy347Aw4Du3sxZF1DG3WDZrZ8Grn7
	Ar12qr9ayr13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8ACQADsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_224033_159595_290BC2A2 
X-CRM114-Status: UNSURE (   8.47  )
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

Replace the magic CPR value for Renesas RZ/N1 with a composition using
DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 467755bf0092..d3c2c9c84d9f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -937,7 +937,15 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 	.usr_reg = DW_UART_USR,
-	.cpr_value = 0x00012f32,
+	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
+		     DW_UART_CPR_AFCE_MODE |
+		     DW_UART_CPR_THRE_MODE |
+		     DW_UART_CPR_ADDITIONAL_FEATURES |
+		     DW_UART_CPR_FIFO_ACCESS |
+		     DW_UART_CPR_FIFO_STAT |
+		     DW_UART_CPR_SHADOW |
+		     DW_UART_CPR_DMA_EXTRA |
+		     FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE, 0x01),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
 };
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
