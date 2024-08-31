Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A25CA101C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txT7zSgrAadCFo1fYE8fVU3N6cPMnABj54Ho7QkIUMU=; b=LSudE/8aJn4HoQ
	ssajwKmOkH4qluKmnorLBQTvelC4Z/JiiQ3iU2jVDlsTmCpu4fq4i1w1QDEqYoDXCTDhje1T4HssB
	y02PypmK5Cz3/lWZsJqtG2io/alC7ldUBB9JXIzeSR37uSHtlc8iYHnjV6FPvOUYeJfdxpZjeKn3o
	tyRa6lb3kOwr/6cZmXIBlqcz/ScNm0vjq5HA5A0d5KQt9PemhfMCjbyAuILLSWRXdLajIVQcpSruD
	aEcZwax9jSo/Y5ykBVEz6RXsZtC4pXdnnnrrYbxbFf00uNewqgc8d696flTAb4VO9oKYEnTld9sDb
	1MyxI3vmTH7ROxi8h4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skM9x-00000009DVy-17rX;
	Sat, 31 Aug 2024 11:20:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skM3n-00000009CiE-3SK5
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 11:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA5675C0FC4;
	Sat, 31 Aug 2024 11:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2E8C4CEC0;
	Sat, 31 Aug 2024 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725102866;
	bh=JoeQ1+9FykwPktoL15ThTao/9Vu+3+00UVGBonSwU0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PgRa8u81fp8I5BesmFFAMHoypMHilmrdMf9Iy5m16yRQ5eYOhlRIJrS/QzzfabJjD
	 z7V+taqA+3T0WLSH5OeGxM9HgmAV5ZfzlpH3gYKK4KeXO3PccYtG7H9LC67vhK+D2k
	 9PXfWXMF9DPSlGB7jh5Uq39NdeBxUvluSQngLrf+IZsuucRUtBuRLspNFhj7Wuw6nu
	 BT77xAEngPGRXXktE3Hc6L1q3ebrVJmCw/6YsvRi+/EnCjlPv/aLFn4GvEixoaKFtk
	 Kyu46zCyrZ4hbYuhPQY7wJck/9Rp9A4fycU+A2A00nPBGjQbrikLT4hYw8EQhH3m/6
	 oG623bSI1gUyg==
Date: Sat, 31 Aug 2024 12:14:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/3] Add SARADC support on Sophgo CV18XX series
Message-ID: <20240831121415.4888cf11@jic23-huawei>
In-Reply-To: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_041428_006119_E6EB5E02 
X-CRM114-Status: GOOD (  25.91  )
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

On Thu, 29 Aug 2024 14:31:49 +0200
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> This patchset adds initial ADC support for Sophgo CV18XX series SoC. This driver can
> work with or without interrupt.
> 
> Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2002-trm-v1.0/sg2002_trm_en.pdf
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Applied patches 1 and 2 to the togreg branch of iio.git. Currently that's
just pushed out as testing because I want to rebase shortly to get some
usptream fixes needed for other series.

Thanks,

Jonathan




> ---
> Changes in v5:
> - Add the ability to read the sample frequency
> - Edit commit message to remove No-Die reference and add precision on
>   the ADC series
> - Rename binding and driver file to match compatible
> - Reformat the channel property in the binding
> - Clean driver code
> - Link to v4: https://lore.kernel.org/r/20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com
> 
> Changes in v4:
> - Lowercase register hexadecimal value in dts
> - Reorder properties in dts
> - Use only a const in the compatible property of the device tree bindings
> - Specify the series of SoC in the driver to avoid confusing with other
>   Sophgo SoCs
> - Add channel description in the bindings
> - Use FIELD_PREP in the default configuration
> - Index channels from 0
> - Return PTR_ERR instead of IS_ERR
> - Link to v3: https://lore.kernel.org/r/20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com
> 
> Changes in v3:
> - Subdivide default cycle configuration into multiple elementary
>   configurations
> - Fix formatting in the driver
> - Use devm_mutex_init
> - Use devm_clk_get_enabled now because the clock is no more optional
> - Remove handling of Saradc in No-Die Domain as RTC isn't implemented yet
> - Use cv1800-saradc as default compatible instead of a wildcard
> - Remove platform_set_drvdata as it wasn't used
> - Link to v2: https://lore.kernel.org/r/20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com
> 
> Changes in v2:
> - Drop modifications in MAINTAINERS file
> - Rename the ADC from "sophgo-adc" to "sophgo-cv18xx-adc" to avoid
>   conflict with ADCs available in future Sophgo SoCs.
> - Reorder nodes in DT to match DTS coding style
> - Switch from including <linux/of.h> to <linux/mod_devicetable.h>
> - Use scoped_guard instead of mutex_lock/unlock
> - Check IRQ Status in the handler
> - Change IIO device name
> - Use devm_clk_get_optional_enabled instead of a clock variable
> - Init completion before the IRQ request
> - Removed unnecessary iio_info structure in the private data of the
>   driver
> - Use SoC specific compatible in the bindings and device trees
> - Link to v1: https://lore.kernel.org/r/20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com
> 
> ---
> Thomas Bonnefille (3):
>       dt-bindings: iio: adc: sophgo,cv1800b-saradc: Add Sophgo CV1800B SARADC
>       iio: adc: sophgo-saradc: Add driver for Sophgo CV1800B SARADC
>       riscv: dts: sophgo: Add SARADC description for Sophgo CV1800B
> 
>  .../bindings/iio/adc/sophgo,cv1800b-saradc.yaml    |  83 ++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  22 +++
>  drivers/iio/adc/Kconfig                            |  10 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/sophgo-cv1800b-adc.c               | 218 +++++++++++++++++++++
>  5 files changed, 334 insertions(+)
> ---
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> change-id: 20240527-sg2002-adc-924b862cd3f2
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
