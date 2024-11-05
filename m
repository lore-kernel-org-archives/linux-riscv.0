Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634AED1CA15
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aM0t7awOUMzKCCEyye2wyG+r8Opn3dBNoYreQjaZAqg=; b=a7wplWzYiLsc9d
	R/DscPo2znZDdm48nBYO2XkzjqYVKE6mPWGm23jB27YqCgLtJr4JqdxA9X9pVzA724eBz9YWzhBWl
	mPsUn1YgaKwaxxdvLkKoO5RhrbU/nNOtLQMIicZRheW6c9T+9mRbSR0mV657zpJphQvT7U+IAXfFd
	akJZjku2Cjn67u7kl4vWCNI8lQMZxWPT8cZYocgZksK9GPjP8dw5qsaCAQ3gA7W68aXHClxXi74qq
	El83KMSasqeCTGN5ylNQRgUinY6jiLX0bW9tcowZt25R3VskdML0UD81ouyV4ShBBQPss5q/1zU8B
	jhM8HRnWOq0XVC94eB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89gp-0000000Fgy3-1vDo;
	Tue, 05 Nov 2024 02:53:07 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89ej-0000000FgjD-15kd
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 02:50:58 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-83abcfb9f37so206193339f.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 18:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730775055; x=1731379855; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ul3hkd/tGZUgdB/NcC3+w2ZkqD0S/VDimfThwQCgdHo=;
        b=eyjgk8xCI4thn7cBLbW8Vv8xyvK1DvgcecXaEccq6iYmmgOgYkligroFX4eJ/Hr9rf
         ZOowfoikJCBSrsUjJ69O5k8r9+mT0eiHB56CqvUuHDTxfngFio4dbnyIwpU9/Ua4IL6L
         9ndwNw95otpcgLayMiGucXuYXXvqfSgdq68PCUmUTU5vWLBvLvIiiORZSBR76kFFKC0b
         t6QbRUYMGqhgEMK/MLaFxJGe7AlSRH5piSqLT/2dqm7X6hA/KZ9pmvWAJdA4fZhpDLbu
         EW9xwEaGy5fgklM81PWcLvkykxdPQ8LjG+tSaLgF0vVi9V/lbbC99cNVQZX9HhIkoH5Y
         MTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730775055; x=1731379855;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul3hkd/tGZUgdB/NcC3+w2ZkqD0S/VDimfThwQCgdHo=;
        b=EqxhdWs7Eo97+l/7j/6z/RzkluQ5hAhNmXM/eMl+ATs2gs+K/DuYYHyeir6Vep1jse
         KVo2qQDJcmVRX8wixjOJ4Vwodi60jQQUp9OoN1Rym3QBQ33HUfjLhj5kz6yKa0rRDcxo
         lXwBO+ctcX4LyDMxLepTlLhVMR1Hk9t4YKbmDiYPZBEMmBeo92K7cbiqnwEkDGqmORjq
         ig99MIzKHDeINKWjYFtgqyxt1Kyzo27TFgTwc55G+YKWu5bZN24GxNc6XTly9yPk7UmH
         VZKfVn/c0ULVZl5uEL7zCwMGAxq8l3hMVWV1L9WTPNQEF1/aEVtTNgYOcYTfXZBYmA/X
         p04g==
X-Forwarded-Encrypted: i=1; AJvYcCV2N32uHi1ye3wRFunpC4+Asqkt3wy1bZBS3YO8DcEFum4zcKNhV4rmGc4A3S4cxdIdxDUMoX1pZGWHjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyLWvo7KCkHgyvt8fvtWXgTuy8h6DzZ1GebnHgRuf+hKmdnEsw
	tdNr0LlsTN/+64zrlHRCU9aDXIvnTbHMyyEAW8IDAvk757ahMCeBcG/iybHPRfw=
X-Google-Smtp-Source: AGHT+IFCnX1dntppVfh7JOMx6QPmo5cW1xeoynpjMcWrKPYAnWrp50DBwRG8U2h/uLNbyAAUxQqaZQ==
X-Received: by 2002:a05:6602:2dce:b0:835:4278:f130 with SMTP id ca18e2360f4ac-83b1c5d43acmr2984623839f.13.1730775054965;
        Mon, 04 Nov 2024 18:50:54 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04977ce7sm2193935173.119.2024.11.04.18.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 18:50:54 -0800 (PST)
Message-ID: <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
Date: Mon, 4 Nov 2024 20:50:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
 <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_185057_366541_7A84F8BC 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Troy,

On 2024-11-04 7:14 PM, Troy Mitchell wrote:
> 
> On 2024/11/4 22:48, Krzysztof Kozlowski wrote:
>> On 04/11/2024 14:01, Troy Mitchell wrote:
>>>
>>> On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
>>>> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>>>>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>>>>> and supports FIFO transmission.
>>>>>>>
>>>>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>>>>> ---
>>> Change in v2:
>>>  - Change the maxItems of reg from 1 to 2 in properties
>>
>> Why?
> I need the address and size. In v1, I wrote it as 1, and I got the make
> dt_binding_check error.

One "<address size>" element is just one item. maxItems > 1 would be for
hardware with multiple discontiguous register ranges: <address1 size1>,
<address2 size2>.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
