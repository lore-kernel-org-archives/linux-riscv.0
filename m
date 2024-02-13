Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DD7C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4X/PxnpDeuCv8tHUiLugWte2vpKqgdzUBQUWNfRTqE=; b=YAHZi5QKZnWW3V
	cogdDlCXt+h2sAn7lI3TYlBUN84wovbVyRejl2Rh6bL0Mob4kK+pP4epahSUWnuyBNpAzH3c1GDR9
	bfRBkUMzQaJZye1PFJW2aCwQM6OUE8yslyYwjUxnxtHIZlM8qNTjSaugV6uiBOmCCOnLtHY/s9Xj/
	Lot/D3zbx1FtysF0fzMkOsXZVfnhbC33WJX3syqR1m6AxfShhCwMM1jj6QkZe4YdmBR5vVRHyJrUq
	/4tdW2NQwKSB5x+eQylq0+6Hy/3DWc6eIUF/28YAx5puEEtordcc/UAI4he+0QiXvUsqxe4UsO0V8
	LSEmBugI3mezJ74s7G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxMF-0000000AI1S-2YK8;
	Tue, 13 Feb 2024 18:18:15 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxMC-0000000AI0l-2LVw
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 18:18:14 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-78684496b10so80396985a.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 10:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707848289; x=1708453089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+/YbJCPpm0EK3T37Th2lKCSnThgdS1uZBmxaE4WYMY=;
        b=M2pAztuHabUy7TSPNxshe5hpFCKGCThN3qi81hQCSWP0V6lfSc+gJxmm7jvn6Pit/y
         z/z6L9ZCdBQxDbi5N2ry0neU9oudO7vEWRg1rxrxSILA6dQi5pF+dI+9dAzsZSxMrTek
         C3sAh5JJmBIL4a/Zkzx6ijnBAuv7e6HJq7HwEU3kIRrwqOewla08cpN6PfZRGkPCEYLC
         jPtG3NhwEKh1wAXlPprrKBHd3CS9wI1WFrUkZh8tjx9oLGZRCSiMU2POb4QbOpMUk2K+
         95ZeYSQtmIRdsC+aWEqarWVvxe2PQHArFibVV0pM8bFIEEAZ7j90NX+1EGzb5SpwNE1j
         H2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707848289; x=1708453089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+/YbJCPpm0EK3T37Th2lKCSnThgdS1uZBmxaE4WYMY=;
        b=VuEVJesj0u1qwLf6tGh6h6ZrluMTQAC+G42YfJyAkzDPCgJexEE3kuRU18RfWdPnY3
         glfk0tTy/Ik5dFQAAmZZ7HPvDe2zUQDU8tCYWMetDlFXDhKSLJqnWtpM3HTdco6PfhfN
         0QPl9wlg7LKlnkaHXrx3M+SH1qB5XfkdaqfrM6JSBc1TVmjlJ55Tz9KdleLQfGFogI1P
         kRZzLmArahvslNMQL4IEeKwglpL1U2+7n21J3iCWA2uyuZAX8J+zEd4r6Ugjnv0QFIpx
         OQwGZmP2GpHAMxDgGPCYODVt28FdPddHoeuVC71H/reqcJ49+ddjBdX7lC1yPIb0YvYw
         vuqw==
X-Forwarded-Encrypted: i=1; AJvYcCVfQ7oGz5BU69c/N15G4iMVIE78opN33yBeI4BqteAVfsMehbNjFaIKuGqpDnp8n2RqZMQHmvyYUw6DJVbOMBOoIFlTrIHyfgG7LhgU0Niu
X-Gm-Message-State: AOJu0YxNzvgK1mQBPPVV6nycpLpP2Njr9uosQ0Uao0I8LdI99O6KyXO5
	f8S+F0XdyytJu8xvnFME49C7D5W1n3RUcLTWbzKbU+fG9RN1y2PFZA9nGJUPnTQ=
X-Google-Smtp-Source: AGHT+IEED1duRB9V/QfYpNn/a6siPwseDkG/lIlUu48zJh2xglpQ9h6SRuDpAud2qU+dAsLRiyn2vw==
X-Received: by 2002:a05:620a:4609:b0:783:f683:e28b with SMTP id br9-20020a05620a460900b00783f683e28bmr511286qkb.34.1707848289467;
        Tue, 13 Feb 2024 10:18:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBqBu9ONTTKo2Oh6qupzG9ZOkDJpj3+OTM1FGXNQ5hMekCp0uEVCuMmGUmpK9EMsM166EDu187AKnOkxbeNfL/OvBEEJTja82qs4b5dDlVkw1rF0JfWGx4YyRrfyxVtEGsfXawBrepYGsSDNdUHnedCQVCjCzCIePauRUXd2ywKNq/16SlZP07xdR7gzGZ3eEZt61gcy1rbEaKPv2Q2g==
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id po3-20020a05620a384300b0078366823711sm3149882qkn.119.2024.02.13.10.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 10:18:09 -0800 (PST)
Message-ID: <7b9c1298-91fa-411e-8939-a45a6ac87307@sifive.com>
Date: Tue, 13 Feb 2024 12:18:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2 3/4] riscv: Add ISA extension parsing for Sm and
 Ss
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-4-samuel.holland@sifive.com>
 <20240213-1835b458d8cad71a76fa7322@orel>
 <1c93421f-a70b-46ba-a25c-50cde87bf64d@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <1c93421f-a70b-46ba-a25c-50cde87bf64d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_101812_806905_06A9F8C0 
X-CRM114-Status: GOOD (  22.87  )
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

On 2024-02-13 11:52 AM, Stefan O'Rear wrote:
> On Tue, Feb 13, 2024, at 10:14 AM, Andrew Jones wrote:
>> On Mon, Feb 12, 2024 at 07:37:34PM -0800, Samuel Holland wrote:
>>> Previously, all extension version numbers were ignored. However, the
>>> version number is important for these two extensions. The simplest way
>>> to implement this is to use a separate bitmap bit for each supported
>>> version, with each successive version implying all of the previous ones.
>>> This allows alternatives and riscv_has_extension_[un]likely() to work
>>> naturally.
>>>
>>> To avoid duplicate extensions in /proc/cpuinfo, the new successor_id
>>> field allows hiding all but the newest implemented version of an
>>> extension.
>>>
>>> Cc: <stable@vger.kernel.org> # v6.7+
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>>
>>> Changes in v2:
>>>  - New patch for v2
>>>
>>>  arch/riscv/include/asm/cpufeature.h |  1 +
>>>  arch/riscv/include/asm/hwcap.h      |  8 ++++++
>>>  arch/riscv/kernel/cpu.c             |  5 ++++
>>>  arch/riscv/kernel/cpufeature.c      | 42 +++++++++++++++++++++++++----
>>>  4 files changed, 51 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>>> index 0bd11862b760..ac71384e7bc4 100644
>>> --- a/arch/riscv/include/asm/cpufeature.h
>>> +++ b/arch/riscv/include/asm/cpufeature.h
>>> @@ -61,6 +61,7 @@ struct riscv_isa_ext_data {
>>>  	const char *property;
>>>  	const unsigned int *subset_ext_ids;
>>>  	const unsigned int subset_ext_size;
>>> +	const unsigned int successor_id;
>>>  };
>>>  
>>>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>>> index 5340f818746b..5b51aa1db15b 100644
>>> --- a/arch/riscv/include/asm/hwcap.h
>>> +++ b/arch/riscv/include/asm/hwcap.h
>>> @@ -80,13 +80,21 @@
>>>  #define RISCV_ISA_EXT_ZFA		71
>>>  #define RISCV_ISA_EXT_ZTSO		72
>>>  #define RISCV_ISA_EXT_ZACAS		73
>>> +#define RISCV_ISA_EXT_SM1p11		74
>>> +#define RISCV_ISA_EXT_SM1p12		75
>>> +#define RISCV_ISA_EXT_SS1p11		76
>>> +#define RISCV_ISA_EXT_SS1p12		77
>>>  
>>>  #define RISCV_ISA_EXT_MAX		128
>>>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>>>  
>>>  #ifdef CONFIG_RISCV_M_MODE
>>> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SM1p11
>>> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SM1p12
>>>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>>>  #else
>>> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SS1p11
>>> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SS1p12
>>>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
>>>  #endif
>>>  
>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>> index d11d6320fb0d..2e6b90ed0d51 100644
>>> --- a/arch/riscv/kernel/cpu.c
>>> +++ b/arch/riscv/kernel/cpu.c
>>> @@ -215,6 +215,11 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
>>>  		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>>>  			continue;
>>>  
>>> +		/* Only show the newest implemented version of an extension */
>>> +		if (riscv_isa_ext[i].successor_id != RISCV_ISA_EXT_INVALID &&
>>> +		    __riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].successor_id))
>>> +			continue;
>>
>> I'm not sure we need this. Expanding Ss1p12 to 'Ss1p11 Ss1p12' and then
>> outputting both in the ISA string doesn't seem harmful to me. Also, using

I was thinking that parsers would be confused by seeing the same extension
multiple times, but I have no problem with it if folks disagree.

>> a successor field instead of supersedes field may make this logic easy,
>> but it'll require updating old code (changing RISCV_ISA_EXT_INVALID to the
>> new version extension ID) when new versions are added. A supersedes field
>> wouldn't require old code updates and would match the profiles spec which
>> have explicit 'Ss1p12 supersedes Ss1p11.' type sentences.
> 
> Seconding - suppressing implied extensions in /proc/cpuinfo will require anything
> that parses /proc/cpuinfo to know about extension implication in order to
> generate the complete list.

Well, from an ISA string perspective (i.e. what's shown in /proc/cpuinfo), only
including the latest version _does_ give you the complete list, because Ss1p11
and Ss1p12 aren't different extensions. I'm only expanding them to different
flags inside the kernel so we can avoid storing the version number as an integer
and doing numeric comparisons at each usage site.

So /proc/cpuinfo parsers wouldn't need to know about implication, since that's a
kernel implementation detail. They just need to know how to parse the version
number from an ISA string. And I would expect them to be able to do that anyway.

There would only be backward-compatibility concerns if parsers are doing a
string match on the whole "ss1p12", which I would consider wrong to start with.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
