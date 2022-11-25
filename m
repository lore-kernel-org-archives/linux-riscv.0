Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC357C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X796JDyU9I2iwBTMQflYv2pp/OS7CuU6Yj3xNb4Pvgo=; b=3KUBllA/ctgofg
	B0P3mTibOMOLpdJZ35nk35wOpls8g/U5sayORHeh/n+G3+fMBMQfp1C8OwgRXl8J6inSVUtJTp2rb
	/K0wqaIfkWP9q21KxiBmOsDvgD6SIePXb7BLetnQyQb+uPD8NzpxA4UWtWQexkVNoAUgUBI6WiC/y
	9nvzZW5AInc3KOwNIo3mu5qArVe2N0fl0isIm2LWnEfxy39dvLT0sisxcKFQO/k+W2vjFwiPgGe3c
	xKLgZy4H5W90gSnGY8Lug2gNWpTdGLHIPCAgXn69BCVX3j8I0uUL0vDIxJQFdbhOkhNoTA+zHwcmt
	qSZ8u363m+anjr44H9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyW03-00FT96-Ge; Fri, 25 Nov 2022 10:32:03 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVfW-00FFbZ-2S
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:10:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id v8so5742165edi.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 02:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IUCM0LE2Qdll2KQhXqeTAiIGjjD6iG7iWRvqL9i1T/s=;
        b=Ns29kwRrHv7Ip/kcPlqzvmLf+DOhGJwpNWyUvTpOBGtbV5cZHzGhPvN0INYbebjz5O
         oX3sgyukJbtrz+blPsF3Cw/Tl87sIlhFOhnzvoXY0RtmuNnSXASazX4+3BDwUX1R9c/l
         Mc+73ig0zJjLkH5Ukr347y8q9SivewP+aGZDKM0A5JsYQtTOASMpS4EJq7yfPUC1SldM
         QSM6/zAlId8XGwAghhcBcz82f8SvpvEUN1/luNYYeA4jHR25lwDy1Jfkcn6x9tPRvZxN
         T/ppXxFKqwZTFvrqz1bhW1F88p5cW7jpwWyU4J/fc8FRFEY/xgI1NursXSuRyXMsh9/8
         Aj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUCM0LE2Qdll2KQhXqeTAiIGjjD6iG7iWRvqL9i1T/s=;
        b=wItGyPHUqcHtM75hSSZ8Poh5pzImFlHdfx0lZxxt9gEdqUT03l9B2rQoswc8+n+o3S
         eavHOtRr+TvdRXu4IV5r9AhXrVc5kwYNOsewcHcZLVvVngFXzpHYVYRGuc6JBtH7aY0K
         YxODCSPowxhfZzO2mRDTaLZTOI+i28u4bRzD8+dm1ugbhbvTLSXKnaQssyJdzcg0kbA4
         QwqHTgy6wVNQ2qHmPLy19OU93gheNtjy1qbjHslBu9xVGTpNu4/fMFdr8NtyPZzCSIUX
         sSVWl/swpTv6+0pRJwEcVUndT7pcR2gz0/t2wY7ALKv3xc9Gyr4xXQatM4+Wh1zlwYmX
         cmDQ==
X-Gm-Message-State: ANoB5pnWxTCMAddjYlFbPFf+PYV+b1r+Wbn2cX6eRr2zIwl91v6psKJj
	S98YUFoz7XdZ4O026G5wKgKcqwTzsExcSbOZTOA=
X-Google-Smtp-Source: AA0mqf74kk78BGZ9XqzWiJe0v91Q/kxGQ61MMser1Tuvs6dPAkMcXojiHnTRgz2VPD2O0Krfp5XnCHbHh8QBUvCIXNw=
X-Received: by 2002:a05:6402:f:b0:468:56c3:7c8 with SMTP id
 d15-20020a056402000f00b0046856c307c8mr34662608edu.109.1669371045850; Fri, 25
 Nov 2022 02:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJF2gTT7XEXmLWpP6nnSNRms9kj2NQR2dOA5N+V2UmnsurJogQ@mail.gmail.com>
In-Reply-To: <CAJF2gTT7XEXmLWpP6nnSNRms9kj2NQR2dOA5N+V2UmnsurJogQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 10:10:19 +0000
Message-ID: <CA+V-a8uA=U72Mq7Rqu09BoWRG0jNHXUK=C5VFq=jb0iHLjom5w@mail.gmail.com>
Subject: Re: [PATCH DO NOT REVIEW v4 4/7] riscv: errata: andes: Fix auipc-jalr
 addresses in patched alternatives
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_021050_152764_715AA8E4 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Guo,

On Fri, Nov 25, 2022 at 1:09 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Fri, Nov 25, 2022 at 1:22 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch is added just for building purpose, as patch [0] will export
> > this in its next version.
> >
> > https://patchwork.kernel.org/project/linux-riscv/patch/20221110164924.529386-6-heiko@sntech.de/
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note, as Heiko will be exporting riscv_alternative_fix_auipc_jalr() function
> > so that it can be used other erratas Ive just included for compilation.
> > ---
> >  arch/riscv/errata/andes/errata.c | 71 ++++++++++++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >
> > diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> > index ec3e052ca8c7..4061ad4983bc 100644
> > --- a/arch/riscv/errata/andes/errata.c
> > +++ b/arch/riscv/errata/andes/errata.c
> > @@ -13,9 +13,80 @@
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > +#include <asm/parse_asm.h>
> >  #include <asm/patch.h>
> > +#include <asm/sbi.h>
> >  #include <asm/vendorid_list.h>
> >
> > +/* Copy of Heiko's code from patch [0]
> > + * [0] https://patchwork.kernel.org/project/linux-riscv/patch/20221110164924.529386-6-heiko@sntech.de/
> Move it to commit-msg. No link in the code.
>
This patch is *not* to be merged and is just included for compilation
purposes only.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
