Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053ECFCA178
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ud/1lzNEYTGMs6wVqdXZOxYtNFhker31wBZ8N3RAUsU=; b=BBjae1wX3AFZfO
	AGbwOMEDcwXBdbfwaiO1GQX5lnxMmLYC58m1aapYjLeNXC+hQREa9lApYvKzTMzme85SF6oagFEul
	3/BXzs6WbALLHhv68NovmBFaWVOOuUyGKRv11++OOx1G1QRgfpCG9D/R5sM0yT1OiqL4AKbYxEygW
	zlgdU6D2D5FKe9SaterPZGGbrElseS2g/lC7cFFcVTkW9LpuBWluVYyB6HerrDUMAXsYlfYiDeA3K
	NuzBDWfwykQzmYkpDnoPr/b9tLTTLntEnsGcNWpWJvyA0+8ZL5ZXEl3Fq48Au7agE3ibNQjmbDyeZ
	R206oYd/lCca5r7Ou0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfgK-00000007vwW-3gUD;
	Mon, 09 Mar 2026 18:50:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfgI-00000007vvr-2KHu
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 18:50:19 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b941d924534so452222366b.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 11:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773082216; cv=none;
        d=google.com; s=arc-20240605;
        b=T/rOSvLOaA1Ibd2o0ICfyRdA7kXjfeEmLKqmSGYj9e88mqVIqElsamf9YTgx0F6Xkq
         iz0XLvuSupbicUyBNDjj+7FttO2c9leCnDtNgB002HtZdbi/jq/qJ6K5/+ttazHm69kX
         WvLfVONqmPhu0rcqENM7v8adgMSfzIxMOWRcgpEBF/vhUjr9FT9yMnKt1DJ/luZPHu+i
         TIkO4RbtCsyBo4I5KR2DG+93F3V57wz+8p0axqfKxNEtaw2TXSvvZceGM49glE0uKaJy
         S1ZBfLa8TGPn2hxlkaT/TZQjt2D9PyoX+I6vAsxgXQIjMCgA/1IxeohuJu2rmt5pd/hB
         HylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        fh=jSTApwwNjuc/NlacG56js7JNNCV0oHM2UFPCPW0Yb38=;
        b=L4b/AJu4QNClip9U6K7ZpnPCCv6Morv2mAIvfdE96dLNioCx8f99iJQOrKAZcM+rI3
         AHStOk7TkjxBQfFiBZpFyVWvgry2lOczQ9J1PRtdRnyMK8RnAqGQS6gHQ8rFiTuvYecA
         DL7tdW3G87m1FkfdWAcqUaXH0yDgSiPxDPdgZMsRFWMaqPGDh3vbqZQxadw9ldIusZKA
         Mtu1mQ9FSJV/Fp7T0PlER4UxEbQ6MM3Z7y4am5bYE4LQusWEJ0hNZdsmhZmwp7f26BMa
         tc/uNCuCgEXf4uNRZdyrPSv9EpBI4kjRD9xxpETWtWgFbGFllUOWhTfe2JYQwRD14nBp
         DQsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773082216; x=1773687016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        b=Cz2/ENabhPmcB+8GMlpeAvO3tTYD2t3xvIba0uShHH6vcyN2dG64Kwzx5HA90v+9av
         GBLfA8Raq8lJSW2DKZobz89tRYeS2TpUpUwX5w1C98MvSFGbEv+Xqr+ZKXqfvTxs8x7z
         BS3HFlbZ9Y0XgSWPTFCZDL9lxGCADO1zHvuI3o0ahXSORNrJGqEjME6dohK7wIvImZiu
         f50cVR+ZWn30qJSOPmK3610dbpDj1c3n8xz5gvCnsGUcDNntMhzcr2cPZVwGu6HQm6vQ
         c2yXCVU9OBtXQ3LfaEgVN5cHguGU80l+e0fKCWSrVa0dP2nR+9H1ag456H1y7H2U+J99
         nrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773082216; x=1773687016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        b=B1supaSn676ckXDoNsyMXI/aSQRmGZcVdeWfnayXToHPNhqLda4XpGgzE81ZCNd32j
         gkqrPjUmeFCriGaz91h8D/+kRG69wEEmkcHtiKi3X3kqOnrVkXOtIFUyil9TFQ/fIRSn
         QqF5fXgmEjYF2xkD1cdZ6Hpz3sXDPZzX4ZY9aEqp/WXaMycNrziD8RnjhRL/cFGEqn5R
         Rfta+gg/cyNzYdx5s7y3yRMsAlHVc0iwTT8nPv56sKXyQUiO76FLcoGKOt5sgWWHc3ct
         sn6dFSdVdlsUtpdnruc2voNLCbQ+RBbcYxXubSZwYkOa+wXVL83/fPgqE2nuL5q1dhWx
         m8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUfY7QXvENHzF55sIgsOKLeUOnpikzldtGeopMQ1hq21c+UwJzhrEq3AP5a21+SAhUCUJBfYDeEGbuoww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJcz2RsA6/rd5euI9XKliBDfKo7mU42/icoktBMnk40yqOnZdh
	mOiuAoyenXp/B2S6wyjPrOlc8JIyJCWwoewxUW3Bh7LT80hT17BPzUeOQb5P+vkmX85KLw/12uh
	XaLqwjbWh6K6fIbgNvWloxHoMvWheHDU=
X-Gm-Gg: ATEYQzw54/U1uKy0vVyTakyXwv0D9XRLQbacXlpcC+cprmr6PpNbfsd7SVC2Df30NVs
	7nIoHIIDTJNTbGzu6I/6dLOOwgY0ir1JdqVCrQTc8xPnlqhVKRLukgtnLIwdXUpa5UBbWK3HV84
	ZBQnpOINeMG15XcoxQ/qKD0evRSU+7ETkMlumBgPxxta0vlHhFL2QJlmrMOTdFY6SkSngdfLwaD
	0Q7H4fWAff0/GmeLmsgsbTDO/6rANBOvzaVfk7YWdVChBOYIdI7XhJfxY+y7Mq1BxbDmTZx4iF2
	XNnNQA==
X-Received: by 2002:a17:907:6ea6:b0:b93:c5a9:a5e9 with SMTP id
 a640c23a62f3a-b942db854e8mr585699366b.4.1773082216119; Mon, 09 Mar 2026
 11:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Mar 2026 00:19:58 +0530
X-Gm-Features: AaiRm51K4xV8rPWNxLGo_P3SgtaWeN6UkUVkJtFc0B8zhHQGEqIMu2rC6apEjTo
Message-ID: <CANAwSgRcatU3BQrsd11kA-nj_xos_Oa_47p0P_K+RYrB6QtfXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_115018_630451_A4195B60 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Iker,

On Mon, 9 Mar 2026 at 17:11, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
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
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
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

Thanks. Please include my tested with the SpacemiT Banna F3

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

> ---
> Iker Pedrosa (7):
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add SDR tuning infrastructure
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                   | 252 +++++++++++++++++++++++
>  4 files changed, 372 insertions(+)
> ---
> base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
> --
> Iker Pedrosa <ikerpedrosam@gmail.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
