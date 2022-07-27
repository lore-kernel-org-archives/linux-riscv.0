Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F08C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQm6JKS4tWOTn77FLyyaBNG6prHlymGqZIwtz1EGkw4=; b=nrvNNN4DS9JnLk
	3B3xEnfbAlzYRb+mCnjM/ka+ncmZzd/JI8pyLsGZY1YT+Q28V9q2562/eytm6kKl6MtjD7sWVPNDg
	8Y8nBe0PAPgyJthBMu3JRuPs/ims2fMH+nrTqqwsBcmzzautr/r3RAWJF1j0kkjzB6sXqBA35EAj0
	bpimveNn+migL/4kTLXv/VuxqTQcWU9olD0L/gAy1VPEvC/gBZFPbphvexPzEcT+0kmW9J8FNhnt+
	wpNbqpxaZmXypCHEl/skgShVUAuEFS+L7GTPhRycdx+icU1x3I1XHRZPSQvc2ltEJqpBm5xArFDHL
	5ip1j8d1+aIOlyztpD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgGB-00DYP6-Gi; Wed, 27 Jul 2022 12:35:31 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgG8-00DYLn-Cx
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:35:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id b16so14386287lfb.7
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mPe16ekSgX4cb+0KyUQJ019tyAyY1yQvQOxlKs0AzY4=;
        b=ZHcQ/D3C8Iaeab+khKtxzYxEUvc05eKuVkjkkhrSSO7aEqsUhO9M4VLmj7WbeoZ1kl
         6YAlkS1n4T/XQsyZ2PGx9KvpNzRlpsdlhLHNB0E0DdK4PXVUeynwlgSz7VNZJoVe6+v7
         xj14XIcrXUVgg3EgqfbSIHeRwxyE37382kMlOkDnliYliUhaCxDPiJIIZ56gzqvdWCoi
         yBa8CAmt+/4eKnJYs/SjVac9nUBoxoO3EsL1qyFAiVeItzIRIclaDCyBfe1E/ZD8OU6k
         qXV8Zsb4pj0ovXJP0mThmxnVqjzikqo05T7MZzj6ETbaKKQuc92AREKApCxS+E8t46bC
         zsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mPe16ekSgX4cb+0KyUQJ019tyAyY1yQvQOxlKs0AzY4=;
        b=P2uznEpsvliUgfYAmUD64M/FuNeZHlebYBWFJNxvZY94vtz++vGuKRMv+l2+faS4hb
         6M0RfVYFZCensl3O8bHqXYcr2s//slusMw6Lt0FzbNdo5TaYdqqxJE3xz+BFTO3WmvuF
         F/4c0vwDiBFVxIHzjFd83LcFq/wFYvaH76KmHw9gag72Dah3c/t3HGiax5JiqtJQ7VFa
         myyoyklkGe7rmpWh+NZPzRIEeKoCKsfeU5uikCZxIYQD1wWrkznDDE7aqPwMJfDm5rWD
         +YAzoV2pXmisAM6xfoina+WnnZX5xQOLeMf4vlIJFs5nlZgYSVKpL0o2sukSPpgNMpCQ
         4qZw==
X-Gm-Message-State: AJIora/j3dDPjP6jv30/DMf4wZwikWe/kv+2J4w++H1wVbeRF2cAmP1X
	uw1GY8rI32LgKmka4Ddh+yrhkQ==
X-Google-Smtp-Source: AGRyM1vY4KSJURxXvB7KNbE1JbrTT2blNm61Rz8AhaGwD8klo2ZFj2oq9d/saTo3nYqGgr3R82GH8Q==
X-Received: by 2002:a05:6512:ea5:b0:48a:77a6:f9f with SMTP id bi37-20020a0565120ea500b0048a77a60f9fmr7601866lfb.60.1658925326340;
        Wed, 27 Jul 2022 05:35:26 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id p5-20020ac24ec5000000b0048abf3a550asm102806lfr.224.2022.07.27.05.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 05:35:25 -0700 (PDT)
Message-ID: <7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org>
Date: Wed, 27 Jul 2022 14:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
 <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_053528_552503_ACD464B3 
X-CRM114-Status: GOOD (  17.15  )
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

On 27/07/2022 14:21, Anup Patel wrote:
> On Wed, Jul 27, 2022 at 5:37 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 27/07/2022 13:43, Anup Patel wrote:
>>> We add an optional DT property riscv,timer-can-wake-cpu which if present
>>> in CPU DT node then CPU timer is always powered-on and never loses context.
>>>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> ---
>>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> index d632ac76532e..b60b64b4113a 100644
>>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>>> @@ -78,6 +78,12 @@ properties:
>>>        - rv64imac
>>>        - rv64imafdc
>>>
>>> +  riscv,timer-can-wake-cpu:
>>> +    type: boolean
>>> +    description:
>>> +      If present, the timer interrupt can wake up the CPU from
>>> +      suspend/idle state.
>>
>> Isn't this a property of a timer, not CPU? IOW, your timer node should
>> have "wakeup-source" property.
> 
> Historically (since the early days), we never had a timer node in the
> RISC-V world.
> 
>>
>> Now that's actual problem: why the RISC-V timer is bound to "riscv"
>> compatible, not to dedicated timer node? How is it related to actual CPU
>> (not SoC)?
> 
> The RISC-V timer is always present on all RISC-V platforms because

Timer is always present also on ARMv8 (and ARMv7) yet it has its node.

> the "time" CSR is defined by RISC-V privileged specification. The method
> to program per-CPU timer events in either using SBI call or Sstc CSRs.

Timer is still not part of CPU. Otherwise you are claiming here that CPU
can wakeup CPU...

> 
> Since, there is no dedicated timer node, we use CPU compatible string
> for probing the per-CPU timer.

Next time you add a properties:
riscv,saata-can-wake-cpu
riscv,usb-can-wake-cpu
riscv,interrupt-controller-can-wake-cpu

and so on and keep explaining that "historically" you did not define
separate nodes, so thus must be in CPU node.

You need to properly reflect hardware in the DTS instead of such hacks.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
