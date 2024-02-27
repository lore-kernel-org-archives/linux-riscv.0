Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C46C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wa/8uejYp2PvDupgy5k+mQLq9rPgMNxJy5AxNQouUbI=; b=kLNWVG9dWpeC/R
	lzSIcrUoQJv/r88IiEC7PY2NFC1ltiSzfsBCjQgLWYZ31tG9LSWr1GtQUmLtxMN0N0MDRSbI8Hevr
	E6+oK8Dcds5I1pW/3Nrblhta+OHXFhxVXOD/VMMq5IWWv/7mWJk/5krJnOJWLwj/lrqIkxFs2i/Fs
	6a8YmbLeaTR/zb2QB2Rm/DdyIvuOuidLSixAJJ3WOt474d2mBiTHGA/FZilCj9xMbSJtOkK+w8E2u
	9sZQHxrLXflnePeR5GpQf0JcPCy9VgviJHUzcbmwmDOjYxn2hRFkp2DKw5LsZaYRxy+tqi/D4lDjg
	fkh/H/vQW149139Vs8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2iX-00000006XKY-1YvV;
	Tue, 27 Feb 2024 19:02:17 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2iU-00000006XJv-30PI
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:02:16 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-36576cf5fe0so13527375ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 11:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709060533; x=1709665333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCMYN1p2M2SlsOhGzE1chvN/98rPlLh7qBG5ujmIAMc=;
        b=mj5vWBQMM4xrT81r1He42yljHbRt7gm5OJijlV7/q1u02rXx4313bOUO1d13BGaCam
         qzET3seJeQQP1iFoSqnifmuh36CuU2aEheWmjJOrFJP+fOF18nUYoHWP//ZBnjB+6tel
         HX8GhWq3kWcCgeOFFGaJWHRjDFbtCeui2jq0s0Rk4rK2MF1F1AG2Md2ESgiU4VOZdwNT
         sArGp35gDZkylyrVkTPThM+42Lma5iu42/3XY+XzGbGcYzzj7vMlP8D2EEClxcTexokY
         4syHEzJj22RwqE7Nk9pL/CmPeG1UkY4zxJVp5yyUWqLjrYMpIcqS/Fs3cmiaBxCLdIZb
         zN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709060533; x=1709665333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCMYN1p2M2SlsOhGzE1chvN/98rPlLh7qBG5ujmIAMc=;
        b=fT3XY8PR7Bq4LL3m+Ix4yOm6+5+DMkq1p4qvEY5taZMlFtiby1MzGPJmkYp7qMZIQC
         1eYgyPWqToSYfmbezyGYLh/DVo4tOa2t3pfLEomurKdtmXi1IG/dqYbkRQEz97dT+HzO
         Ok2viJJS9YG0z40z9klbNhWmvAu0Z+4ADqLZkMUyvB8ZJN6LSct0GpI0FU/CnXU1KQvE
         4koVOcXRvlVs1fhA33NLSoR+Jz3nno7Wq2CwaKOxApVSiO641EI71pikLrsxBgHNyv1C
         40kePGi1DlCK+YJhhumsDAmkxocJ38WefoRcaJSPqgtKoXK+DimfMQf5W5UdjE5/dIjs
         hDGw==
X-Forwarded-Encrypted: i=1; AJvYcCXWRJlFJnk4gZnN2qSbe1jRo37TGml0qoMvvSmWXNEvlc1Ym88IoTeqUJJ6BHb79BFwW15/5+C03+4q9NZpFqFOeKNGtfzeMk08BgflWZOP
X-Gm-Message-State: AOJu0YzwuCRm5eIN5tIJD/TM4K0Zn7BAEcFEnX8YMjs+d3124QOHe5PP
	Ql8f7KmLsXTAMojwVK3OdDdieTbw9R33/K6rpciR4ffo7aG1ik2jPGluMrE3yAg=
X-Google-Smtp-Source: AGHT+IEBkkgRMWT0jvgdj6J7NYZBL6lVbNpeKSR44IxOtrxSzlkRKO8z8Kxh72ZfSDwXXvoS+D6FIQ==
X-Received: by 2002:a05:6e02:20c7:b0:365:c8:7a15 with SMTP id 7-20020a056e0220c700b0036500c87a15mr13956481ilq.20.1709060533327;
        Tue, 27 Feb 2024 11:02:13 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id l4-20020a922804000000b00364f14861ffsm2248458ilf.76.2024.02.27.11.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 11:02:12 -0800 (PST)
Message-ID: <21e03db9-efb7-4e26-9b0d-4931afd62194@sifive.com>
Date: Tue, 27 Feb 2024 13:02:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: Allow NOMMU kernels to run in S-mode
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-5-samuel.holland@sifive.com>
 <20240227-seventh-overgrown-2fa453e8a775@wendy>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240227-seventh-overgrown-2fa453e8a775@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_110214_795630_F3C377E9 
X-CRM114-Status: GOOD (  13.49  )
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

Hi Conor,

On 2024-02-27 6:24 AM, Conor Dooley wrote:
> On Mon, Feb 26, 2024 at 04:34:49PM -0800, Samuel Holland wrote:
>> For ease of testing, it is convenient to run NOMMU kernels in supervisor
>> mode. The only required change is to offset the kernel load address,
>> since the beginning of RAM is usually reserved for M-mode firmware.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/Kconfig | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index ef53c00470d6..0dc09b2ac2f6 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -64,7 +64,7 @@ config RISCV
>>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>>  	select BUILDTIME_TABLE_SORT if MMU
>> -	select CLINT_TIMER if !MMU
>> +	select CLINT_TIMER if RISCV_M_MODE
>>  	select CLONE_BACKWARDS
>>  	select COMMON_CLK
>>  	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>> @@ -220,8 +220,12 @@ config ARCH_MMAP_RND_COMPAT_BITS_MAX
>>  
>>  # set if we run in machine mode, cleared if we run in supervisor mode
>>  config RISCV_M_MODE
>> -	bool
>> -	default !MMU
>> +	bool "Build a kernel that runs in machine mode"
>> +	depends on !MMU
>> +	default y
>> +	help
>> +	  Select this option if you want to run the kernel in M-mode,
>> +	  without the assistance of any other firmware.
>>  
>>  # set if we are running in S-mode and can use SBI calls
>>  config RISCV_SBI
>> @@ -238,8 +242,9 @@ config MMU
>>  
>>  config PAGE_OFFSET
>>  	hex
>> -	default 0xC0000000 if 32BIT && MMU
>> -	default 0x80000000 if !MMU
>> +	default 0x80000000 if !MMU && RISCV_M_MODE
>> +	default 0x80200000 if !MMU
>> +	default 0xc0000000 if 32BIT
>>  	default 0xff60000000000000 if 64BIT
> 
> The first default seen with a passing condition is the default chosen,
> right?

Yes, exactly. It's not required for the conditions to all be disjoint.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
