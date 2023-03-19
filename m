Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FE6C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ie0C8GMPI8arR2yAk5lOgGi0b+WNUgUy+UGcAVKvQ68=; b=CMNUiVJ4HgUmYx
	Q7z4mhzqRhWZUJKqJaqxeNF4NNUkPvK/Gt16EUwP8ujeJPQ2hRptXJiFdk61XPRY2f+nuarqE+/Cg
	KShHaVi11AjFoUWR1CUpJmY5u5o1jxHxTVO5DWZJtVdoWbzYEv7G8JvasE4FnjpdSl2u9o/k6P6gp
	rfVQD4pmrn2lNPqSH6/BJ5qCWjUUMYAJEx/6R/NXAanpwT6QnFu/TbcSDagc+/0J4p3BWilVhxzjz
	KK+3krSXHiyuSfu7isNe414f3yhofnhSzoCLiF+jDmXQTUGAX3UudqasNEvSxIvp8xGp3KzPXrAXr
	bXht5O4bwemPG9sandKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pds6T-006gVq-0w;
	Sun, 19 Mar 2023 12:25:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pds6R-006gUo-0b
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 12:25:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id er8so25148388edb.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFpW7DvYItPfLOavEDwf4Jv4q9OdZqCjmJNXxWGKgnw=;
        b=wBl/FZVyPgenBUiH7+ZKEfBWanrTHgh5D7yMrsmn25uzyjc3atmJVo+aEnYW+Lb4lh
         KUXzNuZUdbRLn8V5LmgNWehFT37Ep2EhrX1jMRQ77Ejl5DayBiE0ldlwW2XrtSlssQZr
         WkMY2qgcA20/8tBonUvE3f4UB10yPesZnaZsuEzB+dsABBWritlLho4AL9br7K+6fkDe
         TWAKFLLqQKazItu3wky+V1Ce6aUW2WU2rBZxdlf3gihjZg8ZGg0mIbSy6JLHLurG/dm8
         vfFKXtEi74MGZOoVimxsztnJ28pP6nHaeF6L0yOunsaxz0o91zOqGS3NoXWtgOuaYjDC
         g+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFpW7DvYItPfLOavEDwf4Jv4q9OdZqCjmJNXxWGKgnw=;
        b=N0447tOADKG/p9kdKi2YI8vZFjjc7/c1iCokD2ut80ZxwVB5KjdLio+ygumqn2EsGJ
         udEFjRO6cq9UTFoW8XOabyDzjD/R/if6arl1axXdouLUTUyhgVbHuecRpQRWvOxKRKk6
         B961kfCB63kns7mChDqP/rpIPI3uHoVw4UKizUvzvI/DzSFhUfUkR3zU+gKtCTixsjgr
         Nh2XBjLrO+8l9hNkmqtWPt6VbiOsUd23jcU90pJXRal1MhuwyRl7UGTa2goauXoUBQ2M
         0esppJu3FGAqT3W7/G4AQKsk6wh2zi8+0bgrbb2zoe/Cz1+mi7tDqBUc0KNx2/TVRVez
         2VVQ==
X-Gm-Message-State: AO0yUKW6bpadt9aojb67sO4Hfjh0AuyDToP+HIWTYAjIexq97CE6f7zD
	frCp5lKF01rW1C2HBh6YmiOCBA==
X-Google-Smtp-Source: AK7set9aSrS8i0GCekJwdkTs9pBj5b6jS08qCGaGpkNZS1KjkYCsinLht12Zf3/m+HWtB30GSoHOWA==
X-Received: by 2002:a17:906:6b94:b0:932:8cd:1021 with SMTP id l20-20020a1709066b9400b0093208cd1021mr5697603ejr.33.1679228733967;
        Sun, 19 Mar 2023 05:25:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id g25-20020a50d0d9000000b00501c2a9e16dsm480036edf.74.2023.03.19.05.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:25:33 -0700 (PDT)
Message-ID: <bf3a25e8-7076-d023-3b67-4d6c65790bba@linaro.org>
Date: Sun, 19 Mar 2023 13:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
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
 <20230316030514.137427-5-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-5-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_052535_226975_C06B83FF 
X-CRM114-Status: UNSURE (   6.98  )
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
> Add PLL clock inputs from PLL clock generator.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
