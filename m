Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17113C982D7
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41FjLylhxwHJgBHLVzo4J9yhKFc8D5ZBplL6Wq0xYVQ=; b=zHQLYng05f2zYO
	Nbpo2ylsQslqZ6+riPcH4VWre6C9ekZ5uVPQpKdNLL3Buzgzo/gUjADQ9yAIwalLhH50z2TLfKtFj
	yPHfjLOqQe4J3O3Ww2AIHYilr8SQj9VCyHNXhXBNajv3j9F8ZIQkPc6cGSH+TbaR103sDq8333pO9
	eYITS2Em8kOtf76k60Ca9eC3x8rIxdAV6z1MmB85Cit8DbFy9rkRKpKFVI/4ABlC7PBxIp4S7QaxR
	0SkIdBQwoE9Io66HHWIF6AGARVttflcbqmvqRHw+Y9SSk6ac7Ieqku/hFst3S1u6cEZ9ZA79rf1/o
	nmZOkwj8AZH+2hLC/xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wEf-0000000GO5n-2uiK;
	Sat, 19 Sep 2026 14:40:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wEc-0000000GO5V-4BWJ;
	Sat, 19 Sep 2026 14:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E02942DD6;
	Sat, 19 Sep 2026 14:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9816A1F000FF;
	Sat, 19 Sep 2026 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789828808;
	bh=wjlxL5aZkP+VxdLu3dOkGnCdnF8bXwL4sZrwxhwgEoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmle4uStbjC80tnxl/vjfpvmYYVkjjgMRY8+5/8q3PJtzA+t0bmdendomXHO0ws9H
	 U7AkZ01hXjF9UNEcQJjw7O9/G4ZVuIuTmE9nQZ3vbmzWCvaO165TT83I/rtJG67Uk8
	 ZFOFQWbnJPaWf/uRXVtzgN/37w3mP1J0r/35iCXOcKYjsonGbQyJWBByqZl7EDsn8A
	 AoQzM7VokTP4qPCH98a+dd0vu239lXSc8hrSG3iX73m64ZC18rGxk7qnPGd28l/Jyx
	 Wc2TmR6JoQ+w2Nml9DQH/pX6LYALY6ZyyxX+/DvfhQiCD1q+q2+EZx1en4Sr/c+Iwd
	 Sv6mRmehV0F6A==
Date: Sat, 19 Sep 2026 15:39:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/20] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <aq6QwzcyvKp3CB0F@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
 <202609170950.480F90A28@keescook>
 <20260918005142.GA1585590@ax162>
 <20260918-meek-spectral-nightingale-53d88d@l-nschier-aarch64>
 <20260918214445.GA3589065@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918214445.GA3589065@ax162>
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

On Fri, Sep 18, 2026 at 02:44:45PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 18, 2026 at 07:09:30PM +0200, Nicolas Schier wrote:
> > Yes, thanks.  Looks good to me and I think it's a good idea to apply
> > that patch first.
> >
> > for Nathans patch:  Reviewed-by: Nicolas Schier <n.schier@fritz.com>
>
> Thanks, I have pushed this to kbuild-next-speedups as
>
>   36d4a11b56aa ("kbuild: Remove alignment on .modinfo section")
>
> which Lorenzo can base on. I have also tentatively included the patches

Ack, will rebase future revisions on this patch.

> that are basically ready in my eyes based on consensus and review so far
> for initial build testing. I do see some comments on some of those
> patches though, so I will hold off on fully applying them until the next
> revision. If there are any other changes that we should consider taking
> quickly on the next revision, please feel free to point them out, it is
> a bit hard to follow these threads sometimes :)

Thanks :)

>
> [1]: https://git.kernel.org/kbuild/l/kbuild-next-speedups
>
> > [ Lorenzo's patch, updated by Nathan ]
> > [...]
> > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > index 6833b517cacb..95b523fe4f9e 100644
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> >
> > [...]
> > > @@ -103,10 +100,7 @@ vmlinux: vmlinux.unstripped FORCE
> > >  # ---------------------------------------------------------------------------
> > >
> > >  quiet_cmd_modules_builtin_modinfo = GEN     $@
> > > -      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> > > -                                    chmod -x $@
> > > -
> > > -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> > > +      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< /dev/null
> >
> > By shifting from "$(cmd_objcopy)" to "$(OBJCOPY) + args",
> > $(OBJCOPYFLAGS) is dropped.  It this by intention?
>
> I am not sure it matters in this case since I don't think there are
> global OBJCOPYFLAGS, I only see instances that come from specific rules
> but I might be missing something.

OBJCOPYFLAGS is exported from the top level Makefile:

655:export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS

And is set by various arches e.g.:

arch/csky/Makefile
2:OBJCOPYFLAGS		:=-O binary

arch/mips/Makefile
348:OBJCOPYFLAGS		+= --remove-section=.reginfo

arch/openrisc/Makefile
20:OBJCOPYFLAGS    := -O binary -R .note -R .comment -S

arch/sh/Makefile
79:OBJCOPYFLAGS	:= -O binary -R .note -R .note.gnu.build-id -R .comment \
		   -R .stab -R .stabstr -S

arch/s390/Makefile
123:OBJCOPYFLAGS	:= -O binary

And none of this should impact .modinfo, and if it did it'd be broken as then
.modinfo would be different for one arch and not the others.

>
> --
> Cheers,
> Nathan

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
