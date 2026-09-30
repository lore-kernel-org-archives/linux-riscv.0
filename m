Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D8BCA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULDVs9tcWCAUgy57MF0HzV9TATxydZ0ay5clb+6BwLg=; b=QOarpO5wKegR2i
	Mn+nocL5bt/iFz0iaFkUVPZScDjqLhBJ6VafrQDaMMV+ybGk/C492qtiISbp8sDmPtdQknN26e5V0
	84S1h2yA9L4C+S7+sG5IYfoWwr51fDYceGUfaI7CfFjfFcewLDgt+S2mzzIh45c5xHryOaVzL3+Fz
	8dA8iseQiCGAm7TX07Jujgdz8Dl00kJpWROVhvPogiGbmIW+ZobRk8axVY116GmcFTYc3bAdifu4X
	7LmQk1Bhjjp7tKFrd5y/e83DEvWr5p+cFbXambmJtoVRy76WdviSoMvcGXiSog/D+KXJgn+vHp07A
	Fe021yVD1EhID9HW+iAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuW0-000000069aV-0jY7;
	Wed, 30 Sep 2026 13:38:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuVs-000000069YN-0esx;
	Wed, 30 Sep 2026 13:38:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D5BC6025A;
	Wed, 30 Sep 2026 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD6B1F000FF;
	Wed, 30 Sep 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775502;
	bh=Ig13N2tfIjFRsSeqDuP4ixyXHADT+oxuPpwsFpsBiHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f+lk879yO1tcwpxTCZ8Vu9BSZUmqzoN86ot1Geu5VLUsqPRG9EiYd59TtYmDI/DQx
	 b8PpR9XUHRj0fTYkMmqXQuU21rsM9TF4RTV+0y9feymcUMVNsiCzbuBPKCg7LcBInO
	 A8qletS7Fjls0KgPrzllrFG2yFr3jSqVabH3BfItoBP22iHLl1D1M+B10unFPxeYbS
	 DoBEprp5b4czipy9XTDOYyQwloYcLFKkBr+bQORPpJFN8w65Cv7oGrANxZ7mpBtWFH
	 X/3FQ1hd+ZdBx+IV0FxW43+cOBuEql4F0qrdZWn1SclMvfp5mjwnEyjv/+mEW0gQs2
	 c0/P6Q0/ruZRw==
Date: Wed, 30 Sep 2026 15:38:13 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260930133813.GA3142230@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com>
 <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
 <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
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

On Tue, Sep 29, 2026 at 11:24:11AM -0700, Nick Desaulniers wrote:
> arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
> problem I suspect.  Maybe that's the right tool in the toolbox?
> 
> ```
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 8dbf2532a573..27fa72d8fb86 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -27,7 +27,7 @@ asflags-y += -DVDSO_CFI=1
>  endif
> 
>  # Files to link into the vdso
> -obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
> +obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o
> 
>  ifdef CONFIG_VDSO_GETRANDOM
>  obj-vdso += vgetrandom-chacha.o
> ```
> Fixes `make -skj"$(nproc)" ARCH=riscv LLVM=1 mrproper allmodconfig
> vdso_prepare` for me, as per

For the record, this also happens with the 32-bit PowerPC vDSO, as I
noted in the commit message of v2. I should update the issue too, I only
realized this after wider testing. So if this is the route we want to
go, we would need a memset() for that vDSO as well.

> https://github.com/ClangBuiltLinux/linux/issues/2183
> (Nathan, don't forget to link to that in the commit message)

Yes, thanks, I have added it for v3.

> I'm surprised I didn't need -fno-semantic-interposition (or one of the
> related flags... -fvisibility=hidden)
> 
> If we want to get better, (if performance matters here and we want to
> trade source+build system complexity for absolute code perf) I would
> start with that, then worry about clawing back performance via things
> like:
> - __builtin_memset_inline
> - -finline-stringops=memset
> - -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
> of line copy of memset, though IIRC there's potential for wasted space
> due to alignment requirements (maybe the out of line copy of memset is
> smaller...idk)

Yeah, I guess it is ultimately up to the maintainers what route they
prefer.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
