Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC2C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fz/xpZMYn0dBkLW5VCudZ50I59Xr58MYOmk9qdgPXGk=; b=nKUo4fwnqlfMW5
	e5LrCC88YplvCMUnEpfWRcXuXU4FWEmDSJsXx+1ydsumMSy1eHeCtK07NnLitYNdIEbchtgl+p7Ys
	6uqMI2rmgPdLUVuxlgRu7N+GJMaUN6W0fsdEjzqRN5BUQcSYMa86kwd2L36mh+uEvb+3alUvRSWuE
	2uhcjz8t/B5HsVr4j8fns0LsSMhQ5SofgN+CSA/suiWZTlBquv4pbt0WRXNfmq3MuG/L/t9CCNJuZ
	oOjoc1c046x/b4nVlsdEVPqaRHVdngYkTimYYoqAj+nb9QgWWEArqEMhNeB55NGT/zbjCb6oLuElv
	aHjQZY+6AMHEP60HVPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmVx-0000000Ej3Q-44BR;
	Thu, 14 Mar 2024 14:57:01 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmVu-0000000Ej2j-221z
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:56:59 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-68ee2c0a237so8307246d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710428216; x=1711033016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxoX+O1GlcPWe1RQwrLpQvGT+Ve/nhPsRMUh8z8RZIw=;
        b=KqutCnzzPQDZksNw80KKbnBK7HvWLDS5JZNrc21vkK57t8fOPF44JO5y/u5tq5Zs6w
         pxNYFEeFcQNk2m8ZXFph6eLUOz7qXSaF2bXO6VkQADigI/QP3opJ8FSrdPgFsSv0lhSt
         E3oSvJxHkDhRfbH7pJQp1OBiTQj5CkIJKQnQNs54eR6nyrDj6E4jqXFGMapV7Ywq/9zR
         HJr+Kebo4HKjm+JZmCRa5HeBhvaNb6+Ep+3OGd0h6RVnKf8DIf3bXWmuwxIas2zZlUJ7
         UT0ThhomWVUnsPZUsUEsPKM/lNjm/qlsT9gm+YRiJR5p05Hjjdqh33owVK4+F9Ah7j98
         xrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710428216; x=1711033016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxoX+O1GlcPWe1RQwrLpQvGT+Ve/nhPsRMUh8z8RZIw=;
        b=JBDEVymTuzwIrq2WfxxnL0SFbqo7VLD3UOVQ0EldVSdUXXbN9mtkVMeTq6hT7oSP1n
         Lqd3j3C2pwKoUQ1gvfeWB2Wg4RwZ3DeqtpjVYmbfX5t6M8jWoBW+JkA7zqkRgccfwInQ
         3DFd8jG+8dh2lQgzNpr9M5GM4wcJ2N7D0SDiRoOJ40+dm3r6qsHe/9qvE0Nz8xK1GxNM
         BO2v63Svx7s2RUoAOSffPXCrZ4uCJysyuaTM0xT03TDlwwZ/5ll/NH3zPOclfJijSyGD
         3ai9rjnsgthBovdoMpXwuBtyNUCcQy4xdI9FIe05VgwgvzYtejJ3AyUIYCLqD/JBuKSV
         PHtw==
X-Forwarded-Encrypted: i=1; AJvYcCUu/20MrOm9gAQqmXZT8jZUMxGDy/FNO9FVHgmGGrYhc1R2G/QbjVANceUT8CPkw/74oqC91ucegukUr//QEsQFUq2tE7XlOF47IKkXRk+R
X-Gm-Message-State: AOJu0YzaFBdDVHw4/EnqpVMzdRbnKAvwiDxVfV7ZniS275eqTgqwTnMI
	x2oSSk2NgyLilK5KfuaOi/CSMXPwD8l2Sghk/awT6WzSWA/yRjHMscxBmm8p8AI=
X-Google-Smtp-Source: AGHT+IFH2laVemU8OwQ32YK+QaEsKZgxeEvMnGkMRQp09IuyzZ5ZeOZGACdxlplPgoNSEue7cq6fGw==
X-Received: by 2002:ad4:4ea1:0:b0:68f:dde4:fb12 with SMTP id ed1-20020ad44ea1000000b0068fdde4fb12mr4915051qvb.9.1710428216556;
        Thu, 14 Mar 2024 07:56:56 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a018c00b0042f068d3d8asm871706qtw.43.2024.03.14.07.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:56:56 -0700 (PDT)
Message-ID: <42c3d591-abe5-4343-9a94-f1705430dcea@sifive.com>
Date: Thu, 14 Mar 2024 09:56:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: starfive: jh7100: Use provided clocks instead of
 hardcoded names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
 <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com>
 <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_075658_622187_3F246FB6 
X-CRM114-Status: GOOD (  15.44  )
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

SGkgR2VlcnQsCgpPbiAyMDI0LTAzLTE0IDk6NDggQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToKPiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCAzOjMy4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMjQtMDMtMTQgNjowNSBB
TSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4gVGhlIFN0YXJmaXZlIEpINzEwMCBjbG9j
ayBkcml2ZXIgZG9lcyBub3QgdXNlIHRoZSBEVCAiY2xvY2tzIiBwcm9wZXJ0eQo+Pj4gdG8gZmlu
ZCBpdHMgZXh0ZXJuYWwgaW5wdXQgY2xvY2tzLCBidXQgaW5zdGVhZCByZWxpZXMgb24gdGhlIG5h
bWVzIG9mCj4+PiB0aGUgYWN0dWFsIGV4dGVybmFsIGNsb2NrIHByb3ZpZGVycy4gIFRoaXMgaXMg
ZnJhZ2lsZSwgYW5kIGNhdXNlZAo+Pj4gYnJlYWthZ2Ugd2hlbiBzYW5pdGl6aW5nIGNsb2NrIG5h
bWVzIGluIERULgo+Pj4KPj4+IEZpeCB0aGlzIGJ5IG9idGFpbmluZyB0aGUgZXh0ZXJuYWwgaW5w
dXQgY2xvY2tzIHRocm91Z2ggdGhlIERUICJjbG9ja3MiCj4+PiBwcm9wZXJ0eSwgYW5kIHVzaW5n
IHRoZWlyIGNsa19odyBvYmplY3RzIG9yIGNvcnJlc3BvbmRpbmcgbmFtZS4KPj4+Cj4+PiBGaXhl
czogZjAzNjA2NDcwODg2ICgicmlzY3Y6IGR0czogc3RhcmZpdmU6IHJlcGxhY2UgdW5kZXJzY29y
ZXMgaW4gbm9kZSBuYW1lcyIpCj4+PiBGaXhlczogNDIxMGJlNjY4YTA5ZWUyMCAoImNsazogc3Rh
cmZpdmU6IEFkZCBKSDcxMDAgY2xvY2sgZ2VuZXJhdG9yIGRyaXZlciIpCj4+PiBTaWduZWQtb2Zm
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IAo+Pj4gLS0t
IGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzEwMC5jCj4+PiArKysgYi9k
cml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmMKPiAKPj4+IEBAIC0yOTgs
MTMgKzMxMSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBjbGtfc3RhcmZpdmVfamg3MTAwX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAgICAgICBpZiAoSVNfRVJSKHByaXYt
PmJhc2UpKQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsKPj4+
Cj4+PiArICAgICBmb3IgKGlkeCA9IDA7IGlkeCA8IEVYVF9OVU1fQ0xLUzsgaWR4KyspIHsKPj4+
ICsgICAgICAgICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIGpoNzEwMF9leHRf
Y2xrW2lkeF0pOwo+Pj4gKyAgICAgICAgICAgICBpZiAoSVNfRVJSKGNsaykpCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY2xrKTsKPj4+ICsKPj4+ICsgICAgICAgICAg
ICAgcHJpdi0+ZXh0W2lkeF0gPSBfX2Nsa19nZXRfaHcoY2xrKTsKPj4+ICsgICAgIH0KPj4+ICsK
Pj4+ICsgICAgIG9zY19zeXMgPSBjbGtfaHdfZ2V0X25hbWUocHJpdi0+ZXh0W0VYVF9DTEtfT1ND
X1NZU10pOwo+Pj4gKwo+Pj4gICAgICAgcHJpdi0+cGxsWzBdID0gZGV2bV9jbGtfaHdfcmVnaXN0
ZXJfZml4ZWRfZmFjdG9yKHByaXYtPmRldiwgInBsbDBfb3V0IiwKPj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDQw
LCAxKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBvc2Nfc3lzLCAwLCA0MCwgMSk7Cj4+PiAgICAgICBpZiAoSVNfRVJSKHByaXYtPnBs
bFswXSkpCj4+PiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYtPnBsbFswXSk7Cj4+
Pgo+Pj4gICAgICAgcHJpdi0+cGxsWzFdID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFj
dG9yKHByaXYtPmRldiwgInBsbDFfb3V0IiwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDY0LCAxKTsKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvc2Nf
c3lzLCAwLCA2NCwgMSk7Cj4+Cj4+IFRoZXNlIHNob3VsZCB1c2UgZGV2bV9jbGtfaHdfcmVnaXN0
ZXJfZml4ZWRfZmFjdG9yX3BhcmVudF9odygpLiAoT3IgeW91IGNvdWxkCj4gCj4gVGhhbmtzLCBJ
IGRpZG4ndCBrbm93IGFib3V0IHRoYXQgZnVuY3Rpb24hCj4gCj4+IGRlZmluZSBhIGRldm1fY2xr
X2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcl9md19uYW1lKCkgYW5kIGRyb3AgdGhlIG90aGVyIGNo
YW5nZXMuKQo+IAo+IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBoZXJl
PwoKSW4gdGhlIGxvb3AgYmVsb3csIHRoZSBwYXJlbnRzIGFyZSBhbHJlYWR5IHJlZmVyZW5jZWQg
dmlhIC5md19uYW1lLiBUaGF0IG1lYW5zCnRoZSBzdHJpbmcgaXMgdGhlIERUIGNsb2NrLW5hbWVz
IHByb3BlcnR5IHZhbHVlLCBub3QgdGhlIExpbnV4LWludGVybmFsIGNsb2NrCm5hbWUgKHNlZSBj
bGtfY29yZV9nZXQoKSkuIFRoZXNlIHR3byBmdW5jdGlvbiBjYWxscyBhcmUgdGhlIG9ubHkgb25l
cyB0aGF0CmRlcGVuZCBvbiB0aGUgaW50ZXJuYWwgY2xvY2sgbmFtZS4gSWYgeW91IGNoYW5nZSB0
aGVtIHRvIHVzZSAuZndfbmFtZSBhcyB3ZWxsLAp0aGUgY2xrX2NvcmVfZ2V0KCkgd2lsbCBkbyB0
aGUgcmlnaHQgdGhpbmcsIGFuZCB5b3UgZG9uJ3QgbmVlZCB0byBtYW51YWxseSBjYWxsCmRldm1f
Y2xrX2dldCgpLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
