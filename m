Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BF8C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWVvPVV9pUz8LaUqjAAe0vrY64EVE5qL8PrdqHS1NPw=; b=MaJQGEdrVHF1hl
	NvjipoPcuvfyflRolcX+M8vyGyRpeXimYpZa+ZbWXTzaKUF6He1KuZD68U2I2ls+dUSmeF6p1SY3O
	30hbkupV3H4mHevyoWnnQYcgVnFDrGGq+P4WXdwOj+AZXzL8LrILeBPqCyMVPn/cnLPi90ahu/6jR
	gVlIX8e/Vi3pLCR8XvxWe0iSzYtpPSlx8/vrIqxUnXYMnSZJXGi9cmohuIvlBggWE+H6PNz5iE5ld
	Ev18+eaU9mK4UdyKJKQOygW0FLcSuBUOxbzGmn+7uKuxUhrgbyshzZUWKNioxEMbXEGQW67LsBmHZ
	YpIft3Z+kS9y+vbEtiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBhBc-009Bl3-E6; Sat, 31 Dec 2022 19:06:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBhBN-009Bbb-As
	for linux-riscv@lists.infradead.org; Sat, 31 Dec 2022 19:06:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id j17so26733033lfr.3
        for <linux-riscv@lists.infradead.org>; Sat, 31 Dec 2022 11:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NfbFQvWMrg19C59QAiBdh289D1/4YcCn92kh7icEkU=;
        b=tGBH/FgFFrNA8or+SERewmHOA01oohuGeeYqs4oLy5LJ4tQPrcukFluDGrmBKNwR+y
         wlXi1WF/fNdb3yaoq6w3WdKlPmslt5WDbNDVkiemJVt9C35CuzxEQ8hxwySU45K9M/u1
         5zjB0jghIdm1naf6Ax8YjYXnZEdzM4NzqzQKk5ZxGdVcQOlB7KcJzf4JKKD2UeOPQLYR
         8QQdmUc1QKtyG5qHm4m+Cyr9DSHvv6fe70k6eHSA1LQARzQLPzSGSqVEkfZ5DpiT5n9g
         T1lGLtbIS2QN150DSZBHn/jkLcYQ1rICdBLxHVdfIcHskiVceNntvulCChhPPHHeL6k+
         diqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NfbFQvWMrg19C59QAiBdh289D1/4YcCn92kh7icEkU=;
        b=kCIDjxP7qkU8M3GtYqopwqjWPT6wca9vxgOk7vucyB5y4ySRe73MOsyNwGFeBmNp8U
         QprvAdeg+IeZgyP4xrvfM/698IR57bLpHmya2q46ZkaQkM/KhsZLrmMoXA0Y8AYZi6/4
         7I//LlyetoqA2eg3hZTF/AeGdFsCXK7VGI+D+2gpt5RVo/lDLxekJ3X4ATRZjYZRDgWi
         MDp6m9u30i39lNd01uEdIfVigK6+hkGR2X/ijEuggh200ilYvewEykR8fj0qLwouCfBc
         ce8JwIkPKI6axwUJa1zSOyuW8cDN9tULyAxOPHaSD9DeqqbRe7L40LLofsMqXYL165Qt
         TgPg==
X-Gm-Message-State: AFqh2kqX813fexB23+zVoJeBwna5MnmKoqIEkmP1rYcguk4uenImYAyM
	QAGPpQl0ffI9MppuE/D+p7DWQg==
X-Google-Smtp-Source: AMrXdXtZojB28H4lrGmOvJhUhvTd3BsQ/EYuphNlQHEHDYK4kVuJlwOgVJpbalKsqxkDm0RfEyNZ/g==
X-Received: by 2002:a05:6512:2385:b0:4b5:90be:33c8 with SMTP id c5-20020a056512238500b004b590be33c8mr11051695lfv.48.1672513570654;
        Sat, 31 Dec 2022 11:06:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512109200b00498f67cbfa9sm3941314lfg.22.2022.12.31.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:06:10 -0800 (PST)
Message-ID: <ec51892f-d825-48ab-ec11-377e8d137e4a@linaro.org>
Date: Sat, 31 Dec 2022 20:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] media: dt-bindings: cedrus: Make allwinner,sram
 optional
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231164628.19688-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_110613_484993_7EB881A0 
X-CRM114-Status: UNSURE (   8.18  )
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

On 31/12/2022 17:46, Samuel Holland wrote:
> Allwinner SoCs can remap some bits of peripheral SRAM to a contiguous
> range of addresses for use by early boot software. Usually the video
> engine's SRAM is used for this purpose, so its mapping must be switched
> back before the hardware can be used.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
