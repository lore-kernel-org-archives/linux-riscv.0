Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE07C3ABC5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9S8NjJfhsyp53y3j9ht0t7rLDak7nihiMNOOFC05T0=; b=fk9r1/p99GAPOz
	IupL78wrZXehofD/PlKl6ba/d8UbCxYJfGXG2OoctuGipjASj2D+CmhqU48rh2+D/lQGipezaKWXu
	3YQYAQAGNyBak3dFuuln0/8OHeaylDKGe5Aw1xwLRPSWAEMe6etX08qO7lkbXNh6y4BGABI5VDTZB
	h0KxOxpXl70LmbFwJwSSQWAGxS7Ot/6mmO+ik5uSCQ80G4z+sgIutUnkxuXFSErAEhlPdAv5nGfoE
	jS5wQYWigmoR0thqF4GqPZ/4fQpt/JUR+Pe5R4covP0demOcENNkb1Ij1djzGgEjlNWe7yiQVlaBN
	MNLISJ40dMzbGZPXJdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Ef-00000000aOQ-3BTe;
	Thu, 08 May 2025 12:20:21 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Bh-00000000Zrc-1Jjo
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:17:18 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so86695439f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746706636; x=1747311436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=irgEA979XA7ZQ/XgAd+8Bh2R3UY7GFZ5paxhaGc+6DUATG7rTxkd2zvVAaCJMk3Kch
         9U6DhOH+tVWi4j4BmAcdoVaHQ/FpRtA4Z4mvpW2IudctXxj69Y4mYM37aV2NIUOHEO7N
         JpALkx04/eIxL3Kt8tBMJ0Uzhp6TYpsy59W003L6ph4edepwS9YSaLU46ndsCpTtd8l+
         niCsBHpo7NCoLAtSYQoRK6ilC+etuK5zmswuUAhF8b7dLoJ6v04gPulBXgQhlBOmi7qg
         VEk/PyC7w9ScG2LEKCi9+G3rQyIHOXOpLLAi6wq8GlU9T3j3+JnOjQQxTL/FJAZbx3B/
         /gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706636; x=1747311436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=e2BWiXORQR9RUhh9LJPjSZT7GPANiFyq20ZCxVXqKLwOKKEJbwzcl297rgWKPy85nP
         KWzHsmilcpFPgw4EGB4KVTt+88nuUMcMRXdZhPqg7XWJVMtO5FhoOCRj2sPcjhUMxF2b
         /Mn4HpkhvxlWve4Q4/UrkQFp+8q37Mhm2LMrs1f+xOA/MzewJHKxCrt8yZE6dxsV3Zzt
         LPfU5jW5cVl8i1SkeSK/eLFBqXPg7jh+WV7cFuFSzSZ/mKYynBwObqqohjBQk3kezy4G
         D9p96IYrisqjhmeAXhB9Z0j/pko2vGmP3mB6Y0G2qXjTLnLSJivE6PkuQ0CKNw8iPEih
         9qnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbAxcGZFkjZhh5D3p2T8qSghEB1HZ+oJj3QkJFzWZ35u/OtOlTTFEtHxlWMBKOJXYBq7qkp0Wwr2XAmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN8MOXNCphvFkPGrzpxjj/6U3ZwnTRkprTxLEq2LRHK43VhUI/
	K+X3sz32rYWuZcEDvN+Y9ulrwioQjy7ygmeDk5jc3ymG/tzY7iuPFsHhMXURlu4=
X-Gm-Gg: ASbGncu+bj0HMXnkQTRDVmerixNKOVGmEXWSgDYzWRv9BM3nT2Ahs4eb8LMnMVOLwPO
	avblwSEeS8t4eYs2BCgJUMD9aF2OtiUW72b/CQz6cl1N1SNItDvcVEmJ3xbd82VSWVU1ZB3yR3Q
	29Z+v0vOrTQm0JSBLzuVn0tCaqCrLRPmQzS/pyDdD32mju1JFtrWiqoMmVgPbthYz4mcstYKBX5
	PQbCB04w48uupx395awofBBU4bKcOaTxi8SHIVk4YkO0lmfYbEZKHZOYXTrx0DBuRoTd+0z1Mqa
	ayHm4etyFXTLD0f84HSHtjFDLqZ+N1iO3RTYcgSrSUnRlu8C8QCule/9ZdZj5lIGCWVPIDngPlr
	arRl+
X-Google-Smtp-Source: AGHT+IEpsfxrAkflVw0/hRABTEz4CwO/hvBuswU8lzk6t7nrXFnCj3fyA636Nq30np0oFo7xbeEBJA==
X-Received: by 2002:a05:6602:3f85:b0:867:3e9e:89db with SMTP id ca18e2360f4ac-867473170e3mr934513939f.8.1746706636487;
        Thu, 08 May 2025 05:17:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864aa2bb1bdsm294250539f.7.2025.05.08.05.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:17:15 -0700 (PDT)
Message-ID: <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
Date: Thu, 8 May 2025 07:17:14 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_051717_358686_66C64A27 
X-CRM114-Status: GOOD (  14.51  )
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

On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 00:35, Yixun Lan wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - spacemit,k1-syscon-apbc
>>> +              - spacemit,k1-syscon-apmu
>>> +              - spacemit,k1-syscon-mpmu
>>> +    then:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>> +        - "#clock-cells"
>>>   
>>>   additionalProperties: false
>>>   
>>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> index 35968ae982466..f5965dda3b905 100644
>>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> would it be better to move all reset definition to its dedicated dir?
>> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
> 
> I don't get why such comments are appearing so late - at v6. There was
> nothing from you about this in v1, v2 and v3, which finally got reviewed.

Stephen Boyd said "please rework this to use the auxiliary driver
framework" on version 5 of the series; it was otherwise "done" at
that point.

Doing this meant there was a much clearer separation of the clock
definitions from the reset definitions.  And Yixun's suggestion
came from viewing things in that context.

Given the rework, I considered sending this as v1 of a new series
but did not.

> I just feel people wait for maintainers to review and only after they
> will add their 2 cents of nitpicks or even some more important things
> potentially invalidating the review. Lesson for me: do not review
> people's work before it reaches v10, right?

That's not what happened here--or at least, it's not as simple
as that.  Your quick review was very much appreciated.

Yixun:  Krzysztof was satisfied with things the way they're
defined here.  Do you feel strongly I should make your suggested
change?  Or are you OK with me just keeping things defined this
way for the next version?  I'd like this question resolved before
I send the next version.

Thank you.

					-Alex

> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
