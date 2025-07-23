Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D3AC87FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CsZCymFqWzE8NRwwZpqsWYFLVz+q9XqteXmhrW3aVY=; b=yVaxo9l5omtqdb
	FxxPCt0C/O55WGbnqMSEYbKQs/RX64bb4pfNKYsgBdBHoTiuNgtS3kLIZeMshCRcTGIbKBQd6Yhm5
	iOAdaJejOCYK5Dzo2EEaRblmEisST3Y+brJXl38HOvqT68aRYS9RBYJVG7FY7hbJ5zb0uZEQ2znCS
	65VZhNfvz1sY/BPaKJ7O3b3y0TTy19V9dIjYVcn1KFLJldO+RLJ+8dYiItVicPlMZVMtoPCc7+Xj0
	/rhRVAuAbihQiRIqRQ/UD/q8Xm1p+DSR/tXq72zdeK7N8mAE/Ev+N0cqesQHKtmN/x9yy4NnelmNT
	Kv7VKrt+yaoMSD2bZKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWSh-00000004dtR-2qf6;
	Wed, 23 Jul 2025 10:12:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW8L-00000004ZRv-0xNH
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 09:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A751F601D7;
	Wed, 23 Jul 2025 09:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9761CC4CEE7;
	Wed, 23 Jul 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753264292;
	bh=wXjG20KF++mohZAH82whMjcdBO3WgxTkFDej6WjYGKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg5aYMkVGz1FmNjRpleo21K2HbOH++CwJlJB5kEXO6Cy00OTib+Kmm14pG6kH65ip
	 ytlCj34yf2c1WsgTr7JBftxDXfACRw5BsZ0kRr1cxVECFA2qPqZahYsfoYk/Zu89S6
	 0C5eeDdwg9L2Y5d+OfqT1yHOKlfHuTvSONFoVo5YMf1ADoeHDI2e0/UHjJabLAo+4T
	 lYWJ1Tw85Ep6j5uHVwu22vaMFYHKIwemckIrB6VeLfBn5qoNYk7hWmWd0uA0MTPYKo
	 0r9W2dUMrQQOflJdvmXEUKxwFDXlLUMAbx0lBNrDG3UsctiLjCTJ8OATi4iDlZ5/Og
	 qvPImRcHSSg0A==
Date: Wed, 23 Jul 2025 10:51:25 +0100
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
Subject: Re: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250723095125.GR11056@google.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710175107.1280221-3-elder@riscstar.com>
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

T24gVGh1LCAxMCBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gQWxsIGRldmljZXMgc3Vw
cG9ydGVkIGJ5IHNpbXBsZSBNRkQgdXNlIHRoZSBzYW1lIDgtYml0IHJlZ2lzdGVyIDgtYml0Cj4g
dmFsdWUgcmVnbWFwIGNvbmZpZ3VyYXRpb24uICBUaGVyZSBpcyBhbiBvcHRpb24gYXZhaWxhYmxl
IGZvciBhIGRldmljZQo+IHRvIHNwZWNpZnkgYSBjdXN0b20gY29uZmlndXJhdGlvbiwgYnV0IG5v
IGV4aXN0aW5nIGRldmljZSB1c2VzIGl0Lgo+IAo+IFJhdGhlciB0aGFuIHNwZWNpZnkgYSAiZnVs
bCIgcmVnbWFwIGNvbmZpZ3VyYXRpb24gdG8gY2hhbmdlIG9ubHkKPiB0aGUgbWF4X3JlZ2lzdGVy
IHZhbHVlLCBMZWUgSm9uZXMgc3VnZ2VzdGVkIGFsbG93aW5nIG1heF9yZWdpc3Rlcgo+IHRvIGJl
IHNwZWNpZmllZCBpbiB0aGUgc2ltcGxlX21mZF9kYXRhIHN0cnVjdHVyZS4gIElmIHJlZ21hcF9j
b25maWcKPiBhbmQgbWF4X3JlZ2lzdGVyIGFyZSBib3RoIHN1cHBsaWVkLCB0aGUgbWF4X3JlZ2lz
dGVyIGZpZWxkIGlzIGlnbm9yZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBFbGRlciA8ZWxk
ZXJAcmlzY3N0YXIuY29tPgo+IFN1Z2dlc3RlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9y
Zz4KPiAtLS0KPiB2ODogLSBVc2UgcmVnbWFwX2NvbmZpZ184cl84diwgbW9kaWZ5aW5nIGl0IGlm
IG1heF9yZWdpc3RlciBzdXBwbGllZAo+IAo+ICBkcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5j
IHwgOCArKysrKystLQo+ICBkcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5oIHwgMyArKy0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMgYi9kcml2ZXJzL21mZC9zaW1w
bGUtbWZkLWkyYy5jCj4gaW5kZXggMjIxNTk5MTNiZWEwMy4uNTEzOGFhNzIxNDBiNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gKysrIGIvZHJpdmVycy9tZmQv
c2ltcGxlLW1mZC1pMmMuYwo+IEBAIC0yNCwxNSArMjQsMTYgQEAKPiAgCj4gICNpbmNsdWRlICJz
aW1wbGUtbWZkLWkyYy5oIgo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmln
IHJlZ21hcF9jb25maWdfOHJfOHYgPSB7Cj4gK3N0YXRpYyBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBy
ZWdtYXBfY29uZmlnXzhyXzh2ID0gewo+ICAJLnJlZ19iaXRzID0gOCwKPiAgCS52YWxfYml0cyA9
IDgsCj4gKwkvKiAubWF4X3JlZ2lzdGVyIGNhbiBiZSBzcGVjaWZpZWQgaW4gc2ltcGxlX21mZF9k
YXRhICovCgpEcm9wIHRoaXMgY29tbWVudCBwbGVhc2UuCgo+ICB9Owo+ICAKPiAgc3RhdGljIGlu
dCBzaW1wbGVfbWZkX2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKQo+ICB7Cj4gIAlj
b25zdCBzdHJ1Y3Qgc2ltcGxlX21mZF9kYXRhICpzaW1wbGVfbWZkX2RhdGE7Cj4gLQljb25zdCBz
dHJ1Y3QgcmVnbWFwX2NvbmZpZyAqcmVnbWFwX2NvbmZpZzsKPiArCXN0cnVjdCByZWdtYXBfY29u
ZmlnICpyZWdtYXBfY29uZmlnOwo+ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICAJaW50IHJl
dDsKPiAgCj4gQEAgLTQzLDggKzQ0LDExIEBAIHN0YXRpYyBpbnQgc2ltcGxlX21mZF9pMmNfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykKPiAgCQlyZWdtYXBfY29uZmlnID0gJnJlZ21hcF9j
b25maWdfOHJfOHY7Cj4gIAllbHNlCj4gIAkJcmVnbWFwX2NvbmZpZyA9IHNpbXBsZV9tZmRfZGF0
YS0+cmVnbWFwX2NvbmZpZzsKPiArCWlmIChzaW1wbGVfbWZkX2RhdGEgJiYgIXNpbXBsZV9tZmRf
ZGF0YS0+cmVnbWFwX2NvbmZpZykKPiArCQlyZWdtYXBfY29uZmlnLT5tYXhfcmVnaXN0ZXIgPSBz
aW1wbGVfbWZkX2RhdGEtPm1heF9yZWdpc3RlcjsKCklmIG1heF9yZWdpc3RlciBpcyBzZXQgaW4g
c2ltcGxlX21mZF9kYXRhLCBpdCBzaG91bGQgdGFrZSBwcmVjZWRlbmNlLgoKaWYgKHNpbXBsZV9t
ZmRfZGF0YSAmJiBzaW1wbGVfbWZkX2RhdGEtPm1heF9yZWdpc3RlcikKCXJlZ21hcF9jb25maWct
Pm1heF9yZWdpc3RlciA9IHNpbXBsZV9tZmRfZGF0YS0+bWF4X3JlZ2lzdGVyOwoKPiAgCXJlZ21h
cCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGkyYywgcmVnbWFwX2NvbmZpZyk7Cj4gKwlyZWdtYXBf
Y29uZmlnLT5tYXhfcmVnaXN0ZXIgPSAwOwoKRG9lcyBtYXhfcmVnaXN0ZXIgZGVmaW5pdGVseSBo
YXZlIHBlcnNpc3RlbmNlIG92ZXIgc3Vic2VxdWVudCBjYWxscz8KCj4gIAlpZiAoSVNfRVJSKHJl
Z21hcCkpCj4gIAkJcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmggYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5o
Cj4gaW5kZXggN2NiMmJkZDM0N2Q5Ny4uZWEyYTk2YWY4YmNlNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5oCj4gKysrIGIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1p
MmMuaAo+IEBAIC0yNCw3ICsyNCw4IEBACj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiAg
Cj4gIHN0cnVjdCBzaW1wbGVfbWZkX2RhdGEgewo+IC0JY29uc3Qgc3RydWN0IHJlZ21hcF9jb25m
aWcgKnJlZ21hcF9jb25maWc7Cj4gKwlzdHJ1Y3QgcmVnbWFwX2NvbmZpZyAqcmVnbWFwX2NvbmZp
ZzsKPiArCXVuc2lnbmVkIGludCBtYXhfcmVnaXN0ZXI7CS8qIElnbm9yZWQgaWYgcmVnbWFwX2Nv
bmZpZyBzdXBwbGllZCAqLwo+ICAJY29uc3Qgc3RydWN0IG1mZF9jZWxsICptZmRfY2VsbDsKPiAg
CXNpemVfdCBtZmRfY2VsbF9zaXplOwo+ICB9Owo+IC0tIAo+IDIuNDUuMgo+IAoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
