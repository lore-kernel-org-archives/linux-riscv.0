Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2C0C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYU3NFSmZhUCPZl1MSoM1BujHDCbnQB269ATjUygtUU=; b=EZXgTzr/3zFhVgacA32XL+Pv9P
	ID4gXN3Agm/7wBYpQD473lwVXXOzHzNR8igJgbGJagnQmrJn04GvynZKr+O+FfEkZvsEA9OSDMr3g
	aMN8PEeJZb95HMQQEkLXH4z0juFrZd+UchUtxYATUgmhdaZJOcC8NB9jZughOQc40fmODw5rivDon
	kI8QJLyU8yIwdN/JKrCXe4qXg2mmZftnYAMoVbmdWTe1SIx7wtzIMUvB/F+nSjdr5MP0ev/MzKXjW
	4V3/zO2m07MvfJV7/v+MVPlTxuiKPdv9f/w5qKAQ/B1jD6f+oRmkXWn3ruLNgWVMMx4wKsZzYday1
	s6psJFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVzS-00EFJ7-2J;
	Wed, 15 Mar 2023 18:36:46 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVzP-00EFHs-0b;
	Wed, 15 Mar 2023 18:36:44 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 97so4298261qvb.6;
        Wed, 15 Mar 2023 11:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678905395;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxNYErZCrfGfRXfeO3dgaPxxF1hWcdtOVMtdVcYuQQc=;
        b=Kn43xN6xfZwvD2Ctkiuxu7VjVm3lqxMlcj4SLzsDOhsWp2+HXgQnMG4Wr7sUqfPiGA
         cTzsoG6HZfaiM3eLhFkm6aQmCn035w0oqNJ0bK7QY9TPvjpf514DG56aQCb8IZ7mOc4r
         NFx7Te2chWKfy0RK++nT+SOKSX/dR8k0TxB9ZwdVey1dFEbbCxtxZ+rsUT88y43j7IQd
         o0FHCn1mVq8NMtvinHEazJRVAGyy7+zt00JFmPMCMmZOarQSKa5erQ+WOMlBBhZoPDto
         ZvjYx5HnNbF73Uk1DuFsj9+cUayRGgdEYTIdCZ+1i/nKdXQU+QWdj1FEdwCpHEIx8e/W
         XXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678905395;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxNYErZCrfGfRXfeO3dgaPxxF1hWcdtOVMtdVcYuQQc=;
        b=xrHsykqje8HvetWEROY1GI0yshsxtfFs3uxbFYCneLtCIEBQyl2xQjSS1AmtUGB6Ud
         RkQAooGcJxvWxUZ3rAKuuGye9RqpQLti8JvJUDe6c2hl2xNQ6VKI3g+fmv8Pf2R3xYHK
         MQgZFDbsYwh/PEFJQDMiTq1dFcHNMCgFX9tx33cgEuFmiHWS6jD5EjnXOezP1BZaLFcg
         KcJ7VnoHZ8xfSdhq1yRRghed3IwhPNKuhWsGYArFvrqKoYiz0LGpI+5MgqhKb38EPi0y
         Hqoh2B+YFURN1FMjcmWEkspEcxCFSjsovj17qe9EAsgSge9SlbT9h6OHMC46oB4JmErb
         0yxA==
X-Gm-Message-State: AO0yUKXQRpzkmZino2ZUyZ4V+WYYUtkTCyTlhguGc6vz8Lp5qK+f7K+O
	OiS7LGKO52xGuqOhOoWXDEI=
X-Google-Smtp-Source: AK7set+RtYb66umwPKKntudB0fcmO34SwQhaaHR0fuiHwZ1TPC7UhdryBvT46uIAEFhjOFJyH97Q5g==
X-Received: by 2002:ad4:5bac:0:b0:5b2:458e:9240 with SMTP id 12-20020ad45bac000000b005b2458e9240mr2463411qvq.41.1678905395213;
        Wed, 15 Mar 2023 11:36:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m125-20020a375883000000b007428e743508sm4172499qkb.70.2023.03.15.11.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:36:34 -0700 (PDT)
Message-ID: <4a258d74-0c9c-141a-078c-d49a7c0106e2@gmail.com>
Date: Wed, 15 Mar 2023 11:36:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] gpio: raspberrypi-exp: mark OF related data as maybe
 unused
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mun Yew Tham <mun.yew.tham@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Nandor Han <nandor.han@ge.com>, Semi Malinen <semi.malinen@ge.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
 <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_113643_227624_554F57A6 
X-CRM114-Status: UNSURE (   8.32  )
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

T24gMy8xMS8yMyAwMzoxMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGUgZHJpdmVy
IGNhbiBiZSBjb21waWxlIHRlc3RlZCB3aXRoICFDT05GSUdfT0YgbWFraW5nIGNlcnRhaW4gZGF0
YQo+IHVudXNlZDoKPiAKPiAgICBkcml2ZXJzL2dwaW8vZ3Bpby1yYXNwYmVycnlwaS1leHAuYzoy
Mzc6MzQ6IGVycm9yOiDigJhycGlfZXhwX2dwaW9faWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2Vk
IFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3
ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgotLSAKRmxvcmlh
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
