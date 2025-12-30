Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05C9E92FE3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+wDu5Qyq0PuWSR4oVzMdZP8HvJ+WeupcvSvUA/Z+/E=; b=Fi+VZKbxqEaSEV
	Y+kZu0s+CodNz09VXfvjp5JJDg/LHB2zpKm+ulKTT1Myj+KswzOHcVnFFLCIlvfOkUJK2CGN+k12Q
	65vgU6gh9jHkYm2qT0Wms1Llk30/Z2Mhr/LbxjpBNtOib4G9YWkF3PqmLmrUh0ZWcQn1O45bYrOOW
	NSELM7xyp9gelNL3/TZfUwpq3hYszsE2doa7JG+bE19avH9bMtzmTk+JRYS6M1idI1X++gGed1ZNo
	r8liMJEekeOrWWwOPbOfTNhN3R/yUQ+R0JmgF/ieURuYSpDeUtPUn8RFg4CnaZjhe5Q9Ij28qOOZZ
	SxoKv/IZXVl+XQn+m0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOpF-00000004H7X-2iL7;
	Tue, 30 Dec 2025 01:47:05 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOpC-00000004H7B-2sA4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 01:47:03 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-88a379ca088so109561316d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767059221; x=1767664021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=JdR7lWKlJ0DxdImaSML/dRbMf+Iij8BrRzLN3ZQrnyxocO+4ftQf1dTT4Z1bNVfx8Y
         rmTivRrs2Dr1mEAm/Vn6mF1igytXLuZuLaswRlOpoPqTBqbliZDTUo7JmhwN8THcZyqa
         zkUOB34PLQure8sIHOsivGqVZFhU3KIXzNln9duunAt0IMT3AFZH3KjCcd99i542nqxp
         Wtl+bLKX2E55Hex+aE7i8BBt/Uh9r8F7pjaXFTw82/OEKr+tkEbDSHVE2IMdogs+MjVj
         TARhFIvXV4uFRv64HfQ9EWOX07yFmOQYNhLqF3fl6Znqip/PWLIP0JnfLtzrfjbCjFjb
         HXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767059221; x=1767664021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=eq6bMWoG1sIM/h9kJOoeRDprxS734+KyLDinnlENKpNoAzwQfvxykZopgnFPpnIHvj
         zrCior4nhznd0v4rNbcF3c9BWz81xwTOMJ3dozBEdzJr+91Acm4h5bDfSmx9R1M2g3+b
         StCtrCigRtbsrQxoE4CCDTG1h+pq9nUkYZ+wkosCkoYsLZ4Y1/IHX5MEMnLHyGm/4yRR
         tnrioqOh0uUz2MMpTfhC0dOmPZ9AeuL6ePkyXAKi6ynHKHcrXwv6XI+5SVa7VH50jCRG
         +CHKoUear+2N3jLzYxOnvB681tv6rBCRDQlXTjzQzDNTRO9nknlqjkFnhIENDvW0J5Vl
         RhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhyVtLH+mAhcKiG5PhMGrT5xFyffflbldm1fMLTuodTGa9baZjw91+TxNO9zNZ/j6gNyV5uNydmMfLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtdQWQ7VoaIa3+fJExy6BEhhCngac6QXiOdoa4Z0TFp5E4IPit
	dn2Hz3h+IsZZm1bldfeAlW8spMWUp1cQHz3X5SzaxCLBq+otVO5HPa2l+1UhVzElFVE=
X-Gm-Gg: AY/fxX6uDCzj0lvB6mN0qnUClMU7/WmC2TJfrit+QGcKpKLa0+50ztqmgdgj/4t05lr
	uaZIV8vWEiS4ED39MDLowYtqz9P0tEN7MXhMN/KtpvWV36GEUWPUQiZHPp4ZfF06xd3+/432uF8
	Ce4ooZrAE5CpjZdFTiK1LOjAR0cnasZyRM9gScOZ2u+SbpV2Fi0CCvbClvglHq9E80mpfXmaJvl
	kmoZRafIa9P3duvRHjIsT9BMLsWwT5qSQvDR6mlurer/YlKJ8BtcGhVbLpFoAscNa2/IVYlL4G/
	r3YL+ZS6xHdk9eT2wl6eElQCYgXG1I6e+SaAq2BRcBrcx3g61K4HTs7yhKm+rwWr4iZLX/vhCJG
	Vm5G7jyh4sr2oKyzSEHouoXZO3dzhdCY7XfkRW6gkgtJSF0zJUaejnbM2WlbOa2xXIKq2NvPrPt
	3XbRpyq4w/Ytq6DMBOhluCcbUrYbM7DUWLobhbZdNhPdK02o6Ce9w=
X-Google-Smtp-Source: AGHT+IH4p1A30uXu3TD99f1+30CbrJGzeImlEYTCEw3r0NYjnmHP1a52MpRfSdM/LAChoyn1EIiZLQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id 6a1803df08f44-88fcaa1aecbmr389519426d6.32.1767059221300;
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm244416516d6.38.2025.12.29.17.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Message-ID: <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
Date: Mon, 29 Dec 2025 19:46:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230005142d1bfc6f7@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_174702_744490_FF87B5AB 
X-CRM114-Status: GOOD (  27.54  )
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

On 12/29/25 6:51 PM, Alexandre Belloni wrote:
> On 29/12/2025 12:02:23-0600, Alex Elder wrote:
>> On 12/25/25 10:53 AM, Alexandre Belloni wrote:
>>> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>>>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>>>> caused it to be built-in automatically whenever the PMIC support was
>>>> set to y.
>>>>
>>>> This is not always desirable, as the RTC function is not required on
>>>> all platforms using the SpacemiT P1 PMIC.
>>>
>>> But then, can't people simply change the config? I don't feel like
>>> this is an improvement.
>>
>> It's not an improvement for people who want to use the SpacemiT
>> P1 PMIC, but it's an improvement for all the other RISC-V builds
>> using "defconfig" that would rather have that support be modular
>> to avoid needlessly consuming resources.
> 
> But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
> this doesn't have any impact on other RISC-V builds while it makes
> people using the SpacemiT P1 PMIC jump through hoops to be able to use
> the RTC as this is a very uncommon way to set default values.
> 
> My point is:
>   - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
>     have MFD_SPACEMIT_P1 set to m
>   - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
>     is built-in doesn't really hurt any SpacemiT P1 users but would be
>     the expectation of those using the RTC.

The "hurt" isn't about P1 users, it's about everyone else.

>   - those wanting to optimise because they won't use the RTC, they can
>     already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.


The purpose is to make the driver a module (not built-in)
when "defconfig" is used (without the need for any Kconfig
fragments to unselect things).


In arch/riscv/configs/defconfig, we have this:
     CONFIG_ARCH_SPACEMIT=y

In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
(added by patch 2 in this series):
     config MFD_SPACEMIT_P1
	default m if ARCH_SPACEMIT

So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
to benefit non-SpacemiT RISC-V platforms.

This patch is trying to do the same thing for the RTC,
i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
by default.

I think you understand.

					-Alex
>> I haven't done any testing on this but it looks fine to me.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>>
>> I think it's a small change worth merging.  I don't think
>> doing so does any harm.  Your call or course, Alexandre.
>>
>> 					-Alex
>>
>>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>>> ---
>>>>    drivers/rtc/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>>>    	tristate "SpacemiT P1 RTC"
>>>>    	depends on ARCH_SPACEMIT || COMPILE_TEST
>>>>    	depends on MFD_SPACEMIT_P1
>>>> -	default MFD_SPACEMIT_P1
>>>> +	default m if MFD_SPACEMIT_P1
>>>>    	help
>>>>    	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>>>    	  This driver can also be built as a module, which will be called
>>>>
>>>> -- 
>>>> 2.52.0
>>>>
>>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
