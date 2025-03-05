Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A38C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Bk8IKrCDC/3wJPguImpWjH++1/xqpOQswTHjH/esyag=; b=2DtG6fvbJjtj3UdzKqjny+cYg5
	nMQwCbirTUM5IjkRuYdTXTh39D60Kd3hKO9HpniMX3oz+/0uNxd/w0xt19gBjy/TS0S4bl68CGQtL
	LzlFU+DBPIKAscFm+aDeNhu88I7yNp8NUvglCYj8hZGlDsExWVihlpI6Zoa4yt46ivWNt4yB4VAlV
	oQypS3v4VDOfrDPuts23DMhUCYPmw3jqrcayb6yvuI7rHzNHmFlgdqik/CZezuwmrXRQzmKEIlVPN
	G1pLovBMSLsROWh9q6EeQXx/8JNbESr5jD+eDzVdVNPOZa27F1kpW4+ZHMldNT57ILQWTYaeMRaUR
	U+SgfM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmNn-00000007ksq-2YnC;
	Wed, 05 Mar 2025 10:53:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkLE-00000007OvR-3wiF
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 08:43:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bcc04d2ebso12431635e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741164179; x=1741768979; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=zh1E3pITPbkwcsDp7V2wX5NTiyE8+mCwxAmhprc/XuKMrWKdUS7IQZdQoY8XBK8IYV
         4IyVgp0h4PxacRBShzxHaEB2ytNDTVew4b7vbpaAv7YjWHrOML+CNnIILb0EEuEkQaSF
         jA4nfnzjWkiuMQo4M11k2IQJv8EYkbUq4JomfMw59MpUXyKOpFBVDkIZIwW7h8ljtL3S
         rii+OvMSzI86Cz1iZurZcmecU2tjiSn9Y8JOWCR9eTMZcYLoC23GlJK/gKk4g30GaFrz
         epI8jBRWHF/2S5b1AF7Q6AbRlOgELhnRDNuxLUm80Crug+8ECHUFqXsR2k0qrKqmqH+2
         zCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164179; x=1741768979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=R5pW53NGmzTmoyd+jaNELWXMRZTDEHeiiDwHIPxXIF0bTqvN0RewKhuQ7ujBwrKBnM
         irUYtUrvjKSQxd6vEki0eDrqIfY+03YqCB0RbR1W+u84JB16xEfYwj9ve6uMxA189zWf
         DNHwPcHON0sTXqeD9kQZPCLUf89TYymIzaPIaS7PnAvx3nLdQQyXbsjcf+ZGM4nxG3hr
         7SCLXTMen8u5iICs9CRSZklTZNXpBkTn2aC0t4JFZp0KkkbMRFNEe0qFzyNIDZ1W0I5/
         rAQSL/AYpc2ZXhrdu6IK9xwzTemWzmvtXI/4GWn4H45R0mk8u+h3UL1+y/gm8qbvYFWe
         /unA==
X-Forwarded-Encrypted: i=1; AJvYcCU00zOIiEacNmB3VRqHwhxqYVIE6je40jC7vWDg3FqjPEhfxmvTEILDpRXqE8WAB/Jh9AMw1IcKgUht7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YytIrOLW5hX8fbGjHQHM8LV8AgM/pNxpdO19lTKqFuweNimp/os
	qmDPL2wW7R+hIgrj3XaBMtVNmI082pBQUcJa3K6hFaD2quVyXpaSSGfafUrslcVFosh/+yPcSME
	4JXPXmwMXWeeIwg==
X-Google-Smtp-Source: AGHT+IGNc0nObqBIdB7e0pv2I7PeyN0NrbTAt23TRGJiElvbDtYcA/dcph5rmLVDajCFRggPb9cddtoV966/r0s=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:43b:c99a:4af8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c09:b0:43b:d04a:3506 with SMTP id 5b1f17b1804b1-43bd2ad9527mr12625425e9.25.1741164179002;
 Wed, 05 Mar 2025 00:42:59 -0800 (PST)
Date: Wed, 5 Mar 2025 08:42:57 +0000
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
Message-ID: <Z8gOkeJ8o2pMCwGu@google.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
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
X-CRM114-CacheID: sfid-20250305_004300_979754_6F8EC6C2 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust at compile time by using the C
> preprocessor.
> 
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).

Nit: Should be file!() not file()!.

> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f1d7f4225332 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> \ No newline at end of file

There should be a newline.

> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori

2025?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            line = const line!(),
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }
> +        // SAFETY: Just an FFI call.
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }

I generally prefer to have the cfgs on the macro rather in its
expansion. That avoids emitting a lot of code that is not actually used.

> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! bugflag_taint {
> +    ($taint:expr) => {
> +        $taint << 8
> +    };
> +}

This could just be a const fn.

> +/// Report a warning only once.
> +#[macro_export]
> +macro_rules! warn_on_once {
> +    ($cond:expr) => {
> +        if $cond {
> +            $crate::warn_flags!(
> +                $crate::bindings::BUGFLAG_ONCE
> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)

Or maybe a constant?

const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

$crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
