Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B58C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGsH2r2F3DuY2LgdHmanZLb7rEtPXDfFtpvIK34/C38=; b=aoMGRtKuBVy5vC
	dPaagIl4xvySUNVKs2btyzZ9iJqn3/pnzkw1+MwTeoYpgOsVwPTY9IR7ZDTMBjgu/dlKU7cpVV9r1
	gw00NQ0DLtDka1eEmcOVJTvBVV/6DQI4vy9vLybEiwsUMBizspVTDpy2Mh1BGU9joyXmxkKTjtmlp
	PczwxgIMW+81QsDnBmVqSct6zotAGUC6ccw9sCM+ykZxfIk+XmPrqhj1KZDazd63yXpi73Qa9vMGC
	e4rh0RvJWjAOpeP/IbbC+s1WTBhQgm/5YOE/qbsTT5YUVYz7XywiTYQ4pFQpp+2JXoOSLgGQM6682
	L82wVWsTlBBIwWsVnfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqH9d-0089LA-Tv; Thu, 25 Nov 2021 15:59:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqH9a-0089J3-Oj
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:59:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id o14so4861454plg.5
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVT/h/b1JxXgPsghZbme6MV/FB5PifGmFBJ6WbiXN8U=;
 b=mBA310ouSV2pzyNALCaaR62JWArRGnIAL5pcXXyHshM6yx1Lpf0y0mbWaFTCAay2fd
 NKGvOgd18u46/e/rR9P6TCUZShhKCrW+/4UG4BCMqOubFV6vHl0ontxZ/1Rg67TECkrD
 IgMnEyRLxM/k0PnSaEslQLsLZabeFAupFkvlX92JVFeXS8+au/b9UGMsLuilFT4GuX8Q
 geM+OXizmPRk+fVgX0nMPZHY34Buw+3VgZ+SF9aXmdboVBcvSneGF9K4JXGenQ1KcLAK
 ThmB0KdzHCEE91f59JPQUZr2l8aKevpW75sMt6ud2LaDdWoX5WeKnFfQCC1IMmxidDBZ
 uYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVT/h/b1JxXgPsghZbme6MV/FB5PifGmFBJ6WbiXN8U=;
 b=J8wo73Op2DebAuwWt1lLzUUy7yM7wbOpj0Ig3utMV0vAe8Lmp4oUMU2nwrfNO7TSlB
 wMVUc0V4XVs+ECdRZJBDR8bGdhd+jOipa0XisTNfcR+JXJMz18x7AQ5hqLuAQWutq91H
 ilW6dt6cS0F4FyPIsI5vu+xay+5t2oHGjIbPgXvNeOqEe+l6mUYNVyplCz5qgJRZGwxc
 kIVmjhyC8y9KD5JBY2PD1yazeGk3gbwuw4/KxkYpjY9m9hCAUvPFnDD9Ie/ogsOaMnm2
 4Inow6PcoaLI90JyoYceld06Fba+1f+DEukavgHof2nOdMd5X6YxNo/JMD6MlZzBwbuh
 Wtyw==
X-Gm-Message-State: AOAM531q4+bSBAIwUKE3Ot8M8H1NcQW0OFU6VdTSXGUAZk8SVIKpUbWT
 xwu7Ac20ghb6VL8SgY4xUDyWWZrgwO/i5sOz+Yc=
X-Google-Smtp-Source: ABdhPJzOI5UrU+4xlknefr2amNHx+hymVWs98IjoAUyQ3buD1ZmrzUhLA2BNeP7CTsdNj4hQXTC79ApGINK3CsXxdnA=
X-Received: by 2002:a17:902:b588:b0:143:b732:834 with SMTP id
 a8-20020a170902b58800b00143b7320834mr30907940pls.22.1637855957399; Thu, 25
 Nov 2021 07:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20211120165528.197359-1-kuba@kernel.org>
 <CAPhsuW4g1PhdczQh=iqDR_CzB=6FoM4QPF9DmknEP0hZ_Ac3TA@mail.gmail.com>
 <d4c52f8f-7efb-3d2a-8f2e-c983cd0c8cce@arm.com>
 <CAPhsuW6CMBymKpOMdL-bianESBLfbKa5JwmFypKL3dx4k0rmSQ@mail.gmail.com>
In-Reply-To: <CAPhsuW6CMBymKpOMdL-bianESBLfbKa5JwmFypKL3dx4k0rmSQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 25 Nov 2021 08:59:06 -0700
Message-ID: <CAADnVQ+2kPhfG_DOrYpibDfs-COC5AHyKEDbqPNWnPhLhrV=uA@mail.gmail.com>
Subject: Re: [PATCH bpf] cacheinfo: move get_cpu_cacheinfo_id() back out
To: Song Liu <song@kernel.org>
Cc: James Morse <james.morse@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 reinette.chatre@intel.com, 
 bpf <bpf@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 X86 ML <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_075918_844661_ECF026BE 
X-CRM114-Status: GOOD (  32.10  )
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

On Wed, Nov 24, 2021 at 1:14 AM Song Liu <song@kernel.org> wrote:
>
> On Tue, Nov 23, 2021 at 8:49 AM James Morse <james.morse@arm.com> wrote:
> >
> > Hello,
> >
> > On 23/11/2021 17:45, Song Liu wrote:
> > > On Sat, Nov 20, 2021 at 6:55 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > >>
> > >> This commit more or less reverts commit 709c4362725a ("cacheinfo:
> > >> Move resctrl's get_cache_id() to the cacheinfo header file").
> > >>
> > >> There are no users of the static inline helper outside of resctrl/core.c
> > >> and cpu.h is a pretty heavy include, it pulls in device.h etc. This
> > >> trips up architectures like riscv which want to access cacheinfo
> > >> in low level headers like elf.h.
> > >>
> > >> Link: https://lore.kernel.org/all/20211120035253.72074-1-kuba@kernel.org/
> > >> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > >> ---
> >
> > >> x86 resctrl folks, does this look okay?
> > >>
> > >> I'd like to do some bpf header cleanups in -next which this is blocking.
> > >> How would you like to handle that? This change looks entirely harmless,
> > >> can I get an ack and take this via bpf/netdev to Linus ASAP so it
> > >> propagates to all trees?
> > >
> > > Does this patch target the bpf tree, or the bpf-next tree? If we want to unblock
> > > bpf header cleanup in -next, we can simply include it in a set for bpf-next.
> >
> >
> > Some background: this is part of the mpam tree that wires up resctrl for arm64. This patch
> > floated to the top and got merged with some cleanup as it was independent of the wider
> > resctrl changes.
> >
> > If the cpu.h include is the problem, I can't see what that is needed for. It almost
> > certainly came in with a lockdep annotation that got replaced by a comment instead.
>
> Thanks for the information.
>
> I can ack the patch for the patch itself.
>
> Acked-by: Song Liu <songliubraving@fb.com>
>
> But I am not sure whether we should ship it via bpf tree. It seems to
> me that the
> only reason we ship it via bpf tree is to get it to upstream ASAP?
>
> Alexei/Daniel/Andrii, what do you think about this?

I don't completely understand why it cannot go via -next along
with other patches, but if Jakub needs it asap here is my
Acked-by: Alexei Starovoitov <ast@kernel.org>
and probably the fastest is for Jakub to take it via net tree directly.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
