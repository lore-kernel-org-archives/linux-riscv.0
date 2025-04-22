Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D1C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRXAOJ6CvmCy0o7k+kWXsVo+RtO9pE158V/aVF8qGTU=; b=ZHjZ3qSpb+0sX3
	umXsVxDD9+0SZGfgTKonWnS17F6/qEIND6YGqVrHDVU3Ezfs47wZWFKpf4Cw3NLxwfpmOwMQ1vBEA
	oIZBypiZiK5tXC1JP6se9oP/1/j7HZXYGGnU1UDs3t5SmbH+MHYFvZdqu/YvUDgy+waCELdPORSaF
	UWN/Y8vFv6bYKfqh2Kz1pDZwNMVFLojbOfrOQ8p3m4If5BLN1BBmMQyx2lLQzhlDeOZR90E5bYtwg
	1uTCmNqHX/z9iu14HNu2ghwb9z5e7HuBG5j2xbWYqK9FnwZmHbgNjuMiL/InmlqFqRi98SySE0ICH
	KO2cmIeBeZARiKmmesYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DVv-00000007GUP-2NGH;
	Tue, 22 Apr 2025 13:18:15 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CbF-0000000751K-23Eu
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 12:19:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5CDA43B53;
	Tue, 22 Apr 2025 12:19:37 +0000 (UTC)
Message-ID: <8c6e4773-796b-47a2-97c4-e4504801ba48@ghiti.fr>
Date: Tue, 22 Apr 2025 14:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] riscv: uaccess: use 'asm_goto_output' for
 get_user()
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-6-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-6-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetvdffkedvjeefkeegfefgteffleeltefggfdvheekfffhfeeghfeffffhtdelvdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhus
 egvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_051941_670864_B380656B 
X-CRM114-Status: GOOD (  15.84  )
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

On 10/04/2025 09:05, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> With 'asm goto' we don't need to test the error etc, the exception just
> jumps to the error handling directly.
>
> Unlike put_user(), get_user() must work around GCC bugs [1] when using
> output clobbers in an asm goto statement.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [Cyril Bur: Rewritten commit message]
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 95 +++++++++++++++++++++++---------
>   1 file changed, 68 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 719c9179a751..87d01168f80a 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -96,27 +96,58 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>    * call.
>    */
>   
> -#define __get_user_asm(insn, x, ptr, err)			\
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +#define __get_user_asm(insn, x, ptr, label)			\
> +	asm_goto_output(					\
> +		"1:\n"						\
> +		"	" insn " %0, %1\n"			\
> +		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
> +		: "=&r" (x)					\
> +		: "m" (*(ptr)) : : label)
> +#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +#define __get_user_asm(insn, x, ptr, label)			\
>   do {								\
> -	__typeof__(x) __x;					\
> +	long __gua_err = 0;					\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
>   		"	" insn " %1, %2\n"			\
>   		"2:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
> -		: "+r" (err), "=&r" (__x)			\
> +		: "+r" (__gua_err), "=&r" (x)			\
>   		: "m" (*(ptr)));				\
> -	(x) = __x;						\
> +	if (__gua_err)						\
> +		goto label;					\
>   } while (0)
> +#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>   
>   #ifdef CONFIG_64BIT
> -#define __get_user_8(x, ptr, err) \
> -	__get_user_asm("ld", x, ptr, err)
> +#define __get_user_8(x, ptr, label) \
> +	__get_user_asm("ld", x, ptr, label)
>   #else /* !CONFIG_64BIT */
> -#define __get_user_8(x, ptr, err)				\
> +
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +#define __get_user_8(x, ptr, label)				\
> +	u32 __user *__ptr = (u32 __user *)(ptr);		\
> +	u32 __lo, __hi;						\
> +	asm_goto_output(					\
> +		"1:\n"						\
> +		"	lw %0, %2\n"				\
> +		"2:\n"						\
> +		"	lw %1, %3\n"				\
> +		_ASM_EXTABLE_UACCESS_ERR(1b, %l4, %0)		\
> +		_ASM_EXTABLE_UACCESS_ERR(2b, %l4, %0)		\
> +		: "=&r" (__lo), "=r" (__hi)			\
> +		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW])	\
> +		: : label);                                     \
> +	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
> +		(((u64)__hi << 32) | __lo)));			\
> +
> +#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +#define __get_user_8(x, ptr, label)				\
>   do {								\
>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>   	u32 __lo, __hi;						\
> +	long __gu8_err = 0;					\
>   	__asm__ __volatile__ (					\
>   		"1:\n"						\
>   		"	lw %1, %3\n"				\
> @@ -125,35 +156,51 @@ do {								\
>   		"3:\n"						\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
>   		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
> -		: "+r" (err), "=&r" (__lo), "=r" (__hi)		\
> +		: "+r" (__gu8_err), "=&r" (__lo), "=r" (__hi)	\
>   		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));	\
> -	if (err)						\
> +	if (__gu8_err) {					\
>   		__hi = 0;					\
> -	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
> +		goto label;					\
> +	}							\
> +	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>   		(((u64)__hi << 32) | __lo)));			\
>   } while (0)
> +#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
> +
>   #endif /* CONFIG_64BIT */
>   
> -#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
> +#define __get_user_nocheck(x, __gu_ptr, label)			\
>   do {								\
>   	switch (sizeof(*__gu_ptr)) {				\
>   	case 1:							\
> -		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lb", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 2:							\
> -		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lh", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 4:							\
> -		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
> +		__get_user_asm("lw", (x), __gu_ptr, label);	\
>   		break;						\
>   	case 8:							\
> -		__get_user_8((x), __gu_ptr, __gu_err);	\
> +		__get_user_8((x), __gu_ptr, label);		\
>   		break;						\
>   	default:						\
>   		BUILD_BUG();					\
>   	}							\
>   } while (0)
>   
> +#define __get_user_error(x, ptr, err)					\
> +do {									\
> +	__label__ __gu_failed;						\
> +									\
> +	__get_user_nocheck(x, ptr, __gu_failed);			\
> +		err = 0;						\
> +		break;							\
> +__gu_failed:								\
> +		x = 0;							\
> +		err = -EFAULT;						\
> +} while (0)
> +
>   /**
>    * __get_user: - Get a simple variable from user space, with less checking.
>    * @x:   Variable to store result.
> @@ -178,13 +225,16 @@ do {								\
>   ({								\
>   	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>   	long __gu_err = 0;					\
> +	__typeof__(x) __gu_val;					\
>   								\
>   	__chk_user_ptr(__gu_ptr);				\
>   								\
>   	__enable_user_access();					\
> -	__get_user_nocheck(x, __gu_ptr, __gu_err);		\
> +	__get_user_error(__gu_val, __gu_ptr, __gu_err);		\
>   	__disable_user_access();				\
>   								\
> +	(x) = __gu_val;						\
> +								\
>   	__gu_err;						\
>   })
>   
> @@ -369,13 +419,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   }
>   
>   #define __get_kernel_nofault(dst, src, type, err_label)			\
> -do {									\
> -	long __kr_err = 0;						\
> -									\
> -	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
> -	if (unlikely(__kr_err))						\
> -		goto err_label;						\
> -} while (0)
> +	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
>   
>   #define __put_kernel_nofault(dst, src, type, err_label)			\
>   	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
> @@ -401,12 +445,9 @@ static inline void user_access_restore(unsigned long enabled) { }
>   	__put_user_nocheck(x, (ptr), label)
>   
>   #define unsafe_get_user(x, ptr, label)	do {				\
> -	long __err = 0;							\
>   	__inttype(*(ptr)) __gu_val;					\
> -	__get_user_nocheck(__gu_val, (ptr), __err);			\
> +	__get_user_nocheck(__gu_val, (ptr), label);			\
>   	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> -	if (__err)							\
> -		goto label;						\
>   } while (0)
>   
>   #define unsafe_copy_loop(dst, src, len, type, op, label)		\


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
