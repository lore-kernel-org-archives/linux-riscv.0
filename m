Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A24C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXAuZy4eOQ+t2bRgM11CBYFsbyqmYgwbZiXINh/LKeg=; b=ElDmW9NKyB7D4X
	eVVKggxOhqt36xO3DfCncnVVrkPZPYG+lYzsL+L3FMq0dAbMH9YEUjtKW82OHlqZXEgvhql+pe8Kw
	Xkt9kE1pM6MakyUxJEgRqu6uPdFT5GC8Jhgo9x9PNWrAaJ1m5gjS7M/iLVEpDc3G9i6vhEVcw9p6O
	FD3ivECMZi/ZJsXqi+Nq3pO4gHSXFhfBFGx2dO6hbPRGpFSfpnu1JNKdqrARqzri4bI3clSjNrpMO
	FD23c5rJjsghED6vp+X3s1mzrlzFFzsU7PceyWO6aJt7aT5GeYDPeuKTtYCdRh2d4BxS2auDA+r6P
	qYePKbiW6nranhrWmT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIix-006mgX-9L; Wed, 16 Feb 2022 11:43:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIiu-006me7-Vn
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 11:43:54 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nKIim-00075Q-H5; Wed, 16 Feb 2022 12:43:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 4/6] RISC-V: Implement multi-letter ISA extension
 probing framework
Date: Wed, 16 Feb 2022 12:43:43 +0100
Message-ID: <9295809.TOyiF8mCWT@diego>
In-Reply-To: <20220216002911.1219593-5-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <20220216002911.1219593-5-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034353_064309_12D67F7C 
X-CRM114-Status: GOOD (  26.53  )
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

Am Mittwoch, 16. Februar 2022, 01:29:09 CET schrieb Atish Patra:
> Multi-letter extensions can be probed using exising
> riscv_isa_extension_available API now. It doesn't support versioning
> right now as there is no use case for it.
> Individual extension specific implementation will be added during
> each extension support.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

With my in-flight svpbmt series:
Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/include/asm/hwcap.h | 18 ++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++------
>  2 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5ce50468aff1..170bd80da520 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -34,7 +34,25 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_s		('s' - 'a')
>  #define RISCV_ISA_EXT_u		('u' - 'a')
>  
> +/*
> + * Increse this to higher value as kernel support more ISA extensions.
> + */
>  #define RISCV_ISA_EXT_MAX	64
> +#define RISCV_ISA_EXT_NAME_LEN_MAX 32
> +
> +/* The base ID for multi-letter ISA extensions */
> +#define RISCV_ISA_EXT_BASE 26
> +
> +/*
> + * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> + * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
> + * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> + * extensions while all the multi-letter extensions should define the next
> + * available logical extension id.
> + */
> +enum riscv_isa_ext_id {
> +	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +};
>  
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index cd9eb34f8d11..59c70c104256 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
>  
>  	for_each_of_cpu_node(node) {
>  		unsigned long this_hwcap = 0;
> -		unsigned long this_isa = 0;
> +		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  
>  		if (riscv_of_processor_hartid(node) < 0)
>  			continue;
> @@ -100,6 +100,7 @@ void __init riscv_fill_hwcap(void)
>  		if (!strncmp(isa, "rv64", 4))
>  			isa += 4;
>  #endif
> +		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>  		for (; *isa; ++isa) {
>  			const char *ext = isa++;
>  			const char *ext_end = isa;
> @@ -167,12 +168,22 @@ void __init riscv_fill_hwcap(void)
>  			if (*isa != '_')
>  				--isa;
>  
> +#define SET_ISA_EXT_MAP(name, bit)						\
> +			do {							\
> +				if ((ext_end - ext == sizeof(name) - 1) &&	\
> +				     !memcmp(ext, name, sizeof(name) - 1)) {    \
> +					set_bit(bit, this_isa);			\
> +					pr_info("Found ISA extension %s", name);\
> +				}						\
> +			} while (false)						\
> +
>  			if (unlikely(ext_err))
>  				continue;
>  			if (!ext_long) {
>  				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -				this_isa |= (1UL << (*ext - 'a'));
> +				set_bit(*ext - 'a', this_isa);
>  			}
> +#undef SET_ISA_EXT_MAP
>  		}
>  
>  		/*
> @@ -185,10 +196,11 @@ void __init riscv_fill_hwcap(void)
>  		else
>  			elf_hwcap = this_hwcap;
>  
> -		if (riscv_isa[0])
> -			riscv_isa[0] &= this_isa;
> +		if (bitmap_weight(riscv_isa, RISCV_ISA_EXT_MAX))
> +			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>  		else
> -			riscv_isa[0] = this_isa;
> +			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +
>  	}
>  
>  	/* We don't support systems with F but without D, so mask those out
> @@ -202,7 +214,7 @@ void __init riscv_fill_hwcap(void)
>  	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (riscv_isa[0] & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);
> -	pr_info("riscv: ISA extensions %s\n", print_str);
> +	pr_info("riscv: base ISA extensions %s\n", print_str);
>  
>  	memset(print_str, 0, sizeof(print_str));
>  	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
