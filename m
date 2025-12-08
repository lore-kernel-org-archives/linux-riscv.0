Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B2FD3B7E2
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCgIt2hU+nOBS/t2XurdBRg77QBOVbThY6ZVCnUY0Nk=; b=Rpm6F2vhTdc7yp
	SGp/wDZmjFriHQwW5pVqKl3qgpYiLVQK0Y1KB2kuNZAWR5yLXk+n8wFKYTqhNGIf1OYHgX+MxEEcQ
	uRIHk1rGSz5IG5mx/Ih82dmN80c4u2XhfHJQ1mFrQnBBt3Ulm7uE8gGKke7aFRgEPrIKIqDkVg4Ul
	q/QLjMeFOkhYOZjDJcKRon6oeCSfn5tZ4curhCukY2tX0BTlAwp+2iUYng1dqCr/Dq33RpmiUAHjF
	MXS1MbdB2LpmNP+aQ+oekTwd8FwWfb8Lk5fUnO69HkJwgJ8eJWVdXQaU0Ce1TIuoxGmmYLAAXX5IN
	VKol0BG6rJMyrReKGiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeFf-0000000DJff-2jBD;
	Mon, 08 Dec 2025 16:38:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeFc-0000000DJeq-2ofI
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 16:38:18 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5D5033F323
	for <linux-riscv@lists.infradead.org>; Mon,  8 Dec 2025 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765211891;
	bh=aTNY4Xh/ROKfLe2vsQMihdbK2756ZAjBs/JjXED0kyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=XinMbN0W0YAvm8JAsNww4z+9UVFNsAazR8I3x1OFu+DYTxEezI72ZAa3EPF68QWvO
	 sSIpX4pXfjaG/U63AhWktIukVHdkgJ5NcrGzeWHSGml4wmLBvNFBPhAqfItc4oExgL
	 FpeoNPXPDXW1C2V4kJthBdX8jp65pEeN6V/RsaiBz3ighbCPeUyeax5IfzfZlroJ+p
	 PzobsejnWxB9vdMVs+CRnSnxOs2X2okgxlmSuzETR2Gk5B44s8fWELL266dkZEEgu3
	 DF3I1TXT6SP+wmz4p+AR20kjUkOux7SJ3Zw0XZl9YgWWm6BWC1Fxiv2K/1M5rlowOm
	 ap4T5Wgd5vpug7SqUBBB6hFlRdrSMH8on9gdFAwCjFrzGKN9EmFhkQVifyI5RbEtrB
	 trhXZMfdEKDzg3gHwogtIBSNRZ5tnVdNkymqzYYih+aKHupvjCPi0dYMWWWS5vlDqG
	 c6C8ZTdXM5FDv8Brqj5GFb87VyDCtrfLUPYiTDAbwCmT93XMpPmewKv8hszVwNxI3n
	 Byg/6bgTzleMzhxm0d5Ng16rsf5Gl7z4Xq2O7hXAx3WgXMQ+Ms8ifEicKVUxvrbWix
	 jt0bHex7EMrAqV5yGapHnys1T20eBf6vnmGMKeYzYOU4nmbPMeESnLSzMvVlLaQpFH
	 olBFfIvRC52DeV0GP7FNz85Y=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477a0ddd1d4so24360895e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 08:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211890; x=1765816690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTNY4Xh/ROKfLe2vsQMihdbK2756ZAjBs/JjXED0kyk=;
        b=Q+1MHj89S9xb1j5iXxi/wV4CQGqsbhzFvQm7byb/OilPV04NPtwiK8UtXlAmQeyTn3
         vjH3AnjmTaMGit9asAxs/r944Swp7GotF0MJi0+4/w1MPN+OlbGRtvqpa8jbVgnqsnex
         16ibDbooEnE7uJr7ioVOnf9aCOFA2m2fmJ1hPJMFld1tEZAFqhnnRiTAgYURf4fqQxHM
         v3ufYz+OdPp4226S/gxPqKs1pMEHoSb8olxBC1T0nBK+Un2ykGAduoMG/BfCXfgpj7hj
         HOSNgLV9RzTr/YDl2jJVcffNPf3ntmtG44SkLglrUE6poWXgOMB9gOzDQq8J+q+DjMtB
         P+iA==
X-Forwarded-Encrypted: i=1; AJvYcCURzAg6X7jIRguViQCajLor6ZYGUnFLOO2GuADVUuZLco6yYJl/dgt8IuMGFJzMwmua0/3tTS139rNVZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNiOP3kgeTcrzZGwQO/4zL9bQ/Ahv96vo8UEcVKW+l1Q6OI1zC
	FVS2m4bV5FijAz26PPWt7RmFvNB+mNDw5TYfIA9UKw2yfuBhXvC0f27xg2aAQA5SIEYy9JmpjaD
	nLbUoPTtM5MEe77IZyWcavMVWIfXGW+A5hlrC2B0+SJlULLSURG2fmOPZhSq09cFB8XNaWz4age
	NLWPon6l4T8LGd83e3rQ==
X-Gm-Gg: ASbGnctaVpgWEUtQgiqckB5ly93KBIjXQYl32llf2BeTTpqQaOFenu1Nk1ignUuLPEV
	oe++09EVGY8M8QOBpCK7In4V8NpUJTHIT9vd1Z7AOwMq4W0ygWkLBE6cHr9DY3rOvDsd8B90BL5
	Ze5ZoCFkWgjvPLYu2+l+SlQxU+BPnL/mceLSAvvOb2khPZJDGaPsp/pfQ+OJf7mAkPZBPPiJnW+
	Tp28y1v+EyNz6q5rARSYAKTf25ioR2bdahyXrDYowH4bLDugL952Jiw0b/Qt27CZ9bHL6W4i1i4
	nOX6L4hn2LwxkqdQdKuUPvGRjR9fVwZXbNYEHxHuxJQCvyr+XNinVRSGfZsTloHXHBiKPgjRN5s
	W79JCrkOWLtnVmlKcnhAidA/alm2MfuJl9tHz/7hzzpd6f4UXvOM2ci/M4YUjNUTeIAM/vjLhaZ
	A8FMQTmmk=
X-Received: by 2002:a05:600c:a48:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-47939e43adcmr74225225e9.29.1765211889680;
        Mon, 08 Dec 2025 08:38:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWjq5KbylI+YdbbKo6HpBQI4IH+OKq2snRjF/orQKP8xyyNE6QdOCUkPtdXSTe5KyQiB8V1w==
X-Received: by 2002:a05:600c:a48:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-47939e43adcmr74224985e9.29.1765211889203;
        Mon, 08 Dec 2025 08:38:09 -0800 (PST)
Received: from [192.168.103.125] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9065sm26455128f8f.8.2025.12.08.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:38:08 -0800 (PST)
Message-ID: <a18850ad-b6de-4444-9daf-a4a653f4f9ae@canonical.com>
Date: Mon, 8 Dec 2025 17:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
To: Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Hal Feng <hal.feng@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251206204540.112614-1-e@freeshell.de>
 <20251208-jogging-morally-9b787b7ab1b8@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251208-jogging-morally-9b787b7ab1b8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_083817_076976_E82DD5AD 
X-CRM114-Status: GOOD (  18.77  )
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

On 12/8/25 17:29, Conor Dooley wrote:
> On Sat, Dec 06, 2025 at 12:45:30PM -0800, E Shattow wrote:
>> Append starfive,jh7110 compatible to VisionFive 2 Lite and VisionFive 2
>> Lite eMMC in the "least compatible" end of the list. JH7110S on these
>> boards is the same tape-out as JH7110 however rated for thermal, voltage,
>> and frequency characteristics for a maximum of 1.25GHz operation.
>>
>> Link to previous discussion suggesting this change:
>> https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/
>>
>> Fixes: 900b32fd601b ("riscv: dts: starfive: Add VisionFive 2 Lite board device tree")
>> Fixes: ae264ae12442 ("riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree")
>> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> Signed-off-by: E Shattow <e@freeshell.de>
> 
> You can't do this without modifying the binding too, as this doesn't
> pass dtbs_check.
> 
> However, is this actually correct? The frequency of operation and the
> temperature range aren't a superset of what the jh7110 can do, what is
> the actual advantage of having it? If there's some software that this
> would make a difference for, please mention it in the commit message.

Appending "starfive,jh7110" would reduce the number of compatible 
strings to check in the OpenSBI platform driver.

Best regards

Heinrich

> 
> Cheers,
> Conor.
> 
>> ---
>>   .../dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts     | 2 +-
>>   .../boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts     | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
>> index e27a662d4022..7544efa95de4 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
>> @@ -9,7 +9,7 @@
>>   
>>   / {
>>   	model = "StarFive VisionFive 2 Lite eMMC";
>> -	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s";
>> +	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s", "starfive,jh7110";
>>   };
>>   
>>   &mmc0 {
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
>> index b96eea4fa7d5..b9913991a1b7 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
>> @@ -9,7 +9,7 @@
>>   
>>   / {
>>   	model = "StarFive VisionFive 2 Lite";
>> -	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";
>> +	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s", "starfive,jh7110";
>>   };
>>   
>>   &mmc0 {
>>
>> base-commit: 5e5ea7f61610239fca058011e7d4f342b34d1558
>> -- 
>> 2.50.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
