Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C76C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E10560F9E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E10560F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWJHxkaeDFnWq13CvzyVcgC1FYyyDHaZnE8E7pOopfQ=; b=siEeHdYtQDvLDM
	HjSPG/DrJ5Glq+ts7dvaMpfAId5dvFhodNJFh4DLLHyX/YL2YBQW/pKnQvw3rqfLqhQmDj0NuqSX7
	BZJOxF6xx+xCpbOAF2eV416XIiXeSQQJ+pA+JmMzzsAzHhEWEWap02ljwVdNt3lChE+id0DA6+vGD
	EDvUFZD/WxSjSePMKEIomGujvJeyhC6fzldroh4cIzBIXyizjWMZpq7L3suvnWvdQ4vXiW3DHwVqz
	A69AtkIwpp2gGk0cBgP2LL/EV4VdY+udzKNiHXEKm9gCCKDi1iMyUUuvJDmTeYQ4CgOf8md/Eq0il
	nVKgCiQ93y5AhZ1esgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcN6B-00ETZD-VE; Mon, 18 Oct 2021 07:30:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcN68-00ETY2-Ig
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 07:30:18 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F9273FFFE
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634542215;
 bh=wFXVQ4KEtw8nWvUmZe9/ReIrDj2qrzV0p0234hn1yAw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=TUakONoLSJEVL0hrnWof73bOVJjzIkn6QswUigN2imkl53sUMC9zaLaULXXmbyvvu
 9zntkI8qcg3nAKyP+czLVZn9pc7/41e2dMR99KH1qC8ZiIGUGs27vrnSy7BKqmda4w
 F9DW99J9btEmnfNL7RqKHmBiXsu6yzqTi07xOvfkKvz4GDjDW9Z4qN4OpIbWjIMk28
 7idIwqTNWIp6l9Ovi8ueS3knlpXkCqGEI8mrXQjeLqfQl56gpMUPSfAWJbwVfYv8C+
 QgpUaLvod8+PHMWpaxobcUlTDKMYAg2EDSAW26Z+t6LCWJEpyPo4Ay4xl9kHmdKCRG
 S53vX87R4Ii8g==
Received: by mail-wm1-f70.google.com with SMTP id
 o196-20020a1ca5cd000000b0030dc197412aso2858899wme.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 00:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wFXVQ4KEtw8nWvUmZe9/ReIrDj2qrzV0p0234hn1yAw=;
 b=OvDpIqefRjtSj/Ds7HsWg/00n2g1bBmM7Q1Dg9VNfgTqa3lGXN/ysFQpPe3EphyDq6
 QW6cXOU0f8HesKnT5dHetWa46Kne8MdURP67k9Piox/eoobBtTn/9l8KF3tkf7Xc9eoh
 S+0CLOgu0raqN9jGMi2yAwyjeXSkLRWf1bEcEKTVO1IFBJeJ4BQrbQsFaUD68Nq+G3uU
 eVHKj2Tso+QXH9hfCmuNuqGfEVyWzXXq7Qb3Rp1BIlswkbA9L1yQNehOR4WK+jtYLK3B
 u4RXflYRAVTEntyKpjOX2i2jKbd/bcCp0AZDBXlXUYzBuJYBvybVdJuGsTlbLGbdwVJC
 LfzA==
X-Gm-Message-State: AOAM530rAp8cjWXr1qcO6C2tBHPSNcosnN2pEmVfaNBbKdxxQkf9QdP5
 tr9if36VdnMJNYctg+aHohQKivfJTfXElwyiY0sFBoQN/aMLGVtzlZV/uFOKdKgEcjIVpDupX3j
 u1zSl4YF0abJ+N6OFTtXpGIoFhoFUEj/7N793bfxFXSbQwg==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr30306610wrm.385.1634542214888; 
 Mon, 18 Oct 2021 00:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxun+2EYZRd01wBMtxCIoQaC2e86t9mH9UcN0AyvQbSJarL/g5QoX3ssvsEHJB6Oa38TLHG/Q==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr30306572wrm.385.1634542214639; 
 Mon, 18 Oct 2021 00:30:14 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id w26sm11594434wmk.34.2021.10.18.00.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:30:14 -0700 (PDT)
Message-ID: <7361287f-9c07-8b76-d405-35f287ac1706@canonical.com>
Date: Mon, 18 Oct 2021 09:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 1/1] dt-bindings: reg-io-width for SiFive CLINT
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
References: <20211015120735.27972-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy3JU6jitTWFk4CVRG5Xc7P7ueZzd=xmnKBNpx8eGaR6hw@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAAhSdy3JU6jitTWFk4CVRG5Xc7P7ueZzd=xmnKBNpx8eGaR6hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_003016_866241_23A0B11C 
X-CRM114-Status: GOOD (  22.69  )
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

On 10/18/21 06:33, Anup Patel wrote:
> On Fri, Oct 15, 2021 at 5:37 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
>> the MTIMER device. The current schema does not allow to specify this.
>>
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction. Samuael Holland suggested in
>> lib: utils/timer: Use standard property to specify 32-bit I/O
>> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
>> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
>> in the devicetree schema for such a condition.
>>
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
>>
>> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
>> Add a new compatible string "allwinner,sun20i-d1-clint" for the CLINT of
>> the Allwinner D1 SoC.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   .../devicetree/bindings/timer/sifive,clint.yaml     | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index a35952f48742..d3b4c6844e2f 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -26,6 +26,7 @@ properties:
>>         - enum:
>>             - sifive,fu540-c000-clint
>>             - canaan,k210-clint
>> +          - allwinner,sun20i-d1-clint
>>         - const: sifive,clint0
>>
>>       description:
>> @@ -33,14 +34,22 @@ properties:
>>         Supported compatible strings are -
>>         "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
>>         onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
>> -      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
>> -      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
>> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
>> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC,
>> +      and "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
>>         integration tweaks.
>>         Please refer to sifive-blocks-ip-versioning.txt for details
>>
>>     reg:
>>       maxItems: 1
>>
>> +  reg-io-width:
>> +    description: |
>> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
>> +      32bit access for MTIMER.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    const: 4
>> +
> 
> Please drop the "reg-io-width" DT property.
> 
> Based on discussion on ACLINT MTIMER DT bindings, Rob suggested
> using implementation specific compatible string for detecting register IO
> width. We should follow the same strategy here as well.

Should we create a completely separated yaml document for 
"allwinner,sun20i-d1-clint", "thead,clint0"? Or should we integrate all 
in sifive,clint.yaml?

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>>     interrupts-extended:
>>       minItems: 1
>>
>> --
>> 2.32.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
