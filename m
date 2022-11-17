Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB1C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIcSplueKnzqCCzIvXms9OeDAuluWLb6FTZsaQdDIFc=; b=EWpgZ5b5g8S6ci
	69WonVqq0IoYo+Xz4qXKQBSpo+WvhD+Xez35pOPQ4DTUkQPZTN8NpLveIl5Fq5kBPBx5hFjjSz++a
	dDAK2DazwYg/NSvdaAgENJogT4oazqoxUFItGNLIWgg19UY3k4n65WOZWfTspHU7iQSGbgqskXWPa
	0gx6x9JDbj6sNEvnSM61A0YDDIjjGa7ZG2EEnFlj/zXeZXc/QIFZRXDeDVH4wGg46FBBPsOqRQgvt
	NwCnKp0PRe7RHU89RRhC/0M9wRJrEOp+9UAeXXwtkuZ8lv7BBQkM2pIs9Z9AUTsHfgj7FBnJUduUt
	6sPQjTSUMGRKjyn/+htA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgLy-00F2SA-7R; Thu, 17 Nov 2022 14:58:58 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgLu-00F2PX-IE
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 14:58:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id j16so3167246lfe.12
        for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSnIdJlrSu1RqwxbrwymcRNJoSgT34DNNQH025cvo20=;
        b=Ur9szg1DKJvl3ubQjvlChH09oAO12tYaDGESWoJRFs5nbTcgL70iq6Rk6jcbyh2eSV
         5sIr6XHiZbOMcG5vg6LYzpKXTZagjOTTXivxVfplX5GAD0O1/9QIYKFbd0XkOcolglVT
         VrJu0CgFgUecUmcpa3we0bBiZQmSB6sCWxEucrm8wK9mxNNpZRyq2THIgu40f2wTK8zo
         2iE5ibWayllqwdjGN++kkVQdW9OgLgRj0+rBH5OvzcLsoNEByi9LNspb+2B+W5wqkM41
         Rwzp9Tu2wWCQ3oQ9fSXsHYYSxRuw8yfwAEchPTid10LtcwGqSDyeXQdG7IyHwjOChaWM
         86bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VSnIdJlrSu1RqwxbrwymcRNJoSgT34DNNQH025cvo20=;
        b=YSJ5A/zfFOjyieAl4vwBvTBaK8Tr2GjqOq2zHivehmFakjkqGDKtaF1xs+vA3n4Ij8
         HdoTMfv3CK2wgb2oM9hf5s+VQG8B3KI9poXRNyChOC9SaNVIBWYAn5A++hVkLJF3ORJ/
         QF9iyUSQgsjvuLH2oCUenSPN1osjdvt1w/J9FOFlncj1B/PztpmfW3UaE8bO4MI5P1vj
         gAftbDwhA33QhjZWki8D15D3v7tryBN4iDenxzbn/xFZqV+zH3F0usBPD0Y14soV15sR
         8nvROCp5wSziH07xzpwYK/d8kfN4Zo6QB/zMAyJLUgry+aeU3XkQQ/EXRxgtibJvOWIi
         Mcew==
X-Gm-Message-State: ANoB5plUmfKk/GC362aP9g+OG7wLXIHs1MutS0v2MbdN0LL1Gxiop9XG
	68CTYVD4QfE+z4dWujuQFO017A==
X-Google-Smtp-Source: AA0mqf4/hs47bXqsUk4ZLu/jQ1Wna1nuVovn6G3NWi6j/M3148XUWs2V/ZZa76pyYbEsKXo3MQAsvg==
X-Received: by 2002:ac2:4a69:0:b0:4ac:d080:e1bd with SMTP id q9-20020ac24a69000000b004acd080e1bdmr1120397lfp.318.1668697131665;
        Thu, 17 Nov 2022 06:58:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r8-20020ac24d08000000b00492dfcc0e58sm186892lfi.53.2022.11.17.06.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:58:51 -0800 (PST)
Message-ID: <2f35b9aa-1385-9c2b-ed60-721a835645dc@linaro.org>
Date: Thu, 17 Nov 2022 15:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
 <Y3Y1xjOjijBsQLZA@lunn.ch>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3Y1xjOjijBsQLZA@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_065854_607356_5A113CDE 
X-CRM114-Status: UNSURE (   8.35  )
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

On 17/11/2022 14:23, Andrew Lunn wrote:
>>  allOf:
>> -  - $ref: "dma-common.yaml#"
>> +  - $ref: dma-common.yaml#
>>  
>>  
>>  allOf:
>> -  - $ref: "dma-common.yaml#"
>> +  - $ref: dma-common.yaml#
> 
> Looks like some other automated change made its way into this patch.

I forgot to mention in commit msg, but maybe better to drop it to reduce
noise.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
