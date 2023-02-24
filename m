Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D001CC64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCvwFWqwcSCp8PbGgxZ5+Lql7Ah7Fo4rMod2P6fbwa0=; b=1jLCXiwxVVRzvn
	QsesXmjN6sXvs7dqpfjHjDeOxfwAsMpAAXYWbrXLnuEOJgr7E1WQqZXiTVEqBElsgybueIxD/Sz4z
	oP83aj7u/DbqOjNzaynIlrV4EmvWbCRH13dfaMhZqp6GUxrTvNHNdayk38BJ2LQCFzcYSJ4CD5sR0
	wOxmixdy9nLjNwRr180o2WsOzrFEBbF9eY5koWCy64QTdf5YhuYqantW8dzC8Yzd+2JlUYLPyRkOr
	MwHHQiTPNbHNoaG19SQvoeYBxWlecpHWS3ndj2xsJ95xIe5rDebSl0T270c6Mu5FoPrAC03ibD48X
	ISSAUgkGHstnmKV4YxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVfy-0027Is-96; Fri, 24 Feb 2023 10:51:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVfu-0027I0-Qq
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:51:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id eg37so49371109edb.12
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 02:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWipjI5mniJwj+Zo4zdUNY2FbRwRYxCeXGMJn2ipLck=;
        b=k4ggbccT39ghWzkqPfOuKg+e5dqk6S0iiRLcagST86D6Ehg1wAdUjlc/SuqwBa+dqn
         WimQ6P/WlBwKVMP1IzwfxpBF2Byg8Kznh26l1swwOO+1MzON8n1q9kgeq5M2AdPpUmw+
         6TGc8nOWg7YV/QaZaFD4MnHz4XGuv8ZQdRs8yThtQjEfhpX5B1dzvcQnpxonc//7bYdo
         V6SpfXw/Tx1JOMCs5UiifAVL9IKb+h6Myskgw3STaA1e7tAnNY46NFFAzN4x21NMn2sq
         KksIaXPBjWNZxi12LdvNW3SyHsr8OJMiOvpT9Sm1hYDjG/O9CMXTHjVEHiMkdpjhV4vL
         OwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWipjI5mniJwj+Zo4zdUNY2FbRwRYxCeXGMJn2ipLck=;
        b=uGlWTnWpznbl4v31TO4CaaapfJ5w0f8z7lKgk1KvkvjUtXL+I8xiNNnSjd4BPM47om
         YwNUCukCyjgtIjTsPI/HboXWdqsBwajWXo50YOLi/2tVINptXrwyEs6klfPh+Ho2f1Wb
         oFsQaBqqDVNCHtTxI26WTf6K6W/yM6zZmrso9BYfmh3JtcvVTl0ThG9lnJJPXVapd0pb
         5DYMmNsd4JalSZ8Sm76LydJtzXtFa1/iZGdv2KDJ04+H577bieagbFoIC9ESvq/yXzhl
         bwqEVtguaqwGinHxRVBib+oMb5b3G7vToPGrkZMs5+h3kESryOiygA2iSc05kPS/90R2
         /lUg==
X-Gm-Message-State: AO0yUKU8JLr3T46nbpmr85SZVqk+fb4torMJRHpyXqUJrVkrlKb1sXvh
	dTqSbNXv/Yo4mAjVraIFbF5fZA==
X-Google-Smtp-Source: AK7set/8r3ELb6NzgTDjS/JxvwXd778mA4ZaHD648XBFslKOZSwwXSIMZSZD4DlfMpG9Ny3kLVZl7g==
X-Received: by 2002:a05:6402:1356:b0:4ac:746e:2edf with SMTP id y22-20020a056402135600b004ac746e2edfmr15950821edw.9.1677235896393;
        Fri, 24 Feb 2023 02:51:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906199a00b008c9b44b7851sm7197176ejd.182.2023.02.24.02.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:51:35 -0800 (PST)
Message-ID: <36188e04-332f-e944-9c58-f6f2b74987da@linaro.org>
Date: Fri, 24 Feb 2023 11:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add reset
 items
To: Walker Chen <walker.chen@starfivetech.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-2-walker.chen@starfivetech.com>
 <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
 <d0984638-3f7f-7e4e-fe3e-5e1f88375dca@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d0984638-3f7f-7e4e-fe3e-5e1f88375dca@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_025138_898418_2D511551 
X-CRM114-Status: UNSURE (   9.52  )
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

On 24/02/2023 11:14, Walker Chen wrote:
>>>    resets:
>>> -    maxItems: 1
>>> +    maxItems: 2
>>
>> This breaks ABI and all other users. Test your changes before sending.
> 
> I think 'minItems' should be added here. So like this:
> resets:
>   minItems: 1
>   maxItems: 2
> 
> Other platform/users will not be affected by this.

Which will allow two resets on all platforms. Is this correct for these
platforms? Do they have two resets?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
