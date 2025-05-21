Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3E2C2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QC5z4x9gQIiiv+qzj8CLLaY98r4rtESV/3tD152qCK0=; b=Rc/vQUP2Zf9OWX
	K6CYy/vZr3hhZhW++I1I3Dm+PizTRDF5qr7NSzYnSdSWODjpa8Z7Yv3Aoo8ZhH558wYkmUrvkJxLv
	YJgww/o9eqw2nyawGuUupEcIkTHDR/QpUIxVcLbtT5WEbpEzQFaYRzBtgKEWolznKzOZQ2VZBE8gm
	8IaQ3w0ItX8HX9mgprW9pP5s48mNPOHgolZLL1zWv7wGS6ClxBP1KrNhi6msRXzddkoJ0RQs8JiTC
	pN6GHl/4NM3hc2El9yfMaZXeFZUBnDg9k8LA4PMdimQf5MNk9Fe+/SYeucgkA3xxpNZeczmFMnP1F
	doG+HVj0q7JwME49NuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgvL-0000000FWyx-1PHp;
	Wed, 21 May 2025 10:43:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgvJ-0000000FWy2-0aRn
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 10:43:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A90C943967;
	Wed, 21 May 2025 10:43:39 +0000 (UTC)
Message-ID: <be461744-8a74-4ee6-9029-d3aa5e69b0f1@ghiti.fr>
Date: Wed, 21 May 2025 12:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
To: aleksa.paunovic@htecgroup.com, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
 <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegtugdvgeemlegsleehmeefudejsgemtgefudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegtugdvgeemlegsleehmeefudejsgemtgefudgrpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegtugdvgeemlegsleehmeefudejsgemtgefudgrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrlhgvkhhsrgdrphgruhhnohhvihgtsehhthgvtghgrhhouhhprdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtt
 hhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_034345_443447_3F6B27CA 
X-CRM114-Status: GOOD (  29.91  )
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

Hi Aleksa,

First, you commit title should be prefixed with "riscv:".

On 5/14/25 10:51, Aleksa Paunovic via B4 Relay wrote:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>
> Allow faster rdtime access via GCR.U mtime shadow register on RISC-V
> devices. This feature can be enabled by setting GCRU_TIME_MMIO during configuration.


What's GCR.U? I can't find anything online. Conor asked something 
similar in v2 btw.


>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>   arch/riscv/include/asm/timex.h    | 48 ++++++++++--------------------
>   drivers/clocksource/Kconfig       | 12 ++++++++
>   drivers/clocksource/timer-riscv.c | 61 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 88 insertions(+), 33 deletions(-)
>
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a06697846e69521caceac2ae4d4e040d227d2ae7..2dea35fe32c0b080ff27587088bbbe01fad22ce6 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -7,31 +7,25 @@
>   #define _ASM_RISCV_TIMEX_H
>   
>   #include <asm/csr.h>
> +#include <asm/mmio.h>
> +
> +#include <linux/jump_label.h>
>   
>   typedef unsigned long cycles_t;
>   
> +extern u64 __iomem *riscv_time_val;
> +extern cycles_t (*get_cycles_ptr)(void);
> +extern u32 (*get_cycles_hi_ptr)(void);
> +
> +#define riscv_time_val riscv_time_val


As already mentioned by Daniel, this is weird ^, why don't you just 
initialize riscv_time_val with the mmio address?


> +
>   #ifdef CONFIG_RISCV_M_MODE
>   
>   #include <asm/clint.h>
>   
> -#ifdef CONFIG_64BIT
> -static inline cycles_t get_cycles(void)
> -{
> -	return readq_relaxed(clint_time_val);
> -}
> -#else /* !CONFIG_64BIT */
> -static inline u32 get_cycles(void)
> -{
> -	return readl_relaxed(((u32 *)clint_time_val));
> -}
> -#define get_cycles get_cycles
> +#undef riscv_time_val
>   
> -static inline u32 get_cycles_hi(void)
> -{
> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> -}
> -#define get_cycles_hi get_cycles_hi
> -#endif /* CONFIG_64BIT */
> +#define riscv_time_val clint_time_val


Yes, I would remove that too.


>   
>   /*
>    * Much like MIPS, we may not have a viable counter to use at an early point
> @@ -45,29 +39,17 @@ static inline unsigned long random_get_entropy(void)
>   	return get_cycles();
>   }
>   #define random_get_entropy()	random_get_entropy()
> +#endif
>   
> -#else /* CONFIG_RISCV_M_MODE */
> -
> -static inline cycles_t get_cycles(void)
> -{
> -	return csr_read(CSR_TIME);
> -}
> -#define get_cycles get_cycles
> -
> -static inline u32 get_cycles_hi(void)
> -{
> -	return csr_read(CSR_TIMEH);
> -}
> -#define get_cycles_hi get_cycles_hi
> -
> -#endif /* !CONFIG_RISCV_M_MODE */
> +#define get_cycles get_cycles_ptr
> +#define get_cycles_hi get_cycles_ptr_hi
>   
>   #ifdef CONFIG_64BIT
>   static inline u64 get_cycles64(void)
>   {
>   	return get_cycles();
>   }
> -#else /* CONFIG_64BIT */
> +#else /* !CONFIG_64BIT */
>   static inline u64 get_cycles64(void)
>   {
>   	u32 hi, lo;
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c8525996724fbf9c6e9726dabb478d86513b9..0f2bb75564c7d2bc9c450a7fb0eef353e5d27e69 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -661,6 +661,18 @@ config CLINT_TIMER
>   	  This option enables the CLINT timer for RISC-V systems.  The CLINT
>   	  driver is usually used for NoMMU RISC-V systems.
>   
> +config GCRU_TIME_MMIO
> +	bool "GCR.U timer support for RISC-V platforms"
> +	depends on !RISCV_M_MODE && RISCV


Here you depend on dt (Conor asked for this change in v2).


> +	default n
> +	help
> +        Access GCR.U shadow copy of the RISC-V mtime register
> +        on platforms that provide a compatible device, instead of
> +        reading the time CSR. Since reading the time CSR
> +        traps to M mode on certain platforms, this may be more efficient.
> +
> +        If you don't know what to do here, say n.
> +
>   config CSKY_MP_TIMER
>   	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
>   	depends on CSKY
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 4d7cf338824a3b21461c2756a002236dedc48f5f..1ccf2a95f5bcb28946dcee435f5bbea222c6fac3 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -22,6 +22,7 @@
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/interrupt.h>
>   #include <linux/of_irq.h>
> +#include <linux/of_address.h>
>   #include <linux/limits.h>
>   #include <clocksource/timer-riscv.h>
>   #include <asm/smp.h>
> @@ -32,6 +33,42 @@
>   static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>   static bool riscv_timer_cannot_wake_cpu;
>   
> +u64 __iomem *riscv_time_val __ro_after_init;
> +EXPORT_SYMBOL(riscv_time_val);
> +
> +#ifdef CONFIG_64BIT
> +static cycles_t __maybe_unused mmio_get_cycles(void)
> +{
> +	return readq_relaxed(riscv_time_val);
> +}
> +#else /* !CONFIG_64BIT */
> +static cycles_t __maybe_unused mmio_get_cycles(void)
> +{
> +	return readl_relaxed(((u32 *)riscv_time_val));
> +}
> +#endif /* CONFIG_64BIT */
> +
> +static cycles_t __maybe_unused get_cycles_csr(void)
> +{
> +	return csr_read(CSR_TIME);
> +}
> +
> +static u32 __maybe_unused mmio_get_cycles_hi(void)
> +{
> +	return readl_relaxed(((u32 *)riscv_time_val) + 1);
> +}
> +
> +static u32 __maybe_unused get_cycles_hi_csr(void)
> +{
> +	return csr_read(CSR_TIMEH);
> +}
> +
> +cycles_t (*get_cycles_ptr)(void) = get_cycles_csr;
> +EXPORT_SYMBOL(get_cycles_ptr);
> +
> +u32 (*get_cycles_hi_ptr)(void) = get_cycles_hi_csr;
> +EXPORT_SYMBOL(get_cycles_hi_ptr);
> +
>   static void riscv_clock_event_stop(void)
>   {
>   	if (static_branch_likely(&riscv_sstc_available)) {
> @@ -209,6 +246,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>   	int cpuid, error;
>   	unsigned long hartid;
>   	struct device_node *child;
> +#if defined(CONFIG_GCRU_TIME_MMIO)
> +	u64 mmio_addr;
> +	u64 mmio_size;
> +	struct device_node *gcru;
> +#endif
>   
>   	error = riscv_of_processor_hartid(n, &hartid);
>   	if (error < 0) {
> @@ -226,6 +268,25 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>   	if (cpuid != smp_processor_id())
>   		return 0;
>   
> +#if defined(CONFIG_GCRU_TIME_MMIO)
> +	gcru = of_find_compatible_node(NULL, NULL, "mti,gcru");
> +	if (gcru) {
> +		if (!of_property_read_reg(gcru, 0, &mmio_addr, &mmio_size)) {
> +			riscv_time_val = ioremap((long)mmio_addr, mmio_size);
> +			if (riscv_time_val) {
> +				pr_info("Using mmio time register at 0x%llx\n",
> +					mmio_addr);
> +				get_cycles_ptr = &mmio_get_cycles;
> +				get_cycles_hi_ptr = &mmio_get_cycles_hi;
> +			} else {
> +				pr_warn("Unable to use mmio time at 0x%llx\n",
> +					mmio_addr);
> +			}
> +			of_node_put(gcru);
> +		}
> +	}
> +#endif
> +
>   	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
>   	if (child) {
>   		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,


And you have a bunch of kernel test robot failures to fix too :)

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
