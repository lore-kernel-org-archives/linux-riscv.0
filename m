Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4FDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/olUKmXok13+xNJBaIEhlb7FCQu5HYSrg6ZLCHNe7LI=; b=MvTRSzaP/k9h9X
	Ktph0zEFi24CYGPnpyj5CVVz286b+bXNUSlJ/LXvp8DHIajJ987uMICtKkqVDglA21inTvdTCCv+4
	Yy/Br6A/7gLmWuygTMB0oxzveWGtrohE7vjYIL2HCX7U7kMSJwwh8gxdeGv4y6LnKcOKytIPa5T9Y
	Qe3ODqq+bSxZG3OW6+4D8hb9VjCP1mV/uhailLrRUIIUMqbrDdFgBoQCTPDlm6G8z5UngSFOlkiVx
	Fvjs3UMVxH8uAZI7hlL0aflY1N0wtEUVfpblzJ5qT9vREa39+6JynrCVfTIiDz3jKfGc7J9KjD2DP
	627yZrb8XVfoKUkzGDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Z9-00DhIv-AS; Tue, 15 Nov 2022 18:21:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Z5-00DhGI-Tt
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 18:21:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id m22so38102644eji.10
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 10:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=loW6rE2gGS02TW4sdv28/5PXvnJnn8jUaLXyFyxIBBw=;
        b=LA828D6tRnlkCLYZPkPlTBKFXEVeuzcoHeggCmhBc0leuImIicTgjH/A+lsrxXyCRm
         xggvxWALf8U2q+BIWkcePsNbOyPLCnsPSmxrl6gAkDEAueKu7pk/hNz65g8gavkoeqhi
         4VmODbsp98AehsvEizh8jJYMJVBzEj5Hc/alM4l3u114Pow4tjXx3lpnV5ZDEpT1nala
         6pvwxu7T/QPMRcmyomJJAbSt5Y7mclWTorwM0nzDHjaSKjR+9xgjICe3RULoEN/3bsLr
         MRnSGTNQ3h1fBnI4l/gCoOxwkzCMsLWDMNdmI5rLTXycIdi4bW0U5rwcaei703u8i0ME
         Jb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loW6rE2gGS02TW4sdv28/5PXvnJnn8jUaLXyFyxIBBw=;
        b=BfCV/pZuBQpPJ6BsGPdrBrGrXiCZMbBCa9TM0BHFZTfKsb/dWZdeR0xwKCvtzxy6xm
         nuk9IWRe0XFfu4eOPV6Iy0S6l+/nKfhbY000J40CkFTyqy0h3lF23bAu+6ChylyniIkw
         cbMixJXpJCKv9+sUxTZS1rBN78m+NEVOE74mT73Uc2pLqZYq7Og08MOXe3sov35KM4BH
         CmvQXRkWosx4CvNhJCyzzm4EAbASAIHTVpOfkqs20o8YPXKzCnALDFJBJcVww+WNP0kg
         lRwcfy/4a4MWl/G9fq/uy0ABvvbBzI48N9TSMJ7MYMSQbfCXGb6nnGQ1sfeMnomUPPX4
         1Q6w==
X-Gm-Message-State: ANoB5pmFvtG8xnxM6dlIA+UJET+rUO1eSrXDB14UavWBdY3Vi+sJxaVl
	xkradNmJB2tGrp90FxbSyDrKPBZ9uiwfwa4PKvE=
X-Google-Smtp-Source: AA0mqf6JCfjVF2CWf2wVuu3vn+PsZPYxNJ572dgDVuVXioqlruUP16R3Ykd7ViMw5b+tNOY1knzEH1M29bCy/oc7+38=
X-Received: by 2002:a17:906:4e42:b0:781:e568:294f with SMTP id
 g2-20020a1709064e4200b00781e568294fmr15100953ejw.447.1668536500767; Tue, 15
 Nov 2022 10:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y3OgSAnst0qt5WSk@wendy>
In-Reply-To: <Y3OgSAnst0qt5WSk@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Nov 2022 18:21:14 +0000
Message-ID: <CA+V-a8vL5r-xMeCiYRax-dM2Uo0ghgzRiyY99nNn089CjJwoBg@mail.gmail.com>
Subject: Re: [PATCH 0/3] RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_102144_001017_70682C36 
X-CRM114-Status: GOOD (  19.40  )
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

On Tue, Nov 15, 2022 at 2:21 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Nov 15, 2022 at 10:51:32AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to enable support for below blocks
> > on RZ/Five SoC/SMARC EVK:
> > - ADC
> > - CANFD
> > - I2C
> > - OPP
> > - Thermal Zones
> > - TSU
> >
> > Note, patches apply on top of [0].
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.2
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (3):
> >   riscv: Kconfig: Enable cpufreq kconfig menu
> >   riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable
> >     ADC/OPP/Thermal Zones/TSU
> >   riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C
>
> I know ~nothing about your SoC so idk if the values are correct, but I
> did give it a go earlier to see if it did anything warning wise. Seeing
> that it didn't cause any I am curious - how come these didn't land in
> the original dts? Just waiting for driver stuff to land to support it?
>
I wanted bare minimal stuff in the initial patchset.

> Anyway, no new warnings which is what I care about - I suppose that
> makes it an acked-by?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Can include that tag if you like. Either way, nice to see some of the
> /delete-node/s etc being removed.
>
Thanks, Geert should pick the tag while picking the DTS/I patches.

For the Kconfig patch it needs to go via the RISCV tree or can that be
picked by Geert too with the rest of the other patches?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
