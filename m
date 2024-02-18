Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8CFC48BC4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td0xQXhbg0zzfm+sF5DgBd9IkjJoZQgQv96d+H9ZLGw=; b=4FtyxsMdSF/DPv
	RUtz1rlqSB28bMedroV74EBmOhKuhi7HCkbcUEeZw3+0veQKuASPad5h+OIS5SUFvkXvS8VPRixmO
	cPy+x2ofqpGeJ6Ito6S/5kl86n8YK39eSK+YRI19AiGAmdZTZw4BNRME/9iZvY8pQ0SUOwoeAWREF
	aQBeTNPDwQAMSWA3HA7nQiNmTjvGhdw3KJkPtKU0hKqAXSab/hL6GmaQySpUheeDfyUgm/w6EDKDo
	NezA2BpmofgELoD1eFLKIgxvCzf8ZwNNu22S/bEYea05kZ5fqWoevPwDNTlyuvciHYqYQ6Qm73nD9
	GNiXoTYUGzVTCSg2R2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbjAU-00000007xqg-2b32;
	Sun, 18 Feb 2024 15:33:26 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbjAR-00000007xpo-13V8
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 15:33:24 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbbc6e51d0so1909866b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 07:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708270402; x=1708875202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/+WFb/6IHGO7DuuRGtC1ezHX/DnsS05J/35SHyK2KA=;
        b=YFc9zz/VGXDojmdwRKQmFrYZ4l2JLo7upObKLEE0d0E8W5XCi3ZG9Apznr3BRVBkC1
         A7eaa2VxHYOhLu5whzzqOh4XrivRm2YYlszwzqKPjillYS06shvhqVbk8iAZ09ix0RRs
         3Cp2f6wdqeHtwli7b+Bx4nqmXdvFNpvjwgoXrguygC4PNZlew3xO48KB1kkA6bvcDZpI
         YO03xZXFhaiADT3RYPgVKvEgqTkr9V+Sdglcgyeav99lX4sPPLYKtWs3jP4vBUvvaWPS
         OHRoIS6rOrI27V3Cw1AYD0HAiq2hqNyS4hxbtdTdkYbbcf4XGzrziixGaHQtvR8zB4cx
         crBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708270402; x=1708875202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/+WFb/6IHGO7DuuRGtC1ezHX/DnsS05J/35SHyK2KA=;
        b=aCF9NFKzLXvZWtK+oGpDIenH8s5fHvbv7EleFzTfa2Yt9n9v529hH3LlRHxPMsIg1c
         GqZhzI07QqfIg9byrDjd4xzhemxIsWyw8xuwWTXYxvaYxD5U1mNw5yYpETYr3FOzAVa1
         3jfDt4PpS+pG6+jv7WsAyJcJ96Tdthz7b7tsQFmmiVaHw+CDoSX+AwV3tr6jI3+U/nJC
         qS/qEYECM01SJsxgjwc5kGbZIC9M4zEF6F4LacaPeS11Lz2hmfcpURj4A+pm8letAMtZ
         3kOp8HGJ63H3mahsNCPpZfvMWtmUWBsWYjJ42B4HwZ0yReqzuUidx3b4/y5EBRCu4rHz
         c09Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa6FAOvviyrvnQhGFjKFQIM3V1nviqNKnWyX9tg02Rr/L3DGl11Eysu/tlIoRABjgX1tH3C7tG9/ogARZFXc9c3qF+aQMt7pt+4Y19OlL3
X-Gm-Message-State: AOJu0YyBxmx096vpIOA21fSDLPXK/4dERpLeKJRTysBcKiCKYSssppso
	+YIZ2qHYlLaON+h1iyLA+xAPfpeTpghWlZIp6bQr3gjRCur7VNrRclCl9YnE+JY=
X-Google-Smtp-Source: AGHT+IH1iDyN2tzMwmReFoBP6SQJJq7Vr+GdTMJIqYq1jnekXccdpbNnTxJEdOIrHFh2U6cMKFP2kA==
X-Received: by 2002:a05:6358:7f0e:b0:176:92d1:568f with SMTP id p14-20020a0563587f0e00b0017692d1568fmr9886249rwn.18.1708270401977;
        Sun, 18 Feb 2024 07:33:21 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id x19-20020ac87a93000000b0042de2e2195fsm1719582qtr.26.2024.02.18.07.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 07:33:21 -0800 (PST)
Message-ID: <a3139d86-f2d3-45c4-9eda-23afbeb3f3c2@sifive.com>
Date: Sun, 18 Feb 2024 09:33:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] dt-bindings: cache: Add SiFive Private L2 Cache
 controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-6-samuel.holland@sifive.com>
 <7d7fc53f-1b5d-4f1f-a53f-f0863a79a79c@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <7d7fc53f-1b5d-4f1f-a53f-f0863a79a79c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_073323_343027_5FB87230 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Krzysztof,

On 2024-02-17 3:12 AM, Krzysztof Kozlowski wrote:
> On 16/02/2024 01:08, Samuel Holland wrote:
>> From: Eric Lin <eric.lin@sifive.com>
>>
>> Add YAML DT binding documentation for the SiFive Private L2 Cache
>> controller. Some functionality and the corresponding register bits were
>> removed in the sifive,pl2cache1 version of the hardware, which creates
>> the unusual situation where the newer hardware's compatible string is
>> the fallback for the older one.
>>
>> Signed-off-by: Eric Lin <eric.lin@sifive.com>
>> Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v1:
>>  - Add back select: clause to binding
>>  - Make sifive,pl2cache1 the fallback for sifive,pl2cache0
>>  - Fix the order of the reg property declaration
>>  - Document the sifive,perfmon-counters property
> 
> This is no v1. Please implement entire feedback from previous v2, v3 or
> whatever it was and reference old posting or continue the numbering.

The old posting is referenced in the cover letter:

This series is a follow-up to Eric Lin's series "[PATCH v2 0/3] Add
SiFive Private L2 cache and PMU driver":
https://lore.kernel.org/linux-riscv/20230720135125.21240-1-eric.lin@sifive.com/

So these changes include implementation of the feedback from that v2.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
