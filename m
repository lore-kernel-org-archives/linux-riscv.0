Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73102C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgUc92y2gtkXIcdYMAlAVJ+6H39heX/hOZucohneSZA=; b=EL3Ulj92oQ/wO7
	nhfN46o4Ukm5KuvukbwmIzVBorc+Iwzq8H+hyvQVH9u7ew8YSVjXPQ0ZaAkujNbCMTagMEM3NMUN1
	hIsODO7fjRn422Vn3NhtZ4odRMzofjHJsG/V7GM9zFFEGvuwAa5n8dkqIRKbi77CgORnsYGO08UFw
	PCk7bE4yqYRqYqww78KVhOoHstv+ucDfZ6f9ODMZlZafvkgi1DxU2VNSAGvMitC3Bl+ldHIbk3R76
	Gh96EoDK1P3vqDTSNU1pAIoUEBmta5vsB86CRqk0kfHYK7THF1DDCvX/Mx3tiskHqglwJrn0lWhQ8
	HfSnWl2to9I6inndD86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT0p-00000009I45-0AB8;
	Wed, 25 Jun 2025 16:30:15 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUObz-00000008XN5-0b5l
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 11:48:20 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3ddc5084952so25568465ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750852098; x=1751456898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkGM3U0bOIiDIPecsvnKSmSyDzqRmOLHZH3WgTAbQFY=;
        b=R8mU2VymnovhuEz5Uwcm1rUMlcafI/a4tQ3RP2HcrHqLBzSScsYmPoO+UI4Ra2kVPy
         AX3uw5WTh8qTWh3gpHqckfcTEt2nnW/iM2BSdDuwuCKo4UnA2ivQnqhBrd2tHfWV44kw
         m1LK6EIpRD6EMDB+FyerKd/3CFsWl8SYSqN/tICZvoXY/M5q2g4hI8HULMThc17d0/2+
         EGr0dAfaQlJsqjTaenMI8ipcG6KnO8NI4Xz0RU05t1U4DSXIQbGblrfsEFR8wDwC5tj6
         ZykpTqgypZIMOv7dkSPPgngJJIZn6+RjXi9Xx3an83CwynIfVTCPqCAghdNWtw8RPeJx
         eXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852098; x=1751456898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkGM3U0bOIiDIPecsvnKSmSyDzqRmOLHZH3WgTAbQFY=;
        b=lCTFe0BrtXZfzy2wRmk+aFmV35WDKGwLGcS8JwyqNSPGzL0zVPxl3m8Z5A7K3z62sL
         b81cBvZ6EGU4+WgkVYX0NepSlePyWxBD3o+fHDpmPRxguYnhSNqXF5wQxOsc32sajpS2
         5L5EytNvalQys8aPzXfMQjC7jU03Z2YAWE1y+vLmNqR81HBrzilLVqd7Q+iFPPR0eCuU
         y0T2UySHunRyWwJtx41YDnVGfFTUiHz2wIZeyQ8P1O4y3Ck1kmtWs2VL4mfj5Bh/qkrv
         +3zOpDnL9xCkXmGUry/vijQ22go5kecUS7uwfXkygulPXwnbKDe1A9pv9vV62Y1YQhf/
         JiYg==
X-Forwarded-Encrypted: i=1; AJvYcCXCDhtqy011VoAxcWv+3fFKvaIw1ERWHAtWyag2pYSx8VArEzd47A9+4GbD/h/03xe95Qg4BC21MA2AxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAgj1ws4ntVDMvBEygaRLMVwwr+9ftYq/0/B4OC1y41sX9420N
	yfBt36YoH/+arNv/NK0EIH91OtIqgSkxgVaT/p0rYxfxE8Krm0F3EKCP6RUyAF9EgwU=
X-Gm-Gg: ASbGncvQCqwjsk8P2a91BkyXXpvVoyaThEoquXLIlvJqbFt8bJ8qpnR0Av1h461m2x7
	MvXlCYsdbEhVRjt8s0+GZ2ukHSIb4iVho/zgLRBbHpGBbm0VI5fP5AHnhodiA1Er5/MNgViN+BM
	9HrNNQQ2HVzoB92Y6O//Hhs2mJSkfsI0qZZM1sukvYb1iDI1aMFqC441tv4cRK8WXDm6kvPifiB
	dyOTmCe359rmIYGercMCUjVQX1stgb8E6qUx67RUH4Xkb1pKlOG2Gqu98ldbKqB0BouC+06/LFS
	FpQI8dAMluyKDEu+NC9ht2YHJhiTlBqqX/oWp4CWgC2WDSvHqDjrxgvhACkBugxPbqPyJFdMG8y
	nItnr2iFaGC7gbKeDnApi87wgyg==
X-Google-Smtp-Source: AGHT+IGF27PdZyeg1EvX94pFQxAflTBu48c8D8WbPdR0KPQVaTt6mijyvklij71b/3o9/nVYsvtdaA==
X-Received: by 2002:a05:6e02:2389:b0:3dd:8663:d19e with SMTP id e9e14a558f8ab-3df32936eb5mr24619895ab.10.1750852097696;
        Wed, 25 Jun 2025 04:48:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37618a92sm45180245ab.2.2025.06.25.04.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:48:17 -0700 (PDT)
Message-ID: <5005ba79-d5a5-4d6f-ab0c-4df51407a549@riscstar.com>
Date: Wed, 25 Jun 2025 06:48:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
 <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
 <20250625082149.GO795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250625082149.GO795775@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_044819_308480_BE6E8027 
X-CRM114-Status: GOOD (  37.35  )
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

On 6/25/25 3:21 AM, Lee Jones wrote:
> On Fri, 20 Jun 2025, Alex Elder wrote:
> 
>> On 6/19/25 9:40 AM, Lee Jones wrote:
>>> On Fri, 13 Jun 2025, Alex Elder wrote:
>>>
>>>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>>>> but the driver is structured to allow support for others to be added.
>>>>
>>>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>>>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
>>>
>>> six or 12.  Please pick a format and remain consistent.
>>
>> "Numbers smaller than ten should be spelled out."
> 
> Never heard of that before Googling it.  Formal writing is odd. :)
> 
>> But I'll use 6 and 12.

. . .

>>>> +/* The name field defines the *driver* name that should bind to the device */
>>>
>>> This comment is superfluous.
>>
>> I'll delete it.
>>
>> I was expecting the driver to recognize the device, not
>> the device specifying what driver to use, but I guess
>> I'm used to the DT model.
> 
> Even in DT, the *driver* compatible is specified.
> 
>    .driver.of_match_table->compatible

I guess I just interpret that differently than you do.  I think
of the device compatible string as saying "this is what I am,"
much like a VID/PID in USB or PCI.

Then the driver's of_match table says "if a device claims to
be compatible with any of these it should be bound to me."

Meanwhile, the MFD device method has the device (cell) saying
"I should be bound to the driver having this name."

>>>> +	/* We currently have no need for a device-specific structure */
>>>
>>> Then why are we adding one?
>>
>> I don't understand, but it might be moot once I add support
>> for another (sub)device.
> 
> There are 2 rules in play here:
> 
>    - Only add what you need, when you need it
>    - MFDs must contain more than 1 device
> 
> ... and you're right.  The second rule moots the first here.

What the comment meant to say is "we have no need to kzalloc()
any special structure here" as most drivers do. Simply adding
the set of MFDs defined by the cells is enough.  The same is
true in "simple-mfd-i2c.c".

But this entire source file is gone now, so it's moot for that
reason.

. . .

>>>> +static const struct of_device_id spacemit_pmic_match[] = {
>>>> +	{
>>>> +		.compatible	= "spacemit,p1",
>>>> +		.data		= &p1_pmic_data,
>>>
>>> Ah, now I see.
>>>
>>> We do not allow one data from registration mechanism (MFD) to be piped
>>> through another (OF).  If you have to match platform data to device (you
>>> don't), then pass through identifiers and match on those in a switch()
>>> statement instead.
>>
>> I haven't done an MFD driver before and it took some time
>> to get this working.  I'll tell you what led me to it.
>>
>> I used code posted by Troy Mitchell (plus downstream) as a
>> starting point.
>>    https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/
>>
>> Krzysztof Kozlowski made this comment on Troy's DT binding:
>>    Drop compatible, regulators are not re-usable blocks.
>>
>> So my goal was to have the PMIC regulators get bound to a
>> driver without specifying a DT compatible string, and I
>> found this worked.
>>
>> You say I don't need to match platform data to device, but
>> if I did I would pass through identifiers.  Can you refer
>> me to an example of code that correctly does what I should
>> be doing instead?
> 
> git grep -A5 compatible -- drivers/mfd | grep -E "\.data = .*[A-Z]+"
> 
> Those identifiers are usually matched in a swtich() statement.

OK now I see what you you're talking about.  But these
compatible strings (and data) are for the PMIC.  I was
trying to avoid using compatible strings for the *regulators*,
based on Krzysztof's comment.  And in the process I learned
that the MFD cell needs to specify the name of a driver,
not a compatible string.

>> One other comment/question:
>>    This driver is structured as if it could support a different
>>    PMIC (in addition to P1).  Should I *not* do that, and simply
>>    make a source file hard-coded for this one PMIC?
> 
> This comes back to the "add only what you need, when you need it" rule.

Yes, and I agree with that rule.  Thanks for your clarifications.

Using simple-mfd-i2c.c is much better.  I was surprised (and I guess
pleased) to see that it was almost *identical* to what I came up with.

					-Alex
. . .

>>>> +module_init(spacemit_pmic_init);
>>>> +module_exit(spacemit_pmic_exit);
>>>
>>> Are you sure there isn't some boiler plate to do all of this?
>>>
>>> Ah ha:
>>>
>>>     module_i2c_driver()
>>
>> Thanks for Googling that for me.  And thank you very much
>> for the review.
> 
> `git grep` is my bestie! =:-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
