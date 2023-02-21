Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B4C64ED9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaHG+Qq4GoHpHzR/552B/9jXMuOWwjdYsH7qIH1Blb0=; b=ATESSbTmriTC/Y
	QsPsDVtMDTEPe7cAppbfKiQOf/YTsREsGMTvL5liKSCsi7nw7ZhZAYMuExHT7nQDGpHgVtkZK0BkH
	lkO0khcvFMyRyKPxkWa2xBdjxJtCzzViH8Xj6hpx4gQYJXj/6/nssuGb6XClwq2imcgJ/OnPgErbR
	MUKKpGwFnstVhll/pQmpZ9E88xL+OVM63wXogrfT2WsCwB3MY16z4JWUStKyrOeCCjx7OTFeYtw0c
	+fkQ7ak0ZmQN0PFt5GMtKtHzSf/GFGm7g/6KznMX0qng4aBCwxaAhVEeHCH+pSr1lmwH/GlV4KfHz
	7y0oVWZn6Eefv2UVXBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQyw-007cG8-TO; Tue, 21 Feb 2023 11:38:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQyu-007cEB-Az
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 11:38:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cy6so10428955edb.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tq51gAJIQj2Xs1ZKNGqnu4NrUprTsJTQmSC0ttvYNI=;
        b=K2xiRBkU6h0mnBM8imm/VCEbhvLY/ceuXzgd14FpbsVy0S3mv6rsKv3gJBSV8yB1xw
         snQXZsLf/yLPCLdeWUkY8GKMzivAvGnCroU1GodSQ18ZKIGfMfwzU7tnoJRxj93qykbY
         WQAFgcT/x3hJIPTx88Bjc+BbZDK7stwk7udrkieVBM7wukU4ki+ksjHqT8ua0u0whs6N
         mYnuTGmVBEQT2GKu8Vud0p4X5B/7gvnBOu7FvCj3GOytHEYr8kESWejcP2tvYuO9IyvI
         PgMH9egv5fQJ90Jy43/FFzeZKGMluW16mAucPJp++5Cs/bVQP2jzdLmXkHKa5Kp7I2qO
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tq51gAJIQj2Xs1ZKNGqnu4NrUprTsJTQmSC0ttvYNI=;
        b=j4kycFdHuRwIHeDATV7zFcJbmZNDgjoFJpbukGa9HiumphWTeACq0Lfihp9aafWQXJ
         gLVOsB5HFZEQpwTHNMfZYaA7Rc9FuFBGpmcF9QPJDc/4+G7Nh0RaLHTExFeVnsMl5orc
         Rq++jU7quo/TNTIAuU+FBh6vXJ3sFBXZsnVrVba1xsvKua20wXW0uO7dNt37mX0ZaWXh
         GyAXCpjgibyURjIW6GmKhQIYpVE6L7cCxR2BcLAvZkGihOE7C5Qalr7bdHXP+MvO575D
         I4lucms3NFRommhO2grdBOzXuuTDYwqGh3tLz5auqDqg20QE4l85htLHsnEcsoJxMnUb
         4U+Q==
X-Gm-Message-State: AO0yUKXCsf25wizopbygVdOuyYY7h57LVyZ1W418nX4yM+Gr6AobUhhw
	vJyoe8276kVs0DSDiSmdaZCuwMwg7VnURhcH
X-Google-Smtp-Source: AK7set/3gIbpZCbGX8KRPqHk4leYzTL0UBaiSORTZuYQavAfonAT7E7VUPDVMnim+cH7HYssAsE26Q==
X-Received: by 2002:a05:6402:1203:b0:4ac:c1bf:2a26 with SMTP id c3-20020a056402120300b004acc1bf2a26mr5378277edw.12.1676979527040;
        Tue, 21 Feb 2023 03:38:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b004ad601533a3sm1483381edb.55.2023.02.21.03.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:38:46 -0800 (PST)
Message-ID: <f21e19d9-206e-31b5-0287-0dff6ccd6c6d@linaro.org>
Date: Tue, 21 Feb 2023 12:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 16/19] dt-bindings: riscv: Add SiFive S7 compatible
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-17-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221024645.127922-17-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_033848_406156_95C0E655 
X-CRM114-Status: UNSURE (   8.13  )
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

On 21/02/2023 03:46, Hal Feng wrote:
> Add a new compatible string in cpu.yaml for SiFive S7 CPU
> core which is used on SiFive U74-MC core complex etc.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
