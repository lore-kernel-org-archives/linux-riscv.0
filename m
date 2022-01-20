Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB71C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k39AZhRXEjPAr7vtNPyVdeM6cD/4cGXaoWlk7cZEvZI=; b=ZyDl/SF+I371gp
	pWkXgVDVqaIq6+7DVNF01eRbKb4lEOMiubP2Ww5EYvcSdxiS0cjCHg5Wjkt4S5y7jGgEOofBmftza
	7tkpq2oTN3lgkjRpfmdmHoBdoC5atZ5YhxREaJU3pI819UUyoCuXRRZqyaMXgMIgXBXZdNzDDwK6r
	ndzc7Fz0ESLvtE7my0hbHvohdVY6XMF6y7Ra25Ygu0YSnt5NYBHroi6n9mxvHgCOTktOtxqhiNubm
	HuwzQJN+NnxzZvqwEUW9M0IUj5HAXqMyV+r1UGSsJ2K/hRujjPAwX2+Sq7bk1pyoQayv+rJthZKz1
	ZGFA3moIOIyn5za4Z3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUKT-00AUlo-JZ; Thu, 20 Jan 2022 10:06:05 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUKP-00AUeZ-MC
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 10:06:03 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D1FB840052
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642673157;
 bh=w26SyRlRb1I1H6K/gmJqzdX3K4fWh5zNRWtuBCu0Vhg=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=e6hXJ0IeM+a3TZvnftPzACQUC/BTo148mKyEaRzmMMatFoA204htx69CQOI3YB5OO
 sriUGwnpfgmuijm7iGKzVu9gsZXNszndfh7JcmME+dZHAkCqlJjY+s2SY/j8b0RfAM
 y5tigLyYcUgxXDLPupnKq/7rUCSt/dWuGzLB/VgcvHVAkGEV50ulXl+qUPlZvTqVW7
 Yih4CcfKH1m9RXvM5LhOQkubPZDw5xfyLw3jI+jFlwKAhqXqrlZZoPWTIIrs+REZVe
 y1OsmlSegpYeq51n6Z86bERKNT0XGQUqnsLme9MAbJtafug0lyRkA6CjzJjACCXmtq
 W6twBPcAijYVA==
Received: by mail-ed1-f69.google.com with SMTP id
 cf15-20020a0564020b8f00b0040284b671c6so5414370edb.22
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 02:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w26SyRlRb1I1H6K/gmJqzdX3K4fWh5zNRWtuBCu0Vhg=;
 b=LpOe0sNS3TcA3c53c4D+LG3sZotjhUCTrgZsS0i0thbgENt+dM+K1tEpi/v/MTUrKc
 2dQasPTEbTZZYy5HXlHogstBD0Mxjwrj6rLPt+27dCXW7M42ByYYkLwn5YUJwRhmoMpC
 QW2gheDNk0cfhnx+2bEt8o87p0htrAosCUlv2S2slkEEp2o/A2esYgP8Uxg/O5hCEgt9
 fmqJpufqMiRUFfhC44MxdHDk5f79hh+M2xadyms9crpzqgtuBvpIXFcEkcVR2fUavMNv
 OPHCrAbbD+fPdgWSoMwfxQyR4Uf3t+iLHQbBHl8r/P/g6lxMSoPmtbZPTzMSVF1/ybc2
 ilSw==
X-Gm-Message-State: AOAM533yBccQxoTB28IheUl2L5MRC7tp/5Maq48kRAiPQ7Gonv0RVzHL
 0akEp6vk+MnJk6V5ygMAgcn4/o8ct2mls1mqOL1ddDeyaexwkcbGEQJJsDMAo6kVphkpXZ8Iymv
 yDNRjYTqd9WF/GY7oEkkPPFLXqluGHRj2Bu+9k73/3PtYeK4TQejSS2Afd1sXBg==
X-Received: by 2002:a05:6402:b33:: with SMTP id
 bo19mr7643832edb.70.1642673157477; 
 Thu, 20 Jan 2022 02:05:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynv0ocn7NF6vgUdF1oJY52IvmBizAszTcAGapgjCakCzI58Vihpn2W5C5OjIWMX2LmXdeXWqskyns8624yTaM=
X-Received: by 2002:a05:6402:b33:: with SMTP id
 bo19mr7643811edb.70.1642673157166; 
 Thu, 20 Jan 2022 02:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
 <CA+zEjCuTSjOCmNExSN1jO50tsuXNzL9x6K6jWjG4+vVky5eWsw@mail.gmail.com>
In-Reply-To: <CA+zEjCuTSjOCmNExSN1jO50tsuXNzL9x6K6jWjG4+vVky5eWsw@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 20 Jan 2022 11:05:46 +0100
Message-ID: <CA+zEjCuTYmk-dLPhJ=9CkNrqf7VbCNyRDSZUGYkJSUWqZDWHpA@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 zong.li@sifive.com, anup@brainfault.org, Atish.Patra@rivosinc.com, 
 Christoph Hellwig <hch@lst.de>, ryabinin.a.a@gmail.com, glider@google.com, 
 andreyknvl@gmail.com, dvyukov@google.com, ardb@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, guoren@linux.alibaba.com,
 heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com, 
 panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org, 
 linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_020601_999021_BEF067EE 
X-CRM114-Status: GOOD (  43.67  )
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

On Thu, Jan 20, 2022 at 8:30 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
> > > * Please note notable changes in memory layouts and kasan population *
> > >
> > > This patchset allows to have a single kernel for sv39 and sv48 without
> > > being relocatable.
> > >
> > > The idea comes from Arnd Bergmann who suggested to do the same as x86,
> > > that is mapping the kernel to the end of the address space, which allows
> > > the kernel to be linked at the same address for both sv39 and sv48 and
> > > then does not require to be relocated at runtime.
> > >
> > > This implements sv48 support at runtime. The kernel will try to
> > > boot with 4-level page table and will fallback to 3-level if the HW does not
> > > support it. Folding the 4th level into a 3-level page table has almost no
> > > cost at runtime.
> > >
> > > Note that kasan region had to be moved to the end of the address space
> > > since its location must be known at compile-time and then be valid for
> > > both sv39 and sv48 (and sv57 that is coming).
> > >
> > > Tested on:
> > >   - qemu rv64 sv39: OK
> > >   - qemu rv64 sv48: OK
> > >   - qemu rv64 sv39 + kasan: OK
> > >   - qemu rv64 sv48 + kasan: OK
> > >   - qemu rv32: OK
> > >
> > > Changes in v3:
> > >   - Fix SZ_1T, thanks to Atish
> > >   - Fix warning create_pud_mapping, thanks to Atish
> > >   - Fix k210 nommu build, thanks to Atish
> > >   - Fix wrong rebase as noted by Samuel
> > >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
> > >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
> > >
> > > Changes in v2:
> > >   - Rebase onto for-next
> > >   - Fix KASAN
> > >   - Fix stack canary
> > >   - Get completely rid of MAXPHYSMEM configs
> > >   - Add documentation
> > >
> > > Alexandre Ghiti (13):
> > >   riscv: Move KASAN mapping next to the kernel mapping
> > >   riscv: Split early kasan mapping to prepare sv48 introduction
> > >   riscv: Introduce functions to switch pt_ops
> > >   riscv: Allow to dynamically define VA_BITS
> > >   riscv: Get rid of MAXPHYSMEM configs
> > >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
> > >   riscv: Implement sv48 support
> > >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
> > >   riscv: Explicit comment about user virtual address space size
> > >   riscv: Improve virtual kernel memory layout dump
> > >   Documentation: riscv: Add sv48 description to VM layout
> > >   riscv: Initialize thread pointer before calling C functions
> > >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
> > >
> > >  Documentation/riscv/vm-layout.rst             |  48 ++-
> > >  arch/riscv/Kconfig                            |  37 +-
> > >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
> > >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
> > >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
> > >  arch/riscv/include/asm/csr.h                  |   3 +-
> > >  arch/riscv/include/asm/fixmap.h               |   1
> > >  arch/riscv/include/asm/kasan.h                |  11 +-
> > >  arch/riscv/include/asm/page.h                 |  20 +-
> > >  arch/riscv/include/asm/pgalloc.h              |  40 ++
> > >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
> > >  arch/riscv/include/asm/pgtable.h              |  47 +-
> > >  arch/riscv/include/asm/sparsemem.h            |   6 +-
> > >  arch/riscv/kernel/cpu.c                       |  23 +-
> > >  arch/riscv/kernel/head.S                      |   4 +-
> > >  arch/riscv/mm/context.c                       |   4 +-
> > >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
> > >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
> > >  drivers/firmware/efi/libstub/efi-stub.c       |   2
> > >  drivers/pci/controller/pci-xgene.c            |   2 +-
> > >  include/asm-generic/pgalloc.h                 |  24 +-
> > >  include/linux/sizes.h                         |   1
> > >  22 files changed, 833 insertions(+), 209 deletions(-)
> >
> > Sorry this took a while.  This is on for-next, with a bit of juggling: a
> > handful of trivial fixes for configs that were failing to build/boot and
> > some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
> > it'd be easier to backport.  This is bigger than something I'd normally like to
> > take late in the cycle, but given there's a lot of cleanups, likely some fixes,
> > and it looks like folks have been testing this I'm just going to go with it.
> >
>
> Yes yes yes! That's fantastic news :)
>
> > Let me know if there's any issues with the merge, it was a bit hairy.
> > Probably best to just send along a fixup patch at this point.
>
> I'm going to take a look at that now, and I'll fix anything that comes
> up quickly :)

I see in for-next that you did not take the following patches:

  riscv: Improve virtual kernel memory layout dump
  Documentation: riscv: Add sv48 description to VM layout
  riscv: Initialize thread pointer before calling C functions
  riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN

I'm not sure this was your intention. If it was, I believe that at
least the first 2 patches are needed in this series, the 3rd one is a
useful fix and we can discuss the 4th if that's an issue for you.

I tested for-next on both sv39 and sv48 successfully, I took a glance
at the code and noticed you fixed the PTRS_PER_PGD error, thanks for
that. Otherwise nothing obvious has popped.

Thanks again,

Alex

>
> Thanks!
>
> Alex
>
> >
> > Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
