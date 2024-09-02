Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76558CA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKq7InAJvKUFuVVj2tE8gcy1SARRXlshCAmN6kmSQSo=; b=V/TnJpEtBv2Z3O
	HsynVd+T/UGdEUv1ir6RdOXW6x4kkoYAp190Wd2DNFuLCHzF2F16yJMMOq85IILNPzKYUI1IbxmrP
	P3/YPkoumvE624W7rnUjin3HwrLmc+B8Wm/zXf0FGFJKPvVN9e7w/bzA3Bc6Sg8IGfMCaOv/iCgck
	xhkxq0Y23drND499Y6Sfj9RBd/JP1DCTk9s3KlZqoszOQQSvW0nL9hXxfK+JsuqXi6JPxVtVMZeYY
	jvLnYQISitvIC7gPAHXgu9cfUk99G3nJsl6tYTmc/4u5OpcPcf+ko72lDQc9NHzjRSWoBfFYrUgB+
	LFdZ4kVTk3nijygRKNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3t4-0000000Dp3O-48WV;
	Mon, 02 Sep 2024 10:02:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3sr-0000000Dp1S-3LYG
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 10:02:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c255eab93dso165940a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725271324; x=1725876124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azCIJs0Yes3UGBt+MS43513CbCpSEhJdQPA/Vui0QvE=;
        b=Wo6+sKWfe9xLts8oldLNZCPN/wqmNOLB3X3pDjy/KAgB8P2NLNOtEcfW/xeoUusGk+
         ocWLbuS76HZ9/W2JshJTgFc0hozLaTVRb+B70SPaCsrHS03nV6srQDXj+mC9LQNE9hpy
         hxO1BiaVC8h3okbY5E6jeXdPXIkDRrsP2WfBMFAiPDy50ba9+x3uzdl35zTOhEhs4KMt
         VThbyAqRjFdl+m8iCA28ZOvu6FLjVoLGQxaAsqN2U631gfHcn41GKRiasKsaNPLHY+jr
         OwA0eTeXBDAlHnLdcRNEXbRmfQgut5vW6Uvs8FlyTQdHo84m69h9tqfQM2pJLn4/T5D5
         ymAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271324; x=1725876124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azCIJs0Yes3UGBt+MS43513CbCpSEhJdQPA/Vui0QvE=;
        b=qb5e4Sdn3w351c2wYUVJjgRRAVlGVxhQQnG2qY4K1Y1NdiqceK321VBL3TvjUvnheR
         LvDqHvus81eTaTLLSRG8TKUoIgKSobxdx1d5DkkPNOVwfZ+VnMyUVj2gFkFAFOXCzzSD
         YhDhBbM3PxZaOsaLMKbBzwuOpMLYHrE5i1uupbHAp5t7u6A3Wrhala0TaZZI8syzE+/T
         t1/R10oPgCsv/xLhPI/M44SqC08fqexSHQnSDuDB8n1lByOXPfqqITPX8DKWALyn1BTo
         tdmHT5TlJkXQjOn47b1D3LLSf4i+fhVaslUeuNqNjPMkpoNJZVmoSYXUXwKB+7w2EtWu
         rtNA==
X-Forwarded-Encrypted: i=1; AJvYcCVSxPX3uUqlcnb+wpVD12bfR1MjMDEPdViRoChGyIX9gFBaocXdzFAHSbIbeWmiE25odVPjyzb7CpGKRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUdR4oWOE8h+oytXMH+GquP4x9qe/S3J8eSuCExsLrl9MdNnqM
	crVpvBGgpdukMWIubUr9fAzkd9CUn7ByPB7ezrzYGo/RZteIivB2oepM/o+Yln0=
X-Google-Smtp-Source: AGHT+IETNIV8jXmXuTCEzIyDws1SHg/IJcZqr8A8sztUFROxV3ILjfFsLc9fgtmtMi4l37rswX3tSA==
X-Received: by 2002:a05:6402:3583:b0:5a2:7cfe:2371 with SMTP id 4fb4d7f45d1cf-5c22f902d00mr3927077a12.3.1725271324024;
        Mon, 02 Sep 2024 03:02:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c25bcb46f0sm1414180a12.60.2024.09.02.03.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:02:03 -0700 (PDT)
Message-ID: <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
Date: Mon, 2 Sep 2024 12:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO
 hogs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
 <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
 <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_030205_865183_45BB5315 
X-CRM114-Status: GOOD (  13.29  )
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

T24gMDIvMDkvMjAyNCAxMTo1MSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBNb24s
IFNlcCAyLCAyMDI0IGF0IDExOjUw4oCvQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgQXVnIDMxLCAyMDI0IGF0IDEyOjMy4oCvQU0gTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPj4+Cj4+PiBPbiBX
ZWQsIEF1ZyAyOCwgMjAyNCBhdCAxMTozNuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPj4+IDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4KPj4+PiBHUElPIGhvZyBu
b2RlcyBzaG91bGQgZGVmaW5lIHR5cGUsIG90aGVyd2lzZSAiZHVtbXktaG9nIiBib29sZWFuCj4+
Pj4gcHJvcGVydGllcyB3b3VsZCBiZSBhbGxvd2VkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+Pj4K
Pj4+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Cj4+Pgo+Pj4gSSBzdXBwb3NlIGl0J3MgYmVzdCBvZiBCYXJ0b3N6IGFwcGxpZXMgdGhpcyB0byB0
aGUgR1BJTyB0cmVlIHdpdGgKPj4+IHRoZSByZXN0IG9mIHRoZSBzZXJpZXM/Cj4+Pgo+Pj4gWW91
cnMsCj4+PiBMaW51cyBXYWxsZWlqCj4+Cj4+IEFoLCBJIHBpY2tlZCB1cCB0aGUgR1BJTyBjaGFu
Z2VzIHNlcGFyYXRlbHkuIE5vIHByb2JsZW0sIEknbGwgcGljawo+PiB0aGlzIG9uZSB1cCBhcyB3
ZWxsLgo+Pgo+PiBCYXJ0Cj4gCj4gTm9wZSwgSSBjYW5ub3QsIHRoaXMgZG9lc24ndCBhcHBseSB0
byB0aGUgR1BJTyB0cmVlLgoKSG0sIHByb2JhYmx5IHRoZXJlIGlzIHNvbWV0aGluZyBpbiBwaW5j
dHJsIHRyZWUuCgpATGludXMsIGNhbiB5b3UgZ3JhYiBwaW5jdHJsIGJpdHM/CgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
