Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81619C88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVnSwqdWJ5N0qkeIlPRt3wlIzZA1YhirSv5HZ7oV5nQ=; b=WmRyrhAO+s1oba
	o71ZJfAKtZxFeSewivC7AAArTObKwvK3rUEp2pgQ8W/B1aQ+kG6j/V1Upq9mdaDCeDsbktyZgSTWg
	Xgzp9DyARnvogIpDPb/x1p34kZqrTI0HzVWr6R3pgoBnnPgSVHD2eEGw8EgQgBCy/Zc5Es9XUpH1F
	V+V3KMIzYKEAtxiKSFl1J80Br7I/Unza4y9X+bKSFE97aRQVeUdYHK58WSd4AEw3Mf4nOEzjPL8n7
	bIc1ZTSK78LLs7QOFPF6/vei4CyPY6A/UzWZAOxcLb4ttEkqPNZO4grgg24qCrJyUnK3scMx0cPgQ
	9dJGa01NFtOIZAG7MBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qFj-00000009Ma5-2V8t;
	Wed, 16 Sep 2026 14:04:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qFh-00000009MZl-1z6i;
	Wed, 16 Sep 2026 14:04:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1EDD602D0;
	Wed, 16 Sep 2026 14:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72A01F000FF;
	Wed, 16 Sep 2026 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567484;
	bh=4p4hgcvw6kWcyC6EnxN9LbmyJCJrpBQ7Z3d+76JOY14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QEqrNXj4hIJ+yI04UbRRbzBwkfAPGXGTc0IPJzRUfJ08hVbqxoA11qyOaeocRMZze
	 QMDTNlNgZ7H/6jCbW4jc7XIIj+3crpYh6RQPGu/2+kV+9chxN+NMfi19lT+PZsz3q6
	 kJeTiFOZocvpahWB6/2aLwybCEhF1VgXISs4r9MysIyyIWac/3X2Q1aqa9WzRyv759
	 cq+oXi0EGQRTc0SkQkEwyDO6JX4YcPiIFG/z5UYYYaSOeB4TcDU3wzHNgcPxPEuoeH
	 jyMHgQXRuDCjNHXLen/ynlZVk+jaxndcRdCxn72EKgpqHgdOxG8Z/1xMe2pcVmDJv5
	 uz3X+qN5sZ83w==
Date: Wed, 16 Sep 2026 15:04:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Subject: Re: [PATCH v2 20/21] kbuild: build rust crates in parallel with the
 rest of the build
Message-ID: <aqqhzqgYV5MTYAzo@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-20-39817ec5db23@kernel.org>
 <202609141133.7CA979C89@keescook>
 <aqkv9SqIdh0qKPFc@gremlin>
 <202609150951.73C4F16EFB@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609150951.73C4F16EFB@keescook>
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

On Tue, Sep 15, 2026 at 09:52:01AM -0700, Kees Cook wrote:
> On Tue, Sep 15, 2026 at 12:58:10PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Since this _still_ gives you a significant speed up on bigger boxes, I think
> > it's fine as-is.
> >
> > The LLM says a fix for this would need significant work - a cross-instance lock
> > and an on-demand rust/ build. So I think best as a follow-up?
>
> Sure! And I defer to the Rust folks on all of this. I just wanted to

Yes indeed as do I :)

I _think_ this change should be a lot more viable than the -Zthreads one
though :)

> note the possibly unintended behavioral change there. Thanks for
> examining it!

No worries!

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
