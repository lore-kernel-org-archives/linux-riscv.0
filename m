Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C3C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j+pCHY1NO1zfUoHiBejmFmAnx5aJ0AyuoTzq1hKJvHw=; b=uv2KHseSTM4F/y
	4xLIPPPMohyjRptk2cJN9e/Js9APR01Ms3DLouO2HMElUSdPugvKrvT2JDFI/9fsTXW9CCoK0R71F
	wZp0zjQWMZUXo85jT1s4B1fj+wp0dtgqUrCJNB1BhowG/9nnK6sBgyt7KhhdMTZHfjf8XEegQG9oN
	UNqjusvDNB9rOSIn3sMMYOXMoukjHsTtZtnj/eGSkjx+20LRr5O/K/lrjBnAeCDlb/AH01VdjZgVF
	pdkiGzlRzIoQiURdQRHv3sDVMgy7QGO1pgSqOxpKF44cTcHmyJ74hHe+yD396jYp9T9+KTJFUYbD6
	JiYqdU4WqOnSxN1Z4IuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gka-000000091MR-28eA;
	Tue, 29 Apr 2025 08:55:36 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ggK-000000090Gb-2zzg
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:51:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5207853b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916671; x=1746521471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YxwsaEgj+Q0Omu+vZ1eyC37eLFX1X+cgZiMPV4Vs2Kw=;
        b=iT8TbKxHumSA/GWk2HlndiY8Hh6UhxQQ2KTeKBcmzMUJW3DK1h93eANh84zlqvkOxm
         /8tC0fi+ICNceMZrMvuv40SJf5z7OsCQpyypBV+tyKFhg5fATBkfNi2qKTytTrivJRLe
         cB2owkpZylfk2mVxEblbE5xLWj9VATRsCEG6ZPoMNWFsQq+vfLjjoug0Y1ZsLc6IsZLF
         3cCZsGbyT/c132sFdr7ctwDvNhl6mUUWvsWIqXDnfrTz9zizlTRhUNYCQnK7k+AUMZ7u
         BqhlcqOBFZ0RNF7/tLUXZXMqefHdTTrHVlNmfha2TLXyjUfZfxEFQv5adVqNpkkCQZIo
         a3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916671; x=1746521471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxwsaEgj+Q0Omu+vZ1eyC37eLFX1X+cgZiMPV4Vs2Kw=;
        b=k1SE2sAoWajJUkmbNVZzVgN4m8rbh8Zjd7P5gmqb7NvtGiVFwCfCUYPEAUsaAwdwNI
         lc7fTnZrXpYHoSSTB6oF/mkwCgrBVf6reQeUxXP9WCJ0JXRiMafEyQmQw3c8HJOREQQx
         NxU3161+X6Eb+ire8ftH9ym3lZRFbKIYygbEwdntg/LbBYn1UXxDsSbQ9ukdC1blmUJx
         rH7wHpxKRHXeMeFm7prl6XXJENOdU2rBFxc6W+WidYdVvXjRG6Dq20k2j2OYAITkfvH/
         i0kHTs/7jzn0U5HGGUq/lDZqd8hjsWLKa30Lw4A2c6OelfYaueP7x2DV2TKBKXFSlGi9
         KqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPsTk1a9BcaLkKDcrzFU85Q3hdoZuDQJWgrn+2t122n1C2NPnARilz5FvvsFI0QIO+5cTsEVunFZ0nCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAMqBWXQ6qzvOd/8nFnB1+COKHrQwdUQ3y2Pe3DwJrQZhjL3hs
	osT0OyglnyF1477isilWxvu/94Gmf4cvOe1GJ6e8d+j2lvLwL3K2E3Z24FKsnSw=
X-Gm-Gg: ASbGncvfn/Xuqh1VpJtJtznesH8EwcJojXpQbIODb2ZiXv89gLRAeg+ZPzDtBJkPamu
	V2pBi69ZKdkFx76GWUYIEGa1w2/MZqN3hls0fGcPROUsSmAR8keWuGL4D4Rh7n1//e5WXnyhQG2
	xtSIjevccX73d7jl/en2q9ZpJrcNIcVgnu4n09YDnlCJtfIPl9MhI+yLL9ShxUZjvDVzFz14p6U
	SeaxdR8wD2IAiEYhRlLhAh8NXoR2OeAUwEaGFRk782ia5SHaDWfbxL7uprVXiU3ziDl+vBokTRC
	XW/ksGkI7XVmDDq17fXydeklyVqvsqNMg35lKr2jRsogOtw9P4FCw0i84GesA/y8mQAaagGDpes
	JhXGga+8ZHT6fyBE=
X-Google-Smtp-Source: AGHT+IEctMKqKIxfKHwBx6+1Ghb0+9YYYgqcw8OVqlt6Q6s6LPNYwZUXZToj5U3b66+aQrGv2/impw==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:93cd:59b5 with SMTP id adf61e73a8af0-2046a646f3cmr19836662637.28.1745916671308;
        Tue, 29 Apr 2025 01:51:11 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:10 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Tue, 29 Apr 2025 16:50:42 +0800
Message-ID: <20250429085048.1310409-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015113_021294_FFEA5E16 
X-CRM114-Status: GOOD (  14.30  )
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
patch 7 of the v1 series, with modification of pwms property to 4-cell
format to match updated binding (#pwm-cells = <3>) since v3.

+		pwms = <&pwm14 0 2000 0>;

This patchset is based on [spacemit/for-next]
  base: https://github.com/spacemit-com/linux for-next

Plus the following dependencies:
1. Clock controller driver, posted by Heylen Chu (v8), with most of it has
   been accepted:
https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
2. Reset controller driver, posted by Alex Elder (v5):
https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

Major differences between v3 and v2:
 - Patch 1:
    - Added: Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2.
    - When compatible string contains "spacemit,k1-pwm",
      #pwm-cells must be 3.
 - Patch 2:
    - Dropped the addition of a reset_control field to struct pxa_pwm_chip.
    - Using a local variable in pwm_probe() instead.
 - Patch 3:
    - In k1.dtsi, changed #pwm-cells = <1> to <3>.

Major differences between v2 and v1:
 - Dropped the addition of spacemit,k1-pwm as a compatible string in the
   PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
 - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
   pwm14_1 configuration is included in this version.
 - Changed PWM_PXA from built-in to a loadable module (=m) in the
   riscv defconfig.

v2 consists of the following patches:
Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
           marvell,pxa910-pwm) and support optional resets property.
Patch 2: Add reset controller support to the PWM_PXA driver.
Patch 3: Add device tree nodes for all 20 PWM instances on K1.
Patch 4: Add pinctrl settings for PWM14.
Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

v2:
https://lore.kernel.org/all/20250420070251.378950-1-guodong@riscstar.com/

v1:
https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com/

Best regards,
Guodong Xu

Guodong Xu (6):
  dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
  pwm: pxa: add optional reset control
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: add pwm14_1 pinctrl setting
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |  35 +++-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |   7 +
 6 files changed, 225 insertions(+), 8 deletions(-)


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
prerequisite-patch-id: a5d2fb43fd88525fa6c8ee767c31adfee87f1012
prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
prerequisite-patch-id: 93962be60d1b58a98d947edf51b4af9edf513785
prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
