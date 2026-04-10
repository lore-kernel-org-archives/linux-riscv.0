Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A499F364CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1p/zsmQ8xiHJJHNVYB32hjYsyCjBY5RGUY8MulLGbCQ=; b=LcEdrBy+KlmeJf
	qWCtBIX0pF2PnA/gq3xw6U4X+Oy0pFcEWTE7iPu4e1kxm1jP47Ir9GXZTkWGYjoJuKI51uypzwwyg
	rs+fgQb7SK77YK8QPHXB36mYBJWoUDZdl4tBUf7S+miSAmYDwSq1kywawLZ5bw1ipJ1GtDIQOKcbV
	Mj2KIUnqjbf1r8rx9b262sNMKC3YNwuy7CjoTbQ/gnrXS8bYqJ/bFXo0bGp0oGonJnc7Mxu/v6r+k
	UYQSs59ia7RstXbnOGCGvso9Vinn9lPUr/AvRgMY0lie0ZwbQoFlIUVit+V9UdBET0wkhFWvcCShB
	qUVUWi6Z/zjx6ogiJp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Qq-0000000C2Rq-1yVM;
	Fri, 10 Apr 2026 10:49:48 +0000
Received: from forward102a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Qm-0000000C2Qu-0neU
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 10:49:46 +0000
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:31e:0:640:f144:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id E1485C00FE;
	Fri, 10 Apr 2026 13:49:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WnEcZtPT0eA0-AuqeOBKC;
	Fri, 10 Apr 2026 13:49:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775818174; bh=IcO/x1FrHf3hjYD0utkyF09LMwpay85o31xCqEUq5II=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=X62rk46W2NxHg98LxdIz4GWvw+H+ZCu+RLS85emi1ngviIVYTmxYN3ORA4k+/zqM/
	 TEtZ//7eT7ydQfB1Lv1fkyBJb9wUmg6/nGKfr9e4RQxnN7f9TC99ha2HULlu5w60dJ
	 xUbsuHessz49qyBZvbIzSJWXFShr1iRwvneIn2OQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <cd37e33a200e05f96830f8edf313b0651572c32f.camel@yandex.ru>
Subject: Re: [PATCH v2 1/2] riscv: add platform-specific double word shifts
 for riscv32
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andrew Morton	
 <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel	
 <ardb@kernel.org>, linux-riscv@lists.infradead.org, kernel test robot	
 <lkp@intel.com>
Date: Fri, 10 Apr 2026 13:49:31 +0300
In-Reply-To: <20260409232252.GA495784@inky.localdomain>
References: <adavgV5IF9jMzxr3@ashevche-desk.local>
	 <20260409033824.465455-1-dmantipov@yandex.ru>
	 <20260409033824.465455-2-dmantipov@yandex.ru>
	 <20260409232252.GA495784@inky.localdomain>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034944_781793_771EB318 
X-CRM114-Status: GOOD (  15.51  )
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

T24gVGh1LCAyMDI2LTA0LTA5IGF0IDE2OjIyIC0wNzAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6
Cgo+IEhvd2V2ZXIsIHRoaXMgY2hhbmdlIGNhdXNlcyB0aGUgbGlic3R1YiB0byBieXBhc3MgdGhl
c2UgbmV3IGZ1bmN0aW9ucwo+IHlvdSBoYXZlIGludHJvZHVjZWQuIGxpYi1hc2hsZGkzLm8gYW5k
IGxpYi1sc2hyZGkzLm8gdXNlIHRoZSBmb2xsb3dpbmcKPiBydWxlIHRvIGNvbXBpbGUgdGhlIGdl
bmVyaWMgYXJjaCBsaWJzOgo+IAo+ICQob2JqKS9saWItJS5vOiAkKHNyY3RyZWUpL2xpYi8lLmMg
Rk9SQ0UKPiAJJChjYWxsIGlmX2NoYW5nZWRfcnVsZSxjY19vX2MpCj4gCj4gVGhpcyBpcyBzcGVj
aWZpY2FsbHkgZm9yIHRoZSBlZmkgbGlic3R1YiwgdGhlIHJlZ3VsYXIga2VybmVsIChsaWtlIGlu
Cj4geW91ciB0ZXN0IGNhc2UgaW4gdGhlIG5leHQgcGF0Y2gpIHdpbGwgdXNlIHRoZXNlIG5ld2x5
IGludHJvZHVjZWQKPiBmdW5jdGlvbnMuCj4gCj4gT25lIHNvbHV0aW9uIGlzIHRvIHVzZSB0aGlz
IGNoYW5nZSBpbnN0ZWFkOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9s
aWJzdHViL01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZQo+
IGluZGV4IGUzODZmZmQwMDliNy4uNzc1YzM0ZDgwMTc5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL2Vm
aS9saWJzdHViL01ha2VmaWxlCj4gQEAgLTk2LDcgKzk2LDcgQEAgQ0ZMQUdTX3pib290LWRlY29t
cHJlc3MtZ3ppcC5vwqDCoMKgwqDCoMKgwqAgKz0gLUkkKHNyY3RyZWUpL2xpYi96bGliX2luZmxh
dGUKPiDCoHpib290LW9iai0kKENPTkZJR19LRVJORUxfWlNURCnCoMKgwqDCoMKgwqDCoCA6PSB6
Ym9vdC1kZWNvbXByZXNzLXpzdGQubyBsaWIteHhoYXNoLm8KPiDCoENGTEFHU196Ym9vdC1kZWNv
bXByZXNzLXpzdGQubyArPSAtSSQoc3JjdHJlZSkvbGliL3pzdGQKPiAKPiAtemJvb3Qtb2JqLSQo
Q09ORklHX1JJU0NWKcKgwqDCoMKgwqAgKz0gbGliLWNsel9jdHoubyBsaWItYXNobGRpMy5vCj4g
K3pib290LW9iai0kKENPTkZJR19SSVNDVinCoMKgwqDCoMKgICs9IGxpYi1jbHpfY3R6Lm8gLi4v
Li4vLi4vLi4vYXJjaC9yaXNjdi9saWIvYXNobGRpMy5vIC4uLy4uLy4uLy4uL2FyY2gvcmlzY3Yv
bGliL2xzaHJkaTMubwo+IMKgbGliLSQoQ09ORklHX0VGSV9aQk9PVCnCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKz0gemJvb3QubyAkKHpib290LW9iai15KQo+IAo+IMKgbGliLSQoQ09O
RklHX1VOQUNDRVBURURfTUVNT1JZKSArPSB1bmFjY2VwdGVkX21lbW9yeS5vIGJpdG1hcC5vIGZp
bmQubwo+IAo+IFRoaXMgd2lsbCBsaW5rIGFnYWluc3QgdGhlIGNvcnJlY3Qgc2hpZnRpbmcgbGli
cmFyaWVzLgoKMSkgVGhpcyBzZWVtcyB3cm9uZyBmb3IgcmlzY3Y2NCB3aGljaCBjYW4gaGF2ZSBD
T05GSUdfRUZJX1pCT09UPXkgYXMKICAgd2VsbCBidXQgZG9lc24ndCBuZWVkIHRoZXNlIDY0LW9u
LTMyIHF1aXJrcy4KCjIpIElJVUMgRUZJIHN0dWIgZXhlY3V0ZXMganVzdCBvbmNlIGJlZm9yZSB0
aGUga2VybmVsIGlzIGJvb3RpbmcsIHNvIGl0CiAgIGRvZXNuJ3Qgc2VlbSB0b28gY3JpdGljYWwg
dG8gbGluayBhcmNoLXNwZWNpZmljIChvcHRpbWl6ZWQpIHRoaW5ncwogICBhZ2FpbnN0IGl0LgoK
U28gSSdtIHZvdGluZyBmb3Igc29tZXRoaW5nIGxpa2U6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9lZmkvS2NvbmZpZyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL0tjb25maWcKaW5kZXgg
MjllMDcyOTI5OWY1Li41NWZiNWEyMGFhMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdhcmUv
ZWZpL0tjb25maWcKKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvS2NvbmZpZwpAQCAtODUsNiAr
ODUsMTAgQEAgY29uZmlnIEVGSV9aQk9PVAogCSAgcHJvdmlkZWQgdGhhdCB0aGUgbG9hZGVyIGlt
cGxlbWVudHMgdGhlIGRlY29tcHJlc3Npb24gYWxnb3JpdGhtLgogCSAgKFRoZSBjb21wcmVzc2lv
biBhbGdvcml0aG0gdXNlZCBpcyBkZXNjcmliZWQgaW4gdGhlIHpib290IGhlYWRlcikKIAorY29u
ZmlnIEVGSV9aQk9PVF9FWFRSQVMKKwlib29sCisJZGVmYXVsdCB5IGlmIFJJU0NWICYmIDMyQklU
CisKIGNvbmZpZyBFRklfQVJNU1RVQl9EVEJfTE9BREVSCiAJYm9vbCAiRW5hYmxlIHRoZSBEVEIg
bG9hZGVyIgogCWRlcGVuZHMgb24gRUZJX0dFTkVSSUNfU1RVQiAmJiAhUklTQ1YgJiYgIUxPT05H
QVJDSApkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZQpi
L2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUKaW5kZXggZjgzMzAxYTE5ZGM1
Li44ZjE5OWI5OWQwZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIv
TWFrZWZpbGUKKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZQpAQCAt
OTYsNyArOTYsOCBAQCBDRkxBR1NfemJvb3QtZGVjb21wcmVzcy1nemlwLm8JKz0gLQpJJChzcmN0
cmVlKS9saWIvemxpYl9pbmZsYXRlCiB6Ym9vdC1vYmotJChDT05GSUdfS0VSTkVMX1pTVEQpCTo9
IHpib290LWRlY29tcHJlc3MtenN0ZC5vIGxpYi0KeHhoYXNoLm8KIENGTEFHU196Ym9vdC1kZWNv
bXByZXNzLXpzdGQubwkrPSAtSSQoc3JjdHJlZSkvbGliL3pzdGQKIAotemJvb3Qtb2JqLSQoQ09O
RklHX1JJU0NWKQkrPSBsaWItY2x6X2N0ei5vIGxpYi1hc2hsZGkzLm8gbGliLWxzaHJkaTMubwor
emJvb3Qtb2JqLWV4dHJhcy0kKENPTkZJR19FRklfWkJPT1RfRVhUUkFTKSArPSBsaWItYXNobGRp
My5vIGxpYi1sc2hyZGkzLm8KK3pib290LW9iai0kKENPTkZJR19SSVNDVikJKz0gbGliLWNsel9j
dHoubyAkKHpib290LW9iai1leHRyYXMteSkKIGxpYi0kKENPTkZJR19FRklfWkJPT1QpCQkrPSB6
Ym9vdC5vICQoemJvb3Qtb2JqLXkpCiAKIGxpYi0kKENPTkZJR19VTkFDQ0VQVEVEX01FTU9SWSkg
Kz0gdW5hY2NlcHRlZF9tZW1vcnkubyBiaXRtYXAubyBmaW5kLm8KCktpbmRseSBhc2sgeW91IHRv
IHRlc3QgdGhpcy4gQW5kIGl0IHdpbGwgYmUgZXZlbiBtb3JlIGhlbHBmdWwgaWYgeW91IGNhbiB0
ZXN0CmJ1aWxkaW5nIGFuIHJ1bm5pbmcgcmlzY3Y2NCBhcyB3ZWxsIDotKS4KCkRtaXRyeQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
