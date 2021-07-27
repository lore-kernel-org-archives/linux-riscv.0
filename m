Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C9FC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953CA61042
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 953CA61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHdyBAx4DBpv0mtVhh474mUHdVaCsGdB/caQvarmmGY=; b=EywscyRKaZIR44FZzQNEYgWUry
	VZ1toEA2d5s/yN1KOCKmFmWuNHqrB3Dg4pR94LlND2QWmM7sntbI2jYsQ3w2YtrhU8WoTZdlmkhXU
	iy2Yuo2I4ahIQ1L9WvMcxZwTjXiY9C2R1RfKE/7DD2YEN2OwH05/NnipZoaRpV5PGF+laceA7ZFao
	N4O9XJTbvGEsmjK32bt+h1NrmmcTNn6P8dQz0wsT5WE0sYG/zVwEiRP1Cj6mikoQPxgoEIFjC3Phc
	97udyrHUmwB/vkAqVOM4q+sJ9lUzEdcEXVMo8eDslFE7RhBR9EgRlZBAOfaj3NSZgv9bj44CcHZ/r
	n414+WjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Hdc-00Drt8-9W; Tue, 27 Jul 2021 07:36:28 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Gdm-00DdR2-82
 for linux-riscv@lists.infradead.org; Tue, 27 Jul 2021 06:32:36 +0000
Received: by mail-qk1-x731.google.com with SMTP id b20so11393925qkj.3
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 23:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZodOxH2mi3oVQCgZbHeQ1Z7SEaNLCAQji8pdEN9SFds=;
 b=VWqZ1K7VEeCqADO0lcyNxpZAtCvuDbxYnXe/umnQYXFTEU2Q3/5SRXKGUPG5yZGA/F
 fUzFX5UI02FBKI/E+1OslEFh+gkpbahMpM1bEP1zYkewuW8f5hEu3cIrLR06rHDd/KH5
 Qsx2ttP624HUmtVTlT0+h4apaFiSw+/M2539iJW96pNnHSNivMPe7BPReZZ5IJ77T1Sj
 ilhMv+PxwRu/cbEmReNpO0VqXpsd2w6zKKCdlXoURxsb8mEdY8WKDwn6aCKzcXtI5zas
 o52DOIew7NRlI1k4bgdZ6KEw92WXEKPvuJmKxmjTCyleRY9wb8SY/kYfMF4vIyynKMkU
 r33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZodOxH2mi3oVQCgZbHeQ1Z7SEaNLCAQji8pdEN9SFds=;
 b=XJCwfxjg6npC8+8o7z+ifhKEVLMCUYcnyWZaaLSdnnCgeyBSdntH8YgP1/NDLLvxPK
 UsC466hQxrb5lOt/cZoHaHzepQq6KkFBS115csxvlHq1/WGBnCytdaA57b5FhneP2bCf
 fhZK93CrdFYlCb/I3rlAnngKs2jDeOqufEtY0xkBmkDS1W3vdR+a4olM0UtVvnujRurb
 bLpMHC/ip/xrgrGUCFT22llbXucJD7a+3fMWzTrJUhQB3ZQqKWMpC1RfNsSwf6b90ep1
 hkk9JnodTnkJDfREE9elbYf0k++Daf+lAsdgDprLBqR2Y/HZDpXL49OGwgIQwzMrKINX
 PflA==
X-Gm-Message-State: AOAM530115gB9UMlSDR6c+mAcGZ5Y8LELkG5QOJkNnsR9Ajh54GwxiHZ
 lmo53yLKAQL1mfyVsVfPC8w=
X-Google-Smtp-Source: ABdhPJwzRlk7guZzCPjW8tkviOhayM0/Oinn+yB/k8dcg0RGIfF01sY4KWBtXJCQ9kyRWfQA9KqzTw==
X-Received: by 2002:a37:8504:: with SMTP id h4mr20860646qkd.85.1627367552216; 
 Mon, 26 Jul 2021 23:32:32 -0700 (PDT)
Received: from [192.168.1.201] (pool-74-96-87-9.washdc.fios.verizon.net.
 [74.96.87.9])
 by smtp.googlemail.com with ESMTPSA id r13sm1033279qtt.38.2021.07.26.23.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 23:32:31 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
To: Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra
 <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Bin Meng <bmeng.cn@gmail.com>
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <20210618123851.1344518-7-anup.patel@wdc.com>
 <20210712192207.GA2322460@robh.at.kernel.org>
 <CAAhSdy0=aL+N7fLD4+b0u3j3zj8+xYOFH_WAu3N8wFkJNxFqrg@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <5c00f06b-e29e-2c2f-e5e5-dff9d92fa3ff@gmail.com>
Date: Tue, 27 Jul 2021 02:32:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0=aL+N7fLD4+b0u3j3zj8+xYOFH_WAu3N8wFkJNxFqrg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_233234_388525_DD821D2C 
X-CRM114-Status: GOOD (  31.33  )
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

On 7/13/21 11:27 AM, Anup Patel wrote:
> On Tue, Jul 13, 2021 at 12:52 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Jun 18, 2021 at 06:08:46PM +0530, Anup Patel wrote:
>>> We add DT bindings documentation for the ACLINT MSWI and SSWI
>>> devices found on RISC-V SOCs.
>>>
>>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>>   .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
>>>   1 file changed, 82 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
>>> new file mode 100644
>>> index 000000000000..b74025542866
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
>>> @@ -0,0 +1,82 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RISC-V ACLINT Software Interrupt Devices
>>> +
>>> +maintainers:
>>> +  - Anup Patel <anup.patel@wdc.com>
>>> +
>>> +description:
>>> +  RISC-V SOCs include an implementation of the M-level software interrupt
>>> +  (MSWI) device and the S-level software interrupt (SSWI) device defined
>>> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
>>> +
>>> +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
>>> +  specification located at
>>> +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
>>> +
>>> +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
>>> +  S-level software interrupt lines of various HARTs (or CPUs) respectively
>>> +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
>>> +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/interrupt-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - riscv,aclint-mswi
>>> +          - riscv,aclint-sswi
>>> +
>>> +    description:
>>> +      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
>>> +      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".
>>
>> The schema doesn't match the description.
>>
>> There's no actual vendor implementation yet? You could do:
>>
>> items:
>>    - {}
>>    - const: riscv,aclint-mswi
>>
>> But then your example will fail.
> 
> Is it okay to have optional vendor compatible string ?

I think you can express this with something like

properties:
   compatible:
     contains:
       enum:
         - ...

> 
> Vendors can add their specific compatible string if there is some
> special handling required. If there is not special handling required
> then the two compatible strings are enough.
> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#interrupt-cells":
>>> +    const: 0
>>> +
>>> +  interrupts-extended:
>>> +    minItems: 1
>>
>> You need maxItems too. I guess this based on number of cores, so just
>> pick a 'should be enough' value.
> 
> There is a limit on the maximum number of connections between the
> device and HARTs or CPUs so this will be the maxItems over here.
> 
> I will update this in the next patch revision.
> 
>>
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +additionalProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts-extended
>>> +  - interrupt-controller
>>> +  - "#interrupt-cells"
>>> +
>>> +examples:
>>> +  - |
>>> +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
>>> +
>>> +    interrupt-controller@2000000 {
>>> +      compatible = "riscv,aclint-mswi";
>>> +      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;
>>
>> interrupts-extended = <&cpu1intc 3>, <&cpu2intc 3>, <&cpu3intc 3>, <&cpu4intc 3>;
> 
> Okay, will update.
> 
>>
>>> +      reg = <0x2000000 0x4000>;
>>> +      interrupt-controller;
>>> +      #interrupt-cells = <0>;
>>> +    };
>>> +
>>> +  - |
>>> +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
>>> +
>>> +    interrupt-controller@2100000 {
>>> +      compatible = "riscv,aclint-sswi";
>>> +      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
>>
>> Same here.
> 
> Okay, will update here as well.
> 
>>
>>> +      reg = <0x2100000 0x4000>;
>>> +      interrupt-controller;
>>> +      #interrupt-cells = <0>;
>>> +    };
>>> +...
>>> --
>>> 2.25.1
>>>
>>>
> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
