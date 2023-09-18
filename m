Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DE3C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohalVzgh/9eZ5ULHi2gY5eoHfuxoCq1N6PNrmHvEz3E=; b=Si5bx7VjE/KUA7
	AgQcHLjEi3jdgsA+jmb6dxhIus/+1XSICZoZyHh8SLYeC2rYZmBA3mKpfXAV7TzW2BGUHsVdOUods
	fkKKzHQk1SEWUkWVqlEEmCM3Ro3mtTGy3ful3d5iMbyUTrJFP48zJWU5RAE6jSKiAjgtPIeXwy45q
	4hNhpbCULsD9ktmO1yuBswkyDWlPMmLS8OedZ0R5DvzodN1xOZQeq7T+VaTZGwOx5eafAAKk3OGF2
	SI5TGvb22fqFnmd0vQFUBqzlzwR618euPFZCjgLYjhoGETWgDbmCtMAUvav3ObnBvNfC4/yQKf2jZ
	B7fGiftIzoG/+AzS17UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKew-00GGAX-1x;
	Mon, 18 Sep 2023 20:15:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKes-00GG8h-1D
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 20:15:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso6315069a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695068148; x=1695672948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2m8Sbfwj+u+lTjFSP79r7yKZtx9J+wc0Oa9bsS9kLI=;
        b=aEGMjyPuRvl3/ITxgla+bD1SedDmmruEwMcpenIzA5y7w3NVzZN+6iTfWTeBcoOjXs
         EODwgiBJGMh5ddl2IYbUvOO7jY/hJxDwO8ikJATpqUO9ls7qUXaRDrZFFrbvImnlMLRU
         N0vSMyeRI1Awi6OcgGskyXR3qGYODJMFyAJ5UaQtymhjrjYLaI5eDL09hL531LXtCIPz
         HLw9T5Kr/c3Vo178naDBFeog5gPQx55N6qLgnqMQJviBTX33MoTg0zUssbw4tR90FDwc
         3PqGOODJQlw8I9JPFpqygW2c57fRErb4ZHOlOxpfM7QXb6Wh8PMWucAxFQbi9ryeHOU2
         VShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068148; x=1695672948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2m8Sbfwj+u+lTjFSP79r7yKZtx9J+wc0Oa9bsS9kLI=;
        b=lLCu7vaz6r3WLDgMZg7CDIc+QulvkJmeUJd1F7cb24R41s8VQR0D+ePV7gAZtrnD6U
         fFLUYymuqU1522bCPxvld3iTh8l6Ye1Tw8t9zocT4/AIptaxvCA0+CdkI9tbp7rzJuSt
         rdymRwDkhw1nKBA8u5l97dhyguz4eltxk2RYqlQRvtTisH758SlTCYf0iDelsfDzw+Z5
         TL0kdkwpjwtA+PNqoK6JQ+yJ3wmOGNZhCzX1I2FunYUm2TAJdFfumCYOlSoGAa64NVxn
         EA9rD6z6Z9Ul7IMbTQWOuwto3ly4fICCagV5dbIHrPc+gvhJ9WT82z4TqieWEsNJL9Uv
         ixEg==
X-Gm-Message-State: AOJu0YyD/buT7ocIfbSWzvu1G+ls8v6hfbx02Stp9FicUDshZHFbvyci
	CYbBTbbl+vFjSY+dtlpBJKJz8Q==
X-Google-Smtp-Source: AGHT+IGpwXjOHzqhVz9BxHPwLWhbOmaxmMQnWiyGQWOBpz6HZ2COGji7alRXtAxTCpE7TM6YqLpCQA==
X-Received: by 2002:a05:6402:4492:b0:531:9c1:8271 with SMTP id er18-20020a056402449200b0053109c18271mr3914020edb.14.1695068148443;
        Mon, 18 Sep 2023 13:15:48 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id dk13-20020a0564021d8d00b005312b68cb37sm1297313edb.28.2023.09.18.13.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:15:47 -0700 (PDT)
Message-ID: <0f25cc55-b353-9bec-009f-589b04e36cb4@linaro.org>
Date: Mon, 18 Sep 2023 22:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 09/12] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2042 uarts
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Wang Chen <unicornxw@gmail.com>,
 linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230915072517.118266-1-wangchen20@iscas.ac.cn>
 <c4aa8d45-1248-5656-a045-a475ec737c0f@linaro.org>
 <MA0P287MB033226287163E5E20485433DFEFBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <MA0P287MB033226287163E5E20485433DFEFBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_131550_428084_AA9AF41D 
X-CRM114-Status: GOOD (  12.26  )
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

On 18/09/2023 14:49, Chen Wang wrote:
> Hi, Krzysztof,
> 
> I see Emil has clarified in anther email, I copy it here for your quick 
> reference:
> 
>  >Sophgo and StarFive are not the same company. Sophgo are using RISC-V 
> cores from T-Head and StarFive are using cores from SiFive.
> 
> And SG2042 is chip from Sophgo, and JH7100 is chip from StarFive.
> 
> So I think it should be better to use a new entry for sg2042, what do 
> you think?

We talked about different things. Previous discussion was about
compatibility. Here, you should just not create your own enum, because
there is no single need. Just put it to previous enum.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
