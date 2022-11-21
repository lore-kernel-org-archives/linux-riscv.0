Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39899C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLmwqhtwkELIWMWgF44JNXVD2VtQAe+F1gvZe3Yc/58=; b=utaVxqn06isNk+
	7q/E995JWhM9gEYspRmFIRVgkqKCHfsKHJpp8Cb74Q5UH4//c0ItzUVS6OtWbysMNgr4xrA3X8JrF
	AbXFEGIXIAin4fWYRcmJrSp7RL/gWdV4eREVa3twLom1fuePhOr7YKdCp+b8y2k+/w9bF6lOwZbJA
	R3LCE5tketou7rviqFeeWh700VXIfQMLOux57IUWgGnkc03FankV0Z/pXp51DG5ZWoWI5p9hjkyp8
	QQZrrUzF1xuc/lWoxMpzsLW4ggZNP1VJDnlmHsbmFnqRZPrJ39EJ5bHhFV9SmCdYnnRlOcDNkXCWU
	V7OwIBQ/nn9cEbFCUo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3gs-00C5dt-AB; Mon, 21 Nov 2022 10:06:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3gq-00C5d1-68
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:06:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id x21so13894788ljg.10
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETYUju+ev/hPzpv+l4JC8044Dj0mUXTx4GlVsgZjN38=;
        b=iYo9iX04wVOZdT5EObsUtBWobIewodTvdRf8V0NODR74jwWMed+4YuLtDriVY2mWdB
         8IO+AP5pPJj1asjIYQUufuR4O9zo3sHPmX2vJjyDWHNoAO9ATSTIvMTac0hiGeZu2ZOP
         6hL7dvTVnZqlZTIp3fXv3P4tlv5DOGqcgfwTq/GEd4Btr90VXLGk8Z3zw/3+OLJL6aJz
         MGfB+yQKhpedI8h60zu4pv8j0raeb7LPTHf5cfyT3hG0ssRYHZMWOhrEix2LPQtk7h2G
         5tJe2YL0yoCfyXfanSGkY7C9p3hC5UclJplcZ8VZEA4o/YyuoDaBgwLLg0aqXiaqujQE
         9/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETYUju+ev/hPzpv+l4JC8044Dj0mUXTx4GlVsgZjN38=;
        b=Vi/EeDaGcvG7PCR0P8qGh4Ci8K+vUtxKH7TaaHQYNFXkDKz3zitB5rku+mG4BO/Pv1
         nbINXRv4B9KvctMF3nJowYn/Oaf1UY1L8v6BmWZyOk5ZgHgL0n+kOtIgPrGoZ8CB48bN
         Dr6qTlnzjVHzyC+UhYS0W9gRJBiZLd2TGLnRGowBPPhNWiZFlLgIB6Xk4agxleXEm5r7
         /ptTrAlzJHO7R6kqaQGa7mqt43U0Gy8iW3esi2v5rV9Ox25Jd2rV/9NJ8DdVky518Od4
         suQ9GusM318eamG9aN6V6PYSFZa6i7dIKBtgWPOz3VwQr17osCuRxAP/8KpCJ73vfkDl
         03ZA==
X-Gm-Message-State: ANoB5plOc56H+Vt3jZGVB4ihJ85r3BQIfydJbMU4Jupgw2DXLTHm7Rae
	LvtDyfIf3I8IkMA8wU4FCX4RNA==
X-Google-Smtp-Source: AA0mqf49LlvU9Pg6aP1uODsFd7BBPuYMotIvAVv05VGR/gjZCU6kQGPeu2jafd9bNMv501DNwGoAog==
X-Received: by 2002:a2e:a263:0:b0:276:be89:5616 with SMTP id k3-20020a2ea263000000b00276be895616mr5077797ljm.347.1669025168551;
        Mon, 21 Nov 2022 02:06:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a26-20020ac25e7a000000b004b4930d53b5sm1958536lfr.134.2022.11.21.02.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:06:08 -0800 (PST)
Message-ID: <08cdf11c-b399-3f45-7dc6-0f75407128bb@linaro.org>
Date: Mon, 21 Nov 2022 11:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add comaptibles for
 T-Head's C9xx
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-2-uwu@icenowy.me>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121041757.418645-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_020612_258995_C93A6216 
X-CRM114-Status: UNSURE (   9.97  )
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

On 21/11/2022 05:17, Icenowy Zheng wrote:
> T-Head C906/C910 CLINT is not compliant to SiFive ones (and even not
> compliant to the newcoming ACLINT spec) because of lack of mtime
> register.
> 
> Add a compatible string formatted like the C9xx-specific PLIC
> compatible, and do not allow a SiFive one as fallback because they're
> not really compliant.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
