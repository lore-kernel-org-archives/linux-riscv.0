Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1830AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaPWBCVRDrOJxSwnUt6yjcEQ6i6vtPAALuTudJ2jaVI=; b=CMD5ihSAoCjlmu
	jJn8AqDVHjZw57e27s4CZg6XzKeX4u4/rFVbkOcAqblrHmxg85WSkaYljKX8G600BLj9bxnh+0zvS
	QEhcgg2f7ovBrW7AWDMRXC5O+jT+xY4nmpjkZU018XcdE9mtttjpgyDor4DR0rp0tcfmIGCoGQ7YU
	RwYhsSsh3+ujSsuobGPnM7D/6iFUyYRQzD9ZOys68AoovaZWCTbBhVcaOxXD1xd6CgepWExAA/J7P
	JyTwQH1cNxZtUWUWxNlshcgLrgmA4wUHy9jfhmrNs0iO4ve2tQEtC5E8umi+alMZez88EvpPEbeek
	SyTHljUMu4/DFMQfjL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBACC-00CHTj-0d;
	Thu, 07 Dec 2023 08:57:24 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAC8-00CHSh-2r
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:57:22 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1fb9884ee04so480402fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701939437; x=1702544237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P11i5JtOr3fzuVQuonrXRUS+CyP/6OsLPEuxS5gelmY=;
        b=gIkBjfhV3OFFZkiagQtDGt266egSq7zrtLPO+4NSsUm6aBYuycphFyKXVG7Wjo0F3U
         YQ6sioLXrgzwd9PHZ1+SQ5HEtvVXaejS/8713all8OEWg4gZJjGydzNBECPTG3QrmMXU
         Clg4wSG7DyhQ5UCgF8ejpz21Yba6HKsorvTL75kWULVuf/h31mG1tFJO71B3PILQnc08
         Ps5lkRmgCxuRiJqfQwu5AMnJQpvVY+mTbRwedP+p0/5HZVR8Is481javt9OOcsNqFXjm
         H4gbCfdYun/j3d5DjEbQqky1L6hn8R+cU4kfRx75VfyTMqhnjvRNXB0D2cEtnR2clTej
         +VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939437; x=1702544237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P11i5JtOr3fzuVQuonrXRUS+CyP/6OsLPEuxS5gelmY=;
        b=qd0NMWpsB6fX0yYo6/cdfehz3GsDQGBkoiEfmr6zW0hph4oZCt1PToTogLMwixju4C
         T9cefh8deLTG75ztoTZuyX1oSZNLHowr3p3jT5XvZcFFVWpCtCQ9IUmdNp48rJ/fEHz5
         siSYWsDJku43T2A+DavQhaAqG5n6GgJQqeBd3ylUe+KPhhSPD/lSwkTZVpefTsyofDHD
         s0UtkNqqFdYP2HsDeZvn3+XZsUREl/kSrwoXLaODy/mohRL+oNcQ4+QMnZKHRZu0Zpev
         R/whGUV0ftok6INbMmMX186vHTKf8Nk9mtuSrQlmC8QG5X62oqcUa88WjqdwmgapsYrB
         eS3Q==
X-Gm-Message-State: AOJu0Yyzav9RxMqwMDCg+Vm7xgQThaUy9Voj8grPPF5FTznZDgroUsWb
	V7jlOSne2T7rP3INUbq3tHo=
X-Google-Smtp-Source: AGHT+IG+OMWXh5ex62HGUtjYZmXteSSK4FPbvT8j0LXO3oexmhrhNGFilq45ksVwbmYi2Otc8uB6ag==
X-Received: by 2002:a05:6870:296:b0:1fa:fcd5:9ba6 with SMTP id q22-20020a056870029600b001fafcd59ba6mr2467290oaf.53.1701939437235;
        Thu, 07 Dec 2023 00:57:17 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id lw11-20020a0568708e0b00b001fb4aaf261csm193168oab.32.2023.12.07.00.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:57:16 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v5 0/4] riscv: sophgo: add clock support for sg2042
Date: Thu,  7 Dec 2023 16:57:08 +0800
Message-Id: <cover.1701938395.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_005720_924554_8D5D58AE 
X-CRM114-Status: GOOD (  11.59  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This series adds clock controller support for sophgo sg2042.

Thanks,
Chen

---

Changes in v5:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [6].
  - dt-bindings: improved yaml, such as:
    - add vendor prefix for system-ctrl property for clock generator.
    - Add explanation for system-ctrl property.
  - move sophgo,sg2042-clkgen.yaml to directly under clock folder.
  - fixed bugs for driver Makefile/Kconfig
  - continue cleaning-up debug print for driver code.

Changes in v4:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [5].
  - dt-bindings: fixed a dt_binding_check error.

Changes in v3:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [3].
  - DTS: don't use syscon but define sg2042 specific system control node. More
    background info can read [4].
  - Updating minor issues in dt-bindings as per input from reviews.

Changes in v2:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [2].
  - Squashed the patch adding clock definitions with the patch adding the
    binding for the clock controller.
  - Updating dt-binding for syscon, remove oneOf for property compatible;
    define clock controller as child of syscon.
  - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-frequency
    property of osc to board devicethree due to the oscillator is outside the
    SoC.
  - Fixed some bugs in driver code during testing, including removing warnings
    for rv32_defconfig.
  - Updated MAINTAINERS info.

Changes in v1:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [1].

Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v4 [5]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v5 [6]

---

Chen Wang (4):
  dt-bindings: soc: sophgo: Add Sophgo system control module
  dt-bindings: clock: sophgo: support SG2042
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   53 +
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   34 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   79 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1355 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 ++
 12 files changed, 1939 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
