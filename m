Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AADEFC72A3
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eY5mnZo2MNGzuE2DvlArXP8by+YYgq2gWNGykCL/N0I=; b=1PfohiIdhlXHE9
	G/JnpCGhopZDSvu8cDBXUwZIW8XxZBxz5SMEd+/aEDoVfowp8x1OvfM0fLqYBjufbTcQZgjTOaz7n
	Ga08jxn7MPhMFmVeDsiN3GlGxc0hxNMc7bHAlmqDT3ziNarSbRT8D5JnEE+bNTK34gEtSSqj14vOw
	MqyGR1pj4hwEEB1G/CPNce2ACnOKs+tG6G72vWv6a5NUgZR74FgS6Hx4ztj/ywpGjIL05Qrgb/kgi
	83GKR1jp1rJ+MqBgCtan0dNKR9H8dSgBYxxqwixpgD4sPbOWagjmv/jTKbnebg1rol6Vct3YOKs4y
	bmIjFdsisYPmr/gFbKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788i-0000000AssN-0IZP;
	Mon, 30 Mar 2026 08:38:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788f-0000000Asrj-1GIX
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so33112045e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859903; x=1775464703; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6nIVyOeWcmomMrY3iGXmWdAUi6cHEvqetomNgyztdQ=;
        b=n/GaxQ1YjsLw9Y1ilymG1TJLY2Ef5/A3lGhXS94WL8EU3yL7HPFYftF+4L4jkoWer7
         qT1hmYOLMIvS16+Jrge/W6oR2qpSXEz1JFwccwQ7XxhEsQYVD0fjCyjyooooMLJQsqur
         Qn3pXrHoH6I3UujtN4GK8K1iqX0LQOBAuGaEKG/25T1h80HSe1jgE4rWyl3lmLTh5QsJ
         nskvpy/yMVqfolGZ+erL4gx5RLFMY7/4+9qbxQw4PwzmfRd8VHMLLtVbN8sOIfMgYId7
         SbYyW2UWR5dtJ/Fzf3sfvOq+XUJyzXoWmanZm7MpPWqAjVkwhzpVb4blmxzI4MoiZihR
         fMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859903; x=1775464703;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6nIVyOeWcmomMrY3iGXmWdAUi6cHEvqetomNgyztdQ=;
        b=I+1zXIzlsZSUMyw0TMZPlRaSPWYZMRPeGLmsmTdG7fIYPV5XMi2WYvhInDp0WWbStS
         1cvwy5oDS0dSNRFX0lx0anJrAQoiNDgEx9DJlfSOfYqpsLD4mJZg16SU0kiWXak7Deay
         mLlu1TUw/QjREJ8etKfdGqsWNUNVIw5lAg14Ru9PnESr46Js+w8S13qRx1UCK1TdEhI/
         GDAXS2iR3RChHpuxrQDcBljuzxj7zF64Ve/Akx6/QzXXepimKGbk3/gTZ5l+p937umpB
         x5qGTHUtFmBB/YiSiX5nemJND63zrzU7PwmTZcqM6nzFV7LyMUIpnH8L2iP3bU58PTY9
         h47w==
X-Forwarded-Encrypted: i=1; AJvYcCUJmT84LUjCjlhAUwX2iizbNxtclqsGyikRGmISh6xSePR8fT8Xs7EyAjHvI02ml48XUjSNWVkDT/ia4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9Tw7hJYcGys2tXY8ZMQb3H+ylkbStLEQVpA5Oruv1zBsSpVz
	7FB7Sb11S0OkokXOKAq35b8VNgF2uJqoKi5Bh+uCRVuMC7anZZYa9MUw
X-Gm-Gg: ATEYQzxyU8RsY8KDr4Vps8lCbif9GqWsq8Gw3fynG973cwAw4jBtrrH7z2VqKjbv8LO
	QbyxA62rBfv4lhFzumxL12rHfNNDtQ+mDd/N33DteFPr0CcB2CX16lpmDFaKXXh3iHnI3dnOjLI
	Q2UzYGtG7cQ0RCXby1SGWZZGsvlMabResBro8sntbbTdiNGLzWHWPSE1u0r3fw3X4PxXeALZElN
	wBgpE6ovcnVywnuJSuZPBfoGUCJILQrMpSd0mVhoCcgXGCy2+GQw6QNVEfUBtvln/VddTZHrGtc
	BNWCxMKsDVUGJDepQSKY0xXpDlCEGK97PGm/PvJbnKFVHSDcEhU3XTxg5FRewxkRo2OZys51yJn
	NcZ0wl1wWUPqponak+SefC7PUlYkSRPAZ2DEYeqEXEFyAP/2dkQAYSHIB4YDGHiVVe9yf4Ocgsc
	g/Ggd6vhZFeIU6NMtoEahoDtRMn7Z+X4lY1y1Jk63+grqnSRsbwM+lVk5a823ib/YMkQZ/Kn4Pe
	0Y=
X-Received: by 2002:a05:600c:1d0e:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-48727ef5634mr197591655e9.25.1774859902957;
        Mon, 30 Mar 2026 01:38:22 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:22 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v5 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 30 Mar 2026 10:38:01 +0200
Message-Id: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwQ7CIAwG4FcxnMV0ZYzhyfcwHkYBR6LOgBKN2
 bvL9LIYd/z/pF/bF0suBpfYdvVi0eWQwnApQa5XjPrucnQ82JIZAjaA2PAhTu018GQ5ddHye58
 4ODIgW6ENECuj1+h8eHzY/aHkPqTbEJ+fLbma2i8oAP+DueLAW01Yaa0EAe2O5y6cNjSc2QRmn
 CN6AcGCSGPQSFVbL+0vImZItfBaFgXpnLfCqFag9b9IPUNQLCD1dEmjSCslvQU3R8ZxfAOABIR
 ghwEAAA==
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013825_404143_624F95EA 
X-CRM114-Status: GOOD (  13.73  )
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

This series enables complete SD card support for the Spacemit K1-based
OrangePi RV2 board, including UHS (Ultra High Speed) modes for
high-performance SD card operation.

Background

The Spacemit K1 SoC includes an SDHCI controller capable of supporting
SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
currently lacks basic SD controller configuration, SDHCI driver
enhancements for voltage switching and tuning, and power management
infrastructure.

Implementation

The series enables SD card support through coordinated layers:

- Hardware infrastructure (patches 1-2): Device tree bindings for voltage
switching hardware and essential clock infrastructure.
- SDHCI driver enhancements (patches 3-7): Regulator framework
integration, pinctrl state switching for voltage domains, AIB register
programming, and comprehensive SDR tuning support for reliable UHS
operation.
- SoC and board integration (patches 8-10): Complete K1 SoC controller
definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
with full UHS support.

This transforms the OrangePi RV2 from having no SD card support to full
UHS-I capability, enabling high-performance storage up to 208MHz.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Changes in v5:
- Document optional pinctrl-names property supporting "default" and
  "state_uhs" pinctrl states for coordinating pin configuration changes
  during UHS-I voltage switching.
- Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com

Changes in v4:
- Revert to start_signal_voltage_switch() approach for bidirectional
  voltage switching: replace voltage_switch() callback with 
  start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
  signal voltage directions.   
- Fix DC input voltage specification: corrected the main power supply
  from 12V to 5V to match the OrangePi RV2 board specifications. The
  board uses a 5V USB-C input connector, not a 12V rail as previously
  specified in the device tree.
- k1-bananapi-f3.dts: add `broken-cd` property to work around card
  detection. Using `broken-cd` disables hotplug detection but keeps SD
  card functionality working without additional dependencies.
- Add SD card support for Muse Pi Pro board (contributed by Trevor
  Gamblin): enable SD card support with UHS-I capabilities following the
  same pattern as OrangePi RV2, including dual pinctrl states, PMIC
  power supplies, and card detection.
- Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com

Changes in v3:
- Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
  add reset support" patch.
- Squash tuning infrastructure and implementation patches (3 and 4)      
  together to form complete functionality and avoid unused function      
  warnings.
- Reduce code nesting: implemented an early return sanity check in
  spacemit_sdhci_voltage_switch() to reduce indentation and improve
  logic flow.
- Refactor pinctrl initialization: moved pinctrl resource acquisition    
  and state lookup into a dedicated helper function,                     
  spacemit_sdhci_get_pins().
- Use generic regulator node names (buck4, aldo1) instead of             
  device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that     
  these PMIC outputs serve multiple devices.
- Remove dead code handling 3.3V voltage switching from
  spacemit_sdhci_voltage_switch().
- Optimize tuning algorithm to use single-pass window detection instead
  of storing results in array, reducing memory usage and complexity.
- Remove unnecessary card detect check in execute_tuning() - rely on MMC
  core.
- Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
  tuning support.
- Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
  following the same pattern as OrangePi RV2.
- Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com

Changes in v2:
- Removed custom AIB voltage switching code per maintainer feedback. The
  existing pinctrl driver already handles AIB voltage switching
  automatically via power-source property changes during UHS mode
  transitions. This eliminates code duplication.
- Squashed regulator and pinctrl commits into single voltage switching
  implementation.
- Moved voltage switching callback from dynamic probe assignment to
  static sdhci_ops declaration. Removed redundant SDHCI core call since
  the framework handles standard voltage switching automatically.
- Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
  conditional for SD/SDIO cards only. This follows vendor driver pattern
  of differentiating SD and eMMC card handling.
- Include no-mmc property for SD card.
- Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com

---
Iker Pedrosa (8):
      dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  17 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
 7 files changed, 482 insertions(+), 2 deletions(-)
---
base-commit: 4c3b07bf68391122266dfb01126484daf352cf70
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
