Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237EAC61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9B416Eb06KygXILqWb6lJ/6QUbe+26Fq48L00Zpnqk=; b=qlvo37VkBZufy0
	QwM4NE/hjF/T1tutFuETp4GQmbkHQlz4QlwkLJXD0siWYabR/GlJ2wXAiAe0273/5FFJw2vrJAy5u
	ey0OyaEO0ERsVNgbJtp++BerADZ4d7lFlY6vH1ATU2ZB5J0O1EFWdkEnvcjCeKVSUnVKk1o1p59LS
	WLxjYqfMuZzh6xSItgqbzbT7S36TpU/e27yGg5FsnLECi1CeD3dPoZ4V9UTaY5l/eJA8OzZY57K+I
	z/OM/l5z3oosKYv455UguI97DWLl2QD7lzs7k2kuhR4yLv/8Jl3dbQArfmSgyZ/FZeHaWvQqFe480
	m1+JB86BvYMnyLc771lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RBm-00GvfX-19;
	Tue, 21 Nov 2023 13:53:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAe-00GuOu-1e
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 13:52:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAY-000616-Ff; Tue, 21 Nov 2023 14:52:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAV-00Ab0i-An; Tue, 21 Nov 2023 14:51:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAV-004xfX-1t; Tue, 21 Nov 2023 14:51:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v3 070/108] pwm: microchip-core: Make use of devm_pwmchip_alloc() function
Date: Tue, 21 Nov 2023 14:50:12 +0100
Message-ID: <20231121134901.208535-71-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=m4GyQiFXFJaqNI6WOpp3CmU9hg+F8DEVlbs8fT7JIU0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWZSTYln9e9/w1RE6dBuatGQK2RNYSXM6EYF CszlHEPUGeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1mQAKCRCPgPtYfRL+ Tso6CACWEICz+Jh2/S6FDrY1o+5J7hFt6zyH2dcAUsmNBuWJ4ZqL4miE/SUO657rMaSUg9Wtkhy wrFk8QVsIS04DXx4wHU1gic30T/u/3U7GisM5aBAwGKZ4S+xZy1TMkLOM9rOZxTJ21uecn8GM8G CEe+cLYLMAGgAJg/bfJYd5VkX9zCifzLtblcuAghcXnJSLVuutfJ8b7BHD9Xw59lRGWMFmz6jV0 nasGBbYyqmfwI8i8evkJ/BZo5i0cK4cCbXUyUbqnVSoI8LpAPwoZDKwgwLxn3LrWfQ2jNWr4e5y MqOLZ/CXnwJhoh0PzYy7JvOglfnnUh/Bk8uFWxLds8X3iQ4Q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055208_586025_D56944D3 
X-CRM114-Status: GOOD (  14.38  )
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLW1pY3JvY2hpcC1jb3JlIGRyaXZlciB0byBmdXJ0aGVyIGNo
YW5nZXMgb2YgdGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcg
ZGV2bV9wd21jaGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hh
bmdlIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0t
CiBkcml2ZXJzL3B3bS9wd20tbWljcm9jaGlwLWNvcmUuYyB8IDE3ICsrKysrKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1taWNyb2NoaXAtY29yZS5jIGIvZHJpdmVycy9wd20vcHdt
LW1pY3JvY2hpcC1jb3JlLmMKaW5kZXggYzBjNTM5NjhmM2U5Li42ZTBjMmNiZmMxMjAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1taWNyb2NoaXAtY29yZS5jCisrKyBiL2RyaXZlcnMvcHdt
L3B3bS1taWNyb2NoaXAtY29yZS5jCkBAIC01NCw3ICs1NCw2IEBACiAjZGVmaW5lIE1DSFBDT1JF
UFdNX1RJTUVPVVRfTVMJMTAwdQogCiBzdHJ1Y3QgbWNocF9jb3JlX3B3bV9jaGlwIHsKLQlzdHJ1
Y3QgcHdtX2NoaXAgY2hpcDsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJdm9pZCBfX2lvbWVtICpiYXNl
OwogCXN0cnVjdCBtdXRleCBsb2NrOyAvKiBwcm90ZWN0cyB0aGUgc2hhcmVkIHBlcmlvZCAqLwpA
QCAtNjUsNyArNjQsNyBAQCBzdHJ1Y3QgbWNocF9jb3JlX3B3bV9jaGlwIHsKIAogc3RhdGljIGlu
bGluZSBzdHJ1Y3QgbWNocF9jb3JlX3B3bV9jaGlwICp0b19tY2hwX2NvcmVfcHdtKHN0cnVjdCBw
d21fY2hpcCAqY2hpcCkKIHsKLQlyZXR1cm4gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBtY2hw
X2NvcmVfcHdtX2NoaXAsIGNoaXApOworCXJldHVybiBwd21jaGlwX3ByaXYoY2hpcCk7CiB9CiAK
IHN0YXRpYyB2b2lkIG1jaHBfY29yZV9wd21fZW5hYmxlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwg
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKQEAgLTQ0NywxMyArNDQ2LDE1IEBAIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIG1jaHBfY29yZV9vZl9tYXRjaCk7CiAKIHN0YXRpYyBpbnQgbWNocF9jb3Jl
X3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCXN0cnVjdCBwd21f
Y2hpcCAqY2hpcDsKIAlzdHJ1Y3QgbWNocF9jb3JlX3B3bV9jaGlwICptY2hwX2NvcmVfcHdtOwog
CXN0cnVjdCByZXNvdXJjZSAqcmVnczsKIAlpbnQgcmV0OwogCi0JbWNocF9jb3JlX3B3bSA9IGRl
dm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKm1jaHBfY29yZV9wd20pLCBHRlBfS0VSTkVM
KTsKLQlpZiAoIW1jaHBfY29yZV9wd20pCi0JCXJldHVybiAtRU5PTUVNOworCWNoaXAgPSBkZXZt
X3B3bWNoaXBfYWxsb2MoJnBkZXYtPmRldiwgMTYsIHNpemVvZigqbWNocF9jb3JlX3B3bSkpOwor
CWlmIChJU19FUlIoY2hpcCkpCisJCXJldHVybiBQVFJfRVJSKGNoaXApOworCW1jaHBfY29yZV9w
d20gPSB0b19tY2hwX2NvcmVfcHdtKGNoaXApOwogCiAJbWNocF9jb3JlX3B3bS0+YmFzZSA9IGRl
dm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZWdzKTsKIAlp
ZiAoSVNfRVJSKG1jaHBfY29yZV9wd20tPmJhc2UpKQpAQCAtNDcwLDkgKzQ3MSw3IEBAIHN0YXRp
YyBpbnQgbWNocF9jb3JlX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CiAJbXV0ZXhfaW5pdCgmbWNocF9jb3JlX3B3bS0+bG9jayk7CiAKLQltY2hwX2NvcmVfcHdtLT5j
aGlwLmRldiA9ICZwZGV2LT5kZXY7Ci0JbWNocF9jb3JlX3B3bS0+Y2hpcC5vcHMgPSAmbWNocF9j
b3JlX3B3bV9vcHM7Ci0JbWNocF9jb3JlX3B3bS0+Y2hpcC5ucHdtID0gMTY7CisJY2hpcC0+b3Bz
ID0gJm1jaHBfY29yZV9wd21fb3BzOwogCiAJbWNocF9jb3JlX3B3bS0+Y2hhbm5lbF9lbmFibGVk
ID0gcmVhZGJfcmVsYXhlZChtY2hwX2NvcmVfcHdtLT5iYXNlICsgTUNIUENPUkVQV01fRU4oMCkp
OwogCW1jaHBfY29yZV9wd20tPmNoYW5uZWxfZW5hYmxlZCB8PQpAQCAtNDg1LDcgKzQ4NCw3IEBA
IHN0YXRpYyBpbnQgbWNocF9jb3JlX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXdyaXRlbF9yZWxheGVkKDFVLCBtY2hwX2NvcmVfcHdtLT5iYXNlICsgTUNIUENPUkVQ
V01fU1lOQ19VUEQpOwogCW1jaHBfY29yZV9wd20tPnVwZGF0ZV90aW1lc3RhbXAgPSBrdGltZV9n
ZXQoKTsKIAotCXJldCA9IGRldm1fcHdtY2hpcF9hZGQoJnBkZXYtPmRldiwgJm1jaHBfY29yZV9w
d20tPmNoaXApOworCXJldCA9IGRldm1fcHdtY2hpcF9hZGQoJnBkZXYtPmRldiwgY2hpcCk7CiAJ
aWYgKHJldCkKIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiRmFpbGVk
IHRvIGFkZCBwd21jaGlwXG4iKTsKIAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
