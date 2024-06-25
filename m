Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19013C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yP4jmPWk2V9nRn5r36oJUgYarkL0O9x+bl9FFrI2CZI=; b=jAfY3ZoX0tnXeyPTSoVz3rtXw/
	OiTty5qU0O0Sdyv/98w+EdcFO73oKQ9q0FdCRVXPMUiFhvePscrGRTHNYk2RapV5keiyh33KVMW4H
	n2/yrXlBoG8FqpWvK5+m2nO93A80PeMnbbOnxTIW3mZ+RNLfRm+T5SPjdnRguaLMz116/2C5jSDWV
	3ZVAMn8o0JrNdN2ZWAmHYzV+HzV0bCOJ4B6SVh5hXpa+kfpYrrOcaj/+E6gO0B9I3xYKx4hbLu8/z
	H1wEVAiFJf/KpB4xnccPro8WI3j/pZtGXA5UBIuLLCbPufZBHm6JmJGyMLUfxyUjOZIcc65VU/Fct
	jRDisa1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8M5-00000003aZN-0z6S;
	Tue, 25 Jun 2024 15:45:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8M3-00000003aYb-0NCu
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 15:45:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2143649b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719330309; x=1719935109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tZOMKcRfzsOTLcaI6P+nurFJ1oFQE37Rn/GemYRQhk=;
        b=xW1PdbQtJM4EbmU3mwEWEj50QEMtH+ZbgQtW/QWhKt+TBkRQoainH7thtXEAeOhVPI
         IGn0mri7WVdzoKZw7YA8uaKt8uNo2B3uxLLQJrfg9bciqUCCMTNHQFZoAbL0n9KdsGpI
         31DGR77FE5wqdaWp7FSPM1EMAq5vqiOs9yQpmKEehsN5u/u/wDHsN7soDYObgnIISx1o
         x51xr75hL0iGGjS5xzGyX+uDCTVk0TcjfqVfNEol2FWiuR+MeSTNhbr0jExZzRh8jPiR
         ImOLdWN1xUmE+quG/41mLBosWrizWcFGGf6XT/ShV4W2KA7aSAvNbVSlTmWFB6AaUhLf
         S+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330309; x=1719935109;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tZOMKcRfzsOTLcaI6P+nurFJ1oFQE37Rn/GemYRQhk=;
        b=TC+KFkppAIj0Rex1VaZ6G1Y5rWpuXlPM8MPnvpcJwIVZMsjAJ12DKzAahFvF4uMCaw
         j5rSPXu6d9Z4I9jAN7ZFzXR6fgisKGLrR+yPBawVu/uUjb1YuzD1eDtwBa1fyFUSSw6i
         +UwCw9dEElNHV9pxP5lOznHeLOx0r9R2X5OATGbiq8hoKgX4Ztq/tgsWiU23DMKHSh2A
         IABRPZwhPfP+vq+h0sxxHiTZfrrTh9XOiKO4r3emOsMPyWjit62u2Xt8/O60zxfT+KnR
         ZSM0sEJspedJU4iyBrF76zXKY6oViOJCfKvhUwO1UrQaNkutM3ZAvAgTpeUrhVPp7vop
         v3MA==
X-Forwarded-Encrypted: i=1; AJvYcCU22/kVi5KATndm0T0HHZ+qheYu8nmtKI+kqAEfm7nlhOB1epjiF3ndQlCacZ301b64clwtgM8gx36bL9x8fnydstvIbqGD6oop6MfJWqXu
X-Gm-Message-State: AOJu0YxF3RZyRzxZe7XvlmcUDg0LZ+fIPY73CrkCDAlwLcBX41awNKjT
	3slWVgse7cwzoHOJMGR5F9S/Dx+7Lo+AGBhm7IW4OVrjjF/MLLIN6a17RGi2sIE=
X-Google-Smtp-Source: AGHT+IGSYCPwWhLTCA7tsdYi2n2YERYEuj0Bk7h22FlWi9B1mlJhhHz/QYqnR8FLA80DAw08tCIl9Q==
X-Received: by 2002:a05:6a20:b918:b0:1bc:ed85:3920 with SMTP id adf61e73a8af0-1bcee9893f4mr7574816637.52.1719330307012;
        Tue, 25 Jun 2024 08:45:07 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70677235b41sm4843347b3a.24.2024.06.25.08.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:45:06 -0700 (PDT)
Date: Tue, 25 Jun 2024 08:45:06 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2024 08:45:05 PDT (-0700)
Subject: Re: [PATCH 1/8] riscv: stacktrace: convert arch_stack_walk() to noinstr
In-Reply-To: <cb71a5e9-aafe-48af-9f16-baae407d467b@ghiti.fr>
CC: andy.chiu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, alexghiti@rivosinc.com, zong.li@sifive.com, rostedt@goodmis.org,
  mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>, nathan@kernel.org,
  ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, puranjay@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
  llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-37c10407-3c40-4045-9627-0b53f770cb4e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_084511_226251_8B3DEB45 
X-CRM114-Status: GOOD (  20.79  )
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

On Tue, 18 Jun 2024 02:55:32 PDT (-0700), alex@ghiti.fr wrote:
> Hi Andy,
>
> On 13/06/2024 09:11, Andy Chiu wrote:
>> arch_stack_walk() is called intensively in function_graph when the
>> kernel is compiled with CONFIG_TRACE_IRQFLAGS. As a result, the kernel
>> logs a lot of arch_stack_walk and its sub-functions into the ftrace
>> buffer. However, these functions should not appear on the trace log
>> because they are part of the ftrace itself. This patch references what
>> arm64 does for the smae function. So it further prevent the re-enter
>> kprobe issue, which is also possible on riscv.
>>
>> Related-to: commit 0fbcd8abf337 ("arm64: Prohibit instrumentation on arch_stack_walk()")
>> Fixes: 680341382da5 ("riscv: add CALLER_ADDRx support")
>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> ---
>>   arch/riscv/kernel/stacktrace.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> index 528ec7cc9a62..0d3f00eb0bae 100644
>> --- a/arch/riscv/kernel/stacktrace.c
>> +++ b/arch/riscv/kernel/stacktrace.c
>> @@ -156,7 +156,7 @@ unsigned long __get_wchan(struct task_struct *task)
>>   	return pc;
>>   }
>>
>> -noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>> +noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>>   		     struct task_struct *task, struct pt_regs *regs)
>>   {
>>   	walk_stackframe(task, regs, consume_entry, cookie);
>>
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> I'll try to make this go into -fixes, this is in my fixes branch at least.

Looks like there's some comments on the rest of the patch set.

Andy: aree you going to send a v2, or do you want me to just pick this 
one up onto fixes now and then handle the rest later?

>
> Thanks,
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
