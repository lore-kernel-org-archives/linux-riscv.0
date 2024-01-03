Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5488EC47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U83WggXiV3C1zdw2uOpF4JT19zLBm1l5sTLGuOUxdLs=; b=hjCctOYjwpgxyd
	7GqQi9aUDqzymDqGvT/aFDPoepWrMS4JjMCF740I3+KtW5EKTGl8JdgE2QwuSjPcj2tHYEDWz6qg5
	KXB3FbJlV9NMkH6HRVtis7nV8HJQPavEf6PtOU1aO478uFQb0sX3DQKLJOYr3n8EGQofZLaoKYd2U
	rtnwwyc0ex5Ppaom8O372zDKo5k7XnP68b+PRGY7E04c6ostfrj7c2h75XvwQNB52Iagmji4tyucF
	VT5FGXmi+NP0PuSVfrZ99kdzvryMqoYirpOD/9H2l4XVq08CLRmufquPkqII/picvD4z+aqRBzsJb
	ZZQDSI52S1JI1wvtIyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1Iv-00Awcs-2r;
	Wed, 03 Jan 2024 13:29:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1It-00AwZo-02
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:05 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1A083F748
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288535;
	bh=yWWe6H23myTSvjfVff9zG/62qYLCD/sbWwOipagSJuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=dpgOU3mK1vPuL2BvROMimPl7Y7Bfa6pDz8oyPaUurTHpBy2tUkboS0U8tuO3QdBXX
	 oTMWKiCD8i0omGjqKzwQAMFsqOUHQsliKndJy/6zUt4U/tvodyN7pn2lVLTWbQhdTW
	 KfsyPXh+7YXRDOq1+8cLouEEj0AJ7UCdEoJMoLXKu/ZycXOZiKE/nyZ3MckxlOj7PA
	 5vZGshX0vN9sQqHUK51rvvxw0Q54kfGrM3ZqNaJ+2uqMMW8S5ZpmxcF8U36aVvMF4d
	 ODSbXQfAYu13aYY/szgpCiWnMHIEvegJJeg6fUc0v5hU2ab+4LuQWsV8M03j7H0e/W
	 IrT8o6epRjnyQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a22f129e5acso496666666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288534; x=1704893334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWWe6H23myTSvjfVff9zG/62qYLCD/sbWwOipagSJuM=;
        b=BZpQjq7oVXdG1XAEBK7wfCT+a17NYBeEUgzFIVLsPtTXM5IhOgtt4OflNLjP/B6G20
         qRv+doB8UulXtu8ak235bI3XtVN0kbUDODfQrtzpGUx7acM9riXIUUeKcEEKNhZAixaZ
         rfNkhm4oj2dNCTm8yqXkLH44fNltqTy9CaJZtiHV1loymk0E7Tdba3TVzxu4EI78nQiM
         T0540YY2FpEvrp7gCISw1jTE4TeWdmNmNymoRpH7jc1+i1QtRIeLVJp7jCYLuggyXJVu
         H/TZb2cuzfi9i8UDaiAF0yUgTDY8/oIa7M8jGjMcPm0UyFbVGtaTZdc+8WNwpPWGtNVR
         OGyg==
X-Gm-Message-State: AOJu0Yy8LrYvf8Dd9YIaHo9XIrmnVHfmMvHXvNZSzE38kV+qo+o70dly
	ogyfLFAYncjB1pM5tC4anO7wcF4Ot2kpVadPJpr3N9Th+99sM3zVc9UwcyiYj2yjdAg3GkOdbjT
	6u2CMK+foDlkXIeq4ACaq/PgIMdH00aUlYSzGsWcGdHzx4Xhefumk
X-Received: by 2002:a17:907:36c7:b0:a27:d55d:73d3 with SMTP id bj7-20020a17090736c700b00a27d55d73d3mr3348200ejc.23.1704288534034;
        Wed, 03 Jan 2024 05:28:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCAg1DXImZMtkXe7TWoLXcnmyhjNjWaMpeNZkVAjpDt/dd1YDA1CXZvWTJalXLzI+MUZw+JQ==
X-Received: by 2002:a17:907:36c7:b0:a27:d55d:73d3 with SMTP id bj7-20020a17090736c700b00a27d55d73d3mr3348189ejc.23.1704288533638;
        Wed, 03 Jan 2024 05:28:53 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:53 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
Date: Wed,  3 Jan 2024 14:28:37 +0100
Message-ID: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052903_464849_5EA6B75E 
X-CRM114-Status: GOOD (  18.77  )
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

This adds a pin control driver for the T-Head TH1520 RISC-V SoC used on
the Lichee Pi 4A and BeagleV Ahead boards and updates the device trees
to make use of it.

It can be easily tested using my th1520 branch at

  https://github.com/esmil/linux.git

..which also adds the MMC, PWM, ethernet and USB drivers that have
been posted but are not upstream yet.

Jisheng: I've added this driver to the generic TH1520 entry in
MAINTAINERS like you did with your USB driver. Let me know if that's not
ok and I'll create a separate entry for this driver with me as
maintainer.

Drew: The last patch is purely based on reading the schematics. It'd be
great if you could give it a spin on real hardware.

Changes since v1
- Keep pinmux data for each pin so we can mux by type instead of directly
  using the mux index. Eg. use function = "uart" etc. (Linus)
- Drop the strong pull-up property and prevent Linux from combining the strong
  pull-up with the regular pull up/down. This also means we can't report such
  usage if it set up by earlier stages, but that problem is deferred until we
  encounter it (Linus)
- Reference pinmux-node.yaml properly (Rob)
- Specify valid pin names for each group (Rob)
- Enable bus clock (Emil)
- Implement gpio_request_enable() and gpio_set_direction() for automatic
  GPIO handling (Emil)
- Drop patch adding gpio-ranges to the gpio-dwapb bindings that is
  merged in gpio/for-next. (Emil)
- Patch 6/8 adding GPIO line names for the Lichee Pi 4M module (Emil)
- Various code nits (Andy)

/Emil

Emil Renner Berthing (8):
  dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
  pinctrl: Add driver for the T-Head TH1520 SoC
  riscv: dts: thead: Add TH1520 pin control nodes
  riscv: dts: thead: Add TH1520 GPIO ranges
  riscv: dts: thead: Adjust TH1520 GPIO labels
  riscv: dts: thead: Add Lichee Pi 4M GPIO line names
  riscv: dts: thead: Add TH1520 pinctrl settings for UART0
  riscv: dtb: thead: Add BeagleV Ahead LEDs

 .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++
 MAINTAINERS                                   |   1 +
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  87 ++
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  43 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  28 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  62 +-
 drivers/pinctrl/Kconfig                       |   9 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-th1520.c              | 891 ++++++++++++++++++
 9 files changed, 1478 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-th1520.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
