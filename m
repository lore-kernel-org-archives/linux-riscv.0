Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D78C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nphy++U4vy8+LGJPOYqFnaOBDajp9/ztUzq23t7QHsw=; b=VE86HG0lRg06LD
	R4JWy2E2P2yGG4s2AtxwPv/fGLwZhQZbTlFlC6c75Wg504YpVops50O6gANrIi7VrIYC+ZfBkO0ox
	ig/Q9BA0drrXazLPwZcjU7SPijVFhD6lQa+HtkS5YGw6ax7EtgmoxojB0G7rRzSMv4y3xFFBUMhmO
	cg5LVaWxD52QEcD0yImvCYgZYLUk/+sdhyH1axQGccOG+F6vPpsc6FmXAon9P4M0JL1GModZKfIXa
	Faa/O3SB9VOAqgywT6YrRdh7OLQRQMcs0RTsCBHw77NnUsA1bgLvzqB9RPLqpUHArzwR91M11euOk
	ElKrQMUlDXuoBHrxdbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdaF-00000001Yoe-241V;
	Fri, 17 Jul 2026 08:06:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdaB-00000001Yn5-4Bng
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:06:10 +0000
Received: from [192.168.0.104] (unknown [123.116.46.73])
	by APP-01 (Coremail) with SMTP id qwCowAAn_O9p4llq_M41AA--.425S2;
	Fri, 17 Jul 2026 16:06:01 +0800 (CST)
Message-ID: <380e13a0-38c6-4cf2-9079-cfffae422d26@iscas.ac.cn>
Date: Fri, 17 Jul 2026 16:06:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for
 cbo.clean errata
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, geshijian@picoheart.com,
 niehaitao@picoheart.com, cuiyunhui@bytedance.com
References: <20260715084724.26578-1-yang.yicong@picoheart.com>
 <20260715084724.26578-3-yang.yicong@picoheart.com>
 <96c3e2f3-602e-497a-937e-b56047ca3a27@iscas.ac.cn>
 <3ac14150-a3f1-4512-bb97-357e4ba24459@picoheart.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <3ac14150-a3f1-4512-bb97-357e4ba24459@picoheart.com>
X-CM-TRANSID: qwCowAAn_O9p4llq_M41AA--.425S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfKw1fuw17Kw18XF1UWrg_yoWrXry3pF
	y7Wa1YkFWqgF97KrZ2gws5XF1rtrZ3Ka15Xay5JasxZas8Xr1fKFsYk3WYkF1vgr4xAw4j
	vrWDK3s8WFs8XrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgcTQUUUUU
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010608_419073_1D340E9C 
X-CRM114-Status: GOOD (  17.41  )
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

On 7/17/26 13:58, Yicong Yang wrote:

> On 7/17/26 10:44 AM, Vivian Wang wrote:
>> On 7/15/26 16:47, Yicong Yang wrote:
>> [...]
>>> +
>>> +	/* Do the emulation only for userspace on the sufferred platform */
>>> +	if (!user_mode(regs) || !riscv_cpu_has_zicbom_errata())
>> user_mode(regs) is already checked below in the handler right? I think
>> checking again here is unnecessary.
> maybe not (or I miss somewhere)?
>
> but the check here is to make sure we can bail out early for non-errata
> cases to avoid running unnecessary stuffs.

It's only called in do_trap_insn_illegal() right? In the
if(user_mode(regs)) branch

    do_trap_insn_illegal()
        if (user_mode(regs))
            riscv_v_first_use_handler()
            if (!handled) riscv_picoheart_illegal_insn_handler()
            if (!handled) do_trap_error()

Did I miss something?

>> Also, I'd rather riscv_cpu_has_zicbom_errata() to have the word
>> "picoheart" in it, because "clean doesn't work, please flush instead" is
>> still rather specific. We could always rename this later.
>>
>>> [...]
>>>
>>> +static void picoheart_errata_cache_wback(phys_addr_t paddr, size_t size)
>>> +{
>>> +	void *vaddr = phys_to_virt(paddr);
>>> +
>>> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
>> Do we really need this? ...
> yes, this one line macro will make the code clear and simple. we
> only need to handling the logic of ourself (replace cbo.clean with
> cbo.flush) without caring about the underlying assemble and configs...
>
>>> +}
>>>
>>> [...]
>>>
>>> +static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>>> +					     unsigned long archid,
>>> +					     unsigned long impid)
>>> +{
>>> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_CBO_CLEAN))
>>> +		return;
>>> +
>>> +	if (stage != RISCV_ALTERNATIVES_BOOT)
>>> +		return;
>>> +
>>> +	if (!riscv_isa_extension_available(NULL, ZICBOM))
>>> +		return;
>> ... and this? Are there Picoheart CPUs with this specific archid or
>> impid that *doesn't* support Zicbom? Or systems with firmware that
>> doesn't enable Zicbom?
> it's sanity to have this check as this errata is for Zicbom, in
> case a certain version of firmware doesn't report Zicbom in any
> unknown reasons.

Okay, I get what you mean. You didn't write ALT_CMO_OP because you
wanted to double check Zicbom support in the actual ops. You wrote that
because that's just the macro with cbo.flush in it.

So you only need to have the wback function, and inv and wback can be
left as zero initialized. In that case arch_dma_cache_*() in
arch/riscv/mm/dma-noncoherent.c will just do the standard operation. See
e.g.:

    static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
    {
    	void *vaddr = phys_to_virt(paddr);

    #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
    	if (unlikely(noncoherent_cache_ops.inv)) {         // <-- HERE
    		noncoherent_cache_ops.inv(paddr, size);
    		return;
    	}
    #endif

    	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
    }

And after you've done that, consider this somewhat out of left field
suggestion: Move the static inline void arch_dma_cache_*() functions to
dma-noncoherent.h and here just define the nonstandard cache ops here as:

    struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
    	.wback = arch_dma_cache_wback_inv
    };

It's somewhat weirdly recursive but in a way that I think makes sense:
It's saying "Instead of wback, do a wback_inv" (Inform 7, anyone? :P).
Perf-wise this has one extra cache-hot load for the NULL wback_inv (hot
since it's *right* next to the wback function pointer just loaded), and
one predictably non-taken branch, and in exchange you get to just
completely drop all of your own implementations.

It's not as much a lines-of-code reduction as I can hope because there's
still the emulation stuff, of course... For that, I'm also looking
forward to Bo Gan's thoughts on that in the other thread.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
