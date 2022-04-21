Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K641t6z77KjmRSRP025HaMvLgbDCV9n6WO6ZAeP+Rmk=; b=F04NO9XoxwgjfX
	ho9PIFxMHmKHmTuUwmjCJ3p5kveeZ1H/KRXDzLpt9MLTA5hyAzPh2y/19Ac6LF8ab9Zttfg1JWCv7
	1PpVaJ9HU4YHPBrW2xBsZGZ153EuXcClNGKyhZYH5uXJsdXlApCZHWZGOi2lyOgeRgtzFA3J5YxjV
	gLojJnpbd42pcpG3lagtajxJAhXmZqizslChmSoOSCVjAepnfxcPh7bodOA5SCJR7gWdVfVTl83RB
	eeN2e6NP+ePuU/6br7N/dbzSBYZp4U5c1PwtJsyQ3geNJIuQbHvi7oD/hIFPj5gyXFbd0uTfDFkrW
	dNjlkYNJMOwG0gWSGSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQgo-00Bsfl-AG; Thu, 21 Apr 2022 06:53:18 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQgl-00BseP-0B; Thu, 21 Apr 2022 06:53:16 +0000
Received: by mail-qk1-f179.google.com with SMTP id d19so2958945qko.3;
 Wed, 20 Apr 2022 23:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJDkHKGLNQny7+nf6+dAQhj4pSl5mPJhKTIW2Wu14QI=;
 b=quAXovi46A/nCZp5U00NSJHBteoRSsM5GGcJJKZvHPW6MD1kQSILcsrfTvi8uvx3pa
 hfSnxoN67HaZ1AnyFImirGkDv/6xWB7oAf5RoXNt5YazVjZdk9qvLBCJixkuuKLrWwmZ
 ai5Mfivuv5ajqAYILt5zhiqSU8qVZk1Hu+NcnDNM6o/AHq3lyoVSUzA32ajDqSF3KLi8
 CdqNFc0UVPYqo+isatUGQ7cQ/tmGJ/aMUUXRY5b0SzNW6mGmvWInoLZxokbiK36od9GI
 dZyH0KwF8+B1aJ60Y6sGmozDrEEqpo1iXhJpAKCr41TgB1HdM92Hwug3XNm7mKWCHw2h
 gsCw==
X-Gm-Message-State: AOAM532iSW1nLSmYXKTHdKCgdklnOgPhD1+FYXJiXjEoADxBbRZ0ePS+
 y82ZYdqnzwisYk/9YrptI8bTLrGo9Hu9PtCJ
X-Google-Smtp-Source: ABdhPJyZ3V5t68vz424ui7nWI91oxCpeEmELzX28gr87v5QQY9T9QkYG/175G75VYj1UpiNdBoBh+Q==
X-Received: by 2002:a05:620a:458e:b0:69e:d1f0:b7c0 with SMTP id
 bp14-20020a05620a458e00b0069ed1f0b7c0mr4953120qkb.161.1650523991932; 
 Wed, 20 Apr 2022 23:53:11 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 h5-20020ac85845000000b002edfd4b0503sm2976813qth.88.2022.04.20.23.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 23:53:11 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id j2so7098309ybu.0;
 Wed, 20 Apr 2022 23:53:10 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr23970174ybq.393.1650523990757; Wed, 20
 Apr 2022 23:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
 <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
In-Reply-To: <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Apr 2022 08:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
Message-ID: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_235315_111337_2DC0A774 
X-CRM114-Status: GOOD (  36.38  )
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

On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 21/4/22 00:58, Eric W. Biederman wrote:
> > In a recent discussion[1] it was reported that the binfmt_flat library
> > support was only ever used on m68k and even on m68k has not been used
> > in a very long time.
> >
> > The structure of binfmt_flat is different from all of the other binfmt
> > implementations becasue of this shared library support and it made
> > life and code review more effort when I refactored the code in fs/exec.c.
> >
> > Since in practice the code is dead remove the binfmt_flat shared libarary
> > support and make maintenance of the code easier.
> >
> > [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > ---
> >
> > Can the binfmt_flat folks please verify that the shared library support
> > really isn't used?
>
> I can definitely confirm I don't use it on m68k. And I don't know of
> anyone that has used it in many years.
>
>
> > Was binfmt_flat being enabled on arm and sh the mistake it looks like?

I think the question was intended to be

    Was *binfmt_flat_shared_flat* being enabled on arm and sh the
    mistake it looks like?

> >
> >   arch/arm/configs/lpc18xx_defconfig |   1 -
> >   arch/arm/configs/mps2_defconfig    |   1 -
> >   arch/arm/configs/stm32_defconfig   |   1 -
> >   arch/arm/configs/vf610m4_defconfig |   1 -
>
> binfmt_flat works on ARM. I use it all the time.
> According to those defconfigs those are all non-MMU systems, so
> having binfmt_flat enabled makes some sense there.
>
>
> >   arch/sh/configs/rsk7201_defconfig  |   1 -
> >   arch/sh/configs/rsk7203_defconfig  |   1 -
> >   arch/sh/configs/se7206_defconfig   |   1 -
>
> Those are all SH2 systems if I am reading the defconfigs correctly.
> SH2 is non-MMU according to the Kconfig setup. So it makes sense that
> binfmt_flat is enabled on those too.

I've checked git history, and CONFIG_BINFMT_SHARED_FLAT was enabled
in se7206_defconfig in a non-specific defconfig update, so no
further info.
The other two had it enabled since their introduction, so I guess
they were just based on the former.

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
