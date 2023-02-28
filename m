Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD83CC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENVG33Xk5mIJKkQgyXGsfnOaQ2sET2IJq6O+5Eszy8Q=; b=pS1JZQqEE0ic/2
	1i+jBT1w0mPaqluvJqSV9duv1aqE9aAH1UVpK7UD2Wg74oU+GgrD/5SpmqE+eECM/RCp/isN3GXb9
	HXDSOr9ajJWLso24oa0kbZpWCZ9bkBUMw71DBHZT60ii/HszsRPN5ffY61iwW616NHiaumXw3C1Jb
	Sb1OZlN/Wfaj0/lxUJDbd9cAfKgcJMZs5fbPZ355jiWzzIFPXrh8Z0ol6HnZNN/F3Xc5ssI43NmjV
	Sg1XRGcQxx2lD8+OnWWcaUswF6tv3BvKsbR9g2qSIh98SprlG5LCg3jW1kFNNjlsI8yal4pTN6BRt
	3TiwA55tRoK9sh6z6aoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0Zq-00DONk-VO; Tue, 28 Feb 2023 14:03:34 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0Zn-00DOM5-Ap
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 14:03:32 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s26so40296038edw.11
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677593007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOSJ6umcOZA5CjUGiyBLVx5qUO7As8SlOyj3YKzeyGA=;
        b=vMEAwTDHGxtNiHIstWX9O4/Qc+j3JpDj8jIp4Ui9bfcB6A3JdYU5/juL+MSluiobSO
         LXQmuxdHun72mIGZejPqHAGjXKPFGBT4tGDwDflwHz1W+T5J4E8hwGur8kNskWZAcFGh
         KhwmqXn23rXf3oatc9zydMto00qyiETBmW1CPKaG7NoHmQULeGFRHGaCh3CRtMauTDUp
         w8KNVdgViH5yMEel5uAM/Y3nMxBrzZemRzM6r2ZuOfNrKvFgVbr3qysykocqp0ogR0y7
         3aIn2ShfFkH+m00LEYfanUhNocfZEw9zH5RhqJJt9w/ffBKN826ZL3E2ytWM86oaeJ5w
         az3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677593007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOSJ6umcOZA5CjUGiyBLVx5qUO7As8SlOyj3YKzeyGA=;
        b=hY052CJrmjDvZ+teIon64+3TJ0LJcSmMbi8zNts1JrTEGy+nQto7ZIkEh1zolC/beC
         fSoeOY8+lr6kBGNS5mMtWtOgjlXfPeZsQ3cNsrOR6bR6tybtRZa3US/9rP9K7wwz2Dm0
         abh6hzZFC0D6W32pafqyzxuxQ0LKxjeURZaBZYbcGz9ku8eJBRi0uKVBYm1i9GEp75Ei
         BOU6d0veabRR3/TlwOs42rAXE4s0Kuo06OtaWbw6HJhZvU2TrOmWx2TfVS6b/iaDHEFe
         kx11Tbx5BV2asily/jZ/KscqACKZof6++C7263DdrSjMURcIunXa5JWQU594CeConiou
         Vu+w==
X-Gm-Message-State: AO0yUKUcU28ELvsq2hRl8jEGctSpvxTJSQVMvSR/F8uQ7BGo5vLWGoz0
	csz7U2+NQC8Li4dqMKQgGevZLg==
X-Google-Smtp-Source: AK7set+dumf3UHtLmRhYjVhZb6oiDxoCBxZsl+O0HoDiARM7jnxwQwI7aKhclSInAOmneYFVjwWZ0A==
X-Received: by 2002:a17:907:3e25:b0:8ed:a0ea:29ee with SMTP id hp37-20020a1709073e2500b008eda0ea29eemr14754489ejc.22.1677593007619;
        Tue, 28 Feb 2023 06:03:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id os6-20020a170906af6600b008f7f6943d1dsm4487936ejb.42.2023.02.28.06.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 06:03:27 -0800 (PST)
Message-ID: <f91f6784-15f5-1911-1101-1fe8147f9a38@linaro.org>
Date: Tue, 28 Feb 2023 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy> <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
 <Y/3hVlp/YPnWHDCX@wendy>
 <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_060331_418412_CA361AA6 
X-CRM114-Status: GOOD (  15.51  )
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

On 28/02/2023 14:16, Xingyu Wu wrote:
> On 2023/2/28 19:11, Conor Dooley wrote:
>> On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/02/2023 11:51, Conor Dooley wrote:
>>>> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
>>>>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
>>>>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>
>>>>>> So the dt-bingdings need to rename, and which one could be better,
>>>>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>>>>>
>>>>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
>>>>
>>>> I feel like a common comment I see from the dt folks is to not put
>>>> wildcards in filenames & just pick the first compatible.
>>>> I could very well be wrong on that front though...
>>>
>>> First compatible is a bit better, unless you are sure this will cover
>>> all such compatibles now and in the future. For many bindings the
>>> family/wildcards were fine in filename.
>>
>> Ahh cool, good to know what the specific policy is - thanks!
> 
> If this watchdog driver is improved to also support JH7100 in next patch,
> it seems more reasonable to rename the dt-bingdings to 'starfive,jh71x0-wdt.yaml'.

Bindings are for hardware, not drivers. One version of driver in one OS
should not determine the bindings...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
