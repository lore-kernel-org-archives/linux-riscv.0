Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F75EEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xs0eCUunK7crHDNVAQ1mfs+g2RxxR8JvX1qjgxZeKOc=; b=QBkFVcSAq+4F7I
	VVVygx/wWtRE/J7aYrkpvmKam1kqImHR+ItffSrcHNkAEpr2920wT7WsdwFoXKO7l02KJocQojX/0
	71QyuJZtoBgFMnyvx3uMV1vqWXByb4+t8myVqNUWaQ9Ttq5u1NtSPOZ55k+2NP9qavWXkSDczsuiY
	tEUhUJFBAo9tV+48y0GsY27gguXbogy8Zqjy0ejmJg811xdN3+DUYs0LeUHZMxcT7KN5nIOq1NS+a
	fIrVsTwGSziRF8CktsJOQujcc6xiHK240bCOA9glQdX7COkWDHvjdOxQ10jH3X87q2ufvUKA7drgV
	nF8C9mTHvcUkyqrexNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlbO-00DOYn-0P;
	Fri, 21 Jul 2023 08:35:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlbL-00DOXD-28
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 08:35:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so14673425e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689928501; x=1690533301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfWHeKXxdljDCCbveTdkfTSWL918u+rujXW3upEByxo=;
        b=vICzUJEdl187a4x5LHvpasldNbhxzirbPPz5HPQejNW23jy0jidV9o3JhBQhxGtrue
         B0nLY18UA2ldSIxjJ3Ev9jcD99CQEcHufdAj7VuTmFPwt/hb1j/pazkunNMFpwuV2pLa
         UJtA7zIQt+nEO5AZbqOXTBTF+Q3OMj2Gx2Pco4GA3prLLvEXqv6ZwXSzl7+Cv7Zf8F4E
         cCdmn5G2xJh38gQUuZueQDTVtRPjhCKkBZC3Svjo6BABK1flkiptnQFZoH6B5tM6L9wZ
         y96zoBCsDUmydL+x3121VUFPGzRYz+JepWS+ZaTEBQzLwBVfhh9/pu9lw+gcDYvAROJp
         bkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928501; x=1690533301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfWHeKXxdljDCCbveTdkfTSWL918u+rujXW3upEByxo=;
        b=T2xVPPdWqNTV04A4PLgdHzSXtLouisMElq2RIlCmgBC5PxI2bLMH7HKWlakjxFz/o1
         DQzj0rmb1tqiUsRdagBmPXIiDYb2I19kpQzM9EA9vOtxIhHBNUDZiBLe3AELQvGEgx2m
         JDoRrJPaeIkbk10yN/gC6LV3xyaTxPyN8eK/s70+8Yex+LNs3nj4YYYTqmcC3yuoC+BB
         w6J/tLPDrjEro4HKbr1LIlhGLBRSx7TbCWiWhL02dVC2y1Sg1hmOqQiHtvwq5JtTBrSk
         IR7QpaaP6Us0o3DTYCkySmpwd4L2P7tMVM1uoBF6BOdajF6Suvr/t8MLx/09MXg/hYp+
         6Bug==
X-Gm-Message-State: ABy/qLY9VawPpzzFFX/UvHRGWsLLcoznDofWBghEdDwszTnQ5nreHnCA
	fKcQR0RNM8iGC7+HsUXFPAPymQl7biBzv1Rwfr8V7g==
X-Google-Smtp-Source: APBJJlHxQZeso3Ce5snQYO18JDiDnjDDsD9NlH8hQO3bcs+U0hcwKO22ylgUQNNAOIQi7NUacJupkA==
X-Received: by 2002:a05:600c:ac6:b0:3fc:5606:c243 with SMTP id c6-20020a05600c0ac600b003fc5606c243mr944572wmr.13.1689928501284;
        Fri, 21 Jul 2023 01:35:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x2-20020adff642000000b0031444673643sm3512256wrp.57.2023.07.21.01.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 01:35:00 -0700 (PDT)
Message-ID: <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
Date: Fri, 21 Jul 2023 10:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, peterz@infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: zong.li@sifive.com, greentime.hu@sifive.com, vincent.chen@sifive.com,
 Nick Hu <nick.hu@sifive.com>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720135125.21240-2-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_013503_708919_8F100675 
X-CRM114-Status: GOOD (  11.43  )
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

On 20/07/2023 15:51, Eric Lin wrote:
> This add YAML DT binding documentation for SiFive Private L2
> cache controller
> 
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>


...

> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,pl2cache1

I still have doubts that it is not used in any SoC. This is what you
said last time: "is not part of any SoC."
If not part of any SoC, then where is it? Why are you adding it to the
kernel?



> +      - const: cache
> +
> +  cache-block-size: true
> +  cache-level: true
> +  cache-sets: true
> +  cache-size: true
> +  cache-unified: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  next-level-cache: true
> +
> +required:
> +  - compatible
> +  - cache-block-size
> +  - cache-level
> +  - cache-sets
> +  - cache-size
> +  - cache-unified
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cache-controller@10104000 {
> +        compatible = "sifive,pl2cache1","cache";

Missing space.

> +        cache-block-size = <64>;
> +        cache-level = <2>;
> +        cache-sets = <512>;
> +        cache-size = <262144>;
> +        cache-unified;
> +        reg = <0x10104000 0x4000>;

reg is after compatible.

> +        next-level-cache = <&L4>;
> +    };

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
