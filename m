Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995E6C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 12:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 645706135A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 12:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 645706135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOnn245w2Dn8IHliMDestNWJ7DGBlKIisu6mMg6E/1I=; b=dD5jteeKbOzg2D
	mX9tOflhtaT4J8+gYrJDwEmYovy7bkHKtvszWodf+6Hku4qxrXocaGiqGeL/9RGAew8RSzBHBZz1V
	cWZaNb/wu1+0lxCAFuToPMQCM1EVrfmupCatH2FBzYiOkJgUa7uQKaut1OcOloRjV8tnjXQYi4Doa
	fQQs+4T7MYIsrkUF62UtVzyPvINSluf3H1npx5D9goGZhPq1WxtbfJT5ee7A9v6Pm+cVPLtk95CyY
	a8+B/P+nqkKWealJAPy4oabLTAtcBCSMTPCwm/9hqeL1Af1m6IbKsnNDTxZA/RhPvw4pBaLrqoJsc
	8CjKC148dWoAGdn4FcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqb1m-008PtG-E1; Tue, 08 Jun 2021 12:40:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqaoS-008KpW-Jb
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 12:26:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26ACB61380
 for <linux-riscv@lists.infradead.org>; Tue,  8 Jun 2021 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623155192;
 bh=e6s8cO1ISj6lKBC8+3DfDYY00tPC0kXCuG/keVJA5jA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CTu8HNOZzMz+7Bd4q+KRyDEFY7gH9sgOi6z8pERpBdyBv2rp/bbVZshbGt5LQnqd4
 LlpcROpljZdbRIsMAGFT02O0z8ehfaKKRXJy0dppRxw1n/UeBoF5dYD21hDHHwbsW8
 qDvz2QPRDJvpPHNeR0HwLBIW0QloPrGZuck96tq/3qt3b1QVP5kgjRBb1FoJGHJFNF
 vTVsWXLgojPpg6EBNQ153ZZb3AbkABjdYRdjxeLG6wm5CD/+/V97GtZqOH656WCIl4
 Jb+6JFeH7HfvuDqmq+1l2VDkMLMHnfL+Ex03qN74DW7+IPsExMSqp3sngXhRU7qfyn
 erFMVLonB179A==
Received: by mail-lf1-f52.google.com with SMTP id p17so31002298lfc.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 05:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM530iQR4ekvmZoBKY3kA6cykBquMZaD28vFYbx6WORBsYw5V/Wv3L
 9cstUYzGkOzBmVdYTGjx5KXotk1RyGFQEciw3jw=
X-Google-Smtp-Source: ABdhPJx9LVmTOA+e4iVzMds6VyARO5QX45SwldNGn6Xz0gO+b07geBI9xYKaUGCeTZbaOGISqs4msqGe9wlUcqps78g=
X-Received: by 2002:ac2:5389:: with SMTP id g9mr14518552lfh.557.1623155190107; 
 Tue, 08 Jun 2021 05:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTTpurWpPUcA2JkF0rOFztKQgFBhOF9zQyuyi_-sxszhRQ@mail.gmail.com>
 <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
In-Reply-To: <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Jun 2021 20:26:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTShdNnunH26A5GAD6qjbdQzdwi6guC7KVzjQ2LOfQsiSg@mail.gmail.com>
Message-ID: <CAJF2gTShdNnunH26A5GAD6qjbdQzdwi6guC7KVzjQ2LOfQsiSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Anup Patel <Anup.Patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, 
 Drew Fustini <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_052632_739428_B86308CC 
X-CRM114-Status: GOOD (  67.20  )
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

On Sat, Jun 5, 2021 at 12:12 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 04 Jun 2021 07:47:22 PDT (-0700), guoren@kernel.org wrote:
> > Hi Arnd & Palmer,
> >
> > Sorry for the delayed reply, I'm working on the next version of the patch.
> >
> > On Fri, Jun 4, 2021 at 5:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Thu, Jun 3, 2021 at 5:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> > On Wed, 02 Jun 2021 23:00:29 PDT (-0700), Anup Patel wrote:
> >> > >> This implementation, which adds some Kconfig entries that control page table
> >> > >> bits, definately isn't suitable for upstream.  Allowing users to set arbitrary
> >> > >> page table bits will eventually conflict with the standard, and is just going to
> >> > >> be a mess.  It'll also lead to kernels that are only compatible with specific
> >> > >> designs, which we're trying very hard to avoid.  At a bare minimum we'll need
> >> > >> some way to detect systems with these page table bits before setting them,
> >> > >> and some description of what the bits actually do so we can reason about
> >> > >> them.
> >> > >
> >> > > Yes, vendor specific Kconfig options are strict NO NO. We can't give-up the
> >> > > goal of unified kernel image for all platforms.
> > Okay,  Agree. Please help review the next version of the patch.
> >
> >> >
> >> > I think this is just a phrasing issue, but just to be sure:
> >> >
> >> > IMO it's not that they're vendor-specific Kconfig options, it's that
> >> > turning them on will conflict with standard systems (and other vendors).
> >> > We've already got the ability to select sets of Kconfig settings that
> >> > will only boot on one vendor's system, which is fine, as long as there
> >> > remains a set of Kconfig settings that will boot on all systems.
> >> >
> >> > An example here would be the errata: every system has errata of some
> >> > sort, so if we start flipping off various vendor's errata Kconfigs
> >> > you'll end up with kernels that only function properly on some systems.
> >> > That's fine with me, as long as it's possible to turn on all vendor's
> >> > errata Kconfigs at the same time and the resulting kernel functions
> >> > correctly on all systems.
> >>
> >> Yes, this is generally the goal, and it would be great to have that
> >> working in a way where a 'defconfig' build just turns on all the options
> >> that are needed to use any SoC specific features and drivers while
> >> still working on all hardware. There are however limits you may run
> >> into at some point, and other architectures usually only manage to span
> >> some 10 to 15 years of hardware implementations with a single
> >> kernel before it get really hard.
> > I could follow the goal in the next version of the patchset. Please
> > help review, thx.
>
> IMO we're essentially here now with the RISC-V stuff: defconfig flips on
> everything necesasry to boot normal-smelling SOCs, with everything being
> detected as the system boots.  We have some wacky configurations like
> !MMU and XIP that are coupled to the hardware, but (and sorry for
> crossing the other threads, I missed your pointer as it's early here) as
> I said in the other thread it might be time to make it explicit that
> those things are non-portable.
>
> The hope here has always been that we'd have enough in the standards
> that we could avoid a proliferation of vendor-specific code.  We've
> always put a strong "things keep working forever" stake in the ground in
> RISC-V land, but that's largely been because we were counting on the
> standards existing that make support easy.  In practice we don't have
> those standards so we're ending up with a fairly large software base
> that is required to support everything.  We don't have all that much
> hardware right now so we'll have to see how it goes, but for now I'm in
> favor of keeping defconfig as a "boots on everything" sort of setup --
> both because it makes life easier for users, and because it makes issues
> like the non-portable Kconfigs that showed up here quite explicit.
I reuse the Image header to pass vendor magic to init PTE attributes'
variable before setup_vm. Can you give me some feedback on that patch?
https://lore.kernel.org/linux-riscv/1622970249-50770-9-git-send-email-guoren@kernel.org/T/#mdc0dacba57346b5ac59a01961495c132b93cfcdb

>
> If we get to 10/15 years of hardware then I'm sure we'll be removing old
> systems from defconfig (or maybe even the kernel entirely, a lot of this
> stuff isn't in production).  I'm just hoping we make it that far ;)
>
> >> To give some common examples that make it break down:
> >>
> >> - 32-bit vs 64-bit already violates that rule on risc-v (as it does on
> >>   most other architectures)
>
> Yes, and there's no way around that on RISC-V.  They're different base
> ISAs therefor re-define the same instructions, so we're essentially at
> two kernel binaries by that point.  The platform spec says rv64gc, so we
> can kind of punt on this one for now.  If rv32 hardware shows up
> we'll probably want a standard system there too, which is why we've
> avoided coupling kernel portability to XLEN.
>
> >> - architectures that support both big-endian and little-endian kernels
> >>   tend to have platforms that require one or the other (e.g. mips,
> >>   though not arm). Not an issue for you.
>
> It is now!  We've added big-endian to RISC-V.  There's no hardware yet
> and very little software support.  IMO the right answer is to ban that
> from the platform spec, but again it'll depnd on what vendors want to
> build (though anyone is listening, please don't make my life miserable
> ;)).
>
> >> - page table formats are the main cause of incompatibility: arm32
> >>   and x86-32 require three-level tables for certain features, but those
> >>   are incompatible with older cores, arm64 supports three different
> >>   page sizes, but none of them works on all cores (4KB almost works
> >>   everywhere).
>
> We actually have some support on the works for multiple page table
> levels in a single binary, which should help with a lot of that
> incompatibility.  I don't know of any plans to couple other page table
> features to the number of levels, though.
>
> >> - SMP-enabled ARMv7 kernels can be configured to run on either
> >>   ARMv6 or ARMv8, but not both, in this case because of incompatible
> >>   barrier instructions.
>
> Our barriers aren't quite split the same way, but we do have two memory
> models (RVWMO and TSO).  IIUC we should be able to support both in the
> same kernels with some patching, but the resulting kernels would be
> biased towards one memory models over the other WRT performance.  Again,
> we'll have to see what the vendors do and I'm hoping we don't end up
> with too many headaches.
>
> >> - 32-bit Arm has a couple more remaining features that require building
> >>   a machine specific kernel if enabled because they hardcode physical
> >>   addresses: early printk (debug_ll, not the normal earlycon), NOMMU,
> >>   and XIP.
>
> We've got NOMMU and XIP as well, but we have some SBI support for early
> printk.  IMO we're not really sure if we've decoupled all the PA layout
> dependencies yet from Linux, as we really only support one vendor's
> systems, but we've had a lot of work lately on beefing up our memory
> layout so with any luck we'll be able to quickly sort out anything that
> comes up.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
