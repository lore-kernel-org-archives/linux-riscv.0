Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF8BC0218A
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Feb 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ikm2r6y2ncSaRyHGMZoGbnTIIkOUA2eqLdCcnE+bE4Q=; b=tNK4z8fVDmo9//
	p4R3ILl4hvnHO0hPgpkangI9SmlVvR8qDzO9HxFQ1ZnR+hbhOMFr3BDze2I2AMECyxOTv4CUwlomC
	2lOOyUO6kGSWTLQ+SWlDHlippwoYktXexlZk3DGuo+kN6i+04i14DRiUCkEfmgOhTRkw+C+sDRvce
	9zxy+BK+MZMZRZ007884mRHuqxyelrRjmlya5MHh7AhXh0SZHlB4jJu876/A1U4CR51vbtMMdcLK0
	5zqfIgp4FYIjLICmD3oF1Yhq5qiO6aPOE07sKIZCmwZ7N4akKhkRkAaUsIcXKUW+qAYSjr+N9MkG3
	LGG/EfWofEAByrKkYvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teCS4-0000000CH6i-1T97;
	Sat, 01 Feb 2025 12:18:20 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teCRX-0000000CH0J-3SPI
	for linux-riscv@lists.infradead.org;
	Sat, 01 Feb 2025 12:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1738412267;
	bh=npjSYdUKFiKHmWY759vCSQMQIYrqZTGlxSbAFphl1wg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bl8o5gQsu8x5IKikXPPi4TkdetWVXLrORGhW5/UTGnGvp/MXJJ8cUhAfq9NFVp/Wa
	 ofmPLiW1ERi+o9b+k9uDmjmAF5pt4gpMpWaoujwPIw8HJRk6LQUgGDBAY83UDsdHzi
	 D9zv5cEunvWkuaXLbMFTjyjzBjiCcu26EKvpQbfA=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B41FB67342;
	Sat,  1 Feb 2025 07:17:46 -0500 (EST)
Message-ID: <6c129a4e822e8504a48daa0db7b385a813f96c69.camel@xry111.site>
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
From: Xi Ruoyao <xry111@xry111.site>
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 01 Feb 2025 20:17:45 +0800
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
References: <mvmed0k4prh.fsf@suse.de>
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_041747_872230_8CC97F65 
X-CRM114-Status: GOOD (  14.36  )
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

T24gVGh1LCAyMDI1LTAxLTMwIGF0IDEwOjI1ICswMTAwLCBBbmRyZWFzIFNjaHdhYiB3cm90ZToK
PiBTaWduIGV4dGVuZCBhbHNvIGFuIHVuc2lnbmVkIGNvbXBhcmUgdmFsdWUgdG8gbWF0Y2ggd2hh
dCBsci53IGlzIGRvaW5nLgo+IE90aGVyd2lzZSB0cnlfY21weGNoZyBtYXkgc3B1cmlvdXNseSBy
ZXR1cm4gdHJ1ZSB3aGVuIHVzZWQgb24gYSB1MzIgdmFsdWUKPiB0aGF0IGhhcyB0aGUgc2lnbiBi
aXQgc2V0LCBhcyBpdCBoYXBwZW5zIG9mdGVuIGluIGlub2RlX3NldF9jdGltZV9jdXJyZW50Lgo+
IAo+IERvIHRoaXMgaW4gdGhyZWUgY29udmVyc2lvbiBzdGVwcy7CoCBUaGUgZmlyc3QgY29udmVy
c2lvbiB0byBsb25nIGlzIG5lZWRlZAo+IHRvIGF2b2lkIGEgLVdwb2ludGVyLXRvLWludC1jYXN0
IHdhcm5pbmcgd2hlbiBhcmNoX2NtcHhjaGcgaXMgdXNlZCB3aXRoIGEKPiBwb2ludGVyIHR5cGUu
wqAgVGhlbiBjb252ZXJ0IHRvIGludCBhbmQgYmFjayB0byBsb25nIHRvIGFsd2F5cyBzaWduIGV4
dGVuZAo+IHRoZSAzMi1iaXQgdmFsdWUgdG8gNjQtYml0Lgo+IAo+IEZpeGVzOiA2YzU4ZjI1ZTY5
MzggKCJyaXNjdi9hdG9taWM6IEZpeCBzaWduIGV4dGVuc2lvbiBmb3IgUlY2NEkiKQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4KCkl0IGZpeGVzIHRoZSBn
bnVsaWIgdGVzdC1zdGF0LXRpbWUgZmFpbHVyZSBmb3IgbWUuCgpUZXN0ZWQtYnk6IFhpIFJ1b3lh
byA8eHJ5MTExQHhyeTExMS5zaXRlPgoKPiAtLS0KPiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNo
Zy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiBpbmRleCA0Y2FkYzU2MjIw
ZmUuLjQyN2M0MWRkZTY0MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nt
cHhjaGcuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oCj4gQEAgLTIz
MSw3ICsyMzEsNyBAQAo+IMKgCQlfX2FyY2hfY21weGNoZygiLnciLCAiLnciIHNjX3NmeCwgIi53
IiBjYXNfc2Z4LAkJXAo+IMKgCQkJwqDCoMKgwqDCoMKgIHNjX3ByZXBlbmQsIHNjX2FwcGVuZCwJ
CQlcCj4gwqAJCQnCoMKgwqDCoMKgwqAgY2FzX3ByZXBlbmQsIGNhc19hcHBlbmQsCQkJXAo+IC0J
CQnCoMKgwqDCoMKgwqAgX19yZXQsIF9fcHRyLCAobG9uZyksIF9fb2xkLCBfX25ldyk7CVwKPiAr
CQkJwqDCoMKgwqDCoMKgIF9fcmV0LCBfX3B0ciwgKGxvbmcpKGludCkobG9uZyksIF9fb2xkLCBf
X25ldyk7CVwKPiDCoAkJYnJlYWs7CQkJCQkJCVwKPiDCoAljYXNlIDg6CQkJCQkJCQlcCj4gwqAJ
CV9fYXJjaF9jbXB4Y2hnKCIuZCIsICIuZCIgc2Nfc2Z4LCAiLmQiIGNhc19zZngsCQlcCj4gLS0g
Cj4gMi40OC4xCgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBB
ZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
