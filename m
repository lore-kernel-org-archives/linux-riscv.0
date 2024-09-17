Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29E5C35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJuAlQUq80zEfCV1YJHwbHAF5xiP4awOXmBfWsZsi0c=; b=CIYuD5Cs9jOe2I
	3FyRnpgOfVVMe1M9Vvmdxy1uGd4Z8efy2AZcT78NukPyNvIs2J1D2VXdRg0aelngWkREr5thfDCGB
	/o9KDKkM9ANJOu6fb0ER/1ZTn1m8Vk6R84gf00ooptTvLFCJF4RBgE++9vapHEaC7Dlr6I8307GYz
	0URKe/tmYydbLtBgT+Xh3teJKf1GYHURIchEx6Q/WYKi1D3irW6MfY2OEgRcZBWbJQWGp/rGR8NLo
	vDVun7RG4W6BaOGN3G4dVOF7+V08nzWbcLP5HVhPD24l+Uph4xoYS2fipoyvLVUQAxHm+HqiMF7Nl
	+ZiPXtKhSi2q7AeShR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUcA-00000005qLm-3WN0;
	Tue, 17 Sep 2024 09:35:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUc7-00000005qLB-1elN
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 09:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB495A40E98;
	Tue, 17 Sep 2024 09:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC12C4CEC6;
	Tue, 17 Sep 2024 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726565714;
	bh=PfJ9IgurPxHVn2dgYlngAdmfQ/I7auHTbr2Guw965jA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WUVXw6eTeOZVPT/qy8RMHzZbSiMGuAj/1j40338IWQutXqep87QiXE2LEPk4miHy5
	 iB3K2l0LQonIHL81kZtrndWOLciTgCv8RRlecysCGahx+QR3UPhSHbJEfTXnETmPw4
	 LIyG9T9IgVyMZtu58vfISrXy6XXYRXY/Im9DdFpYFKduKbGJ04EwJI+1Q0iK9/3uAB
	 L11jQcy14nh9kvbk6wK/sNNHxF/t56WclkNzSUqyN/G3cttnOlBdOq/Ecdr40YCfc1
	 Rk5MMVscdMW9t2aLzE7ittDOPIENEjb2evLByXakxji2u6jfpBFOLsDjCAb3BdjCKB
	 QLEp4A/3I4asA==
Date: Tue, 17 Sep 2024 10:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com
CC: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
User-Agent: K-9 Mail for Android
In-Reply-To: <20240917000848.720765-2-jmontleo@redhat.com>
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
Message-ID: <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_023515_521908_57EC8A6E 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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



On 17 September 2024 01:08:48 IST, Jason Montleon <jmontleo@redhat.com> wrote:
>Clang does not support '-mno-riscv-attribute' resulting in the error
>error: unknown argument: '-mno-riscv-attribute'

This appears to conflict with your subject, which cities gcc, but I suspect that's due to poor wording of the body of the commit message than a mistake in the subject.
I'd rather disable rust on riscv when building with gcc, I've never been satisfied with the interaction between gcc and rustc's libclang w.r.t. extensions.

Cheers,
Conor.

>
>Not setting BINDGEN_TARGET_riscv results in the in the error
>error: unsupported argument 'medany' to option '-mcmodel=' for target \
>'unknown'
>error: unknown target triple 'unknown'
>
>Signed-off-by: Jason Montleon <jmontleo@redhat.com>
>Cc: stable@vger.kernel.org
>---
> rust/Makefile | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/rust/Makefile b/rust/Makefile
>index f168d2c98a15..73eceaaae61e 100644
>--- a/rust/Makefile
>+++ b/rust/Makefile
>@@ -228,11 +228,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
> 	-fzero-call-used-regs=% -fno-stack-clash-protection \
> 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
> 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>-	--param=% --param asan-%
>+	--param=% --param asan-% -mno-riscv-attribute
> 
> # Derived from `scripts/Makefile.clang`.
> BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
> BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> 
> # All warnings are inhibited since GCC builds are very experimental,
>
>base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
