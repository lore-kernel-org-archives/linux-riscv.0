Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81A5C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CrWeGK/0kWGF+IQs/tR6E67i/Mh8Sw9Rt1VjijmlQ8=; b=ctwfGh/U3sdgZh
	BE0CZXPabe4GI2IT79y5z3Rq/Fax97U0D1E9JsL8BwsgESQzuCBTxqAePTrSMrshy4wsw5yJ0TI7q
	ZVVDfHKEYw72II2eqYcdXcmy3pNzH5eL6P4TWPaVEe+XLIpVAbsFT4y4qg2J/Vp3Jfvoi8z2xVcWe
	HkQR09fmObDKR/+RQeJ4z+nYaBJ2E8H39IVHsf4GMSuWYxYryOCo/gAUZHW2Rnas3nUt1Emim/Vh3
	u1yLeGW1P/uM3GiRpfkyLwj7+jZ6AI3Uu1uNmFxibh3LjXTuW10/k2pfC0JAxljzMZu2QH1Owi+Pa
	GI8VojoVEfggIVx9DyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osoDJ-00FAVO-Bq; Wed, 09 Nov 2022 16:46:09 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osoD8-00FAOq-2z; Wed, 09 Nov 2022 16:45:59 +0000
Received: by mail-qk1-f182.google.com with SMTP id z30so11237657qkz.13;
        Wed, 09 Nov 2022 08:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ews1zWN1f/PR7HGzfMn+lenNKSw7QezbzurfTC9dGEg=;
        b=j2v+Mf3ga5e3erGWv0GLhgmjkyXz36nbvkHd260R/aNK//yISxsXTTJ7soN6TGk3jQ
         v1+Ob2HiZhA5T8yawRw9kalSdkc2gsmJsmT6C+Epi3VeArXm9+XXMvkUp7ONO7ZVv4f5
         t3UTmgvpoMm2DN78M4E1lHR5l68tsi/T6ey0mV5tI+EobfpCiJsrk+RpZjJeNJPFGtu4
         TrYdlUxX3+J5WKWvoRGRRRB3cgdeZCFMeyql/G5HlR8b6jjQ0cql5Cf05giOeb7BaTYI
         uh3/HEaLJgBkMLXPW3/z0yHu/qrAJfWoBroGuRk/kLjmVtxWU2BHLqtsL3iHToVFwVg7
         j5Xg==
X-Gm-Message-State: ACrzQf3Ggdzdz4Xao+6yBgE7NF4R1tWja/GcPVlfd72Vo2UPIu6in3BF
	6rHCr/yidJKbdCE9XcKY9f1RHB2G1MuPuw==
X-Google-Smtp-Source: AMsMyM7zo8SH/wX4FKT0q31mRnOygIMeCcp2ct6Y+SdemYBSkumx/H2O+7ua9q6Uf2YudWjcnFLl3g==
X-Received: by 2002:a05:620a:30e:b0:6fa:65bb:cc23 with SMTP id s14-20020a05620a030e00b006fa65bbcc23mr27109518qkm.558.1668012355103;
        Wed, 09 Nov 2022 08:45:55 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id bv17-20020a05622a0a1100b00342f8d4d0basm10021227qtb.43.2022.11.09.08.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 08:45:54 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-369426664f9so167104657b3.12;
        Wed, 09 Nov 2022 08:45:54 -0800 (PST)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr40745720ybs.380.1668012343710; Wed, 09
 Nov 2022 08:45:43 -0800 (PST)
MIME-Version: 1.0
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz> <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <87187c52-ae48-130b-6479-ae1023915bc1@suse.cz> <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
In-Reply-To: <20221109155008.GC307514@darkstar.musicnaut.iki.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Nov 2022 17:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXY7z+BXjM1KNVF9AKw0n28Fe-8TDbRC=WKXZf09h6G+w@mail.gmail.com>
Message-ID: <CAMuHMdXY7z+BXjM1KNVF9AKw0n28Fe-8TDbRC=WKXZf09h6G+w@mail.gmail.com>
Subject: Re: Deprecating and removing SLOB
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Vlastimil Babka <vbabka@suse.cz>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Pekka Enberg <penberg@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Rustam Kovhaev <rkovhaev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Josh Triplett <josh@joshtriplett.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, openrisc@lists.librecores.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_084558_177463_1E8D85C5 
X-CRM114-Status: GOOD (  31.24  )
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

On Wed, Nov 9, 2022 at 4:53 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Wed, Nov 09, 2022 at 10:00:25AM +0100, Vlastimil Babka wrote:
> > > On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> > >> I believe SLOB can be removed because:
> > >>
> > >> - AFAIK nobody really uses it? It strives for minimal memory footprint
> > >> by putting all objects together, which has its CPU performance costs
> > >> (locking, lack of percpu caching, searching for free space...). I'm not
> > >> aware of any "tiny linux" deployment that opts for this. For example,
> > >> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
> > >> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
> > >> SLOB impact is too much for those who tried. Googling for
> > >> "CONFIG_SLOB=y" yielded nothing useful.
> > >
> > > I am all for removing SLOB.
> > >
> > > There are some devices with configs where SLOB is enabled by default.
> > > Perhaps, the owners/maintainers of those devices/configs should be
> > > included into this thread:
>
> [...]
>
> > > arch/arm/configs/omap1_defconfig:CONFIG_SLOB=y
>
> I have been using SLUB on my OMAP1 boards with 32 MB RAM, because of
> better debugging features and the memory footprint difference doesn't
> really matter for my use cases. Looking at history why SLOB was added
> there, it seems it came from 6cfce27c14aa ("omap1: Add omap1_defconfig")
> when separate boards configs were merged, and SX1 board happened to have
> SLOB in there. This board is nowadays only used in QEMU anyway.
>
> There are OMAP1 boards with only 16 MB, but support for those boards
> will be removed. So from OMAP1 side, I don't think there is any real
> need for SLOB anymore.

Interestingly, the m68k defconfigs use either SLAB, or the default (SLUB).
So the poor old m68k machines (many of which have less than 32 MiB)
seem to do fine without SLOB...

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
