Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF44109190B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEm0rRBFRpkZkyaBGQBh5TE7j2AtDqhSqDPg8Od5GLU=; b=ZONupcuC8+FYFiH7KRnMZKIDa4
	qhHmvxGjs9RqgMvY30acjX+/+rznWAd+3JMqfAvAmKOTqTiGDrXdPd2gJMK4s4oKDbMT3VPgwBgPJ
	Iu1wHBjoCI5oW6KlQY30fuD3aEwyxZX1RBXVUWZts+QVTpppU1sYbfnbqexTojKbte5gU1admWc+y
	n2b3TgkY1bMoZhmko5vnnCB64uH2k34KxwCt3SQz27YebUooFItjeXAnlqW+dbRIWlJvjOY+cPo/z
	kgQpEChq/GfP0pJ7rUMmHTslUmwVB02cXPVwJ3dHGbNjuHwAAjUW8BUsPQ+YLuIJI3wZpvVAAhsEp
	nLVZ4/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I1k-0000000BISr-2e1u;
	Thu, 19 Mar 2026 18:23:24 +0000
Received: from mail-dl1-f41.google.com ([74.125.82.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I1i-0000000BISG-02v9
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 18:23:23 +0000
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a695044a4so2075253c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944600; x=1774549400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mXmpYx5FvbdQdUVERyfihydPyXAGjQF34GKm5VI1Sts=;
        b=YScuP4bxK/Tmt3d5CMyLWmvs8VEPOLvN0Kvp0Gf7WVVJlVKG9cT5x3BEcFQg0P/QCY
         +sWhXdhHumqqRIVGqdrlCdfJeBKxox1Gn7J15AZajD/KL5zDxD257pm8k9mvwWcdzBQp
         Gv0R0U9xcIfWBhnr98o3pCp50v+50I+3SFdGNGYDLqtUu+mTT3Xpl+aUTKXHbBOBMqmu
         MENPRvdAkMNBrBhHYGGdVtr5W5ZoO6tkSprKLxmdwd05nUWzvAKC3vLpOWCHSaOv89gh
         9zqEf9U77I2ZEP1WfeGaVb4gr6MFaKluQEN2lkHNOAk/sGoayT2utV/DE+tGS+Wd4EF8
         wCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944600; x=1774549400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXmpYx5FvbdQdUVERyfihydPyXAGjQF34GKm5VI1Sts=;
        b=niGKtF6DEKsW1L7IamBD+Q/yTKQ0JwJxD3JvBDdvmztOAOMb4P7beAnea0qXvsWU+q
         5GiThZ7S7ebiQPKWIaKLjJcFRuJr+2JrY+oZKxPTkkynt7xtrT5r4YIBRuwKnq+3mawI
         1gJUiXnOp1euEMJ6oE0AqFKIkHkFu5+PPBrZ5Ep7iWdnRzjJV66g/AiRji+nWcKdNr8D
         soryBGMaTuxxx9FKNAYZFvNPVVGpeEx/i1T59JLvuTGLIOmGsorj7MUWYBeWE+SWkAFf
         mS66io6b1NHbba+tH5/TpwYTfED5O4/q12IMnA2IXkQQ+Ay4cx8Dzo6J95f4xCmUyWDR
         wRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJViAGKmEUi5hAVSfQRqjnOmrr+2Unb4dkYs9rxL8WwbqUurq8sHCOmEOr9RqhXAljqVpdWKkjqjzDsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNV8ouglfWEkoVWFw/iSTsQY4DNud1lar27yqA1Qeg+RKFAlc
	UH/e0qKQSVW3dmKJYugOx/zkQXgy3wKzmJQy8s0tv7gZBz5rK8gWZ5y1TLB6Bw==
X-Gm-Gg: ATEYQzydMawAYaZPaJ8E25UohjyL6lC78Rl4/vd+IKpJBXvEH0W5VIEUTHxNhRBtB2B
	hPy3wxB0ZVKORavoG6UUoVs7KFR6bJmJArSpwIX7CwkmCY3Jp9jWuVDnYPSkOb1jOjHzQGCQWNA
	Ukd676ATS3pGsVVmO+buQR4hp8ML3aiNvzGh18zirnGuRy3KRnePxaYXxDQ30Le06LvfyhC7tE/
	Q3N278IeyjX6q+VezdJgoq5DZLR6VArTVRfivFmYiQqNRovkwyIpyOY1P1/9ZHSpgciStsfujjV
	LmA1JOnbNQYiDCeiamzn+9FUCLX8m8r8zB9KwW2BVMlVngGmLduoEJ8OjpmbSyO/YMG7UuIfIrb
	zLzwfzoEPlVK1c+llSm+IRO7YIV09+EWUg8qHxA3lR18sXUufTB/OEF1XOITONYEgT8yLLQR3Z+
	YpIwhwvJKcRqLooObyHVN8LSDxGQJEI6iZ0HBut2GbnUMfJVNa/Jbo3arczOMShFDtKUla487i
X-Received: by 2002:a05:7022:4590:b0:122:153:d161 with SMTP id a92af1059eb24-12a7267f80bmr69519c88.17.1773944600270;
        Thu, 19 Mar 2026 11:23:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b4127b7esm11303312c88.9.2026.03.19.11.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:23:19 -0700 (PDT)
Message-ID: <630e8ccd-e2e6-4d2b-9689-d55e0210e518@roeck-us.net>
Date: Thu, 19 Mar 2026 11:23:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
To: Drew Fustini <fustini@kernel.org>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net> <abwsv3t1jdWJ7sZf@x1>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <abwsv3t1jdWJ7sZf@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_112322_062412_82679729 
X-CRM114-Status: GOOD (  11.84  )
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

On 3/19/26 10:05, Drew Fustini wrote:
> On Tue, Mar 17, 2026 at 08:55:05AM -0700, Guenter Roeck wrote:
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
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Applied.
>>
>> Thanks,
>> Guenter
> 
> Hi, what branch is it applied to? I don't see it in next-20260319, so
> I'm thinking I should wait on the dts patch.
> 

Sorry, I forgot to push. It is now in hwmon-next and should show up in
next- in a couple of days.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
