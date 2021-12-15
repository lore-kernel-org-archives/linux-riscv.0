Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE235C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apTVt56Y6JuMTq+L17VVvsIZlRfZMZtkR9gFtARRAIg=; b=Ya3IGd9ArCMlDg
	7hs/EE4weXvFKS/WsGldxpo7JixIbQ4CytxQK/EIVtfvnpABioY1keuRaIDP4cTtUWHhMvVlx23pX
	3zx+n4n7qOS0cCJh8rW4MkqEOV2qsvMuEUIcuRbZilZ88JbCDBLUxx0SZoVi245ZEjDbQSJjLSJ42
	PWZfK/2ieHF+DP41fzV5Kv7pL4+/nSo1ztX26jfY4/OKlSunuJu7ahOLd6o214gSnihN8iyd5gV70
	G2B65396/b+UNr4YWi+ty8YFcseGkMcUzBPvbl/VdiI6HX72AEp96Xuz0WcaXymKBhqA1728FkCH8
	RRTUpb4P62LRwxKuMcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxP9V-00HHbC-Pn; Wed, 15 Dec 2021 07:56:41 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxP9S-00HHaP-Px
 for linux-riscv@lists.infradead.org; Wed, 15 Dec 2021 07:56:40 +0000
Received: by mail-vk1-f173.google.com with SMTP id j1so14127698vkr.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 23:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVQUCRhJvXZRgFxiFcRA88PjQcq5cJWHq/xScnHpVHY=;
 b=E48Qmhmnjvlts+o3p/fzzDE2NhmcWGfleg30pogExpKVv7C4Ekw2UBeHStsUs10gS2
 9yizdnoKKdVYmIC/5iELHqCHy5OmFHN8awWvvAQ7geZRIB2g7+6UQo2RH8Oc4xIusZ4l
 MKwE/+IK2IfIFqnBXi8WkNeWg3hSirN61aFbdt//I9yrKUzY8HK51eKq5kp8zKJtBkPn
 TUZw3YtSWUhoqt5ejxQ5BaOGtNZfjF/O4/3C8WwrmIWJZEUuCk2TlA7B+E4kWRPsyoZy
 GjZoNc+Tl4f5UqaR6J9PNBQXNohCbTDJLT+7KlTAID0CpCZ9PMrApZOYMcFPSQ05KGGs
 K8Ow==
X-Gm-Message-State: AOAM533mYZILXtuNl64QNXbXeT3VbrZX6yqDDPuspdYQsFGYaAlw5yhh
 hUMPEeythsnZITOxmQ4/gPj9tfqMPFLJhQ==
X-Google-Smtp-Source: ABdhPJyJ/um5vRiWJf1kg4C9ztq/LmDpZDYRb6KOMreSBY1vQYF6+dWXMKCWqNtG/zN7FOE8qUENAw==
X-Received: by 2002:a05:6122:c9b:: with SMTP id
 ba27mr2651169vkb.14.1639554997478; 
 Tue, 14 Dec 2021 23:56:37 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id u14sm284228vkk.12.2021.12.14.23.56.36
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 23:56:37 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id o1so39462533uap.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 23:56:36 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr8960109uar.14.1639554996714;
 Tue, 14 Dec 2021 23:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
 <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
 <YbjTuOhNxaPirK1L@fedora>
 <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
 <YbjuGhPTjuTCSu+m@fedora>
 <CAMuHMdW8Besfp3Pbj1tRJ4gKKUbR59pU1ACuUNnn4RXkgVo5Qw@mail.gmail.com>
 <YbkDfyTbI/M6gaOw@fedora>
In-Reply-To: <YbkDfyTbI/M6gaOw@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 08:56:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBYaz6N0vkA+oP3Cf4iBiWs=bEn0Y9z=JHg3u3wmc1Rg@mail.gmail.com>
Message-ID: <CAMuHMdXBYaz6N0vkA+oP3Cf4iBiWs=bEn0Y9z=JHg3u3wmc1Rg@mail.gmail.com>
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
To: Dennis Zhou <dennis@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, linux-arch-owner@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 Rich Felker <dalias@libc.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_235638_873645_FE3F5521 
X-CRM114-Status: GOOD (  45.36  )
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

Hi Dennis,

On Tue, Dec 14, 2021 at 9:50 PM Dennis Zhou <dennis@kernel.org> wrote:
> On Tue, Dec 14, 2021 at 09:12:06PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Dec 14, 2021 at 8:18 PM Dennis Zhou <dennis@kernel.org> wrote:
> > > On Tue, Dec 14, 2021 at 08:02:58PM +0100, Geert Uytterhoeven wrote:
> > > > On Tue, Dec 14, 2021 at 6:26 PM Dennis Zhou <dennis@kernel.org> wrote:
> > > > > On Tue, Dec 14, 2021 at 05:29:22PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > > > > > > On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > > > > > > > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> > > > > > > >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> > > > > > > >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> > > > > > > >>
> > > > > > > >> * may lead to broken build [1]
> > > > > > > >> * ...or not working runtime due to [2]
> > > > > > > >>
> > > > > > > >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> > > > > > > >> use percpu allocator on UP too") so restore that.
> > > > > > > >>
> > > > > > > >> [1]
> > > > > > > >> For ARM SMP+NOMMU (R-class cores)
> > > > > > > >>
> > > > > > > >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> > > > > > > >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> > > > > > > >>
> > > > > > > >> [2]
> > > > > > > >> static inline
> > > > > > > >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > > > > > >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> > > > > > > >> {
> > > > > > > >>        return -EINVAL;
> > > > > > > >> }
> > > > > > > >>
> > > > > > > >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >
> > > > > > > IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> > > > > >
> > > > > > I had seen the j-Core thread, but completely forgot about
> > > > > > Canaan K210 (RV64 SMP+NOMMU).
> > > > > >
> > > > > > This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
> > > > > > with NOMMU (either UP or SMP)").  And now booting K210 prints:
> > > > > >
> > > > > >     percpu: wasting 10 pages per chunk
> > > > > >
> > > > > > a) Is this bad?
> > > > >
> > > > > It's not great.. Can you share the line on boot with the following
> > > > > prefix: pcpu-alloc [1].
> > > >
> > > > There are no such lines.
> > > > "make mm/percpu.i mm/percpu.s" and inspecting the generated files,
> > > > and vmlinux, proves the code is there. But apparently it's not called.
> > > >
> > > > So there may be no issue on my system?
> > >
> > > I might be missing something, but that can't be right. Percpu calls
> > > pcpu_dump_alloc_info() from pcpu_setup_first_chunk() which is called by
> > > both embed/page first chunk code.
> > >
> > > Ummm. That can't be right. Percpu call pcpu_dump_alloc_info() from
> > > pcpu_setup_first_chunk() which everyone should call. On my machine:
> > >
> > > $ dmesg | grep "pcpu-alloc"
> > > [    0.065118] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152
> >
> > Doh, it wasn't printed to the console, due to KERN_DEBUG. Dmesg
> > does have it:
> >
> > <7>[    0.000000] pcpu-alloc: s15520 r0 d29536 u45056 alloc=11*4096
> > <7>[    0.000000] pcpu-alloc: [0] 0 [0] 1
> >
>
> I see, so what's happening is we're allocating 11 pages * 2, and due to
> percpu-km we round up to a contiguous 32 pages for backing pages. This
> results in the warning of wasting 10 pages. Given the size of the static
> region, I'm not too worried for now. I can't imagine the config would
> use that much percpu memory.
>
> We can massage the discrepancy for-v5.17. Basically in percpu-km, we
> align to 4k even though our allocation gets rounded up to the next power
> of 2. I don't have a lot of bandwidth right now, but I might be able to
> think about it over the next few weeks.

Note that K210 has only 8 MiB of SRAM, so wasting 10 pages means
wasting 0.5% of RAM.

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
