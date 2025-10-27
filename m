Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADF8CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 01:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q/Nnd+exmX1YBwgl5ceSBv/JVddu1C/QpHtUR5Rk9s=; b=GqNvYh6IvXehMq
	Bl6ohisXyy6S1OR1ZqI7A/TeokiJIzTR+oIOJrFVLTu4zlCl1d5dKdFr0zbA1OwFjyWH5+eWjcyOh
	E3keRurEAeM+LD70Za/JHcynBaoGPJ+nui+qPYoO76VJ1cjVLFm93KJ4UfnL1xxjQ+2SmGgkxyt6g
	cUo2CkEYKJ0VuORwEsXHT3v2ktKO7Sz+F4I09JFQl8C/+NRQzYBsjyMDv1XWGIbXbOXMqN3ZqEAeS
	F/io9Ns+KFGOGB89Nj7B7TVSJo/owTqJJZIFfoItY/YFBYkXe7m5q6kkASEFRLWhAuWiA/oP4r8o7
	0a20C8+6i9UXh2DoLKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBtR-0000000CwPF-3DsE;
	Mon, 27 Oct 2025 01:19:29 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBtN-0000000CwOC-23an
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 01:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761527937;
	bh=FtNZ8zy+l54IpAnURTHO+1r1GOzAAhW69sizKWqnidw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=yBxeUGDGCE2mtPOqUwC/4cbTKgm4hHnawaMB6a3CZ0jAQ0VzmUrqTrA06xrmjOP4e
	 vPcwqWFEMKfJzKtWxrPqOuimjsCPOhK6dlsstt1/PI7YkREb8GzZ1qAFdwZA4yIEcM
	 OHmNmxBm/SkmugjESQLo6UM/G4bHfcgGLDzg8054=
X-QQ-mid: zesmtpsz7t1761527932t8c892f9c
X-QQ-Originating-IP: X46h/Pqk7NaYdaGiCnjlkcYaOwRSoAVzeudXsZlyse8=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 09:18:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4802128976697344578
EX-QQ-RecipientCnt: 4
Date: Mon, 27 Oct 2025 09:18:50 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NYlggeZuI0UG6WA1n9n/zQdNuazZ8e4RdsaS8q0dpYRLKx4kfoFQrXgi
	4ZsCNkujYM6RZwihAcgbR1dsQ2ISg3DGeSOzv5wZMHG50doS1SP3OMb7YVZnnZkuMPIhfaI
	QbYqTgO8RetUgZ11dpRqphRlH47QDS5nhWByhCuO/guT7uCWDWHBPoZshaXCrtIN9pqX45t
	VAzncdmRYYo+yuclf4P9du/ch7KqIq3b/2h0yKZGL45D+9CVDVY9DjQbRFk5dXg5J5UUVmm
	lJTQFQ9RwMes18GgX2ACd9hxetO/XDIqUrcd8XiE3VP0YrteIfg1oXUqKkUQahcj0zK3FmK
	O4yaMeITJHFT8DwhaIt0TtQxSplcN4VZ20GyB2+AIxSyNBK5680FsqS0655mPLvnAsyOuW8
	slEt+NnBVpw54L85ErkN1VU1xJbxLmF364z+eeQeGabRotk2t8NOrFf92wL+GJOfTMH1wlh
	Bn/RfjzVt+uRgEL+VPgSlAE3bSywVkvN9x283pI+g3FOPptJ5gJXbrqaAyUGrJrT/Q/brZr
	TMVmUftQ0J43Imb6PVWxKs/Q7iR/UrisYNJVFOOkQIvyQ/9kLwpDd+lV1xohgiwPKqoTXDA
	wjQm9eLU4mPV8g4UTok3LD8G0lZJo3kP8dQcoEr15544V+gnftQkMlwZ0zP/nZ5loHLZYlF
	r+7+/nX691PHu+B5mHkVPPzlICDYScfV/FumRo1UME1UxlJAAiGcaArvxKGs4UO6Y5c5Re6
	Y9xv8Oq4yqDshq1a9OaUf4htVrQFzlMdhIm/um06s2m3ePdJUBnQaDdBTsnNwAgCKoWyltS
	FyvUFa6neLZXxBu7Ju7q3R1b2d8uEacwWImLF86gxXoGtmSqQt0cKzFg7xdCX+RIYGXaAGZ
	3B+b82BQKUiAY/b6H0n+uBfq2H6PwAf/mvW9aRH4XIs+dxNt4DyF7ByEUQDqVg2ysv0j8eH
	oaSyFiK3qXfH358Aq1lhFzWkk7Z+CpdcddzL9mzvBKMnQ4GZfwX3xE9zDqVE/xNdDOIgV/v
	jrDkW3WeHpAy4ByoAaWPQr4fuybveLbJlhxhg15jh5ofEE1S5O
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181926_905414_2276D1BF 
X-CRM114-Status: GOOD (  16.35  )
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

T24gU2F0LCBPY3QgMjUsIDIwMjUgYXQgMDc6NDg6NDVBTSArMDAwMCwgTWljaGFlbCBPcGRlbmFj
a2VyIHdyb3RlOgo+IEdyZWV0aW5ncywKPiAKPiBPbiAxMC8yNS8yNSAwOTo0NSwgbWljaGFlbC5v
cGRlbmFja2VyQHJvb3Rjb21taXQuY29tIHdyb3RlOgo+ID4gRnJvbTogTWljaGFlbCBPcGRlbmFj
a2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+ClsuLi5dCj4gPiArJmkyYzIg
ewo+ID4gKwlwaW5jdHJsLTAgPSA8JmkyYzJfMF9jZmc+Owo+ID4gKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ID4gKwlzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsKPiA+ICsmaTJj
OCB7Cj4gPiArCXBpbmN0cmwtMCA9IDwmaTJjOF9jZmc+Owo+ID4gKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ID4gKwlzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsKPiA+ICAgJnBk
bWEgewo+ID4gICAJc3RhdHVzID0gIm9rYXkiOwo+ID4gICB9Owo+IAo+IAo+IFVuZm9ydHVuYXRl
bHksIHRoZXNlIGNoYW5nZXMgYXJlIG5vdCBmdW5jdGlvbmFsIHlldCBvbiBPcmFuZ2VQaSBSVjIs
IHRlc3RpbmcKPiBvbiBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4L2NvbW1p
dHMvazEvZHQtZm9yLW5leHQKPiAKPiAjIGkyY2RldGVjdCAtciAyCj4gV0FSTklORyEgVGhpcyBw
cm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFuZCB3b3Jz
ZSEKPiBJIHdpbGwgcHJvYmUgZmlsZSAvZGV2L2kyYy0yIHVzaW5nIHJlY2VpdmUgYnl0ZSBjb21t
YW5kcy4KPiBJIHdpbGwgcHJvYmUgYWRkcmVzcyByYW5nZSAweDA4LTB4NzcuCj4gQ29udGludWU/
IFtZL25dCj4gwqAgwqAgwqAwwqAgMcKgIDLCoCAzwqAgNMKgIDXCoCA2wqAgN8KgIDjCoCA5wqAg
YcKgIGLCoCBjwqAgZMKgIGXCoCBmCj4gMDA6wqAgwqAgwqAgwqAgW8KgIDEyNC42NzUzMjFdIGky
Yy1rMSBkNDAxMjAwMC5pMmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJldCAtMTEKPiBlcnIgMHg0
MDAwMDAKWy4uLl0KCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtLSAwOSBbwqAgMTI0LjY4
Njc2OV0gaTJjLWsxIGQ0MDEyMDAwLmkyYzogaTJjIHRyYW5zZmVyCj4gSSBhc3N1bWUgdGhlIGky
Yy1rMSBkcml2ZXIgd29ya3Mgb24gQmFuYW5hUGkgRjMuCk5vLCBJdCBkb2Vzbid0IHdvcmsgb24g
QmFuYW5hUGkgRjMgYWN0dWFsbHkuCj4gQW55IGNsdWVzIHdoeSB0aGUgc2FtZQo+IGJ1c2VzIGRv
bid0IHdvcmsgT3JhbmdlUGkgUlYyPwpUaGlzIGlzIGEga25vd24gaXNzdWUuCkkgZGlkbuKAmXQg
Zml4IGl0IGVhcmxpZXIgc2luY2UgaXQgZG9lc27igJl0IGFmZmVjdCBmdW5jdGlvbmFsaXR5LApi
dXQgbm93IHRoYXQgaXTigJlzIGJlZW4gcmVwb3J0ZWQsIGl04oCZcyB0aW1lIHRvIGZpeCBpdC4K
SeKAmWxsIHNlbmQgYSBwYXRjaCBzaG9ydGx5LgoKVGhhbmtzIGZvciByZXBvcnRpbmcgdGhpcyBp
c3N1ZS4KCiAgICAgICAgICAgICAgICAtIFRyb3kKPiBUaGFua3MgaW4gYWR2YW5jZQo+IENoZWVy
cwo+IE1pY2hhZWwuCj4gCj4gLS0gCj4gTWljaGFlbCBPcGRlbmFja2VyCj4gUm9vdCBDb21taXQK
PiBZb2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0gTGVhcm4g
YnkgZG9pbmc6Cj4gaHR0cHM6Ly9yb290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KPiAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
