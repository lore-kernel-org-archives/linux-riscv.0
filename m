Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADBFC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5hsV67bULBAbGd98pY3taA1mP1IpYNeQxOoi3HIJXE=; b=JA8sg4fqQcNB2k
	46q/U3uczrn1Kjt0TZrCo4wOozG7OBjSqPRqmP0LadztQvmMf4yOxbXotvA5kgoCSElT7d5WpduxS
	6r0/5A5qTjnj1FwaIPV9V2qvicAb8cCrLHz29Kn7gHeUyINvQU1S9wkiTX5mN5nbAV5WE5p9720LJ
	0HEWOIzG+lExqU3M0HNdIs4mOrbyF0W5cdelrQUsDL79L9j+Uprvz2le+JHdNSaPwUdKHWiKqCAdX
	WqqDBNC0jL+gie8xLgyRlDIu3vFfJFcksMmYnbTBfvOpMycn8NKJDhDOncTtAANgd+WyfXhXul6mL
	zheoGC9ceyCmUo3Ntt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgEI-004QA0-Va; Mon, 15 Aug 2022 19:58:31 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgEF-004Q63-92
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:58:29 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-33365a01f29so1676567b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SaKpW6zKf3J+BDdw7lydmtNN4p2oq5j0Q5VFDNof+pM=;
        b=mClJbEgUZn7mid1IMN6JVxp3CUtP2f+GgqIus6vTR3wa/69syGLtTNMNumUfGQzXCp
         uRDUujND1uBLSov9tLJdTrhBNK4B/ta9oo+peGB6mwcb8/kM4OmseN8nDM9YLPfiHgSu
         RrtJxBtdwb6OC6Eu1qdUXMMnROTgoZ2W2e+6A3ATXr99NvzmM59FmVMYNT9KmeXOLaRD
         C2C/byWulXxqj0E4VMlC2YXPNO9aDoJf4mHM1cueQC2FLe14+lm/ePG6cQFQPmcSWlOY
         UKsBZAfBlelS45l7Cx7P5f2skan3K6PWshyYKKfIFbFtHx6ntkMKbYnO/pXNhZDRqzoe
         HI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SaKpW6zKf3J+BDdw7lydmtNN4p2oq5j0Q5VFDNof+pM=;
        b=z5NxqV5JO14S2Oh+kNrD+zb+hMYuGwUh1mDjYJT8vd3TRbP13b6o4ir1O+faWp9/y0
         XN44y5A5AbAya+QsyYIu+GhXDzWd+YKe7czJTyPYob0jNUkQugJVEtbyE4yAAPwXGqD6
         8Z0PW5AomDXZ2i4O9oEjv4vZ5VE2YcbbA9DWNv+nQyWggi+CgWwKVWTDk+mh4cZidgO+
         s/YB4SIMjYumBvbcLs/kt26PBgBz8D/mncCyHwsE9m8j2BEYPduW/ynjcikxLk9XpvlW
         Tt0e994RWhujHycTguoGk4dkf+BhoCCtuLg5JfDvJJe40ZsmSAAqRJNzor6IDG4DEj1I
         nJ3w==
X-Gm-Message-State: ACgBeo0YSjE197BRpehfXCALG8/IKz17BeQqg1R72c2RWzDYuGUnSdE/
	vy5tlqPqTpBhS1hq83soKQekpWKCKd+HmOumHkQ=
X-Google-Smtp-Source: AA6agR7YZhetSRriR3fxyVoEb45vvhBzsBWV2fXqw33tgHSOBo2R5O1+udwaFBShKA5Xahd/ARVynHtaGCyY7Ch4dU8=
X-Received: by 2002:a25:2245:0:b0:67b:7758:808b with SMTP id
 i66-20020a252245000000b0067b7758808bmr13450908ybi.279.1660593505118; Mon, 15
 Aug 2022 12:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <d9d0deef-92e1-05b4-a195-d2ca03801129@microchip.com>
In-Reply-To: <d9d0deef-92e1-05b4-a195-d2ca03801129@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Aug 2022 20:57:57 +0100
Message-ID: <CA+V-a8utT6UE=rc62LPE=UoU0DTJ2dDt7KO9UJ1vAG9r80E2pg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_125827_582371_FB65A72D 
X-CRM114-Status: GOOD (  26.85  )
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

Thank you for the review.

On Mon, Aug 15, 2022 at 8:10 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/08/2022 16:14, Lad Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> > (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> > of the Renesas drivers depend on this config option.
>
> Hey Lad,
>
> I think I said something similar on v1, but I said it again
> to Samuel today so I may as well repost here too:
> "I think this and patch 12/12 with the defconfig changes should be
patch 8/8.


> deferred until post LPC (which still leaves plenty of time for
> making the 6.1 merge window). We already have like 4 different
> approaches between the existing SOC_FOO symbols & two more when
> D1 stuff and the Renesas stuff is considered.
>
> Plan is to decide at LPC on one approach for what to do with
> Kconfig.socs & to me it seems like a good idea to do what's being
> done here - it's likely that further arm vendors will move and
> keeping the common symbols makes a lot of sense to me..."
>
Sure not a problem. But delaying patch 4 and 8 will make RZ/Five SoC
not buildable. Is that OK?

> Also, for the sake of my OCD could you pick either riscv or
> RISC-V and use it for the whole series? Pedantic I guess, but
> /shrug
>
Sorry did you mean I add riscv/RISC-V in the subject?

Cheers,
Prabhakar


> Thanks,
> Conor.
>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * No Change
> > ---
> >  arch/riscv/Kconfig.socs | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 69774bb362d6..91b7f38b77a8 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif # SOC_CANAAN
> >
> > +config ARCH_RENESAS
> > +       bool
> > +       select GPIOLIB
> > +       select PINCTRL
> > +       select SOC_BUS
> > +
> > +config SOC_RENESAS_RZFIVE
> > +       bool "Renesas RZ/Five SoC"
> > +       select ARCH_R9A07G043
> > +       select ARCH_RENESAS
> > +       select RESET_CONTROLLER
> > +       help
> > +         This enables support for Renesas RZ/Five SoC.
> > +
> >  endmenu # "SoC selection"
> > --
> > 2.25.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
