Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C765FC7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UQvzxKjIli38h2DHxRRSdN0so7/+5iyoyNHXHvA++E=; b=qn2tCnnbqXC+Ic
	jtYTPt1E29RAjl4UZyvh9XhIPHPvkS6dRcLP8QvjAgCSF4y8Rif5cuc4lDS3smonHPKadSBWBkZ2p
	1TUAz4vnWhiOqTbXVgAgiPvgMMmMU2RLzVqiGAoFeCYfz7LwEefJaoeK+A3Zk3a9fCjuHm1LLDsIi
	02/7kKFGV//I/O8O8JzhhoQAL4MCOIgXqZflKe7vZy8d2+ZeMC71xYOxoOG1CdaKTcej1kPbQLQrx
	bGxQU/OthtmFNjgKVMU+zRXlME5/enCy5qWpQCCtq1R6ACHB0RzU0hVPOpUh7YurPxWO7MjZVubE3
	FJNBmWyxTJkW21Aq2Gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxMY-00Chpw-4D; Tue, 28 Feb 2023 10:37:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxML-00ChiU-HF
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 10:37:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so9157790wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 02:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677580642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lKLt5HIsJYb5tC1Ze6Ub0RmLxOUiKi6jayItAZSyIM=;
        b=BTeATDIzH8pSJTPac/KQ21euFT5RmcMyyQTBEhEoJN5VoFwakQQFA9OuLlcJG1QKLj
         Qet0sixga45OLRBGRL/b4NNXBRbPT8z6toZyQmScoXSYk68PuxMsn0P3W1tOslck9B6Z
         ULXmZyhYYFILvvPaUzfsLGm5ffGjgk+exMDz5FRD2EKCsdlrLdd0GRpAy+NDELehJqAH
         Y1FGqFuHkpprnHZDltSyfZBp0e/ppkuI9UPDoXmV1g69IdzrkfkxW/7N7EXkQa9HIzeo
         YnfsdrBzpv9cGw+7RFaEwo+IJ28yGcSqKVgGeK+baEXXenrLjeAOgpfTcFmVl1mqHa8P
         3oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677580642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lKLt5HIsJYb5tC1Ze6Ub0RmLxOUiKi6jayItAZSyIM=;
        b=VuPtop1tY3frj3uq4z1XciOgmGcscZK8BD5AGqVyVSfR5pU+mBvomICfFuypVmefcX
         YtddlWXWXEhwAJuieIlcsnATJ+MTGyC+TIxDexyGp+7Y1dk6Yrng89UlGPR1YstxiEev
         +RJ3DM1VbqhyG5uTNmQdhBiauH3EuWw2PLue+Ea6i0ypAE+7z8Z4QksPb/AHJF23V0s2
         1HTztSjdhz7AAeG33gtjoQkg6P4AVrBWzz2HJ2TRkN6CbjJfVDlvTBuzEqU9iQ/Zm6xI
         pbOZl+01WAFM++DZVOqQ1nIZHfVOo72W9+rs9MB85OpqmK8gw+RpZHa7Mpa2KYYuWFz2
         aWxA==
X-Gm-Message-State: AO0yUKU02jRiCMhHCn6/f0e0PQ8gr7Pbauvbmt0mjcJDN2F6tcFfCbgX
	jbM+8xNbPcqv55jtzjYGDUAGkQ==
X-Google-Smtp-Source: AK7set8qggFOBYVcZUD3defWyyZDeiDIyNcZq9p6rsu+MxCJELx7V2LcYKz+ScO7nG86StUj+oQy8g==
X-Received: by 2002:a05:600c:4fd3:b0:3eb:36fa:b791 with SMTP id o19-20020a05600c4fd300b003eb36fab791mr1806286wmq.31.1677580642550;
        Tue, 28 Feb 2023 02:37:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d45cf000000b002c703d59fa7sm9329642wrs.12.2023.02.28.02.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:37:22 -0800 (PST)
Message-ID: <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
Date: Tue, 28 Feb 2023 11:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, Rob Herring <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com>
 <20230227222904.GC1048218-robh@kernel.org>
 <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_023725_633229_71C2316D 
X-CRM114-Status: GOOD (  19.83  )
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

On 28/02/2023 10:05, William Qiu wrote:
> 
> 
> On 2023/2/28 6:29, Rob Herring wrote:
>> On Tue, Feb 21, 2023 at 10:44:02AM +0800, William Qiu wrote:
>>>
>>>
>>> On 2023/2/21 7:43, Rob Herring wrote:
>>>> On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
>>>>> Add documentation to describe StarFive System Controller Registers.
>>>>>
>>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>>>> ---
>>>>>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++++++
>>>>>  MAINTAINERS                                   |  5 ++
>>>>>  2 files changed, 56 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..fa4d8522a454
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: StarFive JH7110 SoC system controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - William Qiu <william.qiu@starfivetech.com>
>>>>> +
>>>>> +description: |
>>>>> +  The StarFive JH7110 SoC system controller provides register information such
>>>>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - starfive,jh7110-stg-syscon
>>>>> +          - starfive,jh7110-sys-syscon
>>>>> +          - starfive,jh7110-aon-syscon
>>>>
>>>> Is 'syscon' really part of what the blocks are called? Is just 'stg', 
>>>> 'sys' and 'aon' not unique enough?
>>>>
>>>> Rob
>>> Hi Rob,
>>>
>>> In StarFive SoC, we do have syscrg/aoncrg/stgcrg, which is uesd to be the clock
>>> controller, so 'syscon' is added to avoid confusion.
>>
>> You've only added to my confusion. 'syscrg' and 'sys-syscon' are 2 
>> different h/w blocks and unrelated to each other? Or 'syscrg' is the 
>> clock portion of 'sys-syscon'? In that case, 'syscrg' should be a child 
>> of 'sys-syscon' or possibly just all one node. Please provide details on 
>> the entire h/w block so we can provide better input on the bindings.
>>
>> Rob
> 
> Hi Rob,
> 
> It's my description that's problematic.'syscon' here refers to the hardware module
> inside our JH7110, which is different from the syscon interface in linux. The syscon
> I added now uses the syscon interface of linux to read and write the syscon register
> in our JH7110. So we decided to name it that way.

You didn't really answer Rob's questions.

Also, syscon is Linux term, so are you sure hardware module is called
like this? Hardware engineers took pure Linux name and used it?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
