Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978FDC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/9sX/KZjo/9THfqrUj//Q5881lbxiPakxhIjUJWJ7w=; b=NZX4exF7uy8XAD
	nO4e9xYeAtEOYKaCNOVik1i1sLh13IjJY8+g8dwyPJAPUbXV3MVdaZY6zH1bAjCcoB0DY7I7p/XV9
	1kb6aUcr8aZsYqKvPb8ygENEHum0VoHDqklz0JRY0IZsGQrgFR41ljmr063TLgrqOVtLJ94zaCRvL
	27VTGvomHji7R0Ruo44TFkwDPz4iDlVmL34oAecfAQlVuJhdxt3RVpqrAkiAN2Ojn3Qt7FvPESErR
	BmvggDL7T1RxFjrQ7+90v3hV5szQSgZBzb+cUEdn8FTmEDGAqE9OvnzIdWgFoWyu8JJB3EkSHEa3E
	VPK8HN01crJ+EifmmHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpGB-0000000Bbib-1exb;
	Thu, 10 Jul 2025 11:16:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZncP-0000000BLx4-05L6
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E64E25C6622;
	Thu, 10 Jul 2025 09:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2501AC4CEE3;
	Thu, 10 Jul 2025 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139863;
	bh=1OLkTH0gr4EINtmVQDgFQSV7pdSOH8fbDNoEe6kjG44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgnrWZZhKrXP7/aOzpkQbf0KXBDvyyOqr7EZONh4albsSi23wrnb+ar9iNJmfdVn7
	 I8kgJKoFVGBt3X4a3S6qb+hAGpqScuzFkOMfVMc6m73ej1+ih5CJoQsTwd9+ni26YI
	 syd9SjVgYkOWlgMMMD53IB5Ndcrn8P+AODBrLC8wfT6EI1TFtUolaEuYaDmbUcXbv2
	 1WGUsM9wvHlgZG0gP68OT6ILVz5ypKzT9E4aQhhBWp0hLwPYCGIqNiP975IaMkMNTt
	 HFl0cnBMKLH6B84s0D0HmkoUBKXlOY33w/0vqOVSfbnrPi5VqtgR11vwsNVjd3m8Pm
	 x/ruH+RDvZ32w==
Date: Thu, 10 Jul 2025 10:30:57 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250710093057.GB1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
 <20250710092448.GA1431498@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710092448.GA1431498@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_023105_133530_7609B171 
X-CRM114-Status: GOOD (  27.38  )
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

T24gVGh1LCAxMCBKdWwgMjAyNSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBXZWQsIDAyIEp1bCAy
MDI1LCBBbGV4IEVsZGVyIHdyb3RlOgo+IAo+ID4gQWxsIGRldmljZXMgc3VwcG9ydGVkIGJ5IHNp
bXBsZSBNRkQgdXNlIHRoZSBzYW1lIDgtYml0IHJlZ2lzdGVyCj4gPiA4LWJpdCB2YWx1ZSByZWdt
YXAgY29uZmlndXJhdGlvbi4gIFRoZXJlIGlzIGFuIG9wdGlvbiBhdmFpbGFibGUKPiA+IGZvciBh
IGRldmljZSB0byBzcGVjaWZ5IGEgY3VzdG9tIGNvbmZpZ3VyYXRpb24sIGJ1dCBubyBleGlzdGlu
Zwo+ID4gZGV2aWNlIHVzZXMgaXQuCj4gPiAKPiA+IFJhdGhlciB0aGFuIHNwZWNpZnkgYSAiZnVs
bCIgcmVnbWFwIGNvbmZpZ3VyYXRpb24gdG8gdXNlIHRoaXMKPiA+IG9wdGlvbiwgTGVlIEpvbmVz
IHN1Z2dlc3RlZCBhbGxvd2luZyBqdXN0IHRoZSBtYXhfcmVnaXN0ZXIgdmFsdWUKPiA+IHRvIGJl
IHNwZWNpZmllZCBpbiB0aGUgc2ltcGxlX21mZF9kYXRhIHN0cnVjdHVyZS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+ID4gU3VnZ2VzdGVk
LWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiB2MjogLSBBbGxvdyBt
YXhfcmVnaXN0ZXIgKmFuZCogcmVnbWFwX2NvbmZpZyB0byBiZSBzdXBwbGllZAo+ID4gCj4gPiAg
ZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYyB8IDE1ICsrKysrKysrKysrKy0tLQo+ID4gIGRy
aXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmggfCAgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMK
PiA+IGluZGV4IDIyMTU5OTEzYmVhMDMuLjNmOTU5ZjRmOTgyNjEgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gPiArKysgYi9kcml2ZXJzL21mZC9zaW1wbGUt
bWZkLWkyYy5jCj4gPiBAQCAtMzMsMTYgKzMzLDI1IEBAIHN0YXRpYyBpbnQgc2ltcGxlX21mZF9p
MmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykKPiA+ICB7Cj4gPiAgCWNvbnN0IHN0cnVj
dCBzaW1wbGVfbWZkX2RhdGEgKnNpbXBsZV9tZmRfZGF0YTsKPiA+ICAJY29uc3Qgc3RydWN0IHJl
Z21hcF9jb25maWcgKnJlZ21hcF9jb25maWc7Cj4gCj4gPiArCXN0cnVjdCByZWdtYXBfY29uZmln
IGNvbmZpZzsKPiAKPiBXaHkgZG8gd2UgbmVlZCBhbm90aGVyIHJlZ21hcF9jb25maWc/Cj4gCj4g
Q2FuJ3Qgd2UganVzdCByZW1vdmUgdGhlIGNvbnN0IGFuZCBtYWtlIHVzZSBvZiB0aGUgb25lIGFi
b3ZlPwo+IAo+ID4gIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gPiAgCWludCByZXQ7Cj4gPiAg
Cj4gPiAgCXNpbXBsZV9tZmRfZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmaTJjLT5kZXYp
Owo+ID4gIAo+ID4gIAkvKiBJZiBubyByZWdtYXBfY29uZmlnIGlzIHNwZWNpZmllZCwgdXNlIHRo
ZSBkZWZhdWx0IDhyZWcgYW5kIDh2YWwgYml0cyAqLwo+ID4gLQlpZiAoIXNpbXBsZV9tZmRfZGF0
YSB8fCAhc2ltcGxlX21mZF9kYXRhLT5yZWdtYXBfY29uZmlnKQo+ID4gKwlpZiAoc2ltcGxlX21m
ZF9kYXRhKSB7Cj4gPiArCQlpZiAoc2ltcGxlX21mZF9kYXRhLT5yZWdtYXBfY29uZmlnKQo+ID4g
KwkJCWNvbmZpZyA9ICpzaW1wbGVfbWZkX2RhdGEtPnJlZ21hcF9jb25maWc7Cj4gCj4gCQkJcmVn
bWFwX2NvbmZpZyA9IHNpbXBsZV9tZmRfZGF0YS0+cmVnbWFwX2NvbmZpZzsKPiAKPiA+ICsJCWVs
c2UKPiA+ICsJCQljb25maWcgPSByZWdtYXBfY29uZmlnXzhyXzh2Owo+IAo+IAkJCXJlZ21hcF9j
b25maWcgPSAmcmVnbWFwX2NvbmZpZ184cl84djsKPiA+ICsKPiA+ICsJCWlmIChzaW1wbGVfbWZk
X2RhdGEtPm1heF9yZWdpc3RlcikKPiA+ICsJCQljb25maWcubWF4X3JlZ2lzdGVyID0gc2ltcGxl
X21mZF9kYXRhLT5tYXhfcmVnaXN0ZXI7Cj4gPiArCQlyZWdtYXBfY29uZmlnID0gJmNvbmZpZzsK
PiA+ICsJfSBlbHNlIHsKPiA+ICAJCXJlZ21hcF9jb25maWcgPSAmcmVnbWFwX2NvbmZpZ184cl84
djsKPiAKPiBJIHN1c3BlY3Qgd2UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoaXMgbGluZSB0d2ljZS4K
PiAKPiBFaXRoZXIgcmUtamlnIHRoZSBpZiAoKSBhYm92ZSAoSSBzdXNwZWN0IHRoaXMgZXhwbGFp
bnMgdGhlIGV4aXN0aW5nCj4gY29tcGxleGl0eSBbbXVsdGlwbGUgY29uZGl0aW9uc10pIG9yIHBy
ZS1zZXQgcmVnbWFwX2NvbmZpZyB0bwo+IHJlZ21hcF9jb25maWdfOHJfOHYgYW5kIG9ubHkgb3Zl
ci13cml0ZSBpdCBpZiB0aGUgY29uZGl0aW9ucyBhcmUgbWV0LgoKTm90IHN1cmUgd2h5IHRoaXMg
d2hvbGUgdGhpbmcgaGFkIHRvIGJlIHJld29ya2VkLgoKV2h5IGRpZG4ndCB0aGUgMi1saW5lciBJ
IGdhdmUgeW91IHdvcmsgZm9yIHlvdT8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
