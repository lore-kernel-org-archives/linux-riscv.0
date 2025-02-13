Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AB0C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzyqPC2yngtfx8hBOFgsm8Fxt+ff8VSA2N7ctGqn5uI=; b=DRVM1Smv5WOUfU
	vNhzUIkwyOXZhn6GlKnWauXm2rdWRvPLmEDNLKxF6DGhqlzxT9WOKP2a8URdylFF3CZYgWoY4CyvA
	76DAtzXDb6N/z9Ck0oy/PP1menLioRlhATPTFMGbfyGdpGCCUPWlK8V4SBFaMYWdZxdHR5/YtuJso
	FPTv5HD46OQs33PMwm5wTOYyjcE9rzEC5dJWVZIzM4B88M0LaYhImkBnyredaIzlp4OVpRSKmlcTt
	a5UyLz7mM9OiWQbRTlf1aWOuH+PjmUTS9uCDle0nu6AgL+7cuEv7xdC0iUPsZDwf4b3azvn3/TRhi
	ALCwPO1D7ZPa857M4+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZBj-0000000B8kj-0g2t;
	Thu, 13 Feb 2025 13:23:31 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZ3u-0000000B7Nf-2lS2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:15:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE84E442C8;
	Thu, 13 Feb 2025 13:15:23 +0000 (UTC)
Message-ID: <14898598-8411-4c2d-b983-07c8bb50159a@ghiti.fr>
Date: Thu, 13 Feb 2025 14:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] riscv: Change check_unaligned_access_speed_all_cpus
 to void
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-15-ajones@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250207161939.46139-15-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrn
 hgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjvghsshgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_051526_835133_96E33E14 
X-CRM114-Status: GOOD (  15.33  )
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
> The return value of check_unaligned_access_speed_all_cpus() is always
> zero, so make the function void so we don't need to concern ourselves
> with it. The change also allows us to tidy up
> check_unaligned_access_all_cpus() a bit.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 02b485dc4bc4..780f1c5f512a 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
>   }
>   
>   /* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int __init check_unaligned_access_speed_all_cpus(void)
> +static void __init check_unaligned_access_speed_all_cpus(void)
>   {
>   	unsigned int cpu;
>   	unsigned int cpu_count = num_possible_cpus();
> @@ -226,7 +226,7 @@ static int __init check_unaligned_access_speed_all_cpus(void)
>   
>   	if (!bufs) {
>   		pr_warn("Allocation failure, not measuring misaligned performance\n");
> -		return 0;
> +		return;
>   	}
>   
>   	/*
> @@ -261,12 +261,10 @@ static int __init check_unaligned_access_speed_all_cpus(void)
>   	}
>   
>   	kfree(bufs);
> -	return 0;
>   }
>   #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static int __init check_unaligned_access_speed_all_cpus(void)
> +static void __init check_unaligned_access_speed_all_cpus(void)
>   {
> -	return 0;
>   }
>   #endif
>   
> @@ -403,10 +401,10 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>   
>   static int __init check_unaligned_access_all_cpus(void)
>   {
> -	bool all_cpus_emulated;
>   	int cpu;
>   
> -	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> +	if (!check_unaligned_access_emulated_all_cpus())
> +		check_unaligned_access_speed_all_cpus();
>   
>   	if (!has_vector()) {
>   		for_each_online_cpu(cpu)
> @@ -417,9 +415,6 @@ static int __init check_unaligned_access_all_cpus(void)
>   			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>   	}
>   
> -	if (!all_cpus_emulated)
> -		return check_unaligned_access_speed_all_cpus();
> -
>   	return 0;
>   }
>   

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
