Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33299D2502D
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcNGn1+vXchUK64JVxuz39tTkGwVW6HY9H6KYMx50sk=; b=fuCS35YbBek1Zu
	jGZrIuuvaZn2+eNvE9Xi9SXJc1LM+mW/d/BQwnuULB33SPs4UH2uPyLovji6Y3MKXxtjTe6fZXFmj
	xyumICVLuWBPuFgPSedH3zlqO02qfEyLh4OW0fnksG+elJEoLnFVb6tEQPbw/TvHVT/yGEY7PAyNj
	qjnGrj0VjxJUcn9UoUZNtI7bGA4kUuvvqVluc+CBwwDksg3Ce1Bvr7+9YwCtHJLGboivAM/G3dOyY
	EwZ9bZI6WIV5eLw/UBPVZjd2EQy0HYpv7cBKQCT1PI6aRyCjoU7Qg+N0Y6H/Qupqd/8JVPJ5jbB2g
	ERGA2lJmuwJoldx3WybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1Zf-00000004Sel-0xYE;
	Sun, 11 Jan 2026 19:58:07 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1Zd-00000004SeC-1tGe
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 19:58:06 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-8ba3ffd54dbso875551985a.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jan 2026 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161484; x=1768766284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=FcSt4845aVCqL7lIE/y3mIvM51dIfBwQ4mRrPz8O9pWz3mRY6BqSaaW9M+5qglcNZR
         xA5cDHpNQ1GOH0qhYrgLSdos97DU+ck3jmwZBafsrwFTJtb3UTCN88a3R6yTvlLX+rnO
         VmL8Zpu0PtKvcM2j4InVloxz2PxKaXwypbrbR/Bcq1R5btCO+54MpV7ZaKpQFeYxEOe/
         SVsX6EI/549/9H3hC70B+ZH2joLHbttiyq3fvw8+qhoBa+8oNWQguJjz4qG271OzcENC
         Vw57hxFXN7sT0T04KZ+hsOcKAt9FjJ+gcI4iINMv2U+faJiGdU6C0bf0J164+5z+swHX
         vMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161484; x=1768766284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=uoReALzt2pIsqAuefCFPz4UL1pSTNAB7cnDHvGHLMzOe2oHSv237HpcwaDmDXYGotE
         1qkISZ9udaxqUB/4Iuwpj6h8IU3ImY5qd/x9PcDAKR9XBarNBw6a6QI8uSZcmsBCXJEK
         LNeu297bptgRC4SGfilGqPWFTh+kJPhV5T6sAXel3abmzqOxj6VQM7iwHu+sZTk5pc5e
         VeRuhnCbNczXGCiwPH2SKZBN3jddYViQxVy0ikPFIuVbE4XMR49Bg8sK4tvpRTgClgP0
         +UrYJS4oSBLD4NoC5DnXbdztAaZibE7D7Zsis261u8NkKpv9arHYXXjGq9cmXo2xobeY
         VQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCV1m0zAtSsnQZFvMAEobxmpVrmiYPj0f6jsmlRGW/u8tcnEU/z51FcdtF3MHn2m0BMOpDc9/Kvmbaa+hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOZpSxb5VPdAJXZtYr8ONoXKqeURnGn8MQcrWCKKeRuZooVoxs
	OKfwvPPQI0MYFxOQ0h0Zk95pyDn1XcFC51vFoiqvP366or/2XDeX4UYRSeBkukQfaW/gjaMDm4Y
	IPtqESkzMUw==
X-Gm-Gg: AY/fxX6rvyG/5l8rkVd0bDquv+X9wcj9YfsQg6V66dXikFubxHSeVSZprdDnPgMf49d
	3mfmAPfAnSId1tpgdGHiOmhv2eBy+r/f1NRPwWONEwL1frFTnBjUBjWtlBtEF9pdcJleN3j2k2A
	k35K0rbw+b91QIVEEAFO541xzqO11WUPvDv30it695ddr9ltH7pqVKB0bAFi9BZhWqQe3CApnKl
	OhEkS8lGc7xJCndIOw7CLva5TtxQQlT1aI3pa5/MP6dlqTWYdu9p0+khaZ5jH8yGaNGG/BLyaLG
	PShsxiy5TiTlhAL562j8ClZ5uwFW5YM1Z1D8090TggYD1NnbM9Wm+5J/OsySzNPS8twYlmUOK5B
	HX455R3RLaoA+wWZfBFTrdlJhnktPyXEXbV5A9kwup2jeJKF6lJkRSYUSIJcwmAoNqc95lqOD41
	EveEyWzQnZtNaaXTwq/UQuje2XjMHgZtP1JcD5PkFlOvUkpsZW14ESlNflRuPvydJW
X-Google-Smtp-Source: AGHT+IGdzsnyz2r9XcWFhgYQrFdZnMY+NLVEokAuWRYPrckTaify+dIl447b52d76HmKL9FYD5Hb5g==
X-Received: by 2002:a05:620a:4804:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c389416effmr2293547585a.73.1768161484118;
        Sun, 11 Jan 2026 11:58:04 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5312d3sm1325432385a.43.2026.01.11.11.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:58:03 -0800 (PST)
Message-ID: <efe5c5e8-6b29-47ff-a3cf-9449f03890e6@riscstar.com>
Date: Sun, 11 Jan 2026 13:58:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
 <20260109223839b59ca7ce@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223839b59ca7ce@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_115805_511176_FC244BE9 
X-CRM114-Status: GOOD (  17.32  )
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

On 1/9/26 4:38 PM, Alexandre Belloni wrote:
> On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - add Alex's tag
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
> 
> See my reply on v4, this is still a NAK for me, I don't believe this
> change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

Yes I have reconsidered what Alexandre was saying and now I
agree with him, I don't believe this patch is required.

					-Alex

>> ---
>>   drivers/rtc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>   	tristate "SpacemiT P1 RTC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on MFD_SPACEMIT_P1
>> -	default MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>>   	help
>>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>   	  This driver can also be built as a module, which will be called
>>
>> -- 
>> 2.52.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
