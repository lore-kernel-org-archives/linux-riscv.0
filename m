Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94AEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAWL5zSCbDq7srJ4591kTFsYq/9xu8AVeJURNoHVzNE=; b=ayBPo/9pues5hg
	4G44gQ+JPGRhqiFOza3aO64bqOotkJ2i7nkh+LAK29lFTTF52RQA65iO563cc6D6+il7CchIlgYZx
	gdluh0FCSUxKaf6Os8sesl0OuZb5PEuBKGYzp12a4fFLymyEnNJdSnAri+2iH/zYoHzzB+6a1CiGT
	n8sKPUJURUdgaIa/9AKF+EFvTKbi6JZZY3pT4hie9/4anBl5OGlkXaB4UlpsB3tWE3vbA8ReBfK2U
	4Yrojwc/G2Eyzixm7XB1c67+Fk89eKaY/YKk/XINowTi1BqFU1PMYYxYAOKAdXG6d82qkPX9ebdkF
	gqcXL3qDYDn3tXQnYd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XJl-00E5Wa-2C;
	Mon, 13 Nov 2023 13:49:33 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XJi-00E5WB-0u
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:49:32 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d9abc069c8bso4170404276.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699883368; x=1700488168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYpuCEau1tKn7+UB1fO/FAD7Mu4SsuLXPkxhTi6wqWY=;
        b=Pt5lxMEOha/BpkVS+i3C/7UXqc7F4/5ZiVwkO4fECGGK/lMfrTq8gzdMk21ybkCz5b
         nBdKdpagKUqv+wd43Vx8dsVOs8rNu0JjAzErCn+V2D5JO5632XrT6gDvsJXUt0cWq2zR
         LWSJSLwbO/frCXRfvCfvCNgJv6tVTA0rUJJ63W2LVU6M/Mym/UbCBc4tXJ6GS+CWoJGD
         XqmVGJLdw8rNwxlATakkOseTi/BlFmx2tLogHVUOrdTyVH8sVnhCEyf2X9fvW2+Sx36r
         CUcu7qEfIJbqrwBPWVPsiEaLtzSopFLqSo1TEPY5nRK4KJIqFRJwx6ronj3xCeC9PlXT
         ncyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883368; x=1700488168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYpuCEau1tKn7+UB1fO/FAD7Mu4SsuLXPkxhTi6wqWY=;
        b=ZJnVThpDQiF6hNqcgm61vCShkTPlee1MERs2K5t6TOt+gBXKKTvT9teQnFSuFePg08
         hzc/v97oul0UaiPLgXi7qbiBWuUNjFtLLEvhYxKDtDgHlL45/LTAsbrgowB9Zj3WynGu
         UGBzPUolESlsuiGwoqibTvpEJD3/ntSNfBQixmQbWunXocF097y6ZIsW111wEyN3ocl7
         MfXvCusyH5YcMILPHVy1Kk6OEU3pVQBcW08m6nY01yfb9aHMM1tmCa8AfBqoCCj889ws
         UcOslcFpE9XDvZITtrg2h/lgjwexCRpK1KhCvgZ0A/3yY2RCT/3PYvH+mQbHbds7paMd
         V/MQ==
X-Gm-Message-State: AOJu0Yz7z9qHL1ucUZrEvtt+d1ieHxzQtRu5Vg4+b9zHccWw2vsYLVfW
	IqtQs6zdX5dHeGdAUaiwR/+hGw==
X-Google-Smtp-Source: AGHT+IHZ/t0JIdIrzY/Nm2LAWZjGdMgD8dn4JMNbHzzhWh5JSt4geynVCnSMFpNdMwKJepJUA1oVbg==
X-Received: by 2002:a25:1e83:0:b0:da0:cb34:1644 with SMTP id e125-20020a251e83000000b00da0cb341644mr3741569ybe.21.1699883368209;
        Mon, 13 Nov 2023 05:49:28 -0800 (PST)
Received: from [172.25.81.170] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id z8-20020a0cfec8000000b00677a12f11bcsm2052439qvs.24.2023.11.13.05.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 05:49:27 -0800 (PST)
Message-ID: <40f003c9-a94b-4ded-b35b-be4985aba3a2@sifive.com>
Date: Mon, 13 Nov 2023 08:49:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
 <58a99001-8260-4970-9fc7-25fe81e557a5@sifive.com> <ZVIejw2O6on8QMYy@xhacker>
 <20231113-mama-underarm-a8bbf0c2a1f1@squawk>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231113-mama-underarm-a8bbf0c2a1f1@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_054930_388305_1DD76688 
X-CRM114-Status: GOOD (  21.39  )
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

On 2023-11-13 7:29 AM, Conor Dooley wrote:
> On Mon, Nov 13, 2023 at 09:03:11PM +0800, Jisheng Zhang wrote:
>> On Sun, Nov 12, 2023 at 08:51:20PM -0500, Samuel Holland wrote:
>>> On 2023-11-12 6:57 PM, Jisheng Zhang wrote:
>>>> Add the reset device tree node to cv1800b SoC reusing the
>>>           ^^^^^
>>>           I assume you mean pinctrl here?
>>
>> oops copy and paste the commit msg ;) thanks
>>>
>>>> pinctrl-single driver.
>>>>
>>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>>> ---
>>>>  arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
>>>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
>>>>  2 files changed, 29 insertions(+)
>>>>  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
>>>>
>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
>>>> new file mode 100644
>>>> index 000000000000..ed78b6fb3142
>>>> --- /dev/null
>>>> +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
>>>
>>> A couple of questions: Should this go in include/dt-bindings? And is it worth
>>
>> When I cooked this series two weeks ago, I did put it in dt-binding, but
>> then I found commit fe49f2d776f799 ("arm64: dts: ti: Use local header for
>> pinctrl register values"), "These definitions were previously put in the
>> bindings header to avoid code duplication and to provide some context
>> meaning (name), but they do not fit the purpose of bindings." which is
>> suggested and acked by Krzysztof, so I just want to follow the style
>> here.
>>
>>
>>> including macros for the actual function mappings, like in the vendor source[1]?
>>
>> Do you want something as the following?
>>
>> #define UART0_TX	0
>> #define CAM_MCLK1	1
>> ...
>>
>> #define REG_UART0_TX	0x24
>> ...
>>
>> pinctrl-single,pins = <REG_UART0_TX UART0_TX>;
>>
>> Other pinctl-single users just uses the register value directly, I have
>> no preference. But I'd like to get suggestions from DT and pinctl-single
>> maintainers. Hi Rob, Krzysztof, Conor, Tony, what's your opinion?
> 
> Basically, if the definitions map directly to registers and are just
> used to make writing your devicetree easier then they do not belong
> in a binding. This differs from clock or reset indices, where we
> essentially make up a set of indices that may or may not correlate to
> offsets in the hardware as using the register values without any sort of
> abstraction is not defining an ABI.

Right. I should have remembered this policy :)

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
