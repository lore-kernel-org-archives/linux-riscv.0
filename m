Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E27ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 424512082E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QyT+9ueh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFc9fBtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 424512082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUrQW2OK6mNDU+N4fNV/cX6efO62PtnZzP5dIGNOZ1I=; b=QyT+9uehQbjMMe
	CrlymOfvs4YPW3n12tDu6kpDXO1JslRyla40d1n7gWJ6pnraBK8sndbWEYIdBsfTZl3PcNVVTaVsO
	EMpq0FA8jlNPuoNnvMHOlgJY6NylVPG9f5QjcCA6K/H+nWY7DlJjtXe7lZrW5KmTmmVhi6tw0A+5b
	Ehtys6SC+Ta1l55orEaK/Fm4jbPwVa/63lIefSdRvxqNZFiv0L8a6NkDSwlYAMNCqYfV2KufFevpL
	4KcB3tj67qqh8Vj6JhzaJ0LsqD+eI5qoHeVqRY4o3X9dLb63PsJD+DZ6UpicwkRBJXN2Qjn4DrkZT
	/p6aB0oJP45jtFVM+Anw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFQg1-0002Jg-TM; Wed, 24 Oct 2018 21:26:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQfL-0001zb-1i; Wed, 24 Oct 2018 21:26:14 +0000
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EC9020838;
 Wed, 24 Oct 2018 21:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540416360;
 bh=DrYv3rOz4s3YKUAS25iDFbj9u1gmDS7kDGOLP8aXMPU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WFc9fBtW/wQk5rRBn8pd4zZ4GV3BDaqF2IH3xf//pL9gti9zT6wmhauZ04ZVAXXAX
 tEwOtwUKBf3yqR/uZINoF0Q7yqXohdhB5HZrxBB0n6o3r1fLXBC0QLTGFNZeObXs3r
 Pmm6zykqDp7m/QuWcNSZX2FpHTMf09MjtrWfpZfw=
Received: by mail-qk1-f175.google.com with SMTP id e4so4399061qkh.6;
 Wed, 24 Oct 2018 14:26:00 -0700 (PDT)
X-Gm-Message-State: AGRZ1gKNZWmqEpUlDul8JqbQTIYq3PCkSuScy21nKXD1t5V/2S+M0+gc
 RhdUWvj0DPxdovFm7dItylgu3C/Dyjz3UN1uvQ==
X-Google-Smtp-Source: AJdET5fLeqEQvAx6hoB3x+b9qFI1ZHrue/yG2wOqJqu736uN/9NeIxzvWV7airWmV10BuVn5dG9cretcBZt5Df4K5Vc=
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr1630980qkg.184.1540416359162; 
 Wed, 24 Oct 2018 14:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181024193256.23734-1-f.fainelli@gmail.com>
 <CAL_Jsq+KCOv6pXXHhHDZ+7-QUrmtMDvSjEVhK15yZ3qbnn61Ag@mail.gmail.com>
 <6e647f76-8523-09d3-9b72-d8d8abd213a4@gmail.com>
In-Reply-To: <6e647f76-8523-09d3-9b72-d8d8abd213a4@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Oct 2018 16:25:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKC6+8gobdk1uhMLLdMUHEO8D0c3m6+F_3y3NTU_KidOw@mail.gmail.com>
Message-ID:
 <CAL_JsqKC6+8gobdk1uhMLLdMUHEO8D0c3m6+F_3y3NTU_KidOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: Cut rebuild time when changing
 CONFIG_BLK_DEV_INITRD
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_142611_151598_CA32071D 
X-CRM114-Status: GOOD (  25.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-ia64@vger.kernel.org,
 SH-Linux <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <marc.zyngier@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Openrisc <openrisc@lists.librecores.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024212547.-dvATuDccTfujWgqEGsLX1IA11aWKINfaDwSwqUmRak@z>

On Wed, Oct 24, 2018 at 3:01 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 10/24/18 12:55 PM, Rob Herring wrote:
> > On Wed, Oct 24, 2018 at 2:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> Hi all,
> >>
> >> While investigating why ARM64 required a ton of objects to be rebuilt
> >> when toggling CONFIG_DEV_BLK_INITRD, it became clear that this was
> >> because we define __early_init_dt_declare_initrd() differently and we do
> >> that in arch/arm64/include/asm/memory.h which gets included by a fair
> >> amount of other header files, and translation units as well.
> >
> > I scratch my head sometimes as to why some config options rebuild so
> > much stuff. One down, ? to go. :)
> >
>
> This one was by far the most invasive one due to its include chain, but
> yes, there would be many more that could be optimized.
>
> >> Changing the value of CONFIG_DEV_BLK_INITRD is a common thing with build
> >> systems that generate two kernels: one with the initramfs and one
> >> without. buildroot is one of these build systems, OpenWrt is also
> >> another one that does this.
> >>
> >> This patch series proposes adding an empty initrd.h to satisfy the need
> >> for drivers/of/fdt.c to unconditionally include that file, and moves the
> >> custom __early_init_dt_declare_initrd() definition away from
> >> asm/memory.h
> >>
> >> This cuts the number of objects rebuilds from 1920 down to 26, so a
> >> factor 73 approximately.
> >>
> >> Apologies for the long CC list, please let me know how you would go
> >> about merging that and if another approach would be preferable, e.g:
> >> introducing a CONFIG_ARCH_INITRD_BELOW_START_OK Kconfig option or
> >> something like that.
> >
> > There may be a better way as of 4.20 because bootmem is now gone and
> > only memblock is used. This should unify what each arch needs to do
> > with initrd early. We need the physical address early for memblock
> > reserving. Then later on we need the virtual address to access the
> > initrd. Perhaps we should just change initrd_start and initrd_end to
> > physical addresses (or add 2 new variables would be less invasive and
> > allow for different translation than __va()). The sanity checks and
> > memblock reserve could also perhaps be moved to a common location.
> >
> > Alternatively, given arm64 is the only oddball, I'd be fine with an
> > "if (IS_ENABLED(CONFIG_ARM64))" condition in the default
> > __early_init_dt_declare_initrd as long as we have a path to removing
> > it like the above option.
>
> OK, let me cook a patch doing that and meanwhile I will look at how much
> work is involved to implement the above option you outlined, which also
> sounds entirely reasonable.

BTW, I would suspect that initrd_below_start_ok being 1 is not okay
for most arches. I'm not sure how that would work. min_low_pfn is
typically based on the start of memory. arm64 is not even setting it.

Rob

> --
> Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
