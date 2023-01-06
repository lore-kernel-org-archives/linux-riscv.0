Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B45C4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLY9jEpd2dQtxzr2RTAYo0GirzL4Cc+tcLpMBJUyVjE=; b=DgO+yjVHaiA4fW
	Ph5Rul290C6SiCEvDh90w081HQ5bH+q9bYENWNbaCop5uvpEuqWkUkA90fy/F5//fbJGfchspkk78
	qc1jd1Ro2WFnUdCJFmMoypGZxCYZ+chkZoan1SDdWdipu5cgJmVB9nPm79DBbTOQud5Xdu14pp8LZ
	8Uz9GyvNWR5aUXls45LwajfB/glnFWE6gJCmCskc6o6TMzimb/TLLoVYyR7K61O1p1dROc8fYCRlH
	D9RXX1aDHucB6eaIUx6m/tKca+EVWCFr0fjX5wzLQOLK/rwnBP27zIJBbCKeB68Tjbz1FSuw4EtcF
	fOI4WdxgwgtPf2gtSWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDm6c-008A3A-87; Fri, 06 Jan 2023 12:45:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDm6a-008A1p-7n
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 12:45:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id h16so1152356wrz.12
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 04:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khPmDzOyxE/W50Ody7PwHzpUcoSlWvXrUU0o2jFfLxk=;
        b=Fvsz5yRrcMX4nxoWRAXgOW27XaqYBWwY/JJP4Fojd5awfjCnzaOBcg5ufYCfqbDjGo
         uriwH7YQ+Go5EIRB9pOhU0M16q5ShJ8HZjF/BzJUMEtBy4eXSbsBrrUtBU9MWxQgAMcD
         TLc8uuMvd3SHIb7wl7LZZ8wT4KB8+CYXOMoGVRveeuBbnImDlUWpVINhGAu24isKgTr6
         cz6bN4U1vkJnY0d9ngCJaMj3QKWdru2dGZtObkMcm7WNXRfDxA/4EAbQTmoVy2Vr+iE4
         hBMHq9xY5COTWPBPdhY+agc7wN2vYeD3HdG7AqGDTRx82Totq6x1B0PEHhPuYONTVnMt
         C6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khPmDzOyxE/W50Ody7PwHzpUcoSlWvXrUU0o2jFfLxk=;
        b=T8kv2df5CpPVDW4kcEZMpVazMYi4kcfciWbfwtsheJORQN587T78QZoGlYjFK4CFse
         FV+ZSSyiyiALp/0bFDC3YTZ0KH554850iDvNAuWpEx8KD5KivpMiY4hKE4FDEzhlpPLh
         Q5eNt5MZq3ujB6BaL8BrUVQJfldDejcCE0/xSH070mDDO8hGEM2cRWElbZIam5jiBE8v
         WC/1DYlc8hn89fVvYTXznw37n429N6tMoNemXmuzZlZzKnSYdBu8XpPOYJroFTjOXZlp
         58l3NLdch5yvKevEfrmHYIeP+7uno1EzQAss4OnX8YcbxTyVYJPMnxfFAe0pVInmw+aT
         Poiw==
X-Gm-Message-State: AFqh2kosOwuNRal6LIM8rXvzolmTWB0+fLjhSBVbjO8EQYVWhGrQvvRg
	qPMT+R8CTY2tH8bs1K0cS24rdg==
X-Google-Smtp-Source: AMrXdXuoIOO5FVUdypctPo2dsGnGrRrAcBI04oxEbt1bBMpKVgLXEnDGKxUhk1TmLa3v1vFVO23y7w==
X-Received: by 2002:a5d:4249:0:b0:276:d612:4bbe with SMTP id s9-20020a5d4249000000b00276d6124bbemr33577771wrr.38.1673009150157;
        Fri, 06 Jan 2023 04:45:50 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm1100348wrz.32.2023.01.06.04.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:45:48 -0800 (PST)
Message-ID: <c114239e-2dae-3962-24f3-8277ff173582@linaro.org>
Date: Fri, 6 Jan 2023 13:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/7] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106030001.1952-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_044552_327020_CCD3193B 
X-CRM114-Status: UNSURE (   7.63  )
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

On 06/01/2023 03:59, Yanhong Wang wrote:
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +

Order the patches correctly. Why this binding patch is split from previous?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
