Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D6ACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9n69UHQPkYVUJ0cKYth2hJrPwJhJBZJvlR+cJZjGeP4=; b=EsSKyIOlb69TFp
	6iPCg4jkKbpYUQwWWSfKoT/lyS6A8lEEXLpiOX4X/vo7T1j38fe8agBM5EpNFlWnSNgX9PA24IbLF
	I2ZiV9iQV9TOmC3FPL23CDjWGNdZjGzGdHIXcbzVx7U2D0b52rlfsJX1MJJm2Xo2H953Rx2y8RK17
	/habDGGbACSAw29bgL8bNCEBI1MHAi0aBkWoe+8ed39NrwvprBpNA1k36bWbYrRqUynL8Jht7op38
	1AIkPfiRQ9Oawr5FDGpyJ8zA3pZ3qbM6GBt1m4l22kQGk5DHcFMdoI6rg1Qfr5tuk5ONun2b+9XeK
	A1WP7UXDw+vNrnkOYpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaPu-00000007vzI-0pQI;
	Wed, 10 Apr 2024 16:03:18 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaPq-00000007vyh-3zMx
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 16:03:16 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bbd6ea06f5so3684988b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712764993; x=1713369793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqluekjGgYcc63to1H69mMjnF5MI34zE+Mk4XaesivU=;
        b=GOtLWFivVaOXK/2tEw4ZvNnO5iBw6nXeQmKeoxTJN2xYKJiHS/qlBlzatacmhbABxV
         weFqVKnNKs5/BR7/j439jjbitGJMjMFZM1J2ML3X2oZgMEkv4zXsVq93VbBCeYfou1Tq
         ASL2JIJsBxgM6Kec90ul5cmXmTU7LlJ27ARhpKd3A5gaak4v4TEV/ZdZpCJoYor/Tak6
         QI/SGCV53L0Uuh/azRHe+duqcYqQz6nIGh2Zdz2pWKAdVsa+EigPXhJKOhl1suKvJZBt
         kOjfUqdAdBUVSgUcIQkJpmAUNH+27CuBUQmFNUL+OYKxEFxGBB/IKYtZZnsJ4JV0V6+y
         MzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764993; x=1713369793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqluekjGgYcc63to1H69mMjnF5MI34zE+Mk4XaesivU=;
        b=QHSNET6AmjO4bAk5zq8o+vtI7HvsChA5rhQWwjMM+yGOdLaJhRDwTwaZnhEYMgfobe
         yMA0LY2v+fEvHMDI27twE60dCjGHECUyi4JiK1/AgGVzs5KaaPEWEwWijCCLmOY1YzXi
         IulN53uxTlu54HGmFLY547nK84ichYMK9SrERMdJyVb3f0dimKedsq+0wBlynG77gp2i
         rU/3aqfYKo1+Z2+ARuQ7/Tv+qQWWXNV7hRvhp0qq0HhOpPpBW2x5TRbf19dbXk/jz477
         QlVGsuzj7hpFIGNQGMWswPOQNdZP5sB+roQ74El9vvo6x5eiJrBPsrtpKiCDIA0jVaKY
         FHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/dJJA8kQi3rTxyY3N879J4ebXZCkHiHCIONv90OwVXuIUeohMdxRkJKhMuoAKWZmlKKuoxUVVZQEzcwLGWCcAzdV+S+fWfRtuOSUBhgYb
X-Gm-Message-State: AOJu0YxFTLPgo8b7YBZA7Z3UashvOnr60sZGJBP9l4KJk0WioRstnWaP
	9np4c02ibh65LrnCbTFt2Dw43JatKD90Bwbu2SuYwlcWEIK12IbhVVfP3RAlVX8B+cbMuV6XA44
	Y
X-Google-Smtp-Source: AGHT+IHzP8P9A44EU0tio9BUIAfSMKe/XNB5s1q15KBSLlEMuCYnD+nKfQOO6R2Enhdqd8abgspEVQ==
X-Received: by 2002:a05:6808:1488:b0:3c5:eed7:4cef with SMTP id e8-20020a056808148800b003c5eed74cefmr22560oiw.20.1712764993145;
        Wed, 10 Apr 2024 09:03:13 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id n1-20020a0568080a0100b003c5eeb1bc64sm1337572oij.1.2024.04.10.09.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 09:03:12 -0700 (PDT)
Message-ID: <23c88f5b-177d-4698-afa8-211a2bf07597@sifive.com>
Date: Wed, 10 Apr 2024 11:03:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sifive: prci: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240410155342.224061-1-krzk@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240410155342.224061-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_090315_193057_21847A71 
X-CRM114-Status: GOOD (  13.87  )
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

On 2024-04-10 10:53 AM, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/sifive/sifive-prci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 25b8e1a80ddc..700a1be9ec47 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -611,6 +611,7 @@ static const struct of_device_id sifive_prci_of_match[] = {
>  	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, sifive_prci_of_match);
>  
>  static struct platform_driver sifive_prci_driver = {
>  	.driver = {

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
