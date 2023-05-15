Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1299AC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wk/t/EAxpLSulzp2VOit72Fk4uzWaFhHYzED4d/jsog=; b=CHch8ETt0oynnE
	6yBjMqjHmPtmsjdoYYtWfl4uKZWU14vpjCm7NvGHzipiUBRn6iD/9q9vTTv9TCPTbVbqU99qMO0Wm
	DY5GOqkHLmQbWT8QQBvbJ9eltXcCsuZSiEgklh6WHeUTljCAhxQFOpdL5idg30a/BfRY5y2iPkk0w
	HkHYrlEuqEhz8UXWSMQoYS8Vy7b7VdmP0yzxpigdRGsXXbzvHpbHXebFRwC/gK3fwoHYibfoMg2Km
	EOUbyVvZyQRiKr+Za5fBlzRPl1CsYENr5oOePTXQYjjdEPt7fd6099hJG1IyD2i7w2g8crTJmV7wq
	iEr4m+XOACoWUIWsrvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRg9-0018ej-35;
	Mon, 15 May 2023 06:27:29 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRg6-0018dC-2k
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 06:27:28 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-965ac4dd11bso2462759966b.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132043; x=1686724043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPH+8xvBh7NiA0Q/69MSU5S3kxpPxX+T6hvZkKu8gFc=;
        b=bq3jJGSEp9INUCx1XHGMmoRyFQACqzGSIl3W4kUwn8VkHgx/N8k8S9we6QD9nhYC1J
         aXHBJQML+9dC9xgZNlO7KTgCehQIv6L5Y08FbkVwgCzmyBT1tWWHJWrq3z2BJqRjv8gm
         fw/RhfjNnlh35OQ39j9MI8IqGFVCZgWG+4bceY39I+EneDAXiNWyeZ+HftVJ5FFRz0+t
         RTeBVju0xsxLvlwviFNlZt/CZD8HMaHB+v5dgAZRhkMtU8hzKUe8KZ/rrRqAqZU0cAeg
         4KmMKIgVHKcglZA7kDXMmPF9cgolZSCD7eOlPiWR3WRW52tEfZyLVbLIfOM5PLzJdiYe
         eWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132043; x=1686724043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPH+8xvBh7NiA0Q/69MSU5S3kxpPxX+T6hvZkKu8gFc=;
        b=agmd8ParyUlRrsFBb6MzXJ+wpKTkmMIQv5U8Jb/WGT2th2Y5n3B0QQLkbbIrHKneSm
         0O6lEjbDC5UnTW6/uiAKEdxPD0TPYtxmbpWnLt5aqs6AHzwLF+elTsptUEMpzGFT1U+D
         GKUbX+zvkEnFpaMs5lcktAkQMxxW3d+9elr8/aPJ5m/rmFy/KnIu0QjMWTe584NX+GLn
         IWzRskCBiCVI39WxJLBTdamjHY9kbJAnsW2Fqnd1fFBK7loNdr4fuVBcfRtZQIZdIlYJ
         Qo15VIJVbrzzVolywb1Iwuv0Z6dUqLe91RuKZZmrk6DQCd/TP6U9Ud9abXQE+Wd/mF5J
         lJaQ==
X-Gm-Message-State: AC+VfDwzFt/4yMhbY5upbxxSn6Yd48CC0GZSCwXKUb87/UpviCAzBnZo
	QXtPrt2WE3Wu00GXxzGsAHhm4Q==
X-Google-Smtp-Source: ACHHUZ6KhAPIFec8ZHcD908Z5f0wNboh61jxF1yxMAz9PexUx03rIa02ja5P3qimJ/lzKhVbLNL3UQ==
X-Received: by 2002:a17:907:8688:b0:96a:3005:61b7 with SMTP id qa8-20020a170907868800b0096a300561b7mr14216778ejc.74.1684132043675;
        Sun, 14 May 2023 23:27:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id hf15-20020a1709072c4f00b008f89953b761sm9004330ejc.3.2023.05.14.23.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:27:23 -0700 (PDT)
Message-ID: <fef0ac30-73c1-86a7-e114-0846ba735965@linaro.org>
Date: Mon, 15 May 2023 08:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] clk: thead: add support for the T-HEAD TH1520 CCU
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, mturquette@baylibre.com,
 sboyd@kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Wei Fu <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-3-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515054402.27633-3-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232726_887605_FD38679F 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/05/2023 07:44, Yangtao Li wrote:
> Add support for th1520 in the clock framework.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/clk/Kconfig                      |   6 +
>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/clk-th1520.c                 | 999 +++++++++++++++++++++++
>  include/dt-bindings/clock/th1520-clock.h |  92 +++
>  4 files changed, 1098 insertions(+)

Please run scripts/checkpatch.pl and fix reported warnings.

Bindings are always separate patches.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
