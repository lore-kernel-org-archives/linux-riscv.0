Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5323D1CA13
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 01:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq8BnEhQhRMyTPDC4WGAz0cNKON1EU8EkfIY8+ZYukQ=; b=qNZSvistEmRkkq
	QfFGdpwM3YfaCmcrPa+soprWqMyltlnIw8KMyV1bKrnTGSoi723FLlIJOpb5PRtS3qy1gbN7dvJ8j
	sckYDdhO9WxjzrlXGwc8zvot6StUJcVZOB49PNYmyDWlTpKk/nIfl1r/8ly+lGgvDUYEwxBAQf+ob
	xP92lVtY7qujN/J65IG9Z8ijql9LI18wpseIDiWedrlq2Iz6SwuKFY6OJpHcj/yRXkW8lp/MU14Pn
	W8o4BZa62Ci+GxGpz2P2ZC2za2eagPpfp5oLRkjfvQceIhMH0pJTG8wPZgR3t4iH8DEgAxqdjqh0Y
	ssV9MYqZJBwmfIMRdnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t889w-0000000FY0M-1997;
	Tue, 05 Nov 2024 01:15:04 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t889t-0000000FXzg-0sLs
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 01:15:02 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso45586045ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 17:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730769300; x=1731374100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmSZDJ+VfbjL+FInE4jqatZi0P6NlfcMiliJP8Vq75k=;
        b=JR1+NourdY6I+p1dr9q0/aTiUIqv6EuP57IyLZvUCWeTdEhxO7UOQokKO9SROlGkEE
         nLCCQnak2TT2WkOG9t4tLcll2S1BEvvXEChBEIFxtVWGLguVCkpxxM6Uyn39Qovk/7jR
         AVXvHZaUP41a6cAUvFqwOkpeI5yuUQ3j1GTNP2adJVHQXdzvQtHYnherf6I8nAZemCIw
         Vjjf4+OmzkhAk15Qn0keLnnI6k+TRdYcIrSHpkZ88PHTHv7D8LQPndKcYUARfXawprTY
         uJspRLbpQA3JZFV1c2lX26RgrtwA/VbZsE8uoD81Da3tSdINyjqiJYZionXjrrcravGc
         7d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730769300; x=1731374100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmSZDJ+VfbjL+FInE4jqatZi0P6NlfcMiliJP8Vq75k=;
        b=amtAoPv66f0puYS5ZWtsNgFvjn/MsyG0zX4E8nCl7S8y+fy4rYjm7UkvT5GarU7+C9
         0k4p88lbtHyN8mBC4FNZGQGc57BK/ofWZmghtXQkRdwgOv2CtFXOpo5hbEn8DypInBJq
         veT1ML4pFdQbuWjFGLVrh/Q6/e6K7MSAIABhvI2NtruED5PqfO3uCEuP0jqbjddIZVlN
         o+oFReNFsgoIV/lBoXL8/JvNK4rfaVrY02xMmbuXjEyYpXnDHIg32kmtEUxwe6zb9BAU
         YxoGNnsbOaNBr6hxBF57Tb9FEcKExy2YMdKPdIYh8zEjn7SNih4/ALF7WLtG7VRCzBK2
         kPWA==
X-Forwarded-Encrypted: i=1; AJvYcCVTFNPFxyGoBY7R7bEsbEz09yzx5SlMKGrDJD3+OQQzftso2RrRT+bNi9dzLA0rmwo/RzTbqTgVyrww/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YySmqoEtBGL7B5fW1NPHJAkSwyfoWUgGebdEm/cHMgY6cnI1WE9
	njmXpjR5oFfktxxfyCYWYUuAK88dkZNWeYQQdVm3aS4xKM+A+ozj
X-Google-Smtp-Source: AGHT+IFPlCW/2yJN4y81zz/dY+QI1q450fTiiDbolhkdNOOfXKhGNXtiKw133Yda+TQppPatOPznFA==
X-Received: by 2002:a17:903:1108:b0:20c:e262:2580 with SMTP id d9443c01a7336-210c6c3ffb6mr408256265ad.44.1730769300267;
        Mon, 04 Nov 2024 17:15:00 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2c23sm67083465ad.143.2024.11.04.17.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 17:14:59 -0800 (PST)
Message-ID: <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
Date: Tue, 5 Nov 2024 09:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_171501_283691_F0B49A2F 
X-CRM114-Status: GOOD (  12.32  )
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


On 2024/11/4 22:48, Krzysztof Kozlowski wrote:
> On 04/11/2024 14:01, Troy Mitchell wrote:
>>
>> On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>>>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>>>> and supports FIFO transmission.
>>>>>>
>>>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>>>> ---
>> Change in v2:
>>  - Change the maxItems of reg from 1 to 2 in properties
> 
> Why?
I need the address and size. In v1, I wrote it as 1, and I got the make
dt_binding_check error.
> 
>>  - Change 'i2c' to 'I2C' in the commit message.
>>  - Drop fifo-disable property
>>  - Drop alias in dts example
>>  - Move `unevaluatedProperties` after `required:` block
> 
> Rest look ok.
> 
> Best regards,
> Krzysztof
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
