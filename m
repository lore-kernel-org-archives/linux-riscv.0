Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE58CC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:09:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C4A61059
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C4A61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHdpZLSmrH9fC5C3XcWFGStUIllY1GRSrPOzcwdTDsk=; b=YurhW6JQM78oCa
	ySj0WvgDW2h27ZwMPPZFQJSLuyFilm5g9tua5Zfmf23vctfy/U55M4Hm8FC/W4fkGeCMWO8fZK9jL
	ws7pLeDNHq+oamYvp2dUD0KzTtPeh6nTS+XebONAiQZ+8GwOSeNymDkichMYk2zZoGAgxWzQ03efA
	eJTvXkf1+4J2q1OZ9HNjUOzYJsp5OFogxdvOyEJpoqRozNHorMuU4YwjL/GEQjsBfeYKesRzsX0h1
	7lGl3h0tpoAanEbllZeYcfFw7y75c5GEnQRj2sFF9EGtmkBkYgz6ShQ3ivsij86oAF5WiehhE1GJk
	qh9iL+AheHyRRlhYrrNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldtrL-00G9hs-57; Tue, 04 May 2021 12:09:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtr9-00G9h8-Fs; Tue, 04 May 2021 12:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UN7pV5RqTabiw9FLCudCCxNw0QhoYgGOrTCBsY3EDog=; b=ghdFHZfsBtR6dNHkLyrYQmYSrC
 GfRS0LaZHkEBExbj4WU+2wISDAnatcZbbZy2nHW00w0JH6sRFmKbIz0EeniYiCryLhtQptyXPqyOf
 kYp6L5GViJdeMhTVoWM6FzwgVWZHSorBvi5kbV2P/KkFi3FMgCwqg+8rjk2d4W4/FggkmMjG+zzkr
 VdLKpxC0Ku32h2YGpf35E0y9jP5awm3Qy66xtmNHvHjqYjwaWUYmmJc3FXFWZZcpV51HmiN4WPWpq
 uqCg8fzLhixdIErRFQ9elpWTRD5zOfbXTsfYCN5pTS39JunTvrtFC9lr+mfyJ7gGePEuRnQJEhz3/
 KleUdSIA==;
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtr6-003xDE-Dh; Tue, 04 May 2021 12:08:50 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Ma1wa-1m11Hv4668-00W21W; Tue, 04 May 2021 14:08:40 +0200
Received: by mail-wr1-f41.google.com with SMTP id l2so9128034wrm.9;
 Tue, 04 May 2021 05:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM530HxLJeeERsAnA+7q3cVinhvXxCuFzkColdPd/j0rDzjd6/vJ6A
 oYEh+DgFbPcdjTkUO506cK/FosVTqoi1VfSGrSo=
X-Google-Smtp-Source: ABdhPJw20yUwLjuDm4O2f4JNErVjYHf0sVRY4Y7yimcYIwg2TBud2AGVYmDyXDJ9tJQqulD0dlHRWOk7iwc1IQFkZg8=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr32138876wrr.286.1620130119473; 
 Tue, 04 May 2021 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
 <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 May 2021 14:07:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:FJCmBYXPsPqq4yDsFj7Hle4N7Sv2yKsQgJVrlnwMJVOS6NbwQKJ
 gSaulf5v4+/Hp55JNKkzqj5W03AbVMCphbkxMUTF/EBWUhPU248YGyqNuymaIu5OHL2OZ+1
 bookOXzFXeFjVFTM+gnhXmee5XW6zYB9Cda3grVoxFdaxhF+294FPWEid6fHvdO8FCSO4Ac
 grKsx8Y/ZQ9ghQtCnDmjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sEKcYbqX4yI=:qWp/sOUg/n6O/PAN8lOFZ9
 ZWUbMivto6+sqrZ9rApHgrWxjCgmqghQ8KRd1YrpkwXA2YiYSn6md7Tm34RVVbW4ovhw1+EAv
 v6cEPA5iG6T2/JmPZQIGW2dKs82glDmfphvb2qcEMEX9FwaMUYVxPb7amXCBUdpL3YH28eBjk
 m3Kbb69Un6cU3lZPnpC3LVVGel40HAqgUixESKSTeCD9/N4x1tfyv0cHAJLKGSRGF89cvjBGJ
 urJo3uwg3HziZ5Y0AQoh3wbtKeUbBfahQ26jaUVeMbysKRGHOPuOq8ristww7NeoTTWWEKTMK
 wgiTEzitihM0+t1Vtk02lNjuG6TM8QfDroja2SvvKMOJPNs7eqk1avRK+vedUmT5i899huwwT
 +rGHSjt2QsOZhfCXenjQ240SmEHwfnJ9y1htyEzEOnrj/LzXMF/AkKlK2+aTK4C9iXZueOhMR
 3+M8G7bJzbsksp6AYYD5pGuCaQDeXNDob+IbBT+jphYcqU4fH+mdffvDm8Drob/ycy4mvy/Cn
 dXefDSQBk0vcqsq9o18fh1i428jA7z5woGuTYua/LmH60TBZv2zKliVfbrmw6d+1KXP3YeCud
 5Miiu7YVdz9qdTxv/y8YRJPtrw1cdQpQZFYvAJKDaT4jyGr8uTy8laHwx3IImdzlg6o3wXK0S
 tZZo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_050848_773230_E2BE613D 
X-CRM114-Status: GOOD (  33.83  )
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

On Tue, May 4, 2021 at 7:31 AM Alexander Dahl <ada@thorsis.com> wrote:
> Am Mon, May 03, 2021 at 11:25:21AM +0200 schrieb Arnd Bergmann:
> > On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> > >
> > > Desktops and servers are all nice, however I just want to make you
> > > aware, there are embedded users forced to stick to older cross
> > > toolchains for different reasons as well, e.g. in industrial
> > > environment. :-)
> > >
> > > This is no show stopper for us, I just wanted to let you be aware.
> >
> > Can you be more specific about what scenarios you are thinking of,
> > what the motivations are for using an old compiler with a new kernel
> > on embedded systems, and what you think a realistic maximum
> > time would be between compiler updates?
>
> One reason might be certification. For certain industrial applications
> like support for complex field bus protocols, you need to get your
> devices tested by an external partner running extensive test suites.
> This is time consuming and expensive.
>
> Changing the toolchain of your system then, would be a massive change
> which would require recertification, while you could argue just
> updating a single component like the kernel and building everything
> again, does not require the whole testing process again.
>
> Thin ice, I know.

As Christophe said, I don't think this is a valid example. I agree that
if rebuilding everything with a new toolchain requires certification, you
shouldn't rebuild everything.

If replacing the kernel does not require recertification for your
specific system, that is fine, but that does not mean the new kernel
should be built with an outdated toolchain. If the certification
allows replacing linux-3.18 with linux-5.10 but doesn't allow building
the kernel with a different toolchain compared to the rest, then
the point of the certification is rather questionable.

Do you know specific certifications that would require you to
do this?

> One problem we actually ran into in BSPs like that (we build with
> ptxdist, however build system doesn't matter here, it could as well
> have been buildroot etc.) was things* failing to build with newer
> compilers, things we could not or did not want to fix, so staying with
> an older toolchain was the obvious choice.
>
> *Things as in bootloaders for an armv5 platform.
...
>
> What we actually did: building recent userspace and kernel with older
> toolchains, because bootloader.

It sounds like you are trying to make an argument in favour of
deprecating old toolchains *earlier* in new kernels ;-)

If we simply made it impossible to have users build kernels with
the same old toolchain that is needed for building the old bootloader
or the old user space, it sounds like more people would do the
right thing and build the updated kernels with a better tested
toolchain, or update their bootloader as well. The only downside
is that some users would choose to remain on the older kernels,
so it shouldn't be too aggressive either.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
