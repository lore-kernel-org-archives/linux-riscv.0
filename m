Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55190C79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANG+DIhbma5fQL6aI61GtD9KxPnKfffGAQx6xX57M+M=; b=QpuhqIRHd99UJU
	Iz6Yz/1IsJls2qw1FIqc3b/SfJurfpLtQX9/Rnz+YBQvecvlChy0HLqceB52wblOGPuzkQKJeL/q1
	b35pz6KJVQa7ihsRu7H0M4oz0od1E4eT4gBBkKEqAqx7Gni7UkW1PdeKwb336bbc6UDUK6GAHluIE
	ole6wFkEtBGmGT+NwC8IxC3doST23fEf5CSlU88TOqAXDkk/IfiaTHPtIufbb4gvpl3Gy0udnX9ke
	sK0/A1qv8J28X4vqFVl+kGCA3HUL4DQy8iHnr4N5bWP3/4OVmF2JYt4P0mL7ZVGFUxtcN5Ww/vXQn
	HfWkQrCwrfHbFrM1mXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HaD-00000000ayo-0sJw;
	Sat, 12 Sep 2026 06:51:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HaC-00000000ay6-0iQj;
	Sat, 12 Sep 2026 06:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 277BC600D4;
	Sat, 12 Sep 2026 06:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F80C1F00899;
	Sat, 12 Sep 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789195886;
	bh=Z84vkdbwNxegmhKm0R2xQmDE2xY7DFVW66Efhf6koos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DYvw6gsoELRpV5Zk+nFitNkGdpp3UJB0K40yABvAnHcpoDfpPU0Nq4c5Fiym6+0tc
	 Cv9OSGENrXpxlFgyuf6k53fnSRr+CmYeI6T6dJ6P5Ml/WDOnei5VdVHvF4JPU7Y9ZF
	 5XiwvX9GNoeUHljzvqtQcPHoj5XT+gy3TmoVjlkgJsImc24jZiABBSRchLj4l7jRX5
	 02pnk5YMkj3u2wVrYE80CAwP/0lZ2djYSOyK4f0OtAFLXwnQ56nGXE4inKKI93Xkuz
	 Kc1RWE9iupig6wVtHR44XSzmGtQLiEKLs8565qMeUCMRwBOnPY0xceyW6RZujvW/kn
	 2ocP8MdjyhWMw==
Date: Fri, 11 Sep 2026 23:51:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <20260912065114.GC2002951@ax162>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <aqPW1FsBVYHSWl1r@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqPW1FsBVYHSWl1r@gremlin>
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

On Fri, Sep 11, 2026 at 11:26:36AM +0100, Lorenzo Stoakes (ARM) wrote:
> It feels like init is the right place, having actual substantive Kconfig entries
> in scripts/ feels a bit weird.

Yeah, that is valid.

> I can add an extra patch to move existing entries over before adding these in in
> the next patch?

Yes, sounds perfect.

> > I also worry about backsliding and growing cc-option checks. Should we
> > update the documentation to state that it is preferrable for these
> > checks to live in Kconfig so that they can be properly cached?
> 
> Yeah makes sense. I can add a patch to update the docs too?

Yeah, sounds good to me!

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
