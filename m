Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895E6C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 09:44:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F4A20714
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 09:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUPS9CGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F4A20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DsGu+H6wKYTNH4k1i+OVORnk6TozICHb6JtlWIJa4N0=; b=UUPS9CGakquJAOHImCGICo3ly
	OEGVOalHhOGPLNLNFjywVpTVAevWimaKmkF8yzQUtiBSfCs/ZvlFDmSegh9NXXPnf/pfGJGSrmYYZ
	oaJCtJaNo6XrowD9SKKvMfxNeZHYavDWxyk1aUMCvg6ogLpEVb1I/EuyGxY3KbGk8d81ZNfy5AvH4
	f0B7M83Hty8lJTb1EGIPduMFH03T2jHgsqJSjST4EjeZWYK2z5S4qxCm/49o+pYmAzvhz0C6mbCnA
	42DWvwQA/Pwc1EtUD/KqVrTk6kTnVhYvkBaqTRnPJfBldiZKoa7rCuOlTEDP0qGQ+KCXzvStZHfXR
	TDJjsbxrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyBIR-0006he-Dw; Wed, 22 Jul 2020 09:44:19 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyBIO-0006g5-Nf
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 09:44:17 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M4bd0-1jzpim2KJi-001hI4 for <linux-riscv@lists.infradead.org>; Wed, 22
 Jul 2020 11:44:10 +0200
Received: by mail-qt1-f180.google.com with SMTP id g13so1330005qtv.8
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 02:44:08 -0700 (PDT)
X-Gm-Message-State: AOAM5300qJ6YPvalQW778HlYxwNXDOqiafTTv55eoC/PWGjbbPpKoGtt
 /MPiBEXSSE2rTAzlJfEL1BqapFpT2YcGjyt9kOA=
X-Google-Smtp-Source: ABdhPJxwkYMqqlMOkCtiDhkAnK0U1Z3J/eM92Y3pA2ZYfCjSxZxJC559Vt8UZd0LKulfbnhn81unz3J72RGNNuPEagQ=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr33522432qtq.304.1595411047084; 
 Wed, 22 Jul 2020 02:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Jul 2020 11:43:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
Message-ID: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Provags-ID: V03:K1:zbwgqOck5hK0P4NelU0NUh1x3C+lWioh7oZE+N5d4b4C/yL80WP
 4Wxvf8QfEB0ZWlT798LJnAU3GuzUbhjXECK12aeJvEEoO3YpI3R2LvpJNMKNkgf/E/Xv3Lv
 CIVvOXXGhz2QYv9lV9HRyi33/jvrwtv7N50cFlCLDVBzURPWjjnlQbvhtQ47ywDnXL8yQvf
 8lb/rKlb3oqagap2qXi2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q3tnOHwSvoE=:vYCH2uBkau4aoWToDWjTTS
 09qG/NBatxx/hJA8OWryhH0NzjHYgRODNqUdJNkS2x0AVaaY5yMAsEJwrpSBtBkAqISVvjLM6
 qbtkMT2BzceHEclRs585rJWrPvYJE+NR9heRHvUh/Dpta7nQfg//kr9a7z3kVfiRCMR3HgQ1i
 dv4+ER2b82fs70dsPz7T+vGNsl+5D0sjTdkUmWprI1JjfUT+4Jb08QmDw/JZ3Wb4Ud6IV4JNn
 qqTu5nbpNJ6gXfiyBHzzAc5Ck7r8DvhlrMP9nOZCQ+KwKNYwzyW5rXWuiHHo6hcV0/fJE/wL5
 n2l8LQzcyvkWv2Tw2oQTbULww51ZOmdIA9uBMrJ39POIrUyc8uwqMzJ+ULMLTC1YMmK05NrIX
 dKo3CqD9ukPqD2oN58ZdOIxSAtxYFVr1l4YngR9/kSTh0/BkPNZ4Q1w4+iiGUjfjt7MLL6u4i
 /rEoNTGSY6zJ/w+rgwZyxl7ix/HEV2Z0XgW6+3squVAoCcD6k4m58pdsLMh/B3G8XwL0kQJO1
 wkL6AzuqJ0sI8WHNs1lsDR9qubu8HXLVRz5PYfdPIxkLmjWmiBsGgZlX+8CnEqaMcZRFV6WdE
 TFRC4gnF++mhvkoG5uoRc9e8jM+CgR8LdJd2a9XDJPZdUncox11rxCo3kTxPAVmqmTdPhw2u6
 AGhweoJoNkCNRfuH5TmisVi8fzRODo457lzBaesTGolhMxSvFcV6kq6x804fzD9TzIP77XoUq
 Rl4cdgM4wr9u/SdrCMcuXdZutiC/FNCpR+qsyESvPqoB4x2QLeIyvqnFTP4dJEHPOpB6D4wvD
 fimoB23e4xTHRIrzYczNcWVMvZOtr6VjowENFuipUjPlnnEebXQzjTWIwwmbPjQmtSoUNoOkG
 4JBvxSBeHfhVLKwCteskIjmpTKwG6FvPdxiUMOG3PkwtPVk9U9WFp1MGSMv5eo2jo0+LXDiNU
 mNtIXxMlhC3sP3mZMSB1U8bW/cSHrGDNVWgbHfXbBtCj8TcKZU65E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_054417_002173_EEDAB9F7 
X-CRM114-Status: GOOD (  21.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <Atish.Patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 21 Jul 2020 11:36:10 PDT (-0700), alex@ghiti.fr wrote:
> > Let's try to make progress here: I add linux-mm in CC to get feedback on
> > this patch as it blocks sv48 support too.
>
> Sorry for being slow here.  I haven't replied because I hadn't really fleshed
> out the design yet, but just so everyone's on the same page my problems with
> this are:
>
> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.

There is actually an ongoing work to make 32-bit Arm kernels move
vmlinux into the vmalloc space, as part of the move to avoid highmem.

Overall, a 32-bit system would waste about 0.1% of its virtual address space
by having the kernel be located in both the linear map and the vmalloc area.
It's not zero, but not that bad either. With the typical split of 3072 MB user,
768MB linear and 256MB vmalloc, it's also around 1.5% of the available
vmalloc area (assuming a 4MB vmlinux in a typical 32-bit kernel), but the
boundaries can be changed arbitrarily if needed.

The eventual goal is to have a split of 3840MB for either user or linear map
plus and 256MB for vmalloc, including the kernel. Switching between linear
and user has a noticeable runtime overhead, but it relaxes both the limits
for user memory and lowmem, and it provides a somewhat stronger
address space isolation.

Another potential idea would be to completely randomize the physical
addresses underneath the kernel by using a random permutation of the
pages in the kernel image. This adds even more overhead (virt_to_phys
may need to call vmalloc_to_page or similar) and may cause problems
with DMA into kernel .data across page boundaries,

> * Sort out how to maintain a linear map as the canonical hole moves around
>   between the VA widths without adding a bunch of overhead to the virt2phys and
>   friends.  This is probably going to be the trickiest part, but I think if we
>   just change the page table code to essentially lie about VAs when an sv39
>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>   logical complexity involved, but it would remain fast.

I assume you can't use the trick that x86 has where all kernel addresses
are at the top of the 64-bit address space and user addresses are at the
bottom, regardless of the size of the page tables?

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
