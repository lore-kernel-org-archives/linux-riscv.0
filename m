Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28F0C55179
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:10:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460D6206DB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kh41BFyc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eSDiZBsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460D6206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fv0qpvAOw522rpzAS75tBZrJ7AQOT7Gt7Z0LgXqIZfM=; b=Kh41BFycTEhDDcP8fEjIOd3BY
	bIpD0q+ANc9vI4qvA4EBpEvgq/lK4uYD9H+qcAzIrKhsk/kwlN7YjGjbyS1McOUclphL3mKVGR/ac
	SiRvbYn9+qrQCF9/+4ht6L5ealt470CD+1zlhOa/aAhH/6mDl2GZgP/1x1Tk3qOSE20Mi0qdMYjjm
	5C8KVKnTzNkl+6ss6W6mXgtAYLAvcHJs5CBNhAz80E+BLLIKfml9deejDind3zajZlX+FCan4DxQn
	9K1c9pYM4QhhVTnmXxmpNRF0yUw3JSnIgEe2tlnRkmzr/Oli/s4RQhbuwrvfHdaEnsl5D9i7dTEfA
	xn9gXMzdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQQ4-00041q-Bp; Fri, 30 Oct 2020 09:10:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQQ0-00040g-5f
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 09:09:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id m13so5601390wrj.7
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bfUnFTOfSXFG25x3BnIgOzcDN4IPlLEtsgB9WMJzOuA=;
 b=eSDiZBsdVeZ8YhjpBNK5ZgQZWSgQI5Mysm8lQ5TsGB2ZqMUdGhEFIZP0VVXlfMcKUm
 LwPd8O3SIgi+6vu/tXHEeeU5K9mHbQELrYgErcweripmTqaSfkaydOeJidaFvanXfJF2
 8NsNV450bLQ0tB+LEYEGZIkv3HbBIQr4uUz9AT3g7vq97ZJtf/SbHZk/vpqr1f0nSmmh
 RzYdh3Yli3/CeK2CMtGvCgC50qQAT7iXmNNKrUEa0VVC3fDCR7zFXvsl7GFmDapfrU2W
 LRzQo9BWPe95GLGk0Mur0lzUE7SqBeACwPzrbqLJ8ONVm2cUNvOj1miLDmYYNjlcSxK+
 FNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bfUnFTOfSXFG25x3BnIgOzcDN4IPlLEtsgB9WMJzOuA=;
 b=K1X5r9gUVNCowd8TpHz7SpjUMtcx8l77xBPS/5kfHxosQuzh4nBFe2dJy9q7/gHIcG
 5TgNNTsFIMVlleDShnx/sbfcYANowVlhKZqF9iu5UC4zr04h6CVais/5i9DPOUYw3fYm
 mWiCWbrSNTWrCDFHBtNtobJE/hyZ24EyKrEE5ClZ92CnA+FAmLk4WDZIytvLoojH26e7
 Ygu2CutH5OV9tyDFdP9/68PI14itOjvT4dZhudKD5Air0n2AN3wDXtMR2xceBShD9Nla
 /STpW1iG6IGSM0G9uFjuEBSwbCxDieM0hBPnhJAT/B99yZV3UmUtlw9rOLtOF4tcrujK
 ZbRA==
X-Gm-Message-State: AOAM530nnnQR9fBJHTCUColWu4YLzMbcrIUdklkarkbo7d/zj15xT16v
 8lsQkx4VTLJsplP/ED6zEafA4S6X+Qi68p/tRV2CsQ==
X-Google-Smtp-Source: ABdhPJyA9i/Zk/3TmJNQX1c4BPqrlSQfKCOiUmrNfi7O3zDzfW1MV/RUDeOTVF3R3BgHfJ1Qhnt5xSnKRxgMdqlarFM=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr1797680wru.356.1604048995074; 
 Fri, 30 Oct 2020 02:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-4-atish.patra@wdc.com>
In-Reply-To: <20201028232759.1928479-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Oct 2020 14:39:43 +0530
Message-ID: <CAAhSdy0bgeCLYNTELdyFPj9_W1N6kDTwS6rUmLLnM=N3pTAp0g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] RISC-V: Enable Microchip PolarFire ICICLE SoC
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_050956_357454_092E73C5 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Enable Microchip PolarFire ICICLE soc config in defconfig.
> It allows the default upstream kernel to boot on PolarFire ICICLE board.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d222d353d86d..2660fa05451e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -16,6 +16,7 @@ CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
> @@ -79,6 +80,9 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
