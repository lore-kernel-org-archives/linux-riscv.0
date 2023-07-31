Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1DEC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF8YCUhjsWaIJ+AZ0QpviNYbdLhfoNrRB7EhvLcbdls=; b=BE0vwLs6dv9Q6g
	NZwImivAUIwBEwj/ScH9eL5Yg/9nGwL1F7y1KR+0qAp0KFE3dLsxU0fn2mrl6WfmIIocErf37khoV
	NfG1St9X4vE38ny1WJyuTJ+iREOBhm4UNCCnLdThczeHdhqZ0Ixzwg2570A0hymTo/vsf9DpyU7np
	JF2jWCI9zagmIiHIHpCql0qh5LPfTnz6NDrN6AQIqenUY74dVkZnOsgypffrlgU0Kk05VAV3TyqDS
	wY/jlm6B4HydFZyFlKB+cAV+0xYgNAN/wRu4rURilv5O9IS3Fxtrda7s/pa9B9sUWxjezklgeNGsJ
	DERPA1jRQeBt/7/k97Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUjM-00GLZH-1e;
	Mon, 31 Jul 2023 15:22:44 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUjI-00GLWv-2X;
	Mon, 31 Jul 2023 15:22:42 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so67799361fa.2;
        Mon, 31 Jul 2023 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690816944; x=1691421744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I2XlloNGmKuxVxE6pKOqgLTGqBQKWwmgKZfx+QruRY=;
        b=rpYrkLP4Y8+1qUUfAV+PptQg1XOnyI36VXs8D3qJDc9qDJ0yUBGB93VUz8f5khHAJG
         kiu7W5hFqpFYAlXT37+i6cVE82BM8waYCeaetlzVG94esLTDkcziri0cPH1gHRYzfWOX
         rf1jBkl18FoVLCzoECthSVczIF5ZzHKGZaChqtQYa+zIMvqTSvU4hB0LIDQ+GqMRKiJe
         7oRNSB6m7pflwgzI58KlDsxvMG2kz8bmUF9sbhPnVqzmIXDi2jDdnqEPvuOSTGD5iPF3
         MI1aLE/d/3ZlGvebKQM8Q+vYC/n8A4AM6n7qSLvSNX4lJTr//L/9FRtpm3pKdHduQ1BN
         ygkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690816944; x=1691421744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I2XlloNGmKuxVxE6pKOqgLTGqBQKWwmgKZfx+QruRY=;
        b=VvS1F4ensZNpSdE0esDCHsVz722eKHOS7caeRJyuVTNeNZOmqQaV6saq7vK7dSNwet
         fFaaDhHSTXGXGAyv0vNcdp7umijg8m0edr+HQ2Bg2VAtEO5hXzcLrcKQEvaeux+FO1nR
         1HtknwDiwqyofHmyzbc1+RKQm8pz9Paj+IGFGk/WE7QsW32pnNEjn3FxXNav+lepDywG
         OePLrjCIP4OM8IE6ot73eYk6VkjW+PNyE03dO6P1esTl2s6uhSYHKYJoFG6RrPrqfTtR
         QUV3SRnQ7LICtPkWHCaH7wBXIHRb+RHhQbIyBDdZpHbVjFvzYdB/EvmqgutUWRMs+SbB
         6jhg==
X-Gm-Message-State: ABy/qLYJ/s63CGUMSKxwtkU0x9CbKqTESe4EvBWejWhPpUQoypGn0aLY
	6xIoPooFjs79NoJsinW8LTc6Td6n9oC4/H6MtEY=
X-Google-Smtp-Source: APBJJlGQ9izbwIrNbdEstsW1RMxfgp3nEoOpX5PUx15pIyA8vmZ/Y8AdE625q8ChWAjJZ0sdhbYfcpTO5r6kLsvmv08=
X-Received: by 2002:a2e:86c8:0:b0:2b9:e304:5f81 with SMTP id
 n8-20020a2e86c8000000b002b9e3045f81mr238576ljj.23.1690816943059; Mon, 31 Jul
 2023 08:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
 <20230624131632.2972546-4-bigunclemax@gmail.com> <10311404.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10311404.nUPlyArG6x@jernej-laptop>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 31 Jul 2023 18:22:11 +0300
Message-ID: <CALHCpMgXy0pLiVR8V48Roi82EJ7Zrx-Xyc-6etjgkmN0B7pb8A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add QSPI pins node for
 pinmux PC port
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_082240_844525_CE1E1C12 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

0L/QvSwgMzEg0LjRjtC7LiAyMDIz4oCv0LMuINCyIDAxOjMwLCBKZXJuZWogxaBrcmFiZWMgPGpl
cm5lai5za3JhYmVjQGdtYWlsLmNvbT46Cj4KPiBEbmUgc29ib3RhLCAyNC4ganVuaWogMjAyMyBv
YiAxNToxNjoyNCBDRVNUIGplIE1ha3NpbSBLaXNlbGV2IG5hcGlzYWwoYSk6Cj4gPiBBZGQgcGlu
bXV4IG5vZGUgdGhhdCBkZXNjcmliZXMgcGlucyBvbiBQQyBwb3J0IHdoaWNoIHJlcXVpcmVkIGZv
cgo+ID4gUVNQSSBtb2RlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1ha3NpbSBLaXNlbGV2IDxi
aWd1bmNsZW1heEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Fs
bHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpIHwgNyArKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gPiBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgaW5kZXgKPiA+IDFiYjFlNWNhZTYwMi4u
OWY3NTRkZDAzZDg1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5u
ZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gQEAgLTEzMSw2ICsxMzEsMTMgQEAgdWFydDNf
cGJfcGluczogdWFydDMtcGItcGlucyB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwaW5zID0gIlBCNiIsICJQQjciOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZnVuY3Rpb24gPSAidWFydDMiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiArCj4g
PiArICAgICAgICAgICAgICAgICAgICAgL29taXQtaWYtbm8tcmVmLwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHFzcGkwX3BjX3BpbnM6IHFzcGkwLXBjLXBpbnMgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGlucyA9ICJQQzIiLCAiUEMzIiwgIlBDNCIsICJQQzUiLAo+ICJQ
QzYiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJQQzciOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAic3BpMCI7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgfTsKPgo+IFNvcnJ5IGZvciBsYXRlIHJldmlldywgYnV0IGl0IHNl
ZW1zIEknbSBtaXNzaW5nIHNvbWV0aGluZy4gRDEgbWFudWFsIHNheXMKPiB0aG9zZSBhcmUgcGlu
cyBmb3Igb3JkaW5hcnkgU1BJLCB3aXRoIEhPTEQgYW5kIFdQIHNpZ25hbHMuIENhbiB0aGV5IGJl
Cj4gcmVwdXJwb3NlZCBmb3IgcXVhZCBTUEk/Cj4KWWVzLCB0aGV5IGNhbi4gSGVyZSBpcyBhIHF1
b3RlIGZyb20gRDEgZGF0YXNoZWV0ICg5LjMuMy44IFNQSQpRdWFkLUlucHV0L1F1YWQtT3V0cHV0
IE1vZGUpOgoiVXNpbmcgdGhlIHF1YWQgbW9kZSBhbGxvd3MgZGF0YSB0byBiZSB0cmFuc2ZlcnJl
ZCB0byBvciBmcm9tIHRoZQpkZXZpY2UgYXQgNCB0aW1lcyB0aGUgcmF0ZSBvZiBzdGFuZGFyZCBz
aW5nbGUgbW9kZSwgdGhlIGRhdGEgY2FuIGJlCnJlYWQKYXQgZmFzdCBzcGVlZCB1c2luZyBmb3Vy
IGRhdGEgYml0cyAoTU9TSSwgTUlTTywgSU8yIChXUCMpIGFuZCBJTzMKKEhPTEQjKSkgYXQgdGhl
IHNhbWUgdGltZS4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
