Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E812EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4aKAwNDpjssgtGGje32xi/c5rj5Evdn2DzDchsXzac=; b=48+MYQOUMVPi0J
	w9bltcodoSf++TusMkG4VC7xrIrMhsRWhbubxPWG5dRn0DpSNvjjY6KXn5jH1gh793JjP4X3/uyOj
	joPyRd34iNU7qR8xEoOTdCwXN13SNoUtjLWzLzoLoy4urVOS5U+0l6MwhZ1CFPtbMms60SOkXhVN+
	gJO6WV/Fvms4JRSySMt5xn8cFdXzduiecf42j5OzqRfwAqWwFax2yNPyWdVsdryTMTuFN3EfAdleE
	wceEyiPMH051UC+gjECRpLz7NifTvOyaS/5HGxuQ09Ro4s7KJ9B4aGZWEkasu4kM3Kk6FuKQpzfV2
	De7Ow1Iw5CrPEaRdmLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwNL-00GY3T-1J;
	Mon, 07 Aug 2023 09:18:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwNH-00GY0t-0h
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 09:18:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so20086035e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691399879; x=1692004679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVzTFSX+f3NLp8W+oubkEcGfLvriaLn/mzk8yERB4EQ=;
        b=qJNkHMMX6yWfZ0+pTVtKomPhic8oIkVTU4BgI6+YGQ09zaqOV+wKh9W0VMaDF5vGVK
         unpdERvcAcVRzv4T+5eC6utzpr7Tujtt4DxNGg5+D0zups3hSP94fD4C6Uq7d+QA/UfX
         Sixs7SltrhRg3Z2s4cDrRNFbVUvMUojpSzMGxhDPUhF1dzNE6PeVKZRcXXA09Qr/NMCc
         4/ENs3n9eQZK25cJJHF3O3p4hP5uyg6YXkPYotQ85mlUAB18yaC4W/dV7RuK2jvuNwbF
         AyG5SBgOF2lJne/Hu/DDneyX2OuAtEZipBpoT1RUjDbrGTA/GusqpUqTCXE1vBKusIgW
         MYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691399879; x=1692004679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVzTFSX+f3NLp8W+oubkEcGfLvriaLn/mzk8yERB4EQ=;
        b=H3a9FyBUkX4Ip7znw9qGfTIk1zTsFBxvWbweGMQ43kBkS2Hp1/efhBdCDnj6E3oJXI
         vy1Nx8e/rnh5WzWD4bJcncYUca6nbHjOuE7HvGbL5XfcIrTGuCH9sQptdLrub6gLc3nC
         xcI2x94gGF7Fy0eI+UdDwarsqdUl/RgIjCEUnjFP3Yg6X3Jw0oYHyFAEDjUvE4MBvee7
         qZMsMHhC++Nj6JUrP5mQUEgU06vdtvWaO8ut2TWAinfw210KTxuRPjLPPHAS3fZOsFOk
         +1wwiD1S/yoJSkBZWMFsF8L9azLWV45UA5hL2j1QjUVkwakfkDAMfoX2/1i5nmg6H1fJ
         8lOA==
X-Gm-Message-State: AOJu0YwNMW1WN5nQH//b8o1+DpSFS0GoDOk/H79sIk32EBCsUrLq8Dsn
	ULxiLLxF++S+xqMFYub94nOjDA==
X-Google-Smtp-Source: AGHT+IGt4KGgRS1McoIAI5KnJK92YrcRCVd7O+/H015bztf8+4T/Ho4NkPj03Y5Li3pMLxhNwVc9aw==
X-Received: by 2002:a5d:4044:0:b0:314:a3f:9c17 with SMTP id w4-20020a5d4044000000b003140a3f9c17mr5695333wrp.42.1691399879376;
        Mon, 07 Aug 2023 02:17:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id r15-20020adfdc8f000000b00317909f9985sm9893936wrj.113.2023.08.07.02.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 02:17:58 -0700 (PDT)
Message-ID: <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
Date: Mon, 7 Aug 2023 11:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
 <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
 <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_021803_286454_BA37805E 
X-CRM114-Status: GOOD (  13.82  )
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

On 07/08/2023 11:03, Xingyu Wu wrote:
>>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: snps,designware-i2s
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          maxItems: 1
>>> +        clock-names:
>>> +          maxItems: 1
>>> +        resets:
>>> +          maxItems: 1
>>> +    else:
>>> +      properties:
>>> +        resets:
>>> +          minItems: 2
> 
> The resets of TX0/TX1/RX on JH7110 SoC are mentioned in 'else' here.

Ah, its fine. Clocks seem to be also constrained.

> 
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: starfive,jh7110-i2stx0
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 5
>>
>> Also maxItems
> 
> Will add.
> 
>>
>>> +        clock-names:
>>> +          minItems: 5
>>
>> Also maxItems
> 
> Will add.
> 
>>
>> What about resets? 1 or 2 items?
> 
> Mentioned it in the 'else'.
> Or do you mean I should drop the 'else' and add the resets in here?
> And is the same for TX1 and RX?

It won't be easy to read... probably the binding should be split.
Anyway, it's fine as is, except the maxItems above.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
