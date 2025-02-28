Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9683EC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzhLdsVzIXsawHomtEZIA4ivW/dknE2GQo5NZw15Lko=; b=GXnkTOCHT4xMXX
	3KDEF5eBSPiZ3HFJ5DATJPtED5sacIsmzJp0ytHANFLfBA7ul9b1WPTLaWTMtyvXzRmZ75mmUlGvV
	yapV0GxmpM3/ctHcLluVD+K9PeCEbBKl4inmdSCOy1L+wrQWRZdFi0pGxuEJvK7YTum8ne8bGE19i
	KGtw4co1zJ8RaplfdLcA/yvEvY4QVq6eN+Q8/hNzWRNin9Gtvbu5DtXcjTpAE1mOvO9PF4metlUR8
	oSOjkeXUgX+8IDeA/UvpXeoBNtyJJUIF80GP1sfyHsCKdgZ8MuxD9Ak4YqXcW8nOUDDMMMw98lWqy
	kse36EzqmIR7FOf7x2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxQN-0000000AYUO-1JSD;
	Fri, 28 Feb 2025 10:16:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxNI-0000000AXNc-24qM;
	Fri, 28 Feb 2025 10:13:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DDB144453;
	Fri, 28 Feb 2025 10:13:33 +0000 (UTC)
Message-ID: <608d690a-54ad-4c1e-bf4b-b21c81792cfd@ghiti.fr>
Date: Fri, 28 Feb 2025 11:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN
 asm code sharing with Rust
Content-Language: en-US
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
 yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
 <20250213135759.190006-3-fujita.tomonori@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250213135759.190006-3-fujita.tomonori@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtugdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemgegrvggsmeguieefugemvdgskeehmegvtgdtuggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdql
 hhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_021344_691380_10DD625E 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi FUJITA,

On 13/02/2025 14:57, FUJITA Tomonori wrote:
> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
> Rust to avoid the duplication.
>
> No functional changes.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>   arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 1aaea81fb141..6ab13b56feb0 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
>   
>   #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>   #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
> +#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
>   #else
>   #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
> -#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> +#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
>   #endif
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#define __BUG_ENTRY			\
> +#define __BUG_ENTRY(file, line, flags)	\
>   	__BUG_ENTRY_ADDR "\n\t"		\
> -	__BUG_ENTRY_FILE "\n\t"		\
> -	RISCV_SHORT " %1\n\t"		\
> -	RISCV_SHORT " %2"
> +	__BUG_ENTRY_FILE(file) "\n\t"	\
> +	RISCV_SHORT " " line "\n\t"	\
> +	RISCV_SHORT " " flags
>   #else
> -#define __BUG_ENTRY			\
> -	__BUG_ENTRY_ADDR "\n\t"		\
> -	RISCV_SHORT " %2"
> +#define __BUG_ENTRY(file, line, flags)		\
> +	__BUG_ENTRY_ADDR "\n\t"			\
> +	RISCV_SHORT " " flags
>   #endif
>   
>   #ifdef CONFIG_GENERIC_BUG
> -#define __BUG_FLAGS(flags)					\
> -do {								\
> -	__asm__ __volatile__ (					\
> +
> +#define ARCH_WARN_ASM(file, line, flags, size)			\
>   		"1:\n\t"					\
>   			"ebreak\n"				\
>   			".pushsection __bug_table,\"aw\"\n\t"	\
>   		"2:\n\t"					\
> -			__BUG_ENTRY "\n\t"			\
> -			".org 2b + %3\n\t"                      \
> -			".popsection"				\
> +		__BUG_ENTRY(file, line, flags) "\n\t"		\
> +			".org 2b + " size "\n\t"                \
> +			".popsection\n"				\
> +
> +#define __BUG_FLAGS(flags)					\
> +do {								\
> +	__asm__ __volatile__ (					\
> +		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
>   		:						\
>   		: "i" (__FILE__), "i" (__LINE__),		\
>   		  "i" (flags),					\
>   		  "i" (sizeof(struct bug_entry)));              \
>   } while (0)
> +
>   #else /* CONFIG_GENERIC_BUG */
>   #define __BUG_FLAGS(flags) do {					\
>   	__asm__ __volatile__ ("ebreak\n");			\
> @@ -78,6 +83,8 @@ do {								\
>   
>   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
>   
> +#define ARCH_WARN_REACHABLE
> +
>   #define HAVE_ARCH_BUG
>   
>   #include <asm-generic/bug.h>


This looks good to me so:

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
