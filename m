Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67CC83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/4BDpAB9CsJ1OeWkM/zfxQrw2vcCByXpzXg0nOxDME=; b=gjfG0s/qY5HfWu
	P33xGBECNPchBZAFUlQZwj66yvlmm0eAerX/8fN+x/d76GX0n5gTJyzfCNg9dD577hSP+9gzD2m6/
	gV57lOwNed1IYIb6OvvxTeBmZcMG5qZe3bNf4Cci24iNpv1z0kZG+zKnBRAu22IZXKWJGFJt6Meu5
	lrEb7iEYletpme2uwA5mCEyHJa72ZQowARAu1khCX/OHmoagMDiaSqF2/6gLfILRQFf/QSGU3DX78
	rTgVxoBVVhjI4snt5Xygy2yPE0MC/oem22F8njK8tz9MFgaq5GL4zl5wivooeEwQ1qPaOvIiYoBFF
	RNPLwpXnOjA5SwX+xWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAQa-004G2r-1I;
	Mon, 04 Sep 2023 14:19:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAQW-004G1L-0n
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 14:19:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so2099333a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693837177; x=1694441977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efoW78Jywy267X61gDJ1HOjwLM0WPRkMQBGOt0l4Un0=;
        b=ggCfxJJXp3xp/9gc0aVY3BHDtNfCjZwMiP70sz9pUBxpf77VuJVr5LKRD/cgs1Slpb
         EQJ1zkyD6UqRi6i9r/2XinV9HFZaI1C3ISe0PkegBTXGM1oSPZ2XmFV/bDQSVHm3DK8S
         n8eE7i3vjtecho+coca0k4GQHzwQIV+7dlYYoqdJbEppkGicMUpFTu5pTcioxL6wI1do
         9Qf+OIQL2G/VX5GyPlNJfOa+ZDMM1LjBPbVhFqT+kAmoNI+p/GUfCLLGU4+6PhQBd7Il
         +FNXAXNq+STVWdWVA28l2x0D/A7Jtp/jjLI4M8zAl2rikLhayRcQVs1b/BjFrWf57Jbo
         +T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837177; x=1694441977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efoW78Jywy267X61gDJ1HOjwLM0WPRkMQBGOt0l4Un0=;
        b=Wf/P728tblpk0pHNEDFNQQKtJ6cEB+mohQUwBDb1cFFfeYqJ1vI39TzqJNXdUVoqSn
         91BIRgrtMPdPIR4wkfPuQ0ItGWwPWD1rEQx88KGsB0Aw5qoDr45zI1ewm3bMrz1Lb/dU
         6rZ1vrLCAXIkDLyQoSNjxucfNIZaU/lKR5XG7j3g59ymRTXD2F9oInrfgeH1jIwhYTbX
         cwMxhPPNb8mPbZ4lnjj7wExalPMcn3XRH1256SZJp05X29CouKATbY/8c/oiVxdWfPH0
         f7XhVJSrBgxq2YYQkD0Ke5I662sGhhJXmsWpMY+ve1OQ7Ic990Oo1jpR6nMNQx5fvqq0
         GmNg==
X-Gm-Message-State: AOJu0YyR/GdBHmmoqmPbC6oEyuECSqoNicZOF8cQAg99LN+PBmRdr+W8
	RoyQxw2qpeMO4sh79x65vS2IfA==
X-Google-Smtp-Source: AGHT+IHA2mhSNRsn94Q0AHR/BHUOnzMC2TMmLSs66HP8jgHuk6eAMhjdlBRg+G7Rq53geOa9TDPP3Q==
X-Received: by 2002:a05:6402:1482:b0:525:45dc:40b7 with SMTP id e2-20020a056402148200b0052545dc40b7mr6730929edv.17.1693837176987;
        Mon, 04 Sep 2023 07:19:36 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id d26-20020a50fb1a000000b0052574ef0da1sm5843996edq.28.2023.09.04.07.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 07:19:24 -0700 (PDT)
Message-ID: <a19f9b10-f65f-6719-635f-06bc10b79c61@linaro.org>
Date: Mon, 4 Sep 2023 16:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 2/3] reset: Add th1520 reset driver support
Content-Language: en-US
To: Kwanghoon Son <k.son@samsung.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230904042559.2322997-1-k.son@samsung.com>
 <CGME20230904042603epcas1p2ae04f309c60dde70a0b254287f61dfb1@epcas1p2.samsung.com>
 <20230904042559.2322997-3-k.son@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904042559.2322997-3-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_071940_287947_92E89ACF 
X-CRM114-Status: UNSURE (   9.80  )
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

On 04/09/2023 06:25, Kwanghoon Son wrote:
> This driver supports th1520 T-HEAD SoC reset platform device.
> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  drivers/reset/Kconfig                    |  10 +++
>  drivers/reset/Makefile                   |   1 +
>  drivers/reset/reset-th1520.c             | 109 +++++++++++++++++++++++
>  include/dt-bindings/reset/th1520-reset.h |   9 ++

Bindings are always separate patches. In this case, all bindings should
be together. Also you clearly forgot one step:

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
