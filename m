Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A03C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jycfXKYqGdt5QukbnJ4OkVi6K3SgvZLBpx/Mdn7J/V8=; b=VDW8+L333x96f+
	K158fdybux6TXTcbtzKSYzR3vfeIERIAN+OWC1n53iS5EkUpm89l04gqOVUZp7pPrQ59h+WnMyXsH
	tdkNOmKPpFs6wT1h8lRd+BARmvjh1L4AAStih74H+Edni3ybtZRMmPOJmNdLhZRWKvpodfjlcSFpI
	U8PStabyKQ30klGDRkQ0GNp2RZQmeuIoMowJgkKlOkiCGSEQ8SB6pnwz0W7K1AbPM4VUigGZAzRyw
	suGiq817E31nLH27zTT4vLrsVtXgDvMaIbA/8iwAQriWns90nJlFp46SdtxPZ7GCm2mZ3/tNGUGbP
	Pxtj6Hg9gJCvQp12tSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpdgv-003Y3F-R9; Tue, 23 Nov 2021 21:51:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpdgt-003Y2U-6G
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 21:51:04 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mpdgn-0002Tt-AM; Tue, 23 Nov 2021 22:50:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
Date: Tue, 23 Nov 2021 22:50:56 +0100
Message-ID: <1780573.2WWZn4uiS5@diego>
In-Reply-To: <CAOnJCU+-WCHA9vgrbcMFsLMaimwJNEXOpqMLS_0Gq_JRM5QNWQ@mail.gmail.com>
References: <20211123015717.542631-1-guoren@kernel.org>
 <1913356.JkcO0Xq8vV@diego>
 <CAOnJCU+-WCHA9vgrbcMFsLMaimwJNEXOpqMLS_0Gq_JRM5QNWQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_135103_257276_7286506D 
X-CRM114-Status: GOOD (  34.22  )
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

Am Dienstag, 23. November 2021, 21:01:29 CET schrieb Atish Patra:
> On Tue, Nov 23, 2021 at 11:33 AM Heiko St=FCbner <heiko@sntech.de> wrote:
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
> =

> Looking at the defconfig[1], it may be U-Boot SPL not U-Boot proper. I
> may be looking at the wrong config though.

It is actually uboot-spl + uboot proper (aka the standard spl loads u-boot
way) which is the reason I pointed to using the existing u-boot facilities =
:-)



> If U-Boot SPL is actually used, you don't even need to manually load
> OpenSBI "fw_jump" binary.
> =

> As Heiko pointed, you should just follow how U-Boot SPL works on
> hifive unmatched (creating the FIT image)
> The standard U-Boot SPL uses with fw_dynamic which provides all the
> flexibility you want.
> =

> [1] https://github.com/T-head-Semi/u-boot/blob/main/configs/ice_evb_c910_=
defconfig
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
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
