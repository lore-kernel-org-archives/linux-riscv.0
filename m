Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E4C44514
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Cc:References:
	In-Reply-To:Mime-Version:Subject:From:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d1jI02sOinqir6OBv2FoAJ2lz8mCzayYmigAOf+I6Is=; b=Kjg5sBscDXdaIOqCM8/cZJawLb
	TYUBwwi1ap7EKr6WQdvJ8M7OKBAtQz6KWUBeRS7hsGoePoEGQ1y7zDMVUnK73GeCNFkLIZYUVdzp7
	jpuifAmjSMXKuY5c2r4ZLnt3+lsDf/+G+y5hrSwlBI60HHs9v3zdWr1/VcRmDe1Ow8A3INLLe97WP
	MW8UERqMYj5RRgf9VplICl16wqjoftISvFeMfWFc/AgZa3nuw3rMUrfJGXPE16pMxL0O5hljl7FIt
	QF3ZC3yGDQmUHQscXV3+myUJ0xt4dEvmT74n204iWpagej8veGOnAkFTwBA4Xs4mGfVWS4EfLgFsY
	roXmoinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg2E-0000000213p-1KmI;
	Fri, 17 Jul 2026 10:43:18 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg26-0000000211t-2AKn
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 10:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784284980; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OGQ/IHMvTCF4bZBFOaaLrewI2BDQEJszNLaLtQ6dwms=;
 b=oQZN1Mhk8s9IRWzLf0733MiuK9mKZYyoNCBHK7KLX5yBLaAgxWhXbngI/1RmTqDc3nauH1
 6k61qNL38wA+EI3cNaqgmIthe3el+YLOFs6eyF9ASLEGw2VDnUupO5x2azRt3w93mST6Ks
 1C7gWBmpGlRjg8fEa0FrgLBNRBRnTnGxocbKnx1NEPi+73KXNqS22b+ee0Pvr8iS1EFmH9
 1dTEDwUnnQQLq9XS6USSH+lyULoz0MIRgYPgkHWJWNjAZAkPrBDawtpO7RNhSVAeBjekO2
 HWiULBU14m9ciEffLAz1wPDCb0aMtbRUK3ELKLWYifqSo7dJnRdesJKwcinEtg==
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
Received: from [100.86.214.202] ([61.141.241.111]) by smtp.feishu.cn with ESMTPS; Fri, 17 Jul 2026 18:42:57 +0800
Subject: Re: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for cbo.clean errata
Mime-Version: 1.0
In-Reply-To: <380e13a0-38c6-4cf2-9079-cfffae422d26@iscas.ac.cn>
References: <20260715084724.26578-1-yang.yicong@picoheart.com> <20260715084724.26578-3-yang.yicong@picoheart.com> <96c3e2f3-602e-497a-937e-b56047ca3a27@iscas.ac.cn> <3ac14150-a3f1-4512-bb97-357e4ba24459@picoheart.com> <380e13a0-38c6-4cf2-9079-cfffae422d26@iscas.ac.cn>
Cc: <yang.yicong@picoheart.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>
Date: Fri, 17 Jul 2026 18:42:56 +0800
Message-Id: <81075022-4fa8-414a-9636-59097ed13d16@picoheart.com>
X-Lms-Return-Path: <lba+26a5a0732+ef40b5+lists.infradead.org+yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_034306_772174_FE7F4B97 
X-CRM114-Status: GOOD (  22.31  )
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

On 7/17/26 4:06 PM, Vivian Wang wrote:
> On 7/17/26 13:58, Yicong Yang wrote:
> 
>> On 7/17/26 10:44 AM, Vivian Wang wrote:
>>> On 7/15/26 16:47, Yicong Yang wrote:
>>> [...]
>>>> +
>>>> +	/* Do the emulation only for userspace on the sufferred platform */
>>>> +	if (!user_mode(regs) || !riscv_cpu_has_zicbom_errata())
>>> user_mode(regs) is already checked below in the handler right? I think
>>> checking again here is unnecessary.
>> maybe not (or I miss somewhere)?
>>
>> but the check here is to make sure we can bail out early for non-errata
>> cases to avoid running unnecessary stuffs.
> 
> It's only called in do_trap_insn_illegal() right? In the
> if(user_mode(regs)) branch
> 
>     do_trap_insn_illegal()
>         if (user_mode(regs))
>             riscv_v_first_use_handler()
>             if (!handled) riscv_picoheart_illegal_insn_handler()
>             if (!handled) do_trap_error()
> 
> Did I miss something?

okay, you mean the caller then it's right.

you asked "below in the handler" so I thought you mean somewhere implicit
in this riscv_picoheart_illegal_insn_handler.

> 
>>> Also, I'd rather riscv_cpu_has_zicbom_errata() to have the word
>>> "picoheart" in it, because "clean doesn't work, please flush instead" is
>>> still rather specific. We could always rename this later.
>>>
>>>> [...]
>>>>
>>>> +static void picoheart_errata_cache_wback(phys_addr_t paddr, size_t size)
>>>> +{
>>>> +	void *vaddr = phys_to_virt(paddr);
>>>> +
>>>> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
>>> Do we really need this? ...
>> yes, this one line macro will make the code clear and simple. we
>> only need to handling the logic of ourself (replace cbo.clean with
>> cbo.flush) without caring about the underlying assemble and configs...
>>
>>>> +}
>>>>
>>>> [...]
>>>>
>>>> +static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>>>> +					     unsigned long archid,
>>>> +					     unsigned long impid)
>>>> +{
>>>> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_CBO_CLEAN))
>>>> +		return;
>>>> +
>>>> +	if (stage != RISCV_ALTERNATIVES_BOOT)
>>>> +		return;
>>>> +
>>>> +	if (!riscv_isa_extension_available(NULL, ZICBOM))
>>>> +		return;
>>> ... and this? Are there Picoheart CPUs with this specific archid or
>>> impid that *doesn't* support Zicbom? Or systems with firmware that
>>> doesn't enable Zicbom?
>> it's sanity to have this check as this errata is for Zicbom, in
>> case a certain version of firmware doesn't report Zicbom in any
>> unknown reasons.
> 
> Okay, I get what you mean. You didn't write ALT_CMO_OP because you
> wanted to double check Zicbom support in the actual ops. You wrote that
> because that's just the macro with cbo.flush in it.
> 
> So you only need to have the wback function, and inv and wback can be
> left as zero initialized. In that case arch_dma_cache_*() in

benefit?

I don't have strong feelings for either way but I feel this implicit
assignment will make the code a bit less readable and not that
self-explained. Considering only ~10 more LOCs if implement all
these three callbacks...

> arch/riscv/mm/dma-noncoherent.c will just do the standard operation. See
> e.g.:
> 
>     static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>     {
>     	void *vaddr = phys_to_virt(paddr);
> 
>     #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
>     	if (unlikely(noncoherent_cache_ops.inv)) {         // <-- HERE
>     		noncoherent_cache_ops.inv(paddr, size);
>     		return;
>     	}
>     #endif
> 
>     	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
>     }
> 
> And after you've done that, consider this somewhat out of left field
> suggestion: Move the static inline void arch_dma_cache_*() functions to
> dma-noncoherent.h and here just define the nonstandard cache ops here as:
> 
>     struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
>     	.wback = arch_dma_cache_wback_inv
>     };
> 
> It's somewhat weirdly recursive but in a way that I think makes sense:
> It's saying "Instead of wback, do a wback_inv" (Inform 7, anyone? :P).
> Perf-wise this has one extra cache-hot load for the NULL wback_inv (hot
> since it's *right* next to the wback function pointer just loaded), and
> one predictably non-taken branch, and in exchange you get to just
> completely drop all of your own implementations.
> 

But I'll just implement the custom callback directly for the readability
here (as you also find it weirdly, and probably more person will have
doubts here).

thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
