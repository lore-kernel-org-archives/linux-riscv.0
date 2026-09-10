Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E8BC79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNIiLHdu86izkjMKHh6CwRfwykTPt2guSSxejOcQTew=; b=VeVN4U52tYL1Sy
	g3FxiNnwpbas2AIofq358PtFg6sLiMdbZIzUVhD255eMIA7Wt9vhi2erm6c+ljEffI8gZQu6Hgiql
	IJfiVicsYEnc7zardhJaWB7C9Sn52+IzhEs74n5OZbgSJ6x3m3Q4WV8S9057HyLD3xgFcjNSzBKv5
	jWZWR6HKtqxEgEHCUrABHXOBHRmeh3iPL3ctsSaP3aHPTGXIPzUHC2tsQWNDyTWaCvxMHxeD+XqBc
	XO7k6Yq7qm2Tk/AuogDUQU72P5R/ry+NY7XiJzBx6rMkcqnsCOZU1CiMQX12BXkI46EjLgNc2TASs
	ycclwBQH/9wEvTBTDAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGs-0000000DLpf-3er1;
	Thu, 10 Sep 2026 04:20:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGr-0000000DLop-097b;
	Thu, 10 Sep 2026 04:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 771DA600D1;
	Thu, 10 Sep 2026 04:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14571F00898;
	Thu, 10 Sep 2026 04:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014020;
	bh=7StW8UAaERyxM3MlV7RKhZL0LUlMp32hRvomyQ+IPv8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bJUCDsJKg68DSdGiOJvLQmMsJoQmiGAmDRIxqYAwXim2/8RI8mnZp0gYln7d5B4sU
	 ljyCqzHIrl3sjTugVLf+A9BhYuQNUme3GvCWUf0n4/RQWtSkAatHQUiPGUfYFtz6dE
	 c7mzfOJqha6TYC1eTwWMh507t26j5DB+953TOz5AdSnFArvQNLeaoUYHpxMvBfD4yX
	 Dhig/0s35IppDIBti9OM1yuOdRPtYlTTbwIOagsmz/ZF/kLin5FL5teKBa8ZZoStBV
	 KVw7+bA4hK4PULF6gDhEmdNThsNTdAKKWDYPfxToRt1cUzGCSNZWHwjEW5q7P5Z1gf
	 8c7SAOZx0oxVw==
MIME-Version: 1.0
Subject: Re: [PATCH 05/23] kbuild: do not sort nm output where the order is
 irrelevant
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-5-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-5-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395290.3971858.1118074430153684281.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=nathan@kernel.org;
 h=from:subject:message-id; bh=t98y6LG1Wvnp9xVIMWiIRMwwnRXPDBdit0ws/Z+y4zw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I/tepkuJd51k/+C/rbX324+ub9nwqXwuVseOjpdu
 +htyWav0lHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmsv0zwz8V1dYJJ0UZvKYd
 tD19x0b55dS/WflX/DwiVZUOB67hu17P8L+6b+3DBZrhWxIV3kw/98Ni+r+yhF3/6+0WFfDubDD
 458EHAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

> Unless instructed otherwise, nm sorts by name.
> 
> There are places where this is unnecessary - an invocation from
> scripts/sorttable every vmlinux link, scripts/check-function-names.sh run
> after every vmlinux.o link, and the x86 VOFFSET and ZOFFSET listings
> between vmlinux and bzImage.
> 
> Both GNU nm and llvm-nm accept the same '-p' parameter to disable sorting
> in these instances, so use that to prevent this unnecessary work.
> 
> Each nm run on its own, x86-64, median of 5:
> 
>                              GNU nm 2.47              llvm-nm 22
>                           before  after   delta    before  after   delta
>   defconfig
>   sorttable, nm -S vmlinux 0.080s 0.039s -0.041s   0.265s 0.113s -0.152s
>   check-function-names.sh  0.072s 0.033s -0.039s   0.244s 0.102s -0.142s
>   VOFFSET                  0.077s 0.034s -0.043s   0.261s 0.113s -0.148s
>   ZOFFSET                  0.007s 0.005s -0.002s   0.005s 0.005s  0.000s
>   TOTAL                                  -0.125s                 -0.442s
> 
>   allmodconfig
>   sorttable, nm -S vmlinux 0.156s 0.063s -0.093s   0.539s 0.223s -0.316s
>   check-function-names.sh  0.149s 0.054s -0.095s   0.537s 0.217s -0.320s
>   VOFFSET                  0.146s 0.052s -0.094s   0.524s 0.221s -0.303s
>   ZOFFSET                  0.007s 0.005s -0.002s   0.006s 0.004s -0.002s
>   TOTAL                                  -0.284s                 -0.941s
> 
> llvm-nm appears to be a lot slower than GNU nm, so these builds naturally
> improve the most.
> 
> The four run one after another in the serial tail of every build that links
> vmlinux so impact kernel builds directly.
> 
> In an allmodconfig the decompressor is built in parallel while the modules,
> so only the two before the vmlinux link contribute to build time.
> 
> The build outputs remain unchanged.
> 
> Whole build, 128-thread Threadripper 9980X, median of 3:
> 
>                                          before    after     delta
>                                        ----------------------------------
>   x86 defconfig, touch mm/vma.c, gcc    10.02s     9.83s    -0.19s (-2%)
>   x86 defconfig, touch mm/vma.c, clang   9.52s     9.24s    -0.28s (-3%)
>   x86 defconfig, clean, gcc             28.71s    28.58s    -0.13s (-0.5%)
>   x86 defconfig, clean, clang           28.69s    28.31s    -0.38s (-1%)
>   x86 allmodconfig, touch mm/vma.c, cl  40.52s    39.83s    -0.69s (-2%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

This seems like it is worth taking now but I would appreciate an x86
maintainer ack.

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
