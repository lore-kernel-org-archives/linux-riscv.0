Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E3FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 22:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A66160EE7
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 22:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A66160EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWlyeKzgd1pgZnKdLB0cWp629+5MC8gVbdSiuZDCOtI=; b=emCVe6kFKI+oTz
	ly7r5G9wgL66WmFhE61tqtvlrefkPRb6/z9XboD+H1c21eFOfHGlsHrnNUgw0HIqRnAi4SFgdbc5X
	W9dMuZkpzNxyOpB9MPoSR8oSQkQwtBp9XI9Q/nnmWl0OpqSfZvhKjwLScY+D2uaITV0sp/twaNCOg
	sitdTAQMgVgK5Jmi5J/rc46r6eDSzey2BjRTDANig5lPVkckmGHJGKiBIkLIvkRyDWsEQ1yIHMNBi
	JpuomWEITMw3LXJ/wxX+tLa3Cbl7SFyX1Pkam/XROM6djGt1HhtIO4Al9kc/gK8TMvW/pXfI+vpNa
	+yMW0dn2AGQk+fe490fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzOl-004jxl-Oh; Mon, 27 Sep 2021 22:46:59 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUzBc-004gM4-Mk
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 22:33:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g41so83804822lfv.1
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zM4fBOa/Cc+NJs4yahzMxnuSKuzGDGiVwQrXYFaw3GU=;
 b=ICqqWiLqBDT0t9jn6SdzLmBUmYs8DPRMcEdkG/ON8LnfK+o2owAjxRZT39rfh4QrLn
 p22YxgnEJr3UTYZjIE2c4ZOCvY09SBymnqCl6tPrRSPnZbYlV6juugSp0gNhHH6URqyL
 mbHSiB74bJwO4un0kQa2UBlAo6OMSw5/ngEY5oIMd5yn504Kut5DolDmWvlYd3Kx9rZk
 Uq7xSNHzr/9qLjG/aYPN6a57oIh/mWVxMqOo0x4qamWtNyEP6MSPvLZ3D7roH2Ns6x8M
 u4FB/+gGQ9WtalJv/uQK8Po9mlTNNOT+9BBzObVeGwvqef+kMMCxbGe/I+NvUU1JWk/3
 31Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zM4fBOa/Cc+NJs4yahzMxnuSKuzGDGiVwQrXYFaw3GU=;
 b=rNIc2F3j/FK4X2qfJdeQEqqr7rR+4JpP87fem0RErpISwIqlsI4exklITn+TJjPZ3M
 WtJJPudcyt3RfT6hbDR7c0ysuFgWMDnuKD+CUsT0tIpliijvooB7qx1aufr9vLjAVEkw
 WZPkrPjFj/7lYhdtaozvyb7wSDGPf8Rn5iLuG+R0nAGLCWbjfNuTX1PCUbbNk0gYh3o/
 Z7YkX2NEw1Foc9ysFtCKySm1Al1edt1u6u+PSqelfgWvCJqOFx1WNoyLNol6Vn+OV9l/
 aHUMSxLINyX7Bpm7Sv6nSETSENI7T7xLyorDF9JCzGRwZ7yG5W0mmuCYZ7rQ43E/SY+6
 OLKQ==
X-Gm-Message-State: AOAM531AI5SEBGGQt7iOo6B0AgkKAssl0/d5Rstao78c4NXdMQf7a7gp
 BiOSwtfS5aClxui870AnowsTVE0XeO1wbx/Ct94j9A==
X-Google-Smtp-Source: ABdhPJyCkbS2MXhhj2GEIsJRQHChM3/s/YxU0WZXM/5MxIvupi0dl1BoN6G6RUeYG8MNAmtmUhre/M6FEpZgurOihS4=
X-Received: by 2002:a05:6512:2397:: with SMTP id
 c23mr2166459lfv.358.1632782000629; 
 Mon, 27 Sep 2021 15:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Sep 2021 00:32:44 +0200
Message-ID: <CAPDyKFpnd0TWxvdbivkNUN9YrPyWWdiQkLLp94MNWh8pXXqxdA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: mmc: cdns: document Microchip MPFS
 MMC/SDHCI controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_153324_786728_E897E328 
X-CRM114-Status: GOOD (  15.21  )
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

On Mon, 27 Sept 2021 at 14:50, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The Microchip PolarFire SoC FPGA DTSI uses Cadence SD/SDIO/eMMC Host
> Controller without any additional vendor compatible:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> Changes since v3:
> 1. Adjust commit msg.
> 2. Add tags.
>
> Changes since v2:
> 1. Document vendor compatible instead of dropping it.
> ---
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> index af7442f73881..4207fed62dfe 100644
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - microchip,mpfs-sd4hc
>            - socionext,uniphier-sd4hc
>        - const: cdns,sd4hc
>
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
