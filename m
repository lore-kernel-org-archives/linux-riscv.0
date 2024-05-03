Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49A5C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/UFpRG28gVUKtLKFeoxhwLlNWSA7rRhcITKikA5IkE=; b=fSWVc9gcJV7BgH
	LH2aZ7aCoQgHJxKIWUdVVqLjhZzJcdchuQhplkrlAqjdHP9Pbh4VHuBMKzKEoF83ck1KFz1cSiOGQ
	qTSCmN9n5S0THFGrE1jySGeOTM99zju9/Foh7L6MmcGEye3E2xeedZ7efEZ1aoebQgZXWiEqOteMQ
	uga0BkTogx1dlntoaA9XzoXS05iPGvoUGhl0zURc2WBAaeNY9X+VkMqe+NM4wXyv4zhDn4J4w2ELg
	mM7RigGQsgBKLswQWfORu8DUmEOiKyoKQ+Cw8xshGibptEfQSU6HhFuZZi87FkQPDwengV8De+cJr
	mG36NTHt0qT8wy5p56JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oSb-0000000Fh9h-0wpO;
	Fri, 03 May 2024 08:40:05 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oSX-0000000Fh80-2J58
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 08:40:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51ef64d051bso2131126e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 01:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725599; x=1715330399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd2nsty2WG6SHHF8+nkpeQv9fDcTG+0JYjbHe+PLVZg=;
        b=Gy0/vHMzlvGxaIudYQZQg4onawePTWeA8aWJUUwYj4vBI8Xn780YMFI7A7ZvOrNz6i
         IWzUIu2cA6/jE3Kd6GvtNCbzXDsgYjrsCK7IZwLk5afuea/YbRQ3NgLuFc9sK691omxt
         MYICaznHCeBM+337qc9LmchmrlFsSyGNgNDwWH+6xpyY6AzDGPsCtCWcvN6FnUHnOSUG
         JpSxc0/fHF3TOBsR7vcY1OMIhi4AOv/zIpV04PoH8zns0mLmakylZ9wd9Opd+a+WfGN8
         YwXCjH7gC3nCdv87e4lngv3KxBg0+r+ei91iTXkM/SJ5aLO3FhnAjJ00woJ8aKHnWOJI
         Sc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725599; x=1715330399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd2nsty2WG6SHHF8+nkpeQv9fDcTG+0JYjbHe+PLVZg=;
        b=sYaONyGI0MJKzdoom9MhrkU8PE57ee/dkcXxcJWyvrLt58iFfxy1PDLyj8ITPaHFTV
         A5548Q6ReHVpzjSc95QE77vBHY92uPobEEVhlWOpJcvSRviNYE20Ys3KP6Me7p4x1ypV
         RwpY4VZ73/pa6iRRXPt1sUxpxfUuJfd7UgyiGIrGPPOqQfvp0b5Ddonf061mvFDhzpn2
         QvMHM8NRQl+q/SVO45unUQHj9FdBC//Ng5gtapuJ92jdmoetjgXYSTOSHz7HGiuwwWw4
         kCg5VUl2e62cdc8vWeTzM+DA2T1g3N9Lrh9DTg7ZOluhHvX4ZFYqArynB/sufiM2g8WS
         hY7A==
X-Forwarded-Encrypted: i=1; AJvYcCWjXGf1SOjzp8S0BtYwSwORqOwriMuj2yPsOOfMpKvG6C2tzwit/0rukGh8NDBxdDfxzrLu+v9W6Ah4lYsXYh9apmLBcqoG9vUd2zIYHTRY
X-Gm-Message-State: AOJu0YynFNzXAD3xEt/gXpT/kyRKoEBBajxl5Os9XnBwh/K+lL/RNtKz
	jRcjJg6KnRV6a096YFW09OSHR3NJS5S7IuzfxBpKHCYQfF9HoOijV5Fb8txm5sY=
X-Google-Smtp-Source: AGHT+IF4QKcb/sXAo8+X01dOQnrnNqk2SSFq/L9I8igfxBKKMdF/CsCxYt2AjVAF4ukP/fC/AnH4MA==
X-Received: by 2002:ac2:58d9:0:b0:51d:bbb:7a4e with SMTP id u25-20020ac258d9000000b0051d0bbb7a4emr1341798lfo.24.1714725598711;
        Fri, 03 May 2024 01:39:58 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b004186f979543sm8674790wms.33.2024.05.03.01.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:39:53 -0700 (PDT)
Message-ID: <7f5e3ab6-515c-4943-8678-03232fd9aed5@linaro.org>
Date: Fri, 3 May 2024 09:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
 <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
 <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
 <20240503082444.GJ1227636@google.com>
 <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_014001_704839_53B46EEA 
X-CRM114-Status: GOOD (  13.58  )
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



On 5/3/24 09:31, Krzysztof Kozlowski wrote:
> On 03/05/2024 10:24, Lee Jones wrote:
>> On Fri, 03 May 2024, Krzysztof Kozlowski wrote:
>>
>>> On 03/05/2024 10:08, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>>>>>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>>>>>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>>>>>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-
>>>>
>>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>
>>> So this should be Ack. You cannot review part of the patch ("I have
>>> carried out a technical review of this patch...").
>>> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst
>>
>> Reviewed-by is totally appropriate here.
> 
> Submitting patches is clear on that:
> "A Reviewed-by tag is a statement of opinion that the patch is an"
> Not "the patch or part of patch"
> 
> And ack:
> " It is a record that the acker has at least reviewed the patch ....
> Acked-by: does not necessarily indicate acknowledgement of the entire
> patch."
> 
> So no, reviewing part of the patch means you Ack it. Especially that in
> git log the Rb tag will suggest entire patch was reviewed, while it was
> not true. Review of 80% of patch did not happen.

Thanks, Krzysztof, I'll keep in mind next time. I now confirm I went
through all the substitutions and they look good to me. R-b now applies
to all the changes.

ta

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
