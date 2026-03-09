Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4557FEFCD9B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/3OHk4xQP7u5jJ6sBok6/bM9GU1vKn5rtajgjzVfPw=; b=z5ZC7QrwZsCoVe
	xb1rceEqNHXiy0AihwaM8C/LgiNA/VRScBeNusGZ9TP6NmscltW9G0OEzp9PUaHwlVRqYgWIO+l45
	XZrcFCtMLZSl+HBKjwze9cPAwbw67OiigVX39bE4KvfCtFYRqhd9EOqKUW6tHkw8as+PyeBjeZgv1
	yO7wgFn9r5jNuRKlx/id+Kykds/MCrjN6u5hTmBwq8KIUwOjSHV4Y0AVjJIe7d1oCNTjfsmhh2ET+
	gqjgaweo1gGkz0rOZG6o5sfV3bG9i6Y87vOVlPf6BZEX/X9Dl6vMD8DYp0pOG3t8iuOux8Ojl2GRu
	IRpUhXhNMrMPwybb6PHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyO-00000007CrG-1r2r;
	Mon, 09 Mar 2026 11:40:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyL-00000007CqZ-3f4u
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439b7c2788dso5773606f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056428; x=1773661228; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7AMv4ruvD0WDb3IJGhR9swDRb827tGwwDotiEuQEfU=;
        b=JDJkCSbkK1PRK34xB00rVXujNZ1jyFrpORODScUnomuXbAR7SHtJrrH+Ull1ZkxO0c
         kAXuV+yODcNMb/uroqaNcF2y0z+uPplKSES3lSHjJcNXDsJ7ElfC9zs2/yb8HNVxVdDu
         //jOz8MhB9FqprFJdQ3Ggjy+2jnbHgIe+13Rqs9nrrhXpv08+c2L0A0D+YEIOPDDEsRK
         gA2V1u1pXEwrTfap2RnbvNBXzjU47Pyxh5M3ck4xAb1Y/CYB2b9+ccPVr3jEo2YIfrvA
         VuCRRE7dRZ9UY46RkK2IaxjJvTJJGibzZUlTTe2Qvg+6Fh8OLLFWmGou+k1hu0z2sWe5
         Cl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056428; x=1773661228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7AMv4ruvD0WDb3IJGhR9swDRb827tGwwDotiEuQEfU=;
        b=D7OyM+NbZU2OHLoPKrD1DlU/fQGcuePd/99we3krBYke6g5t7EOKYlUjWqGDTxi0C3
         QtoUeVlE7tncSYrzvibTBPZ4a4d3P0Uz/HU17ie0F8BdjtdQ6ZD9mf2qf776q9oncxy1
         xPWigIFaY+MbNfbNQ/ivkG9dr9LuviiExqaPf4bP+xDUsjRiIti9+IiMhYQxZMv7+13Z
         KwjlHVItwFvzzL3cTONPl/X0AzyTDHRLFCG6Jd7eHo4nAK2ltfR8DH89+bdeN+RjK3oS
         oEyvwzaf7jkTf/llLojAEvxSw+DmJLdnlY2Yp7NcC1cJQr/o526T7fM6mbmsxVB1fUKu
         2CPg==
X-Forwarded-Encrypted: i=1; AJvYcCUqAEJNfdMqWS2Vq4wTAgxGJ16I0KmT12bBEpT/1NM1LSmlgp5POUYkcybo6pBn489CoWf7BwMsJTNlHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2kfHNcpUrJycNdMhmGErkijmDXX7mtVpTbtGA3slntf9xVeFk
	4AlFbJxHOVHkpExGamhIbIytXSOoUjH0t9c+w16Z2THxAGnxd8a0fj59
X-Gm-Gg: ATEYQzxFlAwMr78jqoDLx8bAnIp0drMwaKQyG5HDnn2iErXHWP4mJ8gv04SLStMJYpT
	VBlsQZLS5n+3HFFZTty2p/XnhtsO8hk7aNOLXc0TlwdmPLRaVz4o37LQ9uMxONkwS+O4pTNU+b2
	qVuDmUxsdAh+oLW4E2laCpMPQl/U/yyVy22hg9xd69EF8UcuOlCD9c311XudI6BnVPP5ejlkl21
	SuHvEIDxyJ19XzhKwfy47zQPqexrxkO4TIS/mjHfOREVlkNj7KN1K5OM1BcIKzE01eKLOmQFN3B
	8guagyCcccf9tjG0flFIHmkeQy8HzD1fT4rLQOLmIq0oxKE37TPirBAopNwNX18I4alL+rNoim6
	Tf0DQ/nblZzLEIzw6RfaGs50hvrfs90kqO44ATxK4in9UQhBYyqitV7Ify3dEWUJYAs8+uPrau/
	pPfmbzD+vVtRT6O2Hf9foGHj8GXORs1Q3WW48g54ACjqBzoiBsGAEXh8vjxUUaEOLwSaXLbMy4g
	QY=
X-Received: by 2002:a05:6000:1845:b0:439:c5cf:fc68 with SMTP id ffacd0b85a97d-439da3483b0mr18304868f8f.1.1773056427412;
        Mon, 09 Mar 2026 04:40:27 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:26 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v2 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 09 Mar 2026 12:40:10 +0100
Message-Id: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhhiEhdeQ/DAoYKkwglrRIN6
 d0tuHX5XvLfXyFYrzbAJVvB20WDuikBHzKQoZl6i9olBiYuiblE5zc7K4YOpfEdvoaAZKWlU1W
 YlgTSdPb2ru89e6sTDxqezn/2lyXf7C9YEP8PLjkSVkY4N+ZcCMm1Hxt9HMWNUMcYv7DDdL64A
 AAA
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044029_977553_A278E174 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Iker Pedrosa (7):
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add SDR tuning infrastructure
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 252 +++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
