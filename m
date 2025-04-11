Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C95EC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KRQoHcT3s1J3Gg46llhyaY2Ss2wE/Vk+7nZZAQjZsqk=; b=I/wVj0ipqJDkMb
	Jomp2Mds5uX7ckC4+704X8z0eO0k/CYR/IPu8beu71Eh3e6sxvT8fBot+m4ImYlzSX1bxX/Eih9Gh
	Yzwg9+eUJvFo+2I3Yu/SvVbZ8TSA360RWHMmxWYALQNdSMU4MGwBAT5Dn6flE8Lp9DZif7qsxmz5Q
	Avh4c8FqDOwxZGqrrOEI3Y/byEzWlHl/h2wHOIDXlOrEiJ2HsvG/HN/FK+ZhlfCQ2z3Qqi307+pBj
	X4fhJUWDH50iAFU8H436W0DjY8VEa8ndmETv4mCsVDhmm2wF4D0uxGwODJM4pzFTP+O1MUIvVqEJc
	zrnpJlJrnqLW69lKvZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESC-0000000DvET-0G2Y;
	Fri, 11 Apr 2025 13:29:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EDW-0000000DsJ8-23ii
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:14:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227a8cdd241so23210715ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377285; x=1744982085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=ViHs6lTupnc+d3JVcaZHCCr/6uajrmxhydClV3wzsTfYJ+8/aJgaT2f3hBYwZpPUft
         /UmHhRS4fCiz/+JatLIc4U8Q/4vVbUHCfzregJ8nlzkXNOaTL0mbpVyUmrKJlG5Be0GR
         hO6Xe7f1oDg2GuQr1rPicvbFp4OjE18Wc6HEjicvQJIIYfudI/ewWEZNIDU/7LsJ2S53
         9uEuxO9LA/479y224SuVZvNlVejJ6azpIqV6TDLpRPi2PmLIPmRgub7U9wmIqsp3RBuk
         8lftxhG9TDuYRbQNAhLyVOvzh2VBBnqR+F+ygUqFGu/8uYTfK2oYx+PcrRAYymlGINwa
         ZQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377285; x=1744982085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=j2OLNzPcefENn0Z4AyW8HEnYZVmiBrlueWe+2tZcGfbI4gv42Fp0AZy1WUEzaZ9Uy3
         RnPpmZ+CgJCJZogjEqbQVNy0dx3bSm+KzODljryT/Ri1FlfLP01D3+EW7veUsaZQaij8
         Pf+tsPdPN7lZtG/W3cBd7AycaWK3zw6qAPzfjV92r4sRZGgjSjx4NKCJr+RFyryYKSYi
         eCZSWdLTOSMFvEvWyP7bjfCmo1uDPoAlJQKpTaTFHv/1HG1UJtXY2h8xhCPKB37948Nh
         c+sSC5jCx5Oi0/RT75HXgxUVci289df3lYWykrpCS5e+yXq+rtYYkJrHBTC+gD/hJcvU
         e4xA==
X-Forwarded-Encrypted: i=1; AJvYcCVxUrCp8WrcPh34O8Q+qHdrkUfS0vDqUxOVD/djHEQntI/i71myVnOAS/02N+ARL6p9olGHQhxUxnymGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtS2QZx6RJD0Z6OBnDHXbpG5GaSnz79v2+YJo3W3HQ5hqJ9xcP
	oy0k25G/Djn8xrGrj4Np4Q45mXlgaxA8te8yAYnOGqNiIdBEd93UoXnNlCMSpQk=
X-Gm-Gg: ASbGncvtibCn6jMlEy7DEJIOiTUzoiZ5HGNOJWkImHLmanQunhkzPutQ0Qko84VzNh7
	WicVz0wI7Rv5fueWdf/ocOcAM+fdwUdQqw5eT4fte0udNMWPETnUyP5/Y69dGywwsBuKJRYHZnG
	mh/TwWWY5zh929OUGY159cUrcUhp0TQdbJag7pdJoFx3qR6tSkqWRvMmZt6LwDitncBKbN08IyB
	V211bp0lOKLT7kYnh11WBMBHo0tl+KVJMwZNZAT2X96iwbeRu7+2iuloU/MJhjTns8aQUatL40r
	1uSpnqm1uxgQQZEnTDyAXBIeRlxMfyw=
X-Google-Smtp-Source: AGHT+IGUnh0jzuOwIhS7mW3GbrnlxFqJLF/GhatlTQ8Fz+bqzUxj4AuJt7AlIxLYz74Fdql/j1nWVg==
X-Received: by 2002:a17:903:2a8e:b0:215:9642:4d7a with SMTP id d9443c01a7336-22bea3dd45bmr41851535ad.0.1744377285123;
        Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:44 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/9] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Fri, 11 Apr 2025 21:14:14 +0800
Message-ID: <20250411131423.3802611-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061446_657516_BE494122 
X-CRM114-Status: GOOD (  13.53  )
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

This patchset updates the PWM_PXA driver and related device tree
bindings to support the SpacemiT K1 SoC. The changes include
modifications to driver support, configuration options, and device tree
bindings, enabling PWM functionality on the SpacemiT K1 platform.

It has been verified on the Banana Pi BPI-F3 board using PWM14, which is
specified as a pwm-backlight. The related device tree nodes are set to
"disabled" in patch 7, as a reference for future use when the display
driver is upstreamed and can be enabled all-together.

It is built upon:
1) the clock controller driver that Haylen Chu
currently has sent out for review at v6:
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/
2) the reset controller driver that Alex Elder
currently has sent for review at v3:
https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

It consists of the following patches:
Patch 1: Add optional resets property to PXA PWM bindings.
Patch 2: Add reset control support in the PXA PWM driver.
Patch 3: Add spacemit,k1-pwm compatible string to DT bindings.
Patch 4: Extend PXA PWM driver to support SpacemiT K1.
Patch 5: Add 20 PWM nodes for K1 in the device tree.
Patch 6: Add pinctrl settings for PWM0 to PWM19.
Patch 7: Add PWM14 backlight support for BPI-F3 board.
Patch 8: Add ARCH_SPACEMIT dependency to PWM_PXA Kconfig.
Patch 9: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

                     - Guodong Xu

Guodong Xu (9):
  dt-bindings: pwm: marvell,pxa: add optional property resets
  pwm: pxa: add optional reset control
  dt-bindings: pwm: marvell,pxa: add support to spacemit K1
  pwm: pxa: add support for spacemit K1
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: Add pinctrl configurations for PWM0-PWM19
  riscv: dts: spacemit: Add PWM14 backlight support for BPI-F3
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |   4 +
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  32 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 315 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  16 +-
 7 files changed, 546 insertions(+), 5 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
