Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E57CC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yrXAGhBaU1sIKJhdzCUzFp6AjQDEgAkFAbCl0bUfBQ=; b=42Qj/Nb/DQroQd
	zfEeshcXO4m5q/C2yua6UY9LTdwKnXg+BKfudfJ0yrO01SfvcAVODGLIr98I+FKTmc7d0XQTwP9Ka
	Fclu34V2UFkc95kD1qGcIak1tWiUlKfvmxPQj1TFI+r+bf0C+xWpPYT2LgxEm2K1vZLXv3Jyq5ZUX
	y3ivBNH+Af3JJo8frd8i2v6071J6pDa3ISHkz2BHoQwfpRFtgxIVuXTaRSSWbdP7frsc6cwZ7ExKz
	tKdpb5XPhBf2kF8ZbFxxnV0TIrQTzsa1igXKyWuNV+i8FVzJvAX8lkkLZWli1/MDhPtYUu42yv8QP
	IGqNPY58o/siFEncM0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyak-0007wT-LR; Mon, 23 Jan 2023 15:18:38 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVp-0005O4-7y
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:34 +0000
Received: by mail-wr1-f50.google.com with SMTP id q5so6463610wrv.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
        b=Mi72DTL6tAALC6SIna/EYeljNK+x72L1fQHn0b1YEpyxHOIwdo7XpXHQYH1v8pFPYx
         fmUE0AaGMQXJ1+36vD3ni3uf1224xM1WNmz+i4XR8e4pGQU3IJlFT/KKLHBQ/2HlYrNs
         jmhPytIJPCOE0D8UMjqY79KK5b+OCVoCoNT52ocRcj9Px5K4Enl/91hVP2hkBtz0GW0w
         VsK3JW9EqX4DrlURobQ3JwR/uIlfGAYWgRx+1xfPEkoSh0iFHIfr5nLHKhjReObKDoqk
         7Tf9YV/GjMPb51Wqn9yooA01rZZhY7mE8t+kA5amjH5PDNJonj9rRt5aQuAhPwkKstUs
         y5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
        b=vBT4rQuSbuSgP/PXaCtiHm8siUDZssnZrACnWqON+ynrKRzcE9ERheT3cEXufxq4ip
         AYT94VHpsWg1U1rYit/DdxZwdSeGxBWF3QTEld4M5ukMDfAjDf3u9PNEGzv5uxkId3Ae
         b/Exy+cJFHgP+RKzm6UeLOT2JOO3mvsjMJf5FUqWvBUTK9VJ41gC/8H8ReRsnM7ItDRS
         0Dp820n8isLMFaO/X147pnuB98C4jWo/mms4nJZZxlXCn5dKcaVU06+aWtG3SgOv8AG4
         x1ZB/lrNkeAnvQJY2Dlw+FheJdbB3f7gfAsABBNgqmOUmBtKSc4X8WDnvrJDGhSgxr15
         g4HA==
X-Gm-Message-State: AFqh2komdHQcpsa+jOgHtIucfqkJcjI59CxxXlQdpmFyG4dgQLcnpJu9
	0gmVpsoPzuhJgUQBG230WRV92w==
X-Google-Smtp-Source: AMrXdXvJabtie04RRzjvIRinzzoYqsygtV5Ygf34wHors5C0a5stz1Lsh6Pfo6+L2PQMDAPhE/FPew==
X-Received: by 2002:a05:6000:1d92:b0:2be:3ccd:7f37 with SMTP id bk18-20020a0560001d9200b002be3ccd7f37mr14760288wrb.52.1674486812732;
        Mon, 23 Jan 2023 07:13:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:32 -0800 (PST)
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
Subject: [PATCH 10/13] dt-bindings: serial: st,stm32-uart: drop common properties
Date: Mon, 23 Jan 2023 16:12:59 +0100
Message-Id: <20230123151302.368277-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071333_331317_A4343FC6 
X-CRM114-Status: UNSURE (   9.04  )
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

The binding references serial and rs485 schemas, so there is no need to
list their properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml          | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 85876c668f6d..1df8ffe95fc6 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -35,8 +35,6 @@ properties:
     description: enable hardware flow control (deprecated)
     $ref: /schemas/types.yaml#/definitions/flag
 
-  uart-has-rtscts: true
-
   rx-tx-swap: true
 
   dmas:
@@ -60,11 +58,6 @@ properties:
 
   wakeup-source: true
 
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-  rs485-rx-during-tx: true
-
   rx-threshold:
     description:
       If value is set to 1, RX FIFO threshold is disabled.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
