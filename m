Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B931C79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjOVUmyjr+ZGCAHSwOy5viye3TSfH9mKKb0RSRqIf28=; b=McWdSY16EgIQ03
	OikQOTgafDtnx3iiJqqKOVrU6dAK2JhpKU/tsHeY+SmGO9z9s2/DRCFGJbwmLR/JKNu/hTtOH4isY
	Oc8I3/9OqXulfIz4My1QimPq521DYgQNZlbuDv5nZ4gHrbGLjcTLISd4d54mElsGCKDR5Yv7BOJAv
	2sgyY9j48ritJVLPVVBqi448gFZNaaG7j+nkqNGi3/cL/HfUbcjGy5fPjWcqX0VnfAQ4ZQCyVv4ZM
	kzDiOfTRXuzgRKx0x46tjyBBZOaGqqZgCvcwncvhmBy4OHm1rclgfIraPxc7nQ9vumUIfi5r94kfB
	6CJP6YIlTRUVaHiO7CGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGi-0000000DLm7-2gfd;
	Thu, 10 Sep 2026 04:20:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGh-0000000DLlh-0ir1;
	Thu, 10 Sep 2026 04:20:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81E46418A7;
	Thu, 10 Sep 2026 04:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106651F00893;
	Thu, 10 Sep 2026 04:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014010;
	bh=JReepVN6gwZiOP6ZjKJTxF3z3jlGbnLgDKNGMegArdA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EKyQjsS6e6XEhJdYz9bhpQio2w5YXD1FuxIrHGQAxRkY9oBM0vocah1F/W6sDfIic
	 tz1/Bk3fzoC0Zyw+wnJ6F82uubGm4IS6jP01mmDUwUz/1fwgis3rvUIYK07MjwCDDP
	 eThnYCq8yct9FvFK4qtPpASRQAFv4ymdgI50pxzeqy7A4wI7RxT+taUP6/xuWRs/u5
	 GBa0CEi7VjtmoDUUgYGNCEZu4mH+sXc3GdYSe9im2R5GSptHYh0W8WdTJBOOLaSi1P
	 LS17BkT7TWDiyNl+iXPFbzHCYqg5LW+xeB9vhKPWBC4Dfh/ZCbfcfnsSr7zXSiTUrq
	 WZ+mZ8Tsci/YA==
MIME-Version: 1.0
Subject: Re: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_
 pattern
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
In-Reply-To: <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395289.3971858.3678831513020211615.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zHPj2szBcbSmoH4JwyFcKVpCllXE2+9N70k9qnFBnXw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I+xrQq3kizjPMF5IunRUd9HG227qlb41T+wmvQj0
 UPpUGtMRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI/BCG/86vZDfafFTa+W5W
 16etDJcMDQ8xugccf3n4SfNe0XN75x9n+B96Vka7XEJY9Qr331Avtb3Tp5fIP5h8SOr+DN1lkbk
 FWuwA
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

> Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> converted scripts/mksysmap from a shell script to a sed script.
> 
> However an error was made - escaping of '$' required \\ escaping in shell
> but only \ in a sed script.
> 
> This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
> escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
> like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:
> 
> $ grep __pi_\\$ /proc/kallsyms | sort -u
> 0000000000000000 d __pi_$d
> 0000000000000000 t __pi_$x
> 
> Fix the escaping properly.
> 
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> 
> No measurable change in build time.

Same comments as before.

> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Same thing, is this worth taking to stable? Truthfully, you could
probably send these two changes separately from the series so that we
could send them to Linus with the other pending Kbuild fixes, unless
there are objections from Linus or Nicolas on taking that route? Shaving
two patches off of an ~20 patch series is a 10% reduction so seems worth
it?

I'll review some of the other low hanging fruit now so that we can start
chunking this series out, since I too care deeply about build times.

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
