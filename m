Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E862C77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0m4dfSU6e8r7ovbdp6dm+ceiSet9XJoXAfP5hVAD2Kk=; b=3EBYRcq9M3x0Xp
	+cBQmnWRKVFmriZ5nrgoHyp0r+2BDRu0b/ybzx+fgBt8UBn9X+yiZBXPhnN01INLTwfaokL1bFvPG
	JV/U2JAiErNxlluW/HneocIjPQ0Gk/10L5Zuyg8F/0sX7vh9BMj10MulzYHivBD5okbEST7kDAHE2
	CFfkTdFNLfTw75MeKUiifq82kdGo9UG15jnJj5RMydw9qpa7S3inWyiVbQkwGMwVcm5poMSgQTbEI
	qpKIFG8lI5tKCuiwex0xnW8T24rD2sC2G5L5yfIH4CrPfzUaZ2YMwO74R/dJHbPVMyDCqKjHcHvgV
	MhxP+So0qV1XsctUPyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puT0s-006qIG-2m;
	Thu, 04 May 2023 07:04:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puT0p-006qFk-2b
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 07:04:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-956ff2399b1so16164266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 00:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683183858; x=1685775858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB0Lz0HLLVPcyaLPlp/1Tbli9T/ik+ZJJZYpGyPb19k=;
        b=rL+vjmWV+x8xgGj/qIy7674T56btUXPlco3nlEmTnvuJYXTNhf/H+69lan22MwZca1
         m+E2YG8S2ZUyACQEjVJ/CaIO47kTPOmLrSC8e7Y8r0JWHipTiAKV5NcoPBVyt4YOl+RR
         R5f1nVm3OAtuuA2XwtuwdDgODxIrVQ4C1m31uu0IpMbyhkoGUTgTuWhxLC6yBSfZlxM3
         PXrdjVl1Xcl6kLVL/yeZUrBP4UvADhw6v/XQXaBJPlR1D7HGS8pAO6RRgeRpSy65bP1z
         uEPQPNWb1VFqnq+dCulHUCpLvKQzJQvCeKMIGaZ/Cmfc6D0qTDRvbuCzaojBPVTeP6rT
         wqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683183858; x=1685775858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB0Lz0HLLVPcyaLPlp/1Tbli9T/ik+ZJJZYpGyPb19k=;
        b=InJQmY0tFOcqAbi9g31CfZXdZsyHrHobDkeLWSApuun+6dIEVSqBeoYGfyIOcAt3L0
         DpTNKxDuBGXxEshYO+mdXExedPSUnCJvkcoWTt6ZN+i5tLf934X+zdzBV0np8Nc3R/ry
         TvaS08BJ5CF4KMV9DrCCUZDPUu+wpvvxw+mYCAchTae8xCYAB5Xu2jtEVQn7/BLCYGTO
         8H58T2j7P08zgdCI7bFcMvg+uYEooyJANsCUU66Bpsw8f3S4JropSGc3M1Gv29H/PWpm
         r9E2DfbkaufqDThor5Jv7wLlsj8O93IlFntrbeG3H5V2uCb1SaUmyMBY3hGD1lgvwOFQ
         9ElA==
X-Gm-Message-State: AC+VfDyg1Wg9WCwybco4vR8cHWJVrcnezTV5QSbrCeVIHhqFFx5txGqM
	rPFnMHE8+RZsP1JA0ffXngnBmQ==
X-Google-Smtp-Source: ACHHUZ7HdVC/fX6Z2X3qPH7Uwk0pK5Q9v2ZJv4B3xZuXGVlL9cIGnAlh+vDNm/3ibLcx4w5x/r4xEQ==
X-Received: by 2002:a17:906:4fc7:b0:862:c1d5:ea1b with SMTP id i7-20020a1709064fc700b00862c1d5ea1bmr5777903ejw.8.1683183858596;
        Thu, 04 May 2023 00:04:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id og36-20020a1709071de400b009600ce4fb53sm9449928ejc.37.2023.05.04.00.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:04:18 -0700 (PDT)
Message-ID: <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
Date: Thu, 4 May 2023 09:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 vkoul@kernel.org, linux-phy@lists.infradead.org
References: <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
 <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
 <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
 <20230425-resale-footrest-de667778c4fe@wendy>
 <663e9933-b9b3-a48f-98b6-2207215a8ed7@starfivetech.com>
 <20230425-commotion-prewashed-876247bed4ab@spud>
 <0b0f9187-ad6b-a1d9-6ec4-beb8989ca731@starfivetech.com>
 <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_000423_844959_6F62F08C 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On 04/05/2023 08:53, Changhuang Liang wrote:
>>> 	};
>>> };
>>>
>>> Add a "regmap" property which is phandle. And it can keep the present child-node
>>> structure. This is more consistent with our soc design.
>>
>> Adding property from child to parent does not make any sense. Didn't you
>> already receive comment on this?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Krzysztof,
> 
> I am confused about what to do next. How to add this power-controller's
> node in device tree?
> 

You just move power-domain-cells up.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
