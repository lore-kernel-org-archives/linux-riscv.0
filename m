Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C96AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JN38pR/R+zNV9zBIFLpRjNXZQNh8DeZ80yZ+s5gpJWk=; b=Kpd16AJoB9Ucx0
	MIYe2nY6CKdLH0+FsqTClxgt55yUobbMnVQlYXLCkehZdg1naPHqVrgrRmTDrbntYT+DdbSL3F9eb
	nSnUAkTaq2rctPTqTY7rGhKYI4lwfMjYUk2V3DGk9m1gV+eKFrMBOxc4zEJ445qf+fPdwfUYGIxbg
	N7WVKWG9IBhyBxnvT/SVU5tih1jrF8QJFz7rRT3IaIKUq/FmXkAS8Aw9+XXSTvv1KWfkn2HIE9WbV
	KoVBqJ7rMh1edjJgQZPFqYNj1D6Hq35FEZgebEcTZJ0hn7szjNMqXttyIB51MWy0PS8RsHwt2MTgw
	A2ymKZe+Z6LOgTTS7rZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gdH-002cW8-6z; Mon, 13 Jun 2022 09:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gcl-002cFv-RO; Mon, 13 Jun 2022 09:44:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADDA61381;
	Mon, 13 Jun 2022 09:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2C1C3411C;
	Mon, 13 Jun 2022 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655113482;
	bh=xt5DGwjhYrIt2t4/I7WxcJsztFBJP3gm0q1s4WQ34ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O6YeFxlyL68gdYVZZNmot4hKDu0cvDrL3n970VtnwqC9I7SfliUL5fhLeFQ4/9bin
	 T8zI4SrdeG92yvm7oD0YAcVoiXTFDHh28yErHqdUpfGE3l8jWy59lCt44xoXqiVYSC
	 I1Z18vioGAzwJOeFhgQIglmEv8c7kXJ8qrYOAjH7LtWOk4F+xLDBKV1LrBX0QY69Xf
	 oYM20nOCGNvfXlNxhrShdrqtSJhvfFSnhgSL1r67+lRBEpFwCMaWrgIT+2uZ2a/pO3
	 0vNnT4K97SF5CYxpWY0TAy70/MiMaYUqQUWDiiuRybC1LkGsmhR5stXESG+KOtcBee
	 qam3B2J8kCg/w==
Received: by mail-oi1-f169.google.com with SMTP id q11so7071138oih.10;
        Mon, 13 Jun 2022 02:44:42 -0700 (PDT)
X-Gm-Message-State: AOAM531JoxBlytLpS9hsZJIXjkZhKM6jYZsnDNhjBQui6wF69mf6uP8/
	lEA7WyZr6VmzW1g3gbWsfhTyV3K2DzmMeezXh9I=
X-Google-Smtp-Source: ABdhPJxWL190gaOo8x+poLO9fIQXg4n82FrPAPLPqZ2Srb/3zr8FQ26NmuG4wz3v6gR8a+MZBf5hmYgVu3gibFw/syM=
X-Received: by 2002:a05:6870:e98b:b0:fe:219a:2449 with SMTP id
 r11-20020a056870e98b00b000fe219a2449mr7281685oao.228.1655113471413; Mon, 13
 Jun 2022 02:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220613082147.183145-1-mawupeng1@huawei.com> <20220613082147.183145-7-mawupeng1@huawei.com>
 <590a1211-d316-d51d-6577-eb9983126dd0@huawei.com>
In-Reply-To: <590a1211-d316-d51d-6577-eb9983126dd0@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jun 2022 11:44:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFfmXMriLutNA1FyeNhNz=Zo2hHgO8FLkQ3_xT8kF6oeQ@mail.gmail.com>
Message-ID: <CAMj1kXFfmXMriLutNA1FyeNhNz=Zo2hHgO8FLkQ3_xT8kF6oeQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] memblock: Disable mirror feature if kernelcore is
 not specified
To: mawupeng <mawupeng1@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, paulmck@kernel.org, 
	keescook@chromium.org, songmuchun@bytedance.com, rdunlap@infradead.org, 
	damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org, 
	robin.murphy@arm.com, david@redhat.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org, 
	geert@linux-m68k.org, vijayb@linux.microsoft.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_024444_081079_248C0994 
X-CRM114-Status: GOOD (  33.37  )
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

On Mon, 13 Jun 2022 at 11:13, mawupeng <mawupeng1@huawei.com> wrote:
>
>
>
> On 6/13/2022 4:21 PM, Wupeng Ma wrote:
> > From: Ma Wupeng <mawupeng1@huawei.com>
> >
> > If system have some mirrored memory and mirrored feature is not specified
> > in boot parameter, the basic mirrored feature will be enabled and this will
> > lead to the following situations:
> >
> > - memblock memory allocation prefers mirrored region. This may have some
> >   unexpected influence on numa affinity.
> >
> > - contiguous memory will be split into several parts if parts of them
> >   is mirrored memory via memblock_mark_mirror().
> >
> > To fix this, variable mirrored_kernelcore will be checked in
> > memblock_mark_mirror(). Mark mirrored memory with flag MEMBLOCK_MIRROR iff
> > kernelcore=mirror is added in the kernel parameters.
> >
> > Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> > ---
> >  mm/internal.h   | 2 ++
> >  mm/memblock.c   | 3 +++
> >  mm/page_alloc.c | 2 +-
> >  3 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index c0f8fbe0445b..ddd2d6a46f1b 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -861,4 +861,6 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags);
> >
> >  DECLARE_PER_CPU(struct per_cpu_nodestat, boot_nodestats);
> >
> > +extern bool mirrored_kernelcore;
> > +
> >  #endif       /* __MM_INTERNAL_H */
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index b1d2a0009733..a9f18b988b7f 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -924,6 +924,9 @@ int __init_memblock memblock_clear_hotplug(phys_addr_t base, phys_addr_t size)
> >   */
> >  int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
> >  {
> > +     if (!mirrored_kernelcore)
> > +             return 0;
> > +
> >       system_has_some_mirror = true;
> >
> >       return memblock_setclr_flag(base, size, 1, MEMBLOCK_MIRROR);
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index e008a3df0485..9b030aeb4983 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
> >  static unsigned long required_movablecore __initdata;
> >  static unsigned long required_movablecore_percent __initdata;
> >  static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
> > -static bool mirrored_kernelcore __meminitdata;
> > +bool mirrored_kernelcore __initdata;
>
> __initdata here is not suitable and will lead to compile warnings.
>
> In my test, __initdata_memblock and ro_after_init are both fine, but I am not
> sure which one to choose? Do you have any idea on this?
>

__initdata_memblock is fine if it works.

This looks to me like the right place to implement this policy, so

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> >
> >  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
> >  int movable_zone;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
