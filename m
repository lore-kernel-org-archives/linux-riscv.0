Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE419C4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7DE22EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7DE22EBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lQLrQm4MRYbgQigSOhWJFfxtZ5jinSfuh3WEaDOrk4I=; b=sW4RJUzgrG5kcRpmv5rB3oAvL
	JAskYE0EvDy2yqaB5mhX3+uaEhW6wJcU4rGUfWuSBgdCWx0FNrH9iKy1gNCUavQ1RekAB+I/7TMar
	dUq7Wd2FkZHXXoj3BDi+f3GQuKEfRAZOU4BHqnbcYJmszgsHeBZFmcR+EoXoUXW1YUhpSUFFJAabp
	MPsXkDoRnFGjIl9q0i9vhOTcNEOKms83ZRYc/wqb0AbcNeuWOI0g7qfJ2emI3kUT8RBD+NJ7CT0zj
	0F8MV+J0UpUN5MrAzIP9Fj5OifKTdG60NMzCeeIkXZyvIvOZbE1hKIsx516gICKkHepenKAoE6QMq
	uL8uQdXWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1komLw-0004OT-Iq; Mon, 14 Dec 2020 11:49:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1komLt-0004Nz-NF
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 11:49:19 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CvfmB1vQ7zkqtR;
 Mon, 14 Dec 2020 19:48:26 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 19:49:09 +0800
Subject: Re: [PATCH v2] riscv: Using printk directly in __show_regs
To: John Ogness <john.ogness@linutronix.de>, Palmer Dabbelt
 <palmerdabbelt@google.com>
References: <mhng-749d2791-936b-493d-9b8b-89dfea7ec9da@palmerdabbelt-glaptop1>
 <87sg8chgnr.fsf@jogness.linutronix.de>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <1a733e2e-f473-f26a-9982-57740941a011@huawei.com>
Date: Mon, 14 Dec 2020 19:49:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87sg8chgnr.fsf@jogness.linutronix.de>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_064918_250117_2002D334 
X-CRM114-Status: GOOD (  20.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/12/11 16:48, John Ogness wrote:
> On 2020-12-10, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>> On Thu, 26 Nov 2020 05:33:38 PST (-0800), wangkefeng.wang@huawei.com wrote:
>>> Covert bulk of pr_cont("...\n") to separate printk calls.
>>>
>>> Note that a pr_cont() message with a trailing newline will
>>> "terminate" the continous line so that it can no longer be
>>> continued, also it is possible to sort out simultaneous dumps
>>> from multiple CPUs with CONFIG_PRINTK_CALLER enabled.
>>>
>>> And align the printing formats.
>>>
>>> Suggested-by: John Ogness <john.ogness@linutronix.de>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>   arch/riscv/kernel/process.c | 24 ++++++++++++------------
>>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>>> index e41b733abeaa..2119d49feea5 100644
>>> --- a/arch/riscv/kernel/process.c
>>> +++ b/arch/riscv/kernel/process.c
>>> @@ -44,30 +44,30 @@ void __show_regs(struct pt_regs *regs)
>>>   {
>>>   	show_regs_print_info(KERN_DEFAULT);
>>>
>>> -	pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>>> +	printk("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>>>   		regs->epc, regs->ra, regs->sp);
>>> -	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>>> +	printk("gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>>>   		regs->gp, regs->tp, regs->t0);
>>> -	pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>>> +	printk("t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>>>   		regs->t1, regs->t2, regs->s0);
>>> -	pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>>> +	printk("s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>>>   		regs->s1, regs->a0, regs->a1);
>>> -	pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>>> +	printk("a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>>>   		regs->a2, regs->a3, regs->a4);
>>> -	pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>>> +	printk("a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>>>   		regs->a5, regs->a6, regs->a7);
>>> -	pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>>> +	printk("s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>>>   		regs->s2, regs->s3, regs->s4);
>>> -	pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>>> +	printk("s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>>>   		regs->s5, regs->s6, regs->s7);
>>> -	pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>>> +	printk("s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>>>   		regs->s8, regs->s9, regs->s10);
>>> -	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>>> +	printk("s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>>>   		regs->s11, regs->t3, regs->t4);
>>> -	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
>>> +	printk("t5 : " REG_FMT " t6 : " REG_FMT "\n",
>>>   		regs->t5, regs->t6);
>>>
>>> -	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>>> +	printk("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>>>   		regs->status, regs->badaddr, regs->cause);
>>>   }
>>>   void show_regs(struct pt_regs *regs)
>> For some reason I remember having these as printk()s originally, but I
>> don't see that in the git history so maybe it was from before we
>> merged the port?  I don't really understand the difference here, and I
>> thought using printk() directly wasn't recommended?

The original reason which I changed to printk is the strange out-print, 
see v1 patch [1],

but it's found that there is a regression in v5.10 printk rework, and 
being fixed by commit

4ad9921af4f1 ("printk: finalize records with trailing newlines").

The v2 patch major change is align the printing (not a big change) and 
in case of rearrangement of

print when CONFIG_PRINTK_CALLER enabled

[1] 
https://patchwork.kernel.org/project/linux-riscv/patch/20201124112054.106960-2-wangkefeng.wang@huawei.com/


> There no difference between:
>
>     pr_cont("...\n");
>        and
>     printk("...\n");
>
> except for the very first call, which will try to continue from whatever
> was printed before. (But even that only makes a difference if the
> previous call did not have a newline at the end.)
>
> Note that the printk() being used does not specify the loglevel. Perhaps
> it is intentional that the default loglevel (which can be specified by
> the user) is used? Otherwise, if a particular loglevel _is_ desired,
> then the appropriate pr_info/pr_warn/... should be used.
>
> Also, this patch is also sneaking in some formatting changes. Previously
> the columns were not aligned correctly. That spacing is also fixed
> here. The spacing change _is_ a real improvement.
>
> John Ogness
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
