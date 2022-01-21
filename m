Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D61FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM/M3kIrjHxNCEFLzKoV3yr4clQc7EIEZgY6qlfxDzM=; b=PmDtnRrGlQ+aQt
	gYxOdhva56ufHfxG3i01UKjMtRBGVEs9MV2nY4fY2gqZZQeTT0gBI+sLKD3tT7RFbOV7/9Q6YpHY3
	vYkt2hCvpoqUPiIr/ZGgEqwLlqzfOr4g9a4Y5jJ1EqzYTGJ71ugphDDHHAb0RTDiCEGeGCZUWMcLk
	CmdJeToSvpT6Wjdth3CbLwXOylE3wM3Nnat5RWpYPJ09yapi1vs4pl3HPle+4iQh5Z8iwGi5hkoJd
	br8uy74qseHrI6ucxNTCCQj6LS9FK9yxmj0KpLNHz6NGJCRBXP71nLkUOGRSGwqgiQCpsxAaIB9Oe
	EANZZBDWcZF6KyCx8vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAq8B-00ESK6-Li; Fri, 21 Jan 2022 09:22:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAq7x-00ESFo-5J; Fri, 21 Jan 2022 09:22:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42C3FB81ED4;
 Fri, 21 Jan 2022 09:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0192CC340E2;
 Fri, 21 Jan 2022 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642756954;
 bh=DoEBSYVdhxCk2hRPozcTctknq4n34sTJPxtSYV1nfhs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rect2n4o+iX3RzSuMqm7blYH7Jp/hn6KvYVHNZi4gBL8iFIvMsCmxh1McTEwDN7si
 Jp36PSgZTxLoEYXNkuZPZHbuOSaCX325CmGEKFE7qdL/bJYrG4zQFtGn5SCOJLFLuv
 L3sc4NOwY7+X2UWdBb2ueG0AClbmiy7IwW458aaaf3XIv3BTv/IAj4XAqFCgdH7ih5
 t6ToBIUrsVsbMOObBDp9gxf4Mq/Pzd4XB1xuRpofrh2pf52fyeSpwwMuzAAf2V+eki
 7yzqCn4T+d70ueboR1lGAMbTJ8dL8zQnETPkZDzy+/H5QLqca4OHltjQ5kVikRSe2h
 DVpmSiH6xAKgg==
Received: by mail-ua1-f52.google.com with SMTP id w21so15753385uan.7;
 Fri, 21 Jan 2022 01:22:33 -0800 (PST)
X-Gm-Message-State: AOAM533L4nOK/qALU0RyRB1cu6j64Q/ovHlSMj5oS12/in1DMG3k0Ybz
 /ZW5KlCTjtJ63Lxvf9gBwDnoNfbMzBRAAtPHGkQ=
X-Google-Smtp-Source: ABdhPJy/0MHzL1Lj83ABpPKlmasRjxPdpSw7edTfCXcU+fXON/ztRB09l8EfH009hsjqC4mDy1GaKsQom5NTP4rqtk4=
X-Received: by 2002:a05:6102:34ec:: with SMTP id
 bi12mr1057047vsb.51.1642756953041; 
 Fri, 21 Jan 2022 01:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
 <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
 <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
 <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
In-Reply-To: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 17:22:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSzMym_PS36JgpWLQUdAO3nq+z7mdDWRT=EzQq+waPSpA@mail.gmail.com>
Message-ID: <CAJF2gTSzMym_PS36JgpWLQUdAO3nq+z7mdDWRT=EzQq+waPSpA@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_012237_515619_31B0DF62 
X-CRM114-Status: GOOD (  26.27  )
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

On Fri, Jan 21, 2022 at 4:57 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jan 21, 2022 at 7:25 AM Guo Ren <guoren@kernel.org> wrote:
> > On Thu, Jan 20, 2022 at 10:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> > > Are you sure these are the right calling conventions? According to [1],
> > > I think the 64-bit argument should be in an aligned pair of registers,
> > > which means you need an extra pad argument as in the arm64 version
> > > of these functions. Same for ftruncate64, pread64, pwrite64, and
> > > readahead.
> >
> > [1] has abandoned.
> >
> > See:
> > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc
>
> Ok, thanks for the reference, I picked the first one that came up in
> a google search and didn't expect this to ever have changed.
>
> > > I still feel like these should be the common implementations next to the
> > > native handlers inside of an #ifdef CONFIG_COMPAT.
> > >
> > > The names clash with the custom versions defined for powerpc and sparc,
> > > but the duplicates look compatible if you can account for the padded
> > > argument and the lo/hi order of the pairs, so could just be removed here
> > > (all other architectures use custom function names instead).
> > I would try it later.
>
> This becomes easier then, as powerpc and sparc already have the non-padded
> calling conventions, so you could just generalize those without looking at
> the other architectures or adding the padding. The powerpc version already
> has the dual-endian version, so using that will work on big-endian sparc and
> on little-endian riscv as well, though we may need to come up with a better name
> for the arg_u32/arg_u64/merge_64 macros in order to put that into a global
> header without namespace collisions.
Sounds good, thanks!

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
