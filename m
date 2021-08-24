Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39C3C432BE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:30:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797BD61165
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 797BD61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l56NUqiNuX+rZqLdZJTpDsNpsulMW6zoom4e62tTcKw=; b=vGDXH/DrJdB22P
	FnK4wAIqyCHkQ5lW827cO56q6HoxjpD8ifCc5V3NcUNjMuBFhnX7YkYNT11oWKrur6AMlF61IVrAS
	75hveqjTb04wKyJCnsQ6c8PmTJM8M9BD4WTP3JHSQ00qUgNbA+DJontDonVKIru3gDmbRnakGj7/n
	PZDoA6nFPx7X9uziCK8uD/Tg9cg9OgcDF2kedmBS8Mun/2Lb5T64Hf6YxEnBeKsT5zMLxYpwKJ6yb
	mBe7wFgyP1UGjQaVGPrcvy0DFzPvcgTGC9F6PKJwpkYLLZRT3ZBnCaU2wN9Xz6SrzNaeE04+JQPBv
	dkW3jqF+1KQSqlDaDmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYN1-003iod-7C; Tue, 24 Aug 2021 15:29:47 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYMm-003ihq-G2
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 15:29:34 +0000
Received: by mail-ua1-f43.google.com with SMTP id 90so11836671uax.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 08:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAXDV2WEgT4Td3amBfmVt3dD/b8AG6VOmssivHHzP80=;
 b=pkwqNZDqLic6TYl37qK2ZeQnBl0Wbp26allvNYxCd50EuAdkD6ztgBAIXD3lxJjnfJ
 2bbJIzR9PfqiyTlHJWRCdopkILSJQiD1piab0LZ+4UHyYxVmD5TvVmchNVKjD5OanxJY
 y6KGCk0fWI65V/oPBTUP+CUAaE7/AasQzSPo7Z0J9YZaiyuK8JQBrBLBgaUVr1M0YYvi
 edA3xFbnRtqNREPPPpjXK41v54fxkUFTc4yBb9gaN0jsi/Wq4UgEuXXBXEW1uJE0SIY7
 WnQPiaDViJNMlFeqeQO3gRmueJeydUKSUNpNTSzTVqKM8uawiqzquLlssasKKSUsgGSt
 3K3A==
X-Gm-Message-State: AOAM5303VNeADF8d15tqIyS7e6yRMX4DBrES905zrpIz6tPyrlZzlSg/
 jom9bWsuasU7aTJUQq0aNFR5Hwiv8ZYpTwqA/Gg=
X-Google-Smtp-Source: ABdhPJwznSbMYiskL2sEMZho2ZztXuaeoqRRaFLbXpd7v868+6eys1TK5q2wufzM+tKaq5laBy8v/raMbBKi4X+dqBE=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr134352uad.89.1629818970934;
 Tue, 24 Aug 2021 08:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210819154436.117798-4-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 17:29:19 +0200
Message-ID: <CAMuHMdX8dBiYadAN8OQpds_bMbLReJy+u6apGe=RZzfEE=BJbw@mail.gmail.com>
Subject: Re: [PATCH 4/6] riscv: microchip: mpfs: fix board compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_082932_561256_2B243890 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Krzysztof,

On Thu, Aug 19, 2021 at 5:45 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> According to bindings, the compatible must include microchip,mpfs.  This
> fixes dtbs_check warning:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -10,7 +10,7 @@
>
>  / {
>         model = "Microchip PolarFire-SoC Icicle Kit";
> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";

I have the same change in my local tree, but didn't get to submit it
yet, so this part is fine ;-)

>
>         chosen {
>                 stdout-path = &serial0;
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index b9819570a7d1..cb54da0cc3c4 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -7,7 +7,7 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         model = "Microchip MPFS Icicle Kit";
> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";

As this file is the SoC .dtsi, not the board DTS for the full
Icicle Kit, the compatible value should be just "microchip,mpfs"
(to be augmented by the board DTS).
And "model" should be "Microchip PolarFire SoC".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
