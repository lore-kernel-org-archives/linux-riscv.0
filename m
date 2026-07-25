Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4367AC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGofvPDTvtnzOhXAoTb1mfKnS7e55Y6bTtWxaAyc3eM=; b=VOlLUfSd/zuqH3
	/2Snun7X7B/jJCBgEmjatRuhyzEsA//cbDfOMbdao8y+v0nOXxft4emBFrFno2oK/1zhDRa4XMQpq
	qgxGCJRjbBwMEq+I/Got7wiB80gQ0Ano7trqtINRoY/4hvZOO+lRskJIR2vJQGxTNYcZoggWYVkwg
	QnB31UEhlBrYb1BX5utMnkjGos9nzOS5uKvvRRPfftGMHz4fU+MhjGwwtwTaIinBAlW/VF1//g/DO
	VJWKZWlrp32tX0tCifGgPniw2lrdBdKx1SMsBl1oXv0zC5ZpDxX8FAAN2xFloG3wvJ5HwQXairfGt
	DeoKm9aAHs2WHk8cF//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZZ-00000000ce4-39HC;
	Sat, 25 Jul 2026 17:54:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZX-00000000cdW-1R9f
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 17:54:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso178878a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002042; x=1785606842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=arLGFyNMfHQJBHgn81ki2JloWGKnqNII6+t2+DnkNZM=;
        b=cVKRwYklcHImD9HM2tszAwcUDvYfVeCXruRA3Is6phjacodOa4lwvgMh6yMbk3khOz
         DP9FZkXUMY1xzRW9bn8IbTYnzi7bxNbbwRItrLGQRLjAodcYDYeZReaNVuefz/fOb+UB
         RIlGhXWRiR0LVcz7bfkFzofEoCHBIbH3G409qWVuhapD7ZSPg358f1z31P0Fv2mFeKHW
         voCWcebndsr+N91TMRhIubDh32lb9uqxkt2Ojb47bVmtnp5tnNoSDxo8Zo52Tn7lRK3+
         spS0Y10DNiCP6hecO8PMT1Udp2UiGUGLhFCkcsOMO94YIIESuAlVq54L0x0ENGyvyX4T
         GxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002042; x=1785606842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arLGFyNMfHQJBHgn81ki2JloWGKnqNII6+t2+DnkNZM=;
        b=iYeGeA7JmanCn/ZfKLhzHp6/iwouyjAloF3DY/R6Pe3IthWoE/zIvq8n20e8qsG37w
         c5FnTdVS9Dyj7tqxuOWqnucOiq+DG5E2QpJLmpF8tXtHDPaaeOZxnzEn2CdhETGR05Ek
         qby5mtOpq+FgkPo5tEeE8Gdsishsrhx+4xVCY/+gmro57MS3pFGxCakmnMFRybNElLHO
         KePHeMvQmZheZElGALQVDGG59RIDf+H7O7k6pl1PGBIdwTL18u+lXEqUSpCX7kAu+Bkc
         +S8Zr28urTqMBWm8EmRNk73arNY+KxtIu9YHGroKY+yv706hKw+zJ0hGJhIBaFg6jrKe
         WzaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr2RBA4qINvCBBGJ/iAj43C/39o4/szdyyRUgmlbD5zTobrVJJlV5Uyo4HKVDl97I+/JVRz5x5wP4qJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOST26pb9J+Gh4vvkiB620HffKgbLw082yiWV9Rxivn4RcPIMn
	7f5b5W7Rd3OyiMuGReXMSyBZ40yerWOTWDJ2xWQu4H1yAKLGV2kUSXBn
X-Gm-Gg: AR+sD12gvvOLx3m7kmBLGDLVBzhU9I2dRiuPr3QjJcLQBD8uOfFUD3/AwxWSVGzA0Lh
	40zO8Rn9YVWkgsd+RXn2tvcyVSCnSsuM67AOve0kfcZrUvalMDv7um/t+DI5ZTTXfIn1DJMRrdT
	ROArge5vIJH9hboENF00Mjfl3mKwSoXjW1eyST3v4Oe8glzFzcE6SMmgkNzBbAp7hk2kT0xvbId
	ImpdyUHJVvgKFSraBHLSUev61TZKcW5DGyJhRaLv4fg2ssdivwYEgVNQbaCPs8I638lI8q5QpG1
	LIoJplCr4drv8nQkINg83e0ZLsQSOqzzJncvZkkjOI8dqONkdmvgEUFq/Fzo6+tKmk5V4+vcWHP
	9n6SS0JOEfy87GEbHrekG9mHiQp0MF1EDCXfuMn1A4teP3Zp7yZ8x5MJTfORGke5UF0HBQHFg//
	i+ZAbMlRkWGv7v6sOVsWyMqLsA/dKKnQNdhEY0yHiNadAmN5GODAKLh6JMkm9plhVsGrAdXO42y
	XBfVZ1sww==
X-Received: by 2002:a17:90b:53c8:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38f293cfc02mr2206115a91.1.1785002041668;
        Sat, 25 Jul 2026 10:54:01 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:01 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Sun, 26 Jul 2026 01:53:42 +0800
Message-ID: <20260725175346.139173-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_105403_408399_50CB8D5C 
X-CRM114-Status: GOOD (  13.38  )
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

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This series adds the board binding, the PWR_GPIO controller node for
the CV180x/CV181x family, and the board device tree with support for
the UART console, SD/MMC, USB host and the onboard blue status LED.

Tested on actual Milk-V Duo 256M hardware: verified boot to shell,
SD card rootfs mount, USB host (root hub detected) and the heartbeat
LED, both via the default heartbeat trigger and manual sysfs control.

A U-Boot series adding support for the same board [0] refers to this
series as the canonical device tree, and intends to switch to the
upstream kernel DT once this lands.

[0] https://lore.kernel.org/u-boot/20260710-add-milkv-duo256m-v1-0-0f761100361d@baylibre.com/

Changes since v4:
- Fix the coprocessor RTOS reserved region in the board dts. v4 carried
  over the address from the 64M Duo (0x83f40000/0xc0000), which sits at
  the top of 64MB and is wrong for this board. The vendor device tree
  passed by the bootloader declares memory as <0x80000000 0x0fe00000>,
  i.e. the firmware keeps the top 2MB of the 256MB DRAM for the RTOS, so
  the region is 0x8fe00000/0x200000. This matches cv1812h-huashan-pi,
  which has the same amount of DRAM. Verified on hardware:

    OF: reserved mem: 0x000000008fe00000..0x000000008fffffff (2048 KiB)
        nomap non-reusable region@8fe00000

  (Reported by sashiko-bot)

Changes since v3:
- Move the pwr_gpio node in cv180x.dtsi to follow unit-address ordering,
  placing it between usb@4340000 and rtc@5025000 (Inochi Amaoto)

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in cv180x.dtsi
  (reworked in v3)
- Retained the &usb node because it is already defined in cv180x.dtsi

Chen-Yu Yeh (3):
  dt-bindings: soc: sophgo: add Milk-V Duo 256M board
  riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
  riscv: dts: sophgo: Add Milk-V Duo 256M board support

 .../bindings/soc/sophgo/sophgo.yaml           |   4 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  18 +++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
