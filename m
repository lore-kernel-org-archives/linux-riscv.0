Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E6FC021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcrRe94Hud8jgoryxRFsW0ZZ4gAjr34JxXxo1qMCxVo=; b=4c6PEDyxFUQVVX
	iHbtYhnW3UqZeiIT0DXMNFOt7c5dfOJLw6QX4V/KZD/EfyC6OBGDm/C6ZYnvkbdIhYtCpj6gjwy+W
	IJ2rWZmhYXK1zUe35EjELKA4IH5/5ce2p/0CqhbmMyQMzFhajLy7aZj/oGSOB1cHCswmluKPnsCTx
	SHc+Kfeogm8byAa88auHVoZUf2HzpvEioYV0phaUFBnCDsfH2K1Gs9YiGnYgU7R1H/V2B4JommRhJ
	oDckCfL5R4vaN3AI/fJn++HSGiYskpCBM5hzXCdeCWLCEtJEWDCVzp08TxHge4Rbxo6oFHw8Laves
	+UH0X7PPk64k9qZkJFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZBi-0000000B8kR-2I0b;
	Thu, 13 Feb 2025 13:23:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZ0w-0000000B6y1-2aul
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:12:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F9544405;
	Thu, 13 Feb 2025 13:12:18 +0000 (UTC)
Message-ID: <1dc6fc96-1a3e-46fa-84be-ef6952d4fc35@ghiti.fr>
Date: Thu, 13 Feb 2025 14:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] riscv: Fix check_unaligned_access_all_cpus
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-14-ajones@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250207161939.46139-14-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrn
 hgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjvghsshgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_051222_798724_634CA78F 
X-CRM114-Status: GOOD (  16.93  )
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
> check_vector_unaligned_access_emulated_all_cpus(), like its name
> suggests, will return true when all cpus emulate unaligned vector
> accesses. If the function returned false it may have been because
> vector isn't supported at all (!has_vector()) or because at least
> one cpu doesn't emulate unaligned vector accesses. Since false may
> be returned for two cases, checking for it isn't sufficient when
> attempting to determine if we should proceed with the vector speed
> check. Move the !has_vector() functionality to
> check_unaligned_access_all_cpus() in order for
> check_vector_unaligned_access_emulated_all_cpus() to return false
> for a single case.
>
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/traps_misaligned.c       |  6 ------
>   arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
>   2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index aacbd9d7196e..4354c87c0376 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>   {
>   	int cpu;
>   
> -	if (!has_vector()) {
> -		for_each_online_cpu(cpu)
> -			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> -		return false;
> -	}
> -
>   	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>   
>   	for_each_online_cpu(cpu)
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 161964cf2abc..02b485dc4bc4 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>   
>   static int __init check_unaligned_access_all_cpus(void)
>   {
> -	bool all_cpus_emulated, all_cpus_vec_unsupported;
> +	bool all_cpus_emulated;
> +	int cpu;
>   
>   	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> -	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
>   
> -	if (!all_cpus_vec_unsupported &&
> -	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> +	if (!has_vector()) {
> +		for_each_online_cpu(cpu)
> +			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> +	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> +		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>   		kthread_run(vec_check_unaligned_access_speed_all_cpus,
>   			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>   	}

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
