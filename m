Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5D7C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8j5Y01K2aEA6KrC3kzaaM6lkzO6fnCuHPdBATopCvTw=; b=iUH4ELwrxxQ4z1
	EwU46cx6DjEnqQmalKDigjeJNk+RQUomK9wTy4zm4hoZ6uFL+Owz5QPaUVBo+Slu9JjFxsk2XlBJc
	vUqxg99XqElkamCU41yGaZ//UVKVrJFbV3OC39Z+YVg57++sNYlKkCLJVw88BraLO7nbqqHCiXy9A
	27FuJuy4GIOYveN8U15dOMyE6N0V/F8XyQLx3/wH9TmGqz/zMYT+IG+eR88Xc7X0ljrym396Y1aUe
	NZoj4WBMVJqJVUu7fPgQ/z7EM9EAiGY8vuI/hwsOPwEdVBRAOe5Fso75msl/UEk/zRcKfLHdUADS2
	C7ylkuHLIgrmkcy83h1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cqT-0000000EBoD-0V4Q;
	Thu, 10 Sep 2026 11:21:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cqQ-0000000EBno-3Z82;
	Thu, 10 Sep 2026 11:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F8243F71;
	Thu, 10 Sep 2026 11:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6961F000FF;
	Thu, 10 Sep 2026 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789039290;
	bh=FPzIvtgmhSbpU/1pbVMJisRzxaJmuZeATD8N0wykZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxzxAAUfjYsWGUsxd77ZTX3tE3JJL5QVTDc0CoN+OGKRsVNwA8taMOgIhooTrG+RC
	 dwnR0jlai7SFJ9MxapDb8HTbs0SXwe63sPA/OQ/0HAk1p7qxIZg1fRSVJLlU43nCZl
	 Mml1FPN4smCiHdGL3gQjgRXgL7F0ej45TsSHiztJsSrADV6hX4RtKmnD4TJJ1Dzofo
	 Gab0hIcgNwLcYSZC7AW89krjF+d3XB7egDqIdHoeNNEN08xRs1nHZuRVFuOeNEI+kY
	 bBFtt8tpbGAdUJvjTV6Y77zp96xkeUlxIhcC8wn68YMAfyNhQ1MqRixMbJb/Ya78xq
	 WbSFvnPTAlwnQ==
Date: Thu, 10 Sep 2026 12:21:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_
 pattern
Message-ID: <aqKO4idury5TND0u@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
 <178901395289.3971858.3678831513020211615.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395289.3971858.3678831513020211615.b4-review@b4>
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

On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> > converted scripts/mksysmap from a shell script to a sed script.
> >
> > However an error was made - escaping of '$' required \\ escaping in shell
> > but only \ in a sed script.
> >
> > This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
> > escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
> > like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:
> >
> > $ grep __pi_\\$ /proc/kallsyms | sort -u
> > 0000000000000000 d __pi_$d
> > 0000000000000000 t __pi_$x
> >
> > Fix the escaping properly.
> >
> > Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> >
> > No measurable change in build time.
>
> Same comments as before.

Yeah sorry same screw up!

>
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Same thing, is this worth taking to stable? Truthfully, you could

Ack I think it's probably worth it yes like patch 1.

> probably send these two changes separately from the series so that we
> could send them to Linus with the other pending Kbuild fixes, unless
> there are objections from Linus or Nicolas on taking that route? Shaving
> two patches off of an ~20 patch series is a 10% reduction so seems worth
> it?

Patch 8 relies on 1 + 2, so as long as that ordering was enforced then that's
OK.

I mean if these go as hotfixes then we naturally get that ordering of cousre!

>
> I'll review some of the other low hanging fruit now so that we can start
> chunking this series out, since I too care deeply about build times.

Thanks!

>
> --
> Cheers,
> Nathan
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
