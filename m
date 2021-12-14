Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB9FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhhrHwlJfpyzNOaWprLEudaaSut68k1nR7UOhEqDA/M=; b=xtEBb3O0rufhrq
	sCsQN89JhHG8FuoH2lE3UvelTx6HkpoylFl3wAcBW3vDYsdR+h8pl69jdE/YyzWsqjx8Ulo0uaiV2
	33Au8xYmrJvp/f2uuTKHy6WPsulqb4fhrGJtU0uy/lfYWtptc8DaOzoDoMKRu0RnSp14pC6tx7anv
	yuIzWLRnuEXewCrmmLuY6PtWrNJH/mfIxgjwvyM5vtERs7qmJo4ll1Fkpem+0LXuTrRjhN1jJdM+N
	qcXrSx0qh9yDwtGsxpc+BSIAQ8kcNTFNyxX55JfvKr5G0btNYLv5wgQO7OsRx556gCDy+6mLFiAJq
	pQQ7MityAwx552NLGzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAh0-00Esx8-JQ; Tue, 14 Dec 2021 16:30:18 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgK-00EsSo-TL
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:38 +0000
Received: by mail-ua1-f47.google.com with SMTP id 30so35765107uag.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0xPmlhPjW3RtYDngHEC29o7z6qnlBksN4ygOpY9H1s=;
 b=BJg/BAi/k+qNf1FsCotgx+aNHJLn1kYRTvHitykcTfXQZa4pQhPUrnA6qYCn4ZAfU4
 PH+L3YsfOsYYj1SXpZRiWS74JHWU2RCVN/O0FM8oRorFqpJQem/yozNtZTjNYOVJJauS
 9/udSI4sN4rmoi1V88LXLD5mbLM9MlnD1AIyppWOxXgQol5CqV4qAxVPMVju6YiEmp8l
 otIn2p+piQNyZpGDnip1jUexc7RzcKZfkx6JRcmAsz0NtUfHT1WfZhHjq9EP5je0+mnF
 ujWsFEPYk+5nBWHBG5h6chC/yQ3U2MtoRLkhV03Pvu2QVb/rbUi6Rqfc4E9InqhhAPxL
 KCnA==
X-Gm-Message-State: AOAM532mRyrQ4JQIBl3fYSWHYwpSAsw8QiKGU+7ozqbjd4cyQbD+31BW
 Axug0Xl3V1ZTnPVvIvyp4kcbEx901mu33Q==
X-Google-Smtp-Source: ABdhPJwZaGPBWLiv2PzUPi8HFYS4ZIRyE/W5htBThqbiWszHLG4YuIAnNJ46yaEutZ4qZmYMt6rkkQ==
X-Received: by 2002:a05:6102:3748:: with SMTP id
 u8mr6078607vst.48.1639499374905; 
 Tue, 14 Dec 2021 08:29:34 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id o188sm43675vko.48.2021.12.14.08.29.34
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 08:29:34 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id 30so35764977uag.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:34 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr6178703vsg.57.1639499373849; 
 Tue, 14 Dec 2021 08:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
In-Reply-To: <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Dec 2021 17:29:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
Message-ID: <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
To: Vladimir Murzin <vladimir.murzin@arm.com>, Dennis Zhou <dennis@kernel.org>
Cc: linux-arch-owner@vger.kernel.org, Linux MM <linux-mm@kvack.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux-sh list <linux-sh@vger.kernel.org>, Rich Felker <dalias@libc.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082936_989689_827D1E7C 
X-CRM114-Status: GOOD (  36.94  )
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

Hi Vladimir and Dennis,

On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> >>
> >> * may lead to broken build [1]
> >> * ...or not working runtime due to [2]
> >>
> >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> >> use percpu allocator on UP too") so restore that.
> >>
> >> [1]
> >> For ARM SMP+NOMMU (R-class cores)
> >>
> >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> >>
> >> [2]
> >> static inline
> >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> >> {
> >>        return -EINVAL;
> >> }
> >>
> >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >> ---
> >>  mm/Kconfig | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/mm/Kconfig b/mm/Kconfig
> >> index d16ba92..66331e0 100644
> >> --- a/mm/Kconfig
> >> +++ b/mm/Kconfig
> >> @@ -425,9 +425,8 @@ config THP_SWAP
> >>  # UP and nommu archs use km based percpu allocator
> >>  #
> >>  config NEED_PER_CPU_KM
> >> -    depends on !SMP
> >>      bool
> >> -    default y
> >> +    default !SMP || !MMU
> >>
> >
> > Should this be `depends on !SMP || !MMU` with default yes? Because with
> > SMP && MMU, it shouldn't be an option to run with percpu-km.
>
> IIUC these are equivalent, truth table would not change if is under "depends"
> or "default"
>
> SMP    MMU   NEED_PER_CPU_KM
>  y      y    !y || !y => n || n => n
>  y      n    !y || !n => n || y => y
>  n      y    !n || !y => y || n => y
>  n      n    !n || !n => y || y => y
>
> >
> >>  config CLEANCACHE
> >>      bool "Enable cleancache driver to cache clean pages if tmem is present"
> >> --
> >> 2.7.4
> >>
> >
> > It's interesting to me that this is all coming up at once. Earlier this
> > month I had the same conversation with people involved with sh [1].
> >
> > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> >
> > I can pull this shortly once I see whatever happened to linux-sh.
>
> Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
> to the same conclusion, right?
>
> IIRC, RISC-V also have SMP+NOMMU, so adding them as well.

I had seen the j-Core thread, but completely forgot about
Canaan K210 (RV64 SMP+NOMMU).

This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
with NOMMU (either UP or SMP)").  And now booting K210 prints:

    percpu: wasting 10 pages per chunk

a) Is this bad?
b) What exactly was this fixing, and how would I trigger the bad case
   on K210 before, if it was affected at all?

>
> [0] https://lore.kernel.org/linux-mm/20211130172954.129587-1-vladimir.murzin@arm.com/T/

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
