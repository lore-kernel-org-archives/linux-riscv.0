Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B6C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ezLEgaRW2m+A+SXIDivUEK6tROnInNy5OtgLDcE/YzE=; b=Decab3FAnbW3jA
	8cQeEwA6faAtNNJ15F5zXABNgxdQdU/vs3I5LcLeKTdTGDdi7IrQP9+q1cMlZQTcK6IN8/NLww7Gv
	yTAnQBRAQ/keoezLMbu3hUu0xHoIUWS1kjpeGMgxrbD4SpnwmxlmWV9P91EdoTrRc4Vw/TOF9d1na
	tA2VZmX8LVOIZGTD0sjqVenjJq3vhw+UGhh0kLwsja7gF9Sw6zB/r55GcxJtPirWlND6qHRDx7k8U
	FCRzEaW++oK7vheU9jnPokYoU+7AmFpUeC94Rhu9mwr5q444t0fLUwbxar18Fu+/udbjA8eeETmTH
	PyZ/+gOWLZFgdRmdOvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpIs-00AyNz-1S;
	Mon, 22 Jan 2024 08:05:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpIp-00AyN6-1G
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:05:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2903498ae21so1260954a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910704; x=1706515504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3G/nUgZ8nqnJBaq446Ylsx7WALmJQMmykwv3P5etgPU=;
        b=VvQrZGWmaEp0Qp5/SbEE74XXlGAvN9BcaQIASIkQmtTAfByWxG1iBLNbP9oYr4l7Hj
         cUDSJSifH5XyrWpr5u00cSwPFL9FKm910FwvqL6xbLveqCUiZMmNVUNyn+yT6h8H0zqN
         NWsZ+4FLaXRbPiFSILL218r30cT0ciIbsjtdSwmXSNi+XxMKAkgtN6EqF0QnGxbLVdML
         SIrvmDaVO4eCrNyk54rKhZTVfKBtSHkNwRFwn2i4r2i29SRY2ETYzl/iMNmXL7OLVtNb
         1qsDsMfaDPMGAkjFssFS4SIy5dfMpbBRKFTQ1wc/70TTdsY2fVgImTmZq7Sjlmgb2Ppk
         GeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910704; x=1706515504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3G/nUgZ8nqnJBaq446Ylsx7WALmJQMmykwv3P5etgPU=;
        b=VcPNHsGmS79UDdkBHshWI6JhAr91LHP6HAKe5jD7XkMt8wdBZht2LY8mJm3nuvpkM0
         xRb5uEAMUh4jGBs5Ft2War2I773qTc4tDJ62e9Usl8IvMCuYnrpAJOgVYebb0UO5WsUV
         nprWmWjEjk/OrTIsO5v/HyUfDshA1w8VieJlIGZGqPaM/Ib3mKasLTY5DmrAztea8Xg6
         bHmrk5WrMpaf4CUa04OiEkiFJbjPhOOE1ZfoQQswUT9auXpjY2OQOEPWgPkn53WMKKl6
         LcpXIbUYsWfp2zuv76D9eaz+mWc76IqKVR3/OhwA+Ki4o6DthQHDSOct6Li9Gzpuagxe
         dYaw==
X-Gm-Message-State: AOJu0YxbZNwK5h+rT99KLK6L+IPZF572IX1CHVXe0T54yKwUM9mxyrBk
	miksquh2ndS7i1mn1CN8Co1u0izF4iMyQNX88FL4JD0V8eXURG2Z
X-Google-Smtp-Source: AGHT+IG6xuGCNNzdkl15x7pKZdJp2BUopy0hpxkX5tBlZhkWuue0fZnqs7Tt6Q5i6iecg23byAgWJQ==
X-Received: by 2002:a17:90a:e547:b0:290:2d2:6a8 with SMTP id ei7-20020a17090ae54700b0029002d206a8mr1006803pjb.58.1705910703702;
        Mon, 22 Jan 2024 00:05:03 -0800 (PST)
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id sy14-20020a17090b2d0e00b0028c89122f8asm8956224pjb.6.2024.01.22.00.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:05:03 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org
Subject: [PATCH v7 0/3] riscv: rtc: sophgo: add rtc support for CV1800
Date: Mon, 22 Jan 2024 16:04:57 +0800
Message-ID: <20240122080500.2621-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000507_437014_A2830B8A 
X-CRM114-Status: GOOD (  15.29  )
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

Real Time Clock (RTC) is an independently powered module
within the chip, which includes a 32KHz oscillator and
a Power On Reset/POR submodule. It can be used for time
display and timed alarm generation.

Power On Reset/POR submodule only using register resources
so it should be empty. The 32KHz oscillator only provides
pulses for RTC in hardware.

Changes since v6:
- completely delete POR dt node
- remove syscon tag
- use devm_regmap_init_mmio() replace
  syscon_node_to_regmap

v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/

Changes since v5:
- remove unnecessary lock
- fix cv1800_rtc_alarm_irq_enable()
- remove duplicate checks
- using alrm->enabled instead of unconditionally
  enabling
- remove disable alarms on probe
- using rtc_update_irq() replace mess of alarm
- remove leak clk
- useing devm_rtc_allocate_device() and
  devm_rtc_register_device() instead old way
- add judgment for rtc_enable_sec_counter()
- add POR nodes in DTS. This POR device shares
  the register region with the RTC device

v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- remove POR dt-bindings because it empty
- remove MFD dt-bindings because SoC does
  not have MFDs
- add syscon attribute to share registers
  with POR

v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/

Changes since v3:
- temporarily not submitting RTC driver code
  waiting for communication with IC designer
- add MFD dt-bindings
- add POR dt-bindings

v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- add mfd support for CV1800
- add rtc to mfd
- using regmap replace iomap
- merge register address in dts

v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/

Changes since v1
- fix duplicate names in subject
- using RTC replace RTC controller
- improve the properties of dt-bindings
- using `unevaluatedProperties` replace `additionalProperties`
- dt-bindings passed the test
- using `devm_platform_ioremap_resource()` replace
  `platform_get_resource()` and `devm_ioremap_resource()`
- fix random order of the code
- fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
- using devm_clk_get_enabled replace `devm_clk_get()` and
  `clk_prepare_enable()`
- fix return style
- add rtc clock calibration function
- use spinlock when write register on read/set time

v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (3):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC
  riscv: dts: sophgo: add rtc dt node for CV1800

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 +++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |   7 +
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 406 ++++++++++++++++++
 5 files changed, 474 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c


base-commit: e3d3fe7e7bf08820a83c9d9a4c38c7b29a2927f1
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
