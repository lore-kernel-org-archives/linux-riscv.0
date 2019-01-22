Return-Path: <SRS0=K4JQ=P6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8F9C282C3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 22 Jan 2019 18:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2947205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 22 Jan 2019 18:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1lNqOMX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I4nqVpcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2947205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4cb6RICJAC+0kbTTsi1jAkPcNWXG4e9QBPQx1Dov+QE=; b=U1lNqOMXlhdYike9pYgw1UxtI
	K+oSJfTk8t1WUX31kVniUoSvrh4Af7JzpaeNcZIluk5qxGfobvJRrGsWPSPVB6IJzS/9WgXMwnNaQ
	D6u2SLbsGRRBiUv53QjbDi118Xw6fT9izubU7l74+iCq18a950jCmlCd8xLvQxqz//uYjJP2r2s/H
	hYmhbez5MUr1J4b8wJCI37wUigOfZoGJtEWL1PBfFuIKjPYdXoQp5w8oqu0SEdnElVPCfq6MR1WhS
	PbAK9Cf0l0xWi7KaVxwQWZX14HdvGPzNLcPukrzNYlORyI6QPHFT2Bx0/B+VOCABQ0rPU8ixj4kdD
	0JB4M14tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gm1GC-0004vJ-Pz; Tue, 22 Jan 2019 18:58:56 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gm1G9-0004ur-Th
 for linux-riscv@lists.infradead.org; Tue, 22 Jan 2019 18:58:55 +0000
Received: by mail-pf1-x443.google.com with SMTP id h3so12222899pfg.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jan 2019 10:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tBqlp10k4es8Fb0UZkrFAqNQyoizapiAG5ZARQOAZm8=;
 b=I4nqVpcqKpHwkjR7JfZnx6HxdJM0yqbLUXlR+F+/5wrZzng6pjHw9ibguUdpMNK+t1
 YC4rX/jcnydlpbGittwhDYy/+HkFBL4VRqLL7C06FYGBmPRDFNYAtc2KUNisqeT9T/ai
 9vIzJEq6mVWCurujXok3TSETcLPs9tzdqkSMZaC3D35UDK48tofbQPpj0gyUNU6oPA34
 lnU0GDb1SYwqt1ID1tCjHkyrnhjluiw2wUGBemSrHfF/FF6lS30BIWdE0eu8pV+R63FX
 PJc3kfC9roo30ZjQ4Lp/I5InCASXAUwiEjKfTAaXW+msdrvfUCNJNwn7K+UxbxobrPTz
 15eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tBqlp10k4es8Fb0UZkrFAqNQyoizapiAG5ZARQOAZm8=;
 b=bfcpthCgJ4PygG/IbmtOqvM1xvGyocUzbykApg+m405YN8MQQbZNxKcoilhNPvrWy1
 XrUJPAOsVz23eouQpD7bMXaOGcEOZG4EbSjQSGKnzxduMrEfICAZLeRPLKHMEJOoT0yL
 0kNOx/DGTSsepQgNzbWr8QEqwBY4LKOFK+RZwLST/4DIWsIil63C+bfuTEbaPu3rZLj7
 6LoIP/VLdreNHQz9hwsCaujweRE8A0LvOWBc+9TbhCgVbat6XGe+7s3GQ0QPgr8u7we/
 Cb0Ax+cm9ne2OdzghscZxrDI8nF9WcgnLwpX6AmOtlpxgQTvPsME3W/8pdaoVk/cEdHF
 cfag==
X-Gm-Message-State: AJcUukeWmwBwF/k7oFHMc/aWRHxeocO0cTewvk1hKR+q7gJdnpK1/F3N
 6oQjnIDhFsyio5s4FcZgsImTcA==
X-Google-Smtp-Source: ALg8bN4GzYF0lR0u2zs/IIY/Z4fgzNmeu+63hMTEJxdA9BBdNYFI8ENW8oiIh1cBhA13U0TllyauBw==
X-Received: by 2002:a63:451a:: with SMTP id s26mr20467919pga.150.1548183532468; 
 Tue, 22 Jan 2019 10:58:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n68sm25949284pfb.62.2019.01.22.10.58.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jan 2019 10:58:51 -0800 (PST)
Date: Tue, 22 Jan 2019 10:58:51 -0800 (PST)
X-Google-Original-Date: Tue, 22 Jan 2019 10:58:30 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add _TIF_NEED_RESCHED check for kernel thread
 when CONFIG_PREEMPT=y
In-Reply-To: <20190103054555.GA30904@roeck-us.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux@roeck-us.net
Message-ID: <mhng-fd3c9beb-34ce-40c5-92ce-0a7d76d877aa@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_105854_020287_0EB7C9D9 
X-CRM114-Status: GOOD (  19.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 vincentc@andestech.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 02 Jan 2019 21:45:55 PST (-0800), linux@roeck-us.net wrote:
> On Thu, Jan 03, 2019 at 11:32:33AM +0800, Vincent Chen wrote:
>> The cond_resched() can be used to yield the CPU resource if
>> CONFIG_PREEMPT is not defined. Otherwise, cond_resched() is a dummy
>> function. In order to avoid kernel thread occupying entire CPU,
>> when CONFIG_PREEMPT=y, the kernel thread needs to follow the
>> rescheduling mechanism like a user thread.
>>
>> Signed-off-by: Vincent Chen <vincentc@andestech.com>
>
> This patch seems to do the trick. I no longer see a problem with
> CONFIG_PREEMPT=y and the various lock torture tests enabled, as
> previously reported.
>
> Nice catch and fix.
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> Guenter
>
>> ---
>>  arch/riscv/kernel/asm-offsets.c |    1 +
>>  arch/riscv/kernel/entry.S       |   18 +++++++++++++++++-
>>  2 files changed, 18 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>> index 6a92a2f..dac9834 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -39,6 +39,7 @@ void asm_offsets(void)
>>  	OFFSET(TASK_STACK, task_struct, stack);
>>  	OFFSET(TASK_TI, task_struct, thread_info);
>>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>> +	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>>  	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 13d4826..728b72d 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -144,6 +144,10 @@ _save_context:
>>  	REG_L x2,  PT_SP(sp)
>>  	.endm
>>
>> +#if !IS_ENABLED(CONFIG_PREEMPT)
>> +#define resume_kernel restore_all
>> +#endif
>> +

I don't like preprocessor stuff if we can avoid it, are you OK if I squash in 
the following diff:

    diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
    index cfbad2f689c3..fd9b57c8b4ce 100644
    --- a/arch/riscv/kernel/entry.S
    +++ b/arch/riscv/kernel/entry.S
    @@ -145,7 +145,7 @@ _save_context:
     	.endm
    
     #if !IS_ENABLED(CONFIG_PREEMPT)
    -#define resume_kernel restore_all
    +.set resume_kernel, restore_all
     #endif
    
     ENTRY(handle_exception)

I think that should do the same thing, but at link time instead of in the 
preprocessor -- that makes it a bit less likely to bit us in the future.

>>  ENTRY(handle_exception)
>>  	SAVE_ALL
>>
>> @@ -228,7 +232,7 @@ ret_from_exception:
>>  	REG_L s0, PT_SSTATUS(sp)
>>  	csrc sstatus, SR_SIE
>>  	andi s0, s0, SR_SPP
>> -	bnez s0, restore_all
>> +	bnez s0, resume_kernel
>>
>>  resume_userspace:
>>  	/* Interrupts must be disabled here so flags are checked atomically */
>> @@ -250,6 +254,18 @@ restore_all:
>>  	RESTORE_ALL
>>  	sret
>>
>> +#if IS_ENABLED(CONFIG_PREEMPT)
>> +resume_kernel:
>> +	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
>> +	bnez s0, restore_all
>> +need_resched:
>> +	REG_L s0, TASK_TI_FLAGS(tp)
>> +	andi s0, s0, _TIF_NEED_RESCHED
>> +	beqz s0, restore_all
>> +	call preempt_schedule_irq
>> +	j need_resched
>> +#endif
>> +
>>  work_pending:
>>  	/* Enter slow path for supplementary processing */
>>  	la ra, ret_from_exception

I'm just going to assume you're OK with the squash and drop this into my plans 
for the next RC, let me know if that's not OK.

Thanks for fixing this!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
