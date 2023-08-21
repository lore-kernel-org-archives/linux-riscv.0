Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D59FEE49A0
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 06:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVWC+5ysksvoa1V79rcpcvIGko8MRHEEItFh8t/z9zo=; b=W2jHzMN8R+aqKP
	l8IezE647nIWASnEOG2QfMyfTUQsiVn7L3+QgvGcBP/9HFO6lYs+snmjGJnkTMTdnaZU5Rl/n6jok
	DvXAA+xSmaQnWKiMCshoirPlpSaxxSjWI7eiSaU+us/iOKvX2dfgM7rNjJAXLX+AJvHDZRHcUrOjs
	D/zLT5sHsccXOjrMq+KTUUnKS/cp6/hCDm9bWYN6/JBQd2Slvt6ssGO349dVx5Vewk8jLjDzUO5WQ
	LfOHjRFFenWEwuOYGTPeQYPNqK/Vd9+MC8KwsBsM+dp8qDWpo1EPhG6F6619ZmhUJjPyh8VTlPVAa
	N6My/ZfgbKfnJYjcugHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyJc-00DFgb-34;
	Mon, 21 Aug 2023 06:23:04 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyJa-00DFfi-1B
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 06:23:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so386903266b.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Aug 2023 23:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692598981; x=1693203781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcCNA6Gfamy94/pLxijVh0qctBGX2/2bPxB/4YNlhrY=;
        b=MWto6spuOBnOh8QA0ql8wvzvvCrNr6DVv1N3pl6egZdE3UBfK/YKmcvtP0NCLkRWOt
         7tVWzFoXA+rUKLR1P2kkAQ/P1zljLzJIJREw0kVIAEofLZ7eYNMlJjCDEMvkeWG7MWAl
         OUofupmN7uR55nG0mY3d0gqk6v6/5F4JtfB2LM+AmsuuQr+vTheSuewniR3Ztsrju7ag
         ZJwxa6yBbGViuIxEEaMs4dU2+4McVT/qSAMnuid4pmi/t4J3ERIYZ/kXM9WX8jNWGPyy
         IVfljFeqVXapoJM5EkfgleGUbH73V1lJhZ0eQmudbUzWIucf/t7tPtYUjII9v2xTKPtP
         nmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598981; x=1693203781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcCNA6Gfamy94/pLxijVh0qctBGX2/2bPxB/4YNlhrY=;
        b=O7RneVmO/dhskpzsNONlTPdr+XDQmsqFgM7Kh5PI+yn4MYvzXsE8Dx/scavNWHDI+w
         bysdDNOSn9ERLpAk9d+fKmnazTQbsvDyoT8NV1KZRC0qLY1m0I9bWO0tTkcc6adeWxrq
         pGsvgGawo0RV5SwaliuXfdWR2VgMdMzpzEMQpfCbuq1CGhJ3mOQClsOmV0zE9uVwfkgw
         kh9DMWThP+IwcMIJgnsAlnUUYETq+PqEDFfQIY2PQ5oG4viJuZBgJBcZYbrz4SO6GF3u
         IG4ORbVzbDFf/6pOP7/NkPlujsf02qEnfKcRipdonDrZ8ybyykk0I6jn1xA8aGcsCzDF
         o4Ug==
X-Gm-Message-State: AOJu0Yy4vAiAhUicS+Ys/0dFgGPpSunBtzsh3nInI/a37fQOcIiY9PlB
	QA8aVpW7yeyhZ9Ci5D6lHBrMQQ==
X-Google-Smtp-Source: AGHT+IEYVmZ6aoUBBlNkEHfxtQ+b+xqMdy9bNDFQoDfMSE4A8BLuV0STpbMFSDD76wDRmJyL8evZhg==
X-Received: by 2002:a17:906:20de:b0:99e:f3c:2249 with SMTP id c30-20020a17090620de00b0099e0f3c2249mr4087672ejc.71.1692598980839;
        Sun, 20 Aug 2023 23:23:00 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709064f1000b0099297c99314sm5028208eju.113.2023.08.20.23.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 23:23:00 -0700 (PDT)
Message-ID: <3a413a63-4e07-94ff-4e49-da7b1e3dd613@linaro.org>
Date: Mon, 21 Aug 2023 08:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: allow
 dwmac-3.70a to set pbl properties
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230820120213.2054-1-jszhang@kernel.org>
 <20230820120213.2054-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820120213.2054-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_232302_803619_75A1F2AD 
X-CRM114-Status: GOOD (  12.27  )
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

On 20/08/2023 14:02, Jisheng Zhang wrote:
> snps dwmac 3.70a also supports setting pbl related properties, such as
> "snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index a916701474dc..7626289157df 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -659,6 +659,7 @@ allOf:
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> +              - snps,dwmac-3.70a

You might need to rebase your patch, because line number is quite
different, but anyway looks fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
