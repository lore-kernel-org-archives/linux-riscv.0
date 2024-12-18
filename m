Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA57E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGm5QbZZb1Fph91cYaq0zvHFmk+hMH96KCzYDu6u4NM=; b=QS3pWz9mnUS6C8
	j6CUEtjxoXjJFSHo9mTQYFx4EUAQv+O+ouSEIyB3PIcWyR77sbsESTLmiVqk+NSOEmi98QpDT+qH8
	8i8CCCDH3Ce8GcPN4S1oVlC1fPkRmvdqccbVhbmolEBiE1qyieTVH8XgOUjqQNw3apLQkLrPaEFkb
	21QOsKcVyaFWmXgz/WZbj37h2KHXt5A4mfJiiVVPf/69uRnsS57ACFoeGKVjPsbS3Rvsd+UPOGzTG
	0xc5CfWacu8ZukSZ909iXYXJiSntxxm3VBC0cQiFlyFDmYrVQ2z6EXmjpFh23TkG+LTOWIs1zufQu
	Hi7dcUlbq7dfbzguxAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNssU-0000000GYLG-44Bn;
	Wed, 18 Dec 2024 12:10:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrqg-0000000GNv2-3znP;
	Wed, 18 Dec 2024 11:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5cD8OmJ5EJImHph/nljKjaiMeqKYmN9nRcxx7bv6biY=; b=PjFMlKbMqlAS16sFSWEmfZC7Wd
	P7RU2meHq1qSBPCPI+5O0Bh/UHfH0kgThLleV7PBlaDHhdnqij+O9+8Hp8P/6XzTslcCs618A7xxh
	tTLN9cM00EolRE8v+YoiFzZndhiPA+6wE+3Ubn3QGkohQahyOph6hylE2SWfo0pUZRsD3zl4Nc3Sa
	lZqPfJim7Xwwv0wyux9ztirXGgIH89idyA11QqWas8x1zZUdEreN6vSS4jkeDzXjC6mf/OFIRFTKv
	8ZhluUYWcGVMvRbYbKlt3+MTKxhQzy5XdREKx1B7Bnq+GN34QEohDXpca+yegnhUQtM8Q9o+YDhvO
	XDIMqFsw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrqb-0000000AfzQ-0dqQ;
	Wed, 18 Dec 2024 11:04:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4EE883000CA; Wed, 18 Dec 2024 12:04:08 +0100 (CET)
Date: Wed, 18 Dec 2024 12:04:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v2 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm
 code sharing with Rust
Message-ID: <20241218110408.GF2484@noisy.programming.kicks-ass.net>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
 <20241218062009.2402650-2-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218062009.2402650-2-fujita.tomonori@gmail.com>
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

On Wed, Dec 18, 2024 at 03:20:05PM +0900, FUJITA Tomonori wrote:
> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
> Rust to avoid the duplication.

This conflicts with some patches I've been sitting on, but nothing that
I can't resolve I think.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index 806649c7f23d..71df68e2a731 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -28,45 +28,42 @@
>  #ifdef CONFIG_GENERIC_BUG
>  
>  #ifdef CONFIG_X86_32
> -# define __BUG_REL(val)	".long " __stringify(val)
> +# define __BUG_REL(val)	".long " val
>  #else
> -# define __BUG_REL(val)	".long " __stringify(val) " - ."
> +# define __BUG_REL(val)	".long " val " - ."
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +#define __BUG_ENTRY(file, line, flags)					\
> +	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> +	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
> +	"\t.word " line        "\t# bug_entry::line\n"			\
> +	"\t.word " flags       "\t# bug_entry::flags\n"
> +#else
> +#define __BUG_ENTRY(file, ine, flags)					\
> +	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> +	"\t.word " flags       "\t# bug_entry::flags\n"
> +#endif
> +
> +#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
> +	"1:\t" ins "\n"							\
> +	".pushsection __bug_table,\"aw\"\n"				\
> +	__BUG_ENTRY(file, line, flags)					\
> +	"\t.org 2b + " size "\n"					\
> +	".popsection\n"							\
> +	extra
>  
>  #define _BUG_FLAGS(ins, flags, extra)					\
>  do {									\
> -	asm_inline volatile("1:\t" ins "\n"				\
> -		     ".pushsection __bug_table,\"aw\"\n"		\
> -		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> -		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> -		     "\t.org 2b+%c3\n"					\
> -		     ".popsection\n"					\
> -		     extra						\
> +	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
> +					   "%c1", "%c2", "%c3", extra)	\
>  		     : : "i" (__FILE__), "i" (__LINE__),		\
>  			 "i" (flags),					\
>  			 "i" (sizeof(struct bug_entry)));		\
>  } while (0)
>  
> -#else /* !CONFIG_DEBUG_BUGVERBOSE */
> -
> -#define _BUG_FLAGS(ins, flags, extra)					\
> -do {									\
> -	asm_inline volatile("1:\t" ins "\n"				\
> -		     ".pushsection __bug_table,\"aw\"\n"		\
> -		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> -		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
> -		     "\t.org 2b+%c1\n"					\
> -		     ".popsection\n"					\
> -		     extra						\
> -		     : : "i" (flags),					\
> -			 "i" (sizeof(struct bug_entry)));		\
> -} while (0)
> -
> -#endif /* CONFIG_DEBUG_BUGVERBOSE */
> +#define ARCH_WARN_ASM(file, line, flags, size)				\
> +	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
>  
>  #else
>  
> -- 
> 2.43.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
