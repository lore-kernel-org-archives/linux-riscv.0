Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8B9C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=me/rSqRPhzvQ6IedKg2LUizBPBgth2lE+j19IAlDJIY=; b=Rlslc1rzlraMl9
	o0F6dpPZar2nUbvm9e/lhujln4AzmDRNMZQ9ujEKt4M4T7OcI0Px9A8JmzJRJT4uuxS7N7fYNir0T
	JozQCVHXTUpeySG857mskTqLbivaYS2cJdB2Z0dBIYETloW0y7Lpz0xlN+ilM+F0EU9W9lX3uAd1w
	oe94ZFG0zjYBgKmbo1Oj6/EcKuGrOwAB0Mf4FduNDiqND+QWr7Oc337NjkM9Od4ZjqhQqTFCdbwR3
	cfDOboVAm3LsguxBBmuAVwTEUTOPERb2qaS8AA0QIE9zjlry/1d4bx4KFGwrHQC1yErQ8zGkCHmm2
	jO1ECKFUnaizMXR433ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pds66-006gRG-0U;
	Sun, 19 Mar 2023 12:25:14 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pds63-006gQX-0g
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 12:25:12 +0000
Received: by mail-ed1-x529.google.com with SMTP id ek18so36879623edb.6
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2ctBh4ChIBF5WYyxX2AuUgLXf3/Rtr+EA5UEX+4mc0=;
        b=lxoheOqvZMAIGC53kvgTC/HcHCS5pajkH7b5BWNZVtEddXubylKUZHH3Z/OAV7jqNZ
         mWunohAgLAQUzqR16416/oNnLaiyKG2Tejpq9UVgXep+rdap+E/VpH4E9IQ+2e/lppiD
         Jzl4leltTZDImsJQta7griGFVTFSRI0O1ZbpBze0I9zO0+UWSHnizjCGXrK4xUWg+Rhu
         nXDxbH4Bt75oLIAILvDBh5vc/wqXFBbWMkttq/c4yVPN9vz6LyzKlT1BDVTSBAZC/Ykx
         pWKbgIkB32veVjNq0hUkMdgLs4GWbU4Vqd1aRaMl4HBoBmWIKE94K+/rJofVrwo7Hxmn
         Dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2ctBh4ChIBF5WYyxX2AuUgLXf3/Rtr+EA5UEX+4mc0=;
        b=qTefr2JuoNjm+srRZcLQ8+kjdeJ+cyelV/U4t3hatPeQqlBofzBTWm9D4kL88EwlVt
         Q8ele3BXtXjo+J0ZxPzX441FjaXgO2xnvwDQhYDPU9BOptLi+RokmjLaGYsAaxC7pXbV
         JseE+Phqnwnx8+E5GD7eQ2IvY97KjxFSA4RwuxNkwZxIB+LE6KSaM/DXwhvvNNmAGTZf
         otmRWjfloX+VAuxlZ+lvz+a3pGSxrTNWVjPYn2oT0M2xVQ6IzWPXrjqq2OUvjA6+pI00
         nH+EPmUWpdUZjR73gJozprdwkmHRj1TV3SsrNDJbphAiNHA3INKatg95m6xEo/Dnv9gB
         eTPA==
X-Gm-Message-State: AO0yUKVKVjUw0rqXEwsAVQRKTYOLXuBEyMnSx02jXq4868yJMpK6s/AG
	5jPfaYZl/ZpBKoebc6HNF7qudQ==
X-Google-Smtp-Source: AK7set8qgDn3tu70r+zsTJ9r+rEhDtm1GXC//7IxDL8CzckgSnHKYf1kWtKfoQ5k0QYbaLk1eE9ydw==
X-Received: by 2002:a17:906:fca3:b0:92f:43a2:bf7d with SMTP id qw3-20020a170906fca300b0092f43a2bf7dmr5303345ejb.73.1679228709628;
        Sun, 19 Mar 2023 05:25:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b009334edaed98sm943147ejc.50.2023.03.19.05.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:25:09 -0700 (PDT)
Message-ID: <95b1f70d-b7ba-370f-12c4-bf7a518ffe3e@linaro.org>
Date: Sun, 19 Mar 2023 13:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_052511_256785_7A9183E6 
X-CRM114-Status: UNSURE (   8.26  )
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

On 16/03/2023 04:05, Xingyu Wu wrote:
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


> +
> +examples:
> +  - |
> +    pllclk: pll-clock-controller {

This should be just "clock-controller" (and drop the label).

With above
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
