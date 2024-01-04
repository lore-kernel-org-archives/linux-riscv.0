Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A88C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbGRacNsK4lztabLgKy/Y61+jxdqohA/xzNSEMY2imY=; b=jAx77BSl0ONQ1c
	oFLzlygw90sKUNReYdnPIdas+bY0QN/+75144Ew8DHYvf1y20lTdMyXuOBXnzdnLvzuzZZgdVJOfm
	dLvVonQlcyTqVdAKe07kZLc6r5SgxPujcXIWcCs4hqayB9sUVfsoSbiSThNOPMgBhM/VewnpsYs6W
	+Cg4zWIgeMTCIMprSI04tycpB31dki+IiHLwSBcN3AHKMFG89rwqmhOc43nLSnzs4aeMcX6fkvgAs
	GVe4KxaU1/3cq31ibsJYf/hHexSAec1zfQZDO0FuGy8wdj8n6uqGO/0TGcFx5PSULwxTIZGrk03aj
	IXX7Oka4vnkJgPoK/pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPyE-00EYiE-2m;
	Thu, 04 Jan 2024 15:49:22 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPyB-00EYgs-2g
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:49:21 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so24682239f.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704383358; x=1704988158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TIDLSdpMStFIDjtZ3v/tdAZRRwjQGD+NRWYb5ITqWs=;
        b=NtndcYudMY2j1Pcdgzw5cgHxXfxiqPwLy8UXezhMLSAdl7oNdXyKMyZWZ6kr87vABw
         58vPkehOjTAkWhCE0+TfiLPPrGcE59XdkuqTU/1bhBobVNFYuFrCZcE25tHJ7WYs4wjY
         0yfPo8vrVDHeidRrZa3dsd4IbHh/DwZYdw22bIxM9FAf3smUJhtXfKlDbYwxlm5pBW3o
         tkkFAKyNiQbVyqZiDYYt9DIsp4cY4ltBdixb2JB4zagXqtjNfr2TO7ELf7aNzBo/Jp3l
         YfV/bmyZ74q7feGq9+3SO4tTkzm18HITgM/Pk0nPVfQPXRYuvXqh2ATdpOHlQ42HZIjP
         bKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383358; x=1704988158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TIDLSdpMStFIDjtZ3v/tdAZRRwjQGD+NRWYb5ITqWs=;
        b=iM1JZjTA+2S/f1y36Vky6VuNR9m0T5X4pRBcJqnrjYVird296h7QpuKOdrBEEuXk4W
         0Yy4bx4Xx/qLN7zcwVz8ThQiqmdnrC9FzX+NHRZ9iC6AsrrEZxXCiL3UsN3oSXD22Wng
         acO6QbBtnIyrWsOd6pQ8FdgZHWAH2fRAzqdNNcsBbpmOSoGRGFfjC3hfXuEQeBSJ85Yc
         shK695wzj2dSHcpwsGzwmWW5gRr0MtEIxZKvsIhaqJVaE3JzUtOru8UxVvFfpsSmHvBx
         SPfGWqacpocT70ZyuG7QBcBE1IchdG+TVsqaMPZSbjK5TLjQhmyRr8so4ZolIKLRGbp2
         Co6g==
X-Gm-Message-State: AOJu0YzZ2FFOT5SIoE+YCb0RYuvoFDHAiAUWrP57EVjfcp9irp9opmpL
	u0RgUg7w+mkzpDRoj87HgX+Pkqs0DfrwMA==
X-Google-Smtp-Source: AGHT+IGl23oaNLXkpTgQvFzjqjcPmDls8qUwG0Ek6OVfKuEbJznQZTa3hgKoIBfrgeoXH1vqf0zj0A==
X-Received: by 2002:a6b:e915:0:b0:7ba:85e4:f8de with SMTP id u21-20020a6be915000000b007ba85e4f8demr732625iof.42.1704383358130;
        Thu, 04 Jan 2024 07:49:18 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id ep24-20020a0566384e1800b0046696ea033dsm7981361jab.146.2024.01.04.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:49:17 -0800 (PST)
Message-ID: <8341e264-53be-4821-ad9a-145e154aeec3@sifive.com>
Date: Thu, 4 Jan 2024 09:49:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] riscv: mm: Make asid_bits a local variable
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-11-samuel.holland@sifive.com>
 <ZZV2hKLKtqjhEdvY@xhacker>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZZV2hKLKtqjhEdvY@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_074919_878024_0C6FAF2B 
X-CRM114-Status: GOOD (  14.00  )
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

On 2024-01-03 9:00 AM, Jisheng Zhang wrote:
> On Tue, Jan 02, 2024 at 02:00:47PM -0800, Samuel Holland wrote:
>> This variable is only used inside asids_init().
> 
> This is due to patch9, so can be folded into patch9.

I'm not sure what you mean here. Patch 9 does not touch any references to the
asid_bits variable, though it does touch adjacent lines.

>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> (no changes since v1)
>>
>>  arch/riscv/mm/context.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
>> index b5170ac1b742..43a8bc2d5af4 100644
>> --- a/arch/riscv/mm/context.c
>> +++ b/arch/riscv/mm/context.c
>> @@ -20,7 +20,6 @@
>>  
>>  DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>>  
>> -static unsigned long asid_bits;
>>  static unsigned long num_asids;
>>  
>>  static atomic_long_t current_version;
>> @@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
>>  
>>  static int __init asids_init(void)
>>  {
>> -	unsigned long old;
>> +	unsigned long asid_bits, old;
>>  
>>  	/* Figure-out number of ASID bits in HW */
>>  	old = csr_read(CSR_SATP);
>> -- 
>> 2.42.0
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
