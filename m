Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E683E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPapYErpA7hxnJXV69s5W4iFeUGNwWisFYWDttLFS84=; b=EaneS1Txo9kwE7
	b/oxvkaDWhmT92hqEyeEmR09eUx5/MCNeYTeCetWYO7RlcGNbXq6t5aBiG2HKJgkGSnS1wA1i8xRA
	YXA/VgJOZQ7vFWdaIHJX0iqeqf+2TJUhgWzhuFZIkm6cwBTezkCW6KkeG1TI5o4TPddKQJDGNsmHe
	GUmsLaiJwlzfA3d7v/qkUia6vj9q/jFTWr+pTIM//c83+vncaEAmfdcxU7k6bvl+q+i9/46IzhuUi
	Ymnf01jDs3hL+RY3LpWnaqofYzjW9mf9g0YcdGRnJ75Ry3CEd/Hc9m2X0KAtSWiJNSE9mPKw4MYkY
	aA2dNEOtzFL37KNG0gjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxGe-0000000B61o-2wJu;
	Tue, 10 Dec 2024 10:15:00 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx92-0000000B4eI-2tbT
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 10:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1733825224;
	bh=abpofRq31ORHYJ4N/NA7SJPQZ+/vA7JXL4gI2ORl16U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mlLJlGZ84oi24RkI4/WWM0pQA4+OYFCGEVS5SSS3+ox/gBVd/bTx2dLTNNFd2aEVV
	 Ru9FzBwoOP53KyDhcfWUlGE0yM4n9NnJkiAkSmM0He1rNGCIqMXMoDRXyLAbPlbhzi
	 lIxJ/1AcOVHm6NPewpPtkXrLbSrz04qczLfWEMNk=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF3C71A3F9A;
	Tue, 10 Dec 2024 05:07:01 -0500 (EST)
Message-ID: <fb9f77696318823b405d30f7224a8bd95d922a36.camel@xry111.site>
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
From: Xi Ruoyao <xry111@xry111.site>
To: bigunclemax@gmail.com
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei	
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Yangtao Li <frank.li@vivo.com>, Jisheng Zhang	
 <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Dec 2024 18:07:00 +0800
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>
References: <20241210083029.92620-1-bigunclemax@gmail.com>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_020708_740643_F8FE5BDE 
X-CRM114-Status: GOOD (  16.36  )
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

T24gVHVlLCAyMDI0LTEyLTEwIGF0IDExOjMwICswMzAwLCBiaWd1bmNsZW1heEBnbWFpbC5jb20g
d3JvdGU6Cj4gRnJvbTogTWFrc2ltIEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KPiAK
PiBJbiBhY2NvcmRhbmNlIHdpdGggTGljaGVlUGkgNEEgQlNQIHRoZSBjbG9jayB0aGF0IGNvbWVz
IHRvIGVtbWMvc2RoY2kKPiBpcyAxOThNaHogd2hpY2ggaXMgZ290IHRocm91Z2ggZnJlcXVlbmN5
IGRpdmlzaW9uIG9mIHNvdXJjZSBjbG9jawo+IFZJREVPIFBMTCBieSA0IFsxXS4KPiAKPiBCdXQg
bm93IHRoZSBBUF9TVUJTWVMgZHJpdmVyIHNldHMgdGhlIENMSyBFTU1DIFNESU8gdG8gdGhlIHNh
bWUKPiBmcmVxdWVuY3kgYXMgdGhlIFZJREVPIFBMTCwgZXF1YWwgdG8gNzkyIE1Iei4gVGhpcyBj
YXVzZXMgZW1tYy9zZGhjaQo+IHRvIHdvcmsgNCB0aW1lcyBzbG93ZXIuCj4gCj4gTGV0J3MgZml4
IHRoaXMgaXNzdWUgYnkgYWRkaW5nIGZpeGVkIGZhY3RvciBjbG9jayB0aGF0IGRpdmlkZXMKPiBW
SURFTyBQTEwgYnkgNCBmb3IgZW1tYy9zZGhjaS4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vcmV2eW9zL3RoZWFkLWtlcm5lbC9ibG9iLzc1NjMxNzkwNzFhMzE0ZjQxY2RjZGJmZDhjZjZl
MTAxZTczNzA3ZjMvZHJpdmVycy9jbGsvdGhlYWQvY2xrLWxpZ2h0LWZtLmMjTDQ1NAo+IAo+IEZp
eGVzOiBhZTgxYjY5ZmQyYjEgKCJjbGs6IHRoZWFkOiBBZGQgc3VwcG9ydCBmb3IgVC1IZWFkIFRI
MTUyMCBBUF9TVUJTWVMgY2xvY2tzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYWtzaW0gS2lzZWxldiA8
YmlndW5jbGVtYXhAZ21haWwuY29tPgoKSXQgaGFzIHJhaXNlZCB0aGUgImRkIGlmPWdjYy0xNC4y
LjAudGFyLnh6IG9mPS9kZXYvbnVsbCIgc3BlZWQgcmVwb3J0CmZyb20gMjJNQi9zIHRvIDYxTUIv
cyAodGhlIGZpbGUgaXMgb24gYSBTRCBjYXJkKS4KClRlc3RlZC1ieTogWGkgUnVveWFvIDx4cnkx
MTFAeHJ5MTExLnNpdGU+Cgo+IC0tLQo+IMKgZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1h
cC5jIHwgMTMgKysrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvdGhlYWQvY2xr
LXRoMTUyMC1hcC5jIGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gaW5kZXgg
MTdlMzJhZTA4NzIwLi4xMDE1ZmFiOTUyNTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvdGhl
YWQvY2xrLXRoMTUyMC1hcC5jCj4gKysrIGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1h
cC5jCj4gQEAgLTc3OSw2ICs3NzksMTMgQEAgc3RhdGljIHN0cnVjdCBjY3VfZGl2IGRwdTFfY2xr
ID0gewo+IMKgCX0sCj4gwqB9Owo+IMKgCj4gK3N0YXRpYyBDTEtfRklYRURfRkFDVE9SX0hXKGVt
bWNfc2Rpb19yZWZfY2xrLCAiZW1tYy1zZGlvLXJlZiIsCj4gKwkJCcKgwqAgJnZpZGVvX3BsbF9j
bGsuY29tbW9uLmh3LCA0LCAxLCAwKTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3Bh
cmVudF9kYXRhIGVtbWNfc2Rpb19yZWZfY2xrX3BkW10gPSB7Cj4gKwl7IC5odyA9ICZlbW1jX3Nk
aW9fcmVmX2Nsay5odyB9LAo+ICt9Owo+ICsKPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfQlJPTSwg
YnJvbV9jbGssICJicm9tIiwgYWhiMl9jcHVzeXNfaGNsa19wZCwgMHgxMDAsIEJJVCg0KSwgMCk7
Cj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0JNVSwgYm11X2NsaywgImJtdSIsIGF4aTRfY3B1c3lz
Ml9hY2xrX3BkLCAweDEwMCwgQklUKDUpLCAwKTsKPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfQU9O
MkNQVV9BMlgsIGFvbjJjcHVfYTJ4X2NsaywgImFvbjJjcHUtYTJ4IiwgYXhpNF9jcHVzeXMyX2Fj
bGtfcGQsCj4gQEAgLTc5OCw3ICs4MDUsNyBAQCBzdGF0aWMgQ0NVX0dBVEUoQ0xLX1BFUklTWVNf
QVBCNF9IQ0xLLCBwZXJpc3lzX2FwYjRfaGNsaywgInBlcmlzeXMtYXBiNC1oY2xrIiwgcAo+IMKg
CQkweDE1MCwgQklUKDEyKSwgMCk7Cj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX05QVV9BWEksIG5w
dV9heGlfY2xrLCAibnB1LWF4aSIsIGF4aV9hY2xrX3BkLCAweDFjOCwgQklUKDUpLCAwKTsKPiDC
oHN0YXRpYyBDQ1VfR0FURShDTEtfQ1BVMlZQLCBjcHUydnBfY2xrLCAiY3B1MnZwIiwgYXhpX2Fj
bGtfcGQsIDB4MWUwLCBCSVQoMTMpLCAwKTsKPiAtc3RhdGljIENDVV9HQVRFKENMS19FTU1DX1NE
SU8sIGVtbWNfc2Rpb19jbGssICJlbW1jLXNkaW8iLCB2aWRlb19wbGxfY2xrX3BkLCAweDIwNCwg
QklUKDMwKSwgMCk7Cj4gK3N0YXRpYyBDQ1VfR0FURShDTEtfRU1NQ19TRElPLCBlbW1jX3NkaW9f
Y2xrLCAiZW1tYy1zZGlvIiwgZW1tY19zZGlvX3JlZl9jbGtfcGQsIDB4MjA0LCBCSVQoMzApLCAw
KTsKPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfR01BQzEsIGdtYWMxX2NsaywgImdtYWMxIiwgZ21h
Y19wbGxfY2xrX3BkLCAweDIwNCwgQklUKDI2KSwgMCk7Cj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xL
X1BBRENUUkwxLCBwYWRjdHJsMV9jbGssICJwYWRjdHJsMSIsIHBlcmlzeXNfYXBiX3BjbGtfcGQs
IDB4MjA0LCBCSVQoMjQpLCAwKTsKPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfRFNNQVJULCBkc21h
cnRfY2xrLCAiZHNtYXJ0IiwgcGVyaXN5c19hcGJfcGNsa19wZCwgMHgyMDQsIEJJVCgyMyksIDAp
Owo+IEBAIC0xMDU5LDYgKzEwNjYsMTAgQEAgc3RhdGljIGludCB0aDE1MjBfY2xrX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqAJCXJldHVybiByZXQ7Cj4gwqAJcHJpdi0+
aHdzW0NMS19QTExfR01BQ18xMDBNXSA9ICZnbWFjX3BsbF9jbGtfMTAwbS5odzsKPiDCoAo+ICsJ
cmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCAmZW1tY19zZGlvX3JlZl9jbGsuaHcpOwo+
ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiDCoAlyZXQgPSBkZXZtX29mX2Nsa19h
ZGRfaHdfcHJvdmlkZXIoZGV2LCBvZl9jbGtfaHdfb25lY2VsbF9nZXQsIHByaXYpOwo+IMKgCWlm
IChyZXQpCj4gwqAJCXJldHVybiByZXQ7CgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNp
dGU+ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVu
aXZlcnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
