Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C89CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xew9mvUR8myT/nts+uqa5CJDoVD4lgkaLlQfbb7iWOw=; b=o/FpvabzLivfYb
	qNdiPOELXyTW5avMFrMZmieR/AsmSnn/1y7vgiHHBujBavBzjjFUn+IWA9yF9acDw1KNemisTNRTA
	qZy8qe8a/wKWm/w8LCBP4erZoi4ndVxpC6GBSZlpONg9ZfE07O6LIWXgKYO9XsAagfwS9RwByxZON
	6iWiTIL7eh0KlL4be2USJUfjza/rlDSOlx9dq53/alHyNZWz+J2/8hZeRp+DScSqgfZY0dHcTsHhP
	g/fpzOUgeCApYlFlFZUrNe3kv0LZ9/wNL3sLWHLrKUVi2wnZ4WmKz6wJY4gMCa/tUY6k65FvLDpmP
	7PtiYDwkD+3J2abZkGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkikN-00Dxje-1h;
	Mon, 25 Sep 2023 10:23:23 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkikL-00Dxij-0E
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 10:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1695637396;
	bh=zNEHMjTGryYRc6k3/UydU+1ksmTv+08v4jyV1rUpTZw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Cq7O5cQ1W5BjxBPgVTIeSExTIcnTkss2LgFbDKyL1+OfokdjiQUKwYj/rCeVBYYe6
	 OWy/PSeRL8JvoqDTBGlrACxgx8BU3W/8yqcQ3T7L7dU01Y6WaBXoLxw6eyp4Tj9ERH
	 vOhPBooPo2/mzjHgHwcQgh8nVjnlSSor0GLts8KQ=
Received: from [127.0.0.1] (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 16B32659AC;
	Mon, 25 Sep 2023 06:23:11 -0400 (EDT)
Message-ID: <aeb2cc43ea4e5281195c8bccd1f033ed73e6a7ef.camel@xry111.site>
Subject: Re: [PATCH 2/6] mmc: sdhci: add __sdhci_execute_tuning() to header
From: Xi Ruoyao <xry111@xry111.site>
To: Adrian Hunter <adrian.hunter@intel.com>, Drew Fustini
 <dfustini@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor@kernel.org>
Date: Mon, 25 Sep 2023 18:23:10 +0800
In-Reply-To: <4ef60ffd-3661-4bca-91a3-b49d6189c71b@intel.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <20230921-th1520-mmc-v1-2-49f76c274fb3@baylibre.com>
	 <4ef60ffd-3661-4bca-91a3-b49d6189c71b@intel.com>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_032321_131443_7C1F5630 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDEzOjIxICswMzAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+
IE9uIDIyLzA5LzIzIDA0OjQ5LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gPiBFeHBvc2UgX19zZGhj
aV9leGVjdXRlX3R1bmluZygpIHNvIHRoYXQgaXQgY2FuIGJlIGNhbGxlZCBmcm9tIHRoZQo+ID4g
bW1jIGhvc3QgY29udHJvbGxlciBkcml2ZXJzLgo+ID4gCj4gPiBJbiB0aGUgc2RoY2ktb2YtZHdj
bXNoYyBkcml2ZXIsIHNkaGNpX2R3Y21zaGNfdGgxNTIwX29wcyBzZXRzCj4gPiBwbGF0Zm9ybV9l
eGVjdXRlX3R1bmluZyB0byB0aDE1MjBfZXhlY3V0ZV90dW5pbmcoKS4gVGhhdCBmdW5jdGlvbiBo
YXMKPiA+IHRvIG1hbmlwdWxhdGUgcGh5IHJlZ2lzdGVycyBiZWZvcmUgdHVuaW5nIGNhbiBiZSBw
ZXJmb3JtZWQuIFRvIGF2b2lkCj4gPiBjb3B5aW5nIHRoZSBjb2RlIHZlcmJhdGltIGZyb20gX19z
ZGhjaV9leGVjdXRlX3R1bmluZygpIGludG8KPiA+IHRoMTUyMF9leGVjdXRlX3R1bmluZygpLCBt
YWtlIGl0IHBvc3NpYmxlIGZvciBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5nKCkKPiA+IHRvIGJlIGNh
bGxlZCBmcm9tIHNkaGNpLW9mLWR3Y21zaGMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcg
RnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvbW1j
L2hvc3Qvc2RoY2kuYyB8IDIgKy0KPiA+IMKgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS5oIHwgMSAr
Cj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLmMgYi9kcml2ZXJzL21t
Yy9ob3N0L3NkaGNpLmMKPiA+IGluZGV4IGZmNDFhYTU2NTY0ZS4uZmQ2MDcwNThkMTc2IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS5jCj4gPiArKysgYi9kcml2ZXJzL21t
Yy9ob3N0L3NkaGNpLmMKPiA+IEBAIC0yODQxLDcgKzI4NDEsNyBAQCB2b2lkIHNkaGNpX3NlbmRf
dHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgb3Bjb2RlKQo+ID4gwqB9Cj4gPiDC
oEVYUE9SVF9TWU1CT0xfR1BMKHNkaGNpX3NlbmRfdHVuaW5nKTsKPiA+IMKgCj4gPiAtc3RhdGlj
IGludCBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIg
b3Bjb2RlKQo+ID4gK2ludCBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5nKHN0cnVjdCBzZGhjaV9ob3N0
ICpob3N0LCB1MzIgb3Bjb2RlKQo+IAo+IEFsc28gbmVlZAo+IAlFWFBPUlRfU1lNQk9MX0dQTChf
X3NkaGNpX2V4ZWN1dGVfdHVuaW5nKTsKPiAKPiA+IMKgewo+ID4gwqAJaW50IGk7CgpCeSB0aGUg
d2F5IHNob3VsZCB3ZSByZW5hbWUgdGhpcyBmdW5jdGlvbj8gIEkgdGhpbmsKIl9fc2RoY2lfZXhl
Y3V0ZV90dW5pbmciIHZzICJzZGhjaV9leGVjdXRlX3R1bmluZyIgbWlnaHQgYmUgY29uZnVzaW5n
CndoZW4gd2UgZXhwb3J0IGJvdGguCgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+
ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZl
cnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
