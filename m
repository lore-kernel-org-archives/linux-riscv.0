Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13598C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sDhsDP3iketPYrlazMdNUuI1AQt15mspEK2XtgkNgs=; b=rNDZ9KUeBAteue
	eSZlPPaBmsHz+apSIY9zeXZ0phykbGPGwsRWKBbKHsyrkg/Dbdyqi4kniIPgsaH0EWAP+f5JIHwp8
	sPnbU/ADa9H2iOiZw2jided+AFx/Moq4K9AXsGI/PX5l7+2zvxGrFtcBZQwH82CM15Xo9/NYBSmMI
	XZQUkgR7AyobEprMcJAXGVpGaoFsh67to9FDEqn+sFCQGc8CmX1i6x+cFO4IRVB97ELjVdd87JgkK
	/udviCE5fgLTuF58FVY4T0MFnyylxTDAU+95jhvH6N1DjRM5JU/Jcs9r1/biGpeK/j3Bi6gQfSrW/
	+UYjHeeTRkZ4gQ6F1aiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neLGn-00FSNY-Fs; Tue, 12 Apr 2022 18:29:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neLGk-00FSN7-4z
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 18:29:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso2416027wma.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UjxIBnENYM5U2jkWppTggWI+KxOeSkcWqhHcXf9FYqw=;
 b=11sTjSH1gbk/qCcQN0/ARIYXCXnOcFxU4vzfQ1Vs6ka8Wt/7zjsDx1QZ7gtQAv3NUv
 Y+ooPC+x2KvutL41Gauvs8AqrDmQruDOdZFfUZFiJFW4FiqQuYhurLH8FH8OBrNtu2tS
 LlhFXVEmrfG+PJFDSe2VXHkJmExOcBDNZm0SVhVuOrHYQDzakLf1q6yaiw8Xgs5wZmq8
 6htLSxJKlLKXY4CjNzv8m5G7iZTddUQHVrAXZ3jyytt69hi5h0ie4bWXgyY1vAXCYqXy
 BFQf9Xihic1PzVS1oFLrnflYWji+yxOgS3IAfnEeL40Y2whEvxEoOcauhQdGJ1iLgD79
 iGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UjxIBnENYM5U2jkWppTggWI+KxOeSkcWqhHcXf9FYqw=;
 b=TzlhqQCuChaPfSE+k517mdOlsiOmXLTbO09+fKnrqL4ie8WdA78lsjk+eZ48d1sduo
 7DItGikh9oiqz3XUmpnLmYK/GWPJ8tlA/424ejoIu+RY6vsyygHm/Rz5cSKjVnwIfqA1
 EFSQMswIOYVzMJJ4jmDDmkXyEpvgH/PwUl9/S4sLPctjMr630jybMJLOTtom4w+r3OMo
 riSYfGCuYZzi2NS50PrQwEpQX56uPcWP3txnI9/MIiXMQN/szzJN7o49EPzx7BPSUtYc
 +Pxyc0Q5kTmLWGjiKGbfV7udUq6xPvoDBh0Yhrd7rNpdldOSYegVhNzWBzWRJ+bYSMI/
 5W1A==
X-Gm-Message-State: AOAM5335IcvPh8LziOlor1bLgtCDXy/HkWu/XmGK8nvkv4Z6pZD6ZmZE
 4R3MQDa8nNJPy0dTHNMJKcmbFA==
X-Google-Smtp-Source: ABdhPJwvSYOIASwIs3kLC7MAm5IUtV/fvZEEwuxh9fOfTBXevk03vh5KF/4ouNQNb8gOY9WFjkXibg==
X-Received: by 2002:a05:600c:4f95:b0:38e:b596:b3f5 with SMTP id
 n21-20020a05600c4f9500b0038eb596b3f5mr5224649wmq.164.1649788173749; 
 Tue, 12 Apr 2022 11:29:33 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a7bc8c4000000b0038ebbe10c5esm211622wml.25.2022.04.12.11.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:29:32 -0700 (PDT)
Message-ID: <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
Date: Tue, 12 Apr 2022 19:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, palmer@rivosinc.com,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzk+dt@kernel.org
Cc: Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
 <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
 <74695e55-0b59-9236-be19-b02060ad4177@microchip.com>
 <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_112938_464381_86156D39 
X-CRM114-Status: GOOD (  18.51  )
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

On 12/04/2022 18:10, Krzysztof Kozlowski wrote:
> On 12/04/2022 14:26, Conor.Dooley@microchip.com wrote:
>>>> Additionally MSSPLL is the source for CLK_{CPI,AXI,AHB} so I put it at
>>>> the top. I have no particular preference, so if you want them reordered
>>>> so that MSSPLL is under RTCREF just say the word :)
>>>
>>> Hm, are these in the same clock controller (device, not driver)? If yes,
>>> then please order them numerically. Pretty often one binding header have
>>> IDs for several clock controllers, so then it's a different case.
>>
>> Not *quite* sure what you mean by device. There is only one SoC that
>> this header applies to, but in the actual design the MSSPLL is in one
>> block, the RTC divider in another and CLK_CPU -> CLK_CFM in a third.
> 
> By device I meant here part of Soc responsible for clocks which could be
> called a self-containing block. Pretty often such block maps to a Linux
> "struct device" or some wrapper around it (e.g. clock-controller
> device). For example such "self-containing block" has device node in DTS.
> 
> Judging by your description, these will be different blocks / device
> nodes in DTS?

The way it's implemented is a bit interconnected and none of the three
blocks would satisfy a "self contained" constraint. Eg. The rtcref
divider's control reg sits between two registers responsible for the
CLK_CPU -> CLK_CFM clocks but it's input clock mux is in the same 
sub-block as the MSSPLL.

I guess its better put that each of the three are sub-blocks of a self
contained clock controller for the mss core complex. There are several
other clock domains on the chip which would have distinct clock
controllers & may be added to this header in the future, if letting
Linux control them makes any sense. For example, clocks in (and used for
the clocking of) the fpga fabric.

This controller is a single node in the device tree. Sounds like
reordering it numerically makes the most sense then - I'll resend
tomorrow if that's okay.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
