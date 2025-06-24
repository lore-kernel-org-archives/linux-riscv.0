Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C208C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYwSKOeicwtP1jNw6uK5rna7G6WfKaY60sc20gYFRfo=; b=u6T1VaQxt7AoPC
	0L7+LlYnJ6uq0T3A539LpDvOtz9HwaZapVr90kGAlZY2NTop8wnbZgPSdfdYNuclw6RmSfiilSzVN
	89TIlAS6QkN1B19jV0OFNUhgHKEQr8wQA7nXUn8ceo1sGmkWtXNz4JkKFZ8F+IJ84tgHr/TUs7jfq
	OQQH5E65LjxyJa45GgpXWMus7wqn+wDo5nWFMk3Iix7LBO2SSI+3kQsi6/RaykUPiFN14ocNwIbFw
	VoUf6Y7x4NkV9V3YQkhn2AuN+VC5LH+/2BNvQGxCc64+zsqTVzbbZLN60vIKKo694V3pspDIH/hcW
	3SMZMQFaC4ZUIx+HkMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3BY-00000005eZi-1bAw;
	Tue, 24 Jun 2025 12:55:36 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Ac-00000005eNp-16OD
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 12:54:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F163141CFD;
	Tue, 24 Jun 2025 12:54:32 +0000 (UTC)
Message-ID: <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
Date: Tue, 24 Jun 2025 14:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
To: Changbin Du <changbin.du@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250624113042.2123140-1-changbin.du@huawei.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250624113042.2123140-1-changbin.du@huawei.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtiedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfegrsgdtmedujegvtdemhegshegsmeefiedtiegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegthhgrnhhgsghinhdrughusehhuhgrfigvihdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghom
 hdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_055438_459068_031D8196 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Changbin,

On 6/24/25 13:30, Changbin Du wrote:
> Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel


Your above config works fine for me, I guess you meant FUNCTION_TRACER 
&& !DYNAMIC_FTRACE (which fails).

We were just talking with Andy about this configuration (FUNCTION_TRACER 
&& !DYNAMIC_FTRACE): do we really want to support static ftrace? Andy 
should send a patch soon to remove this possibility as IMO we don't want 
to support it. Let's wait for this patch and the discussion that will 
follow before merging your fix. I'll keep it in my list for 6.16 just in 
case someone comes up with a good argument to keep it.

Thanks,

Alex


> panics upon returning from _mcount() in the early boot path. This occurs
> during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives().
>
> The CC_FLAGS_FTRACE is only removed from alternative.c when
> CONFIG_RISCV_ALTERNATIVE_EARLY=y. Therefore, no function calls should be
> made to alternative.c during early boot in this configuration.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>   arch/riscv/include/asm/alternative.h | 6 ++++++
>   arch/riscv/kernel/alternative.c      | 4 ++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 3c2b59b25017..c670b0cc55f4 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -31,7 +31,13 @@
>   #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
>   
>   void __init apply_boot_alternatives(void);
> +
> +# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   void __init apply_early_boot_alternatives(void);
> +# else
> +static inline void apply_early_boot_alternatives(void) { }
> +# endif
> +
>   void apply_module_alternatives(void *start, size_t length);
>   
>   void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 7eb3cb1215c6..5406c3301627 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
>   	apply_vdso_alternatives();
>   }
>   
> +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   /*
>    * apply_early_boot_alternatives() is called from setup_vm() with MMU-off.
>    *
> @@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
>    */
>   void __init apply_early_boot_alternatives(void)
>   {
> -#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>   	_apply_alternatives((struct alt_entry *)__alt_start,
>   			    (struct alt_entry *)__alt_end,
>   			    RISCV_ALTERNATIVES_EARLY_BOOT);
> -#endif
>   }
> +#endif
>   
>   #ifdef CONFIG_MODULES
>   void apply_module_alternatives(void *start, size_t length)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
