Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32CFC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKLRVkuctPCJhfFQiXv124SAFoRIG3AdAr3ePt/mjOI=; b=sT+hn+8kvsRsei
	55BnZQdQ0pNgKCWpFCIZOyLTITH5BfpjOtsGaNZV9Uwxx8AbHItPeHRwu5EhvLcbkj8EX4Z+lrPS/
	avVN1ZcbkamxQ/t0ctDz7mAwLQqw0ccZN4mX+tHjc1Us8rRXeJVI3aCnSax77m/8mWNqZVPhbERI1
	uGvVqbrfet/kw23MDu7RM73QvUU70WMFtjQqh2RMV+np/CvVW/HSOAQkeme2ku2H7v1U8wuZstoWE
	hBEW2gphqqYZ1oYwnJ2sCwUq2RUTA/Li1kAYBezhUnx5ac0vSSR/3TXCQ81Rd7QdL0QFx/Zr2felz
	m3rnvFBQoXvQG3KSNOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOlR-006KWZ-9C; Tue, 22 Nov 2022 08:36:21 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOlB-006KGy-9u
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:36:09 +0000
Received: by mail-qt1-f177.google.com with SMTP id s4so8841058qtx.6
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgNBnKnuaAgo6BU83g4n66j6PnV7djusCUnR2i+Psk8=;
        b=gRjoExr9BQeXRCS88+Zvd058h1KIprm5djtMD1+a4cem0q6U7ybXDR1iQCFMxs5+fD
         7OgVR2jEdJsO7aRQhGrh28jp5acc50Zxn2NsRotjT3obzwSrPV9mZL2i3KgBf+F8qaSZ
         RcrWwqpHymWNaVd2AfQXsvYr82w89pUF6UL7dI3Ddcxrh7ZHD5p/Y9JxYljLsyvVIRVh
         LeT5sD/Ag/GgusASJWWFBF9xJVrE2XGqNDgLsgCkFtV/4s8aI7IqY26Q/6kY6m8jiV/+
         LBGb223K9IJ/AKeDds1qcUE1IrjopwKFTb6tbyq32cEcDBY+ubJ4ZRVIp/OmlZlRQ5+j
         GJ/g==
X-Gm-Message-State: ANoB5pkFv/m8JdKr+xtMnxPI57xdwLVfe7uJwuvc195pdPPBxHwgojci
	Z2N2NVZ/zta8L6Wc8SRwO1H7+o/5u83YVg==
X-Google-Smtp-Source: AA0mqf5pV2exswSeNHiFwOZHoTgMLhGZrwed1fpOAZfKRgHNCg8Qz3ZvHja3p3SoewxSnhFFeXRB6A==
X-Received: by 2002:ac8:5504:0:b0:3a6:4672:177e with SMTP id j4-20020ac85504000000b003a64672177emr8297108qtq.335.1669106162877;
        Tue, 22 Nov 2022 00:36:02 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id dm50-20020a05620a1d7200b006fb7f94a65bsm9816066qkb.44.2022.11.22.00.36.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:36:02 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-398cff43344so87687637b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:36:01 -0800 (PST)
X-Received: by 2002:a0d:dc87:0:b0:370:61f5:b19e with SMTP id
 f129-20020a0ddc87000000b0037061f5b19emr20120960ywe.316.1669106161174; Tue, 22
 Nov 2022 00:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20221121221414.109965-1-conor@kernel.org> <20221121221414.109965-6-conor@kernel.org>
In-Reply-To: <20221121221414.109965-6-conor@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Nov 2022 09:35:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+jcxJ3owbxtSk9KLjtLeG1g29A8SFdH-F9PQ56-7oAg@mail.gmail.com>
Message-ID: <CAMuHMdX+jcxJ3owbxtSk9KLjtLeG1g29A8SFdH-F9PQ56-7oAg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] RISC-V: stop selecting the PolarFire SoC clock driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003605_432760_119BF49A 
X-CRM114-Status: GOOD (  20.56  )
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

Hi Conor,

Thanks for your patch!

On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The driver is now enabled by default if SOC_MICROCHIP_POLARFIRE so
> there is no longer a need to select it in Kconfig.socs

Where is it enabled by default?
I cannot seem to find that location...

>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -5,7 +5,6 @@ config ARCH_MICROCHIP_POLARFIRE
>
>  config SOC_MICROCHIP_POLARFIRE
>         bool "Microchip PolarFire SoCs"
> -       select MCHP_CLK_MPFS
>         help
>           This enables support for Microchip PolarFire SoC platforms.

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
