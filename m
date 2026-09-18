Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D1C982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOZXSilyt5k4xGFGayOEPETewqqVxfgOtz3zbihikKQ=; b=RGpuzWydjf0MMf
	GX4ojwhj/3jdCqIdPfLSc/WdQuVgA6E77zvOUtzVVhj1A6YVwbKENEHaraxGhXY7X3Aptghcw3FGH
	Dy6K/xAPBqZpeFgTEJKFX5Isw5LejHlcWt5IGjqxunB+6QRHwEBz19GYTi2XS02xK4yunxQkWx/X9
	Nfc32Xg6bqeLDyACMk9XsVJATm2teSfSK9qGHlxXXc7bnDfo3Ubu6F5IfWUGrxdbYsZzzXFGxUkU2
	4xep/tEE8Yahw/AizVY/LodbzPmyJvfnAnLv3DdVM4V/hViMGbpMMWGH4zaYP6rmlcT3+KYsA0ZSw
	Be5uH4YjK3ygu4xabVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NI3-0000000D8Ip-29gl;
	Fri, 18 Sep 2026 01:21:23 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NI0-0000000D8Gz-1BEf;
	Fri, 18 Sep 2026 01:21:21 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 76870D0766;
	Fri, 18 Sep 2026 04:21:14 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 76870D0766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789694477;
	bh=69bnCVQM5n3sV/AN5VtraQEwkW0YanBMdQC8pbKcydM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ax2GgqebXNR2R2lP+6/CijC3VqGvyDb08ILb0eZ6Ema1QmO+nzkiVt/qRo7PjqTGp
	 omF5ojiR+tFY2fkhlBSOfp1uhXyFE5u1MkIs/42ovtNJ+0FF/txHSbBXiE5YlIqqXz
	 7ZfxK8+GnM/1UaO/A/wiJz4RukrOPn8ziE+7vEOamYCHnXcUjxPRGUakAtZoryriXd
	 hzMZ+JCt9n9yC1f1spnVcwlt9shjLNaDYXtF4nrnK/oHV7gCM1A9PdtfQYADHAkmYd
	 vd+8dsupfkAL9T2QqNdP05m/gXaJ7VZc2W+030SRS9tXyKQrP6cko254BVWIod5kye
	 4hJvIM4Oow2Kw==
Message-ID: <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
Subject: Re: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
From: Radu Rendec <radu@rendec.net>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Anup Patel
 <anup@brainfault.org>,  Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong	
 <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>
Date: Thu, 17 Sep 2026 21:21:12 -0400
In-Reply-To: <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
	 <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_182120_500381_04614E31 
X-CRM114-Status: GOOD (  20.22  )
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

T24gRnJpLCAyMDI2LTA5LTExIGF0IDAzOjI3ICswMDAwLCBHVU8gUmVuIChYdWFuVGllKSB3cm90
ZToKPiBUaGUgbGFzdCBlbnVtZXJhdG9yIG9mIHRoaXMgZHJpdmVyJ3MgZmlybXdhcmUgSVBJIGlk
IGxpc3QgaXMgYSBib3VuZAo+IGZvciB0aGUgVlBVIG1haWxib3ggcHJvdG9jb2wsIG5vdCBhIGdl
bmVyaWMgaG9zdCBJUEkgbGltaXQuIEZvbGxvdyB0aGUKPiBleGlzdGluZyBuYW1pbmcgaW4gdGhp
cyBoZWFkZXI6IElQSV9WUFVfSU5JVCBhbHJlYWR5IGNhcnJpZXMgYSBWUFUKPiBwcmVmaXgsIHNv
IHRoZSB0ZXJtaW5hdG9yIHNob3VsZCBtYXRjaC4KPiAKPiBUaGUgc2FtZSBjb252ZW50aW9uIGlz
IHVzZWQgYnkgdGhlIFNDUCBJUEkgZW51bSwgd2hpY2ggZW5kcyB3aXRoIGEKPiBwcmVmaXhlZCBT
Q1BfSVBJX01BWCByYXRoZXIgdGhhbiBhIGJhcmUgSVBJX01BWC4KPiAKPiBSZW5hbWUgSVBJX01B
WCB0byBJUElfVlBVX01BWCBhbmQgdXBkYXRlIHRoZSBkZXNjcmlwdG9yIHRhYmxlIGJvdW5kcwo+
IGFuZCByYW5nZSBjaGVja3MuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwOTA4MjIyMzQ5LkdBMjMyNDg3MEBh
eDE2Mgo+IENjOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJuZWwub3JnPgo+IC0tLQo+IMKg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92cHUvbXRrX3ZwdS5jIHwgMTIgKysrKysr
LS0tLS0tCj4gwqBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3ZwdS9tdGtfdnB1Lmgg
fMKgIDQgKystLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dnB1L210a192cHUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192
cHUuYwo+IGluZGV4IDhkODMxOWYwY2QyMi4uYjNlOWY4YzRhYjdhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192cHUuYwo+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192cHUuYwo+IEBAIC0yMTEsNyArMjEx
LDcgQEAgc3RydWN0IG10a192cHUgewo+IMKgCXN0cnVjdCB2cHVfcmVncyByZWc7Cj4gwqAJc3Ry
dWN0IHZwdV9ydW4gcnVuOwo+IMKgCXN0cnVjdCB2cHVfd2R0IHdkdDsKPiAtCXN0cnVjdCB2cHVf
aXBpX2Rlc2MgaXBpX2Rlc2NbSVBJX01BWF07Cj4gKwlzdHJ1Y3QgdnB1X2lwaV9kZXNjIGlwaV9k
ZXNjW0lQSV9WUFVfTUFYXTsKPiDCoAlzdHJ1Y3Qgc2hhcmVfb2JqIF9faW9tZW0gKnJlY3ZfYnVm
Owo+IMKgCXN0cnVjdCBzaGFyZV9vYmogX19pb21lbSAqc2VuZF9idWY7Cj4gwqAJc3RydWN0IGRl
dmljZSAqZGV2Owo+IEBAIC0yMjEsNyArMjIxLDcgQEAgc3RydWN0IG10a192cHUgewo+IMKgCXN0
cnVjdCBtdXRleCB2cHVfbXV0ZXg7IC8qIGZvciBwcm90ZWN0aW5nIHZwdSBkYXRhIGRhdGEgc3Ry
dWN0dXJlICovCj4gwqAJdTMyIHdkdF9yZWZjbnQ7Cj4gwqAJd2FpdF9xdWV1ZV9oZWFkX3QgYWNr
X3dxOwo+IC0JYm9vbCBpcGlfaWRfYWNrW0lQSV9NQVhdOwo+ICsJYm9vbCBpcGlfaWRfYWNrW0lQ
SV9WUFVfTUFYXTsKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBpbmxpbmUgdm9pZCB2cHVfY2ZnX3dy
aXRlbChzdHJ1Y3QgbXRrX3ZwdSAqdnB1LCB1MzIgdmFsLCB1MzIgb2Zmc2V0KQo+IEBAIC0yOTYs
NyArMjk2LDcgQEAgaW50IHZwdV9pcGlfcmVnaXN0ZXIoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKPiDCoAkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gwqAJfQo+IMKgCj4gLQlpZiAoaWQg
PCBJUElfTUFYICYmIGhhbmRsZXIpIHsKPiArCWlmIChpZCA8IElQSV9WUFVfTUFYICYmIGhhbmRs
ZXIpIHsKPiDCoAkJaXBpX2Rlc2MgPSB2cHUtPmlwaV9kZXNjOwo+IMKgCQlpcGlfZGVzY1tpZF0u
bmFtZSA9IG5hbWU7Cj4gwqAJCWlwaV9kZXNjW2lkXS5oYW5kbGVyID0gaGFuZGxlcjsKPiBAQCAt
MzE5LDcgKzMxOSw3IEBAIGludCB2cHVfaXBpX3NlbmQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKPiDCoAl1bnNpZ25lZCBsb25nIHRpbWVvdXQ7Cj4gwqAJaW50IHJldCA9IDA7Cj4gwqAK
PiAtCWlmIChpZCA8PSBJUElfVlBVX0lOSVQgfHwgaWQgPj0gSVBJX01BWCB8fAo+ICsJaWYgKGlk
IDw9IElQSV9WUFVfSU5JVCB8fCBpZCA+PSBJUElfVlBVX01BWCB8fAo+IMKgCcKgwqDCoCBsZW4g
PiBzaXplb2Yoc2VuZF9vYmotPnNoYXJlX2J1ZikgfHwgIWJ1Zikgewo+IMKgCQlkZXZfZXJyKHZw
dS0+ZGV2LCAiZmFpbGVkIHRvIHNlbmQgaXBpIG1lc3NhZ2VcbiIpOwo+IMKgCQlyZXR1cm4gLUVJ
TlZBTDsKPiBAQCAtNzQ4LDcgKzc0OCw3IEBAIHN0YXRpYyB2b2lkIHZwdV9pcGlfaGFuZGxlcihz
dHJ1Y3QgbXRrX3ZwdSAqdnB1KQo+IMKgCXMzMiBpZCA9IHJlYWRsKCZyY3Zfb2JqLT5pZCk7Cj4g
wqAKPiDCoAltZW1jcHlfZnJvbWlvKGRhdGEsIHJjdl9vYmotPnNoYXJlX2J1Ziwgc2l6ZW9mKGRh
dGEpKTsKPiAtCWlmIChpZCA8IElQSV9NQVggJiYgaXBpX2Rlc2NbaWRdLmhhbmRsZXIpIHsKPiAr
CWlmIChpZCA8IElQSV9WUFVfTUFYICYmIGlwaV9kZXNjW2lkXS5oYW5kbGVyKSB7Cj4gwqAJCWlw
aV9kZXNjW2lkXS5oYW5kbGVyKGRhdGEsIHJlYWRsKCZyY3Zfb2JqLT5sZW4pLAo+IMKgCQkJCcKg
wqDCoMKgIGlwaV9kZXNjW2lkXS5wcml2KTsKPiDCoAkJaWYgKGlkID4gSVBJX1ZQVV9JTklUKSB7
Cj4gQEAgLTkzNCw3ICs5MzQsNyBAQCBzdGF0aWMgaW50IG10a192cHVfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiDCoCNpZmRlZiBDT05GSUdfREVCVUdfRlMKPiDCoAlkZWJ1
Z2ZzX3JlbW92ZSh2cHVfZGVidWdmcyk7Cj4gwqAjZW5kaWYKPiAtCW1lbXNldCh2cHUtPmlwaV9k
ZXNjLCAwLCBzaXplb2Yoc3RydWN0IHZwdV9pcGlfZGVzYykgKiBJUElfTUFYKTsKPiArCW1lbXNl
dCh2cHUtPmlwaV9kZXNjLCAwLCBzaXplb2Yoc3RydWN0IHZwdV9pcGlfZGVzYykgKiBJUElfVlBV
X01BWCk7Cj4gwqB2cHVfbXV0ZXhfZGVzdHJveToKPiDCoAltdXRleF9kZXN0cm95KCZ2cHUtPnZw
dV9tdXRleCk7Cj4gwqBkaXNhYmxlX3ZwdV9jbGs6Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192cHUuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdnB1L210a192cHUuaAo+IGluZGV4IDM5NTE1NDdlOWVjNS4uNDRhYjYzMWVj
OTA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210
a192cHUuaAo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192
cHUuaAo+IEBAIC00OSw3ICs0OSw3IEBAIHR5cGVkZWYgdm9pZCAoKmlwaV9oYW5kbGVyX3QpICh2
b2lkICpkYXRhLAo+IMKgICoJCQkgaGFuZGxlIFZQOCB2aWRlbyBlbmNvZGVyIGpvYiwsIGFuZCB2
aWNlIHZlcnNhLgo+IMKgICogQElQSV9NRFA6CQkgVGhlIGludGVycnVwdCBmcm9tIHZwdSBpcyB0
byBub3RpZnkga2VybmVsIHRvCj4gwqAgKgkJCSBoYW5kbGUgTURQIChNZWRpYSBEYXRhIFBhdGgp
IGpvYiwgYW5kIHZpY2UgdmVyc2EuCj4gLSAqIEBJUElfTUFYOgkJIFRoZSBtYXhpbXVtIElQSSBu
dW1iZXIKPiArICogQElQSV9WUFVfTUFYOgkgVGhlIG1heGltdW0gVlBVIElQSSBudW1iZXIKPiDC
oCAqLwo+IMKgCj4gwqBlbnVtIGlwaV9pZCB7Cj4gQEAgLTYwLDcgKzYwLDcgQEAgZW51bSBpcGlf
aWQgewo+IMKgCUlQSV9WRU5DX0gyNjQsCj4gwqAJSVBJX1ZFTkNfVlA4LAo+IMKgCUlQSV9NRFAs
Cj4gLQlJUElfTUFYLAo+ICsJSVBJX1ZQVV9NQVgsCj4gwqB9Owo+IMKgCj4gwqAvKioKClJldmll
d2VkLWJ5OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
