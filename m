Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA370C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky2VIjZrDtC8fdH/E67LZetnzqmdgQMlIfMR9AyFXF4=; b=iZwHe/R8W4gIHi
	2TRbbgUrKJVvaomE6vydu/V9MDiPq7JekHKPpp+/h1aQdqpXIfLS7dUKcSstK6wm3O94Hfb5VvveH
	aU88bEMHI3K6msSppkxapXZcLEEYloMUS0qYV8Fj0/wWxkk9XVhhBADtHbgk64/+BQ1BU3deWNU8T
	qfd/DZ3811j+shmRusEsxvWCYpvgoWe/KNvtZDlRQ2OW2REGCiepYGWeH/Gp69sHLbTlxLrUOQK76
	GmUdCCDy84XSuGTor2WbKvNokTAsDuEzE/H4Lj8pHGiMLMlDavoeYoYP9Gb4SiT8tkVNo4a6ugh5+
	ND49MS+wEOPxog5oh47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UCl-00000009S47-16Wu;
	Wed, 23 Apr 2025 07:07:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U2y-00000009Q1V-3jHq
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 06:57:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7FBC4396E;
	Wed, 23 Apr 2025 06:57:21 +0000 (UTC)
Message-ID: <267bf21f-a42d-4209-8348-e91d45c6e463@ghiti.fr>
Date: Wed, 23 Apr 2025 08:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250217013708.1932496-1-visitorckw@gmail.com>
 <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
 <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepvdeludfgleffteekgfelheetvdeugffgiedtueetgedtfeefleeileehieekvddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehvihhsihhtohhrtghkfiesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghom
 hdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepjhhsvghrvhestggtnhhsrdhntghkuhdrvgguuhdrthifpdhrtghpthhtohepvghlvggrnhhorhduheigsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_235729_066032_C469B949 
X-CRM114-Status: GOOD (  28.07  )
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

Hi Kuan-Wei,

On 04/04/2025 15:54, Kuan-Wei Chiu wrote:
> +Cc Andrew, since this might touch lib/math/gcd.c
>
> On Fri, Mar 28, 2025 at 03:07:36PM +0100, Alexandre Ghiti wrote:
>> Hi Kuan-Wei,
>>
>> First sorry for the late review.
>>
>> On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
>>> When the Zbb extension is not supported, ffs() falls back to a software
>>> implementation instead of leveraging the hardware ctz instruction for
>>> fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
>>> optimizes the efficiency of gcd().
>>>
>>> The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
>>> With hardware support for ffs, the binary GCD algorithm is used.
>>> Without it, the odd-even GCD algorithm is employed for better
>>> performance.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>> Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
>>> instructions, this patch hasn't been tested on real hardware. We'd
>>> greatly appreciate it if someone could help test and provide
>>> performance numbers!
>>>
>>>    arch/riscv/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 7612c52e9b1e..2dd3699ad09b 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -91,6 +91,7 @@ config RISCV
>>>    	select CLINT_TIMER if RISCV_M_MODE
>>>    	select CLONE_BACKWARDS
>>>    	select COMMON_CLK
>>> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>>>    	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>>>    	select EDAC_SUPPORT
>>>    	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
>>
>> So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not
>> mean the platform supports zbb and in that case, we'd still use the slow
>> version of gcd().
>>
>> Then I would use static keys instead, can you try to come up with a patch
>> that does that?
>>
> Here's my current thought: I'd like to add a static key named
> efficient_ffs_key in gcd.c, and possibly call
> static_branch_disable(&efficient_ffs_key) somewhere under arch/riscv/
> when RISCV_ISA_ZBB is enabled but the Zbb extension is not detected at
> runtime.
>
> However, I'm new to the RISC-V kernel code and not sure where would be
> the most appropriate place to insert that static_branch_disable() call.
> Suggestions are very welcome!


Sorry for the late answer, I missed your message.

So we put all of those initializations that depend on the discovery of 
extensions at the end of setup_arch() 
(https://elixir.bootlin.com/linux/v6.14.3/source/arch/riscv/kernel/setup.c#L334).

Thanks,

Alex


>
> Below is the diff for context.
>
> Regards,
> Kuan-Wei
>
> diff --git a/lib/math/gcd.c b/lib/math/gcd.c
> index e3b042214d1b..514b8a86b461 100644
> --- a/lib/math/gcd.c
> +++ b/lib/math/gcd.c
> @@ -2,6 +2,7 @@
>   #include <linux/kernel.h>
>   #include <linux/gcd.h>
>   #include <linux/export.h>
> +#include <linux/jump_label.h>
>
>   /*
>    * This implements the binary GCD algorithm. (Often attributed to Stein,
> @@ -11,6 +12,8 @@
>    * has decent hardware division.
>    */
>
> +DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
> +
>   #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
>
>   /* If __ffs is available, the even/odd algorithm benchmarks slower. */
> @@ -20,7 +23,7 @@
>    * @a: first value
>    * @b: second value
>    */
> -unsigned long gcd(unsigned long a, unsigned long b)
> +static unsigned long gcd_binary(unsigned long a, unsigned long b)
>   {
>   	unsigned long r = a | b;
>
> @@ -44,7 +47,7 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	}
>   }
>
> -#else
> +#endif
>
>   /* If normalization is done by loops, the even/odd algorithm is a win. */
>   unsigned long gcd(unsigned long a, unsigned long b)
> @@ -54,6 +57,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	if (!a || !b)
>   		return r;
>
> +#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
> +	if (static_branch_likely(&efficient_ffs_key))
> +		return binary_gcd(a, b);
> +#endif
> +
>   	/* Isolate lsbit of r */
>   	r &= -r;
>
> @@ -80,6 +88,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	}
>   }
>
> -#endif
> -
>   EXPORT_SYMBOL_GPL(gcd);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
