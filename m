Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66082C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLnwMQfeDmcZLjmYFTU+oOb6berb/Y9nzHng1GI0UvE=; b=4uBHkjucj9uj5x
	p6S0PBzj45JlStb0ZaGzuNvlDruMn4U/zhkHp522sBYQMNuiBUGpQjk0zJqMhedDmL2cnJO18X4kj
	mZXka+mie30Oa+a6XJLKr//0FPK9Dv9wfBnxjO8zvNbt7W/NhIybpB2HoMlMtd4pLTpceQGwc/KBo
	VpYSImFocA/4KnomIfU3QTvFLrjbwAzJupZta9T3Iabstg4wq/ToP9vFtfs58qVjScRlZC0+ll6t0
	kMgjV4M7KIUsZZ2+hMwwuLqz3t7wEbXZ35ZOnyXftTPJ9xsJ0OZAbsYpZr7O9TunwYkM4/37L2LBd
	/cAI8jaAaPHxrYMhedLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcqI-008qwB-1I; Tue, 04 Oct 2022 07:59:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcqE-008quI-FT
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 07:59:52 +0000
Received: by mail-ej1-x631.google.com with SMTP id b2so27120398eja.6
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VeMEKABc3TtQILBjNAJQ+M6awy0IySm+oQwftWHEreI=;
        b=g+OnsE5yeTe/tK/ketaT7bh+9Vr20MGUX+hbOcbZSlojs35kAWPBJN8LE/c2bF/9bc
         looShX/tKDdWMyAaeD7hRI97YzfpkiDAmKlC/Ql8I+d2dkpSiAehAXZUvF8ft10c1jer
         8KnA+jOyt7FoW4pOrtcqYKK5y5ULYfTIB5azGT/r36CZQ8QqML0PBnXFcNQ4Y1MZVObU
         FuKk6vAFEBB33/N7JzCtZ7tnEj2kFHjNe8nWRrfCBGqebFv49psJ5tq/G8U8IiYUSjQJ
         LWXEOQIkaeKScnHQBM2ey4PZqa9yid4CTWMvEjjLsMtkmpVzG/Kah8HbsFU8ccWM07TN
         tvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VeMEKABc3TtQILBjNAJQ+M6awy0IySm+oQwftWHEreI=;
        b=y/g1xaJTphZ/oOeCSJR/N3jwDTttKGvt9vYN36V7J251cP8Lplnoa8dsV+Rclv3qS2
         mPu3phjT0FyTUIvgm+T1xun+NErJDUK5FbbAFEjh4kErrbFxn3eSBdnbYb2NQBG9AZtR
         UJHJgx3GncNFUnCjgwUrpVfJDEP8imgT8Gugu7EsYEhetDj2FJqZjK93JAc62SR+Cfmg
         /YC8zrTfvDPRou5U1tno8PGf29vO/oHZYH4DUkoMZWYM0SCPi3wbKsOLtTf2juSLMvJ3
         +2ryFrCDamqmDypOhMeQXNlD579+bs8owhz3/7JxU9FhIdY3lg2etJDPLvdhYuMh2Fn8
         MfNw==
X-Gm-Message-State: ACrzQf0A5QR4MGl9O4weKZKOzBK6+q+RkvB73KJKh5u8QJdcbifrhgLS
	cM4XcEe1SKikhXaTJCBip+hkDHS4Ev2d4bJr8cw=
X-Google-Smtp-Source: AMsMyM5/zTBC84CIeJBis9zUHCHVy3BvddGdj29NigpREEoHIg97rBxi9HBysvUfSAXHYtOWzSsmRFJa07GV++Z9AwA=
X-Received: by 2002:a17:906:591:b0:73d:c3ef:84ae with SMTP id
 17-20020a170906059100b0073dc3ef84aemr18491993ejn.155.1664870388235; Tue, 04
 Oct 2022 00:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
 <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com> <YzvhaxuZbeCwLZ5m@wendy>
In-Reply-To: <YzvhaxuZbeCwLZ5m@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Oct 2022 08:59:19 +0100
Message-ID: <CA+V-a8uYwm+Z4=3beNZE7q3mG7S3uKdEagY2c-KStD0thyw6Gw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache:
 Add DT binding documentation for L2 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_005950_806342_A360F51C 
X-CRM114-Status: GOOD (  26.62  )
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

On Tue, Oct 4, 2022 at 8:32 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Oct 04, 2022 at 08:26:01AM +0100, Lad, Prabhakar wrote:
> > Hi Geert,
> >
> > Thank you for the review.
> >
> > On Tue, Oct 4, 2022 at 7:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > > >
> > > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > > describes the L2 cache block.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> > >
> > > Not andestech,ax45mp-cache.yaml?
> > >
> > I wasn't sure as we were including this in soc/renesas so named it as
> > r9a07g043f-l2-cache.yaml if there are no issues I'll rename it
> > andestech,ax45mp-cache.yaml.
>
> I may be guilty of suggesting soc/renesas in the first place, but should
> this maybe be in soc/andestech? I have no skin in the game, so at the
> end of the day it doesnt matter to me, but I would imagine that you're
> not going to be the only users of this l2 cache? Or is it a case of "we
> will deal with future users when said future users arrive"? But either
> way, naming it after the less specific compatible makes more sense to
> me.
>
As there aren't any Andestech SoCs upstream, I am in favour of keeping
in soc/renesas for maintenance. If in future there comes a new soc
from Andestech (which will go into soc/andestech) we will have to
split the maintenance work.
But anyway if there will be any users of L2 cache we could always
provide a config option which can be used by other SoCs.

Said that I'll let Geert decide on this.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
