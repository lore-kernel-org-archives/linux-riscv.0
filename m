Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE0C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/o+4aRCELDf+4eTun7Bv+p6JGR2foMg9rsNFB6eomRk=; b=GtPYp+snRlLWLt
	mrmOmnqWDSY78kOoDCyinVMsGlu8voWFBbf8MFgUBy+jnhhO55xQF/EifxIrIBoJKteu/cyA1yv5F
	1TSTQFRT7wWV9lRmGm3cU0dBz9ipiod5s8SFuYzmgnMcAH5E5mvLG0z22LefzjALzgQzd7Tpu6cVH
	6CdQzSXwpya1lId8WyWVtvJAXQbFDJJYreerqghhABIvAXMB50J4BrVtWnYRBhOI2uBTaOgnro76r
	EqJaPFvqBoKrwd0fBt041+p47ercHYvL6eooMOrjKjvJYBu4QBTPU+0X9hFJxCkipr1GO53dxkzn9
	aZ3Gac4zyBOiDLX7MJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3Mk-00HOSS-Kn; Wed, 18 Jan 2023 08:00:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3Mh-00HOQv-OY
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 08:00:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d2so12906176wrp.8
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 00:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JHe7Mld7ca44zxKnapswWL8ppqp7gV/qk5d9Nzoevw=;
        b=KTEP6I1p+vMcKWOb9+hnvxwJhNZClYy3mVLwvEaRmwrc3+YVVJ1SuxIoRZsnnhmQGi
         /GnHcl1skgTY8B6z82bSuqdRFdYIel+Vg4WEEaP2iYUO4GnHRCa6P74G3zU7IPS1VyGT
         I8WGfAj5FAoWzLc2mcs0ibz3ops67DOkZLXOJKYrpuVfP3vuGc0qCAEespNvrpu5AYGJ
         Ldw/Xe/+zQtjzYJ/iv/riljurmbyz8fdRyf6p97zA0RBzok1XbAK6MqXtC1YSmuKwlPs
         6XZXTBfV9oOVt02092OtdJZLlEDuUVXCc8B3UksAff2U5txyp0T/VH1e6N2Wi9r6EYKt
         Z7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JHe7Mld7ca44zxKnapswWL8ppqp7gV/qk5d9Nzoevw=;
        b=CjhFiUbKKby0XLCWb15Zm97X6xAOJ6iS+VqulM6t1pt5r+9JTLOde5zO1jFSGnYmAR
         SRdi+apK9sIh+RpCQ5RcNZkCinvq/oDdaCp4kweljP9cSTQAKekK/iBi13fc+llY80yK
         pIIjQAG41UYFxffFb4ahfOiiVTg/XfghW/V5VhKfsw8OparOH9qWvT/ugfCxcg3Bj9qD
         cDWNn36TOTY5WTuuq+uawl3foA31IV/zMULasowTCMZK8LvZYCh40Oy3O55SpqAwol5P
         Hl1ZVkpmUKl/JJILaWK6K3h7HcK9Qi6i0Ize+oDYGLIaF40UImrQOwDiiBV3QtJ9KDWY
         6pxA==
X-Gm-Message-State: AFqh2krUQGO6wz2Qpyl8+2KwhNjncpbnnoaAL17DCfN1HrkmNXqocEBP
	/cAOcUTBi1c0Z9HdqnloNTgr3w==
X-Google-Smtp-Source: AMrXdXuEmKllwaiidwPgTn+Gamv50gFRp4dBCIpq9KI5N/ug614mLjZGjAIslqwj4xHNNfCH7W417A==
X-Received: by 2002:a5d:6a86:0:b0:2bb:e805:c1ef with SMTP id s6-20020a5d6a86000000b002bbe805c1efmr4981345wru.52.1674028807988;
        Wed, 18 Jan 2023 00:00:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm30387327wrz.32.2023.01.18.00.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:00:06 -0800 (PST)
Message-ID: <787bb142-1ade-bd48-1f6a-0da992add3d3@linaro.org>
Date: Wed, 18 Jan 2023 09:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/7] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-5-yanhong.wang@starfivetech.com>
 <c114239e-2dae-3962-24f3-8277ff173582@linaro.org>
 <9c59e7b4-ba5f-365c-7d71-1ff2953f6672@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9c59e7b4-ba5f-365c-7d71-1ff2953f6672@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_000011_847416_580E8E90 
X-CRM114-Status: GOOD (  13.36  )
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

On 18/01/2023 02:45, yanhong wang wrote:
> 
> 
> On 2023/1/6 20:45, Krzysztof Kozlowski wrote:
>> On 06/01/2023 03:59, Yanhong Wang wrote:
>>> Add documentation to describe StarFive dwmac driver(GMAC).
>>>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 113 ++++++++++++++++++
>>>  MAINTAINERS                                   |   5 +
>>
>> Order the patches correctly. Why this binding patch is split from previous?
>>
> 
> The previous binding patch was considered to be compatible with JH7100, but after discussion,
> it is not compatible with JH7100 for the time being, so the name of binding has been modified
> in this patch.

I am not asking about name, but why this was split from the patch using
the compatible in the first time. This does not make any sense. Please
squash.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
