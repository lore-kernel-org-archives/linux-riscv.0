Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B225CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jK0taQ+EN5Nucx/xHCUen/riZZkpeATzRHqIiP/HnJs=; b=nMgFa/lYMa+rgx
	hToh7fkhMZRKL61z8T7ip8OsFxNzdKoevqYmpvQ4h2hnS9u8MWgIPdWhAG7qx6FtfWQ/xjIfuxyJl
	Z5GbzhHn8linRusy+KhkYT1OZksrUqEB/CsvQVAGi6Xx+Xi9lvnKsVm1YW7XOwMjIPwwsfRrUNy2H
	00omK7GPuPxt9Ultk+6i6mkok3uy+c+HFzaE2XaKwYo4CSYnLNdAvTQjaz7nyMPnlz2wGgkYbki4s
	EXtpQvVhyLaa6LXe28BvhVzVaFICM7PzjEE3gs/s1YR3NgnwUd2Q5kNUjlEcaRDOOrJbPxG7Hq3mt
	0tz3s8qPKteHB6nSbSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkc-0000000E4k7-3RlC;
	Mon, 11 May 2026 15:40:58 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkZ-0000000E4gc-3PFD
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 15:40:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8d648466bso947989e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 08:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514054; cv=none;
        d=google.com; s=arc-20240605;
        b=kzgDYSYMzHl2qkaoz0N3qsXs3YE7XRD4tdQ7V/pg99YipyE0cuI2miZjJDM6RDndtI
         Nzvh+5Mc4ltUbWh7Ny9hVnolWkH1WlPS+9Bg8obsYwiYDN01/2gcdI/zVyPS7rionTFE
         8JNLYt3nH/VWy+s8Rn9XR5vNgFfXzaMhWMUC5hBFArvoLYF74RlYX89YnBoZorJmn1QF
         TDlI5P5hJlKNrolv2toCDOlLBVV1k1p6RyKf8aF79a/MRUUf1AZZ50NJRjIk0yJa/LNk
         soAIxquoEzSmXNStQoByXXDpilJmsKdBJzvNO+CCzB2zYrBdw7jVYC5UmeJyNPcwNQw+
         Og9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        fh=dPl/U6GwAg4RsKfjxox9yQ0alMJ95xZ++3jt8PFZk/w=;
        b=UICdMEQVw4wxDdmtDN9Ec4b8Kwth+ZxwRJWFa7waRQzthDsSlOQM4RL9mIYzN5qNFA
         wZMBrrVBGqWjee7jcYuaKjjTruQQrBnZgNd0PStQ2yJhBl2yfhIhgYK7ooJfD7oA+URq
         D4Jyz8NsHHIBYQ4lO3XlleV2l5DMHamQhE0/SDlg+E9ozcG1H7VjiajE4EDsRcXWlqaB
         /1XXbYPvdoAXSg9rxeHKLh+UdIr3XTnd78BB9AsHHadtB3u2u146W1Vn0w+39HlQQfN7
         J3qoi6KvrOoAYlEZAuRaXb6WbbbaAa28nEiYU+Vj/7ELBPtwph6NlUr/ecNq3PULHXjF
         6NoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514054; x=1779118854; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=r0cbff/tQEMQU2W/sHckP3vRE26ERUk+V7CqcqoJ+fN3jRrfJ82H4nPLMnsCPUk8pT
         4m0yKhwHCqBn6GjhzAoVd3RKaTtuuNsHyRQQGYFUdpp62578/A/xxupYOCj3wRzCe0A/
         4unJhs71QSPPF6DC+lujLmYe/1u6fhh/sghFz71uqFpvAb3T2kCYQlYuYCw7D0hbEbXp
         t3YyKsB0Fi5FFu6wc4fmYnf/hQCQwLiPsUbgLHnJ+8i1mzXnUr+BVKsKNKMsmv8YcxFf
         LJ+mrJQ0jPTFkze+OJW9dzlBHsGK43k9cRHCJ6Xd6X72W7UPpwbl95txkxbTUZObEsAg
         xxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514054; x=1779118854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=pc0vVflBeUFS7tzNG7dfgOAZfdnyBggyvNjda0mlT5Vn02p3XPFuepnmoCy1QnSx8R
         W3dk/Xc7256u8/l4Q53mgIpv+IyItk6fsRkRENm0ribbBhAS/1cbf3ZU4CqmyUs3IwLF
         GGRfC81OPYga4TkkHRDpat62yrS2QXZBOTrsItoSpnc+SXcajUeGu2ajmDLKX6dtgg8l
         NUy7ibYx7/QLb+h3Ns5pz1JpjlHxsQvwZUBce1tm8vug99lX++WwDt5yV2d5Bm85c9xb
         YrQQ0GDaUe7iicRt0FlpTCvScruiLPQfggvT65zxEyhPtUfazAcCgFWhhRRENOE8q1/Z
         hoqg==
X-Forwarded-Encrypted: i=1; AFNElJ9iTXLQvZt/bhUfwg4p0fN/qj71FTXszPZUjhglABvYoawhG3Zt8ufcGRs5ota2Hf0UH6fP5OcabJBwkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxIIGstj5E0/2WKmQ97FfcvLtKDYYHwMswLgDyiJlmzsnSXEx/
	PdfvIOt9b9F3BCGeYsdS6c/Ch3+skmaF0fAdmtzR4ehfIo2v7wbfGGNIeeKgjSO9oULSDL2w1Ad
	D8DVf5KPvUmihWo5k0A1+g8LBJkcMHFxoTW2g7hBKEA==
X-Gm-Gg: Acq92OG23jKkd7zdLdJWXFbOqBj8oHE4Rktor51mLiiWKG8abso9i48nCdPZdnX8cew
	hLy8e4mIFgAVx/OGkQVNWZxMGAn1I2K3moA6O0wrlKtKhPgg3C2/HY2h4tUDZfn0vS1c67gP+ET
	q6aPih/K/WgBBmvLC0uxG54YBTTAltZp6fO+abIP9eyvTSzEeUQi3Ugmv1tpzspJTe/dJshYo1a
	XA47ShCrYGiuRpd4eVCyPR2nmqlCdrKE1awyaWYbzEnH7DiffQejPcma9An5F1+bzJfjj96OA6y
	sDoV7qQk
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a887adaa88mr8185426e87.6.1778514053531; Mon, 11 May 2026
 08:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:40:08 +0200
X-Gm-Features: AVHnY4JG6GcAfGL3v7qotS87Q75eVy2s5uXmoBdyZ6OB2U_NOcV2oCmKoBt3Rb8
Message-ID: <CAPDyKFruD93LdDp3yuttXgzSjJKSrswRxMOqD6KP0UO3VzvZBQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084055_965814_A274B6B8 
X-CRM114-Status: GOOD (  29.92  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Troy Mitchell <troy.mitchell@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Margherita Milani <margherita.milani@amarulasolutions.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Vincent Legoll <legoll@online.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 May 2026 at 10:54, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
>
> Background
>
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
>
> Implementation
>
> The series enables SD card support through coordinated layers:
>
> - Hardware infrastructure (patches 1-2): Device tree bindings for voltage
> switching hardware and essential clock infrastructure.
> - SDHCI driver enhancements (patches 3-7): Regulator framework
> integration, pinctrl state switching for voltage domains, AIB register
> programming, and comprehensive SDR tuning support for reliable UHS
> operation.
> - SoC and board integration (patches 8-10): Complete K1 SoC controller
> definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
> with full UHS support.
>
> This transforms the OrangePi RV2 from having no SD card support to full
> UHS-I capability, enabling high-performance storage up to 208MHz.
>
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v9:
> - Rebased on top of "for-next" to include required infrastructure:
>   * P1 PMIC regulator definitions (commit c02c047b925c).
>   * GPIO pull-up/pull-down configuration support.
> - Updated BananaPi F3 SD card detect configuration to use GPIO pull-up
>   instead of "broken-cd" workaround:
>   * cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> - Link to v8: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com

Patch 1 to 4 applied for next, thanks!

Kind regards
Uffe


>
> Changes in v8:
> - Resending the series as v8. The v7 submission failed due to an SMTP
>   error during transit, which resulted in a broken thread on the mailing
>   list.
> - No functional changes from v7.
> - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com
>
> Changes in v7:
> - Remove sdhci-common.yaml reference from DT binding.
> - Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com
>
> Changes in v6:
> - Add pinctrl support for voltage switching. Document optional
>   pinctrl-names property supporting "default" and "uhs" pinctrl states
>   for coordinating pin configuration changes during UHS-I voltage
>   switching.
> - Update pinctrl state naming from "state_uhs" to "uhs" to match DT
>   binding naming convention.
> - Fix MMC drive strength values based on vendor kernel investigation.
>   Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
>   13mA to 42mA to match proven vendor implementation.
> - Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com
>
> Changes in v5:
> - Document optional pinctrl-names property supporting "default" and
>   "state_uhs" pinctrl states for coordinating pin configuration changes
>   during UHS-I voltage switching.
> - Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com
>
> Changes in v4:
> - Revert to start_signal_voltage_switch() approach for bidirectional
>   voltage switching: replace voltage_switch() callback with
>   start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
>   signal voltage directions.
> - Fix DC input voltage specification: corrected the main power supply
>   from 12V to 5V to match the OrangePi RV2 board specifications. The
>   board uses a 5V USB-C input connector, not a 12V rail as previously
>   specified in the device tree.
> - k1-bananapi-f3.dts: add `broken-cd` property to work around card
>   detection. Using `broken-cd` disables hotplug detection but keeps SD
>   card functionality working without additional dependencies.
> - Add SD card support for Muse Pi Pro board (contributed by Trevor
>   Gamblin): enable SD card support with UHS-I capabilities following the
>   same pattern as OrangePi RV2, including dual pinctrl states, PMIC
>   power supplies, and card detection.
> - Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com
>
> Changes in v3:
> - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
>   add reset support" patch.
> - Squash tuning infrastructure and implementation patches (3 and 4)
>   together to form complete functionality and avoid unused function
>   warnings.
> - Reduce code nesting: implemented an early return sanity check in
>   spacemit_sdhci_voltage_switch() to reduce indentation and improve
>   logic flow.
> - Refactor pinctrl initialization: moved pinctrl resource acquisition
>   and state lookup into a dedicated helper function,
>   spacemit_sdhci_get_pins().
> - Use generic regulator node names (buck4, aldo1) instead of
>   device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
>   these PMIC outputs serve multiple devices.
> - Remove dead code handling 3.3V voltage switching from
>   spacemit_sdhci_voltage_switch().
> - Optimize tuning algorithm to use single-pass window detection instead
>   of storing results in array, reducing memory usage and complexity.
> - Remove unnecessary card detect check in execute_tuning() - rely on MMC
>   core.
> - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
>   tuning support.
> - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
>   following the same pattern as OrangePi RV2.
> - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com
>
> Changes in v2:
> - Removed custom AIB voltage switching code per maintainer feedback. The
>   existing pinctrl driver already handles AIB voltage switching
>   automatically via power-source property changes during UHS mode
>   transitions. This eliminates code duplication.
> - Squashed regulator and pinctrl commits into single voltage switching
>   implementation.
> - Moved voltage switching callback from dynamic probe assignment to
>   static sdhci_ops declaration. Removed redundant SDHCI core call since
>   the framework handles standard voltage switching automatically.
> - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
>   conditional for SD/SDIO cards only. This follows vendor driver pattern
>   of differentiating SD and eMMC card handling.
> - Include no-mmc property for SD card.
> - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com
>
> ---
> Iker Pedrosa (7):
>       dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>       riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
> Trevor Gamblin (1):
>       riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +-
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  21 +-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
>  7 files changed, 431 insertions(+), 3 deletions(-)
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
> --
> Iker Pedrosa <ikerpedrosam@gmail.com>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
