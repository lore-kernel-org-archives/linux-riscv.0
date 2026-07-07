Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD5C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0DgR+I7k1j6IFPprYJTKUXwYq07BiU0mDY4Pb7ks8o=; b=ZEkFP3yM3VofON
	sKUIQ54OqvHLTMb8ZKW4G0oOmWOYXpcAdMYLv8XIGEQkPTp1rGIixC6BH0tLSxEg2YcG1xFppD0YQ
	f1bDdATvCJSIhBv644hX8SNYeuK+ioPuu3zKh9G/Nsbr0wPADBXr82x1w3wUXIGPYxJ1VUH8W4XtG
	qDWPJPs1FKj9k8rhU4rayAjZCPYSnXZilGkblpW9J13F1wYoGEeDrd2XHwb/DCqYcnuZjiH3+OQSp
	e9+8RJ9WgvRDXuCPlNuXagX8YmBH226lbCPLW0+ioShUdsHCbIMgxJ4OSIFHmhN2mkN4i41zEdQaP
	oZnjCPkt9KvLitC62SRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5ok-0000000F3Bk-0S2H;
	Tue, 07 Jul 2026 13:26:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5og-0000000F3BF-0Q6h
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 13:26:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D940419F6;
	Tue,  7 Jul 2026 06:26:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E766B3F85F;
	Tue,  7 Jul 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783430785; bh=a9h/UPEhXHJcQUJXaij0kLNRiuVX+h3HSouNcW4ixWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mW7bcfoIOacfPHTmaL5YDUPi+l4RzE6GYxxKDiZPmCku89Pv4N1JbCGHW0FesrY/f
	 o3soNc3De1LjahTmzUuMp4AG2OpdD698osyi5edFdDpHomyqDhQuuJ3bViGDqjhZeZ
	 JMRThJSD45VXhFoFymjWeyNn2IT3GHd0MGckTKJM=
Message-ID: <5786468d-a4bc-41d6-ad8b-56f9fd43f5f7@arm.com>
Date: Tue, 7 Jul 2026 14:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/riscv: Drop superflous zeros in pci_device_id
 array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522145943.774344-2-u.kleine-koenig@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260522145943.774344-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_062626_234248_9353DA1B 
X-CRM114-Status: GOOD (  29.75  )
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

T24gMjIvMDUvMjAyNiAzOjU5IHBtLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHVi
KSB3cm90ZToKPiBUaGUgLmRyaXZlcl9kYXRhIG1lbWJlciBvZiB0aGUgc3RydWN0IHBjaV9kZXZp
Y2VfaWQgYXJyYXkgd2VyZQo+IGluaXRpYWxpemVkIGJ5IGEgbGlzdCBleHByZXNzaW9ucyB0byB6
ZXJvIHdpdGhvdXQgbWFraW5nIHVzZSBvZiB0aGF0Cj4gdmFsdWUuIEluIHRoaXMgY2FzZSBpdCdz
IGJldHRlciB0byBub3Qgc3BlY2lmeSBhIHZhbHVlIGF0IGFsbCBhbmQgbGV0Cj4gdGhlIGNvbXBp
bGVyIGZpbGwgaW4gdGhlIHplcm9zLiBTYW1lIGZvciB0aGUgbGlzdCB0ZXJtaW5hdG9yIHRoYXQg
Y2FuCj4gYmV0dGVyIGJlIGNvbXBsZXRlbHkgZW1wdHkuCgpJIHRoaW5rIEknZCBhZ3JlZSB0aGlz
IGNvdW50cyBhcyBhIG5pY2UgZW5vdWdoIGNsZWFudXAgaW4gaXRzIG93biByaWdodC4KClJldmll
d2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgoKPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KPiAtLS0KPiBIZWxsbywKPiAKPiB3aGlsZSBiZWluZyBhIGNsZWFudXAg
dGhhdCBjYW4gc3RhbmQgb24gaXRzIG93biB0aGlzIGlzIGFsc28gYQo+IHByZXBhcmF0aW9uIGZv
ciBtYWtpbmcgZHJpdmVyX2RhdGEgYW4gYW5vbnltb3VzIHVuaW9uIHRoYXQgcmVxdWlyZXMgdGhh
dAo+IC5kcml2ZXJfZGF0YSBpcyBpbml0aWFsaXplZCBieSBuYW1lIGFuZCBub3QgYnkgbGlzdCBv
cmRlci4gVGhlIHVuaW9uCj4gYWxsb3dzIHRvIG1ha2UgYmV0dGVyIHVzZSBvZiB0aGUgQyB0eXBl
IHN5c3RlbSBhbmQgZHJvcHMgdGhlIG5lZWQgZm9yCj4gY2FzdGluZy4gVGhlIGNoYW5nZSB0byBh
IGRyaXZlciB3aWxsIGxvb2sgYXMgZm9sbG93czoKPiAKPiAJZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3BsYXRmb3JtL2ludGVsLW1pZC9wd3IuYyBiL2FyY2gveDg2L3BsYXRmb3JtL2ludGVsLW1pZC9w
d3IuYwo+IAlpbmRleCAxNzM5OTcxNDc4ZmYuLmMwZDlkYTgxZDUxMiAxMDA2NDQKPiAJLS0tIGEv
YXJjaC94ODYvcGxhdGZvcm0vaW50ZWwtbWlkL3B3ci5jCj4gCSsrKyBiL2FyY2gveDg2L3BsYXRm
b3JtL2ludGVsLW1pZC9wd3IuYwo+IAlAQCAtMzQ3LDcgKzM0Nyw3IEBAIHN0cnVjdCBtaWRfcHdy
X2RldmljZV9pbmZvIHsKPiAJCj4gCSBzdGF0aWMgaW50IG1pZF9wd3JfcHJvYmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAJIHsKPiAJLQlz
dHJ1Y3QgbWlkX3B3cl9kZXZpY2VfaW5mbyAqaW5mbyA9ICh2b2lkICopaWQtPmRyaXZlcl9kYXRh
Owo+IAkrCXN0cnVjdCBtaWRfcHdyX2RldmljZV9pbmZvICppbmZvID0gaWQtPmRyaXZlcl9kYXRh
X3B0cjsKPiAJCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gCQlzdHJ1Y3QgbWlk
X3B3ciAqcHdyOwo+IAkJaW50IHJldDsKPiAJQEAgLTQ3MSw4ICs0NzEsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1pZF9wd3JfZGV2aWNlX2luZm8gdG5nX2luZm8gPSB7Cj4gCQo+IAkgLyogVGhp
cyB0YWJsZSBzaG91bGQgYmUgaW4gc3luYyB3aXRoIHRoZSBvbmUgaW4gZHJpdmVycy9wY2kvcGNp
LW1pZC5jICovCj4gCSBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgbWlkX3B3cl9w
Y2lfaWRzW10gPSB7Cj4gCS0JeyBQQ0lfVkRFVklDRShJTlRFTCwgUENJX0RFVklDRV9JRF9QRU5X
RUxMKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZwbndfaW5mbyB9LAo+IAktCXsg
UENJX1ZERVZJQ0UoSU5URUwsIFBDSV9ERVZJQ0VfSURfVEFOR0lFUiksIC5kcml2ZXJfZGF0YSA9
IChrZXJuZWxfdWxvbmdfdCkmdG5nX2luZm8gfSwKPiAJKwl7IFBDSV9WREVWSUNFKElOVEVMLCBQ
Q0lfREVWSUNFX0lEX1BFTldFTEwpLCAuZHJpdmVyX2RhdGFfcHRyID0gJnBud19pbmZvIH0sCj4g
CSsJeyBQQ0lfVkRFVklDRShJTlRFTCwgUENJX0RFVklDRV9JRF9UQU5HSUVSKSwgLmRyaXZlcl9k
YXRhX3B0ciA9ICZ0bmdfaW5mbyB9LAo+IAkJe30KPiAJIH07Cj4gICAKPiB3aGljaCBpcyBhIG5p
Y2UgaW1wcm92ZW1lbnQgZHJvcHBpbmcgdGhyZWUgY2FzdHMgYW5kIHRoYXQgd2lsbCBtYWtlIHRo
ZQo+IGNvbXBpbGVyIHNheToKPiAKPiBhcmNoL3g4Ni9wbGF0Zm9ybS9pbnRlbC1taWQvcHdyLmM6
IEluIGZ1bmN0aW9uIOKAmG1pZF9wd3JfcHJvYmXigJk6Cj4gYXJjaC94ODYvcGxhdGZvcm0vaW50
ZWwtbWlkL3B3ci5jOjM1MDo0NDogZXJyb3I6IGluaXRpYWxpemF0aW9uIGRpc2NhcmRzIOKAmGNv
bnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2Fy
ZGVkLXF1YWxpZmllcnNdCj4gICAgMzUwIHwgICAgICAgICBzdHJ1Y3QgbWlkX3B3cl9kZXZpY2Vf
aW5mbyAqaW5mbyA9IGlkLT5kcml2ZXJfZGF0YV9wdHI7Cj4gICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gCj4gKHNvIGl0IHByb21vdGVzIHRo
YXQgZHJpdmVyIGRhdGEgaXMgc3VwcG9zZWQgdG8gYmUgY29uc3QpLgo+IAo+IFRoZXJlIGlzIG5v
IGlvbW11IGRyaXZlciB1c2luZyBwb2ludGVycyBmb3IgZHJpdmVyIGRhdGEsIHNvIHRoZSBleGFt
cGxlCj4gaXMgZnJvbSBhIGRpZmZlcmVudCBzdWJzeXN0ZW0uIEFsc28gdGhpcyBpcyB0aGUgb25s
eSBwY2kgZHJpdmVyIGluCj4gZHJpdmVycy9pb21tdSwgc28gbm8gZnVydGhlciBwYXRjaGVzIGZv
ciB0aGlzIHBhcnQgb2YgbXkgcXVlc3QgdG8gdGhhdAo+IHN1YnN5c3RlbS4KPiAKPiBCZXN0IHJl
Z2FyZHMKPiBVd2UKPiAKPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMgfCA2ICsr
Ky0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyBiL2RyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMKPiBpbmRleCBkODJkMmIwMDkwNGMuLjhhYmY1MmRm
YjRjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCj4gKysr
IGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYwo+IEBAIC0xMDksOSArMTA5LDkgQEAg
c3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfcGNpX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQo+ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcmlzY3Zf
aW9tbXVfcGNpX3RibFtdID0gewo+IC0Je1BDSV9WREVWSUNFKFJFREhBVCwgUENJX0RFVklDRV9J
RF9SRURIQVRfUklTQ1ZfSU9NTVUpLCAwfSwKPiAtCXtQQ0lfVkRFVklDRShSSVZPUywgUENJX0RF
VklDRV9JRF9SSVZPU19SSVNDVl9JT01NVV9HQSksIDB9LAo+IC0JezAsfQo+ICsJeyBQQ0lfVkRF
VklDRShSRURIQVQsIFBDSV9ERVZJQ0VfSURfUkVESEFUX1JJU0NWX0lPTU1VKSB9LAo+ICsJeyBQ
Q0lfVkRFVklDRShSSVZPUywgUENJX0RFVklDRV9JRF9SSVZPU19SSVNDVl9JT01NVV9HQSkgfSwK
PiArCXsgfQo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHJpc2N2X2lv
bW11X3BjaV9kcml2ZXIgPSB7Cj4gCj4gYmFzZS1jb21taXQ6IDI1NGY0OTYzNGVlMTZhNzMxMTc0
ZDJhZTM0YmM1MGJkNWY0NWU3MzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
