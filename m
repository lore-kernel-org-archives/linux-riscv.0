Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONtnoBOdG5z1jH6zo6LwuQ/4LgnaXUre4e6DEHFKCj4=; b=SeES6Bk2FNM9/m
	TZ9YA78kdLhLc1oWaRWVjFU9W+cMZWBpMyzgADse6FWtIRGAYSGGEyEXbH2DCnTTyfcb+7vqiusOG
	mWn7VSuvDnDajazE8JH5AaUTzk8gpJ8jPayCWBr5YPj8k/Ep/ShvwBP1MGJFkaRVmBjZxGLo05XcH
	x54/C/elLn2FH4BbhLoknwVXb+jeZFhytKSXhUnvsCmwOm740pZLXFqKkeBzbXMEClEAB/j83DXaR
	wHQkiXWbV+5KllwPGb5t4olVLCGl7aycSUbAouNtQk9DE/WclI4tachJVxXL4+hRbVqL2etNmcJpD
	EVE4xtiY7IURjTzPTCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaWx-008AWP-DH; Tue, 07 Jun 2022 14:50:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaWk-008ARv-98; Tue, 07 Jun 2022 14:49:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D17E8615B4;
	Tue,  7 Jun 2022 14:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D86CC385A5;
	Tue,  7 Jun 2022 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654613389;
	bh=21Q6z4C7gLAJxDrMjpR35TaWJleKEVSnTcJc1XoghQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WYB46EnJQ8KmDZFu6jSEUXfmMoEna05up4CJncyNZI8uwIsHCdYLTKRC0+amkX8Oj
	 MulYqkmJUA5xdzBLnlJ21Knk2rVOc1evBYmVmwsz4nrwG0eEcpPi7TeRtjNt61KxNH
	 ccUjQNum/v+Ub+BowdrQm3vPx9vFs8vP3DY+hXLw6mwabo8XB7Rxm9sNnN0iS1uWFt
	 MCOberJ0KBzQM0XYyIpd9+CCCedeK4LgO49Mt/bgctMQbCdSeaqZNeB83IrXJR28LR
	 KWDkX7QpyE+RWe5J/rqQ+SXWifk/MNU4VEaxvRBiJnHsZjTRfkssXiFrUar+JjE+ED
	 LRsfm30v4ZsqQ==
Received: by mail-ot1-f50.google.com with SMTP id l9-20020a056830268900b006054381dd35so13069044otu.4;
        Tue, 07 Jun 2022 07:49:49 -0700 (PDT)
X-Gm-Message-State: AOAM5332RkNptgeXILzjkwEwSLebOVFqlEyYj6rlEYBhW8XNtaZTobcu
	hL5HYlO+qo2mVsi6MRCGoV6jIAK+qy37PorHQYs=
X-Google-Smtp-Source: ABdhPJzju8BnufR6dAUwCuaVy7emdCBqao+Rd1rppQ3NzXkq8vagt8De7zdNBr5XdK5Y5+FNyl+7NFE6w3IjeLs4C7w=
X-Received: by 2002:a9d:76d5:0:b0:60b:1882:78bd with SMTP id
 p21-20020a9d76d5000000b0060b188278bdmr12748793otl.71.1654613377932; Tue, 07
 Jun 2022 07:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com> <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
In-Reply-To: <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Jun 2022 16:49:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
Message-ID: <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: David Hildenbrand <david@redhat.com>
Cc: Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	dvhart@infradead.org, andy@infradead.org, rppt@kernel.org, 
	akpm@linux-foundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org, 
	songmuchun@bytedance.com, rdunlap@infradead.org, 
	damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org, 
	robin.murphy@arm.com, anshuman.khandual@arm.com, thunder.leizhen@huawei.com, 
	wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org, 
	geert@linux-m68k.org, chenzhou10@huawei.com, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_074950_409652_1163665C 
X-CRM114-Status: GOOD (  30.54  )
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

On Tue, 7 Jun 2022 at 14:22, David Hildenbrand <david@redhat.com> wrote:
>
> On 07.06.22 11:38, Wupeng Ma wrote:
> > From: Ma Wupeng <mawupeng1@huawei.com>
> >
> > Initrd memory will be removed and then added in arm64_memblock_init() and this
> > will cause it to lose all of its memblock flags. The lost of MEMBLOCK_MIRROR
> > flag will lead to error log printed by find_zone_movable_pfns_for_nodes if
> > the lower 4G range has some non-mirrored memory.
> >
> > In order to solve this problem, the lost MEMBLOCK_MIRROR flag will be
> > reinstalled if the origin memblock has this flag.
> >
> > Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> > ---
> >  arch/arm64/mm/init.c     |  9 +++++++++
> >  include/linux/memblock.h |  1 +
> >  mm/memblock.c            | 20 ++++++++++++++++++++
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 339ee84e5a61..11641f924d08 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -350,9 +350,18 @@ void __init arm64_memblock_init(void)
> >                       "initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
> >                       phys_initrd_size = 0;
> >               } else {
> > +                     int flags, ret;
> > +
> > +                     ret = memblock_get_flags(base, &flags);
> > +                     if (ret)
> > +                             flags = 0;
> > +
> >                       memblock_remove(base, size); /* clear MEMBLOCK_ flags */
> >                       memblock_add(base, size);
> >                       memblock_reserve(base, size);
>
> Can you explain why we're removing+re-adding here exactly? Is it just to
> clear flags as the comment indicates?
>

This should only happen if the placement of the initrd conflicts with
a mem= command line parameter or it is not covered by memblock for
some other reason.

IOW, this should never happen, and if re-memblock_add'ing this memory
unconditionally is causing problems, we should fix that instead of
working around it.

> If it's really just about clearing flags, I wonder if we rather want to
> have an interface that does exactly that, and hides the way this is
> actually implemented (obtain flags, remove, re-add ...), internally.
>
> But most probably there is more magic in the code and clearing flags
> isn't all it ends up doing.
>

I don't remember exactly why we needed to clear the flags, but I think
it had to do with some corner case we hit when the initrd was
partially covered.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
