Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A863C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Yp2TNDd0h8DHZ0h2bLTQRtkWLVJ+gHOjcZawIJl3rA=; b=eaXy4EdmJ7xwvO
	MExiQWf/EhcFwpWzEca1oAdzjTLDRqtuLiVg68Lg+xkNv1c3LmApApt1RDNQdKs5YXblwZ7NDhruC
	4ZVHiP1NOPE82AGlclpneGGon9sPNqUrzKIvdhaLSVZ5yY9YTyi5c0agfHN6Sqm70sIdyLaxPEw15
	6RLfy6k3nSansS/zxIqqYJ2e1CP9o8BYn/0srX2Uq/qp97tc2VAk6abWoGNSYtYwxL751Ig/BeDws
	7TrFkl8+Ba3NMr9GxfAFID9N8ohPgP4MTHX9j3hUA9Z7hkg7bMSGLgiGF7GeJeY4DmDKgpEOdEHe/
	7VLJcyOXnWfoOvwEsu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntDET-005cIj-6G; Mon, 23 May 2022 18:56:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntDEQ-005cGP-Dw
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 18:56:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id rs12so19009317ejb.13
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tifE5bLnfHULjuXzdKXlmgh+yYdYzL6ft6zuAUxHcg=;
 b=BbaCu16gsjt26dSAL88WDw2c2uoZsyZk863ptFfWyzXJ5b5CFHDeaY9s26kf41Lq8O
 EhF5L3KPdXX9aFAP1GmTWwwuEmWXLiRH87BY7Ip1+fqM+7ATMOl9nJD2O1CJYhQRgqWk
 OlE9JbosTY98LFAk3zexxQ/Xo0d6513GLb0MUVV8KCAev0jjJg9jD78MEfK4+Mmbo0B7
 TBXMJBYJDxBzV8DAoGhA3V2NSoxBCtdWGshSDpreFTEGqwDvkFsHAGTSC9NhUdc69BLi
 G/PfJruUboOrZ2uZotTPjyRNj8E2EwoZZtDuW3jvxUIpN60NXuKHTf50xc6XRlR8C3Om
 Dyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tifE5bLnfHULjuXzdKXlmgh+yYdYzL6ft6zuAUxHcg=;
 b=CKMXYRkb2/MxpJBAJFXE5B7xf66jVTRb94jCO73mM0mbzHZ5P9187xvOXeLPZy31Mu
 aOB/oT6jqoDNAm58puOUqKhiI+bYhKKlUgfy3DS3UPggi+fonqJ8rBNFjoSWslIpPLUa
 ZN9V9NRk7KMKGMksBcHiR67b0a1POnG0x3FMcRQmh088CaR1ielQg2QuBJZSt/lb8QPD
 Wh2PuOMKg8R9Px9MJ70cdjHG6KLIR+6VvLJLsJT2BYYFp7kDaVodnbsi1zqqymngZWYi
 m00HzYM7q3NeXr38/NDFa93ERRT7ckGMgGCfE3hxd0z3xXiIsYjdN4jE7H4fdoqp02HX
 oHfQ==
X-Gm-Message-State: AOAM531JVaNZbBSC3NG6mutRzyKTK/4repvXxSvkSF0gMBanBeFYMsF6
 lQcAqtSYvYWyx562OZ0Fi5hHIMkI2dB8400Q9pfbog==
X-Google-Smtp-Source: ABdhPJwEKQpKbBK2FLsmHHKUY1mYHfr68FuqP8Z2vt9DwnDi5qqzNZIfQfCdriAzhT3uxbP6JRx5flatG3DhTad3ChM=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr20485108ejc.101.1653332199212; Mon, 23
 May 2022 11:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
 <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
 <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
In-Reply-To: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 May 2022 20:56:28 +0200
Message-ID: <CAMRc=MfVahrfyaJUwbJZP8XeQYFz9jas5ASaqp3iXCo3NW4bxA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_115642_699976_FA134EBB 
X-CRM114-Status: GOOD (  18.93  )
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

On Mon, May 23, 2022 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Sun, May 22, 2022 at 10:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > > immutable") added a warning to indicate if the gpiolib is altering the
> > > internals of irqchips.  Following this change the following warning is
> > > now observed for the dwapb driver:
> > >
> > >     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> > >
> > > Fix this by making the irqchip in the dwapb driver immutable.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Against gpio/for-next.
> > > Boot-tested on SiPEED MAiXBiT (Canaan K210).
> > >
> > > v2:
> > >   - Factor out hwirq using preferred helper.
>
> > I'll pick those patches up for the next cycle to let them spend some
> > time in next.
>
> "next cycle" = later PR for v5.19, I hope?
> If the new warning will make it into v5.19-rc1 (commit 6c846d026d490b23
> is in gpio/for-next), I think you should collect all fixes and make
> sure they end up in v5.19, too.
>

Ah you're right, sorry, yeah I will pick those up now.

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
