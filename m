Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDA1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 19:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgmUOW9/AcneH4qubX4U0YnEYuXneQlzG6r2wa13EA4=; b=L/Gnn3bLaqGfoZ
	7PYtUdSm/X96UrY44hsOGFvLfbSSShz2ExVXyZ3SnPVOvWfZXCEHKHoGZX44L1+drnxMOBy4QYrPs
	EAHJHwJP9AaxM5C9lxcS+ucLJrD8wuHqOP6p1xFb52q7pV/Wmzu5lDPgkLfE06dflT/eZIIT4YbGS
	8/xcLoRtwbpYYHGAm31vZATbR5dcofeKfFPnGJbpmdg+qaHrnSiHFh1aRrbkJljEtni6lZsjdspG9
	SLDijqgvHBmzwzuixnZClDtR5wqgwnFN/G0xyvZdcGXqywJqhNOWALVPBrPzNzD8eMWnDN3XtTGJR
	EtONf2BaC36z2WK6cDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxDKD-00FZ6G-7l; Tue, 14 Dec 2021 19:18:57 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxDK9-00FZ3t-Kh
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 19:18:55 +0000
Received: by mail-qk1-f174.google.com with SMTP id t83so17764464qke.8
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 11:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BaXGBCGBcGqTCMAmSb0as25EqSAWYNufkPLYrrLvOxw=;
 b=z254enTPIQBNKYrCmzJ9TP7Xn7cy9GvjcJ5UUurLBIBu0ceRzK2CefCsbd8sWJhVQg
 BqDQOR4A+cVfgKLdVM8Bpm08RyY3jRYOgDtK6w+G1wV1jb684r+xWqsDXpKccVfBx1LM
 w3LuKVPeOv76H74MAWAvInCJpnRCSNVA3S2qIUbrE4JDTHR99EFsI+d5BC6a0Z09XN+Z
 OlksbhXE+W0hQtqsIC2dlTOfcHU7NA+CRclkGV2kbuuuSiq3ZeEfCbdX/H3ijQo8TW3h
 v3YlthtqFm3J1Ex5q7v01Y+gfmluV8JzebBKtM7KO+Sn+/FLYCxRof3b07okFSadwvCe
 M77A==
X-Gm-Message-State: AOAM5314Pc3mA04gAzS3wvSdgdA2eCw8mSDoBCjA4tmA0tlLU2yuxLAU
 ucl50VRbmiMiSrMJdnOgRSKyBb0f9dmFtw==
X-Google-Smtp-Source: ABdhPJxVzvHkXdefdTuTtJAd2af6hQNU212fU0bpmZLjXZCv4ebfoi6zPlSo5urhNM95cc09zFH/bw==
X-Received: by 2002:a05:620a:17a9:: with SMTP id
 ay41mr5798000qkb.280.1639509532463; 
 Tue, 14 Dec 2021 11:18:52 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id w9sm497119qko.71.2021.12.14.11.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 11:18:51 -0800 (PST)
Date: Tue, 14 Dec 2021 14:18:50 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arch-owner@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
Message-ID: <YbjuGhPTjuTCSu+m@fedora>
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com>
 <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
 <CAMuHMdXA73EuFC6e-pEz1Ovc9ySNk-mt-6O0L7KbO28PvqratA@mail.gmail.com>
 <YbjTuOhNxaPirK1L@fedora>
 <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUaLTbS_20t7jfPkkHqYV=9JNQf-XQ80UppZcrHGOoTfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_111853_727879_0582E553 
X-CRM114-Status: GOOD (  40.13  )
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

On Tue, Dec 14, 2021 at 08:02:58PM +0100, Geert Uytterhoeven wrote:
> Hi Dennis,
> 
> On Tue, Dec 14, 2021 at 6:26 PM Dennis Zhou <dennis@kernel.org> wrote:
> > On Tue, Dec 14, 2021 at 05:29:22PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Dec 1, 2021 at 12:53 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > > > On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > > > > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> > > > >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> > > > >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> > > > >>
> > > > >> * may lead to broken build [1]
> > > > >> * ...or not working runtime due to [2]
> > > > >>
> > > > >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> > > > >> use percpu allocator on UP too") so restore that.
> > > > >>
> > > > >> [1]
> > > > >> For ARM SMP+NOMMU (R-class cores)
> > > > >>
> > > > >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> > > > >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> > > > >>
> > > > >> [2]
> > > > >> static inline
> > > > >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > > >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> > > > >> {
> > > > >>        return -EINVAL;
> > > > >> }
> > > > >>
> > > > >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> > > > >> ---
> > > > >>  mm/Kconfig | 3 +--
> > > > >>  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >>
> > > > >> diff --git a/mm/Kconfig b/mm/Kconfig
> > > > >> index d16ba92..66331e0 100644
> > > > >> --- a/mm/Kconfig
> > > > >> +++ b/mm/Kconfig
> > > > >> @@ -425,9 +425,8 @@ config THP_SWAP
> > > > >>  # UP and nommu archs use km based percpu allocator
> > > > >>  #
> > > > >>  config NEED_PER_CPU_KM
> > > > >> -    depends on !SMP
> > > > >>      bool
> > > > >> -    default y
> > > > >> +    default !SMP || !MMU
> > > > >>
> > > > >
> > > > > Should this be `depends on !SMP || !MMU` with default yes? Because with
> > > > > SMP && MMU, it shouldn't be an option to run with percpu-km.
> > > >
> > > > IIUC these are equivalent, truth table would not change if is under "depends"
> > > > or "default"
> > > >
> > > > SMP    MMU   NEED_PER_CPU_KM
> > > >  y      y    !y || !y => n || n => n
> > > >  y      n    !y || !n => n || y => y
> > > >  n      y    !n || !y => y || n => y
> > > >  n      n    !n || !n => y || y => y
> > > >
> > > > >
> > > > >>  config CLEANCACHE
> > > > >>      bool "Enable cleancache driver to cache clean pages if tmem is present"
> > > > >> --
> > > > >> 2.7.4
> > > > >>
> > > > >
> > > > > It's interesting to me that this is all coming up at once. Earlier this
> > > > > month I had the same conversation with people involved with sh [1].
> > > > >
> > > > > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> > > > >
> > > > > I can pull this shortly once I see whatever happened to linux-sh.
> > > >
> > > > Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
> > > > to the same conclusion, right?
> > > >
> > > > IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> > >
> > > I had seen the j-Core thread, but completely forgot about
> > > Canaan K210 (RV64 SMP+NOMMU).
> > >
> > > This became commit 3583521aabac76e5 ("percpu: km: ensure it is used
> > > with NOMMU (either UP or SMP)").  And now booting K210 prints:
> > >
> > >     percpu: wasting 10 pages per chunk
> > >
> > > a) Is this bad?
> >
> > It's not great.. Can you share the line on boot with the following
> > prefix: pcpu-alloc [1].
> 
> There are no such lines.
> "make mm/percpu.i mm/percpu.s" and inspecting the generated files,
> and vmlinux, proves the code is there. But apparently it's not called.
> 
> So there may be no issue on my system?
> 

I might be missing something, but that can't be right. Percpu calls
pcpu_dump_alloc_info() from pcpu_setup_first_chunk() which is called by
both embed/page first chunk code.

Ummm. That can't be right. Percpu call pcpu_dump_alloc_info() from
pcpu_setup_first_chunk() which everyone should call. On my machine:

$ dmesg | grep "pcpu-alloc"
[    0.065118] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
