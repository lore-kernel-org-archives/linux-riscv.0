Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6560C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixy8zL3NYG0vnaFkSp6AbHJdvGAqO6eZCqNmJWrwces=; b=ibd5KAMBxKYe89
	tMQjVr6XUx12+oZwpBLoKsWKAaUS7foad91zsBAY+IDbIvBkCWk5VfoejAj91LQht3XV4IfUgj/Ks
	AYYb9wCrTneULcM1OJ37QeoTGgzMnjZPgV3CKG4RCpDSwdQO4Pkye8alWlrTdbUcqx5Pc8177WaIO
	VRYQejW5bBDilCTe2GYmpjlVbYMCYmPEpgn/sBmk0ZAxBWDvpqg47a99dL7h6ZQ3Pe6qjvR/5gALD
	Zpd5/hsN0RvvqqBt34sVoI0HmJv0r8XDmenia4qHJjzNBe/UY2Ej0flHIQCS+nO2BpiiNcUrCHCoJ
	VPK4BEwB3+98BlUGL5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzDd-0000000HFsX-40Ip;
	Tue, 09 Apr 2024 00:20:09 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzDZ-0000000HFrD-3qWp
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 00:20:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so3027322b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712622004; x=1713226804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJJm0YinR6Fz1JQTj6m9HJC7BJLubttssqp1IhI/OVY=;
        b=UU1j/SQ37xokf3ljHBHefvwSaCr+9iOpTyTJm2BlfHsif4PL01sXY3ut2E7xl5rAbm
         IegbuG1a9cnAkgmbIu5gvhPqqcqxTrjtuM1X+CzB0wiwMV8bkkCdcarhp/qncehcZmDi
         I14jmS/g4aGjzFINMQ0Xa97RN6HjxiT90nGVtWZaIyAOMn5bLA5M8YyRYB4Y8HsIhVKr
         J3DJty4AKWEPZ86w0WtNZLNH3EYOBMOiI5mApOpEO0uWGO4TE+705ytj439obw5GnYsn
         pT2dmgHYO/bzVM5RPxKgktvN1J9fN36gHsP9HUPq/1LUTU31jw9klZBwOTck91Nb/5D4
         6TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712622004; x=1713226804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJJm0YinR6Fz1JQTj6m9HJC7BJLubttssqp1IhI/OVY=;
        b=HnDzFy4QWYdgzH3iqRyXUbc++klrUg56OjXc9ebiwbXuV41tZM5Re4nEDtCbdhViiR
         M2VME3jRWiBJhN8Xj4o346GM24dtMB2y/EFX58YvnpXRZzYJtywQHGVU/gCBAEHlHsKu
         G/302i9OQCT2pql1CRWLHxtRGWlsKnh/Dp20HZrWFtn8CleZpmAwOm3nr1kzkgFdmFPP
         Fgh5OgZR5RIwoKMjZ8UDZeOg8d4IZif7LFu57AwHyotm+mRyJ2d7r2k/LAZ3o5Je5Lmi
         8DfrlhsBBJlFOm2W2YxeogzjZZe3d3tLa1+PHvZPzPe0UuM8yIPvYc4pdTEuHo7wrbyF
         ZwMA==
X-Forwarded-Encrypted: i=1; AJvYcCVQBZ4NIko5Rv3lBXM7E3n0/dlqjNBPxdggFtnb8ixZcdq1Sg+RS33/Tfegvxt5cvAQwhFIVtTBhYupv64ycTxkS9I2zcYlE+Y9UQIK6sHT
X-Gm-Message-State: AOJu0YzbdmAV+8TK3k1k7UOqSfyoJSv+UySoN9BxGDmbIKgPSKcvtboU
	XkH4dov+1vDRH7Hi6uIJVJ0G1fceAviqNxlwweEBqpXit0V0Ry437DFfslJfQ0U=
X-Google-Smtp-Source: AGHT+IHKlLChws6cu3BYTCJ7MCM6PzdBML/rgAzu6AAweXKWc1ZvRCFZaiBR3BYcpCZV7gSpWy06EQ==
X-Received: by 2002:a05:6a21:199:b0:1a7:9e84:dc51 with SMTP id le25-20020a056a21019900b001a79e84dc51mr1952924pzb.7.1712622003695;
        Mon, 08 Apr 2024 17:20:03 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::e8c1? ([2601:647:4180:9630::e8c1])
        by smtp.gmail.com with ESMTPSA id y22-20020a056a00181600b006ed0b798f1fsm5677375pfa.119.2024.04.08.17.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 17:20:02 -0700 (PDT)
Message-ID: <be088afd-923e-4aed-a786-5398e46c05f5@rivosinc.com>
Date: Mon, 8 Apr 2024 17:20:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/22] drivers/perf: riscv: Use BIT macro for shifting
 operations
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <amakhalov@vmware.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-5-atishp@rivosinc.com>
 <20240404-9a84f2090d00f6b994e1de7c@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240404-9a84f2090d00f6b994e1de7c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_172006_128471_E6863375 
X-CRM114-Status: GOOD (  15.82  )
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

On 4/4/24 04:08, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:33AM -0700, Atish Patra wrote:
>> It is a good practice to use BIT() instead of (1UL << x).
> 
> (1UL << x) isn't generally a problem. The problem is with (1 << x).
> 

Yes. That's why, the commit message said it's good to have :)
I improved the commit message to specify about 1 << x as well.

>> Replace the current usages with BIT().
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/sbi.h | 20 ++++++++++----------
>>   drivers/perf/riscv_pmu_sbi.c |  2 +-
>>   2 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index ef8311dafb91..4afa2cd01bae 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -233,20 +233,20 @@ enum sbi_pmu_ctr_type {
>>   #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>>   
>>   /* Flags defined for config matching function */
>> -#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
>> -#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
>> -#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
>> -#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
>> -#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
>> -#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
>> -#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
>> -#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
>> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
>> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
>> +#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
>> +#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
>> +#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
>> +#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
>> +#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
>> +#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
>>   
>>   /* Flags defined for counter start function */
>> -#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
>> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
>>   
>>   /* Flags defined for counter stop function */
>> -#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>> +#define SBI_PMU_STOP_FLAG_RESET BIT(0)
>>   
>>   enum sbi_ext_dbcn_fid {
>>   	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index babf1b9a4dbe..a83ae82301e3 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -386,7 +386,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>>   			cmask = 1;
>>   		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
>>   			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
>> -			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
>> +			cmask = BIT(CSR_INSTRET - CSR_CYCLE);
>>   		}
>>   	}
>>   
>> -- 
>> 2.34.1
>>
> 
> Other than the commit message,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
