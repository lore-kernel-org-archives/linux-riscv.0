Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D8C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 00:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Pxdz/oxDMvRIawRT2zF5iFblO+ANokV79xU7YezBCc=; b=KlPAFh+puSOv6H
	rCcrlFuHTgidi4lZSASZ4S88hD1VZcZrfyTy1W7iC8IcZzHrYWlJ0OAn53U+MbJRQSzfyIE7IhxYI
	DPadiM6Smdb2jTffXXWch/ghSwJk4rgxEPmnaobOzaXUchlnpCnFb0IZ3RZN9yH5pvSGdPn1J7q4Y
	cHPLV2zvZgDPO5/Phic6rTMzVv5Ut4P3Sq+YvHC1aV148E88g0KgUAi/xX7+S/fCdrfGg65+fCPRp
	8+jAiRtOn3BaiCpB80Bkk4V89pCK/yVvUJvXKyGOg25UTtpbajje1xFTjJSkZdP0YfEFyonacHT9Q
	AIwDYPhP8BJ/osE1KxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtyyn-0000000HDgX-0nDM;
	Tue, 09 Apr 2024 00:04:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtyyk-0000000HDfY-01Yl
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 00:04:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e45b9a5c53so8758885ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712621084; x=1713225884; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xd+FWiZlX/lpCLCXGGzdHlU3p21YETfnnn9ljhWHF9I=;
        b=1v361lvPbxgIs1hWmCT6+m7sqQe8nUr120F8VNWZHxoX20huf6yyXBHablHxhjabzm
         iuWjMOfPQL78NyAA+FesDqhAIZWfOR8UVgcnxY9/9I2GYmly8W7wIOHUrZ43v405+Gdj
         s3uRnWAAQbwx+DJ3nNTJXqyJy8nFWoFIgu/RyfQ5cvDiLsVhBURXng1oNGPBRJ+iomRr
         VPjbR4H6QT28yiLCQbwC6vdxHK+6wFF4TJBBcscwiViHMxSRqrP2H/W1rYEM5VuNI+9/
         l+ZQafzJmtRYswPEsAGgh8ZD3H56R1I1wC1eG31mr9SqrEjhjiUYkTqdJ6ZYNfCql1au
         EoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712621084; x=1713225884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd+FWiZlX/lpCLCXGGzdHlU3p21YETfnnn9ljhWHF9I=;
        b=gMki21H57SjV7Lmiz2yUwtenv9WSHbBKdP1vENb0jmaXOFIRUl/QCLtT2yYrCvpS3D
         mDE74raXi32NJiNzbLJpGUhR2GLFHwycuoN2J9Gpu19JJ8lruXGHqmrIoKMGiuzQaUIu
         r1psRUAWeqzBCxWsiQzWSE3ICW3AML6aWM0Nnata6gHdzdzv7541nNb6U/IZsuQJ60Nq
         EtfG6dhyIRV9ARCmqT2RkzyThom2UI/QEcSJbUM6MFCGe5+8kkOUhG5tCv0p4tTPsara
         rF3GNGILYxwzQgDzX1Det+udOjBgVxiqqd1TBQfc5I4gnp1ozN7uSBjj4JyEJ4BJ3VEY
         5cQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhQvsdTkb+XBIgbNRXoSI65rWIAIpG0fNj5olkFVeEiyGR+86eSO5AFDWLgkQdcw/skgwlMy0fQYE6oyklGmDM0KPWD1YlXbAzP7xdGecE
X-Gm-Message-State: AOJu0Yy6S8arE6U6kE9fhPnnmmS/rOgZByB5/og/FmN8tVQZVqqvxaKm
	BWHWM+9v9mzX/ulgjZUoJGYPIalZJ8TP6tPPSseyYyzi7cOK2SelnUKLd9Ht8pE=
X-Google-Smtp-Source: AGHT+IG0OLdQkdZe7TuiqVfC4hYuT4+LNj+NNHp96L1eyYQkeOCssr3BNq26TdksuIIDjP/3fRra5A==
X-Received: by 2002:a17:902:d2ca:b0:1e4:1932:b0a5 with SMTP id n10-20020a170902d2ca00b001e41932b0a5mr5371923plc.68.1712621084126;
        Mon, 08 Apr 2024 17:04:44 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::e8c1? ([2601:647:4180:9630::e8c1])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902d49100b001e1071cf0bbsm4411011plg.302.2024.04.08.17.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 17:04:43 -0700 (PDT)
Message-ID: <e95f9821-e83c-4abb-941d-60ce24b9c0a3@rivosinc.com>
Date: Mon, 8 Apr 2024 17:04:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/22] drivers/perf: riscv: Read upper bits of a
 firmware counter
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <amakhalov@vmware.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-4-atishp@rivosinc.com>
 <20240404-89ee7d7f90a5fcc91809065e@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240404-89ee7d7f90a5fcc91809065e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_170446_229266_DCAB4231 
X-CRM114-Status: GOOD (  22.22  )
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

On 4/4/24 04:02, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:32AM -0700, Atish Patra wrote:
>> SBI v2.0 introduced a explicit function to read the upper 32 bits
>> for any firmware counter width that is longer than 32bits.
>> This is only applicable for RV32 where firmware counter can be
>> 64 bit.
>>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   drivers/perf/riscv_pmu_sbi.c | 25 ++++++++++++++++++++-----
>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 3e44d2fb8bf8..babf1b9a4dbe 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -57,6 +57,8 @@ asm volatile(ALTERNATIVE(						\
>>   PMU_FORMAT_ATTR(event, "config:0-47");
>>   PMU_FORMAT_ATTR(firmware, "config:63");
>>   
>> +static bool sbi_v2_available;
>> +
>>   static struct attribute *riscv_arch_formats_attr[] = {
>>   	&format_attr_event.attr,
>>   	&format_attr_firmware.attr,
>> @@ -511,19 +513,29 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>>   	struct hw_perf_event *hwc = &event->hw;
>>   	int idx = hwc->idx;
>>   	struct sbiret ret;
>> -	union sbi_pmu_ctr_info info;
>>   	u64 val = 0;
>> +	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
>>   
>>   	if (pmu_sbi_is_fw_event(event)) {
>>   		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>>   				hwc->idx, 0, 0, 0, 0, 0);
>> -		if (!ret.error)
>> -			val = ret.value;
>> +		if (ret.error)
>> +			return 0;
>> +
>> +		val = ret.value;
>> +		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
>> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
>> +					hwc->idx, 0, 0, 0, 0, 0);
>> +			if (!ret.error)
>> +				val |= ((u64)ret.value << 32);
>> +			else
>> +				WARN_ONCE(1, "Unable to read upper 32 bits of firmware counter error: %d\n",
>> +					  sbi_err_map_linux_errno(ret.error));
> 
> I don't think we should use sbi_err_map_linux_errno() in this case since
> we don't have a 1:1 mapping of SBI errors to Linux errors and we don't
> propagate the error as a Linux error. For warnings, it's better to output
> the exact SBI error.
> 

Sure. Fixed it.

>> +		}
>>   	} else {
>> -		info = pmu_ctr_list[idx];
>>   		val = riscv_pmu_ctr_read_csr(info.csr);
>>   		if (IS_ENABLED(CONFIG_32BIT))
>> -			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
>> +			val |= ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 32;
>>   	}
>>   
>>   	return val;
>> @@ -1135,6 +1147,9 @@ static int __init pmu_sbi_devinit(void)
>>   		return 0;
>>   	}
>>   
>> +	if (sbi_spec_version >= sbi_mk_version(2, 0))
>> +		sbi_v2_available = true;
>> +
>>   	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>>   				      "perf/riscv/pmu:starting",
>>   				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
