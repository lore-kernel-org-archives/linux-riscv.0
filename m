Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4570FC0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jR9C7i5bD/EEwi0z0oEAqm/5zqhnvJnOHnE5tmp5F7A=; b=gEZeu4W2v1mTVR
	5m4pU8vG9oOtQi39usyZd+CHEiPE3L+EHzcZK941xzv7mBRxrf2CwCdWMxJlwYQzXnwWfAb+ErEkB
	pqnSoO4+D9BoUtHdZMaNc3j15/yA9WD/Q9d5558hf0gEQc2+fxGWlOCCJueLi2aVj6OzUlgqIXevZ
	grt6A2qiRQ+RMvKH6r46o6x0mOuWsK+0cCYiam/BYzvhELnKiAjTm8sSlQ0DQycXYDdWs7tUsHYaO
	hrlvMIY+0tHkUBB45bh/mGrbIVQ/9pYvLLcuBmMu35bpn6XvgKDFb5oayWZiS60t/ELfKnc1qUECP
	0EYo0cTVW4KO//u2bAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZGN-0000000B9f3-49K9;
	Thu, 13 Feb 2025 13:28:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZGL-0000000B9dm-2aMh
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:28:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2034441A0;
	Thu, 13 Feb 2025 13:28:13 +0000 (UTC)
Message-ID: <0a895286-2084-42d5-9d19-5a27d9cb6ef9@ghiti.fr>
Date: Thu, 13 Feb 2025 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-17-ajones@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250207161939.46139-17-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrn
 hgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjvghsshgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_052817_791893_D9742396 
X-CRM114-Status: GOOD (  16.59  )
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


On 07/02/2025 17:19, Andrew Jones wrote:
> Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
> set up a cpu hotplug callback to check if we have vector at all,
> since, when we don't have vector, we need to set
> vector_misaligned_access to unsupported rather than leave it the
> default of unknown.
>
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
>   1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index c9d3237649bb..d9d4ca1fadc7 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>   	per_cpu(vector_misaligned_access, cpu) = speed;
>   }
>   
> +/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +{
> +	schedule_on_each_cpu(check_vector_unaligned_access);
> +
> +	return 0;
> +}
> +#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +{
> +	return 0;
> +}
> +#endif
> +
>   static int riscv_online_cpu_vec(unsigned int cpu)
>   {
>   	if (!has_vector()) {
> @@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>   		return 0;
>   	}
>   
> +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>   	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>   		return 0;
>   
>   	check_vector_unaligned_access_emulated(NULL);
>   	check_vector_unaligned_access(NULL);
> -	return 0;
> -}
> -
> -/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> -{
> -	schedule_on_each_cpu(check_vector_unaligned_access);
> +#endif
>   
>   	return 0;
>   }
> -#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> -{
> -	return 0;
> -}
> -#endif
>   
>   static int __init check_unaligned_access_all_cpus(void)
>   {
> @@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
>   	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
>   				  riscv_online_cpu, riscv_offline_cpu);
>   #endif
> -#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>   	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
>   				  riscv_online_cpu_vec, NULL);
> -#endif
>   
>   	return 0;
>   }

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
