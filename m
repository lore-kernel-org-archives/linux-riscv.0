Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C470F589B2
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARAOXosFF1Hx6kP9SkF7nGynQvhqugrc8+cbf5pNMJ0=; b=DhJRuj/chDdpVl
	3KrwWI1TI+QJdNwnDYUU7PJCrwFQ8W2YZfNnilcmqzkUmbwLuQ6X11U7uLjTHDJIOln2Y6OTDg+jn
	y+ec4si+YlOFeenYNqBuLEIGkJmIcWgIS9o3yDoz8Dy+MJXHE0PNWsISK9vVCsdDoKLjCmVTpk5k4
	AjhxIhva7vTsOeM12t0xgvbxlQdjPYWNqaJC/nNFzlvCtDEqZRPvcyZzSyUIsZT/T4foSnrCTuf6j
	5XoD0xRQCCDXlIRNu312iwG1X1qrRFWzEVlU6b/r29FugbVWt0grhrvrt4DTZOnWaZ6YUCi4ChqIf
	Lh3Qn/KENUbPDKHl/wTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOI-0000000BdbY-3qJr;
	Thu, 23 Apr 2026 12:42:46 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtO6-0000000BdUp-2X4f
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 12:42:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so7942425a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 05:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948153; cv=none;
        d=google.com; s=arc-20240605;
        b=VqvcS4F7eVJr2nL05wVJAge+Rtx/DFhlALJj+5XgjZtijUAj5LK02skdYWBeIgTPpe
         yej2akebWqhTTZMHnMYHcFfVugqgapzY4kCGQKktbnlK6ztBoWtJ4ocz1vt0uf5xSM70
         3XNrGqa7UbRjuVVXCsiiXeRpQxoerF57wOEgBPc47It71Hmyu5aZMJBCOuPNRAWFRX/a
         cN5cyht/rPcpo/sP7GClOIf4ecBQUnqxfk/whDS6kHJhrWWWLjLmgpstouw/4ektEw+2
         24qhWoRm0TkbC1Pyk8gTAfDRU5ScLS/IF95k+benekS6VC7DApxZwHqQ+KXk85E/DFgn
         oJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8zSRHjean7w9zY7KbU/JVuqpAg0+41GC7JxwHHVZ1ls=;
        fh=+0OCD5jDDlYtTwVmJX4xdHfneLHta0IlCBG5+oisrCo=;
        b=NrnfHd+naMv/1EjZ+MmhIKTRdi24B4xNrSU4wwM9tPbWyK+VCo/P4/6Y4rK4ocxb3u
         Ywn5TPlxqk26prTuyRFcp0Tq7clXH6jakayo76KWZKzYr8zeJ3sd3Gb3gM3SyfQlHEa+
         EAKzOR4xuhYbZqzZhyoO++wZt7F44YpkQoaMeQzE01+UHLNEdnX3biczWcneCelHXXHu
         EUAce0rURn4KXDri6y5m9p7JOGZPsKVRvziZ/gcNLyDMoj+U9GsxX5PDqgqgewmAPoUJ
         NgVKcg9jPy7zT8TegBnkQGPm4a50E81vOtIihg9Or5QF1ZSvU5q0j33iC3Lcw/Ay8BxC
         kZ5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948152; x=1777552952; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8zSRHjean7w9zY7KbU/JVuqpAg0+41GC7JxwHHVZ1ls=;
        b=JcaIONHEGV/8tngenrMX0Zt9I2YZDmoHZlVEgXvUcn+C4Lgh+c8g7L8U9EnsxG40lo
         b4KWtWOJiQqzoVraG0Pn+sK59JT5cJzajITcxH8LFVkNbNTF8V+M1wFVdqmi0UEEvSSw
         HOLP1e69/ni5gCX0IhNDh43/PlwhQQUnOaUBT0fGQdN2QftPqtfZEE+9JTJ3xu6gHnUS
         heo5rEM72uxrIuLNx+RFaQ0SsD8qKM3xU9xXYtZNPvCPvwLKPnYDYK5OfZNRljhkAw7x
         YC/lJEgPJBFP0eRFwEqeRwGxGIgPff6OoQOKtyacwfKHCSPATkoQQ0NGdOaLdkiJ8wQu
         y9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948152; x=1777552952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zSRHjean7w9zY7KbU/JVuqpAg0+41GC7JxwHHVZ1ls=;
        b=EH+H6FyogT79fYpGF8XnnVW7wRTYn0ySdPuQRqPINxjTcGpbjL0SAHlk131z44rced
         JOVlZrolsZmXhKfBDAdJvEmNlwUflxpTIYSKVIGzTRl0a2gCsMib1biRZbwkvSlko7/a
         N3JYZC1Qfp1auk8x48T5Nolt1wiND94m/rmt/ra4v7yoT2yha1Uc2Quv5wlYzuwEO/OS
         ItAv60fESfk9KOR/CuG/g7Xy307BXRA0f/d7O5HsdA8tkLiFfaFeHzkDUNeA2BrUiB2B
         fLeArQAV6xECOvR7J4c3xXwQLenWqTnJeK326Cxq0XNggrJaDZBbDm07eMiMfBWoD6tb
         n7eQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J22ReQfU8BoLK+DMK7AfJqKtAeK7X4TWCxqfxO1sUetRzplCcjNkw6ay2XJGVlPgFztGmRHBRceONWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJfQR05vGzCAsZ/qxg9NPc9GgGKQ8KD1jNfmw3MJvanUDZpAQi
	RQvw9xi6uXsNkNzhhJL+a2RzDafJNZ+5MO3wWAkavBywWKTFQ0TYMRPs3OZ2Tw8WeaLvrf4rJI/
	UcAe/P83n1AnprFO+rb6q2m55HlwWrs0=
X-Gm-Gg: AeBDieuFdzyNGDIaQFa3cEtVWqlLLMeB34ityvT8TqFTliOxaWQmkxN+iIuEROVvR91
	CXuLzNAtKdJXF/ZuHkpXrBxLoMx9f80ZjrsPxSL6GOQCQiB35JPktOw/2jbBJVzjKJjXaLVY8fG
	dtFbH9QzUgUi8Q5IpIYoCuj6XT74oMAtDlPbBUXWlsFFunOrEFSk7GRWAoeZc7phmK08KN858nc
	sZeO3mRhpMcBW4+ls59wecd8wv9xSjMDD0PQqaPxzs5lHchT/dfSqTNjqbba/zGwndVzjLIm9E/
	RZTQxUe8RO7Ag14=
X-Received: by 2002:a17:907:d87:b0:ba6:cb4c:bd3 with SMTP id
 a640c23a62f3a-ba6cb4c0f80mr1032293366b.11.1776948152083; Thu, 23 Apr 2026
 05:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Apr 2026 18:12:13 +0530
X-Gm-Features: AQROBzCyFMNMbhu9CwDqInG8KR7Q7ZUH7V-_WWXTlBN010HAPlnlXUXgzpznGME
Message-ID: <CANAwSgRNrs4C4B2o5KBpr29QWowTzpqVcQktAbFigiagxaFZAA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vincent Legoll <legoll@online.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054234_710288_75CF8D83 
X-CRM114-Status: GOOD (  31.50  )
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

Hi All,

On Mon, 13 Apr 2026 at 13:32, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
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

I'm just checking the status of this series. Since it hasn't been
applied to linux-next,
Will it be included in the next kernel release cycle?

Thanks
-Anand
> ---
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
> Iker Pedrosa (8):
>       dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>       riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
> Trevor Gamblin (1):
>       riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
>  7 files changed, 480 insertions(+), 2 deletions(-)
> ---
> base-commit: 4c3b07bf68391122266dfb01126484daf352cf70
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
