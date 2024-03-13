Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FDBC54E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 03:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsewmy7Mr6Ns17X88y828DkUywR8EleOeks5vws4x5Q=; b=ONRI75QiBSQy61
	27Vx789l1w6dLgbKYl193MtQ38DN2mMRMcM54R08QrXQgN6/oFYfc/BufqWVzd7N0tLIefbZrG4px
	PIVFizbEdzr7ak8DuDHaf9D40JAXdg7JoYUVniF4tOrC7aGrWogVBmGRvGdxdh+fJm9hbLANVF1FY
	Q1r7UAMdzRUoa9sfbkp+gyHUdGi9acr3MYsTBpRN/OFIL745WZgnyqAjQkUNks+Gok1WR/OU16znZ
	JmfxPXzfIKR84c+kVTecByj4Eod1vKuI7Y2OSba1Mfv7FQBlp3/8iEhUXyG5/s/UHoWOJHmIHEkma
	rRpqw87CNAm5HUVWumig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkEw6-00000008bc5-0cM7;
	Wed, 13 Mar 2024 03:05:46 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkEw2-00000008bba-0euw
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 03:05:44 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7882e94d408so498457385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 20:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710299139; x=1710903939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kbf82l7XAPAahjc9O+Lns4/hY3cNPQ6gdkwG4sxvUl4=;
        b=N0Ug4REJpsO1k7AIYZYqow+3fLUcYVHHWaJXQO0+YMy6ECgTh/1/zvkhi6BGvHloKe
         Qdw7KbvWRiLowgZbRxkV17ljPGgQb283pC01dm/6r8rnfkP3Ou0wtqlpMwwU4zX9yFVT
         RRvXlenchgLVktdMwB9TQNvP9rrZwSvvckCirpNYNXSbtA9kHOzAnB8Xq12T7xtV+xuS
         3de6r9ynP4VoiolUGPeh2QZtQKdKvaoFpw9lJl5eJquYZgu3akek3rfL+SCcVGTioR8y
         Al+OI8oJhs9n/m+Eddu/qHcQTKijrelLOy8URD6UNgkw2snaf/+xQckmqa1FLXOAcnWh
         RVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710299139; x=1710903939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbf82l7XAPAahjc9O+Lns4/hY3cNPQ6gdkwG4sxvUl4=;
        b=HnZW/RdLvXJzKFPJUmojCoFHp1S41GQouuzvqPDW1DLcHqJCKuMfqNPYYLQUoB6Abm
         N9ssxKhjqkb6tJ+r2Z2Lv8EenRuJsBh3sxQuFrLkViTfdjGMVS3uYoXNTMGr4aSX6Pet
         9VAzkCN0mzaBJ2e5ViLdnMgxuM+MsdQslTnyFEJkcXPk1yjaQkMg+VBBWDT+k8wlVKKu
         3hQajRAD7qotbL+v19VlTRyLLVEa2ManxyBfiAjRKkOafWwXbApryX6YU9R9kelCQPAj
         EftoIeGtqczPcubQ4Cl2/YcCFtAuf8xaWG6OchMi3+JJS8X/CU9Hgu2eeMuow5e6H9b8
         IerQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU8f7SJHc7G8/L9ksyn41X3w4Zju8ktJ2kXdz/43vC/p7FqBnAjLBUW1GOT6dt6Z1CNQ41qjdZKTUCkRJgEE/N5jcBWKe+8ycCUk7jWsf1
X-Gm-Message-State: AOJu0Yx3QP+1qMzt10nfusV7iXuR6SN4EkJ97ydNnMex3+Dm6Yayr3Dd
	SFi1zXCDhCnptXxABaGAUlUuF7OfQ+V3qA4aWyeSBibsaYL6yx0uSAqLeDA+lvg=
X-Google-Smtp-Source: AGHT+IGFDeMhxikLP+fXFmb/qaz+LTzsQ4Ifr2IOlIDzBr+zLzd26Ujac9cPg6+HSOdBcVSQtUKFiQ==
X-Received: by 2002:ae9:c202:0:b0:788:7299:e79a with SMTP id j2-20020ae9c202000000b007887299e79amr5796096qkg.28.1710299139369;
        Tue, 12 Mar 2024 20:05:39 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id i11-20020a05620a248b00b0078874151152sm1943779qkn.18.2024.03.12.20.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 20:05:39 -0700 (PDT)
Message-ID: <06ebe952-c872-4406-bcb9-00b0b892fb6c@sifive.com>
Date: Tue, 12 Mar 2024 22:05:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240312022030.320789-1-samuel.holland@sifive.com>
 <ZfEVNbt9AMeVJS0k@ghost>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZfEVNbt9AMeVJS0k@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_200542_266217_61DF7140 
X-CRM114-Status: GOOD (  26.70  )
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

On 2024-03-12 9:53 PM, Charlie Jenkins wrote:
> On Mon, Mar 11, 2024 at 07:19:13PM -0700, Samuel Holland wrote:
>> These macros did not initialize __kr_err, so they could fail even if
>> the access did not fault.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> Found while testing the unaligned access speed series[1]. The observed
>> behavior was that with RISCV_EFFICIENT_UNALIGNED_ACCESS=y, the
>> copy_from_kernel_nofault() in prepend_copy() failed every time when
>> filling out /proc/self/mounts, so all of the mount points were "xxx".
>>
>> I'm surprised this hasn't been seen before. For reference, I'm compiling
>> with clang 18.
>>
>> [1]: https://lore.kernel.org/linux-riscv/20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com/
>>
>>  arch/riscv/include/asm/uaccess.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index ec0cab9fbddd..72ec1d9bd3f3 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -319,7 +319,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>>  
>>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>>  do {									\
>> -	long __kr_err;							\
>> +	long __kr_err = 0;						\
>>  									\
>>  	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
>>  	if (unlikely(__kr_err))						\
>> @@ -328,7 +328,7 @@ do {									\
>>  
>>  #define __put_kernel_nofault(dst, src, type, err_label)			\
>>  do {									\
>> -	long __kr_err;							\
>> +	long __kr_err = 0;						\
>>  									\
>>  	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
>>  	if (unlikely(__kr_err))						\
>> -- 
>> 2.43.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I am not able to reproduce this using Clang 18 with
> RISCV_EFFICIENT_UNALIGNED_ACCESS=y on 6.8. However I can see how this
> could be an issue.
> 
> Going down the rabbit hold of macros here, I end up at
> arch/riscv/include/asm/asm-extable.h where the register that hold 'err'
> is written into the __ex_table section:
> 
> #define EX_DATA_REG(reg, gpr)						\
> 	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
> 
> #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
> 	__DEFINE_ASM_GPR_NUMS						\
> 	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
> 			  __stringify(EX_TYPE_UACCESS_ERR_ZERO),	\
> 			  "("						\
> 			    EX_DATA_REG(ERR, err) " | "			\
> 			    EX_DATA_REG(ZERO, zero)			\
> 			  ")")
> 
> I am wondering if setting this value to zero solves the problem by
> hiding another issue. It seems like this shouldn't need to be
> initialized to zero, however I am lost as to how this extable setup
> works so perhaps this is the proper solution.

extable works by running the handler (selected by EX_TYPE_*) if some exception
occurs while executing that instruction -- see the calls to fixup_exception() in
fault.c and traps.c. If there is no exception, then the handler does not run,
and the err register is not written by ex_handler_uaccess_err_zero().

If you look at __get_user_asm(), you can see that the err register is not
touched by the assembly code at all -- the only reference to %0 is in the
extable entry. So if the macro that declares the error variable doesn't
initialize it, nothing will.

Compare __get_user() and __put_user() which do initialize their error variable.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
