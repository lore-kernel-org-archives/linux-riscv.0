Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0922DC0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28jtwnh6+/85VDdJ1LsFGW0p19RVwkCqrmImJnaEWYg=; b=CGG4Wrx9O2kYhs
	pMSrSFx+D/HRE9+sbg8HE1//3jPewa+1i02PY5LoQ8jkjRK6LrGW+DLc9ulu50UGH6ZTOebHNwgCM
	PZFTNOM19eTdmkAhu4BLycBXo3xU1LS9z9UpBxQbyR7Si/bgGnxF/y2IAjd0od0yiEQQZk2vSM++j
	MX+6GCQiNnnwC4c+xEBIhV1NM7lNgx+KkrLezk+3XZahHH0qzXJh1+mWICP1HleL11nOs2nXg8uc5
	hI60FPX/2ophbqfF1r2nf0K7obF5LrH8xLxIbC7EgLMP9sEODqlGj2v7FuT6SJdGRvyf7xywJc89r
	aYj2BkRLNtOiD7JlPJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYoN-0000000B4Qs-052m;
	Thu, 13 Feb 2025 12:59:23 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYoK-0000000B4PP-1oiA
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 12:59:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 668FC44267;
	Thu, 13 Feb 2025 12:59:13 +0000 (UTC)
Message-ID: <fa88bc3a-7945-456c-8f12-3bb1a269fb36@ghiti.fr>
Date: Thu, 13 Feb 2025 13:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] riscv: Annotate unaligned access init functions
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-12-ajones@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250207161939.46139-12-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrn
 hgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjvghsshgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_045920_639167_726CB919 
X-CRM114-Status: GOOD (  12.60  )
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

On 07/02/2025 17:19, Andrew Jones wrote:
> Several functions used in unaligned access probing are only run at
> init time. Annotate them appropriately.
>
> Fixes: f413aae96cda ("riscv: Set unaligned access speed at compile time")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/include/asm/cpufeature.h        |  4 ++--
>   arch/riscv/kernel/traps_misaligned.c       |  8 ++++----
>   arch/riscv/kernel/unaligned_access_speed.c | 14 +++++++-------
>   3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 569140d6e639..19defdc2002d 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -63,7 +63,7 @@ void __init riscv_user_isa_enable(void);
>   #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
>   	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
>   
> -bool check_unaligned_access_emulated_all_cpus(void);
> +bool __init check_unaligned_access_emulated_all_cpus(void);
>   #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>   void check_unaligned_access_emulated(struct work_struct *work __always_unused);
>   void unaligned_emulation_finish(void);
> @@ -76,7 +76,7 @@ static inline bool unaligned_ctl_available(void)
>   }
>   #endif
>   
> -bool check_vector_unaligned_access_emulated_all_cpus(void);
> +bool __init check_vector_unaligned_access_emulated_all_cpus(void);
>   #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
>   void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
>   DECLARE_PER_CPU(long, vector_misaligned_access);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 7cc108aed74e..aacbd9d7196e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -605,7 +605,7 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
>   	kernel_vector_end();
>   }
>   
> -bool check_vector_unaligned_access_emulated_all_cpus(void)
> +bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>   {
>   	int cpu;
>   
> @@ -625,7 +625,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
>   	return true;
>   }
>   #else
> -bool check_vector_unaligned_access_emulated_all_cpus(void)
> +bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>   {
>   	return false;
>   }
> @@ -659,7 +659,7 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
>   	}
>   }
>   
> -bool check_unaligned_access_emulated_all_cpus(void)
> +bool __init check_unaligned_access_emulated_all_cpus(void)
>   {
>   	int cpu;
>   
> @@ -684,7 +684,7 @@ bool unaligned_ctl_available(void)
>   	return unaligned_ctl;
>   }
>   #else
> -bool check_unaligned_access_emulated_all_cpus(void)
> +bool __init check_unaligned_access_emulated_all_cpus(void)
>   {
>   	return false;
>   }
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 91f189cf1611..b7a8ff7ba6df 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -121,7 +121,7 @@ static int check_unaligned_access(void *param)
>   	return 0;
>   }
>   
> -static void check_unaligned_access_nonboot_cpu(void *param)
> +static void __init check_unaligned_access_nonboot_cpu(void *param)
>   {
>   	unsigned int cpu = smp_processor_id();
>   	struct page **pages = param;
> @@ -175,7 +175,7 @@ static void set_unaligned_access_static_branches(void)
>   	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
>   }
>   
> -static int lock_and_set_unaligned_access_static_branch(void)
> +static int __init lock_and_set_unaligned_access_static_branch(void)
>   {
>   	cpus_read_lock();
>   	set_unaligned_access_static_branches();
> @@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
>   }
>   
>   /* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int check_unaligned_access_speed_all_cpus(void)
> +static int __init check_unaligned_access_speed_all_cpus(void)
>   {
>   	unsigned int cpu;
>   	unsigned int cpu_count = num_possible_cpus();
> @@ -264,7 +264,7 @@ static int check_unaligned_access_speed_all_cpus(void)
>   	return 0;
>   }
>   #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static int check_unaligned_access_speed_all_cpus(void)
> +static int __init check_unaligned_access_speed_all_cpus(void)
>   {
>   	return 0;
>   }
> @@ -379,7 +379,7 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>   }
>   
>   /* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>   {
>   	schedule_on_each_cpu(check_vector_unaligned_access);
>   
> @@ -393,13 +393,13 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
>   	return 0;
>   }
>   #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> -static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>   {
>   	return 0;
>   }
>   #endif
>   
> -static int check_unaligned_access_all_cpus(void)
> +static int __init check_unaligned_access_all_cpus(void)
>   {
>   	bool all_cpus_emulated, all_cpus_vec_unsupported;
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
