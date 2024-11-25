Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F38D3B7FC
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5ciM1vZmlz0DdVffhJ8ci9EpOFOVUIMn73FY1KQsvQ=; b=sr4Qq4kjcNj0FB
	o+BegKmdgiCjF8HPVwSnxNI4X7kQZuBxQJr6qSkEPA5g2hOEC3yj1LEYLAZGU2kck6RP1uUvgzS1g
	Ff1ehyVS5g3M6wj7FJAa3gD1xkB0S6eALXJZ5KMsyLSZ4gb4G1pzogGxR4A2e+OgOKrw2Cchr5119
	BMwUxH/uCBX3g8qjRwIIfgVp8RsgFf+JFiFcZQ/1wRGtQm+QFz98Bw7Mzrd+I2Z227ACySsGRvLuV
	X2ZBrxMFUCpDUEBpiVSi3x9/WNtqypxtRigvZofXtIkm6xyxcfr23iiS93CzzWfCZU3kgLPpciCg8
	gDCtU6ON2KJyGOrAZcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWAJ-00000007iR8-3Usd;
	Mon, 25 Nov 2024 10:17:59 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVyy-00000007g0B-2lI0
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 10:06:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-21145812538so33572575ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732529176; x=1733133976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3NtaabvUmPRFjMjNpaL6YcolhVFVdItTli/OILgxGw=;
        b=fvNUXdao9w9Be7quBiUNWJgauXvwT2AOevmOBZOyNYFhI8AeCkMP9WzGAD1CkwaogQ
         KnVnFo54xDw5/yvnRdSv6AAIJ67AosteQ4vv/HAwibha/Z/lBS+m6snqnQjOsNn9ICBP
         Y0MGvPYtfPo1zbgo0iw/Aijn4kVmh6KAwJmOmdPCSArRV1+b0EPsfXrLGTL5ImCVXoII
         dR/xN/jATYwBAKkL6Cf9T47auZF/Nc05/wCuoa64jtPJSo+xuQcAbAlLdSJ3Sv0Af/ka
         0cdpNExGCFJ5ZWfCLujVyxVvi09ZTnf03wK8jwMrc4qEusSwzxWUgCqgmyGkO5hPl/EA
         xkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732529176; x=1733133976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3NtaabvUmPRFjMjNpaL6YcolhVFVdItTli/OILgxGw=;
        b=PuJo8Syy6zzNUrWkM8xsZIuP3dzmMmY8lme+gp1wJQ4hE+q8manJteBzH3C1PI4FGg
         d396h+viC1MTuQVQeHk+2qkSMH87g9rId3zErYti86ezo0lGrmD4cPCsEEmTnzgfkjmN
         pTiU28d1A2KNlw7Sk8GMxiRx0KPEaFcx67U/fB854i1XbqEPcx8IZLLbr8WtZDLlabqk
         geLrfykpRtVRp0a5AeM4gLCeAID0Ps3hIAss/sdmpkxaIcTto+V1Y+lcu/rHdyFkxj2l
         u2n15r924OPOWCRcfDjTNliyz4mxnxcxz6hg9BQSiUd5yook8c/3mTr0AH5HGrXEObyZ
         nLTA==
X-Forwarded-Encrypted: i=1; AJvYcCVglnsyDkhAJgodOxnaZG6TWa6aAZbsrviCRiQ+JJ9m0A7TqZ+bMQn+XH9H1Roug+sJ5jCmeS6j8Es5Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfGLfg9GkGMOX1oDWEoLuTDCNEcWJw4vN3ZN6zCGuYcdM9wNKe
	4DCuuNxN93y2JQtZjFw7vAPAe9z/r2P68uju/5RUSDhNvCBwiWYcyZSWIlbN7GQrWRKBz0Y=
X-Gm-Gg: ASbGncsDCmW+moldUreDXTKWnT26c/gyNHbonTx72RgX9GZbbuq0tfAPgdgba3TYJOn
	p47k/v6KO2U4ZLwhv2v2n9OOPCDsg0cQPCVwFL89WOnpQGZULY+jaqLMuJfS/mSxPGrjH1ixmc0
	TXh+85gyYoEaxRg3jcLT9meczD4HuJhOJP7/55tUkoaRiVDmtqYteEM3zduP8vFCp96n+7cex67
	ZO9PWyv/pf3BeH6+XEUl037l9erNWTknw==
X-Google-Smtp-Source: AGHT+IEkrIBkU0kksKhlyCcZZn5FcNKqYFGe1JjIsnZSYTKhWsKjEk+jkzD+EU534TMoVqDbZ2NxhQ==
X-Received: by 2002:a17:902:e741:b0:211:fb2b:7053 with SMTP id d9443c01a7336-2129fd240ffmr164761745ad.33.1732529175741;
        Mon, 25 Nov 2024 02:06:15 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc13239sm60710905ad.177.2024.11.25.02.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 02:06:15 -0800 (PST)
Message-ID: <062192c5-4482-4c83-b127-fae0942ab114@gmail.com>
Date: Mon, 25 Nov 2024 18:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <5d69e1db-2ec5-445d-9336-9345c918722a@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <5d69e1db-2ec5-445d-9336-9345c918722a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_020616_699147_20B834A3 
X-CRM114-Status: GOOD (  21.82  )
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


On 2024/11/25 16:06, Krzysztof Kozlowski wrote:
> On 25/11/2024 07:49, Troy Mitchell wrote:
>> Hi all,
>>
>> This patch implements I2C driver for the SpacemiT K1 SoC,
>> providing basic support for I2C read/write communication which
>> compatible with standard I2C bus specifications.
>>
>> In this version, the driver defaults to use fast-speed-mode and
>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>
>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>
>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>> ---
>> Change in v4:
>> - Patch #1:
>> 	- Change the default value of clock-frequency from 100000 to
>> 	  400000. This is to correspond to the driver's default value.
>> 	- Drop the minimum of clock-frequency
>> 	- Modify the description of clock-frequency
> 
> Explain why do you request re-review.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
Thank you, I accidentally forgot to add it, and it was not intentional.

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
