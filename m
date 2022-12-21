Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB0C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wCSJhESk7oYhvheHT7DwyHAqOQoSv/MPyHSmVuJY4k=; b=r9QI4nN4xwVlu1
	ajWvLjKPB2bLagV0dJ6rn/UOYC/krl+ZE4LkC5malZEA4664aI9zPskddkDqDeCREPM3upz7NzEll
	PyuKrP20gg9iKK5jUJIF02eRLMRJwI2Spk5Umxh/qJK+DA12JPZfLLAle6Ifef5ekmYjghPMZsSYs
	TfcQBVGsGfQT4vUweVs2SepBLMYbeAx4P9XEuVo/XFCEXn9d4hI9jNYl0mhxPUeg8r2cTIyptaE1j
	WvWwGBByXxSk92ksec3m/upqctrs2CGr3Zd2+rNeq+mTt/WLFPef0TInTyfruw2iScTHZAzkAcY0x
	Ccr2+op43ijCHgPzSk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vi0-00D0U2-Lq; Wed, 21 Dec 2022 09:48:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vhd-00D08r-MB
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 09:47:59 +0000
Received: by mail-lf1-x131.google.com with SMTP id b13so22696219lfo.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 01:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLEBEWFKmVUzABbgomhdjBEc/qQs01rZclQnVraRaAk=;
        b=ixtgqs69him+R8vofbTGe5rZr6qzBwPsdEWRPLaodvy478LfY48Gn8IZjpy6W/9uno
         6z86B+MqaGd8IfCzQVzr2Kfu8W8jc8sz0yQiik0Uku40BEZiCWdNe9uapZR99jtiIDtX
         nRtSS6dVNX2GPaMNdy2ov4TvFcvOjrIoUy0JfLK8p3gCwznQQcu+kp1m6UfwHdMx7D/Y
         Qp4/W7NQ2pmuuA4Pb/yxuKggZcWCeZ4K20uOHKRQl4ijjX0cU1HVWJ8GiAj5w9LagUYQ
         PNlfGiMYmATCyRs93yiG9fV6EAHa0VtHKPwHs5jFrp+AiTw/cKb40UooFGTtcNaL27/q
         dN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLEBEWFKmVUzABbgomhdjBEc/qQs01rZclQnVraRaAk=;
        b=JvJMArt6YGpG6viM0cOGa84qnybnT4mHqOSGRHZy/d86jOD5j8gtejfNUSxIVjGivB
         eGf5miQ5r01jnZnUbCgvNcSo5BZRQcSRJ5e3jgRBWGLwrfuR2189aoyPR62BFJ6IrPMy
         eor5IbJH/y6NRqknU+Sa4+cJK4JRLOg1+8P821MkDYh6YY6DHQbc76X/o6NoHYntWNEQ
         NOVwNfgZG10h14S18urzC6jA6I1AuNqAq+k6PuwGDPMD+empchZsPYNWL71u0uadw6BF
         YSdZsbu2v4nCVOGgGccXNW71F7FJiWOPxr5v9ql1jSL3qOZeUUVsq44G5ngak2Y6zb4z
         Oe8Q==
X-Gm-Message-State: AFqh2kqGW6JZJGMA0WjeiKHyzh5JrUI355WHUjie2hG/oJRPQwlx/q00
	nAjXVraycJTdo5UxjjW2N8QwFw==
X-Google-Smtp-Source: AMrXdXvSUsFWN8Ug4VQ+xJHQ8UMNbhnFMQgxkmiWJZt3pCBQprIlPuJ4OCiySDp51aDBu3BSEWWswQ==
X-Received: by 2002:a05:6512:31c5:b0:4b0:25f9:14ea with SMTP id j5-20020a05651231c500b004b025f914eamr552097lfe.21.1671616074385;
        Wed, 21 Dec 2022 01:47:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e9b18000000b00279ff5d5e10sm1266626lji.38.2022.12.21.01.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 01:47:54 -0800 (PST)
Message-ID: <3a26c733-6573-5954-f4e5-8a1f8abba140@linaro.org>
Date: Wed, 21 Dec 2022 10:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: rng: Add StarFive TRNG module
Content-Language: en-US
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-2-jiajie.ho@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221090819.1259443-2-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_014757_826542_A7B3E136 
X-CRM114-Status: UNSURE (   8.45  )
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

On 21/12/2022 10:08, Jia Jie Ho wrote:
> Add documentation to describe Starfive true random number generator
> module.
> 
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  .../bindings/rng/starfive,jh7110-trng.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
