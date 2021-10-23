Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881C7C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 00:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A40B60C49
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 00:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A40B60C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KNWlBBPIttrP82x2nh3ZUsMs1wA5R6aPh1P2hNf0Ng=; b=qWZXaqoYvzhQS3
	n2huJmjQ6iXn+pzRfM/0s6Oaaw2tYr07sZxUpaLeJO4JI+pFZkSlhhYvcD9Q+XtocwvSK98HYys3E
	YnaTX7l7vIk2b5FVnOunr4CreBQBw0/Gl603uAoofxWL2aur0p1AAdre8MNJbDO+pkWr4qhe5sxGV
	NJvcFThl0MfFhruIhz91nFc3W+6/5dKuooFSNgfWyKZ/xNrKpoeMtldGw0LaqfuWSEJLlvHN8Dcva
	xZE2GeTgS9Vpa6szFtjkbhE6GnMBwlxq9Qba+hYrN/NconR4vZmAXm8nlRxmvyzpzmVUtgkfBWTDz
	2xQ5in8YnCVcsC47Cd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me4VS-00C9WJ-Je; Sat, 23 Oct 2021 00:03:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me4VN-00C9Uo-Dk
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 00:03:24 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E40C402E7
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634947394;
 bh=XUfcmdIiHP0nbLBuvoKlNVwHtrOEgTh5qPjTylX+Xt8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=iL7jHtxartRcssf3q/vpY9COqvftBSFZMYTXUdfFCtTHGSFMWTq31kKzGqDUxG34C
 XgsZ2zbo1S7u8vjoGGzGPG4VAze5Fl2DMPYa0irZECxWlSYoByXdq5LX7M9Gg1EnMt
 qoDtBeF1agk6WgwNnevWdv/RP0fuc4EINa5abgecZsmcbPdFkUxa93iSs72hsAURUZ
 cVZL4pencx5NGO68PDWC++e7eIvyYuUifBnuUcMvtkNPmmk2PpdNxcJjp1L9y0iPsS
 Rx3T8HHR5BuAp08fywj36XjYBfVKMQ39Iad2c+zq3j0ObPN5RpIIGO4xA6t4i8ibab
 DcY+1bbrleL4g==
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso4714335wmq.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 17:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XUfcmdIiHP0nbLBuvoKlNVwHtrOEgTh5qPjTylX+Xt8=;
 b=7QtcYYE5slzHEbt5eJR6VkbeB1LaeurQTWhmnyNEbKv//8kbxOVs/tKzALCU9arpUD
 KMpMpwnlYY+pttY3tyeSK8nypIM2ENN/bHeLyJYtU43xFGWe1Nl3Obhb53TsRQAKislb
 ZWX2SeCIpQ/8M8lczm+XMrLKozA4HmSsEHDMvN3/aeX4TKrPPFMaonEcWbToemdWW7St
 oQ/BmsyeY8Cy8hSwMApAGpVT4NUBAw3uW/+p93ihMnpdAXm2jSw5onUgDlxDGhc5kXOC
 0RtBVJeZZ99TspGU4JZsEkTsee4o1v3rQ3nSMDidZYa75r/lAwovrdva7Q9HiiQDYAJQ
 kILA==
X-Gm-Message-State: AOAM533ehJE5nfltgNYP6iJXz20OQNqkAmmz3sm//9pc1lseYh8I/8RC
 3UHD2VRsIQCvvOaRunujAF6uxbzxthpY6EJJqrtELM9BjXpFTJyif0EhWejR/dSrQB/Ac3a392T
 Gd643vztupGIg1n1MOFPHKcKJ/Vz1RYksp6PH4FOAEXIolA==
X-Received: by 2002:adf:fccc:: with SMTP id f12mr3804393wrs.208.1634947394133; 
 Fri, 22 Oct 2021 17:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7/oKz0tgyj4UYNQC2NoolgI+FF+Jp6VqF/7vU92xkd9q+CO9Gla8aTbLNFqjeQM7R06FKpA==
X-Received: by 2002:adf:fccc:: with SMTP id f12mr3804372wrs.208.1634947393940; 
 Fri, 22 Oct 2021 17:03:13 -0700 (PDT)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id a16sm9182038wrp.14.2021.10.22.17.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:03:13 -0700 (PDT)
Message-ID: <6d642c10-27b1-72bd-a38e-f966ae8831f0@canonical.com>
Date: Sat, 23 Oct 2021 02:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Xiang W <wxjstz@126.com>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, opensbi@lists.infradead.org
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <YXMriYWcOcgJSpKj@robh.at.kernel.org>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <YXMriYWcOcgJSpKj@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_170321_644138_7B40A3B5 
X-CRM114-Status: GOOD (  24.90  )
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



On 10/22/21 23:22, Rob Herring wrote:
> On Wed, Oct 20, 2021 at 11:36:03AM +0200, Heinrich Schuchardt wrote:
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
> 
> T-HEAD uses the same versioning as SiFive? If you use version numbers in
> compatible strings, the numbering needs to be documented and correlate
> back to the h/w design. See [1]. IP release numbers for FPGA IP for
> example. What it should not be is the binding author making up 0, 1, 2,
> etc. versions.

The only publicly available information on the IP block is:

https://github.com/T-head-Semi/openc906/blob/main/doc/%E7%8E%84%E9%93%81C906%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf

Page 3 has a version number for the whole document. Chapter 9 does not 
have any version number for the CLINT. So should we simply call the 
block "thead,clint" without any version number?

@Guo: do you have more information accessible?

Best regards

Heinrich

> 
> Rob
> 
> [1] Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
