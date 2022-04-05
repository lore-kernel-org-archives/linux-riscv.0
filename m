Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616AAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZ7agN3n5GPNf5o+KYqBnUDIS0X6Lp1Y7h+Z0msPni4=; b=OiISpUTb3+kAsp
	10sWuqpzYtinC27NFpGU2itrwtVp/S/wtwx3cz0COnaZ6N4XJCyPIL1zO+TlkSgp4UBIIQxAWAdLr
	EujZPkB/fpDblYKDqaddKMyhggoV/73PjBbzzulpy2FnOcWcNL2nq2OxPzuwgoLNZEtVvOeKVEIVr
	ZzpgjqF0wniZU5V5Q55S1ptQQJD8LWeWrqzR8ys3KbLzetE32QSnregeQLFsYDMKqNpJ/5wCO2rZl
	EFaUC+471xzvPs/xMuEH1JyxJTnH/GSBl9MThGusVEiLm8DJKajCw7xvaqoTKwIJQCLO7FVA9odM5
	zo5nOf9O4M8pNQEtIkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbiH9-000yU4-QU; Tue, 05 Apr 2022 12:27:11 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiH7-000ySO-3W
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 12:27:10 +0000
Received: by mail-qt1-f175.google.com with SMTP id v2so10674520qtc.5
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6y71UMdppJimJTZBi5WTCZ7XXmCUTqDhxDjDYyVJQA=;
 b=QkHzVHpQm7YfjCnPzB2M4Bl501kAUJO5T83gA0TObs47R7Rc8RWiCuVJ9UCCiYDFQm
 BYRK6Hzk3pBMEvgwefEBMYeXXRBfHVTz14/FkOeCHc7izvvog0PWKXaKOvxz/LJEVdu8
 pfBrB7yTk11+ChIeisXIauZ60kIb5jJ3dsmhcfCriHNj0nghPTkBvNBMri7vWlEUk/QG
 51XWq5WP6MDJAb7XU6f5XoswjoIvU1kqXpjBa4Ny05Tg5eBH0duoMv2KS8JPEWq1O9Y7
 pvKs1XZxqOqA2OKb6lIVdSfnf80l3LhunVMJTzmNuo4i5yLGhPCjiEd3Zw/tAuiUdQjZ
 PJiA==
X-Gm-Message-State: AOAM5316gOtcZgIf5pqPmVkgr3qhUyST68v8VgeZ2YHMRWpnUUsbe/la
 O0Jp7Ok27AfrSYBWdChgv0rEAMAnG3kRzQ==
X-Google-Smtp-Source: ABdhPJz/uZaTycdPup5WihU61U0W24yOjq1reiZFWQ2LXMKTEnH6cRvM19OALlKvDkxCRWODx3g+tg==
X-Received: by 2002:ac8:5e4e:0:b0:2e2:2bad:47b1 with SMTP id
 i14-20020ac85e4e000000b002e22bad47b1mr2623955qtx.493.1649161625663; 
 Tue, 05 Apr 2022 05:27:05 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 k73-20020a37a14c000000b0067b316a4161sm8019491qke.120.2022.04.05.05.27.04
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 05:27:05 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id l14so10643194ybe.4
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 05:27:04 -0700 (PDT)
X-Received: by 2002:a25:d044:0:b0:63d:b49f:34ae with SMTP id
 h65-20020a25d044000000b0063db49f34aemr2399167ybg.546.1649161624663; Tue, 05
 Apr 2022 05:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 14:26:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
Message-ID: <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_052709_199916_09DBF67C 
X-CRM114-Status: GOOD (  23.80  )
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

Hi Niklas,

On Tue, Mar 8, 2022 at 2:30 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> According to the K210 Standalone SDK Programming guide:
> https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
>
> Section 15.4.3.3:
> SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> SPI3 supports: standard, dual and quad transfers (octal is not supported).
>
> In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> connected to the SPI flash.
>
> Update the device tree to specify the correct bus width.
>
> Tested on maix bit, maix dock and maixduino, which all have the same
> SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> would not make sense for this k210 board to be designed differently.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
> Changes since v1:
> -Add the new properties directly after spi-max-frequency for all DT board
>  files.

Thanks for your patch, which is now commit 6846d656106add3a ("riscv:
dts: canaan: Fix SPI3 bus width") in v5.18-rc1.

> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -203,6 +203,8 @@ flash@0 {
>                 compatible = "jedec,spi-nor";
>                 reg = <0>;
>                 spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
>                 m25p,fast-read;
>                 broken-flash-reset;
>         };

On MAiX BiT, I get:

    +spi spi1.0: setup: ignoring unsupported mode bits a00
     spi-nor spi1.0: gd25lq128d (16384 Kbytes)

Perhaps this depends on a not-yet-applied patch to add quad support
to the SPI driver?

Thanks!

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
