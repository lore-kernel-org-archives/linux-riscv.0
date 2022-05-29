Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12764C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 01:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j+xxjmADjJ1szUYRCvbm5B/hVQyKoD7oh+FTw62RmC0=; b=M7ttasrr0vdUw4edWSG/7ebNbR
	V3TQoW+drQC1o3ehfyRWyHX7r3uWBecr1fQYAnbmKP06td5/cJis25xT8//UVq68+RmW1gfv+v+N+
	aBTUaQsl8GDM2ZJ1zG55ovzmo618W4/d6rakTsG3O6Ireena+bF2x0CThCNwHKEmaUrRp/EFi9Uj+
	EVfb7s6f6Jz5Wk3PQALrctzkd40ibxYPpuzOy84UfPAwTewVewyfH4h2Ga72wx8EjjThCWzRbYN35
	esioDQ06SILcWyIw8npj2G2OYcHCNiR6uPIuBS9X6hMHU+B1/06hzARe7ILxWttJSym2fJsfd3T3U
	Ll2iXnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nv7io-0032I1-RA; Sun, 29 May 2022 01:27:58 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nv7ik-0032H7-Py
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 01:27:56 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id C41165C0086;
	Sat, 28 May 2022 21:27:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 28 May 2022 21:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1653787670; x=
	1653874070; bh=kis276fWwxyMIjWJArNL5lFIjDkelCTT+fYpvIhk+dI=; b=h
	2sNlm4WejeUEyOR27qtQNE2Zz6G5sYoomv+e+l/Kowx0iK8zO5x8hz2KW4vj8Lyg
	3ackRFwggGWZeHWxmpXfr4rVcoCq22G7ZoTnAHQ2QVUnLIi+Qu7rNCICvKPmAT5o
	O1jepVWvyfjcObTMqqratoBUMljD4qs0AQnhigroPAsyE4MBNVz/th6JsWP5NhwE
	eUNC4uVS1SE6rop3p9p5MkOaU9biZVMsg/q0OrqZ3F5P182lZI0CkMs0mHXw1sEX
	IO47cy8cgc34GyEfiYNV7u3Zbm61QqqNfIi/BDaMoz+7iv9g5rk5V5DgE3Mc1dg2
	YfBdss1NKk5dimBC3ApQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653787670; x=
	1653874070; bh=kis276fWwxyMIjWJArNL5lFIjDkelCTT+fYpvIhk+dI=; b=y
	klr+Up07X9APO8jQcnWibzX9Gm4/4zSsqzI/zslIyGwE4LXnvaMR/xbFm/G+XvnJ
	3Ev2nY3yoHCrZp/4f+ooBrIrUDCAzAY2O7+Gyld0/UkBddOlmx8tb8sD0WW9rg9S
	OgtQHtklk4KBD1ig5Z+SyXMkVtGansTj4Nwpz5Uu5vWXwpdLgOmEYRE8Z8V6EwNa
	A0XAR3n8/cnu6kRVJpXL/ihpWjuYNaRKqDVNeI/kqr8ezKVrYImfUaP+ZUYUNxcZ
	l0ODUsj8O9VWxF7H7Dj6T/bq9ZcaHkHZi15CziVoEcqi3Y6mvnL9AQOraimI9BGV
	rRKL4WZKXoxhkazbBFKTg==
X-ME-Sender: <xms:FcySYgzE_ygjhGowyriDnf7GdJJ5lkizfsHrYOknfjyaDyLSku2MeA>
    <xme:FcySYkRdD6objKTSFomU-tJ_23s1b1BRaOf34MPAE5sDfueYuzBdVYlceqqS_qJQz
    wNgzmPcTzGgTMHuQA>
X-ME-Received: <xmr:FcySYiUmZiC3v0hMu10Dl0NSXE8TPFTfo3cisQsktDCDp53Gfk3d2-2CAxd5UPa6EBjoGkmcOGVrFXSXAh7_CDudkUvu9J5EIFfTQHEMJaRB2BH6H_DlwtcL4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkedvgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:FsySYujnwhZlJcfKknkGJNiWyxa0xdom4SRyx_NaODhHRoV5vBtwQA>
    <xmx:FsySYiDyegNsIh7aX2fKUYHEb3qgdjuEWS_rFKmafFAWjv5MFUT2OA>
    <xmx:FsySYvJzSGcuAGywbsyClH8j_Obr7zw0DSXlaBmnW8AFefI04xezZQ>
    <xmx:FsySYqvSgX8OoRoH5HlUiiBCus3G8Cr_vltBEQHjWP1cPv65sbZEXg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 May 2022 21:27:49 -0400 (EDT)
Subject: Re: [PATCH v2 5/5] riscv: remove usage of function-pointers from
 cpufeatures and t-head errata
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, hch@lst.de
References: <20220526205646.258337-1-heiko@sntech.de>
 <20220526205646.258337-6-heiko@sntech.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <1f6f2c41-54a3-07d2-4949-1b4abfb1498f@sholland.org>
Date: Sat, 28 May 2022 20:27:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220526205646.258337-6-heiko@sntech.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_182755_374751_5155F216 
X-CRM114-Status: GOOD (  37.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/26/22 3:56 PM, Heiko Stuebner wrote:
> Having a list of alternatives to check with a per-entry function pointer
> to a check function is nice style-wise. But in case of early-alternatives
> it can clash with the non-relocated kernel and the function pointer in
> the list pointing to a completely wrong location.
> 
> This isn't an issue with one or two list entries, as in that case the
> compiler seems to unroll the loop and even usage of the list structure
> and then only does relative jumps into the check functions based on this.
> 
> When adding a third entry to either list though, the issue that was
> hiding there from the beginning is triggered resulting a jump to a
> memory address that isn't part of the kernel at all.
> 
> The list of features/erratas only contained an unused name and the
> pointer to the check function, so an easy solution for the problem
> is to just unroll the loop in code, dismantle the whole list structure
> and just call the relevant check functions one by one ourself.
> 
> For the T-Head errata this includes moving the stage-check inside
> the check functions.
> 
> The issue is only relevant for things that might be called for early-
> alternatives (T-Head and possible future main extensions), so the
> SiFive erratas were not affected from the beginning, as they got
> an early return for early-alternatives in the original patchset.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c | 38 ++++++++++----------------------
>  arch/riscv/kernel/cpufeature.c   | 32 +++++++++------------------
>  2 files changed, 22 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index e5d75270b99c..cc155228247d 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -14,40 +14,26 @@
>  #include <asm/patch.h>
>  #include <asm/vendorid_list.h>
>  
> -struct errata_info {
> -	char name[ERRATA_STRING_LENGTH_MAX];
> -	bool (*check_func)(unsigned long arch_id, unsigned long impid);
> -	unsigned int stage;
> -};
> -
> -static bool errata_mt_check_func(unsigned long  arch_id, unsigned long impid)
> +static bool errata_probe_pbmt(unsigned int stage,
> +			      unsigned long arch_id, unsigned long impid)
>  {
>  	if (arch_id != 0 || impid != 0)
>  		return false;
> -	return true;
> -}
>  
> -static const struct errata_info errata_list[ERRATA_THEAD_NUMBER] = {
> -	{
> -		.name = "memory-types",
> -		.stage = RISCV_ALTERNATIVES_EARLY_BOOT,
> -		.check_func = errata_mt_check_func
> -	},
> -};
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT ||
> +	    stage == RISCV_ALTERNATIVES_MODULE)
> +		return true;
> +
> +	return false;
> +}
>  
> -static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> +static u32 thead_errata_probe(unsigned int stage,
> +			      unsigned long archid, unsigned long impid)
>  {
> -	const struct errata_info *info;
>  	u32 cpu_req_errata = 0;
> -	int idx;
> -
> -	for (idx = 0; idx < ERRATA_THEAD_NUMBER; idx++) {
> -		info = &errata_list[idx];
>  
> -		if ((stage == RISCV_ALTERNATIVES_MODULE ||
> -		     info->stage == stage) && info->check_func(archid, impid))
> -			cpu_req_errata |= (1U << idx);
> -	}
> +	if (errata_probe_pbmt(stage, archid, impid))
> +		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
>  
>  	return cpu_req_errata;
>  }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b33564df81e1..b63c25c55bf1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -246,12 +246,7 @@ void __init riscv_fill_hwcap(void)
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -struct cpufeature_info {
> -	char name[ERRATA_STRING_LENGTH_MAX];
> -	bool (*check_func)(unsigned int stage);
> -};
> -
> -static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
> +static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)

Now that this function isn't used as a function pointer anymore, it doesn't need
to be specific to SVPBMT. I think the logic here is the same for ZICBOM. Does it
make sense to move it to the calling function?

With the conflicts between this and the CMO series manually fixed:

Tested-by: Samuel Holland <samuel@sholland.org>

Regards,
Samuel

>  {
>  #ifdef CONFIG_RISCV_ISA_SVPBMT
>  	switch (stage) {
> @@ -265,26 +260,19 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
>  	return false;
>  }
>  
> -static const struct cpufeature_info __initdata_or_module
> -cpufeature_list[CPUFEATURE_NUMBER] = {
> -	{
> -		.name = "svpbmt",
> -		.check_func = cpufeature_svpbmt_check_func
> -	},
> -};
> -
> +/*
> + * Probe presence of individual extensions.
> + *
> + * This code may also be executed before kernel relocation, so we cannot use
> + * addresses generated by the address-of operator as they won't be valid in
> + * this context.
> + */
>  static u32 __init_or_module cpufeature_probe(unsigned int stage)
>  {
> -	const struct cpufeature_info *info;
>  	u32 cpu_req_feature = 0;
> -	int idx;
> -
> -	for (idx = 0; idx < CPUFEATURE_NUMBER; idx++) {
> -		info = &cpufeature_list[idx];
>  
> -		if (info->check_func(stage))
> -			cpu_req_feature |= (1U << idx);
> -	}
> +	if (cpufeature_probe_svpbmt(stage))
> +		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
>  
>  	return cpu_req_feature;
>  }
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
