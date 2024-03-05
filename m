Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4003DC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPUf1cv8fkDG+HalsVllHD8UEzHr0Q5HnfGAimCevYQ=; b=tdgWHZ6Cpj9s5h
	IrawuN5MlG3OmRkOtsCV8MjGSf6fIrQtd4UqGqIMpl81n85fQlN42U5S53qijrsnI7wdPdhyrJS9R
	ByeKw0fFWwzjpvSx6MVJh/SHesUZdMvTnf79j9hW01fchkwPtDU/p+JajUOrB59bZGrMK1MvusiW4
	JB4K+aasqK1Z3ilLG3XVbBzBzbO4BIkxBljces1MKdcEEXflj0VYRuDnSfrLEv9R2qukHdYgGuE5K
	HO732tvN6jwxTmckVzDrz0slO07s+L0nanVfIJsOFp1+WoIRqGsn+ZgVk51IfzwDzw/vdTAcu6aov
	hc4Vg+biqnTm9T15w/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhX8L-0000000EMR6-1HlY;
	Tue, 05 Mar 2024 15:55:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhX8I-0000000EMPo-3pn0
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 15:55:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5134d7e16a8so2118030e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709654107; x=1710258907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3r7Bnl4XN924keLTWvY+GFPpZnAjIYOoWtnEA26PCh0=;
        b=R8bRLaTPLkYYAu6rRJnzhtKbTClGeaMwZmZvriDK8+Go9WHglJd50brSOCoNsgbNm5
         pV7evmNG+LRN7ifplwxAx+YyDDKqSNfN2wzwXAhpAyn1BZl1BiDKwBx54D7O8krKZ5QJ
         C/yiwkO32ssm3BnJnLXuYo++dHtlTlvocGducXpauWuaKUej5oc39atcObNs9M99Xwr6
         r1ocM7RgxcprZQJ1iHOWXUsVAgEurmL5T01LIMleE6KUz6xqKSEKAVS5PyBeU99QBpq7
         gf4B75c2ljFm0mgz4JKkmDg+GJxvsJ9F94KDkrFVsTcYD4NvwHSlEawyXpy7BhmWvUvN
         3Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709654107; x=1710258907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r7Bnl4XN924keLTWvY+GFPpZnAjIYOoWtnEA26PCh0=;
        b=q3R63w/PjdXIk60jnGfPG2nCBiIAB6dPNb1TiiVLLaoHii1q3mdkB7vsOg/UCQrLgZ
         fvl7Z9wzfp9U2NE5VTZ6CPYe6+Ytogh545XXJTZZDG7MTcgB3xtrZOD5BaBlYsgnq16g
         ASrt2sEzQzNL6ABrPhoMCy7C0pL7QI8dyTdm5Vl/wdSMGMNbJvGeoXI/bomKdWeDsqU1
         0HkF3+p9dJ0AMC+f4IdZFpGAmevrDx4WRgMIHU+LyzQduquf/muJmZIFkmDVRH/809ck
         efsjl8X0g573kiLYZvkwZJIFzdHz+R4zALLW0cNPG+uUU397y+S/xGlDB2JSmhR3UHFj
         IdPg==
X-Forwarded-Encrypted: i=1; AJvYcCXqXG6MiX0RW205QjrenLVUqnqC8QDTxWDi0pJJwf47fqDO0kngrZ3vXxyHJc0flz4TEIBjKIQtB3kgFWO6cAMDwXRO4nsmJDsrw6tQH28t
X-Gm-Message-State: AOJu0Yyfeh1JB9MgumT5slnX8r0Ip0hXdFIxU4Juo+dfSvw6pRHQS4Oq
	+qUp/3jNsMWzNYHye7InILJx8KxUfZh79zVfZC/LmL6BuLkjBqKk5Hqh1FCE4Jc=
X-Google-Smtp-Source: AGHT+IEIp9OrNr80xjtbdelKWhdH9/KeI9jtSkLmT7psMLpSMiDSq32bgbtvdDcu2le8CfgT59OKBA==
X-Received: by 2002:a19:5206:0:b0:512:d89e:946 with SMTP id m6-20020a195206000000b00512d89e0946mr1350557lfb.44.1709654107433;
        Tue, 05 Mar 2024 07:55:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id n14-20020a170906118e00b00a45a72fadfcsm867761eja.23.2024.03.05.07.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 07:55:06 -0800 (PST)
Message-ID: <27bdcc35-a821-4dc4-a410-a939ef0d9af6@linaro.org>
Date: Tue, 5 Mar 2024 16:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: replace underscores in node names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk <linux-clk@vger.kernel.org>
References: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdWw0dteXO2jw4cwGvzKcL6vmnb96C=qgPgUqNDMtF6X0Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdWw0dteXO2jw4cwGvzKcL6vmnb96C=qgPgUqNDMtF6X0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_075511_053921_0490081F 
X-CRM114-Status: GOOD (  14.63  )
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

T24gMDUvMDMvMjAyNCAxNTo0NCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEtyenlz
enRvZgo+IAo+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDM6NDjigK9QTSBLcnp5c3p0b2YgS296
bG93c2tpCj4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+IFVuZGVy
c2NvcmVzIHNob3VsZCBub3QgYmUgdXNlZCBpbiBub2RlIG5hbWVzIChkdGMgd2l0aCBXPTIgd2Fy
bnMgYWJvdXQKPj4gdGhlbSksIHNvIHJlcGxhY2UgdGhlbSB3aXRoIGh5cGhlbnMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGlu
YXJvLm9yZz4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQg
ZjAzNjA2NDcwODg2ZTc4MSAoInJpc2N2Ogo+IGR0czogc3RhcmZpdmU6IHJlcGxhY2UgdW5kZXJz
Y29yZXMgaW4gbm9kZSBuYW1lcyIpIGluIHY2LjgtcmM2Lgo+IAo+IFRoaXMgY2F1c2VzIGUuZy4g
QmVhZ2xlViBTdGFybGlnaHQgdG8gaGFuZyBkdXJpbmcgYm9vdCB3aXRob3V0IGFueQo+IG91dHB1
dC4gIEJvb3Rpbmcgd2l0aCAiZWFybHljb24iIHJldmVhbHM6Cj4gCj4gICAgIGR3LWFwYi11YXJ0
IDEyNDQwMDAwLnNlcmlhbDogZXJyb3IgLUVJTlZBTDogY2xvY2sgcmF0ZSBub3QgZGVmaW5lZAo+
ICAgICBkdy1hcGItdWFydDogcHJvYmUgb2YgMTI0NDAwMDAuc2VyaWFsIGZhaWxlZCB3aXRoIGVy
cm9yIC0yMgo+IAo+IGFuZCBpbmRlZWQsIHAtPnVhcnRjbGsgPSAwLgo+IAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0c2kKPj4gQEAgLTExMywyOCArMTEzLDI4IEBAIGNw
dV9jcml0IHsKPj4gICAgICAgICAgICAgICAgIH07Cj4+ICAgICAgICAgfTsKPj4KPj4gLSAgICAg
ICBvc2Nfc3lzOiBvc2Nfc3lzIHsKPj4gKyAgICAgICBvc2Nfc3lzOiBvc2Mtc3lzIHsKPj4gICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+PiAgICAgICAgICAgICAg
ICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+PiAgICAgICAgICAgICAgICAgLyogVGhpcyB2YWx1ZSBt
dXN0IGJlIG92ZXJyaWRkZW4gYnkgdGhlIGJvYXJkICovCj4+ICAgICAgICAgICAgICAgICBjbG9j
ay1mcmVxdWVuY3kgPSA8MD47Cj4+ICAgICAgICAgfTsKPj4KPj4gLSAgICAgICBvc2NfYXVkOiBv
c2NfYXVkIHsKPj4gKyAgICAgICBvc2NfYXVkOiBvc2MtYXVkIHsKPj4gICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+PiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNl
bGxzID0gPDA+Owo+PiAgICAgICAgICAgICAgICAgLyogVGhpcyB2YWx1ZSBtdXN0IGJlIG92ZXJy
aWRkZW4gYnkgdGhlIGJvYXJkICovCj4+ICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kg
PSA8MD47Cj4+ICAgICAgICAgfTsKPj4KPj4gLSAgICAgICBnbWFjX3JtaWlfcmVmOiBnbWFjX3Jt
aWlfcmVmIHsKPj4gKyAgICAgICBnbWFjX3JtaWlfcmVmOiBnbWFjLXJtaWktcmVmIHsKPj4gICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+PiAgICAgICAgICAgICAg
ICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+PiAgICAgICAgICAgICAgICAgLyogU2hvdWxkIGJlIG92
ZXJyaWRkZW4gYnkgdGhlIGJvYXJkIHdoZW4gbmVlZGVkICovCj4+ICAgICAgICAgICAgICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8MD47Cj4+ICAgICAgICAgfTsKPj4KPj4gLSAgICAgICBnbWFjX2dy
X21paV9yeGNsazogZ21hY19ncl9taWlfcnhjbGsgewo+PiArICAgICAgIGdtYWNfZ3JfbWlpX3J4
Y2xrOiBnbWFjLWdyLW1paS1yeGNsayB7Cj4+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImZpeGVkLWNsb2NrIjsKPj4gICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPj4g
ICAgICAgICAgICAgICAgIC8qIFNob3VsZCBiZSBvdmVycmlkZGVuIGJ5IHRoZSBib2FyZCB3aGVu
IG5lZWRlZCAqLwo+IAo+IFRoZSBjbG9jayBkcml2ZXIgcmVsaWVzIG9uIHRoZSBjbG9jayBuYW1l
cywgd2hpY2ggYXJlIChpbiB0aGUgYWJzZW5jZQo+IG9mIGNsb2NrLW91dHB1dC1uYW1lcyBwcm9w
ZXJ0aWVzKSBpZGVudGljYWwgdG8gdGhlIGFjdHVhbCBub2RlIG5hbWVzOgo+IAo+IGRyaXZlcnMv
Y2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAuYzogICAgcGFyZW50c1tpXS5md19uYW1l
ID0gIm9zY19zeXMiOwo+IGRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAu
YzogICAgcGFyZW50c1tpXS5md19uYW1lID0gIm9zY19hdWQiOwo+IGRyaXZlcnMvY2xrL3N0YXJm
aXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAuYzogICAgcGFyZW50c1tpXS5md19uYW1lID0KPiAiZ21h
Y19ybWlpX3JlZiI7Cj4gZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzEwMC5j
OiAgICBwYXJlbnRzW2ldLmZ3X25hbWUgPQo+ICJnbWFjX2dyX21paV9yeGNsayI7Cj4gCj4gSGVu
Y2UgdGhlc2UgY2xvY2tzIGNhbiBubyBsb25nZXIgYmUgZm91bmQsIGFuZCBhbGwgY2hpbGRyZW4g
aGF2ZSBhCj4gemVybyBjbG9jayByYXRlLCBjYXVzaW5nIHRoZSBicmVha2FnZS4KClVoLCBzb3Jy
eSA6KCBhbmQgdGhhbmtzIGZvciB0aGUgcmVwb3J0LiBJJ2xsIGFkZCBjbG9jay1vdXRwdXQtbmFt
ZXMuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
