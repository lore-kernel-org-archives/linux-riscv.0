Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D2ECD4F2B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygBkI7Hlyb8URsqTjPAcNIrULnizS/muiUGP853C2lw=; b=WbSymJkfsm5K/M
	vgTTHzvoRSeSjkP7wGvwo9JSNBUMVXqYnzZaB7bkXPhKhnFuqxTHGk8/RfxmtEnwvtCt0SHjZX+fz
	Wsuzig8SpsE0Y24QW9ko8LYe2RIOMtjgZKkdvQHAtUonnbK2PCq97SeI0+YNf3HPW8TKm10EDGw5l
	GrCSci5Oy7fLVYgBcTDo3pFwer25NXFnsC8fcy0/4SIBSEULwLeVj2guvRK2LFQxi68mr1mUpyXfJ
	UtO0wLjCDJndShMkfMwDzBxc5H8YOc1TgZ0w3GU3/fRs+8UZ5Yw4ZmtCuIHcPmca5FRaHC99kYbhb
	AmSKORyqxry2fTNgnNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwlu-00000005zz4-0jJS;
	Wed, 04 Sep 2024 20:38:34 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwlp-00000005zxx-3H0h
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 20:38:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D16A1BF203;
	Wed,  4 Sep 2024 20:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725482304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIswLtOfZtf2hkYmMprySdT0sIt7a6+fv7isRSExRY8=;
	b=hDyX45kuNseqYmR1xNb2I+QSwtW32sZzTAu0n79JH5zh02JZAigAOLaZ6wAMwC45sdsXEF
	l2z6nfx3DR08UlCNKXOo8yAViMitC0yih7g0juMcxUVT2h0QuSxznqa1PL5NpDOqgeZl0a
	i+PnbUUINAUJ/LBLMyJ5Z58fIhm1pPqQjBZo6Q9Vn914dTZVAdpdzwF2hOrvQS+zA0k9fD
	Nq+ESIaGYc8rr+6wW/h1AjD8NjzWLPlhxEbFgBzmORdpLgNR/l8vaQ9kjtIdwkNyo6Mibn
	Tb+MFIntj8BKRvubKT+31bHe193VEBveBrBON6ZPh7GDBlon9bcmlMRpw3k7mw==
Message-ID: <b0849f3a-ddd3-4e6a-9f1f-1c5c9ab3e613@bootlin.com>
Date: Wed, 4 Sep 2024 22:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 CV1800B SARADC
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
 <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
 <ZtYh6xUcP8zo3xMj@surfacebook.localdomain>
 <20240903200526.0734945b@jic23-huawei>
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20240903200526.0734945b@jic23-huawei>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_133830_450806_6FFE503B 
X-CRM114-Status: GOOD (  12.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sIHRoYW5rIHlvdSBmb3IgdGhlc2UgZml4ZXMsIEkganVzdCB3YW50ZWQgdG8gYWRkIHNv
bWV0aGluZyBiZWxvdy4KCkxlIDAzLzA5LzIwMjQgw6AgOTowNSBQTSwgSm9uYXRoYW4gQ2FtZXJv
biBhIMOpY3JpdMKgOgo+IE9uIE1vbiwgMiBTZXAgMjAyNCAyMzozNjo1OSArMDMwMAo+IEFuZHkg
U2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IFRodSwg
QXVnIDI5LCAyMDI0IGF0IDAyOjMxOjUxUE0gKzAyMDAsIFRob21hcyBCb25uZWZpbGxlIGtpcmpv
aXR0aToKPj4+IFRoaXMgYWRkcyBhIGRyaXZlciBmb3IgdGhlIFNvcGhnbyBDVjE4MDBCIFNBUkFE
Qy4KCi4uLgoKPj4+ICsJCWluaXRfY29tcGxldGlvbigmc2FyYWRjLT5jb21wbGV0aW9uKTsKPj4+
ICsJCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgc2FyYWRjLT5pcnEsCj4+PiAr
CQkJCSAgICAgICBjdjE4MDBiX2FkY19pbnRlcnJ1cHRfaGFuZGxlciwgMCwKPj4+ICsJCQkJICAg
ICAgIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBzYXJhZGMpOwo+Pj4gKwkJaWYgKHJldCkKPj4+ICsJ
CQlyZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gKwkJd3JpdGVsKDEsIHNhcmFkYy0+cmVncyArIENWMTgw
MEJfQURDX0lOVFJfRU5fUkVHKTsKPj4KPj4gQklUKDApCj4gCj4gTWF5YmUgb24gdGhhdCAtIHdv
dWxkIG5lZWQgdG8gY29tcGFyZSB3aXRoIGRhdGFzaGVldCB0byBrbm93IGhvdyBpdCdzCj4gZGVz
Y3JpYmVkLiBJbiB0aGVvcnkgdGhhdCBtaWdodCBub3QgYmUgYSBtYXNrLgoKSW5kZWVkLCBpbiB0
aGlzIGNhc2UgIkNWMTgwMEJfQURDX0lOVFJfRU5fUkVHIiBpcyB0aGUgcmVnaXN0ZXIgdGhhdCAK
ZW5hYmxlcyB0aGUgaW50ZXJydXB0cy4KU28gaGVyZSB3aGF0IEkgZGlzIGlzIHRvIHNldCB0aGlz
IHJlZ2lzdGVyIHRvIDEgKE9OKS4KCj4gCj4+Cj4+PiArCX0KPj4+ICsKPj4+ICsJcmV0ID0gZGV2
bV9tdXRleF9pbml0KCZwZGV2LT5kZXYsICZzYXJhZGMtPmxvY2spOwo+Pj4gKwlpZiAocmV0KQo+
Pj4gKwkJcmV0dXJuIHJldDsKPj4KPj4gKyBibGFuayBsaW5lPwo+IFRoYXQgb25lIEknZCBkb25l
IGFscmVhZHkuCj4gQW55aG93IHR3ZWFrZWQgYW5kIHB1c2hlZCBvdXQgYWdhaW4uCj4gCj4gCj4g
Sm9uYXRoYW4KPiAKPj4KPj4+ICsJd3JpdGVsKEZJRUxEX1BSRVAoQ1YxODAwQl9NQVNLX1NUQVJU
VVBfQ1lDTEUsIDE1KSB8Cj4+PiArCSAgICAgICBGSUVMRF9QUkVQKENWMTgwMEJfTUFTS19TQU1Q
TEVfV0lORE9XLCAxNSkgfAo+Pj4gKwkgICAgICAgRklFTERfUFJFUChDVjE4MDBCX01BU0tfQ0xL
RElWLCAxKSB8Cj4+PiArCSAgICAgICBGSUVMRF9QUkVQKENWMTgwMEJfTUFTS19DT01QQVJFX0NZ
Q0xFLCAxNSksCj4+PiArCSAgICAgICBzYXJhZGMtPnJlZ3MgKyBDVjE4MDBCX0FEQ19DWUNfU0VU
X1JFRyk7Cj4+PiArCj4+PiArCXJldHVybiBkZXZtX2lpb19kZXZpY2VfcmVnaXN0ZXIoJnBkZXYt
PmRldiwgaW5kaW9fZGV2KTsKPj4+ICt9Cj4+Cj4gClRob21hcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
