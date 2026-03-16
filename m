Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD118F506D2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtdPzAY9wnlUdRJbPWu9srNqJAB50tLK5X1pcLKgtT0=; b=4F2Q5zpwijyaHUcrtEgHk4BYWG
	/kj0H8dkELsjwz+ieiTevZEe7ZW91a4sDY8xdQ3ai5qoFtXM6eSuk19VDLHeOE2dicAYR1xEm9zTD
	XTeakg3bJ+tEXufKwST8XXe/EQHCY89ViWX1ACFozOY5AyXmohhXz4zzG+b31z5tQFPjRLtlhkbUW
	VSvj8+czsnXCDNsRhTh20tNmv7bGHlcrfUdqJQlI1WWbKdnZlut7udC5gLI1kJCWqBX8LvW3IuTnK
	X2ECQain+Cmn6t8g93bSvVWXVtxuTcY5+oWhcjuf4z2FLE13cyKlQ72Uqet3JtiDmZoDLjGdDgTre
	D7vP+lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28fZ-000000048vn-3d42;
	Mon, 16 Mar 2026 14:11:45 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28fX-000000048uq-0CPU
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:11:44 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-128e4d0cc48so5109450c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773670302; x=1774275102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qTyet+vUs4i5zO6iAQ/90TtCdIDVFVxtPrkgLSGy3qg=;
        b=IG0zYg6abwqC97mvQxtA3axmnOEw6nZZtsWzoxT9EkSbAFQwxgY1ZWymTxs4PolOK9
         TN9Q53oAmo0Q2br7UcWmSyuZgdei7vEoLgiUfGm3QGplcoiUinFV4GAVdnHx2KVJHQ1D
         dbeeWWlVLeNQyc2XBkrs7kNZIXx8LzpIaK+T/u1Bc8DePadl7vQnSrAYKiRtTWrqBFFm
         PKlkyr/bcKhwlr/tLsKJp1mM+DQ9z8DnxrHnUqNmsVj16yoCqUWZgT4zM9av8LRkiG/K
         QiOSUmb2WU5A6KDNSIwOwp0Zeq3v333kCmVQiPfvD5QXmn/qNJFBZJsHUEytv4jq82F4
         oO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670302; x=1774275102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTyet+vUs4i5zO6iAQ/90TtCdIDVFVxtPrkgLSGy3qg=;
        b=ctSkEKZ9Df8I6X+SRAiFAbagO2PyZb8csTN/ALeiePzB7/zrRc+O4z3KC1NcckoQ5F
         47PWglwchjDMQQ0Yzh8BwghCClKjbtvi0ssVAfjrclOGZtodD3ofcOr3iLrjo9JzVOw+
         WZNvrkJM6GOWDLmihLWr+W9JfugChH/PM9zP91UczUFu190gaU8Lm458lI62brnbKunI
         Hn/SWW/y7mHmordAPnQfu8Zw321Avpdrl51dj7oaAy0qZ6NCmbYH85uG9FYxzy14oS8Z
         Z34u5p1rMWKINFYG2Z3p7gPmAfSFvJ6KrEug0tN3DCBolGQ36wxrr/87waYkqWIfBUgI
         D/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXd2b8S/rHguVZ5dh88QS7XeLnwTxI2h85mMmZi7n8kGAw6Kg2fK7uogFrdDwK7QYzjo/rW8vrj9dozZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsjFUnNt1k06OMjod9azw9tlSn8xosEXU7170gumFARdDJLBk
	U8eEqqW7ZhRdhlN2e4FG5AuX+n5Sf0CEYGtdi7CqSCGCzHSQ0IaGgypO
X-Gm-Gg: ATEYQzzLgDXqyMZt4LbfHP7SKzyce0q5cqxmEmxJzBVPNbhaGO8rDU/hKmdcGa3t3tn
	PG/9Pu+MiVaj3jkIG5pNFYXh1aSexhlfxY9P7PuZaJIQXE8o+RCZ0SQ+Mf/AGmcDDaKbR8dslMd
	M7SczmpQm41IYJll8WoNSQlkvHFn/pxaa5J+Fs80CH1OcBBoMmqjRva0o6CYZbXq58nTWY+/z4+
	STTaPfnud6+YjIRcMq+QHc4GjmuZpsw7dz3rOiiDYlYljAQDbIejN/llh7oI2YYnKRcWmcPiyNw
	m9qhBZncMYnu5YplSM1mJUkwH40Z/jJam8jufwIcnj+15M4CZe59EMPA9s9XyBdXiR+woEzsmXI
	MMyaA4OnZBtUrSI9Rg58rgg0zfOp+Duf2pdmf+Ez1wCG0l/rqyvQDlRlFSC1/zrGdKgno2P8rA6
	hgh6Km3Vn7TOoscIKlynodUtuDLQPn4opxjxWjxmaCCZKqfejbRpjxc9NmWKNSt5+x8byk40Xc
X-Received: by 2002:a05:7022:b9c:b0:128:cc63:82f0 with SMTP id a92af1059eb24-128f3e2aa9emr5757183c88.25.1773670301528;
        Mon, 16 Mar 2026 07:11:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6283845sm12630518c88.2.2026.03.16.07.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:11:40 -0700 (PDT)
Message-ID: <0f88a17c-7c21-4ae5-b418-dfb4b4ac5d6a@roeck-us.net>
Date: Mon, 16 Mar 2026 07:11:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
To: Conor Dooley <conor@kernel.org>, Drew Fustini <fustini@kernel.org>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn> <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260315-cogwheel-dislodge-a3efe31728d1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_071143_121142_EC9EEE90 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/15/26 05:12, Conor Dooley wrote:
> On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
>> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
>>> The G and J coefficients provided by T-Head TH1520 manual (which calls
>>> them A and C coefficients and calls H coefficient in the binding as B)
>>> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
>>> respectively), however the binding currently only allows coefficients as
>>> precise as 100 milli-Celsius (1/10 degree Celsius).
>>>
>>> Change the multipleOf value of these two coefficients to 10 (in the unit
>>> of milli-Celsius) to satisfy the need of TH1520.
>>>
>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>> Reviewed-by: Drew Fustini <fustini@kernel.org>
>>> ---
>>> Changes in v3:
>>> - Added Drew's R-b.
>>> - Fixed some typos in the commit message and slightly reworded the
>>>    precision sentence.
>>>
>>>   Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>> index 56db2292f062d..7d57c2934a8a1 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>> @@ -105,7 +105,7 @@ properties:
>>>         G coefficient for temperature equation.
>>>         Default for series 5 = 60000
>>>         Default for series 6 = 57400
>>> -    multipleOf: 100
>>> +    multipleOf: 10
>>>       minimum: 1000
>>>       $ref: /schemas/types.yaml#/definitions/uint32
>>>   
>>> @@ -131,7 +131,7 @@ properties:
>>>         J coefficient for temperature equation.
>>>         Default for series 5 = -100
>>>         Default for series 6 = 0
>>> -    multipleOf: 100
>>> +    multipleOf: 10
>>>       maximum: 0
>>>       $ref: /schemas/types.yaml#/definitions/int32
>>>   
>>> -- 
>>> 2.52.0
>>>
>>
>> I have applied this to thead-dt-for-next.
> 
> That's odd, why is a hwmon binding in your branch?
> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19
> 
> I don't see an ack on it from the relevant maintainer either?

I don't get it either. Normally I am the one to apply hwmon bindings
through the hwmon branch.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
