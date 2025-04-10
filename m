Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C121C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yy76UvQ/uKrUTdL4KS1ENYqMn4jdXu3HDLuzHACS37E=; b=2buXYnQAfPNclpoE7tFCBNkHG7
	vehYdzfurbWZXperfyC7Q9qLp+Mh/i2gXC3vTUiMSc5wcV1vlYKgC0GzcviuPF3QTjz2YAhDcVe2f
	G/Na8hEW1BJwOzxQc1RBeAfeYw36vzqfItQ6GkK+qHz2t+g2r7Lh5bTINBHMntlIQdG21SosY0J+J
	o8wRFUngEIgJuea/V8vzcF8WqExZkW9FDJFyyqTgRoDWhR8cHWY9Cos7L3hqZ5vDSWB9Me0xS2Q81
	E60QiWuyqCgrm3V2V3Hx8uzhEjrVkvcXIzjsCLYI23M5O/YY7F8WVTsa38umo8bCjWG3Hi6JAdNyE
	JGTxdaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2myp-00000009ggJ-2fn1;
	Thu, 10 Apr 2025 08:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mVx-00000009bNu-16wD
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Apr 2025 07:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=; b=ApWuyDz4YxADyU3gHgpyiiK/hK
	PLa96vObRlLYr/Kwvny5vDsq7HTn27npWPdevxHEXTa623POzpbV3wFjjp6YGQ0bHZjQ+dDYJ12+T
	YBzQXtUCdD2++MYRQlJmTKMhLAi4cv92j8VNXaRfzB4Ufo1hd4QtwkHyD0BXsBrGphC/XsqGigLfK
	FbZyCxnfMkUbhqnyFSgL2spcOTSKXbdHgt7lVZ8gOur1QG9/Ih1EySyPEWEdl0UgschlbWvKsxAOS
	EIq0d6eTXF+fD5bIIvRawPv7a7BEV0Fq4Bwpv6rKlDgf51x4gqlJRwpkinEIbh9NuYXHXrfBMaiPZ
	3imj2BVA==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2mVu-00000008lww-0dwm
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:39:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so4010715e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744270791; x=1744875591; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=Pz1Cyl2adeytiLqyBJwfnwOHRkDpLq7+M1n51lys7cmrmUQssP9fb5Mw7tECHCEIlm
         pWJg5ZzeImLwOk+Vr8kh0AKHjAY5EbUMNhSd2KShWi9lu3M7yLJ6jKBNSYXAQ0Zu9GZT
         QjOWS7wDCUBSRlnu6/9SDPwPS1K26Lc0SIohDulELRgsUpHwmvUfCBKmt3bJvOfBOK01
         eaoAruAWhIFAQLGghmnZDq2cGx/5h4QOpuOyDadXx8tzDKC0HuUK1GFLSeNqrLIM0+VD
         W7fNLb08ZiKT9RtP4Z2JJPO+Nqs3NPJsYZfPZHIP0pnEIjSAlCgMCtKcHxChTSYLaj8L
         z1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270791; x=1744875591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=W9Tfur3oEupGQneEzc42g7N3ESGuRzYeCu5MYipX/UiaAa5EA97Ul70c9zI1Tos6uG
         J4n1b0IfgghSk5sariqavTE46bd59O/V1onVdb3LomyAwrYE/1WsD18DBnmnTuV1bHZD
         Ex990aSry8ZPGIR4Dnh0CbK7YSBUExCd1+dirJnjofz0r7bldbE5cs3eAtX7+C2TMabb
         tFllZousLa7lx58Z2vh7DoigibHc/IEmxFGyTzmcxMdDxbW3A1i0hFzcDd55RXfmSC6j
         DbKLGhCWL84hIaCUVVGm1ocYfCnCveByacORo9yMxuy1Ib6nlk4GOzUxl3AekRl6Gli4
         bc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAiksZl/PynS6eQXY9HCGZCZonjnvcTHBYAjhrRo/C8X+95NJQ7NaYFxFbAV1JEaZGv50/QYIM9AEYpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIwX1ybwqO3zrRRpl4Q9m6gHff2PIl0yW34lUc4JpKoR1Legs
	yP4QIF+uaqjraPuW5o1OC8NwWzexbBvSqdpxxvLnB1Ir+MWWZSZiIsEHgda+I8ZOA1xriJ4nZ4M
	/uhqKqyyroI8mlw==
X-Google-Smtp-Source: AGHT+IHlkpBGJEWBW3cHYQJGmG67relPMhD9NvzbuRhqbRBizGar1eZ7vJOB4Vl1S32BZGUFqnryZcgjcRbEP1Q=
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0b:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43f2d97d4c7mr15493055e9.29.1744270790968;
 Thu, 10 Apr 2025 00:39:50 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:39:48 +0000
In-Reply-To: <20250409065802.136971-5-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250409065802.136971-1-fujita.tomonori@gmail.com> <20250409065802.136971-5-fujita.tomonori@gmail.com>
Message-ID: <Z_d1xAAptnfzqg1l@google.com>
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_083954_336987_8C1669B3 
X-CRM114-Status: GOOD (  26.37  )
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

On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm32 just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                                 |   8 ++
>  rust/helpers/bug.c                            |   5 +
>  rust/kernel/.gitignore                        |   2 +
>  rust/kernel/bug.rs                            | 114 ++++++++++++++++++
>  rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
>  rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
>  rust/kernel/lib.rs                            |   1 +
>  7 files changed, 144 insertions(+)
>  create mode 100644 rust/kernel/bug.rs
>  create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
>  create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index fa0eea8a9eca..25f498607d1b 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
> +ifndef CONFIG_UML
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
> +endif
>  
>  # Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> @@ -536,5 +539,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
>  ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
> +endif
> +endif
>  
>  endif # CONFIG_RUST
> diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
> index e2d13babc737..a62c96f507d1 100644
> --- a/rust/helpers/bug.c
> +++ b/rust/helpers/bug.c
> @@ -6,3 +6,8 @@ __noreturn void rust_helper_BUG(void)
>  {
>  	BUG();
>  }
> +
> +bool rust_helper_WARN_ON(bool cond)
> +{
> +	return WARN_ON(cond);
> +}
> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f636ad95aaf3 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> new file mode 100644
> index 000000000000..761f0c49ae04
> --- /dev/null
> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! Support for BUG and WARN functionality.
> +//!
> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] = file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] = {
> +            let mut bytes = [0; _FILE.len() + 1];
> +            let mut i = 0;
> +            while i < _FILE.len() {
> +                bytes[i] = _FILE[i];
> +                i += 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.

Safety comments could be improved. This being an FFI call is not the
reason why it's okay. Furthermore, it's not an FFI call.

Otherwise, this series LGTM.

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
