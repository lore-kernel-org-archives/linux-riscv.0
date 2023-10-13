Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6924DCDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7eGeoMtuh87apBVMt9rkocWp3HJM5DJl+a/X3D4vDBs=; b=Ruoys7cXjrAUZ2H8fmAGX6qivH
	Jw5tWkHR4W/t6c3JYCt7/DPKNEYuEXHd/Z1BYkORFPKuEr4YMV/pLX2avcmpGBdZr0wKYassWcrIH
	Aj3YnQXLmC8xbXLd3p/QBvYglWNKHAydARaVq++byf50TJjRjxK9DmxwHoB6/K3cYPjiKrJMWTYHp
	3c866mWyaCqIrW/PM5a7oYvHZg6D2oIPhTA364eEleP8gJIDRbzC8OjN/KO2MK4EcdlNE4H3LCHVA
	AVQXSezq+y9kSlc4BKlt68QWGeA954ipGEtiAR7x6le9VwZjGEjQf20RUOz58DcwzHIKi1H52/QOz
	f++iHy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrG9O-003IRl-2G;
	Fri, 13 Oct 2023 11:16:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrG9L-003IR1-01
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 11:16:13 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB3F6405E5
	for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697195765;
	bh=YtqXYMDeVBp0iq45r4Ku35W5aryODZRVP0gBJg/Jrhg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hM1QRtzpQVIYyKR60YLr9yb6oJVDOGPKX7Of1XvjakQYGUGuc6dPaR53fqzjUr0qO
	 QmoJZmOlFXlPAi0o3o9kHoGN8LhT4dtYHhvkRHk1Lona3zBbN0tLRI7/GUSfGGWG2Y
	 3lbrjzVwznrzmAUszanXej/rfmg5Cf6XK2KlNo0kbv2id8IcHIC7AUN412iPMQxFKF
	 AQFsyKmFnuPJTL6SB9EOAFZoGFzVeWR+9JugyVkCBwJGf1CJgDnL92wSP1B8cSv0sS
	 nhtCTrFoTtnhqNxCfXqiYD8KjAZi33enLkOFqrliys3vUSpGNVH3EPT8jaKgrFryw7
	 xxmgZMVj/OfTw==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77407e21d49so209514285a.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 04:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697195764; x=1697800564;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YtqXYMDeVBp0iq45r4Ku35W5aryODZRVP0gBJg/Jrhg=;
        b=E4qAcxu6B/gRHvHCsDzQ5bhnN4MekinIVSMjYvsd7a6pab3NLOrawXqleyvo8d35xN
         ktX5BLu8wJXGK8/yJNBCVC2Iw4JHwn9lkT7kQXh8EKIVRngE+LkJuYZqGMFmb8fpH0+/
         AGMBj0dwEQtriVobFFR4o66PDkWf+ud7UbbH0aICw6t8DszhqzPOiNqXOsqmIE+1EadJ
         /zo77zcP5fZyO3sLSvV6KurRnBHGOhKBL6YlchLLQbgbqqd3NSvOSGM+1n2x4O5OQR8X
         BEdSd7wKqkqO4wkPjxS2bKpvxWM320auoKqUGOZurpFk+AaKfp7Hq28ijGo/iDjIJ2Tg
         of5w==
X-Gm-Message-State: AOJu0Yxj1xO3CJrchezfBGn/1x88ItdvHbui2JVPC3DCvUNl7r8Iupji
	mmnEhV0FboA8ksHNeNg3sRbG2ewSTc1xYG/m/qYn1J9bliT3RwUELj8E4HmRJMNOuNiZYWzwCIY
	TfvMxAidWffzbt1zsRibkrADWClldWMsMB4fl/VlaBZ93R3ZNRzhrJi3jPEo35Q==
X-Received: by 2002:a05:622a:190a:b0:418:c70:113e with SMTP id w10-20020a05622a190a00b004180c70113emr29420335qtc.40.1697195764220;
        Fri, 13 Oct 2023 04:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqa6O42MZPuRQEylkmYqh/sPI6dX2Nr8H6zR/JgoLbM1SlKfTaPLKB6Fy+0N0lhpS63jYsCX2I1+w+84+R8Ik=
X-Received: by 2002:a05:622a:190a:b0:418:c70:113e with SMTP id
 w10-20020a05622a190a00b004180c70113emr29420316qtc.40.1697195763893; Fri, 13
 Oct 2023 04:16:03 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Oct 2023 04:16:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <926ee8c7-fab9-49d5-831e-48c886c4bc44@starfivetech.com>
References: <20231012081015.33121-1-xingyu.wu@starfivetech.com>
 <20231012081015.33121-3-xingyu.wu@starfivetech.com> <338544e7-0be8-47c1-a7d7-89990da305d3@wanadoo.fr>
 <926ee8c7-fab9-49d5-831e-48c886c4bc44@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 13 Oct 2023 04:16:02 -0700
Message-ID: <CAJM55Z-hsebX9e3+MNc0GcXO=ao7OB=EYWXp865VQg3L3gyPJw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] clocksource: Add JH7110 timer driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, daniel.lezcano@linaro.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, p.zabel@pengutronix.de, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, samin.guo@starfivetech.com, 
	tglx@linutronix.de, walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_041611_478752_162D66C4 
X-CRM114-Status: GOOD (  23.40  )
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

WGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMTAvMTMgMTo1MywgQ2hyaXN0b3BoZSBKQUlMTEVU
IHdyb3RlOgo+ID4gTGUgMTIvMTAvMjAyMyDDoCAxMDoxMCwgWGluZ3l1IFd1IGEgw6ljcml0wqA6
Cj4gPj4gQWRkIHRpbWVyIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBYaW5neXUgV3UgPHhpbmd5dS53dS1iT05yTTQ1S1dGT1htTVhq
SkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Cj4gPgo+ID4gLi4uCj4KPiBJdCBsb29rcyBub3JtYWwg
aW4gbXkgZW1haWwgYW5kIHRoZSB3ZWIuIElzIHRoaXMgZHVlIHRvIHNvbWUgc2V0dGluZ3M/Cj4K
PiA+Cj4gPj4gK3N0YXRpYyBpbnQgamg3MTEwX3RpbWVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPj4gK3sKPiA+PiArwqDCoMKgIHN0cnVjdCBqaDcxMTBfY2xrZXZ0ICpj
bGtldnRbSkg3MTEwX1RJTUVSX0NIX01BWF07Cj4gPj4gK8KgwqDCoCBjaGFyIG5hbWVbNF07Cj4g
Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpwY2xrOwo+ID4+ICvCoMKgwqAgc3RydWN0IHJlc2V0X2Nv
bnRyb2wgKnJzdDsKPiA+PiArwqDCoMKgIGludCBjaDsKPiA+PiArwqDCoMKgIGludCByZXQ7Cj4g
Pj4gK8KgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7Cj4gPj4gKwo+ID4+ICvCoMKgwqAgYmFzZSA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiA+PiArwqDCoMKgIGlm
IChJU19FUlIoYmFzZSkpCj4gPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIFBUUl9FUlIoYmFzZSksCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgImZhaWxlZCB0byBtYXAgcmVnaXN0ZXJzXG4iKTsKPiA+PiArCj4g
Pj4gK8KgwqDCoCByc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgmcGRldi0+
ZGV2LCAiYXBiIik7Cj4gPj4gK8KgwqDCoCBpZiAoSVNfRVJSKHJzdCkpCj4gPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocnN0KSwgImZh
aWxlZCB0byBnZXQgYXBiIHJlc2V0XG4iKTsKPiA+PiArCj4gPj4gK8KgwqDCoCBwY2xrID0gZGV2
bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgImFwYiIpOwo+ID4+ICvCoMKgwqAgaWYgKElT
X0VSUihwY2xrKSkKPiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBk
ZXYtPmRldiwgUFRSX0VSUihwY2xrKSwKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRvIGdldCAmIGVuYWJsZSBhcGIgY2xvY2tcbiIpOwo+ID4+
ICsKPiA+PiArwqDCoMKgIHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsKPiA+PiAr
wqDCoMKgIGlmIChyZXQpCj4gPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIHJldCwgImZhaWxlZCB0byBkZWFzc2VydCBhcGIgcmVzZXRcbiIpOwo+ID4K
PiA+IEhpLAo+ID4KPiA+IEknbSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSByZXNldF9jb250
cm9sX1tkZV1hc3NlcnQoKSBmdW5jdGlvbnMsIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZSB1bmRvbmUg
YnkgYSByZXNldF9jb250cm9sX2Fzc2VydCgpIGNhbGwgaWYgYW4gZXJyb3Igb2NjdXJzIGxhdGVy
Pwo+Cj4gSW4gdGhpcyBjYXNlLCB0aGUgcmVzZXQgY29udHJvbGxlciBpcyBzZXQgZnJvbSAnYXNz
ZXJ0JyBzdGF0ZSB0byAnZGVhc3NlcnQnIHN0YXRlLiBJZiBpdCBpcyBmYWlsZWQgYW5kIHN0aWxs
ICdhc3NlcnQnIHN0YXRlLCBJIGRvbid0IHRoaW5rIGl0IG5lZWQgdG8gY2FsbCByZXNldF9jb250
cm9sX2Fzc2VydCgpLgoKVGhlIHByb2JsZW0gaXMgaWYgdGhlIGFzc2VydCBzdWNjZWVkcywgYnV0
IHRoZSBwcm9iZSBmdW5jdGlvbiBmYWlscyBsYXRlci4gVGhlbgp0aGVyZSBpcyBub3RoaW5nIHRv
IHVuZG8gdGhlIGRlYXNzZXJ0LiBBIGNvbW1vbiBwYXR0ZXJuIEkgc2VlIGlzIHNvbWV0aGluZyBs
aWtlCnRoaXM6CgpzdGF0aWMgdm9pZCBqaDcxMTBfdGltZXJfcmVzZXRfY29udHJvbF9hc3NlcnQo
dm9pZCAqZGF0YSkKewoJcmVzZXRfY29udHJvbF9hc3NlcnQoZGF0YSk7Cn0KCi4uLgoKCXJldCA9
IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsKCWlmIChyZXQpCgkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoLi4uKTsKCglyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwK
amg3MTEwX3RpbWVyX3Jlc2V0X2NvbnRyb2xfYXNzZXJ0LCByc3QpOwoJaWYgKHJldCkKCQlyZXR1
cm4gcmV0OwoKL0VtaWwKCj4gPgo+ID4+ICsKPiA+PiArwqDCoMKgIGZvciAoY2ggPSAwOyBjaCA8
IEpINzExMF9USU1FUl9DSF9NQVg7IGNoKyspIHsKPiA+PiArwqDCoMKgwqDCoMKgwqAgY2xrZXZ0
W2NoXSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmNsa2V2dFtjaF0pLCBHRlBf
S0VSTkVMKTsKPiA+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFjbGtldnRbY2hdKQo+ID4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+ID4+ICsKPiA+PiArwqDCoMKgwqDC
oMKgwqAgc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiY2glZCIsIGNoKTsKPiA+PiArCj4g
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0tPmJhc2UgPSBiYXNlICsgSkg3MTEwX1RJTUVS
X0NIX0JBU0UoY2gpOwo+ID4+ICvCoMKgwqDCoMKgwqDCoCAvKiBFbnN1cmUgdGltZXIgaXMgZGlz
YWJsZWQgKi8KPiA+PiArwqDCoMKgwqDCoMKgwqAgamg3MTEwX3RpbWVyX2Rpc2FibGUoY2xrZXZ0
W2NoXSk7Cj4gPj4gKwo+ID4+ICvCoMKgwqDCoMKgwqDCoCByc3QgPSBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X2V4Y2x1c2l2ZSgmcGRldi0+ZGV2LCBuYW1lKTsKPiA+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKElTX0VSUihyc3QpKQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJf
RVJSKHJzdCk7Cj4gPj4gKwo+ID4+ICvCoMKgwqDCoMKgwqDCoCBjbGtldnRbY2hdLT5jbGsgPSBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCBuYW1lKTsKPiA+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKElTX0VSUihjbGtldnRbY2hdLT5jbGspKQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBQVFJfRVJSKGNsa2V2dFtjaF0tPmNsayk7Cj4gPj4gKwo+ID4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdCk7Cj4gPj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChyZXQpCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK
PiA+Cj4gPiBTYW1lIGhlcmUuCj4gPgo+ID4+ICsKPiA+PiArwqDCoMKgwqDCoMKgwqAgY2xrZXZ0
W2NoXS0+ZXZ0LmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgY2gpOwo+ID4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoY2xrZXZ0W2NoXS0+ZXZ0LmlycSA8IDApCj4gPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIGNsa2V2dFtjaF0tPmV2dC5pcnE7Cj4gPj4gKwo+ID4+ICvCoMKgwqDC
oMKgwqDCoCBzbnByaW50ZihjbGtldnRbY2hdLT5uYW1lLCBzaXplb2YoY2xrZXZ0W2NoXS0+bmFt
ZSksICIlcy5jaCVkIiwgcGRldi0+bmFtZSwgY2gpOwo+ID4+ICvCoMKgwqDCoMKgwqDCoCBqaDcx
MTBfY2xvY2tldmVudHNfcmVnaXN0ZXIoY2xrZXZ0W2NoXSk7Cj4gPj4gKwo+ID4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGNsa2V2dFtjaF0tPmV2
dC5pcnEsIGpoNzExMF90aW1lcl9pbnRlcnJ1cHQsCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElSUUZfVElNRVIgfCBJUlFGX0lSUVBPTEwsCj4gPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0t
Pm5hbWUsICZjbGtldnRbY2hdLT5ldnQpOwo+ID4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+
ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPj4gKwo+ID4+ICvCoMKg
wqDCoMKgwqDCoCByZXQgPSBqaDcxMTBfY2xvY2tzb3VyY2VfaW5pdChjbGtldnRbY2hdKTsKPiA+
Cj4gPiBEb2VzIHNvbWV0aGluZyBzaG91bGQgYmUgZG9uZSBpZiB0aGlzIGZhaWxzPwo+ID4KPiA+
IENKCj4KPiBZZXMsIGl0IHNob3VsZCBiZSBjYWxsIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgaGVy
ZSBhbmQgSSB3aWxsIGFkZCBpdCBpbiBuZXh0IHZlcnNpb24uCj4KPiA+Cj4gPj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChyZXQpCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK
PiA+PiArwqDCoMKgIH0KPiA+PiArCj4gPj4gK8KgwqDCoCByZXR1cm4gMDsKPiA+PiArfQo+ID4+
ICsKPiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgamg3MTEwX3RpbWVyX21h
dGNoW10gPSB7Cj4gPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC10
aW1lciIsIH0sCj4gPj4gK8KgwqDCoCB7IC8qIHNlbnRpbmVsICovIH0KPiA+PiArfTsKPiA+PiAr
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgamg3MTEwX3RpbWVyX21hdGNoKTsKPiA+PiArCj4gPj4g
K3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGpoNzExMF90aW1lcl9kcml2ZXIgPSB7Cj4g
Pj4gK8KgwqDCoCAucHJvYmUgPSBqaDcxMTBfdGltZXJfcHJvYmUsCj4gPj4gK8KgwqDCoCAuZHJp
dmVyID0gewo+ID4+ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJqaDcxMTAtdGltZXIiLAo+ID4+
ICvCoMKgwqDCoMKgwqDCoCAub2ZfbWF0Y2hfdGFibGUgPSBqaDcxMTBfdGltZXJfbWF0Y2gsCj4g
Pj4gK8KgwqDCoCB9LAo+ID4+ICt9Owo+ID4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGpoNzEx
MF90aW1lcl9kcml2ZXIpOwo+ID4+ICsKPiA+PiArTU9EVUxFX0FVVEhPUigiWGluZ3l1IFd1IDx4
aW5neXUud3UtYk9Ock00NUtXRk9YbU1YakpCcFdxZ0BwdWJsaWMuZ21hbmUub3JnPiIpOwo+ID4+
ICtNT0RVTEVfREVTQ1JJUFRJT04oIlN0YXJGaXZlIEpINzExMCB0aW1lciBkcml2ZXIiKTsKPiA+
PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+ID4KPgo+IFRoYW5rcywKPiBYaW5neXUgV3UKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
