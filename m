Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C95CCD193
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlDyk+OKXvNquX+WFszVUrcmQBOV/dfjZGPiICpzNYo=; b=BoGT5rewhq8NEg
	m+FB+mVKXfjWGMxx+QiT/RCeGtiSYXYMpfKEOQZMxjLz/shk8BAfQbI81E40akVrUQkFuAtL5bgeu
	uCNPVEeCVzsQ22DG7SOe0thL97LApcZOHD9YB3UGqc6GW5pvN8SEGbQzDI9O9ivo5MUpSIytanzr5
	OLHmjwq4Iw7rll4QeCMzQeD9hrx5fWMu4Hlh4J3K2E+DFtJwMJbYO+hkBsFW6DOLp9eQ0DC3bba+f
	ayoEbCYe75I8kpIt7DBK9sNaKpGS4q9vTcsAfYoEaK4qaL46t8zehXcS0Kp71pq/FG1c1LOMlMXC7
	RSFEoqZjXdcKakDPN6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hs-00000007rzM-37pG;
	Fri, 24 Oct 2025 00:04:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hp-00000007ryT-2k7h
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:04:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-290deb0e643so14403525ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264245; x=1761869045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=1jC8yJfJQDr7MXcjx6jK3/OMUx73rMDXWNZ0YP+Y1rW29m1a0YMsZMgLzgnWmpBm3v
         pl06OSEZf45K5ZxVBq3EcuDSLjp5tOiqcInptTRV0SXRyGkIhGrqmAYK65xlwPYcQI4P
         JnO1I401LeWhQ/BV1//VJ7Jk9NMCKnF4VnyXSONNRI/HIJWNtslByPA05Dh3moRl+SoQ
         Q1Rv7xcXvn1kYaWgUxGLR7FNhuF0AujG6G+/Qn886iP2jZMRaixAOmYHSIM2DMKlwOTL
         TqmZxP+FKKAWQE87ZMVWM8G3tqZqPzHoYzOO7FbgBnDy5MScM8c5d4Q0O6JVZR8OBXY2
         pTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264245; x=1761869045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=uw/gmwqZrnKr1TaG1naPvz4BqW04YcnE6xGHc4zh+2nDXmA0Rw/TBrbWRUKeLWJQ2U
         sc4/ALTwT+Adp20KJMupzZc7rX89PWHs86mWYtpMZ+SOBL5wlfWIuszlboFF3cof0hGF
         mIvLknyS8Sw/oVoAPezrrgELplm18vaODpx2XuyRPOnw3nwuJbqhkHQCFM/dPGTYkK+l
         AYaq3NHxiMqe5vWGFabVgsEEJhE4AbtB5eJLmN2NgQq/KcbgZGs2yHf2xXijD7KV+rj1
         8+Ma2SPLsO8VtqmJikF+Svz1hxn5LQyP2IcmbZUsD5FzdDhZvgQhiR6lhT+GHxgAiI2Z
         AtXA==
X-Forwarded-Encrypted: i=1; AJvYcCWE4x3D3tQsg1HYeqNYNEMeOjOQylsVCIatTTbP72UugUaHJWjolk0UnHlY77ng2kye5xyEZWvz3F50PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfFo9HtHqHHOTMjp8Ql5rDsQty/w0lGMTd/J1dyeMj3mXpRTs
	YrkLMlo/mYanraYnjspFsKo1Nk8G+Td18t0q0t0CtgNe29LMHxpc1niOQ5nng/Dbs6E=
X-Gm-Gg: ASbGnctXhDf2juvgmfKoVIYLiOg/nocV2mNezOveOZJxaJrbgXDOVxop5Jc7mmKGdDm
	AxvutqRtC0iFquoCBRPOMyKv/LO3+OwVFWh2xaHzKZnwBy9rtKGoUSu1AiKUO1fbIEpjUEbtIk6
	9N85f7igOvLXXoQvFv+Dl84Pu8COKxdypqcA71Mm1Ki/5Xycake/vlr8nUqR+AhS12CH7BhT38m
	sYaHKLK7WtKiAbJ9x3bTeWPONAcnVjyMOX9kyaYOyABSa6bhgkCojC2jVhBc2dFJphAiAImB7aN
	L2Up31fQTmXXxq0mptq1uqny13m74CAAISiy9mGJx8oHPrz1XJjWgDMxOz0cAqCTOlg9ZkhZ+jA
	HBD2wyMgE9BwAX8CsyDaaU1EGO83LFUGry/f4GTGp79l24Fsk3nlkiLmvOT9qh3W4v+PDaS9dCi
	SToLuoEW3Ys7RQCQhC
X-Google-Smtp-Source: AGHT+IH/sqOkgJHPoJp0C3PRAnpePjJuvBDUdrVuB7xX2bh8XQc9etMQIVsugloCyKqrfw/GQPbVxw==
X-Received: by 2002:a17:903:38c8:b0:276:76e1:2e87 with SMTP id d9443c01a7336-2946e22bbcfmr48197185ad.44.1761264244857;
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Message-ID: <c4da7114-09c2-4c66-bdec-ee80cd7c5f5d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-3-elder@riscstar.com>
 <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170405_933698_9C48AF2D 
X-CRM114-Status: GOOD (  11.73  )
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

On 10/23/25 6:32 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:14PM -0500, Alex Elder wrote:
>> Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The "reset" property now only applies to spacemit,k1-qspi compatible
>>
>>   .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 5e6aff1bc2ed3..edd3158a6f2e8 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -55,6 +55,21 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      not:
>> +        contains:
>> +          const: spacemit,k1-qspi
>> +then:
>> +  properties:
>> +    resets: false
>> +
> 
> strange, if-then should be under allOf, I have not seen you add allOf. And
> original file have not allOf.

The file currently has allOf at the top, to reference
spi-controller.yaml.  I'll include this next time within
that allOf.

					-Alex

> 
> Frank
> 
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
