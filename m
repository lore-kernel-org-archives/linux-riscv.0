Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26A1C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0+quJInq81bf7aHhC1OEf1DuRqdgBRW1GQ+MCQxyRc=; b=Qc0brxf+vOrrZl
	VyueutMoPbIkNfVeyTxg7PTXYsBDp2jEW6se+uXM3bxGUxvB3DJ4Uwo6KE0LGgKXq7KWcBDC7IgtR
	/lPl/JgQYijokOHXttpa95Dzj+iie3OG8FHnm9raMj7yqx144PAErEWGTKLO/NaKMAyiR0OaudJ/A
	v1QhZEX8qa9F62+3W8T34VZDPN5+MkfLiyWnrseImwB2pyoUV1BCwDToMWy8OjkUKkcoAotEzipeG
	b+djOWjCr9R0K989jY47+VzIVlu+tsSEoJUkOIroyc17quhsQ5GfKhUWjixf5odW6/ngCH4z/Bv1Z
	bAlWqYBHffOX5tSucuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLiJM-0000000GhEf-1BVC;
	Mon, 24 Jun 2024 11:56:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLiJI-0000000GhDz-1vGm
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 11:56:39 +0000
Date: Mon, 24 Jun 2024 13:56:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719230193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6fIpTYEbw/5Hg01e4xNPhrpp1XjqqkIHjd4UFwopHk=;
	b=t5U0NfiuR7u57BbfVS/yadPrUNyyDwdLLmqidlRg90p8qMVUlb3jTh9zUHMdnKBGKsoRwy
	QgK7bGd5u7XDxtkTwzBKq/DbEbvGlzOm3e90fpTHLRKzByqnfRMu53feMa06aVRhQEWREJ
	OgW9YMimLffgbjYc2TyB6x/Yc8sIzO53sSD11JX1kNlLUSrZXnj+QVwKDAfl1v9Tde3+ei
	XHuPCmBd+cUXtzXIRBbkf6KEbhO0XLvf4JrEdhiUZc6KqBbqXBrLwYe5hLugrzgr/LfDFj
	j9KDDNeaRTRwU/7S1+WqGGVsSoBxOCYzHK6wOyyAvvG597SivwbpXEZHFpbC6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719230193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6fIpTYEbw/5Hg01e4xNPhrpp1XjqqkIHjd4UFwopHk=;
	b=n6MlwxdATeQpHasM93pVJ3E5phkWKWlXvIScXe4ANepN8ex+pMYmSLw2twG9VVHh1qUarj
	3f25R45vKotvhJDw==
From: Nam Cao <namcao@linutronix.de>
To: Yan =?utf-8?B?WmhlbmfvvIjkuKXmlL/vvIk=?= <zhengyan@asrmicro.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"maz@kernel.org" <maz@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Zhou =?utf-8?B?UWlhbyjlkajkvqgp?= <qiaozhou@asrmicro.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?=
 irqchip/sifive-plic: ensure interrupt is enable before EOI
Message-ID: <20240624115629.6vSA6hQE@linutronix.de>
References: <20240624085341.3935-1-zhengyan@asrmicro.com>
 <20240624093556.ZcZgu2GF@linutronix.de>
 <69174a28eff44ad1b069887aa514971e@exch03.asrmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69174a28eff44ad1b069887aa514971e@exch03.asrmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_045636_823391_2E0EFF3D 
X-CRM114-Status: GOOD (  29.05  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgMTE6MTQ6NDdBTSArMDAwMCwgWWFuIFpoZW5n77yI5Lil
5pS/77yJIHdyb3RlOgo+ID4gSSBoYXZlIG5vIGtub3dsZWRnZSBhYm91dCBhZmZpbml0eSBzdHVm
Ziwgc28gSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGlzCj4gPiBwYXRjaC4gQnV0IHRoZXJl
IGlzIGFub3RoZXIgaWRlYSByZWdhcmRpbmcgdGhpcyAiaWdub3JlZCBFT0kiIHByb2JsZW06Cj4g
PiBhbHdheXMgImNvbXBsZXRlIiB0aGUgaW50ZXJydXB0IHdoaWxlIGVuYWJsaW5nLiBUaGF0IHdv
dWxkIG1vdmUgdGhpcyBleHRyYQo+ID4gY29tcGxpY2F0aW9uIG91dCBvZiB0aGUgaG90IHBhdGgs
IGFuZCBhbHNvIGxvb2tzIHNpbXBsZXIgaW4gbXkgb3Bpbmlvbi4KPiA+IAo+ID4gU29tZXRoaW5n
IGxpa2UgdGhlIHBhdGNoIGJlbG93LiBXb3VsZCB0aGlzIHNvbHZlIHRoaXMgImFmZmluaXR5IHBy
b2JsZW0iCj4gPiB0b28/Cj4gPiAKPiBObywgSSdtIGFmcmFpZCB0aGUgZm9sbG93aW5nIHBhdGNo
IGNhbid0IHNvbHZlIHRoaXMgY29ybmVyIGNhc2UuIEkgdGhvdWdodCBpdCdzIGJlY2F1c2UgdGhl
IGNvcmUKPiBXaG8gZXhlY3V0ZXMgcGxpY19pcnFfZW5hYmxlIGlzIG5vdCB0aGUgY29yZSB3aG8g
bWlzc2luZyBhIHdyaXRlIGNsYWltLgo+IFNvIGlmIHdlIHdhbnQgdG8gZG8gaXQgaW4gZW5hYmxl
IGl0IG1pZ2h0IGJlIHNvbWV0aGluZyBsaWtlIGZvbGxvd3MgOgo+IHN0YXRpYyB2b2lkIHBsaWNf
dG9nZ2xlKHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIsIGludCBod2lycSwgaW50IGVuYWJs
ZSkKPiAgewo+ICAgICAgICAgcmF3X3NwaW5fbG9jaygmaGFuZGxlci0+ZW5hYmxlX2xvY2spOwo+
IC0gICAgICAgX19wbGljX3RvZ2dsZShoYW5kbGVyLT5lbmFibGVfYmFzZSwgaHdpcnEsIGVuYWJs
ZSk7Cj4gKyAgICAgICBpZiAoZW5hYmxlKSB7Cj4gKyAgICAgICAgICAgICAgIHdyaXRlbChod2ly
cSwgaGFuZGxlci0+aGFydF9iYXNlICsgQ09OVEVYVF9DTEFJTSk7Cj4gKyAgICAgICAgICAgICAg
IF9fcGxpY190b2dnbGUoaGFuZGxlci0+ZW5hYmxlX2Jhc2UsIGh3aXJxLCBlbmFibGUpOwo+ICsg
ICAgICAgfQo+ICAgICAgICAgcmF3X3NwaW5fdW5sb2NrKCZoYW5kbGVyLT5lbmFibGVfbG9jayk7
Cj4gIH0KCkFnYWluLCBJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgaW50ZXJydXB0IGFmZmlu
aXR5IHRoaW5neSwgc28gSSBtYXkgYmUKc2F5aW5nIHNvbWV0aGluZyBkdW1iIGhlcmU6CgpJIHRo
aW5rIHRoaXMgd291bGRuJ3Qgd29yayBlaXRoZXIuIEluIHBsaWNfc2V0X2FmZmluaXR5KCksIEkg
c2VlIHRoZQppbnRlcnJ1cHQgaXMgZGlzYWJsZWQsIHRoZW4gZW5hYmxlZCBhZ2Fpbi4gV2l0aCB5
b3VyIG5ldyBwcm9wb3NlZCBzb2x1dGlvbiwKdGhlIGludGVycnVwdCB3b3VsZCBhbHNvIGJlIG1h
cmtlZCBjb21wbGV0ZWQgd2l0aGluIHBsaWNfc2V0X2FmZmluaXR5KCkuClNvLCB0aGUgaW50ZXJy
dXB0IG1heSBiZSBhc3NlcnRlZCBhZ2FpbiwgZWFybGllciB0aGFuIGl0IGlzIHN1cHBvc2VkIHRv
IChpdAppcyBub3Qgc3VwcG9zZWQgdG8gYmUgYXNzZXJ0ZWQgYWdhaW4gdW50aWwgcGxpY19pcnFf
ZW9pKCkgaXMgY2FsbGVkKS4gSXQncwpyYXJlLCBidXQgSSB0aGluayBpdCdzIGEgcG9zc2libGUg
cmFjZS4KCkkgZG9uJ3QgaGF2ZSBhIGJldHRlciBpZGVhLCBhdCBsZWFzdCBmb3Igbm93LiBTbyBw
cm9iYWJseSB3ZSBzaG91bGQgc3RpY2sKdG8geW91ciBjdXJyZW50IHNvbHV0aW9uLgo+IAo+IEJ1
dCB0aGVyZSBpcyBhIGxpdHRsZSBkaWZmZXJlbmNlOgo+IGEuIGNoZWNrIHdoZXRoZXIgaXQncyBl
bmFibGVkICB3aGVuIGRvIHdyaXRlIGNsYWltCj4gYi4gd3JpdGUgY2xhaW0gYW55d2F5IGJlZm9y
ZSBlbmFibGUgCj4gCj4gc291bmRzIGxpa2UgYS4gaXMgYmV0dGVyPwo+IAo+IEFuZCBJJ2QgbGlr
ZSB0byBpbGx1c3RyYXRlIG1vcmUgYWJvdXQgdGhpcyBjYXNlOgo+IEZvciBleGFtcGxlLCBicm9h
ZGNhc3QgdGljayBpcyB3b3JraW5nLCBjcHUwIGlzIGFib3V0IHRvIHJlc3BvbnNlLCBjcHUxIGlz
IHRoZSBuZXh0Cj4gMS4gY3B1MCAgcmVzcG9uc2UgdGhlIHRpbWVyIGlycSwgcmVhZCB0aGUgY2xh
aW0gUkVHLCBhbmQgZG8gdGltZXIgaXNyIGV2ZW50LCAKPiAyLiAgZHVyaW5nIHRoZSB0aW1lciBp
c3IgaXQgd2lsbCBzZXQgbmV4dCBldmVudCAKPiB0aWNrX2Jyb2FkY2FzdF9zZXRfZXZlbnQgLT4g
IGlycV9zZXRfYWZmaW5pdHktPiB4eHgtPiBwbGljX3NldF9hZmZpbml0eSAtPiBwbGljX2lycV9l
bmFibGUKPiAzLiBpbiBwbGljX3NldF9hZmZpbml0eSAgZGlzYWJsZSBjcHUwJ3MgSUUgYW5kIGVu
YWJsZSBjcHUxJ0lFCj4gNC4gY3B1MCBkbyB0aGUgd3JpdGUgY2xhaW0gdG8gZmluaXNoIHRoaXMg
aXJxLCB3aGlsZSBjcHUwJ3MgSUUgaXMgZGlzYWJsZWQgLCBsZWZ0IGFuIGFjdGl2ZSBzdGF0ZSBp
biBwbGljCgpUaGlzIGlzIHVzZWZ1bCBpbmZvcm1hdGlvbiwgeW91IG1heSB3YW50IHRvIGFkZCBp
dCBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlLgo+IAo+IEJlc3QgcmVnYXJkcywKPiB6aGVuZ3lhbgo+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+ID4gaW5kZXggMGEyMzNlOWQ5NjA3Li42
M2YyMTExY2VkNGEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1w
bGljLmMKPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+ID4gQEAg
LTEyMiw3ICsxMjIsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIHBsaWNfaXJxX3RvZ2dsZShjb25z
dCBzdHJ1Y3QKPiA+IGNwdW1hc2sgKm1hc2ssCj4gPiAKPiA+ICBzdGF0aWMgdm9pZCBwbGljX2ly
cV9lbmFibGUoc3RydWN0IGlycV9kYXRhICpkKSAgewo+ID4gKwlzdHJ1Y3QgcGxpY19wcml2ICpw
cml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCk7Cj4gCXN0cnVjdCBwbGljX2hhbmRs
ZXIgKmhhbmRsZXIgPSB0aGlzX2NwdV9wdHIoJnBsaWNfaGFuZGxlcnMpOwo+IG1pc3NpbmcgYSBk
ZWZpbml0aW9uPyBJZiBhZGRzIGxpa2UgdGhpcyB3aWxsIGNhdXNlIGEgcHJvYmxlbS4KClNvcnJ5
LCBzaG91bGQgaGF2ZSBtZW50aW9uZWQgSSBkaWRuJ3QgYnVpbGQgdGhpcyBwYXRjaC4gSnVzdCB3
YW50ZWQgdG8KdGhyb3cgb3V0IGlkZWFzLi4KCj4gPiArCj4gPiArCXdyaXRlbCgwLCBwcml2LT5y
ZWdzICsgUFJJT1JJVFlfQkFTRSArIGQtPmh3aXJxICogUFJJT1JJVFlfUEVSX0lEKTsKPiA+ICsK
PiA+ICsJd3JpdGVsKGQtPmh3aXJxLCBoYW5kbGVyLT5oYXJ0X2Jhc2UgKyBDT05URVhUX0NMQUlN
KTsKPiA+ICsKPiA+ICAJcGxpY19pcnFfdG9nZ2xlKGlycV9kYXRhX2dldF9lZmZlY3RpdmVfYWZm
aW5pdHlfbWFzayhkKSwgZCwgMSk7Cj4gPiArCj4gPiArCXdyaXRlbCgxLCBwcml2LT5yZWdzICsg
UFJJT1JJVFlfQkFTRSArIGQtPmh3aXJxICogUFJJT1JJVFlfUEVSX0lEKTsKPiA+ICB9Cj4gPiAK
PiA+ICBzdGF0aWMgdm9pZCBwbGljX2lycV9kaXNhYmxlKHN0cnVjdCBpcnFfZGF0YSAqZCkgQEAg
LTE0OCwxMyArMTU2LDcgQEAgc3RhdGljCj4gPiB2b2lkIHBsaWNfaXJxX2VvaShzdHJ1Y3QgaXJx
X2RhdGEgKmQpICB7Cj4gPiAgCXN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIgPSB0aGlzX2Nw
dV9wdHIoJnBsaWNfaGFuZGxlcnMpOwo+ID4gCj4gPiAtCWlmICh1bmxpa2VseShpcnFkX2lycV9k
aXNhYmxlZChkKSkpIHsKPiA+IC0JCXBsaWNfdG9nZ2xlKGhhbmRsZXIsIGQtPmh3aXJxLCAxKTsK
PiA+IC0JCXdyaXRlbChkLT5od2lycSwgaGFuZGxlci0+aGFydF9iYXNlICsgQ09OVEVYVF9DTEFJ
TSk7Cj4gPiAtCQlwbGljX3RvZ2dsZShoYW5kbGVyLCBkLT5od2lycSwgMCk7Cj4gPiAtCX0gZWxz
ZSB7Cj4gPiAtCQl3cml0ZWwoZC0+aHdpcnEsIGhhbmRsZXItPmhhcnRfYmFzZSArIENPTlRFWFRf
Q0xBSU0pOwo+ID4gLQl9Cj4gPiArCXdyaXRlbChkLT5od2lycSwgaGFuZGxlci0+aGFydF9iYXNl
ICsgQ09OVEVYVF9DTEFJTSk7Cj4gPiAgfQo+ID4gCj4gPiAgI2lmZGVmIENPTkZJR19TTVAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
