Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CC5CF3188
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUxkemhE5aV0GITx3dNPpRpnwSC4mn/aYBqf5lVM3tA=; b=y9CTOLjYMZTgbO
	uANjRu/08yyeliscfpxHw3aGcnOcEw6ou0yMezMbb8IsPiLI+/xAgyusHcUiNVClAWE9PWO+VKskm
	abNx7rAn1ew6p3aDo6k6d4ZkKppaAzMgRvo6MUvuk3IsRtpEyn3WVOxVKPfMjnYzqozfK5dHf4VFn
	rEI9m1P/u778jj/Xfoy+pVB7dreV1/OglXIuD0j97RSMcXK/ZQ6XT3nLaRa9VLzCVfhVdCabT069d
	MTp5j48FBsXqKpDmVs9FL98ASHTf7wtLwfeRHbMXt0/eetoQorvp22mfX19+i0L+ZF4m/KovduCuw
	BMvbDBH58/7OsqvubBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svkgR-000000049SO-0Tyd;
	Tue, 01 Oct 2024 21:45:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svkgO-000000049RT-0JQn;
	Tue, 01 Oct 2024 21:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65571A432FC;
	Tue,  1 Oct 2024 21:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B139AC4CEC6;
	Tue,  1 Oct 2024 21:45:16 +0000 (UTC)
Date: Tue, 1 Oct 2024 17:46:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Baron <jbaron@akamai.com>, Ard
 Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak
 <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Conor
 Dooley <conor.dooley@microchip.com>, Samuel Holland
 <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao
 <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton
 <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
Message-ID: <20241001174606.6f396dfd@gandalf.local.home>
In-Reply-To: <20241001211543.qdjl4pyfhehxqfk7@treble>
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
	<20241001-tracepoint-v9-1-1ad3b7d78acb@google.com>
	<20241001211543.qdjl4pyfhehxqfk7@treble>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_144524_283369_677CBD84 
X-CRM114-Status: GOOD (  30.13  )
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

On Tue, 1 Oct 2024 14:15:43 -0700
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Tue, Oct 01, 2024 at 01:29:58PM +0000, Alice Ryhl wrote:
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.  
> 
> Instead of extending the old deprecated static key interface into Rust,
> can we just change tracepoints to use the new one?

Sure, care to send the patch properly, and I can add it to my queue.

-- Steve

> 
> /me makes a note to go convert the other users...
> 
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Subject: [PATCH] tracepoints: Use new static branch API
> 
> The old static key API based on 'struct static_key' is deprecated.
> Convert tracepoints to use the new API.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  include/linux/tracepoint-defs.h | 4 ++--
>  include/linux/tracepoint.h      | 8 ++++----
>  kernel/tracepoint.c             | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/tracepoint-defs.h b/include/linux/tracepoint-defs.h
> index 4dc4955f0fbf..60a6e8314d4c 100644
> --- a/include/linux/tracepoint-defs.h
> +++ b/include/linux/tracepoint-defs.h
> @@ -31,7 +31,7 @@ struct tracepoint_func {
>  
>  struct tracepoint {
>  	const char *name;		/* Tracepoint name */
> -	struct static_key key;
> +	struct static_key_false key;
>  	struct static_call_key *static_call_key;
>  	void *static_call_tramp;
>  	void *iterator;
> @@ -83,7 +83,7 @@ struct bpf_raw_event_map {
>  
>  #ifdef CONFIG_TRACEPOINTS
>  # define tracepoint_enabled(tp) \
> -	static_key_false(&(__tracepoint_##tp).key)
> +	static_branch_unlikely(&(__tracepoint_##tp).key)
>  #else
>  # define tracepoint_enabled(tracepoint) false
>  #endif
> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index 6be396bb4297..ab5162fc3e4a 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -228,7 +228,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  #define __DECLARE_TRACE_RCU(name, proto, args, cond)			\
>  	static inline void trace_##name##_rcuidle(proto)		\
>  	{								\
> -		if (static_key_false(&__tracepoint_##name.key))		\
> +		if (static_branch_unlikely(&__tracepoint_##name.key))	\
>  			__DO_TRACE(name,				\
>  				TP_ARGS(args),				\
>  				TP_CONDITION(cond), 1);			\
> @@ -254,7 +254,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  	extern struct tracepoint __tracepoint_##name;			\
>  	static inline void trace_##name(proto)				\
>  	{								\
> -		if (static_key_false(&__tracepoint_##name.key))		\
> +		if (static_branch_unlikely(&__tracepoint_##name.key))	\
>  			__DO_TRACE(name,				\
>  				TP_ARGS(args),				\
>  				TP_CONDITION(cond), 0);			\
> @@ -291,7 +291,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  	static inline bool						\
>  	trace_##name##_enabled(void)					\
>  	{								\
> -		return static_key_false(&__tracepoint_##name.key);	\
> +		return static_branch_unlikely(&__tracepoint_##name.key);\
>  	}
>  
>  /*
> @@ -308,7 +308,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  	struct tracepoint __tracepoint_##_name	__used			\
>  	__section("__tracepoints") = {					\
>  		.name = __tpstrtab_##_name,				\
> -		.key = STATIC_KEY_INIT_FALSE,				\
> +		.key = STATIC_KEY_FALSE_INIT,				\
>  		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
>  		.static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
>  		.iterator = &__traceiter_##_name,			\
> diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
> index 8d1507dd0724..dc160cc0b616 100644
> --- a/kernel/tracepoint.c
> +++ b/kernel/tracepoint.c
> @@ -358,7 +358,7 @@ static int tracepoint_add_func(struct tracepoint *tp,
>  		tracepoint_update_call(tp, tp_funcs);
>  		/* Both iterator and static call handle NULL tp->funcs */
>  		rcu_assign_pointer(tp->funcs, tp_funcs);
> -		static_key_enable(&tp->key);
> +		static_branch_enable(&tp->key);
>  		break;
>  	case TP_FUNC_2:		/* 1->2 */
>  		/* Set iterator static call */
> @@ -414,7 +414,7 @@ static int tracepoint_remove_func(struct tracepoint *tp,
>  		if (tp->unregfunc && static_key_enabled(&tp->key))
>  			tp->unregfunc();
>  
> -		static_key_disable(&tp->key);
> +		static_branch_disable(&tp->key);
>  		/* Set iterator static call */
>  		tracepoint_update_call(tp, tp_funcs);
>  		/* Both iterator and static call handle NULL tp->funcs */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
