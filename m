Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4457C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgEtf98njHrHTFgkG7QwNs/S51ild1hnkCTDVBh5wy4=; b=vVzuGJZ87kaDSF
	6TC3pQ8qCh9epdEbUsA62GF3p4d/l7e0KE2gWfndEPfvpxnlL+oTVL0dmdc5+4NsRbvFqMU9GEobe
	31WaX7wh36V2X9WGAU6xrUlAXh4b/4thQkUqtFEmPG9gWUHdYPwrjIk3yBrebxJzmhq0SY3kqY30I
	lnmkkEB520u5LXTqi6hEEDmWynQ3Vqwiq7PjHfycNXvtQVXogF1WxLwaDs0AnN1p3Fr2/+z6r5eNQ
	OWfGWjYLkZZ72aaJXb5rLafTLyp5mNSh4e+YjxwoMr1ehkqf3j9SEMyBjCb2GNmhFzXyl2NOWTHl1
	WUczj8UZzCXkOAuSCpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt2ST-00292r-2M; Mon, 23 May 2022 07:26:29 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2SE-0028zX-At
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 07:26:24 +0000
Received: by mail-qt1-f171.google.com with SMTP id m13so6000732qtx.0
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 00:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2SMhNXRj0IsWiPhgFiLLDsimj0twoU0280Om0C+Jv0=;
 b=PcGmCK3IAB3UQWxL2Lb7XVjD2dMrBJTWK5OTjNcll/BAzTjF2zDtQ9tsGzZtfHwTm8
 UG+syAXQx4/QRI/ZYHVWiRrccgraSDm9DEhrKYNh/tTX+q1/muel468I9jyg5qDw1CoN
 a/6zGhIOl2hOWCteEUXsPiG14hGyK9zZCt375QUc6YDqKdYhNW5U/p1II9eFW4rUQy3p
 ohM3OkY/Sp9LTWw5tR/js4/9xjT2pdpvykYFDnJK2M1SJ88DAomnQUbob1UlB6DUCcjW
 OybV/EXnyN1kI2FPxscYfSzxDCYJ8ib5G9o0UXTAdBhb8BKasuTAAsNIGmdR+Riw5bpg
 DBRw==
X-Gm-Message-State: AOAM533q/jU00MI9rcrbp4yibPIBA9gHRUuLEO8hBPnUpuIGZjFFAjHv
 i+FaN6yDAlLSa4tGV8M/1tN5zkqAAt2Lmg==
X-Google-Smtp-Source: ABdhPJx3pA3I24clY876d4k3OxCSkot7aC6j8NDZlEtwRHEWNFO2oFOsulJ1dOVFKawHcNPlJZQY0w==
X-Received: by 2002:ac8:5dc9:0:b0:2f3:c1de:c0da with SMTP id
 e9-20020ac85dc9000000b002f3c1dec0damr15240540qtx.313.1653290719266; 
 Mon, 23 May 2022 00:25:19 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac8108b000000b002f39b99f6c3sm3916743qtj.93.2022.05.23.00.25.18
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 00:25:18 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p139so23807875ybc.11
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 00:25:18 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr20858877ybb.202.1653290718267; Mon, 23
 May 2022 00:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
 <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 09:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
Message-ID: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_002614_415831_145FE3A7 
X-CRM114-Status: GOOD (  23.96  )
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

Hi Bartosz,

On Sun, May 22, 2022 at 10:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.  Following this change the following warning is
> > now observed for the dwapb driver:
> >
> >     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> >
> > Fix this by making the irqchip in the dwapb driver immutable.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Against gpio/for-next.
> > Boot-tested on SiPEED MAiXBiT (Canaan K210).
> >
> > v2:
> >   - Factor out hwirq using preferred helper.

> I'll pick those patches up for the next cycle to let them spend some
> time in next.

"next cycle" = later PR for v5.19, I hope?
If the new warning will make it into v5.19-rc1 (commit 6c846d026d490b23
is in gpio/for-next), I think you should collect all fixes and make
sure they end up in v5.19, too.

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
