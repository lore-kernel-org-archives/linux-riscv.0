Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DCC3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3g77bBpSyJ0c8uLLdxe1SANei4d3za7/rM+Cyc9+48o=; b=W3SRHQ3Slcqtzz
	iZ0GzQ/W6S9ZqRqDy7KjFmUekJwUsT/9HoCQQ7BFf2MX6wSs4TlIjXXvojbhr3zUGclotsq2AAKtc
	dfDGiklnViL49Vp2GnoASaa6lDWzBVqa7NOA7fq25ISc3MfIg12hYsVY2tujj33VqHWXqihHwDerO
	WfVywMhoyThgDXFLWp4e3T7imePzYaMU1jRvvSGn666YWR1fiCiLPYA7GkyBBnPET8w51cUVMzUJh
	ZahajbxuqdOIZ3VqptLi2Y+J1EVOqDf2IGVKOZFaDGt0tX192Hn0RRGZ+feKI/fbNJ5Kk6BE5xqoG
	SCROyE7ZAR4JeGuewYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCczy-0000000FEm1-1xgR;
	Wed, 07 May 2025 11:31:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcxT-0000000FEIK-0hZt
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 11:29:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso6230090a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746617342; x=1747222142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sttONq6C7vjvpabOEe6Nl/nb6a/BYUM2iobwsWyFxG0=;
        b=K/fdtccJzEj9FU+JjowfDCK2N8c4DDYLyCM+OJ5xjn6TlKNStIDvRbAyFJx8nrYVj2
         SaqDN/cdMw0XkQD6oIqWR+8Mcuvbq0r+VAcyZGYO1AD29+T1K7KQAMmAWQGbtIOFmtBT
         2HjGg873g/4hX+89Umpvz+ud1Mru/JJ3w1jCZuYPsSoVX0uesFhwE3ZqfpPlb45fGhXi
         RKzg1MxSNxcTMLrcxioU4Ua6l1BUDjvSScmzVfOL9pMCIZaBq7BoSMhoL3z5mZNcn0DJ
         NftU7iszNyigYitPAdH8KFlWMNASyc3gRUkAJmlwvJHuGWfwQRALZ/iLTAE+PKmit/wc
         hz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617342; x=1747222142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sttONq6C7vjvpabOEe6Nl/nb6a/BYUM2iobwsWyFxG0=;
        b=uQ6bflekiJgYNTdvuWDfR5cbWDEQsTySyJT5a03ew7fMEbj/v6Qx5VvlZ7uPWfG28h
         i9ZsRrbe/9WxEgbgE88dPt5RUZOyMtEOXhGAE2yBmG2zvYYt+mviwI28klvjlg7gv6uz
         zB1JVqXaDY/kjbpo9m+AP4jNNNl5kyrylJqDKAASZpCwpR1UQNX9r8JqEsjte4CIxdey
         A3TpT5iX0oAYxLwSiHFUBVU/qAfQce0S4Djc6FMljG3GTqrnfVbxzKRKQo5UtHFTbCuz
         2vUhLehFEzkTwlI3PdlLDOP74OjEZPx/aUes+da/7Wy9WU0QAjzGHuy0Tx8FaGO47IFF
         2LlA==
X-Gm-Message-State: AOJu0YydAR3PTw2/aFyO64kOP2quBXC0KNlnqp84xLhsW8uSlqmrbo7u
	G6XFgPsSMDisKbBCA3iu8UyRLC64HKIOMFqJRhPuOTmn/AZ9vv+JGUcFmkhe488=
X-Gm-Gg: ASbGncuWe0apoOtePfNphais2d2gj7keE4iFT8mpuTW5lECFuTA3+GLDmWP3wpc16Yx
	xqCJPdOSTzq6waS/mLosyNFWFRSoO1trcgxp8mDUgBvQy3Er6D1gTk3qX8VFhMUddZtRMljSAlx
	nMC24Rr8ZvvKnI14BOdO0bZqaGcTmnntPUDQmXfcTTkzvCqpa+yUKR04sT2WIgwVKlLfv3h9bFx
	9y8VNiJBIu5SvS/PMSu0lXuBfBhwpta85Q9EModLHMzWuEPlBazYMbEuWcBOBNgzYrqpDd3nkEM
	pGaknm2om7gFQwc8NCgnwZ2k7UUftfdXFSQYhuwcPl9a22/Mo2m3AiirsD2Nk9WeYJB+MFjmQMg
	Bmq/hejFR63n2DMPCgbdIEwE=
X-Google-Smtp-Source: AGHT+IG0tWDBCkB5n9QIjsb9/8DjWrsdfDefC415eDCLuX/h+jgmPObe4nyyj6NIY6hM4/giQEdftA==
X-Received: by 2002:a17:90b:4d04:b0:2ff:6488:e01c with SMTP id 98e67ed59e1d1-30aac2a3241mr4289150a91.29.1746617341806;
        Wed, 07 May 2025 04:29:01 -0700 (PDT)
Received: from ?IPV6:2401:4900:7aa3:bb0a:8dbc:b918:6297:af68? ([2401:4900:7aa3:bb0a:8dbc:b918:6297:af68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae4fd109sm1761398a91.1.2025.05.07.04.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:29:01 -0700 (PDT)
Message-ID: <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
Date: Wed, 7 May 2025 16:58:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com> <aBltPLLrvUNKR857@ghost>
Content-Language: en-US
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <aBltPLLrvUNKR857@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_042903_214872_3AE06119 
X-CRM114-Status: GOOD (  28.47  )
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

Hi Charlie,

On 5/6/25 07:30, Charlie Jenkins wrote:
> On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
>> RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
>> SBI debug trigger extension to install/uninstall/update/enable/disable hardware
>> triggers as specified in Sdtrig ISA extension.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> ---
>>   arch/riscv/Kconfig                     |   1 +
>>   arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
>>   arch/riscv/include/asm/kdebug.h        |   3 +-
>>   arch/riscv/kernel/Makefile             |   1 +
>>   arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
>>   arch/riscv/kernel/traps.c              |   6 +
>>   6 files changed, 996 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>>   create mode 100644 arch/riscv/kernel/hw_breakpoint.c
>>
> ...
>
>> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
>> new file mode 100644
>> index 000000000000..7787123c7180
>> --- /dev/null
>> +++ b/arch/riscv/kernel/hw_breakpoint.c
>> +
>> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
>> +static int __init arch_hw_breakpoint_init(void)
>> +{
>> +	unsigned int cpu;
>> +	int rc = 0;
>> +
>> +	for_each_possible_cpu(cpu)
>> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
>> +
>> +	if (!dbtr_init)
>> +		init_sbi_dbtr();
>> +
>> +	if (dbtr_total_num) {
>> +		pr_info("%s: total number of type %d triggers: %u\n",
>> +			__func__, dbtr_type, dbtr_total_num);
>> +	} else {
>> +		pr_info("%s: No hardware triggers available\n", __func__);
>> +		goto out;
>> +	}
>> +
>> +	/* Allocate per-cpu shared memory */
>> +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
>> +					PAGE_SIZE);
>> +
>> +	if (!sbi_dbtr_shmem) {
>> +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
>> +		rc = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	/* Hotplug handler to register/unregister shared memory with SBI */
>> +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> When using this, only hart 0 is getting setup. I think instead we want
> the following to have all harts get setup:
>
> 	for_each_online_cpu(cpu)
> 		arch_smp_setup_sbi_shmem(cpu);
>
> 	/* Hotplug handler to register/unregister shared memory with SBI */
> 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,

cpuhp_setup_state() install the callbacks and invoke the @startup 
callback (if not NULL) for all online CPUs. So there is no need to call 
"arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug 
handler.

If you are running this on QEMU, could you please share the qemu command 
you are invoking? I will test at my end and update you.

Regards

Himanshu

>
>
> However, I am testing against tip-of-tree opensbi and am hitting an
> issue during the setup on all harts:
>
> [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
> [    0.202794] CPU 0: HW Breakpoint shared memory registered.
>
> Additionally, this seems like it should be a fatal error, but it
> continues on to print that the shared memory is registered because there
> is no check before printing this seemingly successful message.
>
> I know I am reviving an old thread, but do you have any insight into
> what might be happening?
>
> - Charlie
>
>> +			       "riscv/hw_breakpoint:prepare",
>> +			       arch_smp_setup_sbi_shmem,
>> +			       arch_smp_teardown_sbi_shmem);
>> +
>> +	if (rc < 0) {
>> +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
>> +		free_percpu(sbi_dbtr_shmem);
>> +		return rc;
>> +	}
>> + out:
>> +	return rc;
>> +}
>> +arch_initcall(arch_hw_breakpoint_init);
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index a1b9be3c4332..53e1dfe5746b 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
>>   	if (probe_breakpoint_handler(regs))
>>   		return;
>>   
>> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
>> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
>> +	    == NOTIFY_STOP)
>> +		return;
>> +#endif
>> +
>>   	current->thread.bad_cause = regs->cause;
>>   
>>   	if (user_mode(regs))
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
