Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1399AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 09:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18DB60F24
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D18DB60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcNy27zvOc5SkP/vUNgEtGpAFhqeccdvPRXbfDG1yjY=; b=HMuOg6K7PlvnFx
	V2bFI0Cfs2T07T103nSMbOexu9RqHvIMgx1OImtwY++ugewjraX06/VFQHeaBhdyqgRrJWOnOMIXm
	Xk7dFzh5qJ9E7Qx8VDAuv0vqBC/dbZR3+O8k8zuu3Hd2pgs/ac/Mae8R2BO4DeZZHIjnzQ9KcJQKg
	jQKglAHf4y5o0/fkHVTxV0iGXdgX5R3zkIRLJA5exXZMXoQUmv+6LbmDXeTzWLIJP8iFHSPSJk91t
	LwHBoLUywOf3LMTxxUshiXfxzKWQYe8lr7/J24VzIKQZo8nmjtdFDDTjUhJ6C12YmebQCa+eyIsbS
	Ylq5xH9RNcZwmshhlumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZrwo-008eBt-Sb; Mon, 11 Oct 2021 09:50:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZrst-008cF0-Rf; Mon, 11 Oct 2021 09:46:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FA7560F92;
 Mon, 11 Oct 2021 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633945575;
 bh=qRyh8ehsFmtn9ig4J8UbiRrew6heVcGUFCDbxxmKZf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hR14YdOBybFf5arZDs0f5DTqL6oR83P1/SqbLyNrJwFHJBLTWaQazeIMc9uvTN1P8
 hAJqlZo6mlDfyVaItk+Gi7YQ6+xNmx+znUVD17u7+ezaHXrH34IV6jliAyYty27gK6
 2mJ0yYTHSWgVF+AO4LndCnRGcw4aDl9YdAaPanPAX3GDErqHtLO7iqAtTk0e2u7D6d
 7XHOe1RxkdihQ8rXcjEn1LyF918Jy6+gc6Tia4YX9/YFhMiQYAATwHxBriDyPRaPet
 xFver0G8OWX4Feq7uBsjBvSONLORuv0Fvdhgu6mrQdkDyNHT/6mP5a5/9dczhqsYKi
 kUx/6+qsAs0Cg==
Received: by mail-ed1-f52.google.com with SMTP id a25so49560917edx.8;
 Mon, 11 Oct 2021 02:46:15 -0700 (PDT)
X-Gm-Message-State: AOAM530DxhD3fwLezliWEqaZwUj4HVmq54WMg2I/DUvLWlQeDzbGdEsV
 5hNA0naR6/fBVNdcyKUX4LYnYWxA08K2iR/dSY8=
X-Google-Smtp-Source: ABdhPJyHs3mE6IoiFv5FE4vcliRHFQyxAEDWB/Wlg8v0WqzlUPkK8zWA+LhRJS54ay+HCTZiOLGsUmbAhjIFcqWae2k=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr23576993wra.428.1633945563612; 
 Mon, 11 Oct 2021 02:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
 <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
In-Reply-To: <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 11 Oct 2021 11:45:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3s5tu8MfdtXpoCeA8rrAUD3sscCMqLaoUVdUY9G-9AvQ@mail.gmail.com>
Message-ID: <CAK8P3a3s5tu8MfdtXpoCeA8rrAUD3sscCMqLaoUVdUY9G-9AvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_024615_947196_B289D49B 
X-CRM114-Status: GOOD (  19.85  )
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

On Mon, Oct 11, 2021 at 10:42 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Oct 9, 2021 at 11:24 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> > Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > +#
> > +# ARM System Control and Management Interface Protocol
> > +#
> > +# end of ARM System Control and Management Interface Protocol
> > +
> > +# CONFIG_FIRMWARE_MEMMAP is not set
> > +# CONFIG_GOOGLE_FIRMWARE is not set
> > +
> > +#
> > +# Tegra firmware driver
> > +#
> > +# end of Tegra firmware driver
> > +# end of Firmware Drivers
> > +
> >   # CONFIG_GNSS is not set
> >   CONFIG_MTD=m
> >   # CONFIG_MTD_TESTS is not set
> > ```
> >
> > No idea if the entries could be hidden for platforms not supporting them.
> >
> >          ARM System Control and Management Interface Protocol  ----
> >      [ ] Add firmware-provided memory map to sysfs
> >      [ ] Google Firmware Drivers  ----
> >          Tegra firmware driver  ----
>
> GOOGLE_FIRMWARE should probably depend on something.
> I highly doubt Google is running servers on e.g. h8300 and nds32.

GOOGLE_FIRMWARE is only the 'menuconfig' option that contains
the other options, but on architectures that have neither CONFIG_OF
nor CONFIG_ACPI, this is empty.  Most architectures of course
do support or require CONFIG_OF, so it's unclear whether we should
show the options for coreboot. Since it's a software-only driver, I
would tend to keep showing it, given that coreboot can be ported
to every architecture. The DT binding [1] seems to be neither
Google nor Arm specific.

CONFIG_FIRMWARE_MEMMAP in turn can be used for
anything that has memory hotplug, and in theory additional
drivers that register with this interface.

I'd lean towards "leave as is" for both, to avoid having to
change the dependencies again whenever something else
can use these.

        Arnd

[1] Documentation/devicetree/bindings/firmware/coreboot.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
