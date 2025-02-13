Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E66C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWxzNtcLTb2tjRZ6Q9gW/jryO0wSZELWSA/3eaHtV5E=; b=uiBH9G+G6bd4Qj
	P7JZF9PJmTY0FJ3Ohbj8e2GbuaiaFh0xNbXaLoDD2xjyzTT4pqmC8WcvTAlDM1S7r4mWZpLOhsJdH
	l1FwqGKcIqUDsPWaLp6qv8ufCiy9qx4/xZcsY/L/LY2fuFKfrJAL9DvFXsc9YqTXSgboViFD/GFMo
	GHXRB9+a1Zrkxf/s/swuvva6Yj3lKP8G9OuetmlD/uLZYmaxnzA7dHqr75LF3QYA6RFJZUCfSJ7zM
	L6ssXf78FRtdbfIzML5TVcedbGVL+vkkG9jumVFCyFo6NBQme4trw46T6eRShiMVXQ9ICwV9xAfS1
	omPhfHgMHS+8ErX43fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZMs-0000000BAYr-0e5g;
	Thu, 13 Feb 2025 13:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZLk-0000000BAQL-2eDF
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kvqbxg703v5S6ut1sMVGh2DDxH7A10IeYF1BKb6Rj1k=; b=YuWEZTBco6hdarv0HxWjjKJ/mi
	9WddHqac7epX+cLzZFlo+Y3YGCGf2+mn904O86IIclhT5atxhAl/m3aLhh7GlnsXNlxH1ranLubuY
	Q9FvbWLvfu6T14cIkh+XE4gn5QU4VQFCrSWKe1vqW+CUnMJxt96USFA7FwFKZPP47ZPXqfTlkzqPG
	tV/5oES1faJiaBMDZn4lLjtepCUm+Wbg7F8WflvhTQza5Ns5lYNK7o3DFejRKS2hrZ2ATC+wlnDR4
	1uF/4IzQ2GD/Euwv4t2/0fsAA/gOHQx5Al9cqhhN+YdPwIax1SJ3z4gwRsbEYsgwhxUFxltJNhlXp
	kL+rv8Eg==;
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZLh-000000010JW-1rZV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:33:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1957D204AC;
	Thu, 13 Feb 2025 13:33:44 +0000 (UTC)
Message-ID: <c6fdb439-fc85-400a-a278-3858bd3fd90d@ghiti.fr>
Date: Thu, 13 Feb 2025 14:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] riscv: Fix set up of cpu hotplug callbacks
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-16-ajones@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250207161939.46139-16-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudgutggvmegvhedugeemheegjegvmegstdhfkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrn
 hgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjvghsshgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_133349_666802_1B48B03E 
X-CRM114-Status: GOOD (  16.97  )
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
> CPU hotplug callbacks should be set up even if we detected all
> current cpus emulate misaligned accesses, since we want to
> ensure our expectations of all cpus emulating is maintained.
>
> Fixes: 6e5ce7f2eae3 ("riscv: Decouple emulated unaligned accesses from access speed")
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 27 +++++++++++-----------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 780f1c5f512a..c9d3237649bb 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -247,13 +247,6 @@ static void __init check_unaligned_access_speed_all_cpus(void)
>   	/* Check core 0. */
>   	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
>   
> -	/*
> -	 * Setup hotplug callbacks for any new CPUs that come online or go
> -	 * offline.
> -	 */
> -	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> -				  riscv_online_cpu, riscv_offline_cpu);
> -
>   out:
>   	for_each_cpu(cpu, cpu_online_mask) {
>   		if (bufs[cpu])
> @@ -383,13 +376,6 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>   {
>   	schedule_on_each_cpu(check_vector_unaligned_access);
>   
> -	/*
> -	 * Setup hotplug callbacks for any new CPUs that come online or go
> -	 * offline.
> -	 */
> -	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> -				  riscv_online_cpu_vec, NULL);
> -
>   	return 0;
>   }
>   #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> @@ -415,6 +401,19 @@ static int __init check_unaligned_access_all_cpus(void)
>   			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>   	}
>   
> +	/*
> +	 * Setup hotplug callbacks for any new CPUs that come online or go
> +	 * offline.
> +	 */
> +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> +				  riscv_online_cpu, riscv_offline_cpu);
> +#endif
> +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> +				  riscv_online_cpu_vec, NULL);
> +#endif
> +
>   	return 0;
>   }
>   

This patch 5 does not apply without patch 4 that is not a fix which, in 
theory, should not be sent into the next -rcX...I'd say it is not a 
problem as patch 4 is small enough.

Just to say that maybe you'll be requested to rearrange the patchset!

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
