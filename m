Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B9DCAC587
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMcQqnVoI+8f9w4o7i1rUsxOECOQ+K3d3+VwVEbOiL0=; b=5F7hTJApxkD79N
	stpJwOqETdEDPQFXvtxe+CIj3ucyQy6DaBFUqZwih9Pnuwo82z6TALfsVM/B0tEgErvN9J5TSQyT0
	/xdUJIKwfqbkMTnNqalnXp/3SL82XoVyszOz1/U+c7AjD0fGyUwRt8DKJ7F2IIvfwdP7Q0oe1Qs0K
	Wjsk05txO3KTwk7vBUTKn4jX4t7ZERc19ahaf7O9X4Nc183McMg0epoIlGXj192SvEzATXE37Tv5A
	kTSROT7+wplvC2TT60//fo4xs8JulkbiMiL62Ir2/hEXazi1aGSXB27L4Cz0zfBkcHEMdeoW63U28
	H//ljU4sq0o0Zo1I81FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqa6I-00000006NhB-2j8l;
	Tue, 17 Sep 2024 15:26:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqa6G-00000006Ngm-2Pwo
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 15:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF1DB5C53FD;
	Tue, 17 Sep 2024 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E70AC4CEC5;
	Tue, 17 Sep 2024 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726586803;
	bh=1Y09J/5W6IHV5VTgs8vwAGfTMn4lqzG5/gPcakv1nfQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=REkev21bgewL0wukX5RNcZfTF3QJT//wBxJvlGd5u0itFEboL9HIyJ/y+I+Sfa9bJ
	 UghplBhcRX2nUwlwuffRQHIc+/3Azl/VJQxLmFgYaVAliK7+QYRJsw83YywwDavOxR
	 /6dsnU/paby0LKCyImt3YZmAW9H6FGmWW9Cmt60AbbTU/Ryqj3pQMY5OQtGfnoVlAR
	 EPEKos2FaqiinGWPJLq8th+h11fCsAdiEnUVq1ZNFsM2Yu1feGK6SahaPJ1Xzpx8h9
	 VcnhGiUtwY0S86MLQ5u2nb/OTqjmB/1QSJi0FbELZaIeRptdConr/r45oB2gDPa1lz
	 EZoaFmu8MTsdQ==
Date: Tue, 17 Sep 2024 17:26:40 +0200
From: Conor Dooley <conor@kernel.org>
To: Gary Guo <gary@garyguo.net>
CC: Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
User-Agent: K-9 Mail for Android
In-Reply-To: <20240917142950.48d800ac@eugeo>
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com> <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
Message-ID: <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_082644_774004_4F6A6B97 
X-CRM114-Status: GOOD (  16.03  )
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



On 17 September 2024 15:29:50 GMT+02:00, Gary Guo <gary@garyguo.net> wrote:
>On Tue, 17 Sep 2024 10:35:12 +0100
>Conor Dooley <conor@kernel.org> wrote:
>
>> On 17 September 2024 01:08:48 IST, Jason Montleon <jmontleo@redhat.com> wrote:
>> >Clang does not support '-mno-riscv-attribute' resulting in the error
>> >error: unknown argument: '-mno-riscv-attribute'  
>> 
>> This appears to conflict with your subject, which cities gcc, but I suspect that's due to poor wording of the body of the commit message than a mistake in the subject.
>> I'd rather disable rust on riscv when building with gcc, I've never been satisfied with the interaction between gcc and rustc's libclang w.r.t. extensions.
>> 
>> Cheers,
>> Conor.
>
>Hi Conor,
>
>What happens is that when building against GCC, Kbuild gathers flag
>assuming CC is GCC, but bindgen uses clang instead. In this case, the
>CC is GCC and all C code is built by GCC. We have a filtering mechanism
>to only give bindgen (libclang) flags that it can understand.

Yes, but unfortunately I already knew how it worked. It's not flags I am worried about, it is extensions.
Even using a libclang that doesn't match clang could be a problem, but we can at least declare that unsupported.
Not digging it out on an airport bus, but we discussed the lack of GCC support on the original patch adding riscv, and decided against it.

>
>While I do think this is a bit fragile, this is what I think all
>distros that enable Rust use. They still prefer to build C code with
>GCC. So I hope we can still keep that option around.
>
>Best,
>Gary
>
>
>> 
>> >
>> >Not setting BINDGEN_TARGET_riscv results in the in the error
>> >error: unsupported argument 'medany' to option '-mcmodel=' for target \
>> >'unknown'
>> >error: unknown target triple 'unknown'
>> >
>> >Signed-off-by: Jason Montleon <jmontleo@redhat.com>
>> >Cc: stable@vger.kernel.org
>> >---
>> > rust/Makefile | 3 ++-
>> > 1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/rust/Makefile b/rust/Makefile
>> >index f168d2c98a15..73eceaaae61e 100644
>> >--- a/rust/Makefile
>> >+++ b/rust/Makefile
>> >@@ -228,11 +228,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>> > 	-fzero-call-used-regs=% -fno-stack-clash-protection \
>> > 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>> > 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>> >-	--param=% --param asan-%
>> >+	--param=% --param asan-% -mno-riscv-attribute
>> > 
>> > # Derived from `scripts/Makefile.clang`.
>> > BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>> > BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>> >+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
>> > BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>> > 
>> > # All warnings are inhibited since GCC builds are very experimental,
>> >
>> >base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8  
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
