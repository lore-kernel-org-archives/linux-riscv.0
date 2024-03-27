Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D4C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZolRj/UqCF46uVrUSAwbeTRjMYkevIW/GvcHVG2FOds=; b=Gjqw9LcAJP23OXbUMdIcIgZKdQ
	jiAmtA/gHZrdnMzBcjhXVG5Qv3C9/HFRZJ4eBNRKghnGpgfEQ1tx2b6r2lrgl7aQwjwQLj6SD+n8z
	mF2vLNBRy0V4H9rOzW0h0VyLOJpLQuppewMx5SriAGJtWqrEi+o5W3mBUw+5PBii51En1nmNZwjey
	VyNYLBoA+s278iEYJW8peVshwyM8WobDkzvc/amT2WTeoWNldv3GN/bYqdSE7Vk6nq6WSrUXdbUiO
	X0Z4tt/0ojcwkqxH3GePVnZlg78Yg9kprwkhrrd/7M5JcQTROeYhc6Y/WPF3bYc0SdZf+uaYTb/kp
	1pwYU18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpO6u-00000007uQt-12gF;
	Wed, 27 Mar 2024 07:54:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpO6p-00000007uOw-4C6a
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 07:54:09 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29de4c33441so4690060a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711526046; x=1712130846; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e8VEDc6X3vdP7dz2M9r9pk6H8tvft/oIARZVKpUkPM=;
        b=iU818a3HxXmqZ38yBRgzSyEbE5q0UmHOrw6i0OAlcRMbwW0M68xg/nd3QUrXossDoh
         VAv9AmajcGIE0MwJ6BIk6TUOyVl/AehMvfMtD3s1O27MGXxBdxvrWqQS3md5JEaa3Aqm
         yOmYtNjMWQiUHLrowyvWJVN/5v7sd7KK8OdopirIIqcFIulnIFqctjc3mIZ5d1r4K5nY
         8gz5b0r/b6KE5aLcIUEYAl6QPIe7C5d8+mxKJE/5M+GBLilPiti0Zoh+uBYcaOxcgygt
         U4B9pBflc6EKN/lXKq75HDhrKOHTiVcAvgapEvobuSYZP3CHU1ZK1rOdY7KM9eU4Wmvt
         BoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526046; x=1712130846;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5e8VEDc6X3vdP7dz2M9r9pk6H8tvft/oIARZVKpUkPM=;
        b=k9qmwhrInvC6gZ7S8ElqTO8AqhTc5c1trW1OWSLc0oF0xTgY58yEI6bBztRv6wZPBm
         4LU/DVnOPoRL2FgAR2qbiicEPDfFXJrgxJDSDYvLFgOvrTel+xGoMUuoDgQUOIxFHslu
         gpOYWcmo/DuUAGTrJBDL1DAWtuuDTHH2aa9K8tPh90Nbt807Ea69svW+yIrWdnBhQUD8
         7qv5j0x3NsVV4XXZibREB8yB1acmMkTC8XN9yeZ3tqqGTjp8qEuuVNG1N00lljiMX2Dz
         AT8A66eyatbUWND97ZgqE7aMkSl2dYibAipKkMtUw6AxOv61ObJfpIimbGQ5jZ/SGWT/
         7Bpg==
X-Forwarded-Encrypted: i=1; AJvYcCXVCsroM5SS/P2ZqBnLwj3Sa9KvEJumZiaSKn/ccxp+Nz1jIwgEeYpTx+Di0teqK+jFLSDjbZCLr3HGVLGL4WSBjkwSHt2AsRDU593xx8Sx
X-Gm-Message-State: AOJu0Yx8XwucBMtoVRfBlHFoASK7PrHqVcA3TnWiwWLXaYTW8eEF13tu
	DTPNJ3Hvuvf97ryzkKFB4ped+8UHewRHk1DMnSqkmdfXisATt2BE
X-Google-Smtp-Source: AGHT+IEnNz21hCUFzcc3BDrCXEP56Iio2L0jyNpy2CcYiYy/MtCouQUyfmpbI/NAqQ1TI46wKu7kCw==
X-Received: by 2002:a17:90a:f697:b0:2a0:4835:972 with SMTP id cl23-20020a17090af69700b002a048350972mr400982pjb.4.1711526045593;
        Wed, 27 Mar 2024 00:54:05 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id si13-20020a17090b528d00b0029fe0b8859fsm2531873pjb.1.2024.03.27.00.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 00:54:05 -0700 (PDT)
Subject: Re: [PATCH 1/4] riscv: Fix TASK_SIZE on 64-bit NOMMU
To: Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-2-samuel.holland@sifive.com>
 <ZgPE5e7FzB5H4MnK@xhacker>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <668ad9cf-08bf-92de-b70a-af36defda6e0@gmail.com>
Date: Wed, 27 Mar 2024 00:54:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZgPE5e7FzB5H4MnK@xhacker>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_005408_106265_9F6B79C9 
X-CRM114-Status: GOOD (  18.04  )
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

On 3/27/24 12:04 AM, Jisheng Zhang wrote:
> On Mon, Feb 26, 2024 at 04:34:46PM -0800, Samuel Holland wrote:
>> On NOMMU, userspace memory can come from anywhere in physical RAM. The
>> current definition of TASK_SIZE is wrong if any RAM exists above 4G,
>> causing spurious failures in the userspace access routines.
>>
>> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
>> Fixes: c3f896dcf1e4 ("mm: switch the test_vmalloc module to use __vmalloc_node")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 

Reviewed-by: Bo Gan <ganboing@gmail.com>

Thanks for this patch! I'm doing something similar locally and it fixes the
linux nommu + musl libc build on my JH7110 S7 core.

Bo

>> ---
>>
>>   arch/riscv/include/asm/pgtable.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 0c94260b5d0c..a564a39e5676 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -882,7 +882,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>   #define PAGE_SHARED		__pgprot(0)
>>   #define PAGE_KERNEL		__pgprot(0)
>>   #define swapper_pg_dir		NULL
>> -#define TASK_SIZE		0xffffffffUL
>> +#define TASK_SIZE		_AC(-1, UL)
>>   #define VMALLOC_START		_AC(0, UL)
>>   #define VMALLOC_END		TASK_SIZE
>>   
>> -- 
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
