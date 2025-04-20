Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E70C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mOK5CaaNYeib8c7XhTDJ8gcbvrzPdKcAa+UkGC9z+FM=; b=dzPBeT6zxlDn0O
	fzoF+Y8IQCcmw7JfkkIPqnGCiVPcsofWYr0j3I6uNqiCmU1QIDtO2h2AFkDgglA+SRxtf7z8+4Alm
	KXDKhRm8wyWPVmKoTFjS4BsmJ4RGM+7XtWwpFrRI6BT2NYINwvU6fQ91DTNFAZv7YLi1KTLsMNBB1
	AeaX+HfBMmZCbBm3jvNO4JPirfJ6ZFQhLhdWqt+9hBcL9lsodWSTlnf3LfXUAt88RjPB6J8aQDuaE
	It1jM0sMKXNCTYGVZSwYZa3QhcpT3uhKSPvMOdIyIqlLlXSXdt9TxAzuQ4blf/cx0rAvXGLjcfZ6O
	6TZ/CVoe13FWnVTWdwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Oj5-00000002IAd-2KAs;
	Sun, 20 Apr 2025 07:04:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Oj1-00000002IAE-3Jb5
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:04:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3649161b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132662; x=1745737462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=acVkfFpD6E94QRC67Cb+damwZYfj9IuXcogP7bD3pIvgpkJDyCeeBNflDRrJho8+2p
         1VKEk8P9XNBfuny6W4fHL7mO/Y9ipOCs1PQ9gun85W8lZ+8ySsxvbtCqw0yQW2mhyv/o
         aCRouaUrqJKKyK4zNwryfh3BacNVl8WaNN3/5V/k4yMqFHuHLvcJlwnnvLLHLj4OGUKs
         E/kOoHkh7Sud7UcpmHoB3QdbmxdVoxHyWrR7OjHxpsa2KleGLRKl11vFfhEiSItk9A6M
         C/CJvAlTfUc4J7gOdCZaR5OqHBzF+i5aSfY1tNNscuXvmYutfgvcmwodyaIrQlAC1Qrr
         QEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132662; x=1745737462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=ifzgw5w/dbFBU805fY+1ZEUFYYnoyPKE5T75tTP3tjy4mvKpJmZ29RMpBP2YhcvwZy
         p6E7M852ynxKw6xOsog/RBIh3tWnXda+yE7CtVDiqhoznTe3DvnXxzcGsOCBmfZoIvnI
         a2VfYmtMUhwpX0JWEkOZy8o9r2n7qH7qC4ZsIZQHwJZHi8jSNci6pgUye0nl3kG9Lcc2
         dw67xxkEUy8vCa7GWoX05heYEqUaFP+gpcz9IZZ/Ts+4sVjVBiEfVrDeHankeCJzRmIu
         ky0aGZE1A3aEGjpu9WFR3ZyZzbtTkl7iSXfqqaPw4qmBpFM1rtTXjw8oodg1fpUdgEEI
         SzUw==
X-Forwarded-Encrypted: i=1; AJvYcCV4SKInnq/ZIrZ2QZpE4YfN45lb5WQa1Hsm/aWy2o/ifuOz5ufcLvgUkQ7DQNDdntYSuvXE7JbmvCvaPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/FLCVy/jcfiiijjSi/dLmNs0kaqwMA8uTQuB6fAWIzDZjOhY5
	XJBtqxJWSUhPS8+GyCUXZcQ5mvYW2ndJkQ/rRxVbDZ4hcdsqHKEEHIxvxGNeEjA=
X-Gm-Gg: ASbGncvMkjman06gZ+9sb/K47SWiCAv4w0SY/JIxexm5KjXfLXmuKYz6iy5RO6juYug
	HjPrgvMREE3pa13le0JH7nC/YS6KADNCtu6xK3mj92dr5mFczCP1KehAuSYIX4UqNXWA407A7U4
	5+zGJx60NYWaS8sizoyVpr4dyowvZ0sMVfwUSi98lmZnEaUUMSCj92xkuMRCx0kVp/D0N4iMPYz
	TZOT0SKaVEJMLx/2/ec1P7RX1ixbpuy/7CEWOCRsfEaqTgUpAbPebRP34iK33oOwp5dCGab8c86
	4Edet6uLGvsti0rt+WENDL8qrUMg3Q==
X-Google-Smtp-Source: AGHT+IGsw49Y1EZHbpB/CU2efSGqgI49mepGyjPNnwH7IpvujjQyW84NHrrsk0hDbuCp/nEw8aQw0Q==
X-Received: by 2002:a05:6a20:d705:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-203cc4ae6ddmr10558452637.0.1745132662405;
        Sun, 20 Apr 2025 00:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:21 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Sun, 20 Apr 2025 15:02:45 +0800
Message-ID: <20250420070251.378950-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000424_096235_D7F7BB7E 
X-CRM114-Status: GOOD (  12.98  )
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

This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
and updates related device tree bindings. The changes enable PWM
functionality on the K1 platform through driver enhancements,
configuration updates, and device tree additions.

Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
configured as a pwm-backlight. Per community feedback, the actual
pwm-backlight node is not included in this patchset but can be found in
patch 7 of the v1 series.

This patchset is based on the following dependencies:
1. Clock controller driver, posted by Heylen Chu (v8), with
   most of it has been accepted:
https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
2. Reset controller driver, posted by Alex Elder (v5):
https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

Major differences between v2 and v1:
 - Dropped the addition of spacemit,k1-pwm as a compatible string in the
   PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
 - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
   pwm14_1 configuration is included in this version.
 - Changed PWM_PXA from built-in to a loadable module (=m) in the
   riscv defconfig.

V2 consists of the following patches:
Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
           marvell,pxa910-pwm) and support optional resets property.
Patch 2: Add reset controller support to the PWM_PXA driver.
Patch 3: Add device tree nodes for all 20 PWM instances on K1.
Patch 4: Add pinctrl settings for PWM14.
Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

Best regards,
Guodong Xu

v1:
https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com/

Guodong Xu (6):
  dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
  pwm: pxa: add optional reset control
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: add pwm14_1 pinctrl setting
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |  17 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  14 +-
 6 files changed, 212 insertions(+), 10 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
