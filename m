Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B6EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVL8yv+SbFz1opecJPd0H/JxD818in2bJdAREjeVLjE=; b=cEXIcvNXCCcTE2
	C8oye6eG8tvlc+4AmP19/EmZpFJRliqhvn3+jxfNhiDNIU+SCplazVGF5Uwv3amTjCcf9XH3JLMg/
	QJrCUOSO+Eaur5bkiixwAitg5imNA6Phj/NqElO6bTRKKoZQSseGEpDoMdTVshLZVdYWe0+Q6LFNH
	XHDP4LymlnTqeJhhsXGfjAc5PWVVbexvGJpkS/tCdw1IlxzLDue3bSGZZ464A88amGPZ6QoE7OVNu
	GDHmHS9oM54/fdqksrk/kHWim4jh9FqeVq/gQueLL9M7WZW0ccjXaXyEOcIM5YnKAI6UIQlJRJeqn
	hcsHgo4z7gveE4A0O5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciqH-00FdmU-1G;
	Thu, 16 Mar 2023 08:20:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pciqF-00Fdlk-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 08:20:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id fd5so4266155edb.7
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678954805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BynrooWKIxkWeQyg7mnmSJ2ueKqYW94JcoiUOzTY5V4=;
        b=vkBiUbvG/+vI40uyHOAzlaDtm41eW8cO0hQ5d/d7/CKQOmZ2ZB7RyW9C3bbzIiF4Pi
         8d0v5MpmyIgLBIrbh/z1TSS1Yd2Ud1QkqtrGdGHS8iZs5DJzIFtnFqsAURZ1JV+JBLND
         wqrkwPNcwJ0hW6jBrL1HKjACeL+s43lLtaJlV8ND+78p+ZHiQzuhGAr9lr5XCUiKMoHU
         DvnjMArYvi0rz6Ah/xD22s62iK1DxRsHv0v0QRsvKV+xmm/K52GWYpLoJ+k04GerG650
         6Id5O6ixn2cmqFWkXAbUMhPPBRqTIH4bs81mhA9aIWHKiRrOF4moQjaepOqyiPV7r1LX
         Lcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BynrooWKIxkWeQyg7mnmSJ2ueKqYW94JcoiUOzTY5V4=;
        b=MsYCwg/JQJND/1oUevb8UnVTvDbAFMLCohhCRKGnrW52y1Sf+x9SMgEKw85/sK7tFk
         wTn1d2Euyg58LVij5LQSfufNb6O2OsnesWrZRhLAJvzoUVSTS362AWWCT1f+bpV1l/3I
         UXDaSlzVqy9GBYUE5vpo+JaYzJWFnQAkBbGB6VJS1D1G+r6I1+ujYthWVmlwrWlhYCiV
         aaGOS6rOXG4N3myGXu3nkGFfhC1NRvkorpsz5OfTlMCPGpfbveS4V4Ug8C1NknNwQWCw
         8V3k9LC/0hweLcdUVKqHgMDZw7iHB9bZmw/+DjpbGQ08lj+LDpZTaIqVpofC6pEijrbL
         Jbhg==
X-Gm-Message-State: AO0yUKXNJlrRKNgs5O0eC0AuBOMdVIL/jz5H/AE76V9F9h0EZjw4FJKc
	Mctt8ACFA61jCONTh/+bDhmkGK4LylHuKQ0DwSc=
X-Google-Smtp-Source: AK7set8dYeIq31oR9827BEvtiAOuEvaOYnqpP/1mG7zuAMx51MqASoiJh2B18rkUSChPrWKIdOuorQ==
X-Received: by 2002:a17:906:ca02:b0:88a:2e57:9813 with SMTP id jt2-20020a170906ca0200b0088a2e579813mr8973409ejb.33.1678954805151;
        Thu, 16 Mar 2023 01:20:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id w11-20020a1709062f8b00b00923bb9f0c36sm3534063eji.127.2023.03.16.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:20:04 -0700 (PDT)
Message-ID: <c716e535-7426-56da-ca6f-51c7d7d69bb3@linaro.org>
Date: Thu, 16 Mar 2023 09:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Guo Samin <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
 <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
 <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_012007_486398_67AEF7CE 
X-CRM114-Status: GOOD (  10.75  )
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

On 16/03/2023 09:15, Guo Samin wrote:
>>>> interrupts: ???
>>>>
>>>
>>> Hi Krzysztof, 
>>>
>>> snps,dwmac.yaml has defined the reg/interrupt/interrupt-names nodes,
>>> and the JH7110 SoC is also applicable.
>>> Maybe just add reg/interrupt/interrupt-names to the required ?
>>
>> You need to constrain them.
> 
> 
> I see. I will add reg constraints in the next version, thanks.
> 
> I have one more question, the interrupts/interrup-names of JH7110 SoC's gmac are exactly the same as snps,dwmac.yaml,
> do these also need to be constrained?

The interrupts on common binding are variable, so you need to constrain
them - you have fixed number of them, right?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
