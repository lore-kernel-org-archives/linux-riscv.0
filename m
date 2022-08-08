Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86199C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRgYkfVxx7biDoKupRNql0KikFAvNDE0Jcpc8zPX3yc=; b=3qCzpkssR/3ajV
	9feYB9wAMObabq2zT5IfgyqjzfPvGcOa2OJGlDKkhJceCXXOcGJu2he+rqwO6omqQamBBmn6G8r9y
	ijDo3Nc6nRG5Xi3jV8MEh7bdjgc+M6zd1W/7ECGZvTsEq/VzZnPaknVj2NRCRTTuoZQymveSxUta4
	hYaMfZBiFQl5ceAuYwjPckXQ/2GcfPkaXzzSLFIETJpLZZxu3E4A7ZzLjS/Q0igsP61uUkFtUr1RO
	K6pabhHRZFjg0M8DnkJwSmRg8Yy4m3jNf3izf5lqxqbL0Uao/m14pLAFPMvwTjbX6/iGXRKP9OMnU
	zAisp3havZAhkxZ4qolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwlP-00BzFY-Qa; Mon, 08 Aug 2022 07:01:23 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwlN-00BzDx-CO
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:01:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u1so11345014lfq.4
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TNens4dzDr8b/FfgJaaPeV+Bo1fmiGV2IZIds2mzQ4U=;
        b=wCXfwUw2QoMuar6lfHymOJQ8aEuO4kEu28Jxk6Z5wZsnirHtVyXBcML6Xyfg49wBK8
         N5wqK8o7ffRno6O91+gydq3gTYpcvPbfL2rE5+I57n90uZKwQrBcL7pKZQ7zg/sI2CM3
         mtWxa2dOBHEJanRYj1xdLXeF4mNeQzpNppgE+syKltZPk4RXkhHKlsOamOU7Fq4QPHae
         iS2KQ5I0EydknwCd7OUd5oN+aJTkJict9d/a2jrzu/nPE26mvTe8JKBK7Wv/u3BaHJa6
         xo+/NkF7qTMgFsUlRJ2DCmXaiACWTpBaYpguNQFFdfEefSByeuDHSMQxHrFsIIHRWq9K
         h+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TNens4dzDr8b/FfgJaaPeV+Bo1fmiGV2IZIds2mzQ4U=;
        b=ieMFX5qtjeJMVZWGB3hrgTIHjhEfg3akEBvdCCufKdfzDdZPaQwfo6BK+NmlOzebW1
         vUEq8sQIL/R3mn+bFGzzf+CgwDB7BKv/tpxxmQOHMCHE9seU+XCCtU7AUo55Uw+jXjwy
         4bCUcUw5MX+99cq+1F09y/NFijnX0PsnZJF50WlyaTJSVTN4qvv8ZPTbkSdV212CofgB
         7ovPioL+3AsA1s0qhr6TjjxOmFBEbaXoBkTXHrnc8CYgj0HXki5bG1aYV5W248Y9gfx8
         8mfXEIicXwybTXO4Nqnqn0gTKiQ299ecHVlVHMz5mwIQudlvqgCzkXZAuegMQhJgYXSg
         ggEw==
X-Gm-Message-State: ACgBeo3A/ch+hhzF8rCCGlfLLkGlibG1sIkAh8/3MxV8MN+aoorFb+ZZ
	ni22hZgfgnb4+6UCnXzGq9ly4t7Q7zglRwyi
X-Google-Smtp-Source: AA6agR7h9f9j7kJmy4eXv6HRMrXlzHuLszLtzEP+dX+EERyr5T4kuPtlqmFellRKW1jKlCQpBzg0rA==
X-Received: by 2002:a05:6512:158f:b0:48b:714:5efa with SMTP id bp15-20020a056512158f00b0048b07145efamr6383704lfb.354.1659942079749;
        Mon, 08 Aug 2022 00:01:19 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h11-20020a056512054b00b0048b12f65672sm1319094lfl.272.2022.08.08.00.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 00:01:19 -0700 (PDT)
Message-ID: <9a1f19f5-e17f-d8f6-8010-e399bdd6c6b9@linaro.org>
Date: Mon, 8 Aug 2022 10:01:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: fix the mpfs' reg property
Content-Language: en-US
To: Conor.Dooley@microchip.com, jassisinghbrar@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220805125618.733628-1-conor.dooley@microchip.com>
 <20220805125618.733628-2-conor.dooley@microchip.com>
 <04b697b5-d344-0191-f511-c0f8e0c247ef@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04b697b5-d344-0191-f511-c0f8e0c247ef@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_000121_529361_3709E214 
X-CRM114-Status: GOOD (  10.98  )
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

On 05/08/2022 15:01, Conor.Dooley@microchip.com wrote:
> On 05/08/2022 13:56, Conor Dooley wrote:
>> The "data" region of the PolarFire SoC's system controller mailbox is
>> not one continuous register space - the system controller's QSPI sits
>> between the control and data registers. Split the "data" reg into two
>> parts: "data" & "control".
>>
>> Fixes: 213556235526 ("dt-bindings: soc/microchip: update syscontroller compatibles")
> 
> I omitted the second fixes tag:
> Fixes: ed9543d6f2c4 ("dt-bindings: add bindings for polarfire soc mailbox")
> 
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/mailbox/microchip,mpfs-mailbox.yaml  | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
