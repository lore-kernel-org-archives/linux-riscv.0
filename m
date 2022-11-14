Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E70DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGm9aK9EjK2OrDNp4FF6ULGcPMJ4Bm6GUJrJ2z/xl/8=; b=uLHdp/uY/HF3Wl
	8gdY/6tjCEwlCR36qcFDms6RxPoGxwX2xiXhVwiXoSbsDDTJ4+021W57uUvKHXcQgd/NgxDMbUb8n
	TtiJYCC12QuI2eLi5cXJGL6sCZd2sWJuy7KvJvN4UgvED9f71ZMmw4qz3Cn3ki1XABgWQobvdSCj0
	ao3mNWa4M2BCW9qu2HZOK6TPB3AXhZxN5lGoD5bStG9G7xtfFO3yiQWpvTRXItCv3pKdaLryhkzgT
	3UxAPbr35nFrwlKDlp4iIsb8OYJo6RVWkPSvGgeGuxc1XGepm0pxT+0NN2oTdpO7I0F7Rxu9KkuNF
	NRW6k4ZPryk4p8uu2Ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXnk-000RqC-6j; Mon, 14 Nov 2022 11:38:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXnh-000RlY-4Z
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 11:38:55 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 01DA8423C8
	for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668425916;
	bh=OydMge7gtdIE4je9y2DWMSPhyZqkUqzhn2d2qUrlkVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fIZNYUrEMRt/eXUOhHIYXolZB1Jk1Xg0bI/nui4wknojlM+TjCamMU1PuLpW/TVT2
	 HzGwssbT+9QhTKuKx0GcMuY1pmSKID/QtXsvujBJ9bGuQo0EWTBz+pE8Peo5uWwNe+
	 bABPDT7Z+0Lyk9WqTI8ZNdm0gUn0t9C4bBjrOaTfclOnf9NqnyZYNafLiL7Yd1CC82
	 rt338+xbYyobItLe+JQeP11KchHtKoMubEcwnuuBAMG9BIjnPl4ePm+Vy746WYI2Xk
	 qxEp2x6As+kJLAHqXAtEbrr/kqundZz4lNdRSgxSt6WC/Sb7vU+3RrL/5JTXhWSM/Z
	 k3sgU7JfgVEkw==
Received: by mail-yb1-f197.google.com with SMTP id b17-20020a25b851000000b006e32b877068so547513ybm.16
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 03:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OydMge7gtdIE4je9y2DWMSPhyZqkUqzhn2d2qUrlkVo=;
        b=7rUwjMOMC31o+yaA0oY5MTn3hVhx6bpeSlBe9ivJko1yYK2YTzex7xfvogUrTvNYDL
         9/5mK4tClCJbe+R+mJ76q+NOsi9g9vh8Dpz/mTGG+gCmbB6Ss0ctdd6JHp4mWdyEwI5V
         GIBL+pok/zdwJ3J7qmgyamA4MJjTUirzqjN1HD1B8DgWjgwXqmacPbk30J/+luZI1CbC
         A3b7KfusSFVPYgeRd2wBLsj9Jl+tlljzKj2NNuO5YYxaPr6qxulFOwvcqaNIvpgOvO/+
         XeHUsnR36GyfilstH5D23/VeFKNYXTGI0MoYhVcuJtvGmNeCC3tAx4sFVQ8fO6gqkf3E
         9JJw==
X-Gm-Message-State: ANoB5pk2ikNEd7toe+YWsr25/zunEbIPYgWGRQkNNrt2LSOqX/Gt6Jr0
	ui/ta8BmDoLBE8nWne8FIfxvv8A/ZTKtXEY9ZgXx7WB8AW/CM86VAc4g8J+RnDoMgzpbRlY29dU
	OCNidMeqmYMUkoFvu+84qwvyHm8y7ztEG4c60/iDUSE8IP8CtERj0b5IGXqhjDA==
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id 83-20020a810556000000b003785e3a8fadmr12450112ywf.78.1668425914452;
        Mon, 14 Nov 2022 03:38:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6L9mlzJuF+4ajrjjasX5OxkT3zApkEGykXisk+djB1Nw9RrvY1XIhkkZfvgeCt+XXOQ4LQv/dZX4JCRuVeKlM=
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id
 83-20020a810556000000b003785e3a8fadmr12450100ywf.78.1668425914288; Mon, 14
 Nov 2022 03:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de>
 <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com> <20221114113553.3dxrumhk72jouzek@kamzik>
In-Reply-To: <20221114113553.3dxrumhk72jouzek@kamzik>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 14 Nov 2022 12:38:17 +0100
Message-ID: <CAJM55Z_oZNnGu-TqK4gsHGF4=5A5607dRANJrLuFy5pPfuh8vA@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, 
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_033853_507000_925B35DC 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, 14 Nov 2022 at 12:35, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Nov 14, 2022 at 11:57:29AM +0100, Emil Renner Berthing wrote:
> > On Thu, 10 Nov 2022 at 17:50, Heiko Stuebner <heiko@sntech.de> wrote:
> ...
> > > @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >                 }
> > >
> > >                 tmp = (1U << alt->errata_id);
> > > -               if (cpu_req_feature & tmp)
> > > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > +               if (cpu_req_feature & tmp) {
> > > +                       /* do the basic patching */
> > > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> > > +                                         alt->alt_len);
> > > +
> > > +                       riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > > +                                                        alt->alt_len,
> > > +                                                        alt->old_ptr - alt->alt_ptr);
> >
> > Here you're casting a void pointer to an instruction to an unsigned
> > int pointer, but since we enable compressed instructions this may
> > result in an unaligned pointer. Using this pointer will work, but may
> > be slow. Eg. fault to m-mode to be patched up. We already do that in
> > other places in the arch/riscv, but I'd prefer not to add new
> > instances of this.
>
> Alternative instruction sequences (old and new) have compression disabled.

I see, but if the instructions before the alternative sequence ends on
an unaligned address will there be inserted 16bit NOPs to make sure
the alternative sequence will be aligned?

> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
