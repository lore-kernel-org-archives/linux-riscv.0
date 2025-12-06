Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4BED3B7DB
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 19:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZT5JW/UR1l85SYrgiEJaaKT4+Aww7NoPzsF8uBAy4oU=; b=Kih7VO8J6XcGpP
	tfZIg8irRGlIUENW6C1xM3CZTWXBNx9Mu6KO1WSwup7InOHrfOWQjNnydxm5oBPUpngGx37xlQAe3
	vyNGskrYWdNnwS5z3R8J1dDMxh77A+Eo0JBr8RnhrU32dbLjkP27vT50QuAhwiYiJHNWYvBMIGEIa
	o6QuiwVGfzjHrVK3Uqbw57st/Zq4VfcxdIBNC2VcqG1kMVGzTtRyr5QTW+qTt1mecqhT/S9M8wBIw
	OskhU7EqrgbK8scQVdDPTH7bvK+Jvt1yyNZXtEfgI9vtBsLi0Ml2uueeIdZGf1PbNiJkRcV/EBGLH
	iEN0yNg1sGlX3urS8Umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRyOo-0000000BBj7-3dro;
	Sat, 06 Dec 2025 19:56:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRyOo-0000000BBj1-1N6J
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 19:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 706B160097;
	Sat,  6 Dec 2025 19:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC0C4CEF5;
	Sat,  6 Dec 2025 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765051017;
	bh=9FQJgpJnEx4MT5jkFe9SlUQLuoOyH3jpPlTZf50X1Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIwGAS70bO+OLLE6QI5bj+RkMZJVjc/ISZoeOFDhx2XbWXGUskJUyc9vaUfvFBWqj
	 fvdTtV3Jyf7JeDdbscPMBOfXtcgt2/TJyEad3UEm55z8MST7JOlbvYaSTMjTzZMF/v
	 A4L9zqZ4DQ++FcDNkIRso7ouUNOTAQJck/JpAL042RpxyK8/d+dSpGpaUeX4OwpmUD
	 Kx5W6Vyl667/1UBsHVArfvrbONXb7uxTEy26ff5LJ+9JUB24nwdDfcVUQGKli5aACl
	 eT7t/jrmHF/SNCxMBHVirzboVMuIgN3mPkg+NVq2bU2U7LUwST/EYqk9fmOJgKeaip
	 K3lrXHryD+1Ww==
Date: Sat, 6 Dec 2025 11:56:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	Jerry Shih <jerry.shih@sifive.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Han Gao <gaohan@iscas.ac.cn>, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: lib/crypto: riscv: crypto_zvkb crashes on selftest if no
 misaligned vector support
Message-ID: <20251206195655.GA4665@quark>
References: <b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn>
 <CAMj1kXHesHJ2oFzGPewp2V=rA0-BU2Y_PffuDDhxioftOKZYHg@mail.gmail.com>
 <20251130184341.GB1395@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251130184341.GB1395@sol>
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

On Sun, Nov 30, 2025 at 10:43:41AM -0800, Eric Biggers wrote:
> On Sun, Nov 30, 2025 at 11:59:58AM +0100, Ard Biesheuvel wrote:
> > On Sun, 30 Nov 2025 at 10:13, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> > >
> > > Hi,
> > >
> > > We ran into a problem with chacha_zvkb, where having:
> > >
> > > - OpenSBI 1.7+ (for FWFT support)
> > > - CRYPTO_CHACHA20POLY1305=y and CRYPTO_SELFTESTS=y (and deps, of course)
> > > - Hardware with Zvkb support
> > > - Hardware *without* misaligned vector load/store support
> > >
> > > Leads to a crash on boot during selftest on a vlsseg8e32.v instruction,
> > > because it requires 4-byte alignment of the buffers.
> > >
> > > OpenSBI by default emulates vector misaligned operations, however Linux
> > > explicitly disables it with SBI FWFT while not providing vector
> > > misaligned emulation of its own.
> > >
> > > This can be reproduced by running everything in Spike without
> > > --misaligned, and is reproducible on stable 6.17.9, 6.18-rc1 and
> > > 6.18-rc7. See log at the end. Note that I had to fix chacha_zvkb
> > > somewhat to have it retain a frame pointer to get a stack trace - patch
> > > will be sent later.
> > >
> > > Setting cra_alignmask to 3 for everything in crypto/chacha.c "fixes"
> > > this, but there seems to be no obvious way to say "if use_zvkb then
> > > cra_alignmask = 3", and, not being familiar with the crypto API stuff, I
> > > can't figure out a good way to say "if riscv then cra_alignmask = 3" either.
> > >
> > > AFAICT, this problem was missed from the very start since commit
> > > bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20").
> > >
> > > Please advise.
> > >
> > 
> > I'd suggest to only enable this version of the code if both Zicclsm
> > and Zvkb are supported (assuming that Zicclsm is the extension that
> > would result in these misaligned accesses to be permitted).
> > 
> > Playing with the cra_alignmask is likely insufficient, because it does
> > not fix the use cases that call the library interface directly.
> 
> Yes, we should make all the RISC-V vector crypto code (i.e., anything in
> lib/crypto/riscv/ and arch/riscv/crypto/ that uses vector instructions)
> be enabled only when the CPU supports fast misaligned vector accesses.
> That was the original intent, but it seems the check never actually made
> it into the code because it predated the core RISC-V support for
> detecting that capability.
> 
> That support later got added by the following commit:
> 
>     commit e7c9d66e313bc0f7cb185c4972c3c9383a0da70f
>     Author: Jesse Taube <jesse@rivosinc.com>
>     Date:   Thu Oct 17 12:00:22 2024 -0700
> 
>         RISC-V: Report vector unaligned access speed hwprobe
> 
> Note that Zicclsm is supposedly not the correct thing to check.  See
> https://lore.kernel.org/linux-riscv/20231122-displace-reformat-9ca68c3dc66c@spud/
> 
> It looks like all the RISC-V crypto code needs to check for
> this_cpu_read(vector_misaligned_access) ==
> RISCV_HWPROBE_MISALIGNED_VECTOR_FAST.
> But it may be in need of a helper function.
> 
> Any volunteers?  Again, many files need this, not just the ChaCha code.

Looking into this a bit more, on RISC-V the kernel actually checks and
records the vector misaligned access speed on each online CPU.  So not
only is RISC-V fragmented in whether this is supported in general, but
it can also be fragmented between different CPUs on the same system.

This means that the status of whether vector misaligned accesses are
supported and fast can change as CPUs go online and offline.

Indeed, there's already a corresponding static key for scalar misaligned
accesses that gets turned on and off as CPUs go online and offline.

But there's none for vector.  And this approach seems fundamentally
broken anyway, as it means that support for misaligned accesses can get
pulled out from underneath users.

I think we'll just need to make the RISC-V crypto code conditional on
CONFIG_RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS=y.  Having this info be
statically known, like it is on the other architectures, is the only
reasonable way to do it.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
