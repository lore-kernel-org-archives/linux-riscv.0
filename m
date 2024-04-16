Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D71C04FF8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJZPTVPSwZQiTttriNCPrY8KrfsUANgyylIommrBoyA=; b=2MR8W7lvBTdzSD
	XCmU9meTNOO/GFYZiF5pxCeo811z8JAperoHyTnORazkbGf3holP5pETdgXPQJ4zlwsOYChk2huiW
	n5p5bn5RsEo+vSbluEjU8wHTR1ObS7zbEyW65QsmtWAjSPQ5VEzofGqxfXouMZv5cSau1GlpP2guP
	NdDqeMEH7PPbplQrOVGuFxAWbcRUPmi6nmCXQB2LDiwYoMtWwGWYU72DdZe3PQdwjoymzWED0/HW8
	v8erutmoowac9m8lS47rw1IleteQrHf90uZJqxs+BHvsZ/j4/mHY2/1rQvTaoh4I+fwDZ8R2ry3ZJ
	MOCDjEJ1DH8q24Hp9RZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweE8-0000000BSe9-06E6;
	Tue, 16 Apr 2024 08:31:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweE1-0000000BScS-0vxX
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 08:31:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2a4bdef3d8eso3035676a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 01:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713256291; x=1713861091; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akzntEN6IcfsPIIN3EJ0b1QR4PPdVf92yYRa0+VTDrk=;
        b=xqFbcSIJa4j7WsFe6GPj46n4tCi+TKYLVaiXWjg0hu8va07ZFDmd2mxAQL83+xt/ZS
         wsdvq/6KlumDH/yxV+WYzphN9QEwW61W6TBf+5XdOWmJEYjb3V5gmDMi0wfR6nL5FPVX
         +P6lFTLmJX1UFb6xtr2kHX9B6NRix2MHYjVQonOcsYYaCYhviToYLyx2N2BKpH+0c1KV
         8Ojs4A68VpP491O7nUhRwtiSx6mhrVWsA6BvcjMEdsK+uPVuoQ7Av4i0mM3ANCzOJ/UP
         Orl2ilSEWoGvrCfxeV172gitWgw0BcPJ4+RhM4D1WL2kfx0tqcG37LLl4jcZmmJdmZAO
         GM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256291; x=1713861091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akzntEN6IcfsPIIN3EJ0b1QR4PPdVf92yYRa0+VTDrk=;
        b=q61FcX7aA5w32QsLJk4hHEGvR1/7p/+5PIWWpH6LrhGHRTa5E4DnhBv8+WR5P8I/R3
         xSBY8ZCdQ6ZjzSAiGAPM86raaRQaShAjAbUlLI69cHanfRYD2izbaQXwTglOgSy3t8g4
         sMEsqvxy0hgg9Nu5ojj1+I0DjWeDD1UPBXI8jo5fBGNhppiHPJs35UjSCkg/4LjPsDMS
         qcuWF49OE8j0EnFBmsmUJDMGWO6Mi622lvNq421dOIBpJ7vdrTx6JnuxBBtKnGmzoR6r
         ZX+uXsGsYj6+4tXPEnZJ7BkDoi5hTma7AEvZnMLMicJ9xrw2QVed7gS3Q5sXxGRVvh/3
         tTEA==
X-Forwarded-Encrypted: i=1; AJvYcCXPOsiQHfZPQZWJwPMOr3Va+oeNiSCU6dUWsA6qctH2QN3F0w4PAnKYuctz5SSeacdyoSIjxaejTvdXp4+IgHy+L8W+zh3rFdhlktu98F7V
X-Gm-Message-State: AOJu0YyAECTJOT+wTNDNx6qzRrmG+7er9j7VONckjJVsDH0Rn3RMeYh7
	+CG9SXMhEkEsIl1sGCGqQeBLofzBJorloVjCC3qNyY9aafIO5N2KxiONzntK9Ro=
X-Google-Smtp-Source: AGHT+IEjp4eHKvU41MXzaTBSiCq/DCxOMtVytJg0BK7QzgSTloHHj2HR6MrE7Rn4vkRt6wQgP/UbDw==
X-Received: by 2002:a17:90a:640a:b0:2a4:752f:b7b7 with SMTP id g10-20020a17090a640a00b002a4752fb7b7mr11498554pjj.26.1713256291117;
        Tue, 16 Apr 2024 01:31:31 -0700 (PDT)
Received: from [172.16.0.33] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id d24-20020a17090ab31800b002a513cc466esm10012347pjr.45.2024.04.16.01.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:31:30 -0700 (PDT)
Message-ID: <2a63d7da-91b6-496d-9966-e6c0a0aa6c6c@rivosinc.com>
Date: Tue, 16 Apr 2024 01:31:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/24] RISC-V: Use the minor version mask while
 computing sbi version
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-8-atishp@rivosinc.com>
 <20240415-e229bb33ad53ce43e3534f5a@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240415-e229bb33ad53ce43e3534f5a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_013133_407874_B8F55EE0 
X-CRM114-Status: GOOD (  20.40  )
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

On 4/15/24 06:06, Andrew Jones wrote:
> On Wed, Apr 10, 2024 at 05:07:35PM -0700, Atish Patra wrote:
>> As per the SBI specification, minor version is encoded in the
>> lower 24 bits only. Make sure that the SBI version is computed
>> with the appropriate mask.
>>
>> Currently, there is no minor version in use. Thus, it doesn't
>> change anything functionality but it is good to be compliant with
>> the specification.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/sbi.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index f31650b10899..935b082d6a6c 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
>>   static inline unsigned long sbi_mk_version(unsigned long major,
>>   					    unsigned long minor)
>>   {
>> -	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
>> -		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
>> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
>> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK));
> 
> The previous version had ((major & major_mask) << major_shift) | minor
> (parentheses around all the major bits before the OR). Now we have
> parentheses around everything, which aren't necessary, and no longer

We have to use parentheses around | to avoid compiler warnings 
(-Wparentheses)

Are you only concerned about the outer parentheses ? I have removed it.

> have them around all the major bits before the OR. We don't need the
> parentheses around the major bits, since shift has higher precedence
> than OR, but I'd probably keep them.
> 

Is this what you prefer?

return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << 
SBI_SPEC_VERSION_MAJOR_SHIFT) | (minor & SBI_SPEC_VERSION_MINOR_MASK); 
 



> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
>>   }
>>   
>>   int sbi_err_map_linux_errno(int err);
>> -- 
>> 2.34.1
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
