Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28F6C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f40VG4xfgiOgP8PsrmnKpqdc3agpN+h2eqSxFG4xfMk=; b=i/VbSvDb8aBTuz
	AYqrEiRvNQ0uG5OTt9vDGuKviThuIJks7MhFF4bXEfUBqVATmWDo/2QqjpVdCRMRXGSGYIK2UbHFN
	Au++cSCNB7lWzLgFMeoayyXErLlCBJ/sDAEj96DlCp2eiK9Fj3UWl1Fl8Fu1PpxmGadi8Wav7Rs2s
	I36hZV67nY5jjzhQVBNcQzfkYkXhztf9XyZ52WlGcgH2ePE1tkwgAdEx18pDCSHmVk336TgbmDvQQ
	4bjy50Lf+7NdxyF2wBQxNTE61RzKF+SG8nOcy5Bm+Yeins+pN/MdW9MJ4IoQy/DnwA7nlUMNcuFCn
	NmUfXIaHSQ3007qUQ5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFPj-002q9g-1W; Tue, 24 Jan 2023 09:16:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFPd-002q5G-Fs
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:16:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id k16so10898300wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzZ68G+EqUxB4ReB2DFPbvUfCZJuRkKJfwx6QbLkd9s=;
        b=qNLZBMKp8jlCOQ6VKoGcz89327mXO1daazZJmZx/ApU597Tmv2aOx1yJ/P2hFuY+WR
         G8c4X1Ja7OmMvMvuTHgs0ofb3Oz7677dr7zhph17CTZZe8ZmSkN5hUFbp6VMp4D4q+zt
         3dRDBMyhC57ofxBd1bmOI21HP1e/+J5pMLmMg5mvgOvsniS+bb40e+fWYpBw6W8nWpzv
         26xvebR5JbrPN0jFLk/DY2MTnlxQtv7WEqkm2LbpTJwh6kq8CEc6S71SDj6qqyaMUfTl
         NDY30jEE0zySKmWS1q+CjCIpx01C0lAOMzOLu0Dzsdw4GD5oW3vneq44bX0/szF7+Bl9
         WTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzZ68G+EqUxB4ReB2DFPbvUfCZJuRkKJfwx6QbLkd9s=;
        b=e6joVxa1SpKJr2ZWm8A0r8TDKwnFbFFW33CL/b0rB3Z6LZNhZcf+N15Bqaf5xLejdZ
         HZvklEgwDHFXxMoPG770GnGMmd4cBe4pu64ugAVtNSCC++0/88ux+mXIlTK8GVVT0OCP
         xhbcJB32PYdjrAvW3SK/YBwtaaEbA4Aa0/LXbfIofyHkbM6+HbjpvPzOPcndlPIBJUrH
         armKau8FVk7TjJe+tzKLVtss777NAGGzd1AbVLKQgL49Kr7erL/YngWMYqo0ldzWPwg/
         7hjdPOjbF7YUoVpjubE4YI8s79WFCgpuwtdM6UJHHM78WWICNVsW+v2E5dN+6IAKx1m+
         Hcvg==
X-Gm-Message-State: AFqh2krq+tuX67wS+L71jHfhIcTFGHCjAHbb4EaOXVod2247rL4UcWHV
	WpsMu9wHegtm4njE9GgJMLVx7A==
X-Google-Smtp-Source: AMrXdXsKFwbW1DrSBlwbOeumT8HcjGuNecHBwhrXcJJzSlSBKZ+BDJR+H1Po1PDNqEw25ivpfYz9PQ==
X-Received: by 2002:a05:600c:198a:b0:3db:114:a6a0 with SMTP id t10-20020a05600c198a00b003db0114a6a0mr27455259wmq.21.1674551768883;
        Tue, 24 Jan 2023 01:16:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm17882131wms.18.2023.01.24.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:16:07 -0800 (PST)
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
Subject: [PATCH v2 00/12] dt-bindings: serial: cleanup and improvements
Date: Tue, 24 Jan 2023 10:15:50 +0100
Message-Id: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011617_552372_4209D851 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi,

Changes since v1:
1. Drop "dt-bindings: serial: restrict possible child node names"
   patch from this series, because it requires more discussion.
   I don't know yet how to solve the errors.
2. Add tags.
v1: https://lore.kernel.org/linux-devicetree/20230123151302.368277-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: serial: amlogic,meson-uart: allow other serial properties
  dt-bindings: serial: 8250: correct Nuvoton NPCM850 compatible
  dt-bindings: serial: pl011: allow ARM Primecell properties
  dt-bindings: serial: correct ref to serial.yaml
  dt-bindings: serial: cdsn,uart: add power-domains
  dt-bindings: serial: 8250_omap: drop rs485 properties
  dt-bindings: serial: fsl-imx-uart: drop common properties
  dt-bindings: serial: fsl-lpuart: drop rs485 properties
  dt-bindings: serial: fsl-lpuart: allow other serial properties
  dt-bindings: serial: st,stm32-uart: drop common properties
  dt-bindings: serial: drop unneeded quotes
  dt-bindings: serial: example cleanup

 .../devicetree/bindings/serial/8250.yaml      |  9 ++++---
 .../devicetree/bindings/serial/8250_omap.yaml | 23 +++++++---------
 .../bindings/serial/amlogic,meson-uart.yaml   | 15 ++++++-----
 .../devicetree/bindings/serial/cdns,uart.yaml | 19 +++++++++++---
 .../bindings/serial/fsl,s32-linflexuart.yaml  |  2 +-
 .../bindings/serial/fsl-imx-uart.yaml         | 11 ++------
 .../bindings/serial/fsl-lpuart.yaml           |  6 ++---
 .../bindings/serial/fsl-mxs-auart.yaml        |  2 +-
 .../devicetree/bindings/serial/pl011.yaml     |  1 +
 .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
 .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
 .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
 .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
 .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
 .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----
 .../devicetree/bindings/serial/serial.yaml    | 18 ++++++-------
 .../bindings/serial/sifive-serial.yaml        |  6 ++---
 .../bindings/serial/st,stm32-uart.yaml        |  7 -----
 .../bindings/serial/xlnx,opb-uartlite.yaml    |  6 ++---
 19 files changed, 120 insertions(+), 123 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
