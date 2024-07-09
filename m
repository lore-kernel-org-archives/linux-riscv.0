Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F79C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYG9rXZaoWDlo62cS1V5ty3upxXQxKJ1apk229L1+Cc=; b=mUMZYJOuyYqWPt
	rcFFfU7RuCnPPHu8G9oC/7IfokzcrrYBTi1EU6JT7o7ENB3LTiQydsOTo2NcN+E+3Kw/bTD+lPcNz
	0kxHe75lzLPV04owsT02UKaiQMRX0UngiPpicIoESTi250yHJfZgEB+9h+BF5ZBQy49jBzyj5nEl+
	yWWcdYIt9r8pbXyTZJc0jh47Y7u+RM1Iet0s7sQ0CrX94s3zb8atabfwQFuYDraZBVbBq3Yqz5KdG
	eahtUdGuoqoQhfNaLBDHT82Gjm1ttdowEejjsN4hcoV5Tt02pcD6CHEp2pIMA62jXua96P6ShUACT
	d4WTPgmJew699kPEUFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRC7w-00000007cXz-3WIv;
	Tue, 09 Jul 2024 14:47:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRC7t-00000007cXA-12qM
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 14:47:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so3066019f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720536447; x=1721141247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGU16UMyPzn5K7sq2IuW9mm7+PT26orMfz71lEw7p84=;
        b=IZZ1OxAdkQE+OPJRDicfLWQPcYp9mjJ0FEYih+8nQ3t0yem9GmWYzlTKSvY9JTWpE9
         MLTgvzy1okYfbfE/5iAnBsnwBAhvheUAUON1wZ04GFot6mf34u4ptbjPLaGv3aYGDJFP
         2caew3pHlb7Afhm1YCqkKzfNnoCzdUOnjsR09gqxwx/6t4C3qgrP3txrkiQaEcXrqZ0Y
         rUuaD1qX3uHXM3e2sQdiDCDp/vuSG3Sfyxq+U2GY9mZeqdLj4Yz0fmNnkA97ouydxgWE
         UzscifEHt9bB+gfJwFYqecONQkaiLb1i76EBAqy4MVrwS1AnT6/GjLzG9cFCGHK+/pLn
         7Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720536447; x=1721141247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGU16UMyPzn5K7sq2IuW9mm7+PT26orMfz71lEw7p84=;
        b=VpoUbQ4nzrRzsz+pU7J8GaA20nklRqePMbkLl+8AZzbMaNrfdEMU6TGZszU5X1V+jU
         1cIii+4lkq5NyWdZU4eXiSHCwbwK8ml9Cf747yzqPFNB/Fuho4DqnLTR5czkNMNyqoQi
         JAQuP2KjFi1d8G51vM1+yCaO/zj1W9kTzndyWS7MDtfzb/h5HcCQn+DWctJ3ifTqkxvb
         vQbukkbbBjgmj24DHQlkhUyo/J15ydWM2MYXoi1yKwgoEZgx64NJJBlQbdrGKNUt0B3x
         CfdEocLQ6ramt3gSAaHKXzH5EGUtSSxkKBdZn08aDAJ1HmkF4+d3WXoSF6uggJN7j6cq
         VXXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQPPUfPa0tfYWddXL6BBGw074Kvq4GNtStHE11A+y8tRX5I7JBhXFk5J7o+K/ANIPZctRk+L7/6wZw5pfjqL/3xxaIxgby5tu+h+RJiyzw
X-Gm-Message-State: AOJu0YyPSa4SWoUHz4r0biGps9/KKo4cPfRxgif3bBNery6/TyYW7UCV
	zCJNfuHfm3HRDeQI8LsnE+HmBJuXKMJ7i2vilV06rH7TzWtSsYglCRBHIQHhqNg=
X-Google-Smtp-Source: AGHT+IFWVPBkZ6P6fOnS0f+vSCLh6Jw0ML5HsTFsO1p/rCJIxzFeHamqOr0NJgMC1fqb/fWeNruTSQ==
X-Received: by 2002:a05:6000:11c6:b0:367:940b:b662 with SMTP id ffacd0b85a97d-367d2d5f2demr2580537f8f.31.1720536446756;
        Tue, 09 Jul 2024 07:47:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cde7e171sm2746398f8f.18.2024.07.09.07.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 07:47:26 -0700 (PDT)
Message-ID: <2835f58f-3ab1-41d7-b85d-174c769cbd3f@linaro.org>
Date: Tue, 9 Jul 2024 16:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: timer: Add SOPHGO SG2002 clint
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
 <20240709-sg2002-v3-2-af779c3d139d@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240709-sg2002-v3-2-af779c3d139d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_074729_311584_25DAB0AF 
X-CRM114-Status: UNSURE (   5.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMDcvMjAyNCAxMjowNywgVGhvbWFzIEJvbm5lZmlsbGUgd3JvdGU6Cj4gQWRkIGNvbXBh
dGlibGUgc3RyaW5nIGZvciBTT1BIR08gU0cyMDAyIENvcmUtTG9jYWwgSW50ZXJydXB0IENvbnRy
b2xsZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25u
ZWZpbGxlQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+IC0tLQoKQXBwbGllZCwgdGhhbmtzCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
