Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64947C369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfSZ6addpa8Cg173FTXoIxbBI5GzSXmB5lroFZ2OENo=; b=qw9fUJTVI9UMqL
	GILKdArvMqk+1CLgP4Z6nC+um85Nc5vZors0gferJCvhC7HZ3xxoiqTpHSQBs/mcOxMvXAmxwG055
	f6lzxBATiE7qrScAEgFsnH6mJAo/zsAdLWF7HlO/WXwLoCZ6P6eJ1LrgKmn8R2YdCcC0t63S9unAj
	kXEEmGCRqeDe4dLyS4HZFt3Ws8QjunQAiGkvjM0gyzACXKM+ualUoQF+PTxYrFGQluZUSNUVOvZbz
	hciY3Rf2ZiYfQsPHlseKrb1Glj3jHF+Wp90yEdYDW5SFhwtqwr14EsI+EXvc68uxESUQY18+wsW+q
	VJqKfmJqMatDZhQDp7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Jdq-000000024n5-3kWd;
	Mon, 14 Apr 2025 13:14:26 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JVV-000000023Fa-39Gx
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 13:05:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7321A42E7E;
	Mon, 14 Apr 2025 13:05:42 +0000 (UTC)
Message-ID: <6b0d2b2f-5ccc-4337-aeaf-d18ed6e6097f@ghiti.fr>
Date: Mon, 14 Apr 2025 15:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Provide all alternative macros all the time
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 oe-kbuild-all@lists.linux.dev, charlie@rivosinc.com,
 samuel.holland@sifive.com, kernel test robot <lkp@intel.com>
References: <20250414120947.135173-2-ajones@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250414120947.135173-2-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvfhgsmeeiieeikeemkeefiegsmegufhgrlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghjohhnvghssehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggur
 dhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_060549_923958_3572520D 
X-CRM114-Status: GOOD (  12.73  )
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

Hi Drew,

On 14/04/2025 14:09, Andrew Jones wrote:
> We need to provide all six forms of the alternative macros
> (ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
> __ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
> from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
> ensure all configs can compile. Define this missing ones and ensure
> all are defined to consume all parameters passed.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/include/asm/alternative-macros.h | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 721ec275ce57..231d777d936c 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -115,24 +115,19 @@
>   	\old_c
>   .endm
>   
> -#define _ALTERNATIVE_CFG(old_c, ...)	\
> -	ALTERNATIVE_CFG old_c
> -
> -#define _ALTERNATIVE_CFG_2(old_c, ...)	\
> -	ALTERNATIVE_CFG old_c
> +#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
> +#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
>   
>   #else /* !__ASSEMBLY__ */
>   
> -#define __ALTERNATIVE_CFG(old_c)	\
> -	old_c "\n"
> +#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
> +#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
>   
> -#define _ALTERNATIVE_CFG(old_c, ...)	\
> -	__ALTERNATIVE_CFG(old_c)
> +#endif /* __ASSEMBLY__ */
>   
> -#define _ALTERNATIVE_CFG_2(old_c, ...)	\
> -	__ALTERNATIVE_CFG(old_c)
> +#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
> +#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
>   
> -#endif /* __ASSEMBLY__ */
>   #endif /* CONFIG_RISCV_ALTERNATIVE */
>   
>   /*


I could not find the right Fixes tag, so unless you have one, I'll add 
the commit pointed at by kernel test robot.

You can add:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for looking into this!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
