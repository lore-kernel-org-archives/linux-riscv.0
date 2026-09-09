Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E0EC79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKbD4XZn7r3/Ilh8xPTDt87Kxe2lIe5IIPSW9SPd7fw=; b=aPfvqDo4Dkep21
	YKAi/ug4LQENutGYRIgUphEMADgEcZspBDRevHdHQN9BXJRFxyAUkiJkhp3p5MAxm1vT5k7jqrqlE
	qQvFNnmxpCpbjKB+fwrfO5YiuRioNy7kBwBBkj8zjtJNuOkqyTZD5tn3j6aNVUzUuiXr5xot0perV
	5LGs/+sYc439tXyYuWp4kPZGJqBHScxU4JOtfUfIumNd7uDVVhtCxMvoR02xWvFyk1K1p7gyAxRCH
	lPjEr6lFlo8o90kMx6e0kb7/XrPEByVnLWqiUsX3TmuDJfT6Ye4VXyybw4wSdJ7bwvbgWvXm68EjS
	00HYXDcqG/ecwE+6G7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FSB-0000000BP4Y-0S7F;
	Wed, 09 Sep 2026 10:22:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FS9-0000000BP45-2ZbJ
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Sep 2026 10:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cErN04XR2kGv1i2GRA/Gp+JKA/qXMFpcoKDT3eXGf48=; b=B+QPOPO97T9KkWlCXg1CJAcMdZ
	yA1XUeGldCL5OkO0YN7+ZTE3+tQQUDmaob9ELjsihJnyjIxqbTleAcsQL0E8Vrj73xnBM3z/vO6eY
	rqwiEZ3/BgvmhB/bsvYBYGLZKr8B3weS9A7MPq4XPbTcdA4JwnnguPi4BjZQePswN+V1+i0GsVQvk
	nfuq5KHqzARCq2nEhxvrgYxgLJCGRNUXKR/inGaQm3V34yrh8QsQmc+gYkv4dTTDzgTx8iuE4vab3
	1dngfhVKLqBiXB8BtqpMYnY1ftsDpfH2HoohGQ5vHtcjK9ugobA+6k7Mcg6yjsHlJ1A7/K+uQJOWd
	BlDoGmNQ==;
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4FS6-000000013rW-1Vu5
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 10:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788949360; x=1789208560;
	bh=cErN04XR2kGv1i2GRA/Gp+JKA/qXMFpcoKDT3eXGf48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FyZ5TvMuM3Xxv5Uzhar57D+/F/CzbQI9Nc7boZjPQ6zKjeTnMXkpNyBP7JbAk+bz/
	 q87GN3qkrPsh1ksLlzQBUNR1zoF7toF94y+UZQcH7gkMNVfAx7WuX2WqtjsyXoUnPw
	 eSLBsKpAMAWXivq0KUr3IsQdh8ETLkW8Y8JqBFnLmNtmmWuuApOv6Vr/Xvk255Wh7u
	 NqrFComiGwqy/7YMvXKEfuvq+yDiVGQmWKKbv1wX9fnHmUoYeZrm4v7Ig+C9PdRmfI
	 yYIR7L8jXMECk5SfckftB0rSpEtgOduxZPyUm+yeG06lBUgdWoT6jAthkIQOmPoYMh
	 qC+n7EC8R2fEw==
Date: Wed, 09 Sep 2026 10:22:33 +0000
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
From: =?utf-8?Q?Bj=C3=B6rn_Baron?= <bjorn3_gh@protonmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
	<boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
Feedback-ID: 27884398:user:proton
X-Pm-Message-ID: 6e566d54cdb8b110ebbfb62f2bd2ea449ab508ec
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_112250_682040_67E93EC3 
X-CRM114-Status: GOOD (  13.80  )
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

On Tuesday, September 8th, 2026 at 22:59, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:

> Use the -Zthreads option to have rustc perform builds in parallel. This has
> been available since rust 1.84 (rust-lang/rust#132282), and the kernel
> requires rust 1.85 or above.
> 
> [..]
> 
> Generated output was confirmed byte-for-byte identical.

There are still several known reproducibility issues for the parallel
frontend[1] and at least until fairly recently there were also deadlock
issues and incorrect errors[2], so I would not recommend enabling it without
an explicit request from the user. Perhaps even only allow it on nightly
rustc for now, then you don't need to check which of the two spellings of
the flag is supported.

By the way, currently backend parallelism is entirely disabled due to the
usage of --emit obj (which forces -Ccodegen-units=1). For -O2/3 builds
enabling backend parallelism may have a bigger impact than frontend
parallelism. And it would make incremental compilation for rustc a lot more
effective as editing a single function would no longer need to codegen all
functions in a crate again, only those inside the same codegen unit.
Getting it working would require using --emit link to produce rlibs and
then linking those rlibs in the place of the raw object files. Rlibs are
just static libraries containing some extra rustc specific info that will
be ignored by the linker (no guarantees about this, but there are no
guarantees --emit obj can be linked without missing symbols either and I
don't know of any reason why we would change it right now. It would hurt
compile times due to needing to repackage all rlibs before rustc runs
linking.). I tried implementing this a couple of years ago, but back then
if I recall correctly either binutils ar or llvm-ar was unable to produce a
thin archive referencing members of another archive like Kbuild expects to
do. I'm not familiar enough with Kbuild to know how to skip the thin
archive production.

Link: https://github.com/rust-lang/rust/issues/?q=is%3Aissue%20state%3Aopen%20label%3AA-parallel-compiler [1]
Link: https://github.com/rust-lang/rust/issues/?q=is%3Aissue%20state%3Aclosed%20label%3AA-parallel-compiler [2]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
