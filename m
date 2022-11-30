Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB3C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UNtu0qJ1qZnJeGiVLI8hbf6E9YOUknzn+zV0tQrQBA=; b=lYeuUvx0km1BA2
	GgkU6PQQz0NWUUP04w4cM+j1sJ2+JcmddQh/pFCYm4OQeoy2PSBOgfS4wZdfQ9hDi6Zgdy2lbW2Gb
	qryRdBAvdQHNfrCVt0WQLDMPIiWq2qjEL4f52DWPT79AAqY3qOEQQeEwYBnbU8gv1R3RLRleZRIS4
	3pH0202ULlS8fiwJwtxzfqzZfj+IXLI7VatJYycGrFQGCgR0pnemgip0X65n8GtHwzgbXfv6SQebe
	IL3qv66tzPgZZ79UStnfiQWHRIfURT1Lr4i2sy5P/af0C2ImSznQShzW4N28sJPNw6f/PQABbWhxz
	8eYZfrqyv0tRGGkNVf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LZt-00FvQc-Hj; Wed, 30 Nov 2022 11:48:37 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LZq-00FvOT-Jc
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 11:48:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id d6so26525927lfs.10
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6nM01jdZbRN1c8R/kAUrMPOWppbWgjC7UXAd4yftaU=;
        b=ag858vg44uCxNf2eO/iLKmnpTupGAfp1XUmIeaw9JsO+AnI3ZHBhboqqA+gOeqd2F/
         ddE27oic+H1jHtAQU5hayzbWX/HFs9l37uF+zNenAy3n5wohoh4wXp17/v9A4XxVVvYY
         DkGxJnZbC73e7Q0k305SQspvKXbX5CcLlG7Hn6tP0qvf0HkoCQUNAFv4Pd3FJe85LXMu
         e36dSvagsDk4Am8ZNXxQjya8gd6+InZIQi/qpLvtzZz2OQMvunGaGgRqRcWrTpdIlKCs
         d9mxRDe1OSZXj2c7M6OEyb7+h87wsbEhKXRR7SQhazsOXpWHTQnLobYAo2HYxNmxmE7N
         Jz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6nM01jdZbRN1c8R/kAUrMPOWppbWgjC7UXAd4yftaU=;
        b=JyoIA/FqpFcrL2WCqS8UwDWlDc3J41NhN4p1PkKt5ABjRtC6FRppJ4+trm1OB+yHDQ
         JLIRrX/aiuAzpFFWzlC8sFbqvQFzrFXyQhQPCfDkpmUsdXgW2d+2H8yOXgKXrUITQDrD
         4qlS9II/caAfzyYRWQUhUWzpnj3gK4f/l2mcFOLicwlzGONZVkPHlUVFbscRP1zFDU/x
         QRnaXQxIDleMSi2DfP7oELTlmaCho+x/NbxZYYbZ1tX1gYg5eM/Vf2e4egDnLpO+O4HK
         TQpN/0gKT/8MRICqeQOjKkx4Xa02+f2LR81NAHgTED4vFXeEW3VKuxQK/KCzjWwa2scH
         C4lw==
X-Gm-Message-State: ANoB5pltVXFHup3ycOkoS2cM+KVq2AWs2aLBTHwp8AmQkuyuy1yp5xB7
	w5Gaz46df4Fo1GysS0H15i0C6w==
X-Google-Smtp-Source: AA0mqf46Dgx9g65+aoK9r/yyHdIsLmyD6n/zh75G53yu0mO042j1P3ccGQ9+yCF7Qp0fCdrLdlfl3w==
X-Received: by 2002:ac2:5e63:0:b0:4b4:f08a:45fb with SMTP id a3-20020ac25e63000000b004b4f08a45fbmr11464657lfr.74.1669808912471;
        Wed, 30 Nov 2022 03:48:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e9796000000b0026c2baa72d4sm111907lji.27.2022.11.30.03.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 03:48:32 -0800 (PST)
Message-ID: <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
Date: Wed, 30 Nov 2022 12:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_034834_741587_D73D403D 
X-CRM114-Status: GOOD (  12.51  )
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

On 30/11/2022 10:47, Hal Feng wrote:
> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>
>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>
>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>
>>> Binding headers are coming with the file bringing bindings for the
>>> device, so you need to squash patches.
>>
>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>> following files in one commit?
>>
>> include/dt-bindings/clock/starfive,jh7110-crg.h
>> include/dt-bindings/reset/starfive,jh7110-crg.h
>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> 
> Hi, Krzysztof,
> 
> Could you please give me some suggestions?

You can keep aon and sys split. First add one of them with their own
headers. Then add second with their own defines.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
