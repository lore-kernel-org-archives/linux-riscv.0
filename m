Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA5AC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cmaI7g7yvCQQlTCViiRgg/AnxvdpiIFw8e9kkJB8REs=; b=2Ww8/5h9DBtFxN
	hdInvTwBh1+dZWdfbesY49tTeD8Y0ZJYV4f1gBx0OkqgN2EE8+V/eqOBAn6I9OFk3/Tr+NJ++bbUX
	fiYs4Uy2icAOP8YTmP8Jw3B07VsKVH/A1Bb187l1JeKttqCZpsN47Wa0Ce4WsUwN3FJz6W6A81QhB
	ZYfwnWP83BUwFfMG8CuFPxENLa1lEaBVx98JX2kfK4FKgA70HXgy+qcaFDGrLxn9Bl8tKJU/Dz2nz
	COgwYShxYT0VtYmcwy0xeDJQin0+R7eEj1QXJNmI5XzOzePLV7gXCq/kIP+7oRVHfHIhQXhOZnD46
	Jg4oSVcN2/+4dlta52hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kq-0000000DlUK-4Ayg;
	Thu, 08 Feb 2024 12:43:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3kn-0000000DlS7-2mSN
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-51168572090so2916984e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396222; x=1708001022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euiJLfBajM/ZFVIDyhIV5fjjCmiMvfIZ0T4coXTdvWE=;
        b=ewPem2DAL2w4qFXnym3Si8wxc5C2wJg4bITFPOETIWi8Y+ZUV7R+SlZUpqWPKAUQ8U
         7Zo3R0KzJH5Tn/HKEJzOUuXdz493FafVrh6rOsd29txz5abmHnov6IpPsBupbYy9VbrZ
         xS2HzAJGRayRx/MFZa0YbsiMV9JLr5YtECFYXAitL1Ez+VbRvsnySOHYiLwDGWgTKOLT
         X+wT7HVaXWqfP5ePghy7OjDh2pduksBODKLRVWu3nHzYBSaSrQ3VtdH0gAI2rZQtQThy
         sNE9gNUJWyIp6PuohfyQE5glsi+xKVDj2sMYeTNKWl+SqMQBUHMC8n4V4QtG7CFkSYXi
         dzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396222; x=1708001022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euiJLfBajM/ZFVIDyhIV5fjjCmiMvfIZ0T4coXTdvWE=;
        b=iNvWgll8ufGB0iZT9SwQKwifAOmMrzKr3GLo7kEuk0HrLVt0RxaZ5m5syxjTQFdHuY
         0aV/4hnHpV/SFH2bG+PNFW/9u2gPaBF3pL446eX5/ppgivANmI1VvIs1YPmcsWAp5l3Q
         pVQAXcsOsXWkeTC5WmLMRoPF8AhVnO7yvXkeJP87NgUquXx9/ALBPkHoDl9F27A+fTwv
         FlW+TEjwGFAfGMBdb8sXJAYS3gB8LUaPMbI9uEodfkXNpvA59z69Ty306OudaottB2yJ
         vQUNzz4lgrzt5KWGXi0qufSuHKiEkk7SsOyQiVi+uSTtDyErzjJsjcCYgukWAKaZUYCa
         /LvA==
X-Forwarded-Encrypted: i=1; AJvYcCUxXU6yyvhspo2SSSPZILxpkG/QFJ79/8hLz4M/lJBtWZsO7XAMXZMcr3bV38lzPHpdH5WriIJBzfEhZguES4wLNgtdJLp7LM5Qt7h31l9k
X-Gm-Message-State: AOJu0YxAlq4t5dwJkHN65yfubbqxE3CF5mhRQMkgLoE3IGygF2+sr/6X
	r5l5DFHz1hPsrDKk4Rwj2JkA8LVEISDwsMA5YHVKuULUTG99jLFszNi8tamTdYY=
X-Google-Smtp-Source: AGHT+IGFiG7OHJfzRNPbhImwwPJamXoJQIEhIgb6vjVPNybgWE5Mqmkj9l3PB8njMa4WiG5eqbRvxQ==
X-Received: by 2002:a05:6512:33cc:b0:511:5724:dcd1 with SMTP id d12-20020a05651233cc00b005115724dcd1mr7734788lfg.11.1707396222387;
        Thu, 08 Feb 2024 04:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWr+/IOtPfh0lK3AG+Z2s/nxleo8pO7DNwgvhzMfvQOlQeo0BQH94pIvapJvPkZXT7ludRt0V+zlZx62qzOHVY6SOOcwiztRENMNS5ttT/QzvChrqrk00aJIsWx4Vt2c8wBXhfHRFyHj0pfjdVpU7qL9XL3h2uHIjX+E7WNTj0cpaKRyvNm0Ja/l6yLSd2P7yTY4IQaZ92erU6P8uUKz8hmle7apJ+YzTGyWowtGq1LPEZgwSEAbqbd6qmrGfD82zRqVopXiTjBd9o1q/O2VuW2925SPB81j28coIaRlNJGyYSaOyoJnO+6WJv+jOAu1Al7abQ5TRMvglgi01KlUN7O4UzNnBLcnBifcAp4n9tiE8pt9WciwX8RLricE7vehrbXPiZO0hUKk0+70QjmIIMB6VblERZovT9GO0WUuFeZ4mBpnldemseNCZvJRdbwuapgoOjy/ZCYeiCUWltUFkgtTHU6x32rHfEft9nTEJwO7R5uAH93iOlpTFw5ClvujCf+oGbGn2ihPSlUFlgFBJC1rQymxDr6CZ5hqwN/a9/82ti6abyqsOL/jMmqXHulG9k=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/17] clk: renesas: rzg2l: Add support for power domains
Date: Thu,  8 Feb 2024 14:42:43 +0200
Message-Id: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044345_840009_560630F5 
X-CRM114-Status: GOOD (  14.73  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds support for power domains on rzg2l driver.

RZ/G2L kind of devices support a functionality called MSTOP (module
stop/standby). According to hardware manual the module could be switch
to standby after its clocks are disabled. The reverse order of operation
should be done when enabling a module (get the module out of standby,
enable its clocks etc).

In [1] the MSTOP settings were implemented by adding code in driver
to attach the MSTOP state to the IP clocks. But it has been proposed
to implement it as power domain. The result is this series.

Along with MSTOP functionality there is also module power down
functionality (which is currently available only on RZ/G3S). This has
been also implemented through power domains.

The DT bindings were updated with power domain IDs (plain integers
that matches the DT with driver data structures). The current DT
bindings were updated with module IDs for the modules listed in tables
with name "Registers for Module Standby Mode" (see HW manual) exception
being RZ/G3S where, due to the power down functionality, the DDR,
TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due
to the following lines of code from patch 7/17.

+       /* Prepare for power down the BUSes in power down mode. */
+       if (info->pm_domain_pwrdn_mstop)
+               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);

Domain IDs were added to all SoC specific bindings to avoid breaking
dt schema validation failures.

If the proposed dt-binding update is good for you, please let me know
if you want me to also update the individual dt schemas to reflect
the newly introduced power domain IDs in schema examples, if any.

Thank you,
Claudiu Beznea 

[1] https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (17):
  dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
  dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
  dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
  dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
    <1>
  clk: renesas: rzg2l: Extend power domain support
  clk: renesas: r9a07g043: Add initial support for power domains
  clk: renesas: r9a07g044: Add initial support for power domains
  clk: renesas: r9a08g045: Add support for power domains
  clk: renesas: r9a09g011: Add initial support for power domains
  arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ GPIOs
    with proper flags
  arm64: dts: renesas: r9a07g043: Update #power-domain-cells = <1>
  arm64: dts: renesas: r9a07g044: Update #power-domain-cells = <1>
  arm64: dts: renesas: r9a07g054: Update #power-domain-cells = <1>
  arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
  arm64: dts: renesas: r9a09g011: Update #power-domain-cells = <1>

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |   4 +-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  84 +++----
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |   6 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 100 ++++----
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 100 ++++----
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    |  28 +--
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   2 +-
 drivers/clk/renesas/r9a07g043-cpg.c           |   9 +
 drivers/clk/renesas/r9a07g044-cpg.c           |  13 +
 drivers/clk/renesas/r9a08g045-cpg.c           |  27 +++
 drivers/clk/renesas/r9a09g011-cpg.c           |   9 +
 drivers/clk/renesas/rzg2l-cpg.c               | 227 ++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h               |  68 ++++++
 include/dt-bindings/clock/r9a07g043-cpg.h     |  48 ++++
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 +++++
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 +++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |  70 ++++++
 include/dt-bindings/clock/r9a09g011-cpg.h     |   3 +
 20 files changed, 752 insertions(+), 186 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
