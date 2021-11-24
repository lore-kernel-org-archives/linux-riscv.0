Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14657C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2OUGbnDp6W9eUmjprP+78NGwOY3hJKtsOAGRG6/hOk=; b=kb4NrJjxrRSf3U
	HMK5owuAjfLsHFLIFtepwhruaNQi0a2oyhFwGCJk8dTbgC13iuhj1xGsaPoBdt+fmO5UwBrvNwmNK
	YnY/oim3Ts4F3uYp9RU1yM0MdSlQ1qCKSzPKi2rphAV6F2PiqQh0ts8lJc1HKdajFNQjyeW8MTU4F
	rX/wGSoYsBBS/R11CXR7FiaOm40hxlEXeVlctdvlJTnDzPBvL/EOQvwVW3fqRrD4XHDc76YD44R9c
	kQz81HU2hvHbOBatwM/z8b7pAMTH8PEdx82pqa9YLNtc7J7WlyA1HeqnBl1XLy2VbFxmq6CBSe6qj
	KxYgjOCCvBtakmbPYuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mprCE-004fdS-Uy; Wed, 24 Nov 2021 12:16:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mprCC-004fcU-7y
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 12:16:17 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mprCA-0005IV-G5; Wed, 24 Nov 2021 13:16:14 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 atishp@rivosinc.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
Date: Wed, 24 Nov 2021 13:16:13 +0100
Message-ID: <6883721.WJZ4dBXcaH@diego>
In-Reply-To: <CAJF2gTSwousS4DHWuqprkkckbRa-J=M_a5vSVJ5CiAjDvqGh9w@mail.gmail.com>
References: <20211123015717.542631-1-guoren@kernel.org>
 <1913356.JkcO0Xq8vV@diego>
 <CAJF2gTSwousS4DHWuqprkkckbRa-J=M_a5vSVJ5CiAjDvqGh9w@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_041616_313231_C05FC716 
X-CRM114-Status: GOOD (  32.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 24. November 2021, 07:42:17 CET schrieb Guo Ren:
> On Wed, Nov 24, 2021 at 3:33 AM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Hi Guo,
> >
> > Am Dienstag, 23. November 2021, 02:57:14 CET schrieb guoren@kernel.org:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> > > 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> > > soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> > > chance to users to set the proper size of the firmware and get
> > > more than 1.5MB of memory.
> >
> > is this kernel parameter approach a result of the T-Head Ice-SoC
> > currently loading its openSBI from inside the main u-boot via extfs-loa=
d,
> > directly before the kernel itself [0] ?
> The patch is not related to that issue. The patch just helps users who
> put opensbi at 0~2MB paddr to save memory.

So as Anup wrote, this should just be solved by using a correct reserved me=
mory
node in the devicetree passed to the kernel. And the firmware will know what
memory region it actually occupies ;-)


> =

> >
> > Because that approach in general looks not ideal.
> >
> > Normally you want the main u-boot already running with less privileges
> > so firmware like openSBI should've been already loaded before that.
> > Even more true when you're employing methods to protect memory regions
> > from less privileged access.
> >
> > A lot of socs set u-boot as opensbi payload, but for the example the D1
> > mainline approach uses the Allwinner TOC1 image format to load both
> > opensbi and the main uboot into memory from its 1st stage loader.
> >
> >
> > Of course the best way would be to just mimic what a number of
> > arm64 and also riscv socs do and use already existing u-boot utilities.
> >
> > U-Boot can create a FIT image containing both main u-boot, dtb and
> > firmware images that all get loaded from SPL and placed at the correct
> > addresses before having the SPL jump into opensbi and from there
> > into u-boot [1] .
> >
> > And as Anup was writing, reserved-memory should then be the way
> > to go to tell the kernel what regions to omit.
> >
> > And mainline u-boot has already the means to even take the reserved-mem=
ory
> > from the devicetree used by opensbi and copy it to a new devicetree,
> > if the second one is different.
> >
> >
> > Heiko
> >
> >
> > [0] https://github.com/T-head-Semi/u-boot/blob/main/include/configs/ice=
-c910.h#L46
> > [1] see spl_invoke_opensbi() in common/spl/spl_opensbi.c
> > [2] see riscv_board_reserved_mem_fixup() in arch/riscv/lib/fdt_fixup.c
> >
> > >
> > > Guo Ren (3):
> > >   riscv: Remove 2MB offset in the mm layout
> > >   riscv: Add early_param to decrease firmware region
> > >   riscv: Add riscv.fwsz kernel parameter
> > >
> > >  .../admin-guide/kernel-parameters.txt         |  3 +++
> > >  arch/riscv/include/asm/page.h                 |  8 +++++++
> > >  arch/riscv/kernel/head.S                      | 10 +++-----
> > >  arch/riscv/kernel/vmlinux.lds.S               |  5 ++--
> > >  arch/riscv/mm/init.c                          | 23 ++++++++++++++++-=
--
> > >  5 files changed, 36 insertions(+), 13 deletions(-)
> > >
> > >
> >
> >
> >
> >
> =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
