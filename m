Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA54BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Unoep8TxlpsyRaYv2UP5eGGhUQo0gMRpnSCkk/V9hmE=; b=YD0w4OXWsCJfA2
	5VBmH99GGHNt3PQR90zSN1SH7ybwOwz3MmDSO370HqBJoEWCGJIo6JZQqCqGl0RbidZt1Am2zIEzA
	DRivCsCmpxWDVCFmjFqp0ECzT+xzoVYKDx17hQuzewIlNw02luE5RRW37h0n8miVge3GAiNCFiaaz
	wq4qfl/aOcb7ITOiCEn9gFO9WU757XiTy3Vx4vdp0jt7akfN6DYGmyEXmqLQ7BdfB6yp2WktXUUNV
	d40kb3vTaS0PT4YXKBTgtB8CDg5URyJX1maiK0ekwIvgzgEcKweXoLTlfradfOE/W194G+YHtXNTB
	UJVSuCzuUllxae+1xUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxD5G-00FUgo-Jg; Tue, 14 Dec 2021 19:03:30 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxD52-00FUdd-Lx
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 19:03:18 +0000
Received: by mail-ua1-f46.google.com with SMTP id t13so36573956uad.9
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 11:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQOtmTw19Qz+cRCih9T5sdKR1tGH5OnUCCIrsQi5CfA=;
 b=Xa/4nkoL13uF+oe7NAZDF9WiRVADgNfOM0zUhMJlvm8V8EFc3A173N5w2RGZY7fhQ4
 qET3u4LjJTHjnkkOZ6SzTMLpk8+zXdGqVP49+H8f6iPW7HNfWN5pPexNcyHwOYX3wxk9
 PyCpucVnhA5I91Ll5fglToub4kD3DIsdhWuYk3ff/OBvSfcBhXgBKjNxnRFX+Jd104+u
 HR50sILyBJ23KFraL8qywRQWWv/6uK8lwxuit7gj8OUs/sNi59gSi636BhhjkhuWxMXG
 sk6BQKm4bC04dxLk3dT8DjUiK8+ZUOaC99HxXsSceEEy+KzGrTcDoLBcEOmT5jlMsaYI
 JKlA==
X-Gm-Message-State: AOAM533cKv2ffIqIB4+YKXKJ1JGuJYbtYmN7r3ge8ltY2KlH6VBE3REQ
 jyCmKHXxAeQLuwM7L6//LX/bskCCL7KhLQ==
X-Google-Smtp-Source: ABdhPJw1l4+g1JMqBej4/luYqId6dDiFKb5SsdPleQ4Q3LjIVSU6PBVMUAByyb1dd5JyfigTwqxcEQ==
X-Received: by 2002:a67:c402:: with SMTP id c2mr811978vsk.53.1639508591690;
 Tue, 14 Dec 2021 11:03:11 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id b10sm165310uad.8.2021.12.14.11.03.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:03:10 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id o1so36611759uap.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 11:03:10 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr859450vsf.38.1639508590267; 
 Tue, 14 Dec 2021 11:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
 <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
 <YbjTuOhNxaPirK1L@fedora>
In-Reply-To: <YbjTuOhNxaPirK1L@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Dec 2021 20:02:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
Message-ID: <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211214_110316_768624_C40FD1E5 
X-CRM114-Status: GOOD (  44.48  )
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

On Tue, Dec 14, 2021 at 6:26 PM Dennis Zhou <dennis@kernel.org> wrote:
> On Tue, Dec 14, 2021 at 05:29:22PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > > On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > > > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> > > >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> > > >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> > > >>
> > > >> * may lead to broken build [1]
> > > >> * ...or not working runtime due to [2]
> > > >>
> > > >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> > > >> use percpu allocator on UP too") so restore that.
> > > >>
> > > >> [1]
> > > >> For ARM SMP+NOMMU (R-class cores)
> > > >>
> > > >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> > > >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> > > >>
> > > >> [2]
> > > >> static inline
> > > >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> > > >> {
> > > >>        return -EINVAL;
> > > >> }
> > > >>
> > > >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> > > >> ---
> > > >>  mm/Kconfig | 3 +--
> > > >>  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/mm/Kconfig b/mm/Kconfig
> > > >> index d16ba92..66331e0 100644
> > > >> --- a/mm/Kconfig
> > > >> +++ b/mm/Kconfig
> > > >> @@ -425,9 +425,8 @@ config THP_SWAP
> > > >>  # UP and nommu archs use km based percpu allocator
> > > >>  #
> > > >>  config NEED_PER_CPU_KM
> > > >> -    depends on !SMP
> > > >>      bool
> > > >> -    default y
> > > >> +    default !SMP || !MMU
> > > >>
> > > >
> > > > Should this be `depends on !SMP || !MMU` with default yes? Because with
> > > > SMP && MMU, it shouldn't be an option to run with percpu-km.
> > >
> > > IIUC these are equivalent, truth table would not change if is under "depends"
> > > or "default"
> > >
> > > SMP    MMU   NEED_PER_CPU_KM
> > >  y      y    !y || !y => n || n => n
> > >  y      n    !y || !n => n || y => y
> > >  n      y    !n || !y => y || n => y
> > >  n      n    !n || !n => y || y => y
> > >
> > > >
> > > >>  config CLEANCACHE
> > > >>      bool "Enable cleancache driver to cache clean pages if tmem is present"
> > > >> --
> > > >> 2.7.4
> > > >>
> > > >
> > > > It's interesting to me that this is all coming up at once. Earlier this
> > > > month I had the same conversation with people involved with sh [1].
> > > >
> > > > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> > > >
> > > > I can pull this shortly once I see whatever happened to linux-sh.
> > >
> > > Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
> > > to the same conclusion, right?
> > >
> > > IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> >
> > I had seen the j-Core thread, but completely forgot about
> > Canaan K210 (RV64 SMP+NOMMU).
> >
> > This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
> > with NOMMU (either UP or SMP)").  And now booting K210 prints:
> >
> >     percpu: wasting 10 pages per chunk
> >
> > a) Is this bad?
>
> It's not great.. Can you share the line on boot with the following
> prefix: pcpu-alloc [1].

There are no such lines.
"make mm/percpu.i mm/percpu.s" and inspecting the generated files,
and vmlinux, proves the code is there. But apparently it's not called.

So there may be no issue on my system?

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
