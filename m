Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17DC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AT47ywMQt2rIIGGfML2vMt+W7bkTwM0E+lzz/wWYltg=; b=dYe/iGGILHMmi2
	xtq0uAnwUwf2+aGhzGjlih5DlYAP9vUPpk+6zLTf6uoE99OmQH49JgE0pzVQeqq/0B7wEn3BLy85N
	S1LqKnb9bpfqIf2l+oFA0yna+PH4yEAxBJRHbhPGWJAZBsdqMFBbtXeX1D5qtgUH1hBleeRCLilhl
	3XK20hmPfaEoTDN1fDaZFkmCusu6OM6khHQijSV+41Hxve5plKa9FE6NPJU6pQ0Xp66KC/ZbgQfSD
	FaKNEEJvMBfl7mtDKVec3qcIrHDQHe1ySUbeUyW1zbqcVcA4tmaEUKXn22LAflogxGfriGVQ0d/lm
	PjR+XPY5zslsHCKsUIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSqM-008LCZ-BP; Tue, 21 Feb 2023 13:38:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSqJ-008LBv-CB
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 13:38:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id b12so17308369edd.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEKp5jxwSSp5xv1BprgYnfrSsvOH2oqVyu+hm71G5FA=;
        b=rF//HoJWLXcJthbLa7TIgEu0wOI//lZV5cE0z6TSi9Y6/DlAjSo5YbZr7OY6zwoYLz
         qeVptqcYvdbsYz9VXWMyaE5v36tGYKkcZjB5uL9EuLDgLa6Vr1jag1FrA2l/5wfHliSy
         fKD+js2T48YSBcQHmUBandzjMDsgwrKygnlgcS253My4hKbaGrb06xcDmE73J/tTaSox
         k4DtJkZNxsCpBBQJkbhClsEBwnEdUgJkeKhIBg+7bH2VlgjMNNAEGolcGw+OWIo3kOrI
         imH0de/B61hXN7ngislSUdcsfLHyaDfXDs75LxdH05EeRdZgVtz3a2i5XV3eNVBopREu
         A8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEKp5jxwSSp5xv1BprgYnfrSsvOH2oqVyu+hm71G5FA=;
        b=wTJAU+IKLfBghxTMOTG3Dyu/lxEq/tZxtKyfP5tNrm+aKW8OHb8st7VanUdQ66IWFP
         z6gJTcfX2dVrAW1v63fIrm1tlaSjiLGJD4127aj/bXKSvmSvxymK16Wt/L6sW/d/z8fm
         85o8sdQQwOslOLpxVaXC+B6MX6TkKoaQCG5ygLXGIYSQTUiiLfb4YEnzd5SFNi7Fx9bB
         B3csCVHkzPARvlkCcMu/sWwBZPvRmLzT7PIr4WZeFpFPy9xgHz9RnmLmXvmairqYqXUk
         lWtxIGZD9Ve4Bn5bs5dqW/IEGe4JzLBwXMncJ3x/RHO19sv91O4YKH6i3VUhHQVXcnVY
         6RVw==
X-Gm-Message-State: AO0yUKX8Agrg2cP9/E7Yu1RhAOwrZ2R5ydztPUXs14b2TGkOSKxo0vDO
	pVwE40koQuHxt1GhBLn+SD/VXw==
X-Google-Smtp-Source: AK7set8b68dqxaiVXuJPBrEAexAK6vPXVsKEK7Ugt5Ougrz5aWPm3HYk/qg14MA5JIqtzCnZml+91Q==
X-Received: by 2002:a17:906:490b:b0:8b1:3a8f:a51 with SMTP id b11-20020a170906490b00b008b13a8f0a51mr9970495ejq.15.1676986681679;
        Tue, 21 Feb 2023 05:38:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r27-20020a50d69b000000b004acd14ab4dfsm2262994edi.41.2023.02.21.05.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 05:38:01 -0800 (PST)
Message-ID: <ae468e63-d8d3-dbfb-64da-75a147e1cd2d@linaro.org>
Date: Tue, 21 Feb 2023 14:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
 <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
 <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_053803_455208_5F73AF8E 
X-CRM114-Status: GOOD (  14.68  )
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

On 21/02/2023 14:01, Xingyu Wu wrote:
> On 2023/2/21 19:25, Krzysztof Kozlowski wrote:
>> On 21/02/2023 09:33, Xingyu Wu wrote:
>>> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
>>> on the JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>>
>>> +    };
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 93eb504c3b21..2e70c9f21989 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>>>  STARFIVE JH71X0 CLOCK DRIVERS
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>>  M:	Hal Feng <hal.feng@starfivetech.com>
>>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>> No improvements here. You add here new bindings for one device and then
>> - without explanation - add yourself to all Starfive clock bindings.
>> Either explain it or drop it or move it to separate patch.
>>
>> You already got comment for this.
>>
> 
> Sorry, I didn't understand what you meant before. Now my understanding is that, 
> If I improvements JH71X0 driver no JH7110 driver, I could add this here. Right?
> 
> Is it OK if I do it this way to move it to separate patch like this?:
> +STARFIVE JH7110 STG CLOCK DRIVERS
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

If you want to be the maintainer of all drivers, add separate commit for
this, so this is obvious. Or at least explain this change in commit msg.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
