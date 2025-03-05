Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EDDC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X15VH3f17PMGfWjdJbobxo0oSQX2QZFVkvmKWBifbWk=; b=afQ1T75YXaiXu7te/EJo+C89Bh
	3zmTcvDIjlZZai6s84rvXfpelZHeieUSbNpFDEwss/DLEEpfqEJSjC5NlLyq/je9DYuqL9wRtD2J5
	VDbaLHssr72/4Cx77atT3TkjjgeDT5UNdKVlpi9VL2MeWbdGu66SR5DyE1z6O3BgWcb0BqYJIDbBh
	WTInxGFdoIQ1FThGuvpP9G6VYc/dDNfz9DNRJyKJVvVDzGWKatce0kKxq8JhP364UZTcREdkBg5zd
	EOPoFixg3pzXG7+45icteG9ONR4+IGDem+y1oaF697eeNnQz+7QPl/jQ+YgGLoQivcce9CcwR0rwv
	QQmNP4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn6a-00000007tLG-30yB;
	Wed, 05 Mar 2025 11:40:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm74-00000007i4Q-1TTV
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 10:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iwAGkOur7FEFFxYryhuBZi0B3fdJNiM+Y5CHrkG/U3c=; b=I3qeSvO3UWVbg/+VhuAkD4S7WH
	vbjWgAWqgVPP+Lv90lQ8jzZyeHt4FEhDOYdKZmDOPL8SRrCdCIFZceR4bMhkX1sgSbUT28v3waTWa
	fTf9Wi7LNR36KQgDBBUi0fHxG/wBrnEa6iHHLipvezrVZzy0IqADIbmG8MYh/JpXqPTIeUFMf2ooM
	qjE/Rl/+a6609RMXcDwqqaZD6mVc/uAKGtVtGKyVdFxoPMjnqKK8+NlsKv3NvnaVTETfFxxX6qVO4
	dgvqpO3i65c4cuumj/mDFTVXeyyCJMd1tfdGLvwDC24YDmt/uBrMU/jXtP04ZrgqSOgLLT865R2W6
	lmw8ZAxQ==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm71-00000005JHj-0qPD
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 10:36:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so7604425e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741170984; x=1741775784; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwAGkOur7FEFFxYryhuBZi0B3fdJNiM+Y5CHrkG/U3c=;
        b=CXN69ny69uq3gDEtEPRt5yqpP9Hm/QHhiegK6XevykktGU1sPmJrq64EvgPOmJvkL9
         vrwikFCbkHJzGMuNnOi9vnHq2IjnFUJ7mGUuHzBRRPvyR2clal10UJ54hrZRO3m74xxj
         2nfp0+D5gCvGcvPCzBLgAiNLGs9uDC2lah/uUHXhYTsVbu5L8ltzCYoIigGylWHd1pwT
         cvKlgQpCB4uYF8M8XCugDy3ppgJ0+tLnne9tcaCJhJe/zZR3ViA1R0YmwTJzdUyVJCXu
         k7pYYdWLZlQmj5IoivJKRR7SeIXMLuqD6tYxAwE2rfuG+M2DwvGwprU1DKiC01NEabyB
         kPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170984; x=1741775784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwAGkOur7FEFFxYryhuBZi0B3fdJNiM+Y5CHrkG/U3c=;
        b=LryHwMzmaojiAwvz++2282BusETSc/8RYfyF/IfcgZz+h2v/5WbLLGFNNoWk127NXS
         WOo6Ui0/TD/pybi7HiQihPAPbaNUmVRkN2ghYv5ZQRbtvpZuMjO35jjyVjysYLGtH47N
         7BOizUdltz3eL0+X/Fa+jn3QDSb7+HyT+0Nw8BnN9ucZWS8o5rSDE7e7uwM9z3Xc6LpX
         N41J/SFIMHPrLVO6O69ZCeQjHYOgnBTM3W1RUq3sDkMd4iYyzPHfQVYAO0Oxme2EylT7
         O/oPxTQ4iup05ORLt7VmzW6B30c4qHtJKGW66AQrKjJHCrvqVB+ZR1EPAs6/YibRo89/
         t7VA==
X-Forwarded-Encrypted: i=1; AJvYcCV6y4TRAton6euz4Qt8k76Mn/tNVaGkLIjS3ji7EuDZBk3jI4pkDkM2yXqWTQ9yu3iz+ieboyPmhsMZhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ppXcwSWeypra6cQNnbFtzb0Q2IILtbWHd24NzHPuviVwLJ2R
	n2oFh06AfGsSGiPcvLkExoYFzAha89NEZeEyr1wl76g/gPEg57MJoviWBKbzBa6ao81qh8R0Dd8
	7ASdqS6VUM85YRA==
X-Google-Smtp-Source: AGHT+IF4p+WGtfI1ypZ1YJkfslZJU6mygbMMyIKJy0w0qOVB2Gh6dAbB+kwJwMv93DtfV/Rfk/Pmmkxz4x/UHTU=
X-Received: from wmrn38.prod.google.com ([2002:a05:600c:5026:b0:43b:c7b3:c586])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b17:b0:43b:cf12:2ca1 with SMTP id 5b1f17b1804b1-43bd2969470mr21132275e9.10.1741170984586;
 Wed, 05 Mar 2025 02:36:24 -0800 (PST)
Date: Wed, 5 Mar 2025 10:36:22 +0000
In-Reply-To: <20250305.192403.996225631653343672.fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
 <20250213135759.190006-6-fujita.tomonori@gmail.com> <Z8gOkeJ8o2pMCwGu@google.com>
 <20250305.192403.996225631653343672.fujita.tomonori@gmail.com>
Message-ID: <Z8gpJsQlkjAQ0EwU@google.com>
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
X-CRM114-CacheID: sfid-20250305_103627_278860_C2B4856E 
X-CRM114-Status: GOOD (  25.53  )
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

On Wed, Mar 05, 2025 at 07:24:03PM +0900, FUJITA Tomonori wrote:
> On Wed, 5 Mar 2025 08:42:57 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
> >> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> >> macros doesn't work so this uses the assembly code exported by the C
> >> side via ARCH_WARN_ASM macro. Like the static branch code, this
> >> generates the assembly code for rust at compile time by using the C
> >> preprocessor.
> >> 
> >> file()! macro doesn't work for the Rust inline assembly in the same
> >> way as __FILE__ for the C inline assembly. So the code to handle a
> >> file name is different from the C assembly code (similar to the
> >> arm64/loongarch assembly).
> > 
> > Nit: Should be file!() not file()!.
> 
> Ops, thanks.
> 
> Actually, the above comment is obsolete. With your solution in the
> previous mail, I can remove the asm code for the file name. I'll
> remove the comment.
> 
> 
> >> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> >> index 6ba39a178f30..f1d7f4225332 100644
> >> --- a/rust/kernel/.gitignore
> >> +++ b/rust/kernel/.gitignore
> >> @@ -1,3 +1,5 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  
> >>  /generated_arch_static_branch_asm.rs
> >> +/generated_arch_warn_asm.rs
> >> +/generated_arch_reachable_asm.rs
> >> \ No newline at end of file
> > 
> > There should be a newline.
> 
> Ah, I'll fix.
> 
> >> +++ b/rust/kernel/bug.rs
> >> @@ -0,0 +1,100 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +// Copyright (C) 2024 FUJITA Tomonori
> > 
> > 2025?
> 
> I'll add.
> 
> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> >> +macro_rules! warn_flags {
> >> +    ($flags:expr) => {
> >> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> >> +        // SAFETY: Just an FFI call.
> >> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> >> +        unsafe {
> >> +            $crate::asm!(concat!(
> >> +                "/* {size} */",
> >> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> >> +                "111:\t .string ", "\"", file!(), "\"\n",
> >> +                ".popsection\n",
> >> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> >> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> >> +            line = const line!(),
> >> +            flags = const FLAGS,
> >> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> >> +            );
> >> +        }
> >> +        // SAFETY: Just an FFI call.
> >> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> >> +        unsafe {
> >> +            $crate::asm!(
> >> +            concat!(
> >> +                "/* {size} */",
> >> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> >> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> >> +            flags = const FLAGS,
> >> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> >> +            );
> >> +        }
> > 
> > I generally prefer to have the cfgs on the macro rather in its
> > expansion. That avoids emitting a lot of code that is not actually used.
> 
> You prefer the following?
> 
> #[cfg(all(CONFIG_BUG, CONFIG_DEBUG_BUGVERBOSE, not(CONFIG_UML)))]
> macro_rules! warn_flags {
> ...
> }
> 
> #[cfg(all(CONFIG_BUG, not(CONFIG_DEBUG_BUGVERBOSE), not(CONFIG_UML)))]
> macro_rules! warn_flags {
> ...
> }

In this case it probably reads better as

#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
macro_rules! warn_flags {
...
}

#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
macro_rules! warn_flags {
...
}

but yes.

> >> +#[doc(hidden)]
> >> +#[macro_export]
> >> +macro_rules! bugflag_taint {
> >> +    ($taint:expr) => {
> >> +        $taint << 8
> >> +    };
> >> +}
> > 
> > This could just be a const fn.
> 
> Yeah, would a const fn be preferable?

Yes, I think a constant or const fn is preferable over a macro whenever
possible.

> >> +/// Report a warning only once.
> >> +#[macro_export]
> >> +macro_rules! warn_on_once {
> >> +    ($cond:expr) => {
> >> +        if $cond {
> >> +            $crate::warn_flags!(
> >> +                $crate::bindings::BUGFLAG_ONCE
> >> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
> > 
> > Or maybe a constant?
> > 
> > const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);
> 
> Ok, but you prefer "<< 8" than using const fn bugflag_taint()?

I'm also happy with
const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | bugflag_taint(bindings::TAINT_WARN);

Up to you.

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
