Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D42C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXb+XyQ7djjjIFEeZfi7/ax7Gz4zcqSRqdvry99LPCA=; b=AbZOx8IFKcmyQV
	Ycqd/omxGnMUK9xEBFQJeMmVEBX/M0V8MSw1lokrQvqBfj+bHgnGZXfUjRA+C3Fm9ilamua9qUVPF
	LPWMY83ddtnZeVZTKJOWD4xMaHWhB2AUSI8efUHEHygBPFAaMml1NgHGbi+d+4mA7bB2D/BTuKz3h
	/B8pPBv/Ys6niylMmTPUZ77RUPwbQx52LCuDvxPfkKAwvYiwvyYEtavTk95GuHGWXhTPtV4hINZhA
	77Cy2NeDKNnB4KAveMbTcaLlUsDx4smAZ81pqvHnPVq2tgE93zjz7KJ9ZglkGxKcp+ukuTGa5n4Vb
	JkMm86czN5nnIf88S4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp48-0000000BZaR-2O3H;
	Thu, 10 Jul 2025 11:03:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnWS-0000000BKqE-3wNJ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05B286115E;
	Thu, 10 Jul 2025 09:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342BCC4CEE3;
	Thu, 10 Jul 2025 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139495;
	bh=/45peu3NvT7yg087IQ10UDKJ5n9K7DKeEA4oRGGZWNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beM95PWFxm2r486Twz81PQr1zgS6iAhoqDAROgBDSunXl2Jk6Xvp0H+VJRCHzyHQo
	 M/c4RCCLAP2NCCfTSNLWmshbUligbKhEOSp2/fCNFybUXute9W1QUmHtRfKgl27hCx
	 IUKVxDp4wmeG2KRc3OHddX1vmyOO7plwaMEo6GGBohhBqtRHjnOvANs4aEnki1HvwI
	 hxyZ+WzH2wI6/L3ed2aw1ufFFH1T7eta+t47f1IjNSdwxdoWaPyMFSvzDEqdFNS7ZO
	 Q4S2W7aZIz9K2WvKFfUeJBZvhP19jpJEySqYllU57zaABJMag+g19Ngw4yOyGn5+z+
	 DgLlLSkPv8F7g==
Date: Thu, 10 Jul 2025 10:24:48 +0100
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
Message-ID: <20250710092448.GA1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702213658.545163-3-elder@riscstar.com>
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

T24gV2VkLCAwMiBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gQWxsIGRldmljZXMgc3Vw
cG9ydGVkIGJ5IHNpbXBsZSBNRkQgdXNlIHRoZSBzYW1lIDgtYml0IHJlZ2lzdGVyCj4gOC1iaXQg
dmFsdWUgcmVnbWFwIGNvbmZpZ3VyYXRpb24uICBUaGVyZSBpcyBhbiBvcHRpb24gYXZhaWxhYmxl
Cj4gZm9yIGEgZGV2aWNlIHRvIHNwZWNpZnkgYSBjdXN0b20gY29uZmlndXJhdGlvbiwgYnV0IG5v
IGV4aXN0aW5nCj4gZGV2aWNlIHVzZXMgaXQuCj4gCj4gUmF0aGVyIHRoYW4gc3BlY2lmeSBhICJm
dWxsIiByZWdtYXAgY29uZmlndXJhdGlvbiB0byB1c2UgdGhpcwo+IG9wdGlvbiwgTGVlIEpvbmVz
IHN1Z2dlc3RlZCBhbGxvd2luZyBqdXN0IHRoZSBtYXhfcmVnaXN0ZXIgdmFsdWUKPiB0byBiZSBz
cGVjaWZpZWQgaW4gdGhlIHNpbXBsZV9tZmRfZGF0YSBzdHJ1Y3R1cmUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+IFN1Z2dlc3RlZC1ieTogTGVl
IEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KPiAtLS0KPiB2MjogLSBBbGxvdyBtYXhfcmVnaXN0ZXIg
KmFuZCogcmVnbWFwX2NvbmZpZyB0byBiZSBzdXBwbGllZAo+IAo+ICBkcml2ZXJzL21mZC9zaW1w
bGUtbWZkLWkyYy5jIHwgMTUgKysrKysrKysrKysrLS0tCj4gIGRyaXZlcnMvbWZkL3NpbXBsZS1t
ZmQtaTJjLmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMu
YyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMKPiBpbmRleCAyMjE1OTkxM2JlYTAzLi4z
Zjk1OWY0Zjk4MjYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMK
PiArKysgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gQEAgLTMzLDE2ICszMywyNSBA
QCBzdGF0aWMgaW50IHNpbXBsZV9tZmRfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMp
Cj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBzaW1wbGVfbWZkX2RhdGEgKnNpbXBsZV9tZmRfZGF0YTsK
PiAgCWNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY29uZmlnOwoKPiArCXN0cnVj
dCByZWdtYXBfY29uZmlnIGNvbmZpZzsKCldoeSBkbyB3ZSBuZWVkIGFub3RoZXIgcmVnbWFwX2Nv
bmZpZz8KCkNhbid0IHdlIGp1c3QgcmVtb3ZlIHRoZSBjb25zdCBhbmQgbWFrZSB1c2Ugb2YgdGhl
IG9uZSBhYm92ZT8KCj4gIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gIAlpbnQgcmV0Owo+ICAK
PiAgCXNpbXBsZV9tZmRfZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmaTJjLT5kZXYpOwo+
ICAKPiAgCS8qIElmIG5vIHJlZ21hcF9jb25maWcgaXMgc3BlY2lmaWVkLCB1c2UgdGhlIGRlZmF1
bHQgOHJlZyBhbmQgOHZhbCBiaXRzICovCj4gLQlpZiAoIXNpbXBsZV9tZmRfZGF0YSB8fCAhc2lt
cGxlX21mZF9kYXRhLT5yZWdtYXBfY29uZmlnKQo+ICsJaWYgKHNpbXBsZV9tZmRfZGF0YSkgewo+
ICsJCWlmIChzaW1wbGVfbWZkX2RhdGEtPnJlZ21hcF9jb25maWcpCj4gKwkJCWNvbmZpZyA9ICpz
aW1wbGVfbWZkX2RhdGEtPnJlZ21hcF9jb25maWc7CgoJCQlyZWdtYXBfY29uZmlnID0gc2ltcGxl
X21mZF9kYXRhLT5yZWdtYXBfY29uZmlnOwoKPiArCQllbHNlCj4gKwkJCWNvbmZpZyA9IHJlZ21h
cF9jb25maWdfOHJfOHY7CgoJCQlyZWdtYXBfY29uZmlnID0gJnJlZ21hcF9jb25maWdfOHJfOHY7
Cj4gKwo+ICsJCWlmIChzaW1wbGVfbWZkX2RhdGEtPm1heF9yZWdpc3RlcikKPiArCQkJY29uZmln
Lm1heF9yZWdpc3RlciA9IHNpbXBsZV9tZmRfZGF0YS0+bWF4X3JlZ2lzdGVyOwo+ICsJCXJlZ21h
cF9jb25maWcgPSAmY29uZmlnOwo+ICsJfSBlbHNlIHsKPiAgCQlyZWdtYXBfY29uZmlnID0gJnJl
Z21hcF9jb25maWdfOHJfOHY7CgpJIHN1c3BlY3Qgd2UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoaXMg
bGluZSB0d2ljZS4KCkVpdGhlciByZS1qaWcgdGhlIGlmICgpIGFib3ZlIChJIHN1c3BlY3QgdGhp
cyBleHBsYWlucyB0aGUgZXhpc3RpbmcKY29tcGxleGl0eSBbbXVsdGlwbGUgY29uZGl0aW9uc10p
IG9yIHByZS1zZXQgcmVnbWFwX2NvbmZpZyB0bwpyZWdtYXBfY29uZmlnXzhyXzh2IGFuZCBvbmx5
IG92ZXItd3JpdGUgaXQgaWYgdGhlIGNvbmRpdGlvbnMgYXJlIG1ldC4KCj4gLQllbHNlIC0JCXJl
Z21hcF9jb25maWcgPSBzaW1wbGVfbWZkX2RhdGEtPnJlZ21hcF9jb25maWc7Cj4gKwl9Cj4gIAo+
ICAJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoaTJjLCByZWdtYXBfY29uZmlnKTsgaWYK
PiAgCShJU19FUlIocmVnbWFwKSkgZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQt
aTJjLmgKPiAgCWIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuaCBpbmRleAo+ICAJN2NiMmJk
ZDM0N2Q5Ny4uNzA2YjZmNTMxNTVmZiAxMDA2NDQgLS0tCj4gIAlhL2RyaXZlcnMvbWZkL3NpbXBs
ZS1tZmQtaTJjLmggKysrCj4gIAliL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmggQEAgLTI3
LDYgKzI3LDcgQEAgc3RydWN0Cj4gIAlzaW1wbGVfbWZkX2RhdGEgeyBjb25zdCBzdHJ1Y3QgcmVn
bWFwX2NvbmZpZyAqcmVnbWFwX2NvbmZpZzsKPiAgCWNvbnN0IHN0cnVjdCBtZmRfY2VsbCAqbWZk
X2NlbGw7IHNpemVfdCBtZmRfY2VsbF9zaXplOyArCj4gIAl1bnNpZ25lZCBpbnQgbWF4X3JlZ2lz
dGVyOyB9Owo+ICAKPiAgI2VuZGlmIC8qIF9fTUZEX1NJTVBMRV9NRkRfSTJDX0ggKi8gLS0gMi40
NS4yCj4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
