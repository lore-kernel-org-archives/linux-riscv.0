Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0ABC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVQaVTopZc3DPig0mhw7lfJ7lHABqZS6JcO2/pLfOVI=; b=hySF7LHgvAPYb/
	CjZi0i1iOnAs3/Wpik19eT+AfEwejK8IJGfy8wNC5vzhKgVVgcFawEZr0wbD0J4h6EyQB93yC+YN/
	ZtvbyZRwT0LDVw+KsdUUla43pOyXxUIkWIYmlNht9+8EsWWhIv1E2CDbrQ7H8L77BroGfob60D8Su
	5HeImQ6eTX1qYCkjEVl/eunU+/bKgaGxiGRkS6TLeOHPpxMpZnX3b16/GaWDX9drzuT8DODobZ/Sq
	Fxz8hEFZPm50Gipi0YOZoWSvZM6gZBKiDWdueIj+EICPSEWjporHmk5+Un4Uveq2p8/sPHQAUX9RH
	qxBMix+GFaDHNBErXRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmlB-000000015fu-2dvD;
	Wed, 21 Feb 2024 13:35:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcml9-000000015eP-2JJx
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 13:35:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a2a17f3217aso892317566b.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708522538; x=1709127338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M85MKNxHpEwF31wKePTUoYXDesnkz6TsPaxXuG5yiJk=;
        b=OZF66V5/M7FNATOVSKNjAEMkX+hQvp1IBb0SKOsBXKZzlO4SDduooNVCUO6Yy+YG9g
         moc5Yi4T6+HNi6RLFH+JXD9yyFAR2FcnYjBmPYYI5d4vv0UJdeJePeXjVNpOM4fubdK/
         JkTXO2NZPTQU8XGCcMofwF2V+K4edHmG1Zo9Y6vqj4ko7v9B9y2cj0UdTW76u/zyxRSw
         57qfR4EYLa3gI80Lu+AghCPIb/YSGW/MBq2t66cZuV9as0z1872bpgDpmCqssPKOtm2m
         8E5xlTx0q77CmA+J0Rbt1P/9IKOnfPKxW3FyKpeZcnQpfkGg2TLQzFNrAzcgr4lVyDND
         sOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522538; x=1709127338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M85MKNxHpEwF31wKePTUoYXDesnkz6TsPaxXuG5yiJk=;
        b=v0FoP6auqVaMwb/SCHx/oWbLVAmH1KcQf4zlZ3HOgmlcAGQdEeY4S97YlmR/+SETMF
         6iBuSuK2bTFdgj+ne/NB/4kxOd1+F0oNxZxE6BUtsOt2Fx3TfGrqERsXdbOVrk+ZVyLE
         VlivWG1bZJ2uCgtSl2wn8yc4glwttM+KmobjE/3Bl1VTQjfFir5s8XzteyqbqALaEO2U
         /lw8BC8KZpeAq3k+ZpRFrG3ErmTTV7Pfbf5ja7rLrEt5X3a3sW5Yp4V6k3i1tnAujrI+
         rG9W12aDdBHPJ1aa18XbsDuzJ+4K6Z3mpvBClmCFlMH9PIQTWr7Qs2uWsvcp1KcWcIto
         ijTA==
X-Forwarded-Encrypted: i=1; AJvYcCWUBPWp9AdRzoUZJEqLbRL71yCkYcgXwC525tIDTnScqQUTRrWBaH6DFhUQYPUSxX6Mx79W6FvpYQkIfGsbjB/rcaJIMQmnt3qlYHpFBT+F
X-Gm-Message-State: AOJu0Ywycxr98YX3sdchU80IJWoDL5Vtez/+bvGCmfHgsU6LJlRUUhYX
	7kwT1RnIqJezsTNuRpZ8tLNGE3s47VF0h+KZihjrjhW28hA2mHscBYLqqac6fSw=
X-Google-Smtp-Source: AGHT+IFjTAniUsouIQiZg5/1w3zu99rfqHzwO1yDcSTT+S18LBkfM8M18UxyzOt56YfOrmlo+CFdnQ==
X-Received: by 2002:a17:906:16da:b0:a3e:7dbe:298b with SMTP id t26-20020a17090616da00b00a3e7dbe298bmr6580101ejd.24.1708522537598;
        Wed, 21 Feb 2024 05:35:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906c19000b00a3cee88ddc7sm5044547ejz.147.2024.02.21.05.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:35:37 -0800 (PST)
Message-ID: <1a3c9ec5-69b9-4f55-bdf6-628fcf2b0268@tuxon.dev>
Date: Wed, 21 Feb 2024 15:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] clk: renesas: r9a08g045: Add support for power
 domains
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_053539_710712_E6C27DA4 
X-CRM114-Status: GOOD (  21.30  )
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

SGksIEdlZXJ0LAoKT24gMTYuMDIuMjAyNCAxNjoxMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+IEhpIENsYXVkaXUsCj4gCj4gT24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxOjQ04oCvUE0gQ2xh
dWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToKPj4gRnJvbTogQ2xhdWRpdSBC
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Pgo+PiBJbnN0YW50aWF0
ZSBwb3dlciBkb21haW5zIGZvciB0aGUgY3VycmVudGx5IGVuYWJsZWQgSVBzIG9mIFI5QTA4RzA0
NSBTb0MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YS51akBicC5yZW5lc2FzLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4+IC0t
LSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ1LWNwZy5jCj4+ICsrKyBiL2RyaXZlcnMv
Y2xrL3JlbmVzYXMvcjlhMDhnMDQ1LWNwZy5jCj4+IEBAIC0yNDAsNiArMjQwLDI4IEBAIHN0YXRp
YyBjb25zdCB1bnNpZ25lZCBpbnQgcjlhMDhnMDQ1X2NyaXRfbW9kX2Nsa3NbXSBfX2luaXRjb25z
dCA9IHsKPj4gICAgICAgICBNT0RfQ0xLX0JBU0UgKyBSOUEwOEcwNDVfRE1BQ19BQ0xLLAo+PiAg
fTsKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfY3BnX3BtX2RvbWFpbl9pbml0X2Rh
dGEgcjlhMDhnMDQ1X3BtX2RvbWFpbnNbXSA9IHsKPj4gKyAgICAgICBERUZfUEQoImFsd2F5cy1v
biIsICAgICBSOUEwOEcwNDVfUERfQUxXQVlTX09OLCAwLCAwLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFJaRzJMX1BEX0ZfUEFSRU5UIHwgUlpHMkxfUERfRl9BTFdBWVNfT04p
LAo+PiArICAgICAgIERFRl9QRCgiZ2ljIiwgICAgICAgICAgIFI5QTA4RzA0NV9QRF9HSUMsIE1T
VE9QKEFDUFUsIEJJVCgzKSksIFBXUkROKElQMSwgMiksCj4gCj4gTXkgZG9jcyBkb2N1bWVudCBv
bmx5IGJpdCAwIG9mIHRoZSBDUEdfQlVTX0FDUFVfTVNUT1AgcmVnaXN0ZXIuCgpJbmRlZWQsIG1p
bmUsIHRvby4gSSB0b29rIGFzIHJlZmVyZW5jZSB0aGUgdGFibGUgIlJlZ2lzdGVycyBmb3IgTW9k
dWxlClN0YW5kYnkgTW9kZSIuIEkgYXNrZWQgZm9yIGNsYXJpZmljYXRpb25zLiBUaGUgVEYtQSBz
b2Z0d2FyZSBhbHNvIHVzZXMKQklUKDMpIGZvciBzZXR0aW5nIHRoaXMuCgo+IAo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFJaRzJMX1BEX0ZfQUxXQVlTX09OKSwKPj4gKyAgICAg
ICBERUZfUEQoImlhNTUiLCAgICAgICAgICBSOUEwOEcwNDVfUERfSUE1NSwgTVNUT1AoUEVSSV9D
UFUsIEJJVCgxMykpLCBQV1JETihJUDEsIDMpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJaRzJMX1BEX0ZfQUxXQVlTX09OKSwKPj4gKyAgICAgICBERUZfUEQoImRtYWMiLCAg
ICAgICAgICBSOUEwOEcwNDVfUERfRE1BQywgTVNUT1AoUkVHMSwgR0VOTUFTSygzLCAwKSksIDAs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlpHMkxfUERfRl9BTFdBWVNfT04p
LAo+PiArICAgICAgIERFRl9QRCgiZGRyIiwgICAgICAgICAgIFI5QTA4RzA0NV9QRF9ERFIsIE1T
VE9QKFBFUklfRERSLCBCSVQoMSkpLCBQV1JETihJUDIsIDApLAo+IAo+IE9ubHkgQklUKDEpPyBN
eSBkb2NzIHN1Z2dlc3QgR0VOTUFTSygxLCAwKS4KCkkgd2FudGVkIHRvIGtlZXAgUEhZIHNlcGFy
YXRlZCBidXQgdGhlcmUncyBubyByZWFzb24gZm9yIGRvaW5nIHRoYXQsCkFGQUlDVC4gSSdsbCB1
cGRhdGUgaXQuCgo+IAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJaRzJMX1BE
X0ZfQUxXQVlTX09OKSwKPj4gKyAgICAgICBERUZfUEQoInR6Y2RkciIsICAgICAgICBSOUEwOEcw
NDVfUERfVFpDRERSLCBNU1RPUChUWkNERFIsIEdFTk1BU0soMiwgMCkpLAo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBXUkROKElQMiwgMSksIFJaRzJMX1BEX0ZfQUxXQVlTX09O
KSwKPj4gKyAgICAgICBERUZfUEQoIm90ZmRlX2RkciIsICAgICBSOUEwOEcwNDVfUERfT1RGREVf
RERSLCAwLCBQV1JETihJUDIsIDIpLCBSWkcyTF9QRF9GX0FMV0FZU19PTiksCj4gCj4gTVNUT1Ao
UEVSSV9DUFUyLCBCSVQoMikpPwoKT0suCgpUaGFuayB5b3UsCkNsYXVkaXUgQmV6bmVhCgo+IAo+
PiArICAgICAgIERFRl9QRCgic2RoaTAiLCAgICAgICAgIFI5QTA4RzA0NV9QRF9TREhJMCwgTVNU
T1AoUEVSSV9DT00sIEJJVCgwKSksIFBXUkROKElQMSwgMTMpLCAwKSwKPj4gKyAgICAgICBERUZf
UEQoInNkaGkxIiwgICAgICAgICBSOUEwOEcwNDVfUERfU0RISTEsIE1TVE9QKFBFUklfQ09NLCBC
SVQoMSkpLCBQV1JETihJUDEsIDE0KSwgMCksCj4+ICsgICAgICAgREVGX1BEKCJzZGhpMiIsICAg
ICAgICAgUjlBMDhHMDQ1X1BEX1NESEkyLCBNU1RPUChQRVJJX0NPTSwgQklUKDExKSksIFBXUkRO
KElQMSwgMTUpLCAwKSwKPj4gKyAgICAgICBERUZfUEQoImV0aDAiLCAgICAgICAgICBSOUEwOEcw
NDVfUERfRVRIRVIwLCBNU1RPUChQRVJJX0NPTSwgQklUKDIpKSwgUFdSRE4oSVAxLCAxMSksIDAp
LAo+PiArICAgICAgIERFRl9QRCgiZXRoMSIsICAgICAgICAgIFI5QTA4RzA0NV9QRF9FVEhFUjEs
IE1TVE9QKFBFUklfQ09NLCBCSVQoMykpLCBQV1JETihJUDEsIDEyKSwgMCksCj4+ICsgICAgICAg
REVGX1BEKCJzY2lmMCIsICAgICAgICAgUjlBMDhHMDQ1X1BEX1NDSUYwLCBNU1RPUChNQ1BVMiwg
QklUKDEpKSwgMCwgMCksCj4+ICt9Owo+PiArCj4gCj4gVGhlIHJlc3QgTEdUTS4KPiAKPiBHcntv
ZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+IAo+IAo+
IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+IAo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
