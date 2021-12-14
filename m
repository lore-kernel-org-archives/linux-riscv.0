Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6983DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 20:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wSymchaEbbjDlr0dxscxI9IHWNY8ACPdvGa5VAD+8w=; b=R2HkwhD5mPgK+v
	08dMV50GBXmBmIPzdf6AdzpSQDA1K5hc8kIgGN/EDkS4bkizIqthgKYEeVPiGpZ42v1QcBRi8FV8N
	qfQbgdK9VuEhB3h+pPemd8LqhQdKJVbQ81ruEWXfa1BbZxlzVH17Zsi0L7Nc+PqCkb4tYDGTjxLVC
	VPi2PmscERyibQg90Pox8FSvMBv/M8FPc6WRZlMI36geeFSrzApI1/xAHQJsmzBNtCXfEXnU+0VGE
	M9anOuxntni+ELz3v9y7COOGlVyhxX4tN4cYR8pV6PXchmj5tZJGrpdaYdCGKurX+65CEl4Qn03ax
	dwL9f4OGukNMfamNnHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxE9w-00FitO-9U; Tue, 14 Dec 2021 20:12:24 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxE9s-00FisP-Qm
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 20:12:22 +0000
Received: by mail-ua1-f41.google.com with SMTP id o1so36940532uap.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 12:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+mb+oH7+4rpXpD/Z6lXjKtCNpCU2szRv7YE142Zc5o=;
 b=m5U9xvWl9HwsR+mGfavKGK01tzM4oSmhUwqBFqXuS3NSqAKcgXBNGhPMM97aUPL2m8
 c4Foay9bsbPWvlpMOKsgJwB11kIwhoCRMn1CwG+xTQUtY5Lue3W/8H3pGh1h14XuFETU
 PMqGJCJGpP2ZVsDfPywqQvlahXBjVdnYQG6NYq1G51Br0ggfoJiPbNEoiuTGRDQhdK0a
 xESZVwmVfxcb27RbWOFyKVoRDOvW3rW9S8Fkm1eMhy1aDnNNSaf2T9MP6QpMGHrUaZVk
 0Gu12RCvQKIyId2FsOlnLi8gKQrjj4YbDuSXoCk5v77x5VOQKucgAJM3jXFPj5X/9OHY
 G8pw==
X-Gm-Message-State: AOAM531Qm4c2Bc0AJxoqwUz8GFc/xCfzqc5a0Gj6aj6JRhuo8NdN6kBR
 jBqsG/jJaPO6JatSc6o2DN9puxBMgwh/HA==
X-Google-Smtp-Source: ABdhPJyT+liXKdYh6sBUzUC8th3ilsXw/NV04RudtVQhQQh/W70CGPq/9A5bNq8twajloECTrphYVA==
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr1338737vst.38.1639512739091; 
 Tue, 14 Dec 2021 12:12:19 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id b10sm204990uad.8.2021.12.14.12.12.18
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:12:18 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id o1so36940403uap.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 12:12:18 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr1300775vst.5.1639512737845; 
 Tue, 14 Dec 2021 12:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
 <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
 <YbjTuOhNxaPirK1L@fedora>
 <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
 <YbjuGhPTjuTCSu+m@fedora>
In-Reply-To: <YbjuGhPTjuTCSu+m@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Dec 2021 21:12:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8Besfp3Pbj1tRJ4gKKUbR59pU1ACuUNnn4RXkgVo5Qw@mail.gmail.com>
Message-ID: <CAMuHMdW8Besfp3Pbj1tRJ4gKKUbR59pU1ACuUNnn4RXkgVo5Qw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211214_121220_894550_DBCF4160 
X-CRM114-Status: GOOD (  37.90  )
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

On Tue, Dec 14, 2021 at 8:18 PM Dennis Zhou <dennis@kernel.org> wrote:
> On Tue, Dec 14, 2021 at 08:02:58PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Dec 14, 2021 at 6:26 PM Dennis Zhou <dennis@kernel.org> wrote:
> > > On Tue, Dec 14, 2021 at 05:29:22PM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > > > > On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > > > > > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> > > > > >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> > > > > >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> > > > > >>
> > > > > >> * may lead to broken build [1]
> > > > > >> * ...or not working runtime due to [2]
> > > > > >>
> > > > > >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> > > > > >> use percpu allocator on UP too") so restore that.
> > > > > >>
> > > > > >> [1]
> > > > > >> For ARM SMP+NOMMU (R-class cores)
> > > > > >>
> > > > > >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> > > > > >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> > > > > >>
> > > > > >> [2]
> > > > > >> static inline
> > > > > >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > > > >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> > > > > >> {
> > > > > >>        return -EINVAL;
> > > > > >> }
> > > > > >>
> > > > > >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>

> > > > > IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> > > >
> > > > I had seen the j-Core thread, but completely forgot about
> > > > Canaan K210 (RV64 SMP+NOMMU).
> > > >
> > > > This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
> > > > with NOMMU (either UP or SMP)").  And now booting K210 prints:
> > > >
> > > >     percpu: wasting 10 pages per chunk
> > > >
> > > > a) Is this bad?
> > >
> > > It's not great.. Can you share the line on boot with the following
> > > prefix: pcpu-alloc [1].
> >
> > There are no such lines.
> > "make mm/percpu.i mm/percpu.s" and inspecting the generated files,
> > and vmlinux, proves the code is there. But apparently it's not called.
> >
> > So there may be no issue on my system?
>
> I might be missing something, but that can't be right. Percpu calls
> pcpu_dump_alloc_info() from pcpu_setup_first_chunk() which is called by
> both embed/page first chunk code.
>
> Ummm. That can't be right. Percpu call pcpu_dump_alloc_info() from
> pcpu_setup_first_chunk() which everyone should call. On my machine:
>
> $ dmesg | grep "pcpu-alloc"
> [    0.065118] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152

Doh, it wasn't printed to the console, due to KERN_DEBUG. Dmesg
does have it:

<7>[    0.000000] pcpu-alloc: s15520 r0 d29536 u45056 alloc=11*4096
<7>[    0.000000] pcpu-alloc: [0] 0 [0] 1

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
