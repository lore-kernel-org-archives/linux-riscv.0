Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0BBC54E94
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1kvdRvaxilIT+0LZmbuI6wwWwKHbmnFSOElUhIVK8k=; b=i/6IAvt5onG9t4
	55Zp+JND+jUsBkXKsVC3+OQUPdaHOjr7ICiCxqnTgmvVJ53SQNfhbKP+JXDKGZeUMmrTc4ZsCAYrl
	KYaXzK+SKxrxoHYygDQAKf/A2HcRycQEYbUW6t1C2Bx6x2jSH7JeGvRx7TnYNLIF8fIKprTAzgAjC
	i/8mXgp9CO6x8WN9i5zmm1axVT/XcHdrnEwmB9HMZbfNjXIoUMak0tl+g2NWMqPYZEg5jTfcD3mIz
	Na9YtLmwqKuFEcuEFhgfVd7OjORp+mp3yduuqOb6pPnlUSJ+/1Z7JTa3hzV+CfZ2pajqOutvHA51F
	qwzvoKTzAd5c6beSRMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyYA-0006fa-6d; Mon, 23 Jan 2023 15:15:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVa-0005Mr-Mk
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id z5so11121920wrt.6
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
        b=YNHH8XRTX/01S31iQXYst52wcTTzbNbPtyQX8SbuGG5qAnPY1IAqJCxowByc5NAiIj
         EVn8g39hWWoxqwFSvp+seTBUawYQXnNdYFG80ce8+U59d80Q9psruK3xc4Ch80Q9YQ2K
         7nLXo8JaD+hoq87mrhJnw9b9r2JkD5hpoExRj3QchU725f9quBfOmlP3QFCp1yrmlIh+
         yN0fT+2BIch3oSwCfldxTIrUFhydcgT/dWrzIQtWy5fZU5RDfkbqSugyevH04iBrUfo4
         KkH+FZ5UVdtouXOh29sg6LYwdfy4Y6E8tyFQT+bxnvnvq0tiMvWZprOXXi1+E/vda0cB
         kxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
        b=SsqketAMDb6eA743InJTL/Et4OVa5qJuOJn4/uF8qT9y50JfNG289GFsMFTh4J81wF
         p5G5vyTgdqmZ6N280AGpPkGZzQIDu/T7eBUO4alftUH+HSNPyO52/m7D9NzQNu4IGS7Y
         oPuJ1f51NRWtmMQKgfIaomLM+4uAz9kiIBBkUADEtc6JKlXcXGG9jqwMHaqTmZ+mp62x
         SkB7SFBRn5QDgR3GqnnGpIX67PX+UP/80OEpz4Z9E8lh0kI1TKjWlXyZYzugWYneYd/T
         T10bgOS7TAIDou9cZXN5ld5e+/L+YFu5rfbb7pS3cEsxrAzEPZx4hhLR8gd2nWVdPlT1
         aiFw==
X-Gm-Message-State: AFqh2kpQuax0f34rL2vXaQx21BnSb88agPYt9HdlYLxWdHQly9xp2gLO
	nvdAGvIp7fowxpEYmRgOJDNEVA==
X-Google-Smtp-Source: AMrXdXsQsitf8BzeJXaPtKrY+OeCwfG0Ax0tXdx3cyfdOVAR+FOLMjW3bN2wF/BNgF4woch/VT2ctg==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id r16-20020adfce90000000b002bbedc70504mr23324176wrn.26.1674486798260;
        Mon, 23 Jan 2023 07:13:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/13] dt-bindings: serial: correct ref to serial.yaml
Date: Mon, 23 Jan 2023 16:12:53 +0100
Message-Id: <20230123151302.368277-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071318_837103_3321D8B8 
X-CRM114-Status: GOOD (  11.26  )
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

The serial bindings should reference the local (in kernel) serial.yaml,
not the /schemas/serial.yaml.  The latter comes from dtschema package
and is a small subset of serial bindings.

Usage of the local serial.yaml allows typical properties and children:

  xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 876b8cf1cafb..0c118d5336cc 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
index 2f4390e8d4e8..6f65e9a81c29 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
@@ -63,7 +63,7 @@ required:
   - xlnx,use-parity
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
   - if:
       properties:
         xlnx,use-parity:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
