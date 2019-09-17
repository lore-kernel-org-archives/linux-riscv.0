Return-Path: <SRS0=Dbhb=XM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20939C4CECE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 14:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97ED2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 14:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iuh1A9R1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aurabindo.in header.i=@aurabindo.in header.b="CFMJ9hdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97ED2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aurabindo.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ga5+MeMJqoOYE9mEhtVz5X9KJ54grjNKBU+jw8B6W1w=; b=Iuh1A9R1TIT7W4
	wVskeMp911NaL4QfCa6JWpg4djIO9mIrVAnHfKVAiLYGfxoFW9PDJd/HZPD5qGYq+8Wil0fD/Pq6m
	1PNN4/wlZdyZCWr3nRRZfu6luCGmo01ALLxC+GmYcLkVa50zrF2gmZ/3laTDiky9ouqRLJPKy2NFz
	bL2l6PT0WfBrPiiuipEhX7jkbEGj9JeUvGbleN9hwFCriHKpFgFi+2JuhyJAwOL45a9rSIm9OJxrA
	QNFW+F+wfIJI8i4jYt8tsn9WmHNc+pycTeXBwOWM9aR3/4GZKECUuQqfqYWRhVs0YV04XRtt9WX6i
	tXNIMAytihj6660E0gFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAE88-0002B8-Ba; Tue, 17 Sep 2019 14:06:56 +0000
Received: from mail1.protonmail.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAE85-0002AX-CE
 for linux-riscv@lists.infradead.org; Tue, 17 Sep 2019 14:06:55 +0000
Date: Tue, 17 Sep 2019 14:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
 s=protonmail; t=1568729209;
 bh=IzxXyf9LUqJRZ0W8vp8MTxeBb0vPHdEwkUasYCPeF90=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=CFMJ9hdKjn2aCG9YQCmmp71v8ZTD11TwZDi5LFDlbLfg6t3IFfSAePNh+sipGs7XN
 Hm4SEN4SazYKJFhWytWwStqkkSXK8DZGWtY1tGwZtRimoSqUU7Y/Wwaj1WG6RhsOUx
 wEAjEB1dU9dwC7y7HaRIgyFD1NvImDLS30YSqxw8=
To: Paul Walmsley <paul.walmsley@sifive.com>
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: Re: [PATCH] spi: sifive: check return value for
 platform_get_resource()
Message-ID: <ij_UksEXUomr_L7KQam02lHBryAppgwKDjG90VbVcRRUeXlKU8TAiBWc3aU8vt20Wvlwt_6NDgz5fuMSwwP1mm-1eP6GYWoR1Kbr0y0ElRk=@aurabindo.in>
In-Reply-To: <alpine.DEB.2.21.9999.1909170514130.11980@viisi.sifive.com>
References: <20190917085627.4562-1-mail@aurabindo.in>
 <CAMz4kuJczzjTPSohQ=kbZ0Pr7U_9-hzXk-jPgKk79PENOM1-dA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1909170514130.11980@viisi.sifive.com>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_070653_740946_6176130B 
X-CRM114-Status: GOOD (  17.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Cc: Baolin Wang <baolin.wang@linaro.org>,
 "palmer@sifive.com" <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCuKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKA
kOKAkOKAkOKAkOKAkApPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMTkgNTo0NSBQTSwgUGF1
bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiB3cm90ZToKCj4gT24gVHVlLCAx
NyBTZXAgMjAxOSwgQmFvbGluIFdhbmcgd3JvdGU6Cj4KPiA+IE9uIFR1ZSwgMTcgU2VwIDIwMTkg
YXQgMTc6MTIsIEF1cmFiaW5kbyBKYXlhbW9oYW5hbiBtYWlsQGF1cmFiaW5kby5pbiB3cm90ZToK
PiA+Cj4gPiA+IHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIG1heSByZXR1cm4gTlVMTC4gSWYgaXQg
aXMgc28sIHJldHVybiAtRU5YSU8KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQXVyYWJpbmRv
IEpheWFtb2hhbmFuIG1haWxAYXVyYWJpbmRvLmluCj4gPiA+Cj4gPiA+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4KPiA+ID4gZHJp
dmVycy9zcGkvc3BpLXNpZml2ZS5jIHwgNiArKysrKysKPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXNpZml2ZS5j
IGIvZHJpdmVycy9zcGkvc3BpLXNpZml2ZS5jCj4gPiA+IGluZGV4IDkzZWMyYzZjZGJmZC4uNjc0
ODUwNjdhNjk0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktc2lmaXZlLmMKPiA+
ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLXNpZml2ZS5jCj4gPiA+IEBAIC0zMDgsNiArMzA4LDEy
IEBAIHN0YXRpYyBpbnQgc2lmaXZlX3NwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gPiBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBtYXN0ZXIpOwo+ID4gPgo+ID4g
PiAgICAgICAgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMCk7Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0gICAgICAgICBpZiAoIXJlcykgewo+ID4gPgo+ID4g
Pgo+ID4gPiAtICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJubyBJT01FTSBy
ZXNvdXJjZSBmb3VuZFxcbiIpOwo+ID4gPgo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgICBy
ZXQgPSAtRU5YSU87Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0gICAgICAgICAgICAgICAgIGdvdG8gcHV0
X21hc3RlcjsKPiA+ID4KPiA+ID4KPiA+ID4gLSAgICAgICAgIH0KPiA+ID4KPiA+ID4KPiA+Cj4g
PiBTZWVtcyB1bm5lY2Vzc2FyeSwgdGhlIGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIGFscmVhZHkg
dmFsaWRhdGVkIGlmCj4gPiB0aGUgcmVzb3VyY2UgaXMgYXZhaWxhYmxlLgo+Cj4gSnVzdCBkb3Vi
bGVjaGVja2VkIGxpYi9kZXZyZXMuYyBhbmQgSSBhZ3JlZSB3aXRoIHlvdS4KPgo+IEF1cm9iaW5k
bywgaXMgdGhpcyBhIHBhdGNoIGZvciBhIHJlYWwgcHJvYmxlbSB0aGF0IHlvdSd2ZSBlbmNvdW50
ZXJlZD8KPgo+IC0gICBQYXVsCgpHZWVydCBpcyByaWdodC4gSSB3YXMganVzdCBicmVlemluZyB0
aHJvdWdoIHRoZSBzb3VyY2UgYW5kIGZvdW5kIGl0IG9kZCBzaW5jZQpJIG5vdGljZWQgb3RoZXIg
aW5zdGFuY2VzIGNoZWNraW5nIGZvciByZXR1cm4gdmFsdWUuIEFwcGFyZW50bHkgbm9uZSBvZiB0
aG9zZQp1c2UgdGhlIG1hbmFnZWQgYXBpLgoKSWYgeW91IGRpZG50IGFscmVhZHkgZG8gR2VlcnQn
cyBzdWdnZXN0aW9uLCBoZXJlIGlzIGEgcGF0Y2g6Cl9fX18KCnNwaTogc2lmaXZlOiB1c2UgZGV2
aWNlIG1hbmFnZWQgYXBpIHRvIGdldCBwbGFmb3JtIHJlc291cmNlCgpjYWxscyB0byBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoKSBwcmVjZWVkZWQgYnkgcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkKbWF5
IGJlIHJlcGxhY2VkIGJ5IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLgoKU2lnbmVk
LW9mZi1ieTogQXVyYWJpbmRvIEpheWFtb2hhbmFuIDxtYWlsQGF1cmFiaW5kby5pbj4KLS0tCiBk
cml2ZXJzL3NwaS9zcGktc2lmaXZlLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktc2lm
aXZlLmMgYi9kcml2ZXJzL3NwaS9zcGktc2lmaXZlLmMKaW5kZXggOTNlYzJjNmNkYmZkLi5jMDky
NWFhOThhYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zaWZpdmUuYworKysgYi9kcml2
ZXJzL3NwaS9zcGktc2lmaXZlLmMKQEAgLTI5Miw3ICsyOTIsNiBAQCBzaWZpdmVfc3BpX3RyYW5z
ZmVyX29uZShzdHJ1Y3Qgc3BpX21hc3RlciAqbWFzdGVyLCBzdHJ1Y3Qgc3BpX2RldmljZSAqZGV2
aWNlLAogc3RhdGljIGludCBzaWZpdmVfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CiAJc3RydWN0IHNpZml2ZV9zcGkgKnNwaTsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJl
czsKIAlpbnQgcmV0LCBpcnEsIG51bV9jczsKIAl1MzIgY3NfYml0cywgbWF4X2JpdHNfcGVyX3dv
cmQ7CiAJc3RydWN0IHNwaV9tYXN0ZXIgKm1hc3RlcjsKQEAgLTMwNyw4ICszMDYsNyBAQCBzdGF0
aWMgaW50IHNpZml2ZV9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlp
bml0X2NvbXBsZXRpb24oJnNwaS0+ZG9uZSk7CiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
bWFzdGVyKTsKCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0Vf
TUVNLCAwKTsKLQlzcGktPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwg
cmVzKTsKKwlzcGktPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7CiAJaWYgKElTX0VSUihzcGktPnJlZ3MpKSB7CiAJCXJldCA9IFBUUl9FUlIoc3BpLT5yZWdz
KTsKIAkJZ290byBwdXRfbWFzdGVyOwotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
