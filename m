Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71580C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 08:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D7723EF1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 08:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D7723EF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EfO03lSuK3miKWJZ2GrUah64s4a89WhCRwIYh63TJP8=; b=PGbE90gPmWAcjobmm+Nq/qDT7
	APGqZIPWCVE6jyNqoyHGZHf0FOrQkA2r9IzCSy01QzNbDG+tyxCjfGM93O33DGtZ59DF3T3rCn5iW
	cBPwRhW3+PRUg0Qgd4o9CFp77bbP5JGy/CM/sBoIaHBV4cBfblrXXguZFxqgX/Ca7RMXw6nL7awtX
	J1WoD0byW1b1fpJFD8l8TrOS0Kf2NwoeLQbLbAcU7hhpAVzTCh3hNQdvBOgZx0dFEf9X7iln3bBjE
	DolCBRo3jBxGGDhwCFU8FPmQ5mHG0Mhb0Msllwxpb5xFBKkLdQ/mSUv5mPfUKfcez6pDgewWMV0jX
	JAV3z2aSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kne6Z-0004MJ-DX; Fri, 11 Dec 2020 08:48:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kne6X-0004Le-9M
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 08:48:46 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607676521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Ru+mv0I9+eOkgL8ECbWpI5QwVJmZ0RmiN5tIrtko2Q=;
 b=yZCj0uZ8TW9i/4WyUA0st9bfxTSmJZjTaes5A62irVsXmeV3xUmUxnr6zggeAu1r/ShuNA
 Ptf2JcRFQl1KKyI55Zzle6uZAtkkVD0Fc59wME1c7x0db2+uHDOqPWc7B8bKL0AdIjHetX
 GUG+zExL0vRIV9JlWZkf5ZQPfu/yZj6i3oB7WWRUrgnNwaqYdeYiU3jb5pCwSLsE21hFM/
 W4uamcRUiv33Swx4sfWA+YEdcM2+ZnBfhZrbL2MD7wgjxgzT08fKp0XvRqOM09iISotLp6
 AgK/5jTZHZIwx/li+lBp5ZjBZvL6XnG3GUlfhNPtLGm2QKjTO0hKfN0AXTyUlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607676521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Ru+mv0I9+eOkgL8ECbWpI5QwVJmZ0RmiN5tIrtko2Q=;
 b=tHRmnfBoSTUGf27qNjYnQeMHmDlu29d4dGrwScNpm2h9MPbN4e2LQfSYNp3+HHXRq9VumQ
 37nO7Bw7F2jjXmDA==
To: Palmer Dabbelt <palmerdabbelt@google.com>, wangkefeng.wang@huawei.com
Subject: Re: [PATCH v2] riscv: Using printk directly in __show_regs
In-Reply-To: <mhng-749d2791-936b-493d-9b8b-89dfea7ec9da@palmerdabbelt-glaptop1>
References: <mhng-749d2791-936b-493d-9b8b-89dfea7ec9da@palmerdabbelt-glaptop1>
Date: Fri, 11 Dec 2020 09:54:40 +0106
Message-ID: <87sg8chgnr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_034845_538682_213079C0 
X-CRM114-Status: GOOD (  15.21  )
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
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-12-10, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> On Thu, 26 Nov 2020 05:33:38 PST (-0800), wangkefeng.wang@huawei.com wrote:
>> Covert bulk of pr_cont("...\n") to separate printk calls.
>>
>> Note that a pr_cont() message with a trailing newline will
>> "terminate" the continous line so that it can no longer be
>> continued, also it is possible to sort out simultaneous dumps
>> from multiple CPUs with CONFIG_PRINTK_CALLER enabled.
>>
>> And align the printing formats.
>>
>> Suggested-by: John Ogness <john.ogness@linutronix.de>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  arch/riscv/kernel/process.c | 24 ++++++++++++------------
>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index e41b733abeaa..2119d49feea5 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -44,30 +44,30 @@ void __show_regs(struct pt_regs *regs)
>>  {
>>  	show_regs_print_info(KERN_DEFAULT);
>>
>> -	pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>> +	printk("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>>  		regs->epc, regs->ra, regs->sp);
>> -	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>> +	printk("gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>>  		regs->gp, regs->tp, regs->t0);
>> -	pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>> +	printk("t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>>  		regs->t1, regs->t2, regs->s0);
>> -	pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>> +	printk("s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>>  		regs->s1, regs->a0, regs->a1);
>> -	pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>> +	printk("a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>>  		regs->a2, regs->a3, regs->a4);
>> -	pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>> +	printk("a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>>  		regs->a5, regs->a6, regs->a7);
>> -	pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>> +	printk("s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>>  		regs->s2, regs->s3, regs->s4);
>> -	pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>> +	printk("s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>>  		regs->s5, regs->s6, regs->s7);
>> -	pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>> +	printk("s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>>  		regs->s8, regs->s9, regs->s10);
>> -	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>> +	printk("s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>>  		regs->s11, regs->t3, regs->t4);
>> -	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
>> +	printk("t5 : " REG_FMT " t6 : " REG_FMT "\n",
>>  		regs->t5, regs->t6);
>>
>> -	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>> +	printk("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>>  		regs->status, regs->badaddr, regs->cause);
>>  }
>>  void show_regs(struct pt_regs *regs)
>
> For some reason I remember having these as printk()s originally, but I
> don't see that in the git history so maybe it was from before we
> merged the port?  I don't really understand the difference here, and I
> thought using printk() directly wasn't recommended?

There no difference between:

   pr_cont("...\n");
      and
   printk("...\n");

except for the very first call, which will try to continue from whatever
was printed before. (But even that only makes a difference if the
previous call did not have a newline at the end.)

Note that the printk() being used does not specify the loglevel. Perhaps
it is intentional that the default loglevel (which can be specified by
the user) is used? Otherwise, if a particular loglevel _is_ desired,
then the appropriate pr_info/pr_warn/... should be used.

Also, this patch is also sneaking in some formatting changes. Previously
the columns were not aligned correctly. That spacing is also fixed
here. The spacing change _is_ a real improvement.

John Ogness

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
