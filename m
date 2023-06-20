Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C6EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=89Rx/VM5FIuTB8gg/XIsRmCeI3kDna4YB9tiBAFSfYQ=; b=jEq5lzW3G0IHjfHaGSkmrb9xXs
	ZvjGDyimfPMhMY37ewmVDUPh+bGKDcuhnALd5sSIZg4yF+w3IeeOlTb9DVnfrkkPuUbiwVeJpGE4e
	3TYzCrj0LVvA5k5MJ4N8rHn4nS7W4Q0J/pn8ABZjTIXroOq9G+lIDKd0ih69j4D/yaU1obCjNXTfD
	Q/wflxTQq7dNR3/wdjYUM9ZWond5AXeqG4YcpJR2LbMDFLEDhT8wFTFpw88GpT58yVAD59TY09U+B
	gMoGm+5dl0+OI0anNBT54KTuv7sMU+HSKRmL+DuCuIhF4hnXRm1qK6iXyKsxCq6V9V+UPqBLm5MJW
	cKKbIqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhRE-00CEFb-1L;
	Tue, 20 Jun 2023 19:54:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhRB-00CECe-1N
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:54:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b52d14df27so23888525ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687290886; x=1689882886;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsIaqKRLY/w55XA5LB9E3AHeTBdImbhhaSspjOmTz+k=;
        b=vQNccOY1KmXZzmbpNdP7pNP+MGN+VFDpqBaXrFLe4BPVoy0GqRf5L1qcnF3R5mR1ar
         iRa5MKJp0hqSDMwuMZ+jX5hc6S2Vrhbhb9mDzX0xgrvK9X0d4dQjwNDHpcguTuZZB/XU
         SXfdhzPvzMURg2rHJk+8bx2kuVIJkLQ4E6jQ65u3IU1r0qna5Z1dgE+LVQ460QQ/erb2
         4GK1smNIW1+qGDi80nQD7j/Va9D5gMPABFXJ8e9rfIlgiShEgzPu11pUvvnSDB1Ibia/
         GXn6gE/uw6JtBS3YAuWOZI/C93SRIP0kbb5rGKdr9MFt2JO/353px5ga5qz2LqtS6tu3
         lqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687290886; x=1689882886;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsIaqKRLY/w55XA5LB9E3AHeTBdImbhhaSspjOmTz+k=;
        b=dqibSRIFr+XxgKXxp8CNyQJJTrdVe8hsg5XcoBp0fJdYGQFC+j+kzqmBA7/BgLaVXq
         WBYFPnhkQxh5QCeJbz9uCH7hHynpJWzQ+AZEHJ16gjniRS+OA7e1rRfx72tNjru202wU
         SOIavx0vbNWA5cfyQIdbyIdmtQennf/0bb3MWQerY0ztiM0vZplvXkUFhr8LfIVvM42m
         4LYX5JivdgaGV+pcLF//tkOk4pBiOuE2AgkXEfUzt/qftdKm3LGfrQCIZ+Ou+YMVlOBz
         RXYmwLieNxRhZ9CuMDL3+OkzQCs/bwYNKEGENsAQbfNCByMAJ13imB7ZOzj4eIGZybUY
         EioA==
X-Gm-Message-State: AC+VfDyr4+OmgTw71bLQArjAdUtU9nS/0IH4bKRoINq9JEpobuEK+5jG
	WVx2mkrpouaVNIenUnlHDkvwDA==
X-Google-Smtp-Source: ACHHUZ4Kpx293K87FtkleDrYAYa0rwjXy2nPbgIEJGuxBo6nVZF7ASkOQcfG7zuhiqz3kJZ1Xdj1hQ==
X-Received: by 2002:a17:902:e884:b0:1b5:16f2:a4e3 with SMTP id w4-20020a170902e88400b001b516f2a4e3mr9879390plg.30.1687290885633;
        Tue, 20 Jun 2023 12:54:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n21-20020a170902969500b001b016313b1esm2010616plp.82.2023.06.20.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:54:44 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:54:44 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 12:54:05 PDT (-0700)
Subject: Re: [PATCH v11 5/8] riscv: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
In-Reply-To: <20230608215834.729cfda2@gandalf.local.home>
CC: pengdonglin@sangfor.com.cn, mhiramat@kernel.org, linux@armlinux.org.uk,
  Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
  rmk+kernel@armlinux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org, bp@alien8.de, hpa@zytor.com,
  chenhuacai@kernel.org, zhangqing@loongson.cn, kernel@xen0n.name, mingo@redhat.com,
  peterz@infradead.org, xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
  dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
  linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-672b0efa-aeba-4cb2-808d-6ef271844449@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_125449_467158_C823B89C 
X-CRM114-Status: GOOD (  20.98  )
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

On Thu, 08 Jun 2023 18:58:34 PDT (-0700), rostedt@goodmis.org wrote:
>
> Can I get an ack from a RISC-V maintainer?

Sorry I missed this.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

>
> -- Steve
>
>
> On Sat,  8 Apr 2023 05:42:19 -0700
> Donglin Peng <pengdonglin@sangfor.com.cn> wrote:
>
>> The previous patch ("function_graph: Support recording and printing
>> the return value of function") has laid the groundwork for the for
>> the funcgraph-retval, and this modification makes it available on
>> the RISC-V platform.
>>
>> We introduce a new structure called fgraph_ret_regs for the RISC-V
>> platform to hold return registers and the frame pointer. We then
>> fill its content in the return_to_handler and pass its address to
>> the function ftrace_return_to_handler to record the return value.
>>
>> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
>> ---
>> v10:
>>  - Use CONFIG_FUNCTION_GRAPH_TRACER to control fgraph_ret_regs definition
>>
>> v9:
>>  - Update the commit message
>>
>> v8:
>>  - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>> ---
>>  arch/riscv/Kconfig              |  1 +
>>  arch/riscv/include/asm/ftrace.h | 21 +++++++++++++++++++++
>>  arch/riscv/kernel/mcount.S      |  7 +------
>>  3 files changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index eb7f29a412f8..108538815309 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -139,6 +139,7 @@ config RISCV
>>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>>  	select HAVE_FUNCTION_GRAPH_TRACER
>>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>>
>> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
>> index d47d87c2d7e3..740a979171e5 100644
>> --- a/arch/riscv/include/asm/ftrace.h
>> +++ b/arch/riscv/include/asm/ftrace.h
>> @@ -111,4 +111,25 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>>
>>  #endif /* CONFIG_DYNAMIC_FTRACE */
>>
>> +#ifndef __ASSEMBLY__
>> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> +struct fgraph_ret_regs {
>> +	unsigned long a1;
>> +	unsigned long a0;
>> +	unsigned long s0;
>> +	unsigned long ra;
>> +};
>> +
>> +static inline unsigned long fgraph_ret_regs_return_value(struct fgraph_ret_regs *ret_regs)
>> +{
>> +	return ret_regs->a0;
>> +}
>> +
>> +static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs *ret_regs)
>> +{
>> +	return ret_regs->s0;
>> +}
>> +#endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER */
>> +#endif
>> +
>>  #endif /* _ASM_RISCV_FTRACE_H */
>> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
>> index 30102aadc4d7..8a6e5a9e842a 100644
>> --- a/arch/riscv/kernel/mcount.S
>> +++ b/arch/riscv/kernel/mcount.S
>> @@ -65,13 +65,8 @@ ENTRY(return_to_handler)
>>   * So alternatively we check the *old* frame pointer position, that is, the
>>   * value stored in -16(s0) on entry, and the s0 on return.
>>   */
>> -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>> -	mv	t6, s0
>> -#endif
>>  	SAVE_RET_ABI_STATE
>> -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>> -	mv	a0, t6
>> -#endif
>> +	mv	a0, sp
>>  	call	ftrace_return_to_handler
>>  	mv	a2, a0
>>  	RESTORE_RET_ABI_STATE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
