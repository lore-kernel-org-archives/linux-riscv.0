Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B531C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je6sevpbnZEwaX9xHv1qy+dbvWupFn2BhKGWtD3Vdj8=; b=E1X/BCtKBYxbxT
	+6TgB1Yn0bMi+YY8TCf405+z/v3+jk79Quz4ZnSwOI/w+PQ+MuBg7RS04PK602DsSIb2kc0CkHI2r
	c+gqc7ZvfD2iqFLOYy7vQWbJfJ4SZjqxT8V8819lPwoDiJ9YHe5otj8WFE9f1fXodvWoaRsC1ejNk
	WYrmLEuveqWcaVuhCvQQMW5V1SXBl9XpEZUcwvca6yL3MmzXrVPOAUWyAqnARrQXsrwRSNhSi/w28
	DzzF2Ua0MLT+KCTN4U4BMTeEFIIpt5ooJLuEezNH3/YbayReuFLf03yjy3xFM9eSvmzFnk4AcVtWD
	BEwBVc1FjKF0ymh4fkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p034S-009vzf-Vy; Tue, 29 Nov 2022 16:02:57 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p034I-009vvc-MK
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:02:48 +0000
Received: by mail-lf1-x135.google.com with SMTP id j16so22702703lfe.12
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 08:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13+qbJOmWTqxbFOdDOLgCT6uW4S43S5+kJ0NK9uACko=;
        b=eFbk+HGJxPawBYhTluxHbS2J74enMGNbBWPwjZnYQ/CWkejbCh/CQwm7RT79kNoj4V
         26fei0JhV0J1NsodfAftlgIIS7xDdt/QA51zN29aHc/+AnUmU7cYMno6t72DjXbtdjfC
         jonXr6tyqeXSXj17TU1/lroRd1ZFQebUiNEHvRw88JSpFwClmZ/Hrcss3A+3XvsUHTUO
         J5lRk5BZ2JVrGGCH1/ponGmfnIJNNg6pj5xFJtrYtJAunfy/6Fm2Ndp9/XB+m6xXXaix
         z/xG/Ryq0S/NoARPexwy4IvXPc21KD7C+B46voVXGO2VbNQul00ARFNX4nveIjPKCIJb
         L0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13+qbJOmWTqxbFOdDOLgCT6uW4S43S5+kJ0NK9uACko=;
        b=QwOhmBXDieyCwNsRfWx+wn16ZW/+ev9hbugMGVS1faHrtvDZDl41xZ24oFOyoACpMB
         RuzP2oRHWG2nFBtsMvnviGel3c/95MtlTW8TOSs3Ni2Pn44RxXun18Ho7/0yMzNebk9S
         D9EAZzQpXwh66aLZa2g/jRZjaHIJJpQY96g4EY3bNLjPjoudkXc97zrSpPXn6NFer4Dy
         RkKy1rqg5rgnn4DubuIPhvmO3FBgNs6TIxxspKZKPccI5RXS8UOX6sQLhS8v3BPBO1sZ
         wjElYalFrEBjechrZd6IThuhvbcw0nyGztefcb624LtxS8vozDUs05W9J8YpNCfM7jXU
         emQw==
X-Gm-Message-State: ANoB5pnfaxycorwfj7CJSs5Kd+GU5isa2bG20b2W/5ipviYvFCSApeyp
	xZjckdyxPE+6sfO3myYk/3fV1A==
X-Google-Smtp-Source: AA0mqf47BgiluiyNP/9thR/1gKkiA3+Yk8TNqaH4cPXqRpLVYA73Z5o8kzd7SJcWMxMO4FCNHl26ww==
X-Received: by 2002:ac2:4bd0:0:b0:4af:ad36:7a85 with SMTP id o16-20020ac24bd0000000b004afad367a85mr19013323lfq.617.1669737761605;
        Tue, 29 Nov 2022 08:02:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w18-20020a2e9992000000b00278e7800715sm1570514lji.16.2022.11.29.08.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:02:41 -0800 (PST)
Message-ID: <0a8c3ed4-c16a-4014-94f6-cf177630e605@linaro.org>
Date: Tue, 29 Nov 2022 17:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
To: Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
 <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
 <0ceba170-f844-e733-a49e-e67746f9f836@starfivetech.com>
 <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
 <30c21787-0c48-ff50-1d63-8e69bdcdbe30@starfivetech.com>
 <339be655-aee7-e1a4-51be-28ea20de6792@linaro.org>
 <3db802d6-114f-097a-6c69-e7b40e4d2764@starfivetech.com>
 <f52e31a5-a12a-b95e-b99c-1af8f8b41c3b@linaro.org>
 <8677051a-604a-210c-066c-75db444d6f09@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8677051a-604a-210c-066c-75db444d6f09@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_080246_787490_9EA7DE20 
X-CRM114-Status: UNSURE (   9.48  )
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

On 29/11/2022 16:58, Jianlong Huang wrote:
>>>
>>> Drivers rarely reference macros directly, mostly parsing dts and writing them to registers.
>>
>> So drivers do not use macros? Then there is no reason to store them in
>> bindings? What do you "bind" if there is no usage (and we do not talk
>> about DTS...)?
>>
> 
> Where do you suggest to store these macros used in DTS?

Sometimes they do not need storing. If they are worth, then in the DTS
headers. Few platforms (Samsung, All of NXP, Mediatek, Sama5/Atmel) are
doing it already.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
