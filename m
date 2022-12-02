Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717FFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6lrpOitVBqS0ICv8xswoDaQMWKNp35gz3+E90HLJ34=; b=fUDpjWj5g9tL1/
	yYV3EE1gzbVaukr5VEwjdnW6QJwVAR+YqXzvXuFxDEAEt5G5R9iwZpf+cFVWPY8PrU2t8FlGx7TxV
	eTmeShUWQ4tqwMeT/j6ESYdd4ys86u/PsPhjwMWg8fGOZ/ZQiQiTv22nAi1qREmEDRgPvU4rugxcL
	bjm/IhY2OOQ0o+IoSIt9D9sa8Mb7KDOx/vrBOU9xjoCU+LFobG1MyTbiZU3MVooFe/JhptLlMq/Bh
	Bn7qEH3UA4vHw9+7t2K4twBc4Sd3lhb2nw9NHvLG4Cmtqp66UgGJR1koFbYpYDvo54ncLqTeA4EyZ
	th5G4Wi7Ssx6L3x1IFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10zA-00EKRW-6b; Fri, 02 Dec 2022 08:01:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10z8-00EKOx-36
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 08:01:27 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p36so1874266lfa.12
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 00:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myxyATfyN+1auJfJuG3H5dbd93oQNnjh+ve1JpPtApU=;
        b=jY7HCGbEyRP9FdG8tKLmzbtJXZI8Axu41H2Vys9oMDnirag9oo7VWLM4TwWa9iI9dM
         lVb+H7GoEdDbnTqp/nILHCyel8iTyJ88R0P5t8KkFda0CFrc4knMHL7/4hTe6OZ85OCE
         8MERBbP3ttRPfE3YXR48lY8XR/E21hCyyHRJJuCEUjo/Lwglp7Jc95d8sJc60fWqEDra
         dJnnmoYYkBGxGGbbM5OPL+gcLn0o1X6d6GhfHtxlXDnMJwo5SACyWEkcejWhihkb3fUr
         FpbS97VBffF5cZR5YK6sa0xrZetZbPAfkeAvNpRhWxWg5gGD2gSQyz51HM0Uv0gDrL03
         /ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myxyATfyN+1auJfJuG3H5dbd93oQNnjh+ve1JpPtApU=;
        b=XjgPC8MnpN9ggDOOU/GYBWs3UWYKHgTlxDVTU1gUiVVCiwSQBQBTtvPRWxYAmcxmAk
         zpH8vMrvyZc9j4cr58dcSx/Pxme57D1w35tLpudja1r1dhTGV2YvOw2djEtFi8LQ+Zd1
         WWRZssLDdMkfnhqMG3+A0K7yLSLdSUuTJj1FMXrhFVcGgcrMbL9oj/eBqbyVPR+VP86W
         qy74fPWnUSVbSrk1kwI1ekxryGoobTcV+3oGQSQPuSQTAS6bV+nWR8GZ0yBHsnZH5Q74
         XkGc2KWJricUibOzCEcqXRaoF56e5f7FubV2qeucR+TYJy5EK///X/43PseO+hzEb1Ot
         THgQ==
X-Gm-Message-State: ANoB5pnygLr6gzUUnANdPbdXBRIZx09FRFL7jhAOhyh9VoKjPJN0YS7f
	wUCB/IYZuOq8Idy3c3YOJ7XR+Q==
X-Google-Smtp-Source: AA0mqf6kG9n38g0CPH5KhVFXIHW7Ha126mJzbmxKhe6FZ82LqLmbRbd47TptGcuSA0OZG9yXslUBSQ==
X-Received: by 2002:a05:6512:3e0c:b0:4a9:bdb3:9db8 with SMTP id i12-20020a0565123e0c00b004a9bdb39db8mr27055157lfv.643.1669968081531;
        Fri, 02 Dec 2022 00:01:21 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020a0565120b8d00b004b373f61a60sm940253lfv.96.2022.12.02.00.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:01:19 -0800 (PST)
Message-ID: <3a9ef360-73c3-cf26-3eca-4903b9a04ea3@linaro.org>
Date: Fri, 2 Dec 2022 09:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/7] dt-bindings: net: snps,dwmac: Add compatible
 string for dwmac-5.20 version.
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
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-2-yanhong.wang@starfivetech.com>
 <277f9665-e691-b0ad-e6ef-e11acddc2006@linaro.org>
 <22123903-ee95-a82e-d792-01417ceb63b1@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22123903-ee95-a82e-d792-01417ceb63b1@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_000126_205388_7605B73C 
X-CRM114-Status: UNSURE (   9.82  )
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

On 02/12/2022 03:53, yanhong wang wrote:
> 
> 
> On 2022/12/2 0:18, Krzysztof Kozlowski wrote:
>> On 01/12/2022 10:02, Yanhong Wang wrote:
>>> Add dwmac-5.20 version to snps.dwmac.yaml
>>
>> Drop full stop from subject and add it here instead.
>>
> 
> Will update in the next version.
> 
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>
>> Two people contributed this one single line?
>>
> 
> Emil made this patch and I submitted it.

If Emil made this patch, then your From field is incorrect.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
