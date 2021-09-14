Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BB5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFFF610D1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FFFF610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqZ5/oAGhJ3dOVJyX8ixfPAyYqHH3y4JqXhAnnu7Ykw=; b=wRB6Oj91iHFY6s
	GzzV5+RBNF+jsNY4ta+BFIwwfCXXCYoVvaIV+9hx7r2Z/k0C+FH3Djb6Oq5uwSNGUfm6qh5eBHtbJ
	I9Qg2Ev4G2Cc1nmAQzu+qYKdLXx8CEISW6k1EQJzwJpG581QwvFJAYwVOgltYk5U1+U6HPjraPIHK
	diaMd4J7XEuMajhHlXMv9q9vH+Sv4ZMbZnapVG4KXbWAssviLOzk4JPqCUlqyaJr+BxC8q49tzz22
	fHxI6RvPnjZ4bHsKBC0Obv+i0a3E1cOIJLL4BfsnRLkOlTg63SUk3MezHs9uN5mmOZb+AG6mR5M12
	MR1RhVE9xwAZJ6tBArWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ850-005ooV-0J; Tue, 14 Sep 2021 13:02:30 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ84x-005onL-0q
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 13:02:28 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N7zW7-1mvhaN1PIx-0153Rm for <linux-riscv@lists.infradead.org>; Tue, 14 Sep
 2021 15:02:24 +0200
Received: by mail-wr1-f45.google.com with SMTP id d6so20067282wrc.11
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 06:02:23 -0700 (PDT)
X-Gm-Message-State: AOAM531/K4wHVqfdPvOH6UVaQlqJgVvuU3HZOCbEBKwIqy/lh40J6GJ7
 zEfY4v0JeGVZBezzbPwsTYq1Vr5OaiciO3b+boQ=
X-Google-Smtp-Source: ABdhPJwm95UM5Q7Av+R9PlqLuMxx0U/oJySlVgb5nUIOOX/MOzSR3VFTVEUXiHX+MRSB+HYEGrwSl61hIAHxwKNWp3I=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr18133610wrv.369.1631624543694; 
 Tue, 14 Sep 2021 06:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
 <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
 <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
 <20210914101327.47baun6mop3mc56j@gilmour>
 <c9b18cf8-d432-8636-52f5-a40a342135fe@kernel.org>
In-Reply-To: <c9b18cf8-d432-8636-52f5-a40a342135fe@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 15:02:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ZBfTN-u1xtQx3TTFnangdyXc7B8wMtr51Mr6+aXvodA@mail.gmail.com>
Message-ID: <CAK8P3a3ZBfTN-u1xtQx3TTFnangdyXc7B8wMtr51Mr6+aXvodA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Arnd Bergmann <arnd@arndb.de>,
 Guo Ren <guoren@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, 
 Chen-Yu Tsai <wens@csie.org>
X-Provags-ID: V03:K1:NjW3fz2pmXXo9XrGPPrb/rvEMFh5Jm654wwjC87bIwsVdYmJbt7
 5VL/JKJuotgvasc6JgCDz9mVi5X3oaXFCyCCZI18ttt7G8h85JP97gF2yPf2OI/SJhHginW
 uIFYlb/S7JHsOiJOaJ7YgshXxRKI7NK/YQjC5Ij9Wi9gGgGFZ7UzHqRhLs/tcaiw2p65fEs
 ni5XAV9DiAqsBvnk61k2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oyt6Ytu8DbM=:PhZaioxrZyVt1SaO+PAPI3
 Z0bAVC7OilQrCY8VSw7AQIuDi4h85TAVnXZqg7+2orK5qXmc4Jt/xkJkH6Q+UDCM3paiVA8g0
 EpLcqc2wClagwTXUvVNkylid8JWbj3wrRg9bMOXbedfDqa28q4+nHAlZ6YstmdwJUWyQClv6M
 uo8FmTivG14tXrrock+KwCdq2bzTi/pCKBzWOdDtUu8mVPl2zzsXtq5+m0EmhSQeuG983JD8/
 vBcM4YRDfnVElW7MziidDSLHoljuNA5msps1glwnTy3czl0cc2laKhbh7Zuw16c5MOdSSkoDq
 s/zsE13OZwnWdEvBFBpk1g2Yjg0+fp5+2WHHCJw6gxE00KM2jM4mhN5Fh8msVzVAyXcXuiG82
 PlOQ+4T5wQNCXqFClNw6uje7MFm+86/7yRWLtJjpnTFDpvfbx0rPTogu/8NtmIZOgq0sCQqKe
 QqpsJ/B4rjUY4mvTnee/4Q2iye5YfNriZWTFygAKzQifjkcp+gnygfQiUxlIMKXoM8qcmCLkD
 uiOPWqY9HYw91EodJGctgiLMjABJEWL7rWLAYj9AzYWbk9A0GU0MHrxNzrPufWBmrPKGQNDnx
 O4sNnhYPf/QBavSslxOthTXj7O1EiR4q7vndEPICoDYdeI7GM1NUz/+JZtGJccd1YmODDYFqR
 A4HoLtCOubgqEFW+CqPwH2tiKvWlgJa7m+i8US828/TQVGDpEC4sOiMsOBCcWYCotuAwfp56/
 sZwwOwebamCpvYjMp+WR8pu8r1uEQ3useYE0Ev9D7ZP3Q8mkBeR1hNin5fyE78HOVHUrCKzHW
 tsJIGzfdy4X64Z0O9HXt2nQU+QWsP6Nmz3+j5pss4ZfblKATQvcUdAVKvVHlqUGKhDJBfKg/J
 kePCGv3wy7RmpXkwAWZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_060227_406676_FA7D9C45 
X-CRM114-Status: GOOD (  20.66  )
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

On Tue, Sep 14, 2021 at 2:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 14/09/2021 12:13, Maxime Ripard wrote:
> > On Tue, Sep 14, 2021 at 12:07:08PM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, 14 Sept 2021 at 11:31, Arnd Bergmann <arnd@arndb.de> wrote:
> >>> Some subsystem maintainers want drivers to be selected by the SoC
> >>> option, this is why you need the 'select SIFIVE_PLIC', but usually
> >>> the drivers are selectable with a 'depends on ARCH_SUNXI ||
> >>> COMPILE_TEST' and enabled in the defconfig.
> >>
> >> I would say selecting drivers is even more useful for distros and
> >> other downstream users. Especially in the ARM world where we have so
> >> many different SoCs - how could a distro person know which driver is
> >> necessary, important or useful? Having all main SoC drivers enabled
> >> when ARCH_SUNXI=y, helps distro a lot.
> >
> > Imply, maybe, but select is far too painful for everyone else.
>
> If we talk about UART driver, then sure - imply makes sense. But if we
> talk about core SoC components necessary for boot (e.g. timers, clocks,
> pinctrl), then select is appropriate. There is no point to enable
> ARCH_XXX without these core components.

Please never use 'imply', this is functionally the same as 'default', just
the wrong way around, like the infamous 'comefrom' instruction
in programming languages ;-)

I still prefer using defaults and defconfig files over 'select', but I can
see the use of select in some cases, as long as the symbol you
are selecting is not already user visible.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
