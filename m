Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31490C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O3aYaBVBFu2UsDDVAWnfh1catb9Yfw1ALSevDCGYSCw=; b=axBljefnLA5/tx
	l/7CL7kT7lk1rjoHrvqpwE/xN7StUDbU2pq5tCd9cye/4j8nk6BAmETKBRvL8jfCWjPFGhMKBl3TP
	BpjOy9mNmqXLOa6HglHQQnXH9o5e1gnmBMCqw1Gv+xF5PGg/ei9qmHlGMUcmKWKfulxsb9s5CfwTG
	as4aurl3hEm16g9c7a+9ntgVhokJuBNtqaau8HbDoLDFS6fE7CyO9uR4aLdIeD2bMxW7zGpbZwMTe
	27erwnntvDVzJJsnHevb1je1bDCU6SQmUkO/BYG/+Ug247ZLqv8mWYVv3gJecS4aIpvkU4ABPENOe
	t3N4s8rjtLg70uGWl0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUojs-00Fs1H-4l; Thu, 17 Mar 2022 11:56:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUojX-00Fruk-JT
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:56:02 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 577D23F60E
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518158;
 bh=FcFbQHcGNFkpGdda+W/UDbbdrtmD52pzfetu6Zdta/c=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=YSBANethy5bTOoX7MUgNJga7ferOKQ0LZqfLrin7/ME6gzfoJvs2TEXCOe/twPkLs
 5uJ6fqU/bityCy4eDzv3K9M/K7c4DnIbxjdYDqj/3Afcv3GdnJzdMxW8j39bGF/TDI
 vdyeVmomJMKVmlxWvNVesf7fNZ0Xfw/cwSqDE4m01KYiWwO0bx+lwlkp0btWGaXoUk
 dHNnQ0XdRgQxF9kTTH51ym1Bu9PVQ2inD6PZbcF9bXEpZftqrySQUSM2IrbgwGbYOP
 zkiUlzcD34hJdGzroaEbdg6emHAkGrX7nExaTjPPsX9K5zjdJlsKKHlA2ROGDjwPpM
 6hTORohwos/zw==
Received: by mail-lf1-f72.google.com with SMTP id
 l20-20020ac24314000000b00448816d7753so1733051lfh.18
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcFbQHcGNFkpGdda+W/UDbbdrtmD52pzfetu6Zdta/c=;
 b=T30INhUFOObpZhKSLIDJmSpZjcubRn87WUmIKVW/oFPSt1lmLl8U2jjZArpwjr+B1E
 SvOeh087dM4iTle09t64epUKpatEz9FfN+MwkT4Bsg0x4ZGxCVnMjy7Fon8klZuZVC+Y
 gTZkac8fpHq8dEJZTdkHxmy4vwCTWSEQ7MBi7ACQ7pgczXmSl0D1bDNhzTxMnYbLGTgX
 kF2krWCxM94t6F5DQieuoq4iZ0Y5CEFkwlhjtKEFYxbdXWVNUnpnj/GfY1QUsqdt0PUt
 HUEPx5Z6jEDeaXCMSPHANJK/BKIqvH/ezW/FhmRJp7Lsd7kaiKZw+FHV4O/8Yw6UwxB8
 TsuQ==
X-Gm-Message-State: AOAM532hkxuSGGvPkccWQ/a3hw6RwIw0pyUKTliHXNYXzJ6IxWal24RI
 gsXrWDs5UG++w+4WatvOViCYOa+U63WPKgYh9UesR32rC54se6y39+puwgYbFFnVq5EgGAIqUfc
 FJxT6xU1EOKEVQObCirg4o/lYMRIb+s+k2tyETrR3BExVXQ==
X-Received: by 2002:adf:ebc3:0:b0:203:da35:a9c1 with SMTP id
 v3-20020adfebc3000000b00203da35a9c1mr3846125wrn.610.1647518147146; 
 Thu, 17 Mar 2022 04:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo+9tYsHqgUbTsMitSzq8mwjoiBGte5RGn6KnSHAj4SsmoojLzUqarbdnwawIw9oRk9oUklg==
X-Received: by 2002:adf:ebc3:0:b0:203:da35:a9c1 with SMTP id
 v3-20020adfebc3000000b00203da35a9c1mr3846069wrn.610.1647518146894; 
 Thu, 17 Mar 2022 04:55:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm11462862wms.9.2022.03.17.04.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:55:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Date: Thu, 17 Mar 2022 12:55:24 +0100
Message-Id: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045559_806435_68702FAB 
X-CRM114-Status: GOOD (  10.24  )
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

The DTS patches can be picked up independently.

Best regards,
Krzysztof

Krzysztof Kozlowski (18):
  ARM: dts: nspire: use lower case hex addresses in node unit addresses
  ARM: dts: ox820: align interrupt controller node name with dtschema
  ARM: dts: socfpga: align interrupt controller node name with dtschema
  dt-bindings: irqchip: actions,owl-sirq: include generic schema
  dt-bindings: irqchip: fsl: include generic schema
  dt-bindings: irqchip: ingenic: include generic schema
  dt-bindings: irqchip: intel,ixp4xx: include generic schema
  dt-bindings: irqchip: kontron,sl28cpld: include generic schema
  dt-bindings: irqchip: loongson: include generic schema
  dt-bindings: irqchip: microchip,eic: include generic schema
  dt-bindings: irqchip: mrvl,intc: include generic schema
  dt-bindings: irqchip: mstar,mst-intc: include generic schema
  dt-bindings: irqchip: mti,gic: include generic schema
  dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
  dt-bindings: irqchip: realtek,rtl-intc: include generic schema
  dt-bindings: irqchip: renesas: include generic schema
  dt-bindings: irqchip: sifive: include generic schema
  dt-bindings: irqchip: ti: include generic schema

 .../actions,owl-sirq.yaml                     |  5 +-
 .../interrupt-controller/fsl,intmux.yaml      |  5 +-
 .../interrupt-controller/fsl,irqsteer.yaml    |  5 +-
 .../interrupt-controller/ingenic,intc.yaml    |  5 +-
 .../intel,ixp4xx-interrupt.yaml               |  5 +-
 .../kontron,sl28cpld-intc.yaml                |  5 +-
 .../interrupt-controller/loongson,htvec.yaml  |  5 +-
 .../loongson,pch-msi.yaml                     |  5 +-
 .../loongson,pch-pic.yaml                     |  5 +-
 .../interrupt-controller/microchip,eic.yaml   |  5 +-
 .../interrupt-controller/mrvl,intc.yaml       |  3 +-
 .../interrupt-controller/mstar,mst-intc.yaml  |  5 +-
 .../interrupt-controller/mti,gic.yaml         |  5 +-
 .../nuvoton,wpcm450-aic.yaml                  |  7 ++-
 .../realtek,rtl-intc.yaml                     |  5 +-
 .../renesas,intc-irqpin.yaml                  | 28 +++++----
 .../interrupt-controller/renesas,irqc.yaml    |  5 +-
 .../sifive,plic-1.0.0.yaml                    |  5 +-
 .../interrupt-controller/ti,pruss-intc.yaml   |  5 +-
 .../interrupt-controller/ti,sci-inta.yaml     |  1 +
 .../interrupt-controller/ti,sci-intr.yaml     |  3 +-
 arch/arm/boot/dts/nspire-classic.dtsi         | 10 ++--
 arch/arm/boot/dts/nspire-cx.dts               |  4 +-
 arch/arm/boot/dts/nspire.dtsi                 | 60 +++++++++----------
 arch/arm/boot/dts/ox820.dtsi                  |  2 +-
 arch/arm/boot/dts/socfpga.dtsi                |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi        |  2 +-
 27 files changed, 129 insertions(+), 73 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
