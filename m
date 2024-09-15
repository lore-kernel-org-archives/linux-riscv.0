Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F86C35FE7
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kPj9oj6A0lT63QttXr3aNJoxpLrfFxGAbo6gPm93KU8=; b=D8bOZtTYZKmnwPfrfylF2iDB41
	UbznxA1h5AOdo/HmGNJbGy+dJ2CFn/X9C5cQ3Xkt6SLTBxDe6R9BlVw91VDBND+tHgOW9m0QkwebI
	W5SRiyO1duLYMcDu2l0TzJwONw1a6/R+C8ZC1CN02+78pi6DcB5+7mnZBDseximxVdECsHjc8SMiI
	TQbGRqxu8z12TP1126BdsmSfew+mFvxzonqvfWEfvgWmhBUv/ka3PN/VDHyCaPvattb6mLYimp13q
	xJcdfcoNh3WLoTFJn/nEcrlrEVd5yt8X5h34lIN0j/WDmHhbRBnRZhQ9wxTYR/xsLtjFZhTHryWm5
	hweOFdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spjAC-00000001hHI-0iB3;
	Sun, 15 Sep 2024 06:55:16 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spjA8-00000001hGu-3hV6
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 06:55:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso3133118a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726383311; x=1726988111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=badvYfFNP1rbRc7ngSF4RqGpw3ma3l0TsCCk3hbSSxo=;
        b=k6t1OIMTgM97kAxY3spBpVFx4ZH2UpqEEPOKmIp8mbJ0kZq8A6SB2vws2gZ0olzmQL
         aOrJLCQQSTdRuOYAdcapvtzVcFQRY9na4g2pnH3ujIUfsv2Wbv4dMLgNhdBtUB9wO20n
         c+d6RnhXnbd2qsUNohBx7NRhtWC8o4ATeI1/FxsT70IzCU4w1iu4RCJ/UlrUQY6Lj40S
         vSKj/K0u2465ht0vTByulX9HvfLcVzZ5sgLpYr/IzQWcxYlQr3CHb3WB1IpT6I/gSaU2
         iluLzjVk5jzDN47nixlO/MvYCDpVkqsAiAR2WXM3fAPK1wYRHTBDaBidc4ic3yP7Uqt7
         2nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726383311; x=1726988111;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=badvYfFNP1rbRc7ngSF4RqGpw3ma3l0TsCCk3hbSSxo=;
        b=MjMW1GA2GGUFRkETotnV5Ny8xBqFDP5yTo4dCsKX0SnA4vHVwD0PjPHO3kg02Scnk1
         2SmbZdM2zur5WEHN+KJEPrPHzOzt/bQgqmL6CHAlK1hliq4o8qCgVob8xDP2b0jH4jVy
         j2wXl5AQ6SJ6+/z/zBemvxKjlUxuGu9xjTOPDZCBLUu/FD+r06+qQTX6kW5iwAXOY/Wy
         0MuZVUX1qQesIFv8Ubweirwx57oWBzRNgdeVXV1k9JsDnsBP6YQlVMTGHVQKtiI2KnUk
         +k7AJImBIRhw4heI0ju9Zu7nvNVmY1i6wPOBBkSIBd6E47b1IQi1bckdwjePTEt8HjC4
         pQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCX4j8b9yS6Yf+7AV7ehEmf4P6qtO6dUfbTd29wYWYDbh98X+rqtzP7/fXsbifzdKeNvUQOD35ZVRMia5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIUkuqh9eTO1VITiyIyti9db1iTJvh1+w7TIlOUN9buaeEo6Go
	mFq5tzpJxIKSk5jJyylbxQGtvF5PO+wtcVkCbeUq1qTiYZcdsHFTd/BlgESyn4g=
X-Google-Smtp-Source: AGHT+IETA6Z4D3JR59UejDAMZ1frEAeYjfn/w/Cvh8koJDcKyPO/lIAoIqsnGxccs4z27UspzeCEyg==
X-Received: by 2002:a17:90a:6c96:b0:2d8:eba2:ac6e with SMTP id 98e67ed59e1d1-2dba003b576mr15824006a91.29.1726383310916;
        Sat, 14 Sep 2024 23:55:10 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-c000-190a-3ae2-f6af-1d55-9e32.ipv6.o2.cz. [2a00:1028:c000:190a:3ae2:f6af:1d55:9e32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c4a253sm4768129a91.4.2024.09.14.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:55:10 -0700 (PDT)
Date: Sat, 14 Sep 2024 23:55:10 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2024 23:55:00 PDT (-0700)
Subject: Re: [PATCH v2] riscv: define ILLEGAL_POINTER_VALUE for 64bit
In-Reply-To: <ZoiUwsFIHcteBSms@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-97d5d590-cf1e-43a3-bd93-337840a0cac8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_235513_142481_A9E4684A 
X-CRM114-Status: GOOD (  15.35  )
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

On Fri, 05 Jul 2024 17:50:10 PDT (-0700), jszhang@kernel.org wrote:
> On Sat, Jul 06, 2024 at 01:02:10AM +0800, Jisheng Zhang wrote:
>> This is used in poison.h for poison pointer offset. Based on current
>> SV39, SV48 and SV57 vm layout, 0xdead000000000000 is a proper value
>> that is not mappable, this can avoid potentially turning an oops to
>> an expolit.
>
> Maybe I also need to cc stable? This is a secure hole fix patch.

Ya, and I guess it's just been broken forever?  I stuck a

Fixes: fbe934d69eb7 ("RISC-V: Build Infrastructure")

it should show up on for-next, assuming the tests pass...

>
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>
>> Since v1:
>>  - fix typo:s/SV59/SV57
>>
>>  arch/riscv/Kconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index c51b32a8ddff..c992eabbd002 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -313,6 +313,11 @@ config GENERIC_HWEIGHT
>>  config FIX_EARLYCON_MEM
>>  	def_bool MMU
>>
>> +config ILLEGAL_POINTER_VALUE
>> +	hex
>> +	default 0 if 32BIT
>> +	default 0xdead000000000000 if 64BIT
>> +
>>  config PGTABLE_LEVELS
>>  	int
>>  	default 5 if 64BIT
>> --
>> 2.43.0
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
