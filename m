Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DABC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4AAubPaXa/nwLdW1T7pJ+bhqkE+zEc3PjstBMt3hu4=; b=foAKzCQ74R3RLh
	8Vi9k29MRsTWWz7srBbeunzrVoFjnEbZs9lbc0m/ODgTcitqZ0UX4WukpSaM4c2SoI/yWmc5FDiKS
	os7B7iNQ9wnTPUY4IoR/kJSmxRN6T9HMzbjVDTey7UPsWurteNYxq7YHwQLzRFEV6dgyL5thQtAMA
	rmY5ek1gZQkIIZ9YmOujaZiicjFVRhP8izotcBXyF1rkVJdPkiZY7Y1q1So4zrTQf7m/oyo1tm4sm
	ZxOa3rOh3PnvmvhhGJnggp5qIBWzmRaCeZigIgFno2Z6KUu3SFYw0yjVDgQ39XKofmb8jQ2c3puyi
	iBaXJDg8aMlFua/FUw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMlpj-00D5Lz-5P; Wed, 23 Feb 2022 07:13:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMlpg-00D5Ka-3e
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 07:13:05 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D92343F1B6
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645600381;
 bh=Yk2F1aFfW1Ld0LeoUO0G0aplUyclczODbC5pm0OWl08=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=luDfmwLaatYmm30oHOZmZtrGQtZJBKq+3nmMzUG2aIXqMLMMtBHoC0IUMVvOb8H9O
 mPUYUk4KsO9rX66efRwDsfT0RX3Vo7H7mTulQoWHvGcJ+rseybYLnocLlZ1Imkg7ZO
 rw5oHMdQevQERiWvdL3B7hrpLz0CKikiTGESWLNLjcGht9C0/U+UY6tpVt7a71iHBI
 bHPk0tEqoj9EUs/7UnYMNzrvjtXuBDmHXSWj30GaPJPoYCczhX3KPOD6DfCsTG+rQs
 +Wcge1V+S6zcn0zDXPCKgC1vkFSdeOHvaZrXRh6/qbVoLmWO741JVsQ5WIW4w37o2P
 8WMOA/v5gsCBg==
Received: by mail-ej1-f71.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so6630476ejc.19
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 23:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yk2F1aFfW1Ld0LeoUO0G0aplUyclczODbC5pm0OWl08=;
 b=PzJ3Fi4XxHU74v0lo+4hwOcV/xnZDrZEy3ZOvuoZLG5jVmQAO9tXrqBRfE/14ZrEpF
 EauWNLO57pDbZLG91OPYL3omADGhQoLdaPLWHfJrcnB/q0z+TBlDzA5OCRbBts83MdM/
 uS3QPP4d1M/W5I0i/VsKWSQqpMObDS8dmYRHkYy6ow0LIrzemD9huSNdeENA0WnbCzUG
 Hhm2a74nAvOMFs5T4JBmSETxFtbLPy/SHdvrON8K0uWFzi4CpNJumKvDy/DqK1c7qHUt
 sBDLnkhqGGWu2Pgs1Uksv+cRc1w95NvLFQflIX1i0y6HRTY3b/kICDdQgcpa+hNR621N
 A0aw==
X-Gm-Message-State: AOAM532b45X3c3tiP6CoYcwNIVOtr2yeuIAFo+aLR56ZZW7OIxVjVtyE
 HusOBUPtkY68hunTZmjs7XfqVINQY4o92Fd4He4SNG/dDiPV8leAOtv39YwdNE9QXChuw7eSDLR
 9aRv1IvkZ9PflvRjjOtGPKE5h1kPxYbiYJt6Oq2Ou6VzpcQ==
X-Received: by 2002:a17:906:64e:b0:6ce:36ae:7ab5 with SMTP id
 t14-20020a170906064e00b006ce36ae7ab5mr22053165ejb.192.1645600371110; 
 Tue, 22 Feb 2022 23:12:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmck5fg5WgUrwFyTS+l2MRKX24yg2vyux+78JbFW201Iyi4ERfI4O0zm2hCcKJyNLWo8yoPA==
X-Received: by 2002:a17:906:64e:b0:6ce:36ae:7ab5 with SMTP id
 t14-20020a170906064e00b006ce36ae7ab5mr22053144ejb.192.1645600370934; 
 Tue, 22 Feb 2022 23:12:50 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id g16sm6978683ejf.218.2022.02.22.23.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 23:12:50 -0800 (PST)
Message-ID: <65edc257-82ec-e100-7a44-5c510aba51ce@canonical.com>
Date: Wed, 23 Feb 2022 08:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
 <20220223062018.nbgidqxgh2soz625@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223062018.nbgidqxgh2soz625@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_231304_290525_948C08EB 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMvMDIvMjAyMiAwNzoyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gTW9uLCBG
ZWIgMTQsIDIwMjIgYXQgMDE6NTg6MzVQTSArMDAwMCwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20gd3JvdGU6Cj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4+Cj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIE1pY3JvY2hpcCBmcGdh
IGZhYnJpYyBiYXNlZCAiY29yZSIgUFdNCj4+IGNvbnRyb2xsZXIuCj4+Cj4+IFJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+PiBBY2tlZC1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gCj4gSSBsaWtlIGl0Ogo+IAo+IEFja2VkLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IAo+
IG5pdHBpY2s6IFB1dCB5b3VyIFMtby1iIGxhc3QgaW4gdGhlIGNvbW1pdCBsb2cuIChUaGlzIGRv
ZXNuJ3QganVzdGlmeSBhCj4gcmVzZW5kIElNSE8pCgpJdCBzaG91bGQgYmUgdGhlIG9wcG9zaXRl
IC0gdGhlIGZpcnN0LiBGaXJzdCBhdXRob3Igc2lnbnMgdGhlIHBhdGNoLAp0aGVuIGNvbWVzIHJl
dmlldyBhbmQgZmluYWxseSBhbiBhY2suIFB1dHRpbmcgU29CIGF0IHRoZW4gc3VnZ2VzdHMgdGhh
dAp0YWdzIHdlcmUgYWNjdW11bGF0ZWQgYmVmb3JlIHNlbmRpbmcgcGF0Y2gsIG91dCBvZiBtYWls
aW5nIGxpc3QuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
