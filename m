Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06088C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:43:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB50A601FC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB50A601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byTzfIkjDipBIIhGaLShoGi6d89bcqTAj0rAGbGqvuM=; b=cKvPxAxfmoU18j
	TXip8VPoowlIqDKPwognvAPvzyWa49EyBQwGANpIA5XkzHD9fSvtUkUeE+Ahq75y/Nz3HV65o6UpF
	6RFZzfiNxaBnM7TI67K3sT+bWpoOUlI7/qaSQ50o3zAb+9D8xzI5NkcM1m+Nf8PtfNuZGmfG5f6VM
	t+1WkcmF05dEyD7CaZ8Fm1/V8gG9X/Hf09aqju+8qjik/ivohkO6jgc5LwNCDCFVZe7YcQgxBrtj8
	n4E1QRveJsQY6rtXNWnoI8kA6McTknHOC5i3x4scovbViF+9DRIKcEXpyiP568CsP7zYMU+e0O/ga
	AGupzNb0O5Lr4Qv1Ydsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9zt-004MJT-1i; Wed, 20 Oct 2021 11:43:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9zn-004MFW-F4
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 11:43:02 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 816413F4BA
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634730175;
 bh=tdDpH01uDMaig+FuQ9PM8Nx6u5iJw79tILyhirsrWXQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Btif3CdhbSObdGakPCnM4eRUrCg0Ch6YN/wC3x/QlODfQV7mxiFrSRA0EqozpyhUw
 RdDQ8MdtWUHuXwxJmx9wVJ+qiXZCWvZNANdvFKbS1EfA2WxuhJN2v/Oz+ywRP+6I9r
 zU4756dFsBJbEwv5L/hvAjbIvMGw/Ch1C4PRcpLjX97d0arnjbT/VVJ3D61OyXnvMv
 ScGIbyr1pTAW54QvzqMr8GmC5qbTISDZO/Wd2Nfg6omCNya4FRje6PNeVocNcACBCO
 48BxVlqD2rgFcm2+QH0sy7VFHotDn/3qorOGsMGrEMiSEjtEyzVjDLBtAg4HXcbCRG
 u5wiQ6l5VYc0g==
Received: by mail-wm1-f71.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so4059538wmc.2
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 04:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tdDpH01uDMaig+FuQ9PM8Nx6u5iJw79tILyhirsrWXQ=;
 b=fhS1vizD5wVXPMhv+ypzHvJvg8dcMB3w0gt1D609leevoCtUQGt/dy4ax80ZGWVXok
 W7p9OYkwtumo8eNn8vr11YJhdBsRtvEW9kmroAeNnyqGXd5nwzyM5EBbZwR/qFjyVINn
 m+EWv3a0OvWtXyNE3E+pyXOmxlcCMaAe8i4o+U5PHbY2hh/JD+rK/V/c4EKNCgKoj2ma
 WKbMgvVZugSYynNPxGeMC+xicyNwdZv/dUjlgSQQIURWe5GRBTf/xkYBJL3ZsmWEwt7U
 7/MaFkUXSeoVNlAAkjeIqyhrn3udNGRAQPXh+8NcGqpBhI1nRC4sVvtAwtAyClo5+qfA
 GaKA==
X-Gm-Message-State: AOAM530+1nkG02nMj2FKMfkIGOa5qfUv2/RSNl1Mx/7VMQhoOZ94Vttu
 wEzp+/heRnn/xvFnfOaTVPn5+ipjZlPuMYg21XmY+0BodPPPm1RGGTRcDryJ4tSCy3OxOBK7wD/
 S3o/sJqoHLVgtO5hEyuppLgfCRuVgE8zvaDPMzaEaeTXAgw==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr52558024wry.296.1634730175194; 
 Wed, 20 Oct 2021 04:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTYsmDUEoSmOgGfRQuvGXjp4xEXc4RGTmMWLib1J1UD0fvSL7a7UiTabgi/AyDkMpNJ682wg==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr52557999wry.296.1634730174949; 
 Wed, 20 Oct 2021 04:42:54 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id z8sm1830913wrq.16.2021.10.20.04.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 04:42:54 -0700 (PDT)
Message-ID: <ff1fdb31-d739-ee85-9ce0-8386065e297f@canonical.com>
Date: Wed, 20 Oct 2021 13:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Xiang W <wxjstz@126.com>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_044259_723361_85736CAD 
X-CRM114-Status: GOOD (  29.80  )
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

On 10/20/21 13:27, Anup Patel wrote:
> On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
>> not support 64bit mmio access to the MTIMER device.
>>
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction and the "sifive,cling0" compatible string. An OpenSBI
>> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
>> is generally used in the devicetree schema for such a condition.
>>
>> As the design is not SiFive based it is preferable to apply a compatible
>> string identifying T-HEAD instead.
>>
>> Add a new yaml file describing the T-HEAD CLINT.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> @Palmer, @Anup
>> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
>> this should be changed.
>>
>> For the prior discussion see:
>> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
>> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
>>
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
> 
> T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
> registers are totally allowed. The RISC-V privileged specification does
> not enforce RV64 platforms to support 64bit accesses to MTIME and
> MTIMECMP registers. Also, the ACLINT specification only states
> that MTIME and MTIMECMP registers are 64-bit wide but it does
> not enforce platforms to support 64-bit accesses.
> 
> Here are some discussions from tech-aia mailing list:
> https://lists.riscv.org/g/tech-aia/message/115
> https://lists.riscv.org/g/tech-aia/message/119
> https://lists.riscv.org/g/tech-aia/message/120
> 
> In other words, the T-HEAD CLINT (MTIMER+MSWI) is compliant
> with the RISC-V ACLINT specification.
> 
> I think we should add implementation specific compatible strings
> for Allwinner D1 in the ACLINT MTIMER and ACLINT MSWI
> DT bindings.
> 
> How about including the following two compatible strings in
> ACLINT DT bindings ?
> allwinner,sun20i-d1-aclint-mtimer
> allwinner,sun20i-d1-aclint-mswi

If the Allwinner CLINT is sufficiently compliant, this makes sense to me.

Will there be a new round of
[RFC PATCH v4 08/10] dt-bindings: timer: Add ACLINT MTIMER bindings
https://lore.kernel.org/all/20211007123632.697666-9-anup.patel@wdc.com/
were you could add the Allwinner device? Or is that series already merged?

Should the riscv,aclint-mtimer.yaml file mention that there are 
different access sizes and either state per compatibility string what 
that size is or provide a parameter for that purpose?

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>> ---
>>   .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
>> new file mode 100644
>> index 000000000000..02463fb2043a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SiFive Core Local Interruptor
>> +
>> +maintainers:
>> +  - Palmer Dabbelt <palmer@dabbelt.com>
>> +  - Anup Patel <anup.patel@wdc.com>
>> +
>> +description:
>> +  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
>> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
>> +  interrupts. It directly connects to the timer and inter-processor interrupt
>> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
>> +  interrupt controller is the parent interrupt controller for CLINT device.
>> +  The clock frequency of the CLINT is specified via "timebase-frequency" DT
>> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
>> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const:
>> +          - allwinner,sun20i-d1-clint
>> +      - const:
>> +          - thead,clint0
>> +
>> +    description:
>> +      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
>> +      the T-HEAD derived CLINTs.
>> +      Supported compatible strings are -
>> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
>> +      and "thead,clint0" for the T-HEAD IP block with no chip
>> +      integration tweaks.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts-extended:
>> +    minItems: 1
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts-extended
>> +
>> +examples:
>> +  - |
>> +    timer@2000000 {
>> +      compatible = "allwinner,sun20i-d1-clint", "thead,clint0";
>> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
>> +                             &cpu2intc 3 &cpu2intc 7
>> +                             &cpu3intc 3 &cpu3intc 7
>> +                             &cpu4intc 3 &cpu4intc 7>;
>> +       reg = <0x2000000 0x10000>;
>> +    };
>> +...
>> --
>> 2.32.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
