Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB0D2A538
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llmboLiDP3wAaeHAb6PWbNHIGtwlM9gGaNlbjZoNf5w=; b=V3BfEIu+rfhJb4
	C4zYEowi2Su/d5/RCNhU01J2Hs1/GX6dY4CF+HUdVrwkw34AJNMREhDpF0qfr1yF+hxB4F9OwkCnd
	BjK7T/gv0hzhuvKPLVqdU/KHcPFgjbX2Ll8mL+xS0GCsg5BEgHtKsFxTb9o5A9Iv+1WMEgYKA4NQk
	atXNYx0xYqKSIjGTYDLfuGZGjU78uR+nN9TBo4zz42tu5rKjcYCYouL/aRqZCSfnbAfKk0XoS/n0l
	TgQU3STHcOLYkqNIDX4Jz77TiAO8rg7hU8rI4dVjLml0SLbS0qyCVzyQreUt85PUuhqJ0ypEVU+b4
	8eJ9RdepZRC7NJuy0LEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t18AU-0000000CbAU-3bWg;
	Wed, 16 Oct 2024 17:50:42 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t18AQ-0000000CbA8-3ZFn
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 17:50:40 +0000
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-5e56759e6d7so93767eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729101037; x=1729705837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCcgXYhcr1eYAzXAtgbojySY9FznxIOauj/4HQBvgNM=;
        b=BY96tG1xiOKfHRUvzEqZnA4+u9C9yvE3AM7hVJdKt3rFugThf0SlMM2YhQ+2fXuDUk
         L5yagoPdE1W7YyqX8C9sM6P/e1ZyTMQoDmkXbLn28K9qRCLshgilaIX1+VsRgjsz0jZP
         y8J/OHup9AKBimikY4ysB3TioWEOKLdIz/c/nDBkeJ3Iav+zdgBOZcvnjbZo0oS9YsuP
         AW6n+zZOU+Ftu2ZlwtaMVqUJs8OL3Si7c/vr4YcQ9GqDf0WO5+zpmI0Y5KfNbsYU8Whp
         koalhrU9IqMswljuYDq6uw060AAsgmhfJE8USGbeWYVcXg7IajvT5ydXpi2adMS9Iqm6
         7THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729101037; x=1729705837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCcgXYhcr1eYAzXAtgbojySY9FznxIOauj/4HQBvgNM=;
        b=iLUvjQfvdXflPlqaxHViYlnM+mNUGxyhzM5FaAV+6XpD0ZIMooMQqAYRLKS2GR+lQ/
         kzQj7dvvMKfQk9UrF1/PsW2j37l4mqZ+Wtd88+7YNeM1mWVfLf6Aq92k2g8V7B/wwdSi
         DfYTjcq4pAiPSSUqTlv3j0f6gGUdn/wX2y/2qNJzsIyp2ehXPWsCwAfqdW8OVXD/TBLQ
         XbTniAipoRkoSx4sqo+8rbqwDLZSvWyqyExlC1e9+3GrDmBChTeakISTPuGyVd1KnWoy
         2CY/mm9alDVvyo8CvHWmEI7CCKHiXtSj/fC0yPBtPhfNTr2+3wKvdjrS2OKZmTDFyRrK
         T9mA==
X-Forwarded-Encrypted: i=1; AJvYcCU2hcAKr9FYf3Kr0KitZAlgVh3ft5SLSOH4EfcdBFqIKhJC6I6wa0noCwN8/k9o/kGOcHq/b7umyszDnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLSEwZNnJjAMPUgQxoDffIz9+2w/j+eLf7sVI6jQZl82MX3Xb1
	V2nQZDGVarp/ACu8O2ell1XsvVZ0Viogr4M0MBaR6xV26hxvyyrbDTiOlZ6DH7A=
X-Google-Smtp-Source: AGHT+IEf67VIalr0j/WhSRDBXq34/L7p37bnPDz/zkchcrv8dP9aBwLxPOYp06Fr1fQrz3FrmybhpA==
X-Received: by 2002:a05:6820:2212:b0:5e7:cb2e:e01c with SMTP id 006d021491bc7-5eb1a2da0f0mr11488027eaf.7.1729101036963;
        Wed, 16 Oct 2024 10:50:36 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb4edbcf06sm802586eaf.2.2024.10.16.10.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 10:50:36 -0700 (PDT)
Message-ID: <2e25597c-6278-4bc6-a0c2-3826841c2ac0@sifive.com>
Date: Wed, 16 Oct 2024 12:50:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] riscv: Allow ptrace control of the tagged
 address ABI
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-7-samuel.holland@sifive.com> <ZuOoqTfKs/7G075O@ghost>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZuOoqTfKs/7G075O@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_105038_955813_7FB2D5B6 
X-CRM114-Status: GOOD (  19.85  )
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

Hi Charlie,

On 2024-09-12 9:51 PM, Charlie Jenkins wrote:
> On Wed, Aug 28, 2024 at 06:01:28PM -0700, Samuel Holland wrote:
>> This allows a tracer to control the ABI of the tracee, as on arm64.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
> 
> Since this code is identical to the arm64 port, could it be extracted
> out into the generic ptrace.c and ifdef on either CONFIG_RISCV_ISA_SUPM
> or CONFIG_ARM64_TAGGED_ADDR_ABI by adding some generic flag like
> CONFIG_HAVE_ARCH_TAGGED_ADDR_ABI?

Yes, it could be factored out, though I don't know if it is worth the overhead
for these two trivial functions. I don't see any other code like this outside of
arch/.

Regards,
Samuel

>>
>> (no changes since v1)
>>
>>  arch/riscv/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++
>>  include/uapi/linux/elf.h   |  1 +
>>  2 files changed, 43 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
>> index 92731ff8c79a..ea67e9fb7a58 100644
>> --- a/arch/riscv/kernel/ptrace.c
>> +++ b/arch/riscv/kernel/ptrace.c
>> @@ -28,6 +28,9 @@ enum riscv_regset {
>>  #ifdef CONFIG_RISCV_ISA_V
>>  	REGSET_V,
>>  #endif
>> +#ifdef CONFIG_RISCV_ISA_SUPM
>> +	REGSET_TAGGED_ADDR_CTRL,
>> +#endif
>>  };
>>  
>>  static int riscv_gpr_get(struct task_struct *target,
>> @@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
>>  }
>>  #endif
>>  
>> +#ifdef CONFIG_RISCV_ISA_SUPM
>> +static int tagged_addr_ctrl_get(struct task_struct *target,
>> +				const struct user_regset *regset,
>> +				struct membuf to)
>> +{
>> +	long ctrl = get_tagged_addr_ctrl(target);
>> +
>> +	if (IS_ERR_VALUE(ctrl))
>> +		return ctrl;
>> +
>> +	return membuf_write(&to, &ctrl, sizeof(ctrl));
>> +}
>> +
>> +static int tagged_addr_ctrl_set(struct task_struct *target,
>> +				const struct user_regset *regset,
>> +				unsigned int pos, unsigned int count,
>> +				const void *kbuf, const void __user *ubuf)
>> +{
>> +	int ret;
>> +	long ctrl;
>> +
>> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return set_tagged_addr_ctrl(target, ctrl);
>> +}
>> +#endif
>> +
>>  static const struct user_regset riscv_user_regset[] = {
>>  	[REGSET_X] = {
>>  		.core_note_type = NT_PRSTATUS,
>> @@ -182,6 +214,16 @@ static const struct user_regset riscv_user_regset[] = {
>>  		.set = riscv_vr_set,
>>  	},
>>  #endif
>> +#ifdef CONFIG_RISCV_ISA_SUPM
>> +	[REGSET_TAGGED_ADDR_CTRL] = {
>> +		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
>> +		.n = 1,
>> +		.size = sizeof(long),
>> +		.align = sizeof(long),
>> +		.regset_get = tagged_addr_ctrl_get,
>> +		.set = tagged_addr_ctrl_set,
>> +	},
>> +#endif
>>  };
>>  
>>  static const struct user_regset_view riscv_user_native_view = {
>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>> index b54b313bcf07..9a32532d7264 100644
>> --- a/include/uapi/linux/elf.h
>> +++ b/include/uapi/linux/elf.h
>> @@ -448,6 +448,7 @@ typedef struct elf64_shdr {
>>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
>>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
>> +#define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
>>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
>> -- 
>> 2.45.1
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
