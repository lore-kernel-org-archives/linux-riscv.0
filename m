Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10ACC35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Yys/NM11HZLzYNCRzYnDsQRR/s8sMC+oDT5xGbFtl0=; b=G60+zsws6Pg7T+
	ysdI/wDV9GD3kNtpXyxZd1lpHg3E9+PvrLWqBz8vq930ZMHYVnBYrNQTQAr5isRhTz6i5zubZUHw6
	8fUeMGXjd7IEr+1y7n2IeocjnDdnsXfO7SiHLswnvV8JRGf51izx3ML0duvg5Bm4CywTRsH/n7aZF
	vTh3i50jhjGp16qjDi269G3pwWTVZHr+TLiRYOz3SMyb8WmtJ8Z9PSfCJO4pito4bNLj/Wed5STQR
	6km3q09DrFuw+dVIprdrSu27lHjjds58hhE127BrSpkYjzDecwTlYCubHNL75/PAcg/lnTbCf8QOV
	ypj3MzDpB87Ny7d/et2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzp5-0000000HVRj-1kVQ;
	Sat, 22 Mar 2025 14:27:39 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzp2-0000000HVRH-0NFv
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 14:27:37 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ce868498d3so9886215ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 22 Mar 2025 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742653654; x=1743258454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxLNYJpvB/TXLfXAqOdKhmy/q9FPbJFzYq67r8P8xbE=;
        b=Vi1f0rzyBPlY4dOAmAPjAodgv15K3LMfMQXa0c398aQb/536lYgsJ9g0XRCd5QQVSz
         J+HUpw5Bdba44pavqOwMiWvHlwJapDhgvlc+x3Q8qyoamPzBsH+K+GRoBp75RlzHRQGi
         jXM63iZS7HDMVYQyOzEPp2L7viUNH3zguPMcChjrondbHJ1jNMEsG733R2yQJ5dfq0tf
         Mqs9pfQTWLDavo4Ax6ApZ8jWqgENoCXNb5MmxcoHk63tP51W6ggi0Pc5RkVy9RqMdjRw
         8aQe7iqmuqJwWIw+V3ShuX6jU3FIsCkTltmZi1zp9zZ8CVOxwX8b3TtQwmlMg3evy9cN
         A0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742653654; x=1743258454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxLNYJpvB/TXLfXAqOdKhmy/q9FPbJFzYq67r8P8xbE=;
        b=YS/VhXM1JIe7XOCSqVfLUOYquScyRXUnvKJa7pz/i42Mx/INY1YBNk6RAisLvkS8dW
         aioO1+gxKuVxa4qQfeeLnZSv4rHn4ov1TG3n82TYeQwVsqFbRkGd48j2u4Ffbes4SKS2
         sc2xrnEsmEwqJlLBqOrryyUfSAH7F/70UVUNrGKjHGjyYdV2+lTk82yV93fpvkz3HLuy
         8Qu1w0TzdzM45hMzdvfO32Gd9KGu3j4UgTfh+DcDJ/nkDXoXe3VhOwCA8boWjSX+Ayp2
         OVaMAKNha+rPZlSVkC0g1de5wGLyyzhMd3M/eopZs6HA6COT0RV7Gyy28vr9EZFVT66M
         qOKw==
X-Forwarded-Encrypted: i=1; AJvYcCUFsQt3W1E/56Zt7+xAV340D9ombMGXdlnT7+6k7rUIt/6TEca9M5cix2ST8wqkIq55Dl/wsta7K9U53Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlfqcQ6UMy8duzpNJ9N00wQh94V2OrdrYUhItHmkU6I5rbinS4
	L6BSQky46vDfa2oqe5XHAoYkNqDWDXXLEx6ADr6b+GcNuK9wbSKOas5Xxni4m28=
X-Gm-Gg: ASbGncuoR7Yey6u3g2awMbDdpFTuXIyQuX/3j79/UZXmHC92FANcWQTbGAxuhOse9G2
	S2++0Y8OCifesfwaUGdyvvkt7m/x0trJTVZz+VBbdKAH3tu9NKWhboqcZsK9jKz1ZkVwUubShIW
	optCSOeKpALB1zLc4fjOXxMpm1bTCr8MDTt0IhTEFHqbQ/wHPnVeNcd6q1oa2SPdgOkLwsKU2j7
	KnLNn52Z9j6CS9uCzng9bmdNgYtheP4Y+8eUfgNj1L9gRlwf45KyYcdo49BGl8vY7n94TQOu1nM
	UzkTtJeYRYi8y7vb3aLm8pRjMDbuMbdvSx+DMxFHaZ3VpbqIiSdwkQSYnR0CedeNLH6wDgdYdKr
	dxXwV9r2VW+d8HDKzLA==
X-Google-Smtp-Source: AGHT+IHxH2JRqswkpmkABiwFlVLWGLbm4QGv8PyCPkc/LYC5FudrlksXf1TKCySAHhTc+btPlG9CLg==
X-Received: by 2002:a05:6e02:2585:b0:3d0:235b:4810 with SMTP id e9e14a558f8ab-3d5960bf9b9mr82023985ab.2.1742653654335;
        Sat, 22 Mar 2025 07:27:34 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbecb453sm908223173.142.2025.03.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Mar 2025 07:27:33 -0700 (PDT)
Message-ID: <1d79fb7e-4501-4c62-8379-f00515dec3e4@riscstar.com>
Date: Sat, 22 Mar 2025 09:27:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-2-elder@riscstar.com> <20250321222546-GYA11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250321222546-GYA11633@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_072736_405203_2062404B 
X-CRM114-Status: GOOD (  11.87  )
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

On 3/21/25 5:25 PM, Yixun Lan wrote:
> hi Alex:
> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> There are additional SpacemiT syscon CCUs whose registers control both
>> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
>> previously, these will initially support only resets.  They do not
>> incorporate power domain functionality.
>>
>> Define the index values for resets associated with all SpacemiT K1
>> syscon nodes, including those with clocks already defined, as well as
>> the new ones (without clocks).
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>>   include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
>>   2 files changed, 143 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> index 07a6728e6f864..333c28e075b6c 100644
>> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> @@ -19,6 +19,9 @@ properties:
>>         - spacemit,k1-syscon-apbc
>>         - spacemit,k1-syscon-apmu
>>         - spacemit,k1-syscon-mpmu
>> +      - spacemit,k1-syscon-rcpu
>> +      - spacemit,k1-syscon-rcpu2
>> +      - spacemit,k1-syscon-apbc2
>>   
>>     reg:
>>       maxItems: 1

. . .

32
>> @@ -180,6 +184,60 @@
>>   #define CLK_TSEN_BUS		98
>>   #define CLK_IPC_AP2AUD_BUS	99
>>   
>> +/*	APBC resets	*/
>> +
> I'd also suggest to drop above blank line, keep style consistent
> with others in this file, some same below that I won't comment

OK, I'll fix the weird extra line and will drop these blank
lines as you suggest in v2.  I'll post another version after
Sunday.  I recognize the merge window means I can't expect
reviews during that time, but this code is waiting for the
clock code to get accepted anyway.

Thanks a lot.

					-Alex

>> +#define RST_UART0		0
>> +#define RST_UART2		1
>> +#define RST_UART3		2
>> +#define RST_UART4		3
>> +#define RST_UART5		4

. . .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
