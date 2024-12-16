Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B52E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=is/P0kqG9IWQ/eaAbQK07TK9SA1qLULvDXlLpXTXxIM=; b=cG46wWlKBfIkM/
	8+GGkj++3NClx8Pd41qaFc6fI1cXL2e0Z5qQQrmh15wqEEJcAKGTGfLvJ2H14JEUR/rspcGIfMomg
	R2vr57SKKDwfllvLTFmS1XWKq0pt8ZfpvGnmTJOZ3JOyv4DLq288qHpA/5gnrSj0eZlQ8vcBDBP8r
	ft6GKmjoDhDHxpP7EI86PF7FyizGNbZs9kc1/WcaXclB3DTVROL0hn0rWuSx8q6300z9zZoOBYSny
	XajbLP6myNJARcZm2KruJ6MfTp3nv/ZGe4jCy/WY6l/Q3pG0085UqGpOJkqQ4fRuhKaDPB+LTV9Wv
	wh7qEYWJGk9x+h8dKw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7By-00000009VgQ-2q0C;
	Mon, 16 Dec 2024 09:15:06 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7Bw-00000009Vfc-0MiC
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 09:15:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96E66C0006;
	Mon, 16 Dec 2024 09:14:58 +0000 (UTC)
Message-ID: <330c7596-cd93-4ae5-b00d-789c72a944aa@ghiti.fr>
Date: Mon, 16 Dec 2024 10:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add riscv_force_qspinlock for early_param
Content-Language: en-US
To: guoren@kernel.org, conor@kernel.org, alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com,
 leobras@redhat.com, peterz@infradead.org, parri.andrea@gmail.com,
 longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de, will@kernel.org,
 corbet@lwn.net, Guo Ren <guoren@linux.alibaba.com>
References: <20241214043510.3795984-1-guoren@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241214043510.3795984-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_011504_260884_5302187A 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Guo,

On 14/12/2024 05:35, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When CONFIG_RISCV_COMBO_SPINLOCKS is enabled, permit qspinlock
> force enabled. See the Kconfig entry for RISCV_COMBO_SPINLOCKS.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>   arch/riscv/kernel/setup.c                       | 13 ++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3872bc6ec49d..43d0df2922b2 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5887,6 +5887,11 @@
>   			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>   			CPUs.
>   
> +	riscv_force_qspinlock [RISCV, EARLY]
> +			When CONFIG_RISCV_COMBO_SPINLOCKS is enabled, permit
> +			qspinlock force enabled. See the Kconfig entry for
> +			RISCV_COMBO_SPINLOCKS.
> +
>   	riscv_isa_fallback [RISCV,EARLY]
>   			When CONFIG_RISCV_ISA_FALLBACK is not enabled, permit
>   			falling back to detecting extension support by parsing
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 45010e71df86..74b13bc64c9c 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -247,6 +247,15 @@ static void __init parse_dtb(void)
>   #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
>   DEFINE_STATIC_KEY_TRUE(qspinlock_key);
>   EXPORT_SYMBOL(qspinlock_key);
> +
> +static bool force_qspinlock;
> +
> +static int __init riscv_force_qspinlock(char *p)
> +{
> +	force_qspinlock = true;
> +	return 0;
> +}
> +early_param("riscv_force_qspinlock", riscv_force_qspinlock);
>   #endif
>   
>   static void __init riscv_spinlock_init(void)
> @@ -267,7 +276,9 @@ static void __init riscv_spinlock_init(void)
>   		using_ext = "using Ziccrse";
>   	}
>   #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
> -	else {
> +	else if (force_qspinlock) {
> +		using_ext = "force";
> +	} else {
>   		static_branch_disable(&qspinlock_key);
>   		pr_info("Ticket spinlock: enabled\n");
>   		return;


What's the use case for this early param? To me that implies that a 
platform may have another extension which would allow the usage of 
qspinlock, so why not listing it in riscv_spinlock_init() instead?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
