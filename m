Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80D0C3ABC5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTgVUWtMeaarHvONfKHK0Z8KtHuS01LhCcHRRuif5ac=; b=OLUxJo1nvJDEKR
	SzvnLTRrJ4xf8yzNRoiF6V2f6rEopDJVHbeT6AyQDaAEhshFbVNqSRY+hQQdw26ym1p/G7T50rZzN
	OgdMOV8uHrA5tk1PzekxxB4TAaj3mqnplCm2wauZ9EFCeTLpeKUk9yAhudiVq5JspENvvZ3sYyBSr
	2w8VSnYSp3wToFyyJ4/SD/UZB338ab0nm9W5pevi9V5xymSMY+tgnbGtEedFmCCTIAGBcQ6DCqY96
	QpXMXasuqQ9xywzLQOQhRUlkgYFBiMBaRTFZz0wyJzmyyWmOXoeq/ydV0HlBY+E3iLIqm1revc2fn
	oxoqhp+7u43p1eWce21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0hg-00000000fTK-22VS;
	Thu, 08 May 2025 12:50:20 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0aR-00000000e2o-2PZB
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:42:53 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d96d16b375so4026855ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746708170; x=1747312970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPxzY778BTzrpTVkXEIU0dpBm2FrQRvJ11cMwg4f8Tc=;
        b=nzdQh3K8n2z5CDm7SxvuBNAU9lEIYOUVo/83KggGkbGJrIhmPtiYuyFVrziiv94Jh9
         33icjIxfs5IUbR6xxOjCsuG1LZM4GWhrNjcF+CSgqXwT5zl61T3ul/RlTXU4bpF+1FsE
         xDfBwoagp67JSogjaAEOcNBZOpqflXg/3+VTqTuO+HhCjriqeFsp3Ebgv3btthuuatMd
         yNJCzFo8pUgClpUStVm00TGwSRtmJbrvN3VV4+JMwR1NQlIKBJqCksTVDgkiULEyQAut
         QdFAjpIkns871HIVhhvJ/X6TE4bRzyt9B2Hn3qVnkDMD+Khj6kFWhPFFGpAi1HsScb32
         4kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708170; x=1747312970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPxzY778BTzrpTVkXEIU0dpBm2FrQRvJ11cMwg4f8Tc=;
        b=qZHXWeraO7LY57jyTORovD/RX4HEc3cjJ95fN/h2RbzUt6g71lg5Jlw9S0ZcvRS5Bo
         +1H/MA/5UYvY2nbs3FfjEK5peaS1fkZRoIiz4jVNtGKB8o5QZXKZsRIbpJOBMtGlDgmY
         Wr32Kbt5qG7MuuKXW9BPj1ga07BUrj10iZDyU0AmAUoqh9Nc/PV7LqLAe4KPqmb39aI5
         qkEepy6gciY6R/o9Ch59O+svgzJx/ynKfXdE+YuDb1rUIOBKXyWYGQQnE7DhPOPgCTL6
         PH5jI4MAnuoiplrbQZZ7+czFLCbAAyWIzPPSan+JqZ0gvuRwcKUXB4iN3wMfxISXm2NV
         AE8A==
X-Forwarded-Encrypted: i=1; AJvYcCVWPSDLUdXw4loR6kCzh6ptmc86ugoboiDUI9JbE8x6xBbHh2hZ9/a/cbhVJRX1L+0qE7PU60wCQKp39Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YysdBqow+lOgq5uzdxfEvknp3ENV5GNAAZ5kI/KWWl3AUCdqQvu
	yyerG46vslnilHwaDP1ADSSXx6MppQw45MaV9uZ+1euWJe1p8nrA6QzEQCxFocY=
X-Gm-Gg: ASbGncuEW7KnFfyE6HNRjTCS2+Za3nkyd7vtH9CIr7ras4RKM8RrV47cRkuYuJQQVSS
	pEs+xfO+SuwlPbEdq1yk8Jq70cJNUPG7VPBnOHpaKppIE6gVXeZNKQ4d+bQAlBEsLwvd3Yt0k48
	buSlxz48I2J9Sy/eBlvNFg/X+UnLepH6YzhFTYRINiNNwwpqNq6loc9Dd4yD+AwwVl1cft2P8Hm
	5qznlpdS0eu3gXD8rL+ms0txdlx4cxfQRMjb6PtncX2L5JSu9wDMo2+yJ99/E6hkt8IDPxwc1/R
	/gIAvqKxGTn+Smkm05H+WvAQ9GE8aqRMFSg68HEj4I00KcSlX7nN1/CiuS1yn7og2A1khi3qKDW
	fhOZQ
X-Google-Smtp-Source: AGHT+IHinvHLNqxRhaY2b6afbVsRjVu3/5Tnou0kd+6vPsXAPuyDnBpQ8CoLFULaXpnrzUsemLIJvg==
X-Received: by 2002:a92:cdaf:0:b0:3d8:975:b825 with SMTP id e9e14a558f8ab-3da738d5b28mr84407595ab.5.1746708170546;
        Thu, 08 May 2025 05:42:50 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e068sm3135636173.108.2025.05.08.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:42:50 -0700 (PDT)
Message-ID: <5799153a-c9dc-4145-9993-7e5d99a6a0b8@riscstar.com>
Date: Thu, 8 May 2025 07:42:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
 <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
 <2ce8b9e5-562e-454f-9e2b-f2796d309063@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2ce8b9e5-562e-454f-9e2b-f2796d309063@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054251_881568_CD3C9408 
X-CRM114-Status: GOOD (  19.38  )
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

On 5/8/25 7:36 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 14:17, Alex Elder wrote:
>> On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
>>> On 08/05/2025 00:35, Yixun Lan wrote:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            enum:
>>>>> +              - spacemit,k1-syscon-apbc
>>>>> +              - spacemit,k1-syscon-apmu
>>>>> +              - spacemit,k1-syscon-mpmu
>>>>> +    then:
>>>>> +      required:
>>>>> +        - clocks
>>>>> +        - clock-names
>>>>> +        - "#clock-cells"
>>>>>    
>>>>>    additionalProperties: false
>>>>>    
>>>>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>>> index 35968ae982466..f5965dda3b905 100644
>>>>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>>> would it be better to move all reset definition to its dedicated dir?
>>>> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
>>>
>>> Please kindly trim the replies from unnecessary context. It makes it
>>> much easier to find new content.
>>>
>>>
>>> I don't get why such comments are appearing so late - at v6. There was
>>> nothing from you about this in v1, v2 and v3, which finally got reviewed.
>>
>> Stephen Boyd said "please rework this to use the auxiliary driver
>> framework" on version 5 of the series; it was otherwise "done" at
>> that point.
> 
> Stephen is a subsystem maintainer so his comments are fine or acceptable
> to be late.
> 
>>
>> Doing this meant there was a much clearer separation of the clock
>> definitions from the reset definitions.  And Yixun's suggestion
>> came from viewing things in that context.
> 
> Weren't they applicable to v1 as well? How bindings could change with
> change to auxiliary bus/driver?
> 
>>
>> Given the rework, I considered sending this as v1 of a new series
>> but did not.
> 
> Sorry but no. Bindings headers at v1 are exactly the same or almost the
> same as now:
> 
> https://lore.kernel.org/lkml/20250321151831.623575-2-elder@riscstar.com/
> 
> so this idea could have been given at v1, v2, v3, v4, v5 (that would be
> late).... but at some point this is just unnecessary late nitpicking.
> 
> So what then? Imagine that you prepare v7 and some other person gives
> you different comment about bindings or bindings headers. Then you
> prepare v8. And then someone comes with one more, different comment,
> because that person did not bother to review between v1-v8 (that
> imaginary future v8), so you need to prepare v9.
> 
> I don't think this process is correct.

We'll stick with the original binding definition.	-Alex


> 
> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
