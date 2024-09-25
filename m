Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BFCCF9C69
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNZiECH9Bow94/ioCkX/arQMapb4MrxCS5fhOkQt3Q0=; b=i0+cnFSFJ39swm
	T1isH7I22kAlm64Fq6pJ369wfoliNQoJ0mpRJFOphKVY74ClHdDSofHvi7rokwlvObpF0c/LJekiX
	7J+RdjS3rofh2smBzeUTtbdwrvLgX88zxhG0Xs+ZJYxAoAA+YFU5/l31HAOnC/PbUviCAUMh/q5/P
	85TLP+ZoZJIQ07bxadjP18QCoBiB2itBkQXw0dEqh5hhqfsCRMNSaorDz7ecTcWxeotwN55qH7MCM
	IxzXgAyD3q/jJdMnAsMbH/8SPmKgVxF6S30CQXrUkPRsvhktT0SnwpPeKgSEI6I+oYSDZ+yCPCcmz
	4YwjB+74dc4a+kdN+aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stFVx-00000003cHt-45a1;
	Wed, 25 Sep 2024 00:04:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stFVu-00000003cHM-3y1y
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 00:04:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20570b42f24so68041645ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 17:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727222653; x=1727827453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RC3M8sHQ9E0A6IIhCtwvcCgOMG+9mFz6x61RrgfDbGU=;
        b=tHAGgGqKqNfQYEYUZYBLIYGecNR5Hz7OnaHVSbL4Io98Yb7o86q8Iw/qen71wDcIUs
         8NlSfbI2mnU84bJAWIDcdxBOw8ZqubNJC+68Y6nfC0HTXQTwlXxiQmHHtFTsS5RuCHwx
         vxn6I0YkL+6qc+lVHO7PvjQ0vN9HRZynjhVijgaVFw1IWlAUvmEMfP08FoZstfflcn/0
         HYOxPUgFcyxhwUYeSXfMpYsgdgzEFf/IL9gGhYUJTEA2gqF1BwkeP0jBNEaoRIL7ipQs
         aD/JuaNAr7iVOapabKj4mgkvfw9g1yR5gykm9DDLnhqHUI8EQWSfXKEVja49KLyvz+4a
         VWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727222653; x=1727827453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC3M8sHQ9E0A6IIhCtwvcCgOMG+9mFz6x61RrgfDbGU=;
        b=gd6G2RTNCkAx4tPiTatfkhVrb+rdynScmvAL8eIJniKpnxJ16dOuDrqn4KUd4Qx4F8
         u8bMukjAtyJlSYT4EqbvtmFiI6s5Eq4hC26wAS2TG9Se8R9Oo7M/xrvFj5/JgAzPYl+1
         RNYDH5UNlwZSXWSWjKa+C+v/AjGxEm90NgNqp1+R8axxa9Sv0vBNe+rktXPql2XvOMmL
         nTuY61U7JaXImRxXmVeT6YeVgrOq/+cUNGvcniKogkMJRjxHDRVcKSjJ+vy1cywXay4o
         A9I+69D5Mxbkj4orQKPYcEdWelSTClmKOMA5Mw9k/KFkMdG/MyLUFrWhLbhN8wSzo2nH
         /Y/g==
X-Gm-Message-State: AOJu0YwQMzky2D3Q24DKxL3tOBLUmQgDud0AFTg/JPSTArtVl50sso1e
	BNURAJD21AzqNQZ+QVdLweKkVWTGmn/a+eO3NU2rJ77gr4nbTZhnVr10qNa9rJ4=
X-Google-Smtp-Source: AGHT+IHegFDQ/W5H2SHBmBtckB2nJ4gPJvEd3aPBpXh2KxDWAQXrycJ8kXrrMFBwkP7B7QNaCoUBTw==
X-Received: by 2002:a17:90b:11d2:b0:2d8:8fe9:b00f with SMTP id 98e67ed59e1d1-2e06ae61cefmr1101465a91.13.1727222648771;
        Tue, 24 Sep 2024 17:04:08 -0700 (PDT)
Received: from ?IPV6:2601:600:9001:ecb0::9c81? ([2601:600:9001:ecb0::9c81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16fef3sm136647a91.1.2024.09.24.17.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 17:04:08 -0700 (PDT)
Message-ID: <1f540ac0-7eaf-46a3-a2d6-b49f953c289d@rivosinc.com>
Date: Tue, 24 Sep 2024 17:04:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: Schedule SBI-0.1 for removal
To: Andrew Jones <ajones@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, schwab@suse.de
References: <20240917135308.24997-1-palmer@rivosinc.com>
 <20240917-eaaf475e51774a8953eb45cb@orel>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240917-eaaf475e51774a8953eb45cb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_170415_346754_E8C5CF06 
X-CRM114-Status: GOOD (  21.92  )
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

On 9/17/24 8:03 AM, Andrew Jones wrote:
> On Tue, Sep 17, 2024 at 06:53:08AM GMT, Palmer Dabbelt wrote:
>> We've said we're going to deprecate SBI-0.1 for a while now, but I
>> didn't find that written down anywhere.  So mark SBI-0.1 as deprecated
>> and print a timeline for that deprecation on systems that probe it.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   arch/riscv/Kconfig      | 17 +++++++++++++----
>>   arch/riscv/kernel/sbi.c |  1 +
>>   2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index f00d474e13d0..fad197d5e122 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -838,12 +838,21 @@ menu "Kernel features"
>>   
>>   source "kernel/Kconfig.hz"
>>   
>> -config RISCV_SBI_V01
>> -	bool "SBI v0.1 support"
>> +config RISCV_SBI_V01_DEPRECATED
>> +	bool "SBI v0.1 support (DEPRECATED)"
>>   	depends on RISCV_SBI
>>   	help
>> -	  This config allows kernel to use SBI v0.1 APIs. This will be
>> -	  deprecated in future once legacy M-mode software are no longer in use.
>> +	  This config allows kernel to use SBI v0.1 APIs.
>> +
>> +	  SBI v0.1 support has been deprecated and will be removed after the
>> +	  2025 LTS.
>> +
>> +	  If unsure what to do here, say N.
>> +
>> +config RISCV_SBI_V01
>> +	bool
>> +	default y
>> +	depends on RISCV_SBI_V01_DEPRECATED
> 
> I think this could be simplified to
> 
>    def_bool RISCV_SBI_V01_DEPRECATED
> 
>>   
>>   config RISCV_BOOT_SPINWAIT
>>   	bool "Spinwait booting method"
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 837bdab2601b..1209a4e53ed1 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -686,6 +686,7 @@ void __init sbi_init(void)
>>   			sbi_debug_console_available = true;
>>   		}
>>   	} else {
>> +		pr_warn("SBI-0.1 is deprecated and scheduled for removal after the 2025 LTS");
> 
> I don't think pr_warn appends a newline.
> 
>>   		__sbi_set_timer = __sbi_set_timer_v01;
>>   		__sbi_send_ipi	= __sbi_send_ipi_v01;
>>   		__sbi_rfence	= __sbi_rfence_v01;
>> -- 
>> 2.45.2
>>
> 

With Drew's comment addressed:

Reviewed-by: Atish Patra <atishp@rivosinc.com>


> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
