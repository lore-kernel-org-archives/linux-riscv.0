Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0808EC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 04:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:Subject:
	Message-Id:In-Reply-To:From:Cc:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u+NBTr6YimdoqyNpXkjKtJCvkMKh2jrZAesSTosDMMI=; b=WphCAqSr6dYpMVrpcb2/1DxI3X
	bC4d+WW8sJIZCEGLGRn1mu4huktuuSoRpHtnstCwmjo94/iEHOyBCfhYktCJrA3RDVY/X9DQmYQaV
	/ECDPrGR3IyNdCcCVum5tezSN6xyZqp9G8YyTYxKuWQuPDCdC0ppfg6KymWLbIjWdoop1ZdxgXm1P
	p64DeEzN+v7qjkIOy632nyOvkgSpDb+sHLsZEYp8eeC4sU53xgyfzYQkTnCO3MRtYIppOoj6rE41F
	+lBUWaLLWgPyIl5e+wO/g3lH2QoVqmv8kU9hhPRphW1/LpJ+N+XiDRJfKt4CLDEHfYMqB8dPcuWui
	L8/TX+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9EGZ-000000075jl-2oSs;
	Wed, 23 Sep 2026 04:07:31 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9EGX-000000075jQ-0qtA
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 04:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790136443;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UfslGxYouv/baTrSNVrAz/2uz9nr9RQGE5GC8j5a1Dk=;
 b=emaUYLWT16pLphuKBCImwM2OpWlTOIgsAhb5UDQwUdlJKzLSt7a2YRZwEkaAoFcuQYLp06
 oMVI2iVFK8Ja1STJLvazorXKnzZv+MQ4glS5ekT3EDsIRgu/mRfG30iIMpYTUJvumSimGE
 gJrY2ko8y7r0IKAlhuivjXNYqw03efGKeqzcHSFPPkv3fTTMWTDztPgEVELFx1PC6qfwyM
 H6gZGAARzhwi8V8rgVQp19TpOw6QRbl2VZaylWrky34uPOMFmabOtOfHbfaEQl6f9+kWTP
 6ThwmfWWaKIvrn2brFWDnW5Zaa+EPCjDYKkyyk+D/L2vhii7fIslaaxqJO4kHA==
Date: Wed, 23 Sep 2026 12:07:20 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab35079+f54cd5+lists.infradead.org+sandie.cao@deepcomputing.io>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Mime-Version: 1.0
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
	<DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_210729_315188_BA9EC703 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxMDoxOAo+IE9uIFR1ZSwg
U2VwIDIyLCAyMDI2IGF0IDA3OjA0OjM0UE0gKzA4MDAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpCj4gPiBbLi4uXQo+ID4gQEAgLTQ0MSw2ICs0
NDEsNzIgQEAgc29jOiBzb2Mgewo+ID4gWy4uLl0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1c2IzYl91MnBoeTogcGh5QDgxNTAwMDAwIHsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszLXVzYjItcGh5IjsKPiA+ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSA8MHgwIDB4ODE1MDAwMDAg
MHgwIDB4MjAwPjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
a3MgPSA8JnN5c2Nvbl9hcG11IENMS19BUE1VX1VTQjJfQlVTPjsKPiA+ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjcGh5LWNlbGxzID0gPDA+Owo+ID4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTsKPiA+IFsuLi5dCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdXNiM2NfdTJwaHk6IHBoeUA4MTgwMDAwMCB7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy11c2IyLXBoeSI7Cj4gPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gPDB4MCAweDgxODAwMDAw
IDB4MCAweDIwMD47Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2tzID0gPCZzeXNjb25fYXBtdSBDTEtfQVBNVV9VU0IyX0JVUz47Cj4gPiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3BoeS1jZWxscyA9IDwwPjsKPiA+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07Cj4gU2hvdWxkIHRoZXNlIHVzZSBDTEtfQVBNVV9VU0IzX1BP
UlRCX0JVUyBhbmQgQ0xLX0FQTVVfVVNCM19QT1JUQ19CVVMsCj4gcmVzcGVjdGl2ZWx5PwoKSGVy
ZSBpcyBjbG9jayBmb3IgdXNiMnBoeS7CoCBDTEtfQVBNVV9VU0IzX1BPUlRCX0JVUyBpcyBjbG9j
ayBmb3IgVVNCMyBQT1JUQi4gQ0xLX0FQTVVfVVNCM19QT1JUQ19CVVMgaXMgY2xvY2sgZm9yIFVT
QjMgUE9SVEMuCgpQbGVhc2Ugbm90ZTogdXNiM2RfdTJwaHkgYWxzbyB1c2UgQ0xLX0FQTVVfVVNC
Ml9CVVMuCgrCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgdXNiM2RfdTJwaHk6IHBoeUA4MWIwMDAw
MCB7CsKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBjb21wYXRpYmxlID0gInNw
YWNlbWl0LGszLXVzYjItcGh5IjsKwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKg
IHJlZyA9IDwweDAgMHg4MWIwMDAwMCAweDAgMHgyMDA+OwrCoMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgwqAgY2xvY2tzID0gPCZzeXNjb25fYXBtdSBDTEtfQVBNVV9VU0IyX0JVUz47
CsKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAjcGh5LWNlbGxzID0gPDA+OwrC
oMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsK
wqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIH07CgpCZXN0IHJlZ2FyZHMKU2FuZGllCgo+wqAKPiAt
LcKgCj4gVHJveSBNaXRjaGVsbAo+wqAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
