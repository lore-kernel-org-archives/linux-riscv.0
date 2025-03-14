Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A4BC28B30
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l3EAe91m7X+5jVAMzMsGiz/MEZd6+GyJZQ2BqsqTN4=; b=rPyF00dCWBwvfN
	STSYIAHV8ryB/8csN6taH8zDRT4Zl5z8tdiE+P82Xv9vcvbK7yfsmhUB0HHKmbvok3NC80wEJrMWH
	Uuppj7xnMGJF+Km3s3espHdqRn4TkOtrnzi4pRXsqzGllCTVjbDTjqjPzZw7/q5RlXjZPuMDu7dSl
	4ZCiOaLgCwYkjuzzs0vofJOYl4j6EtW6CC1HEdjx3teP3KRFt8bU0WHIw1++lpo4TiWtLCwmGra7w
	WUGawIYIVHTUMt5+j4ljFOWVaxjPACu4sjB8GVIROYlXBvkyqistf1LCsNpLpR6ePgrlHQXMKfrAR
	A9eUb2Wh3iOTkPNlEH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Dt-0000000EIeN-3LkX;
	Fri, 14 Mar 2025 13:37:13 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt55r-0000000EHFo-3Qnr
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 13:28:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE96044380;
	Fri, 14 Mar 2025 13:28:52 +0000 (UTC)
Message-ID: <9a94c74f-4826-479f-aaa0-e87b3bfd30ff@ghiti.fr>
Date: Fri, 14 Mar 2025 14:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 1/4] riscv: implement user_access_begin() and families
To: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <20250221000924.734006-2-cyrilbur@tenstorrent.com>
Content-Language: en-US
In-Reply-To: <20250221000924.734006-2-cyrilbur@tenstorrent.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejffetjedtkeefheelkeetteffjeetgeefkeethfdvleehjeetuddvuefgjefhieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemugehrgefmeehsgeisgemuggvfhekmeeltdguvggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheptgihrhhilhgsuhhrsehtvghnshhtohhrrhgvnhhtrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepr
 ghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjrhhttgdvjeesjhhrthgtvdejrdgtohhmpdhrtghpthhtohepsggvnhdrughoohhkshestghouggvthhhihhnkhdrtghordhukhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_062855_991530_DD07EE55 
X-CRM114-Status: GOOD (  23.51  )
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

Hi Cyril,

On 21/02/2025 01:09, Cyril Bur wrote:
> From: Jisheng Zhang<jszhang@kernel.org>
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
> Signed-off-by: Jisheng Zhang<jszhang@kernel.org>
> Signed-off-by: Cyril Bur<cyrilbur@tenstorrent.com>
> ---
>   arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index fee56b0c8058..43db1d9c2f99 100644
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
> +	__typefits(x,char,			\
> +	  __typefits(x,short,			\
> +	    __typefits(x,int,			\
> +	      __typefits(x,long,0ULL)))))
> +
> +#define __typefits(x,type,not) \
> +	__builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
> +
>   /*
>    * The exception table consists of pairs of addresses: the first is the
>    * address of an instruction that is allowed to fault, and the second is
> @@ -368,6 +381,56 @@ do {									\
>   		goto err_label;						\
>   } while (0)
>   
> +static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
> +{
> +	if (unlikely(!access_ok(ptr,len)))
> +		return 0;
> +	__enable_user_access();
> +	return 1;
> +}
> +#define user_access_begin(a,b)	user_access_begin(a,b)


Nit: no need for (a,b) here


> +#define user_access_end()	__disable_user_access()
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
> +	if (__err) goto label;						\
> +} while (0)
> +
> +#define unsafe_get_user(x, ptr, label)	do {				\
> +	long __err = 0;							\
> +	__inttype(*(ptr)) __gu_val;					\
> +	__get_user_nocheck(__gu_val, (ptr), __err);			\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +	if (__err) goto label;						\
> +} while (0)
> +
> +#define unsafe_copy_loop(dst, src, len, type, label)				\
> +	while (len >= sizeof(type)) {						\
> +		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
> +		dst += sizeof(type);						\
> +		src += sizeof(type);						\
> +		len -= sizeof(type);						\
> +	}
> +
> +#define unsafe_copy_to_user(_dst,_src,_len,label)			\
> +do {									\
> +	char __user *__ucu_dst = (_dst);				\
> +	const char *__ucu_src = (_src);					\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +} while (0)
> +
>   #else /* CONFIG_MMU */
>   #include <asm-generic/uaccess.h>
>   #endif /* CONFIG_MMU */

There is a bunch of checkpatch errors to fix, see 
https://gist.github.com/linux-riscv-bot/98f23fd1b04d6da7c23c6cb18245a158

Why isn't there an implementation for unsafe_copy_from_user()? Let's 
take the following example:

user_access_begin()
unsafe_copy_from_user()
unsafe_get_user() <==== This one will fail since unsafe_copy_from_user() 
-> raw_copy_from_user() -> __asm_vector_usercopy() which enables and 
disables the SUM bit.
user_access_end()

Another thing is that with this patch, we lose the vectorized user 
access functions, can you fix that too?

Thanks,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
