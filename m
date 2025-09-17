Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F7CAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58aQ3MzLx8gkiuVdQWfTbg9aBa9orwL5l2jpTDKK9A0=; b=u/hbdho2HHpX3M
	ffLryC9Z7zmLpeitoGWPhbd5yFzhAdILhk9B4HE5R5W5/hOIEh15HYJS4Gm5rv/BbOIFBPZTobFb8
	lNZdUBtugkPN1wn21vMBlWtEtcKWhovsyBItGw8Kw+R+oMAHP7YRutdo2tobZxcbqsJDaFSz9wSnD
	ylUDHRuflO0PbRbF3adzZH0Ju3iL8OZFrM/2ifSbnfrBPJwfsZPIs6py28bfGuC2BLSulHyAAA0lY
	iuFJHDUu8dWJ2qIgn9Em9eSZ6rFulQV7uzeyd/MAt76XXwrhX02EfdugNWADcBwoeHp4TGl/xUsRf
	7cOLzkDq367ssff/cbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylp0-0000000AMEO-1SPu;
	Wed, 17 Sep 2025 06:39:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylox-0000000AMDp-0vJf
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 06:39:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3ea3e223ba2so2923224f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758091152; x=1758695952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=3BSghkL/pbgZFOkFLlDzN3icIJwQrBJVmVrb9Uo4dd+AdM1SbIGXPOZ7XjG67Uv1ve
         0Yg/VjekeV20m1jBFTNLg6Po52ba7iaD172fEB2Q4AKQYFE7NQIX54e7OzMB1KZC3TY/
         WeQpSVEhrukVnwd7yxe7f7VheuXkfQSzQfw1aL+F9ckwCesUNVdvc3SBgqp+wrWUBupk
         q/YG9hug6lfvjn7DCw+NVEDGNE39Z4HkTBRC3SjTmonsr2CF+lzm94SCvBJqH0W6yTFz
         QjmpjdWRBZ72KG62uJdMnwleN2yIOFtFXJqIAUmTmgDnb5lsNV7OqDRwkCqYBn24eId3
         qDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091152; x=1758695952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=IgthQZhayndA5UE9HWCBWaC66y0esWT8sQ0yS3OXtw3Uov4Itq+OeB79k3dHwK2vLu
         WCteRFWbnWYXmBstmSgXh2eYMyZcjCIwVAWugc3dxBG6Py13ttJDpA7ZdWH2+PYT4U88
         KauZJuMkuAO5nRMGZ7ByIXM/KrNlhUUI5F/e7XuSZLsNd3re9FfU1hRZCXBssmFd96jv
         3jDur6B9S2TNU2TIjJpZ9EA73pxYR6wk+CzHLPwr24mQeEg+xluBmPeFdiYyqlkvvQ75
         2J0/5cQc+GX98XTU3i9R5mK5gdT/vLIB0CIWPkjxzSYDv10DdQyE47oOC9kqtX9rDOS0
         enNw==
X-Forwarded-Encrypted: i=1; AJvYcCWS2RS3MMTbMeZNKq9pziJj1cF8hicSrSjHJFwd01YieFg54mlAAvsTEkIU/zzuehCC0EmcLpA7m3dkfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQjnWxwN019jblUzrHdbAeh825Wq749ykx8BmyhTNoijovXzv
	CDWFg3HpNXhAWaZGuaG8k5b5YFJGqH5esztmammz9034RJ/fsZ/dQ/uYtxSFHx9fYno=
X-Gm-Gg: ASbGncvruUWyGWrM894lRq5wHtb1AQT54JD5Wylbf48B+xM41oML1F+wcQE8VJzoPDy
	bJ1tJAOLqTAub2i1uLGb3VImMip3Ey0QLesNZKMO3OJCP9M93ghjkqDw76xA4L2F2Sm2laa590a
	+Jza/WZsmuTai0sl+LN/kEGa6bDXI2/+YjHpauiuLo5adsyx7nQ/C3SKpr9DTwbY2GuBQEOtx+g
	OfnXJPIwzQcYJDq5Mdca+Zj9U56HjrMP5+TryHoakkmSch3YXBcURotDFLbe25FMyEX9UdTkCOB
	8AKpHtJEsmig/X82Kpw59fQON+HpAsJrnk8SRLTiTKUiZOxpdX0n5EC7l8Q3SSICL06kOv6FET8
	46Ba+JOBC+DcTQYLRARZ/b9vvC6fQE0kT71VXh1vh8TiZvMmpUZysf5bPoWVLS9M+ifFyFmgg6Z
	uC0sjxR4xMm1lzMQ==
X-Google-Smtp-Source: AGHT+IG6Qsc5VU9s+KLN/ObymCbaRcvmgFQYQp7jQl2dFNfoKqhHY6bNfm9aOpDZbu6Xlk5fJjmiww==
X-Received: by 2002:adf:a2d6:0:b0:3e9:d54:19a0 with SMTP id ffacd0b85a97d-3ecdfa4239cmr495573f8f.57.1758091151984;
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:1b1a:e580:5909:925c? ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdbc7fe1bsm3414155f8f.52.2025.09.16.23.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Message-ID: <55237b5d-c9b8-4606-8b5d-c7a97218c085@hammernet.be>
Date: Wed, 17 Sep 2025 08:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
 <20250917012941-GYA1263349@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250917012941-GYA1263349@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_233915_379480_3B8E1910 
X-CRM114-Status: GOOD (  20.57  )
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

SGVsbG8gWWl4dW4sCgpPbiA5LzE3LzI1IDAzOjI5LCBZaXh1biBMYW4gd3JvdGU6Cj4gSGkgSGVu
ZHJpaywKPgo+IE9uIDA4OjQ3IFR1ZSAxNiBTZXAgICAgICwgSGVuZHJpayBIYW1lcmxpbmNrIHdy
b3RlOgo+PiBBZGQgVUFSVCBwaW5jdHJsIGNvbmZpZ3VyYXRpb25zIGJhc2VkIG9uIHRoZSBTb0Mg
ZGF0YXNoZWV0IGFuZCB0aGUKPj4gZG93bnN0cmVhbSBCaWFuYnUgTGludXggdHJlZS4gVGhlIGRy
aXZlIHN0cmVuZ3RoIHZhbHVlcyB3ZXJlIHRha2VuIGZyb20KPj4gdGhlIGRvd25zdHJlYW0gaW1w
bGVtZW50YXRpb24sIHdoaWNoIHVzZXMgbWVkaXVtIGRyaXZlIHN0cmVuZ3RoLgo+PiBDVFMvUlRT
IGFyZSBtb3ZlZCB0byBzZXBhcmF0ZSAqLWN0cy1ydHMtY2ZnIHN0YXRlcyBzbyBib2FyZHMgY2Fu
IGVuYWJsZQo+PiBoYXJkd2FyZSBmbG93IGNvbnRyb2wgY29uZGl0aW9uYWxseS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSGVuZHJpayBIYW1lcmxpbmNrIDxoZW5kcmlrLmhhbWVybGluY2tAaGFtbWVy
bmV0LmJlPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSBBZGRlZCAvb21pdC1pZi1uby1y
ZWYvIHRvIHBpbmN0cmwgc3RhdGVzIHRvIHJlZHVjZSBEVCBzaXplCj4+Cj4+IENoYW5nZXMgaW4g
djI6Cj4+IC0gU3BsaXQgY3RzL3J0cyBpbnRvIHNlcGFyYXRlIHBpbmN0cmwgY29uZmlncyBhcyBz
dWdnZXN0ZWQKPj4gLSBSZW1vdmVkIG9wdGlvbnMgZnJvbSBib2FyZCBEVFMgZmlsZXMgdG8ga2Vl
cCB0aGVtIGNsZWFuZXIKPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sx
LXBpbmN0cmwuZHRzaSB8IDQzMiArKysrKysrKysrKysrKysrKystCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaSBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4+IGluZGV4IDM4MTA1NTczNzQyMi4u
NzgxMWZiNDg1YmQ0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2sxLXBpbmN0cmwuZHRzaQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sx
LXBpbmN0cmwuZHRzaQo+PiBAQCAtMTEsMTIgKzExLDQzOCBAQAo+PiAgI2RlZmluZSBLMV9HUElP
KHgpCSh4IC8gMzIpICh4ICUgMzIpCj4+ICAKPj4gICZwaW5jdHJsIHsKPj4gKwkvb21pdC1pZi1u
by1yZWYvCj4+ICsJdWFydDBfMF9jZmc6IHVhcnQwLTAtY2ZnIHsKPj4gKwkJdWFydDAtMC1waW5z
IHsKPj4gKwkJCXBpbm11eCA9IDxLMV9QQURDT05GKDEwNCwgMyk+LAkvKiB1YXJ0MF90eGQgKi8K
Pj4gKwkJCQkgPEsxX1BBRENPTkYoMTA1LCAzKT47CS8qIHVhcnQwX3J4ZCAqLwo+PiArCQkJcG93
ZXItc291cmNlID0gPDMzMDA+Owo+PiArCQkJYmlhcy1wdWxsLXVwOwo+PiArCQkJZHJpdmUtc3Ry
ZW5ndGggPSA8MTk+Owo+PiArCQl9Owo+PiArCX07Cj4+ICsKPj4gKwkvb21pdC1pZi1uby1yZWYv
Cj4+ICsJdWFydDBfMV9jZmc6IHVhcnQwLTEtY2ZnIHsKPj4gKwkJdWFydDAtMS1waW5zIHsKPj4g
KwkJCXBpbm11eCA9IDxLMV9QQURDT05GKDEwOCwgMSk+LAkvKiB1YXJ0MF90eGQgKi8KPj4gKwkJ
CQkgPEsxX1BBRENPTkYoODAsIDMpPjsJLyogdWFydDBfcnhkICovCj4+ICsJCQlwb3dlci1zb3Vy
Y2UgPSA8MzMwMD47Cj4gLi4KPj4gKwkJCWJpYXMtcHVsbC11cDsKPiBoZXJlLCBzZWUgY29tbWVu
dCBiZWxvdwo+PiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MTk+Owo+PiArCQl9Owo+PiArCX07Cj4+
ICsKPj4gKwkvb21pdC1pZi1uby1yZWYvCj4+ICAJdWFydDBfMl9jZmc6IHVhcnQwLTItY2ZnIHsK
Pj4gIAkJdWFydDAtMi1waW5zIHsKPj4gLQkJCXBpbm11eCA9IDxLMV9QQURDT05GKDY4LCAyKT4s
Cj4+IC0JCQkJIDxLMV9QQURDT05GKDY5LCAyKT47Cj4+ICsJCQlwaW5tdXggPSA8SzFfUEFEQ09O
Rig2OCwgMik+LAkvKiB1YXJ0MF90eGQgKi8KPj4gKwkJCQkgPEsxX1BBRENPTkYoNjksIDIpPjsJ
LyogdWFydDBfcnhkICovCj4+ICsJCQliaWFzLXB1bGwtdXA7Cj4+ICsJCQlkcml2ZS1zdHJlbmd0
aCA9IDwzMj47Cj4+ICsJCX07Cj4+ICsJfTsKPj4gIAo+PiAtCQkJYmlhcy1wdWxsLXVwID0gPDA+
Owo+IFNvcnJ5LCBJJ3ZlIG92ZXJsb29rZWQgdGhpcywgdGhlIGJpYXMtcHVsbC11cCBuZWVkIHRv
IGV4cGxpY2l0bHkgc2V0IHRvCj4gYSB2YWxlIG9mIDAsIDEgLSBub3JtYWwgcHVsbCB1cCwgb3Ig
c3Ryb25nIHB1bGwgdXAuLiBmb3IgdWFydCwgdGhlIG5vcm1hbAo+IHB1bGwgdXAgc2hvdWxkIGJl
IG9rCj4KPiBwbGVhc2UgcmVmZXIgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvc3BhY2VtaXQsazEtcGluY3RybC55YW1sCj4KPiBTaW5jZSB0aGUgcmM2IGlzIGFscmVh
ZHkgdGFnZ2VkLCBJJ20gYWJvdXQgdG8gcHJlcGFyZSBhIFBSLCBzbyBJZiB5b3UgYWJsZSAKPiB0
byByZXNwaW4gYSBuZXcgdmVyc2lvbiBxdWlja2x5LCBJJ2QgYmUgaGFwcHkgdG8gdGFrZSwgb3Ro
ZXJ3aXNlIGxldCdzIHdhaXQKPiBmb3IgbmV4dCBtZXJnZSB3aW5kb3cgKHdoaWNoIHNob3VsZG4n
dCBiZSBhIGJpZyBwcm9ibGVtKQo+Cj4gYnR3LCBwbGVhc2UgYWx3YXlzIGRvIGEgRFQgY2hlY2s6
IAo+ICAgbWFrZSBBUkNIPXJpc2N2IGR0YnNfY2hlY2sgVz0xCj4KT2gsIEkgd2FzbuKAmXQgYXdh
cmUgb2YgdGhpcy4gSeKAmWxsIHVwZGF0ZSBpdCBhY2NvcmRpbmdseSBhbmQgcnVuIHRoZSBjaGVj
awpiZWZvcmUgc2VuZGluZyBhIG5ldyB2ZXJzaW9uLiBUaGFua3MgZm9yIHRoZSBhZHZpY2UhCgpL
aW5kIHJlZ2FyZHMsCkhlbmRyaWsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
