Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD427CCD19F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 23:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WrKF1gv45eaGkg5DP46nLpftWvv0jPbXWkIQktZGlA=; b=P+jxzL6/YiL1czUwMvVP8JBU6i
	KkaMtuUCwKahGlQYgX4aHdiOLGov+kCGHNuHl1mXC3JARKqeXIyw28i1iW+qBANiGoQWqHFedUcl6
	VvjnCCVaZ7V5yekiD0lVj2CI960DhlzYGt93nGzCN5HtbI16sMUs6/Xc4736ifabHNT5p6vW2Owiz
	ZkNhgQeMq3ic0WlLp+bPiphrxbrdNTtJFmWKNlmmFyhIsgCuC1iPRvY1hs9G0KDJbXaYbRSRhI0sb
	7feiCxeku+45HCwMxwffwSuR1lgMUptAusxHoc31sW1/ghanVCnWqur5PZE+4sY1UM6IDDOgUjN1Y
	N6JiDebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzM0-0000000FGHf-0uhT;
	Mon, 20 Oct 2025 23:31:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzLx-0000000FGG8-1CB9
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 23:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 183CB4524E;
	Mon, 20 Oct 2025 23:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29277C4CEFB;
	Mon, 20 Oct 2025 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761003104;
	bh=MSAK6/4fBV4LmmndaiAxLCMrrPnq6f4CzbgVcuVT6gY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OiT0jv2iLB3yllOHNdOExpaaufehdFK7X5eHx/RqEZynr648JdouVhGzKa+aAoitK
	 YOGtoCJY6BukhUpJ1mmZByUt43IPYxyUTFb2dNSgYWJrLx0ZJFYzLP+XGMUdgirov8
	 F9WzI3l8hMmx9gfcftH2KC7XS3Dqn5BSU1lBfPlR68A4r5YnfsxWYsDNNB++cMrcLY
	 yTgMGHmt7J1PujIKhWyVHwsMnPgLBxtO0xOWnwFSiKnc9aF/IjjnBDpnXP2X4Pzor3
	 rKIoxbCpfqVpzy61omuF/q23OZfm9fzXECQz9OJ8cmxMSGNt2cmdT1fQmciMy4iJnF
	 /+6Rtzb7Y/6Yg==
Date: Mon, 20 Oct 2025 17:31:25 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
cc: Olof Johansson <olof@lixom.net>, Ben Dooks <ben.dooks@codethink.co.uk>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
In-Reply-To: <alpine.DEB.2.21.2510072335250.7364@angie.orcam.me.uk>
Message-ID: <93e895ce-2b81-c111-4423-cf7181cc2b45@kernel.org>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org> <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk> <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com> <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
 <aN6U8NtIfqd-fowQ@chonkvm.lixom.net> <alpine.DEB.2.21.2510072335250.7364@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1876668917-1761003104=:3822160"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_163149_366719_C1874B11 
X-CRM114-Status: GOOD (  19.31  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1876668917-1761003104=:3822160
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Oct 2025, Maciej W. Rozycki wrote:

> On Thu, 2 Oct 2025, Olof Johansson wrote:
> 
> > > Now we’re starting to see commercial cores on the horizon that will have the
> > > ability to be endian configured at run-time. For example, MIPS (the company
> > > not the ISA) has announced they will be producing cores with configurable
> > > endian (https://mips.com/products/hardware/i8500/).
> > 
> > MIPS has been doing some not so awesome things to the RISC-V architecture
> > in the last year or so. They've published patchsets that make it seem
> > like that they seem to have taken some old MIPS designs and done the
> > bare minimal conversion over to RISC-V, since they need their own weird
> > system peripherals and hooks. Again, with the burden for everybody to
> > maintain because their hardware engineers couldn't bother to develop a
> > full proper RISC-V core.
> 
>  This is obviously a false image.  The most recent MIPS ISAs, such as the 
> microMIPSr6 or the nanoMIPS architecture, and consequently implementations 
> were absolutely RISC-V-like, with branch delay slots removed, conditional 
> moves replaced with conditional selects, floating-point condition codes 
> removed in favour to setting a general register, PC-relative instructions 
> added and overall being a variable-length compressed instruction set, up 
> to the point for some company engineers to become disgruntled with the ISA 
> "losing the MIPS spirit."  So it's not that they can't be bothered to make 
> a full proper RISC-V core, surely they can.

Olof is probably referring to support for extensions like Xmipsexectl:

  https://lore.kernel.org/linux-riscv/20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com/

  https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Reference_Manual_Rev1.84_5-31-2025.pdf

Xmipsexectl is annoying for at least two reasons:

1. it is a non-conforming RISC-V extension, stepping on existing 
   standardized base RISC-V ISA opcode space; and

2. it brings over new barrier operations straight from the MIPS
   instruction set, rather than just using the standard RISC-V fences

Doing things like this runs additional ecosystem fragmentation risk, which 
impacts all of us, for little apparent gain.  Nevertheless we took these 
patches because their extension includes a custom PAUSE instruction 
variant, and it's understandable that MIPS might have finalized their 
design before Zihintpause.

I hope Xmipsexectl doesn't survive past P8700, and that we never see 
kernel patches to use those leftover MIPS barrier instructions.

>  NB I doubt it's about peripherals: dropping a different CPU into an 
> existing system is nothing new and does not require the ISAs involved to 
> be remotely similar to each other; cf. VAX vs Alpha for example.

This one isn't a hypothetical example either; see:

  https://lore.kernel.org/linux-riscv/20250924-riscv-time-mmio-v6-2-9c6158a14b37@htecgroup.com/


- Paul
--8323329-1876668917-1761003104=:3822160
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1876668917-1761003104=:3822160--

