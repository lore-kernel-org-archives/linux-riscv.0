Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11596C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS+dvQeYC+S16rCT1T1uGLDr+ABE6L15RqZR8kEo954=; b=Zg0cEEkjQJgNkk
	cr75ph56kbanPqRQRQ590t1iZg4uY0KIDBkjQBnDO8KCL4HuqxzwJsEaLOFHjK39zStyfT3uNjf87
	h6T9o7J+SyJwMwWmJby9c5vnA1i+7O4pVdCPz6P8SM3tSEgfjRM/5IaZuLyM9OC/6wE5qGxBpcLYJ
	USTVczS/xsPO0m5W+h6b71bqm7f/q4BQYqSE5qNyNMLBaUJ49SL7YdlE5lCDDn3tVFkXQA/i73MHJ
	vzy06kJSJXYKOPRHg80Gh1C3zV4WkHrA43sKsU8sriyxJCnj6hBhmgZbe2Ikrv7qT4qWnJxB01iIv
	ZHtc809c/tvBIhk79nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl7BO-00G5kJ-MI; Sun, 01 May 2022 10:52:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl7BL-00G5jk-S9
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 10:52:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id k2so16279180wrd.5
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gI3zKVuvBUpZPNwk0dB8gwBv+CGbUeSGw/y6OnW6r8c=;
 b=CtPgKeF5HdYQZULbn/MAXZCcsMdJ5+cvC7NIboiysxlLDO6cwYO4o9x8IfcuVkKuu4
 4/5jloM5g70fjfncQ2LgacOLTcc+0VAvf4u633fW2dhmof7qxEo6TrXb+Ehm3Lixk8AU
 tgtXhkpxNmypa+bPHhygo7WolN1VTeWrnLgLLZVhLQ0hPVNTqdAujhFD2jOY0m+79sAa
 DTZxGYvO22hXiCiU5wmoDsx2tXGSSYvORBV1xFCjq98iwH3yD9HG45Dc/lHvU/KjIINC
 /W67UZRxwe0PUktriYPN6JOG0dO0/XsNSuHwYz98pL3jLpwwEPffBLWOTxbc1LFWk6Ob
 iWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gI3zKVuvBUpZPNwk0dB8gwBv+CGbUeSGw/y6OnW6r8c=;
 b=QhJfvvKgIayOT8Y6JQZYbdlC6alc71Yqga63+ND5OlXGLllweFHidhILa+clFOOhBB
 rc9F1VQ892281TPVdvqIR/oeNjjmNMkcD8Se4aOdJ6brL6VefAbYm6HAwXB4x3HygPOg
 tY7TMNLlr0zbu+6fIRmPB2k1poXG6eWZL1R+nOykHPCOJ638cZ2lBEvI0la4E0l6g1Z1
 eVQPKYChFXbE0KyZ/gnmdGCcuChDugB8N5gOf2jJR+Jxr+yoFo8vtyNheUbpz/hcMWoV
 fhD+2nk/YoNvUQbfpSKMDH9KyBkP2eg7W1lkxGg5GxSf2RFT5ltfA4rRoZemN7+jRkFi
 iw5g==
X-Gm-Message-State: AOAM533di81ymdR3jyj/6o6pm4CRU8PXVUXwhXjbAeX3BUbiA+KB3SMc
 y0+SpiLMwWRl/qa8KuFKONLA3w==
X-Google-Smtp-Source: ABdhPJx9hPPLFKI9qlHPlVLf4I/hiMjEzseqrhge4XJ1KueITL24n6+RLHVilawbKfTlaMdAnM92dg==
X-Received: by 2002:a5d:58d0:0:b0:20a:e9f0:aea6 with SMTP id
 o16-20020a5d58d0000000b0020ae9f0aea6mr5862673wrf.60.1651402321391; 
 Sun, 01 May 2022 03:52:01 -0700 (PDT)
Received: from [192.168.2.222] ([109.77.36.132])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a05600c3b0c00b003942a244ec7sm3682707wms.12.2022.05.01.03.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:52:00 -0700 (PDT)
Message-ID: <82beb918-8fc8-8949-1afe-6d708f2ac8db@conchuod.ie>
Date: Sun, 1 May 2022 11:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzk+dt@kernel.org, 
 palmer@dabbelt.com, robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-7-mail@conchuod.ie>
 <6fdc6da4-3a34-e67c-cab8-1c9570501a8a@linaro.org>
 <f49b1d52-11e3-1c8b-bb1f-324318a7f669@conchuod.ie>
 <94bd3b92-fe6d-6bb4-8cbb-56ed52b9c4b9@linaro.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <94bd3b92-fe6d-6bb4-8cbb-56ed52b9c4b9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_035203_945975_E60FF596 
X-CRM114-Status: GOOD (  12.81  )
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

On 01/05/2022 11:45, Krzysztof Kozlowski wrote:
> On 01/05/2022 12:39, Conor Dooley wrote:
>> On 01/05/2022 09:59, Krzysztof Kozlowski wrote:
>>> On 30/04/2022 15:09, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
>>>> high-performance DSP and FPGA processor boards and I/O modules.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> Signed-off-by: Conor Dooley <mail@conchuod.ie>
>>>
>>> If your @microchip.com email still works, then there is no need to
>>> double-sign it. At the end you are still the same person... unless
>>> you're not. :)
>>>
>>> This applies to your other patches as well.
>>
>> I thought that the last SoB had to match the email it was sent from?
>> If that's not the case, my bad. The @microchip email still works, but
>> it would've meant waiting til Tuesday to resend.
> 
> The "From" address must match the SoB address. The person, rather than
> the email, sending the patch should be the last SoB. I almost do not
> recall cases where two SoBs were added in such flow like yours.

That makes things easier! Thanks for clearing that up for me, must
have misunderstood.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
