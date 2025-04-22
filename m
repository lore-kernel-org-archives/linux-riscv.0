Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FE7C369D3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RElLwtRtdLHlqJLcaArdaT4IcbL+gZJC0NPEazE+BrU=; b=BTgTTslMnCo3SO
	h2ZRxwYSsFXQjrqzESDby7CGUNVJa840mzyRoyHTHxx6km6p2m/W5g4ljdjJgUpwQedubsV9QDyIU
	mAFvzwUDnahiaIHHT/T6RqSFReFfcwtP1F2HOHOtwRH5BQw5ANcZr9ChJB5H/51Oq8IxPMtKR34I+
	O6TT+3lSmpau32EB5kZR9Rt08+NVHCcG4595bmWCadaAqrAvCws0J02TKusknKXjsin6WOBGJwJh6
	XmycpMnh+JagMKPEAnyJX6JMr3iE9GLGXnjJfDKA1YoL+3AhnX6Y+eLR+nRb+KFjNEjXilxkQ0B5X
	SpU4zehrdNTRuf4krhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BVE-00000006tDs-0Mzl;
	Tue, 22 Apr 2025 11:09:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aq3-00000006kX6-3lyU
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:26:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 859C2433EB;
	Tue, 22 Apr 2025 10:26:47 +0000 (UTC)
Message-ID: <48151446-1ffd-484a-ac21-511b14fa1511@ghiti.fr>
Date: Tue, 22 Apr 2025 12:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] riscv: implement user_access_begin() and families
Content-Language: en-US
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeelfhgsvgemvddtvgefmedvfhgtfeemkeguudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegthihrihhlsghurhesthgvnhhsthhorhhrvghnthdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvu
 ghupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepjhhrthgtvdejsehjrhhttgdvjedrtghomhdprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_032652_071218_BBE6110D 
X-CRM114-Status: GOOD (  21.39  )
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
> Currently, when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled
> for every word read.
>
> By implementing user_access_begin() and families, the protection
> is disabled at the beginning of the copy and enabled at the end.
>
> The __inttype macro is borrowed from x86 implementation.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 76 ++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index fee56b0c8058..c9a461467bf4 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -61,6 +61,19 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>   #define __disable_user_access()							\
>   	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
>   
> +/*
> + * This is the smallest unsigned integer type that can fit a value
> + * (up to 'long long')
> + */
> +#define __inttype(x) __typeof__(		\
> +	__typefits(x, char,			\
> +	  __typefits(x, short,			\
> +	    __typefits(x, int,			\
> +	      __typefits(x, long, 0ULL)))))
> +
> +#define __typefits(x, type, not) \
> +	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> +
>   /*
>    * The exception table consists of pairs of addresses: the first is the
>    * address of an instruction that is allowed to fault, and the second is
> @@ -368,6 +381,69 @@ do {									\
>   		goto err_label;						\
>   } while (0)
>   
> +static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
> +{
> +	if (unlikely(!access_ok(ptr, len)))
> +		return 0;
> +	__enable_user_access();
> +	return 1;
> +}
> +#define user_access_begin user_access_begin
> +#define user_access_end __disable_user_access
> +
> +static inline unsigned long user_access_save(void) { return 0UL; }
> +static inline void user_access_restore(unsigned long enabled) { }
> +
> +/*
> + * We want the unsafe accessors to always be inlined and use
> + * the error labels - thus the macro games.
> + */
> +#define unsafe_put_user(x, ptr, label)	do {				\
> +	long __err = 0;							\
> +	__put_user_nocheck(x, (ptr), __err);				\
> +	if (__err)							\
> +		goto label;						\
> +} while (0)
> +
> +#define unsafe_get_user(x, ptr, label)	do {				\
> +	long __err = 0;							\
> +	__inttype(*(ptr)) __gu_val;					\
> +	__get_user_nocheck(__gu_val, (ptr), __err);			\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +	if (__err)							\
> +		goto label;						\
> +} while (0)
> +
> +#define unsafe_copy_loop(dst, src, len, type, op, label)		\
> +	while (len >= sizeof(type)) {					\
> +		op(*(type *)(src), (type __user *)(dst), label);	\
> +		dst += sizeof(type);					\
> +		src += sizeof(type);					\
> +		len -= sizeof(type);					\
> +	}
> +
> +#define unsafe_copy_to_user(_dst, _src, _len, label)			\
> +do {									\
> +	char __user *__ucu_dst = (_dst);				\
> +	const char *__ucu_src = (_src);					\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
> +} while (0)
> +
> +#define unsafe_copy_from_user(_dst, _src, _len, label)			\
> +do {									\
> +	char *__ucu_dst = (_dst);					\
> +	const char __user *__ucu_src = (_src);				\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
> +	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
> +} while (0)
> +
>   #else /* CONFIG_MMU */
>   #include <asm-generic/uaccess.h>
>   #endif /* CONFIG_MMU */


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
