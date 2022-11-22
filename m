Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68554C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5ET2/+hfQL5xQjQrtgkGKXPv6W5wjloAhqSivKJ4+g=; b=AQeWAdOYeY2sL6
	UHnNQNtuECEc0YNAe+SKIxWA1Nwn4vl3Cfpt/ghTO3py0lE+Esc+qgOeOSHx49+KcQclT4YfAfoB5
	cI2NBdhRLd13GYefccuGdMmrRBt/LS+e7H7eHgsCXpBw8C9gACcJxW2YJbK/KYqzee9K1S9niw+LU
	+OIFOYKH8G9I3hlTmYOEAV9u5HfOenNiu1LXlOmLRDsyIDkDU1vlen2lQ9fBhgASicHMFgKX2jXDj
	Zv6GMQcRv4A66VXE5FZN+Z3bIz2WHWOBzPrW6CBcW/kc7x93UfKx5/4j2Y8Kb1s4FwlzQpWpFz0GQ
	AdI9SdBqSr2JJa9OI4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOG0-00636m-BB; Tue, 22 Nov 2022 08:03:52 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOFv-00633K-EK
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:03:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id x21so17032065ljg.10
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROiJRFMWDKmltgrHblPByivwSoLVeaip3CzL0q3bWto=;
        b=tVJ5OyErcGd/U8v92ZnFn+PabFejPk/Y1WSjawSVVWBJkz4pzZaVH6glIKPcv84bBx
         dD8wLeI3800KDuVDQLy+ViVwMy2GVWDlWhfvuFuRWEA7sl0nqJgVvfeNDqrHR0bvZgo3
         QQsOXoFhPsDBzsiKcqHTlRoK115EORiln7e+y55qzZJ+LcJ8Hnq03bl+/hMmSMq1OUsQ
         Wb/Y38NC7geoLlMuNwGU2qCLkg6nKvoufanq092k/KFpkQv975FZjJjaa50FUb3VpN1G
         4j8+ejUA7qHl4WDN8PePMf6YSsiKElpCojnW9nODUE+PhfJZEOFsq1XcsHZbX9oL1+gj
         EyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROiJRFMWDKmltgrHblPByivwSoLVeaip3CzL0q3bWto=;
        b=25erkf1++fnn+OqVigbbS1BiFGRACZgz45ZMXCd3yZJohh1AAvWP/dfhjSZY1gQUJh
         r9usV5VUAfbdNp3a7KSxI50da1d0td9gI43Ap5GsG74KMYVBpZ0eiYRpRbkVZxedzP2r
         arnhCS7vOdM+VWMyY7IZ14BUUB8Lh2jVw8RNOF2Kq1CXnxA3ZFlZXC/rayQNFZL5TY+k
         n/wylAJYfYV4KgLR6bPGeXLAFVlTH0hPLCFrbwFkXTYNPIiiRnW4ws+gdCnvjw/+/8qx
         UbwSj/7t3aMTxBt+u+DBjxgS2VaOhS0FEEn8jOiRPEJ3riL4AKuFCDjwbiFrvWdfNK6E
         rpLw==
X-Gm-Message-State: ANoB5pmjR0S7VMRppcB/8y1AgAlv9cPdm7uDEbdZ3GaL+NkL/w3wIk0K
	sn9aMD0oFKQrVZMwzOK2DDZfug==
X-Google-Smtp-Source: AA0mqf5RNMyuBUHim4UaWwIPeE2fOHVF8CFH1ko9qlE2UDY+YPdhWLzZZ+CiJHrlpp7t87DPDB34uQ==
X-Received: by 2002:a2e:8e6e:0:b0:277:92e:e088 with SMTP id t14-20020a2e8e6e000000b00277092ee088mr1991756ljk.140.1669104226005;
        Tue, 22 Nov 2022 00:03:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v23-20020a056512349700b004994c190581sm2388863lfr.123.2022.11.22.00.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:03:45 -0800 (PST)
Message-ID: <65323df3-1102-8d95-7c13-80d9756c7c33@linaro.org>
Date: Tue, 22 Nov 2022 09:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/4] dt-bindings: power: Add StarFive JH7110 power
 domain definitions
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-2-walker.chen@starfivetech.com>
 <bc853d76-5b65-676a-040a-edf53034c9ad@linaro.org>
 <98866fec-e88a-f241-bb42-78d33f051f11@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98866fec-e88a-f241-bb42-78d33f051f11@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_000347_521746_9653B280 
X-CRM114-Status: GOOD (  14.56  )
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

On 22/11/2022 08:46, Walker Chen wrote:
> On 2022/11/21 18:12, Krzysztof Kozlowski wrote:
>> On 18/11/2022 14:32, Walker Chen wrote:
>>> Add power domain definitions for the StarFive JH7110 SoC.
>>>
>>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>>> ---
>>>  include/dt-bindings/power/jh7110-power.h | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>  create mode 100644 include/dt-bindings/power/jh7110-power.h
>>>
>>> diff --git a/include/dt-bindings/power/jh7110-power.h b/include/dt-bindings/power/jh7110-power.h
>>> new file mode 100644
>>> index 000000000000..24160c46fbaf
>>> --- /dev/null
>>> +++ b/include/dt-bindings/power/jh7110-power.h
>>
>> Filename matching compatible or bindings file.
> 
> So the file name should be changed to "starfive,jh7110-power.h" and the compatible in the driver 
> should also be changed to "starfive,jh7110-power". Is it right ?

I said filename should be changed. I don't remember what was your
compatible, but if I did not comment there, in means it looked fine.

> 
>>
>>> @@ -0,0 +1,18 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0) */
>>
>> Dual license for bindings.
> 
> Ok, the license will be changed to GPL-2.0 or MIT in the patch v2. 

Any reasons why not using the licenses recommended by checkpatch?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
