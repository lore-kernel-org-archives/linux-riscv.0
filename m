Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4459C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15BRfC56Q2Yz0IXk1RkcTxOn8i9MBjdD/LatQLfG1SI=; b=cFz8IhQXHLUaub
	Ad2y1OtC4cPtaihidB0/dL91dUzf64nKx92xScRzVZpEh2pUzc3/fstEMt3B0DcK0mCZ/Pqjj/a+K
	AKpKZOZRJoLg7c/pL+7Pz0S5I8ExwTxb3Ux6Sjtg9FODCt/5WVwFL0k5dKj9ZPCaB4va1yKXAsb1r
	q915MrqAu0YKav9BtGqReQ2UGnmEf7Ix37MlbODOC/9Ex40za7/WlvgrQAVoAyYcX/LEkcMueBnRF
	U49nXWJnmil1SMNPML65j799p4BRcVt0wBRVPmdwKWyR42DtnH95K+arPG51tLfLsz9BH5pae+3xE
	kX3Ast4qhdr4eZF0Rpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8xJ-0000000DBuq-29mD;
	Thu, 22 Aug 2024 14:38:29 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8xE-0000000DBtn-0SJG;
	Thu, 22 Aug 2024 14:38:26 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7a20b8fa6dcso58973885a.3;
        Thu, 22 Aug 2024 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724337502; x=1724942302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as3zLpP+ypLOVnuaFbYC0lf0eOdREEs1DY49MjXOZrs=;
        b=badoEv1Czcq+hfVUbep/6DjdhbaXPWuXzQSd5DMQz9ol2KkCwwIrynFcijeFxlmkEv
         ODb1XZS5Bn2TrFxv5TZhkWRKiYxlBh2vIN4zsVT7e7sBSc3wThxNbkgCM1p5SJ8wW1NA
         OE/4gUuwcupsI9qFZKfjXm37sZFJqiVjHt6agBLafvaE7KTlpPiEdBmYSJkttRZKNh3g
         +l2PBxuBbuJyVAtryPPp0oty0eqORtWN6fXnhE3qr65KpofjUnC2WJ6Jxh7ddftykHF4
         gKL1l1t0Wd34F3cxi8JAN4fGa02lAXNlgqux4kXFXfCX2KrG77MYIfWpktdj06KnZe4V
         WSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724337502; x=1724942302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=as3zLpP+ypLOVnuaFbYC0lf0eOdREEs1DY49MjXOZrs=;
        b=u9T1YlESpCvOPOgPUNyc65CmxTgG5T6m73Ig3gPU857oq9sdeuv8pKgM7WkFFLAEhC
         yyii1Wy60pa4ABuxmM5dNbf2JYy5kfyER0Z+ycyODYIIkJp5njzLRr9sif3la3dT/0UK
         5rVg85KFybIMVVtv5lgvUcx27bcY9b8DhtqSe+lRo6XRgcr98oTZnpA2Ir72Ycg6WuVJ
         pfSrf+QOahPHQGvsai90GLZizpA06wdzJPNq2xHecsBOSwNkRX7EKrSFHCAABOGm9c12
         4wci3qz6hdOlRpPPOY04Mlz6St+d5PMTPJYjwgK5K3TRvZ+nsQn+BT3rXk5ngNdqt6/m
         u5wg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/7mYa67AjSKOcUXKbzf7QoJAnajiUpKzGjs5B3sbXSwOK5it+OMKfzKjOaN0s4fUGL43H4SOuucGe7g=@lists.infradead.org, AJvYcCXlDnnPG5tAYM9tP6DNGeaTTe+NwhynUkJDVMlRZM/u3Hvq/gf1XV1l2zcDa2Gzst/hydhKtu5Nb4llCJvoZgzb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+43+tyk4Lwr9i6nrHYtxQq1HcnoT6y9mzxKx4ZHTzn64usCs1
	6bnlEe1oL1GCENh+oU/F3j7sxWp84H6yEBDzCqUV4uwH9iOTTfVu
X-Google-Smtp-Source: AGHT+IGHKAz0cDx9YYukajphluySKz9oqfl1AgEwpqBpNV/QBSal2NixrEBUNudaTlOlqfVhKnGlGA==
X-Received: by 2002:a05:620a:2403:b0:7a3:5004:43dc with SMTP id af79cd13be357-7a67490c94dmr644776585a.40.1724337502335;
        Thu, 22 Aug 2024 07:38:22 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3bb1a9sm74722285a.75.2024.08.22.07.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 07:38:22 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 1E339120006A;
	Thu, 22 Aug 2024 10:38:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 22 Aug 2024 10:38:20 -0400
X-ME-Sender: <xms:W03HZgAVqETYrm2sklYPOy12UyZ3-XdbZ22P7ahQeBxX18CA8L7iAA>
    <xme:W03HZigNZeIrlbZnJab5BlEscW6EfQGry1sN8Z09GvcSzRIQhKJpWH2eg6wr8i6Xo
    CVniNOTQOr74whZ8Q>
X-ME-Received: <xmr:W03HZjniGPf4oZLxzv1hUuuDXc25Ecp6zCNFGVt-7eUyaGV_aCY-88jICeHMzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvtddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthht
    ohepmhhhihhrrghmrghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghthhhivg
    hurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopehpvght
    vghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjphhoihhmsghovgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdp
    rhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:W03HZmz0RtCHvRdvvXhdHK6CiBfNaoKMqVWSyXRGzdy2hGudUXwXoA>
    <xmx:XE3HZlTeoqW4ASRM93Fuf6EcaxoPJZDQw4l0yazWG2D0fH-CwPClkg>
    <xmx:XE3HZha-bijkYnGhZ4anF7oaQnj_Yj5ncHajXmz-kW6koLOc61Bm0w>
    <xmx:XE3HZuRE1Hh1EnpcXCfQ5Zdts5zpUvsDto-1ZyijvD61Fs_FwBwGWw>
    <xmx:XE3HZvD5JmuiBQRsCOSO6nYxi0ejgFjW5kNdsVSKH6_WoBFSLWJDzeHx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Aug 2024 10:38:19 -0400 (EDT)
Date: Thu, 22 Aug 2024 07:38:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,	Ryan Roberts <ryan.roberts@arm.com>,
 Fuad Tabba <tabba@google.com>,	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev,
	Carlos Llamas <cmllamas@google.com>
Subject: Re: [PATCH v8 2/5] rust: add tracepoint support
Message-ID: <ZsdNUofUSSNv9jTR@boqun-archlinux>
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
 <20240822-tracepoint-v8-2-f0c5899e6fd3@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-tracepoint-v8-2-f0c5899e6fd3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_073825_014979_57603B77 
X-CRM114-Status: GOOD (  37.48  )
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

On Thu, Aug 22, 2024 at 12:04:14PM +0000, Alice Ryhl wrote:
> Make it possible to have Rust code call into tracepoints defined by C
> code. It is still required that the tracepoint is declared in a C
> header, and that this header is included in the input to bindgen.
> 
> Instead of calling __DO_TRACE directly, the exported rust_do_trace_
> function calls an inline helper function. This is because the `cond`
> argument does not exist at the callsite of DEFINE_RUST_DO_TRACE.
> 
> __DECLARE_TRACE always emits an inline static and an extern declaration
> that is only used when CREATE_RUST_TRACE_POINTS is set. These should not
> end up in the final binary so it is not a problem that they sometimes
> are emitted without a user.
> 
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  include/linux/tracepoint.h      | 22 +++++++++++++++++-
>  include/trace/define_trace.h    | 12 ++++++++++
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/tracepoint.rs       | 49 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index 6be396bb4297..5042ca588e41 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -237,6 +237,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  #define __DECLARE_TRACE_RCU(name, proto, args, cond)
>  #endif
>  
> +/*
> + * Declare an exported function that Rust code can call to trigger this
> + * tracepoint. This function does not include the static branch; that is done
> + * in Rust to avoid a function call when the tracepoint is disabled.
> + */
> +#define DEFINE_RUST_DO_TRACE(name, proto, args)
> +#define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
> +	notrace void rust_do_trace_##name(proto)			\
> +	{								\
> +		__rust_do_trace_##name(args);				\
> +	}
> +
>  /*
>   * Make sure the alignment of the structure in the __tracepoints section will
>   * not add unwanted padding between the beginning of the section and the
> @@ -252,6 +264,13 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  	extern int __traceiter_##name(data_proto);			\
>  	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
>  	extern struct tracepoint __tracepoint_##name;			\
> +	extern void rust_do_trace_##name(proto);			\
> +	static inline void __rust_do_trace_##name(proto)		\
> +	{								\
> +		__DO_TRACE(name,					\
> +			TP_ARGS(args),					\
> +			TP_CONDITION(cond), 0);				\
> +	}								\
>  	static inline void trace_##name(proto)				\
>  	{								\
>  		if (static_key_false(&__tracepoint_##name.key))		\
> @@ -336,7 +355,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  	void __probestub_##_name(void *__data, proto)			\
>  	{								\
>  	}								\
> -	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
> +	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
> +	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
>  
>  #define DEFINE_TRACE(name, proto, args)		\
>  	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
> diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
> index 00723935dcc7..8159294c2041 100644
> --- a/include/trace/define_trace.h
> +++ b/include/trace/define_trace.h
> @@ -72,6 +72,13 @@
>  #define DECLARE_TRACE(name, proto, args)	\
>  	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
>  
> +/* If requested, create helpers for calling these tracepoints from Rust. */
> +#ifdef CREATE_RUST_TRACE_POINTS
> +#undef DEFINE_RUST_DO_TRACE
> +#define DEFINE_RUST_DO_TRACE(name, proto, args)	\
> +	__DEFINE_RUST_DO_TRACE(name, PARAMS(proto), PARAMS(args))
> +#endif
> +
>  #undef TRACE_INCLUDE
>  #undef __TRACE_INCLUDE
>  
> @@ -129,6 +136,11 @@
>  # undef UNDEF_TRACE_INCLUDE_PATH
>  #endif
>  
> +#ifdef CREATE_RUST_TRACE_POINTS
> +# undef DEFINE_RUST_DO_TRACE
> +# define DEFINE_RUST_DO_TRACE(name, proto, args)
> +#endif
> +
>  /* We may be processing more files */
>  #define CREATE_TRACE_POINTS
>  
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 8fd092e1b809..fc6f94729789 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -20,6 +20,7 @@
>  #include <linux/refcount.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/tracepoint.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 91af9f75d121..d00a44b000b6 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -51,6 +51,7 @@
>  pub mod sync;
>  pub mod task;
>  pub mod time;
> +pub mod tracepoint;
>  pub mod types;
>  pub mod uaccess;
>  pub mod workqueue;
> diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
> new file mode 100644
> index 000000000000..cf2d9ad15912
> --- /dev/null
> +++ b/rust/kernel/tracepoint.rs
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Logic for tracepoints.
> +
> +/// Declare the Rust entry point for a tracepoint.
> +///
> +/// This macro generates an unsafe function that calls into C, and its safety requirements will be
> +/// whatever the relevant C code requires. To document these safety requirements, you may add
> +/// doc-comments when invoking the macro.
> +#[macro_export]
> +macro_rules! declare_trace {
> +    ($($(#[$attr:meta])* $pub:vis unsafe fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
> +        $( #[$attr] )*
> +        #[inline(always)]
> +        $pub unsafe fn $name($($argname : $argtyp),*) {
> +            #[cfg(CONFIG_TRACEPOINTS)]
> +            {
> +                // SAFETY: It's always okay to query the static key for a tracepoint.
> +                let should_trace = unsafe {
> +                    $crate::macros::paste! {
> +                        $crate::jump_label::static_key_false!(
> +                            $crate::bindings::[< __tracepoint_ $name >],
> +                            $crate::bindings::tracepoint,
> +                            key
> +                        )
> +                    }
> +                };
> +
> +                if should_trace {
> +                    $crate::macros::paste! {
> +                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
> +                        unsafe { $crate::bindings::[< rust_do_trace_ $name >]($($argname),*) };
> +                    }
> +                }
> +            }
> +
> +            #[cfg(not(CONFIG_TRACEPOINTS))]
> +            {
> +                // If tracepoints are disabled, insert a trivial use of each argument
> +                // to avoid unused argument warnings.
> +                $( let _unused = $argname; )*
> +            }
> +        }
> +    )*}
> +}
> +
> +pub use declare_trace;
> 
> -- 
> 2.46.0.184.g6999bdac58-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
