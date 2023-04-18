Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE5C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/0upjRBtR5pGOUW2gOyc7uPlM+Udg98FCjFTshk62lY=; b=WfiKHNRBwSAvX6
	iXMcb9cf21RLU/wfwmeXYwNztDYx80Ix6L3MpfiX2DmyzpytmYZI1KzUGYssbPlorQOoU88FBC9Af
	iJx6ugPwzj+2wL5RxLsFhxwburjZKEX31Y+DLcaoVGyY084ySlpUH3NWdxEOS4S9f+kU6aQQQW2NX
	ui/mDug7FxHdU+B/DiKv7mn64vLojFCPErN4r3IRlOBUgmikrhwia+xbkNKb2NLr/iR8UtQe0wQsk
	N4HwjJd9FznP9/dncw/gOBGeYD982I8IFZvqjidvHFQZZ47xDRIz8rFr7Wm/bz76TLqNIxGXYJ9Ur
	n8aBKdroqic31aziNVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1porpC-003Gh2-0y;
	Tue, 18 Apr 2023 20:21:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1porp9-003Gfr-2V
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 20:21:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1porp3-00015Z-5c; Tue, 18 Apr 2023 22:21:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1porp1-00CBOu-S9; Tue, 18 Apr 2023 22:21:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1porp1-00EKQX-7N; Tue, 18 Apr 2023 22:21:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] pwm: sifive: Simplify using devm_clk_get_prepared()
Date: Tue, 18 Apr 2023 22:21:02 +0200
Message-Id: <20230418202102.117658-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NYxZWUDL6nqiY43zsSH7XZr/b16Ctti/9W/FJz0Ev7A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkPvutB00RQEQfGSGcQrUwuEACxMe9MCrSPmiH0 NPEB58pXAWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZD77rQAKCRCPgPtYfRL+ Tvb8CACjjgcTK4kMt/9A7UXWDyzc0XLdesSwzd5wx1e2NnXtckUcrIezj7JlWsHxA6/Rl9qyuM2 vJU4CDn2dB4USGlC1t9RmYgd2tOxhd4hU8bBtOeTZ6Nj/vFK5NsDXnTF6rwDgBhpSMVbl17IxN2 l9l5d+QGXtDLlmb9kvRvDDQK0zC1p0QxlHx4bTVhc6glYXYDC3M5EyvUdeaFUgktG7uvSt4ra+k bejXUd7AXfM/WobXW90sehZAzjapj+bzFU/g9GE0lE/F1Rx6JzUYWhf4iQQonuXzTG5MY3W+DEO KsQBzbulbaZhlXiJDHI0ZFzZNWQp0BGPplUppGszqWe0nmax
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_132111_831975_E324E1AB 
X-CRM114-Status: GOOD (  11.93  )
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

SW5zdGVhZCBvZiBwcmVwYXJpbmcgdGhlIGNsayBhZnRlciBpdCB3YXMgcmVxdWVzdGVkIGFuZCB1
bnByZXBhcmluZyBpbgoucHJvYmUoKSdzIGVycm9yIHBhdGggYW5kIC5yZW1vdmUoKSwgdXNlIGRl
dm1fY2xrX2dldF9wcmVwYXJlZCgpIHdoaWNoCmNvcGVzIGZvciB1bnByZXBhcmluZyBhdXRvbWF0
aWNhbGx5LgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCA3ICsrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2
ZS5jCmluZGV4IDViMDU3NGY2MzVmNi4uYWU0OWQ2N2FiMmIxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCkBAIC0yNDQs
MTIgKzI0NCwxMiBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlpZiAoSVNfRVJSKGRkYXRhLT5yZWdzKSkKIAkJcmV0dXJuIFBUUl9F
UlIoZGRhdGEtPnJlZ3MpOwogCi0JZGRhdGEtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIE5VTEwp
OworCWRkYXRhLT5jbGsgPSBkZXZtX2Nsa19nZXRfcHJlcGFyZWQoZGV2LCBOVUxMKTsKIAlpZiAo
SVNfRVJSKGRkYXRhLT5jbGspKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIo
ZGRhdGEtPmNsayksCiAJCQkJICAgICAiVW5hYmxlIHRvIGZpbmQgY29udHJvbGxlciBjbG9ja1xu
Iik7CiAKLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGRhdGEtPmNsayk7CisJcmV0ID0gY2xr
X2VuYWJsZShkZGF0YS0+Y2xrKTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBjbG9jayBmb3IgcHdtOiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKQEAg
LTMwOCw3ICszMDgsNiBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJY2xrX2Rpc2FibGUoZGRhdGEtPmNsayk7CiAJCS0tZW5hYmxl
ZF9jbGtzOwogCX0KLQljbGtfdW5wcmVwYXJlKGRkYXRhLT5jbGspOwogCiAJcmV0dXJuIHJldDsK
IH0KQEAgLTMyNyw4ICszMjYsNiBAQCBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiAJCWlmIChwd20tPnN0YXRlLmVuYWJsZWQpCiAJCQlj
bGtfZGlzYWJsZShkZGF0YS0+Y2xrKTsKIAl9Ci0KLQljbGtfdW5wcmVwYXJlKGRkYXRhLT5jbGsp
OwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwd21fc2lmaXZlX29mX21h
dGNoW10gPSB7CgpiYXNlLWNvbW1pdDogMjQ3ZWU2Yzc4MDQwNjUxM2M2MDMxYTdmNGVhNDFmMTY0
OGIwMzI5NQotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
