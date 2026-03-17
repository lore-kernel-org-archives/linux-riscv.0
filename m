Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E75FD7099
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuzqG8+ijWR9YkLx4E9ZLuy+CV8u/Fk8w7PezW1/g6A=; b=b37YaHrKCc3nl3
	b5dlE3u5PaWwHi1eruu7jnVISlYTB+BVgKRNL3RVi21m5WCPUZjkyXqLwpz+ebcoiG1BA5UOKm5MQ
	84l2hisRDo72nRLMNM/cda6ptrsah8j+b7b5+qQLne8zE91JCgGbp4f4OiwidR2CMWEHDYOI7k/Jx
	AchOaDYh8Ez0Vks6jVxXzCg6URVgmj79hMb0gwQm93Vv7bVCfDXsdSTO0LAEb86E0Y+okL5oxbXUO
	t6OiT/SkPnIdphSMzsxQPSBuLyKknCNtNe3VK3dXtKRnxfxe8EdWpVPtc/BxufwryhlIZ9/VSOttH
	MgtBM645Jp1iOb8hcf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2awa-00000007CB9-3e6K;
	Tue, 17 Mar 2026 20:23:12 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2awX-00000007CAT-02Pb
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 20:23:11 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd73c4a827so534985a.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773778987; x=1774383787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QyiDZ5RSYUOfAeS5ZUUKET2WqUdsSAGFaGllFAZ7XM=;
        b=FZn8YqvHu2ztyQhApvRhTdERfVEfwgHO2KXqE4BYLhWTO3g3RLn4PBoqsGXigjZifW
         S2yZR4R5Ipz8NqoSt0QTu1IdVSKfgAJpin9iYcBv59m0ZZlltVJFb7CR4De2vglHA2KV
         Aqc5i/gaLlvLR85fw21AfFIjy7G2YiUWKN6GUWbArxO5+AD+wIpmDqvB9rjtkstSu1Ku
         0td7a4hdT9Yg33eAqiGLE5SbHhQxof35Hpv7M4dEOQo8pBcCQr/ADyh1Aobs1vw4MUZ3
         3TLxmdpy8ArhVGguphnBt8csNjs0NkKj5+z95ag1v/R5yFitD8bl8rJUXG+/1VwkxVER
         ijJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778987; x=1774383787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QyiDZ5RSYUOfAeS5ZUUKET2WqUdsSAGFaGllFAZ7XM=;
        b=dZ/PXej2lFGCNXb5T1gEC+lmGW6XroFcjj720Go8W7wJt15Bkfn4rMi+A+FEdCLTxC
         PaSo5wjej+sfip0IAy+Vn7JwPpSFDZaTp3ILbOu9mIFAl1ODMIAto6I4AI0amITxrJOF
         kYB+P2gMZbRsKo8SgQ72T49B/GRD2yrITUxsR2laAT2zvWC3g9uOKm5KMXPDGmZDuoh+
         PvzFJXvOWje6SiiwGNcne/pmHsg0Dvm+QeKbBbw2IMXt1rXdmcwht6ljYC2BqSZyhaVe
         2SxXUnXV5R44D9Py8zgo3qN5RTOuj97pK/OKaHI3eJmp3oizBAtSKcxnEhkfOAEe1Nvh
         42Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV2MdGvtWslcapJS0ITkXSk2X2V8U5+U91A0Ay5EiyWEXLpWb/2jGB+zGublUCAdq93pXIixQJjvSWU/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8qjf5O9e8H6e12ZVLSTWhBEQPJlwSOqluOBcGolao/vT13sin
	KBBEZdYAzgn6Y5ICkMlpOEWEtwMRDNvy3fLH66W+uWo6fw0avHE0BNEYsn6JYmh5vUM=
X-Gm-Gg: ATEYQzxer2SDBbugUX1SS39haAMTZQ7xBlYxdP+GGUqWos5A9iD3iYMbOylZ2JBEAz6
	AGG82Bze47xY/KFDnqi8sKyo85/UecKU9YWz/VlXHFgWDNt5H59V7n2lkRqWqja9PLc3M+O5JY+
	VYYMZXYkoPzffhoSfcj/zHMPTHAwWy6eL5TCUKrBnD/nozGFiX0SdMi4vqjLpv6zJFUknZK0VLq
	UVEZrzSn3RFNdM1xtPRrbyZu5S9WMhQSjYMq0gkxs4N9l/uXY+F148uoEoNTHJnpuAEcJbcLAAX
	YiKJOV0R8EVuZWmygVi2TVIn8jhhchJjDJvq1C333hhcFIWFbDdkO7eftjtetBy9wvO4HGPK9RT
	PZr+D4fbzU1rCmEkCPJ95eK6PlV2B1TiDw2UK7n4Gg7NFW09rT8ql/bMs5qecXNlDqWV6GQNSwx
	BFFNOCgRM9tWU4/DnycXwrrdtGBjz1DUeKPo6f/V2tg4QfleW1n4oScTCLRKf25dFNTZLA29+0U
	Y9z
X-Received: by 2002:a05:620a:bc5:b0:8cd:b90f:fc1e with SMTP id af79cd13be357-8cfad3df061mr133791185a.70.1773778987159;
        Tue, 17 Mar 2026 13:23:07 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacdeb785sm57993585a.16.2026.03.17.13.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:23:05 -0700 (PDT)
Message-ID: <b3e1dfe6-b16a-44ed-82c4-b9140c91dd44@baylibre.com>
Date: Tue, 17 Mar 2026 16:23:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_132309_337203_47EC2F3F 
X-CRM114-Status: GOOD (  20.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2026-03-16 10:03, Iker Pedrosa wrote:
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

Hi,

For all patches except 7/7 (k1-bananapi-f3):

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v3:
> - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
>    add reset support" patch.
> - Squash tuning infrastructure and implementation patches (3 and 4)
>    together to form complete functionality and avoid unused function
>    warnings.
> - Reduce code nesting: implemented an early return sanity check in
>    spacemit_sdhci_voltage_switch() to reduce indentation and improve
>    logic flow.
> - Refactor pinctrl initialization: moved pinctrl resource acquisition
>    and state lookup into a dedicated helper function,
>    spacemit_sdhci_get_pins().
> - Use generic regulator node names (buck4, aldo1) instead of
>    device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
>    these PMIC outputs serve multiple devices.
> - Remove dead code handling 3.3V voltage switching from
>    spacemit_sdhci_voltage_switch().
> - Optimize tuning algorithm to use single-pass window detection instead
>    of storing results in array, reducing memory usage and complexity.
> - Remove unnecessary card detect check in execute_tuning() - rely on MMC
>    core.
> - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
>    tuning support.
> - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
>    following the same pattern as OrangePi RV2.
> - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com
>
> Changes in v2:
> - Removed custom AIB voltage switching code per maintainer feedback. The
>    existing pinctrl driver already handles AIB voltage switching
>    automatically via power-source property changes during UHS mode
>    transitions. This eliminates code duplication.
> - Squashed regulator and pinctrl commits into single voltage switching
>    implementation.
> - Moved voltage switching callback from dynamic probe assignment to
>    static sdhci_ops declaration. Removed redundant SDHCI core call since
>    the framework handles standard voltage switching automatically.
> - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
>    conditional for SD/SDIO cards only. This follows vendor driver pattern
>    of differentiating SD and eMMC card handling.
> - Include no-mmc property for SD card.
> - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com
>
> ---
> Iker Pedrosa (7):
>        mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>        mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>        mmc: sdhci-of-k1: add comprehensive SDR tuning support
>        riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>        riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>        riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  23 ++-
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 +++++++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
>   drivers/mmc/host/sdhci-of-k1.c                   | 243 +++++++++++++++++++++++
>   5 files changed, 384 insertions(+), 2 deletions(-)
> ---
> base-commit: f38f518dda1f1decc7a39556fe3231b0d1b84e1e
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
