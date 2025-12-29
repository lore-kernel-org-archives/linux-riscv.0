Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8627E92FC4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXMlEyupoiImK5V+zuXoDs1KCk55SVPZmSUuR5JhCfM=; b=WN2W/nqwdakz/L
	8xR+qUVbPsnHXgWpCO/ZuxuzRr8JnOBjKK8R8bQOJplnhAvSnuiD/g9vB2hfh3O+3ZE4y2GgOLl/8
	mrUCNKgFrf0AwtVeYG5VkdFtkPYLTMBZ5E4RIz8GPeFS0BYsPMIGdKmavF5dN66VRA4L1VCXqNHSB
	7Uwty4vxmAdg+cdT0jav+A570NL71rEkAY/i3/xpWk/8v6UWETAjoHu2tEcAY+TuXW0QxpTM8Myqf
	dtU9/5Y39ecN0i7wC7OWYv0tbE8m2pjaHVAfaOLCHVWnq0q2ab1iW5vfO6gMqeODyZI+5iKAa4KCD
	yqPJcxm2PkEX8P56Qv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHZc-00000003vul-3ZeG;
	Mon, 29 Dec 2025 18:02:28 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHZa-00000003vuN-2oBb
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 18:02:27 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so71024426d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767031345; x=1767636145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=qXcMK+4vBrlEhSEbO6zGCgnMe0TuRTACIvDStLuMALi/rRWvtZpRltnhyoMKtW7t7y
         sKkTQXVzHY8N+8BRmrksca4ZJnDfDUc5EXXrDGDyypR96WOmrQxtngu7SafcshfW0+4c
         Skk5Ck7sg8eNHJf05ZTv1sPPtotlcLV3lcSSg89U2z437zSD2TU1SApciZalI/re2Vhi
         PaDu+Sm6e6V2aBQrpr6cGDLKRA4aEreGulXRfe8nh/VAz3Tm6pK/7fXLb6mJZwa+ruR7
         q0OobrRGG8xpEuQqQY9ZBMPOJZCg2JAe6JnvLjMZM+JBhIQkKBQpQmfqT3SDT4Nl0UBA
         dyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767031345; x=1767636145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=u0orbn79auVs3NwKvVxK9WHShQRM1LoxyoSjEOjgGCpdKIS65Hiw+9kbRwilJ6Rofw
         u7mGSQTlmoxMXjvXk0AbaUFqicNioM0PpJQyo8PL2iZ45EaA5V+4HkxTTkyTMDy9TK1x
         ICDlUgqsueyKEOPF2uW8+/onG/7PVDYsY0Avl2FHJI3qtNXtzkUrwd5aNLfzg5bJT25Y
         NiU8bsDnOfJAJRfpImaFYZ5GocPlqD93it3KjVwSVARz+eChPbif68rR4nJFNpcyiD9m
         X39ICXQwbs49EA1dfTeSpGKvyqJRa1F9qgV+IqzrYr1y1LevlQgIrFDZjJ+rp+LIVeGb
         RRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR6uiPoIFy6m9NUMyzJTsaL0gtzcACM4Z+VNbRnQHAv06rf4SNgDv7uH6cg0LYxyb7bC+zveyqAAfsfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEOY4VNosc90lwnG4rjaG/hJE+8WSvInImUcEBaCTWzi63rrGC
	zsd89WdZeEuFXQfhRBYZvNadY4k3vVmSyRAC8An7ZV1adbK1sbquaWYulga/g6EyTFE=
X-Gm-Gg: AY/fxX7JihC3BWKNGftB8daYVCa16KeTcgrkFZS8+12Du6xGTx5z98A0Nn56J92RLqh
	LO1jl18FeUN0NyQcswcjTrfCvwKGRMYC9oteUybkvL5L/HJjXIC3z7w3iQNGPUcYZJEwWMfFZNC
	KEzZ7PHL0lLLqbcIqCtjQxmlp9gzE9vdPL2biZNWECxWbcE7DZV7smVUVlWG4J/etVVr2wG2CXV
	Vbb5g1EI76HXo4Cbl48+YNhaYdX/KA5th0KakE+W/eTMPrws+Bah3CganP6tER2NV1nv2UecEi/
	z0SLZ10YiDO6l3ZMPWlRh9w9CByT8zGBzCV9/OoN4RimCWn1opThLY3HjhZscbPufu3+Tg2UR4l
	g9JFQpBuVuwIRimHFQGmoZmpgbrE/rBzII6MWmj6Gswx5d6sKDvEYa5FViyHEMFzcvIEe8AuCYb
	lGFquRhTkYiWzjalWE75kOBIbj+g==
X-Google-Smtp-Source: AGHT+IGXtGMT6O6A6KaQIdzPXBUgINz+WinbQ4cwEL4NneioBCpZL0bLeOv1X+9oO0ye3ANqbf5YQw==
X-Received: by 2002:a05:6214:3a83:b0:888:7d0a:18db with SMTP id 6a1803df08f44-88d83a78234mr548804566d6.48.1767031345078;
        Mon, 29 Dec 2025 10:02:25 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997ada77sm231925916d6.37.2025.12.29.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 10:02:24 -0800 (PST)
Message-ID: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
Date: Mon, 29 Dec 2025 12:02:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202512251653368b33c7e7@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_100226_724944_492BBC08 
X-CRM114-Status: GOOD (  20.47  )
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

On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
> 
> But then, can't people simply change the config? I don't feel like
> this is an improvement.

It's not an improvement for people who want to use the SpacemiT
P1 PMIC, but it's an improvement for all the other RISC-V builds
using "defconfig" that would rather have that support be modular
to avoid needlessly consuming resources.

I haven't done any testing on this but it looks fine to me.

Acked-by: Alex Elder <elder@riscstar.com>

I think it's a small change worth merging.  I don't think
doing so does any harm.  Your call or course, Alexandre.

					-Alex

>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
