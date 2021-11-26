Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF07C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiHXNe/g4kGXnYnvUudEDzxhjwa6Q+WzAdEHsRtr1IU=; b=KGjKy51BtBJ2jf
	NkD2ThIK/8xlEUFiUdKAA1tOzQSBBfycbvQ2IBWcSD3cgaZD1HPTRp7VoUcgMGQDAaKGl9GJ2OoWo
	2nuIF0tqhCHQVEJvvhDXJe7qbY0fz7lBK3lpKBxYIn8fxxzdn2act5YDedlkMUXhDPBN5YCwqKOs5
	wmg8e976Ki0pR/iqslQDBLRj9rUjQpo+jRgLmjTla9rNEDt0JziJk5M5w+Xj2aolrm4zIeZ9PgGdG
	+Mrfoj5ef7rXP/H9ex4uhbXn1jBkBtrLS3f9CMBGlasWxPXqWuHKXhUGiYO+Gxyk6iB0m/68R/niK
	MT86EvnPnzi8JL3Pb2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXzL-009qKz-5M; Fri, 26 Nov 2021 09:57:51 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXzJ-009qJt-Dw
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:57:50 +0000
Received: by mail-ua1-f48.google.com with SMTP id o1so17480093uap.4
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bG6fgjmJbjSp2KNyv3Q+XgB3WUkmR4jABwA5ga+KCKI=;
 b=hZr0mXwui5VYjCouUKSSza5ocCAZ3qrLorpy52PlBgc7bKAfs4euDuWU73XHEMS51+
 g8ZYojIGDkxdvUxNbAc9+iOcTwZc5O2QLJUCfZAFGVfyT1mujEAF1oD5CvDYFqLNach/
 fD53fK+e18EwFAdDUwxmxK3x8CWDXvFUnYwvY+vxS5MaF9vj+rWmXkJc3sasYppqPrdN
 bnMPWK2XL1fMGdWVp+ptXN5bI4MToEvr3za+BrNIdEhswL6LWi7WkY9YldfEujHYTVGR
 7o6lBzF5CLDyibJj7U4sVhfG4PkXb63eAxSXgkU8HfrhcEgO0QVOxuly2pHBgXuJsF0B
 Ihyg==
X-Gm-Message-State: AOAM530K4lw83sTMhCAJBrZSvJygZohZl1BljScX5UF4EwU/SmCuXCzG
 csFPzJYdwwu7QiUoFNfpKtSb22+4CTBEVg==
X-Google-Smtp-Source: ABdhPJy7dFtVOBRWYsgqQkwbGOTX7AK5jfZXWBe2RFbl57coCx+epzkrrG8s30BBityTrDoO8ZvaYg==
X-Received: by 2002:a05:6102:5492:: with SMTP id
 bk18mr15971929vsb.18.1637920667647; 
 Fri, 26 Nov 2021 01:57:47 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id j15sm3331999vsp.8.2021.11.26.01.57.46
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:57:47 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id t13so17483494uad.9
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:57:46 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr16323718vsj.77.1637920666777; 
 Fri, 26 Nov 2021 01:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-4-geert@linux-m68k.org>
 <2d87b40e-9fdf-572a-a194-afc13fc20dba@canonical.com>
In-Reply-To: <2d87b40e-9fdf-572a-a194-afc13fc20dba@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 10:57:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9nqr4ke3eRK7s096EHAfZma++ssjo0jnomf1N7Vy_pw@mail.gmail.com>
Message-ID: <CAMuHMdU9nqr4ke3eRK7s096EHAfZma++ssjo0jnomf1N7Vy_pw@mail.gmail.com>
Subject: Re: [PATCH 3/9] riscv: dts: microchip: mpfs: Drop empty chosen node
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015749_490982_23287B69 
X-CRM114-Status: GOOD (  24.52  )
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

On Fri, Nov 26, 2021 at 10:53 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> > It does not make sense to have an (empty) chosen node in an SoC-specific
> > .dtsi, as chosen is meant for system-specific configuration.
> > It is already provided in microchip-mpfs-icicle-kit.dts anyway.
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > index c9f6d205d2ba1a5e..794da883acb19256 100644
> > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > @@ -9,9 +9,6 @@ / {
> >       model = "Microchip PolarFire SoC";
> >       compatible = "microchip,mpfs";
> >
> > -     chosen {
> > -     };
> > -
> >       cpus {
> >               #address-cells = <1>;
> >               #size-cells = <0>;
> >
>
> Maybe bootloader expects it? E.g. it looks for node and fills it and
> would fail if the node is missing?

Already present in board DTS.

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
