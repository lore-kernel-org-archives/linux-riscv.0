Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C29C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2F/R4fNjnJs2EmWxSgpJB9I5LHnU6u5woIj4VEl71Ew=; b=eKpNBCBkAzgdko
	XDZWT7fW/JQR7LO0sH+0R+trNLFjWtqd3CBNz9rjMs9MxH32huqx4Mlnzm+Uc1eUOtLOrGacjtDAQ
	mRENV7RIvojVPbRPDjL0FFEMAMQnDZz9fvfnUICjZXtLy3+VlqFxbAQl7O9xHI+Lyevt6J+6vSJBB
	Ull4glHlskzIyY+vBzGt0014IR4hj7sz3G/VqZsrVC4LKb8uWmI/P4UXluE0OGXamxUw78dEOaUMn
	SL8iYM+Azhr7lE6EJwlFXupJBbGQHJoaZOiW3vfBkXunEBPtVJOkqVDVHN8/1WQ1q479xZX722BUj
	VYOhbBG263Co7uBQMmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvN3B-004OEK-CA; Sun, 29 May 2022 17:50:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvN2z-004OBT-1i
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 17:49:50 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nvN2s-00084U-Ib; Sun, 29 May 2022 19:49:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de
Subject: Re: [PATCH v2 5/5] riscv: remove usage of function-pointers from cpufeatures and t-head errata
Date: Sun, 29 May 2022 19:49:41 +0200
Message-ID: <7519429.lvqk35OSZv@diego>
In-Reply-To: <1f6f2c41-54a3-07d2-4949-1b4abfb1498f@sholland.org>
References: <20220526205646.258337-1-heiko@sntech.de> <20220526205646.258337-6-heiko@sntech.de> <1f6f2c41-54a3-07d2-4949-1b4abfb1498f@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_104949_142453_530F3158 
X-CRM114-Status: GOOD (  42.17  )
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

Hi,

Am Sonntag, 29. Mai 2022, 03:27:48 CEST schrieb Samuel Holland:
> On 5/26/22 3:56 PM, Heiko Stuebner wrote:
> > Having a list of alternatives to check with a per-entry function pointer
> > to a check function is nice style-wise. But in case of early-alternatives
> > it can clash with the non-relocated kernel and the function pointer in
> > the list pointing to a completely wrong location.
> > 
> > This isn't an issue with one or two list entries, as in that case the
> > compiler seems to unroll the loop and even usage of the list structure
> > and then only does relative jumps into the check functions based on this.
> > 
> > When adding a third entry to either list though, the issue that was
> > hiding there from the beginning is triggered resulting a jump to a
> > memory address that isn't part of the kernel at all.
> > 
> > The list of features/erratas only contained an unused name and the
> > pointer to the check function, so an easy solution for the problem
> > is to just unroll the loop in code, dismantle the whole list structure
> > and just call the relevant check functions one by one ourself.
> > 
> > For the T-Head errata this includes moving the stage-check inside
> > the check functions.
> > 
> > The issue is only relevant for things that might be called for early-
> > alternatives (T-Head and possible future main extensions), so the
> > SiFive erratas were not affected from the beginning, as they got
> > an early return for early-alternatives in the original patchset.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>

[...]

> > -static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> > +static u32 thead_errata_probe(unsigned int stage,
> > +			      unsigned long archid, unsigned long impid)
> >  {
> > -	const struct errata_info *info;
> >  	u32 cpu_req_errata = 0;
> > -	int idx;
> > -
> > -	for (idx = 0; idx < ERRATA_THEAD_NUMBER; idx++) {
> > -		info = &errata_list[idx];
> >  
> > -		if ((stage == RISCV_ALTERNATIVES_MODULE ||
> > -		     info->stage == stage) && info->check_func(archid, impid))
> > -			cpu_req_errata |= (1U << idx);
> > -	}
> > +	if (errata_probe_pbmt(stage, archid, impid))
> > +		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
> >  
> >  	return cpu_req_errata;
> >  }
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index b33564df81e1..b63c25c55bf1 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -246,12 +246,7 @@ void __init riscv_fill_hwcap(void)
> >  }
> >  
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> > -struct cpufeature_info {
> > -	char name[ERRATA_STRING_LENGTH_MAX];
> > -	bool (*check_func)(unsigned int stage);
> > -};
> > -
> > -static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
> > +static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
> 
> Now that this function isn't used as a function pointer anymore, it doesn't need
> to be specific to SVPBMT. I think the logic here is the same for ZICBOM. Does it
> make sense to move it to the calling function?

we don't know how other extensions need to probe though, so for example
in my yet-to-send zicbom-v3 the probe function itself looks like

static u32 __init_or_module cpufeature_probe(unsigned int stage)
{
        u32 cpu_req_feature = 0;

        if (cpufeature_probe_svpbmt(stage))
                cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);

        if (cpufeature_probe_cmo(stage))
                cpu_req_feature |= (1U << CPUFEATURE_CMO);

        return cpu_req_feature;
}

As this might get longer in the future, I actually do like the actual
checks being separate for readability.

But I'll just yield to the majority opinion ;-)

Heiko


> 
> With the conflicts between this and the CMO series manually fixed:
> 
> Tested-by: Samuel Holland <samuel@sholland.org>
> 
> Regards,
> Samuel
> 
> >  {
> >  #ifdef CONFIG_RISCV_ISA_SVPBMT
> >  	switch (stage) {
> > @@ -265,26 +260,19 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
> >  	return false;
> >  }
> >  
> > -static const struct cpufeature_info __initdata_or_module
> > -cpufeature_list[CPUFEATURE_NUMBER] = {
> > -	{
> > -		.name = "svpbmt",
> > -		.check_func = cpufeature_svpbmt_check_func
> > -	},
> > -};
> > -
> > +/*
> > + * Probe presence of individual extensions.
> > + *
> > + * This code may also be executed before kernel relocation, so we cannot use
> > + * addresses generated by the address-of operator as they won't be valid in
> > + * this context.
> > + */
> >  static u32 __init_or_module cpufeature_probe(unsigned int stage)
> >  {
> > -	const struct cpufeature_info *info;
> >  	u32 cpu_req_feature = 0;
> > -	int idx;
> > -
> > -	for (idx = 0; idx < CPUFEATURE_NUMBER; idx++) {
> > -		info = &cpufeature_list[idx];
> >  
> > -		if (info->check_func(stage))
> > -			cpu_req_feature |= (1U << idx);
> > -	}
> > +	if (cpufeature_probe_svpbmt(stage))
> > +		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
> >  
> >  	return cpu_req_feature;
> >  }
> > 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
