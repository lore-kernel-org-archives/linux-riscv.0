Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDAAC48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwitHESY5vA/cpZUgOPWs+hiHplyV0s3ZLTe+XDE0tI=; b=aRJZX3TJk2eFRl
	9foORU0YZ3XPgGAEVmmfwXGwOSY7jwkJ7oepgMdbWVWzk7P34uIudEo86Y1XoCAMaIXNfwMmrEneZ
	Z7gfvMGQB3tvEM5S1G5aAHhoLHrNS8bwALBqZ9qyI5xp6gG525KA1MhmNKU/xvW+vR0VZkpV1szxd
	9EnOxr9T5dAFQ7mUw/P66ZZ2mnAUZY+VNVc6C2437qnbo+/3Uorjf4g/MKDvFmR+6yBRIcg+tM2M2
	iU8uy+Vxil6icis7N+xpnbgSdY9aMDnIUg6mYvUECGzE+SesJHczAWFZeBjGCmqfHXlWmN4pZhAJO
	UlK0tok+Yegdm0tlxG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBk6-0000000CO75-2dgd;
	Wed, 14 Feb 2024 09:39:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfW-0000000CKuM-1tpq
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Feb 2024 09:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i3eIb9BzQ77SWxMC1T0epndA/vP1rDDhxpiHKfwp8PI=; b=LHVaNxZGTwG/oxB8EFrTDGLgUb
	oavcKpSikcep9Y0ES+EAMqOOaFYuAWj2Q0Hy0qZvlV1MOaGsdDI7Ubjbdyz5dNoR242GsVVnWVsmP
	iLpt/Wg8CsqCxdL/C1Z90J48pvvQFC0SvpAb2lWELQLurkEaydgaq/55NTCNOnXtld9pSP7mprgdd
	A9uIU61rOSMnJ8ToPqGFmXklqumernKUIVRd1nv9LmzQCasLblHcc/P9wkVh+swgd/PM52ogW0re4
	gCUodpvzyq+VaXrdYCcsy8YyJA0AOt010TE9cZT27wtDEDVP6dxXIFZhfILmE5euDvoWtY/GNY0fT
	BMAjOdFQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfE-0000000GAXN-2PYr
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:35:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf4-0005bk-6m; Wed, 14 Feb 2024 10:34:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf0-000fFD-1R; Wed, 14 Feb 2024 10:34:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-004Y6v-36;
	Wed, 14 Feb 2024 10:34:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 105/164] pwm: sifive: Make use of devm_pwmchip_alloc() function
Date: Wed, 14 Feb 2024 10:32:32 +0100
Message-ID: <30a4cacafe2c323f2531dd1c1126f0bf0fe5e03c.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=eEmGHdSWNvR4ed02g4CrTc8o2T2daS6ifGT2/J93aKM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjDMoEOaUlUw5z3jDQXxi7KNqSviZi6PZrRK BeNBj/P/qeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIwwAKCRCPgPtYfRL+ Tk+XCACssJN1hA87M/LHdxRNCalhRlvEl5FmPlHj26Mkixz2D1s2qdJ50LPNuA8QIiOZP+jWTPR Vxb+7McnUCI3h/dYWDycGmT5wRa5uVy6b9Js6eCAB8nbrlils5cTyzxE3WHMxOHmX2cLZYgBxW3 cl+wOhWEWDwCThY0zEv6QfM8iaTnb81UU4xMWmMqvOZ5VkByRQNf7YeMivaPZbx02Uq+v887swT x0L9rPySQCrUNbQPBmh+jjlyu97p3XaOI5qCOExcOcYIBO7CVpXaJ0h0F+WDzBuSXW8Qs/rCVMT XTcEAbJfZsqmr8CIW4rVUYClwFo1h6CTq/AAXFphdfbgtivq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_093449_186480_428756D8 
X-CRM114-Status: GOOD (  13.00  )
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXNpZml2ZSBkcml2ZXIgdG8gZnVydGhlciBjaGFuZ2VzIG9m
IHRoZSBwd20gY29yZQpvdXRsaW5lZCBpbiB0aGUgY29tbWl0IGludHJvZHVjaW5nIGRldm1fcHdt
Y2hpcF9hbGxvYygpLiBUaGVyZSBpcyBubwppbnRlbmRlZCBzZW1hbnRpY2FsIGNoYW5nZSBhbmQg
dGhlIGRyaXZlciBzaG91bGQgYmVoYXZlIGFzIGJlZm9yZS4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9wd20vcHdtLXNpZml2ZS5jIHwgMTQgKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IDZhYmU5MWQyZjIx
Yy4uZWQ3OTU3Y2M1MWZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysr
IGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCkBAIC00MSw3ICs0MSw2IEBACiAjZGVmaW5lIFBX
TV9TSUZJVkVfREVGQVVMVF9QRVJJT0QJMTAwMDAwMDAKIAogc3RydWN0IHB3bV9zaWZpdmVfZGRh
dGEgewotCXN0cnVjdCBwd21fY2hpcAljaGlwOwogCXN0cnVjdCBkZXZpY2UgKnBhcmVudDsKIAlz
dHJ1Y3QgbXV0ZXggbG9jazsgLyogbG9jayB0byBwcm90ZWN0IHVzZXJfY291bnQgYW5kIGFwcHJv
eF9wZXJpb2QgKi8KIAlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgbm90aWZpZXI7CkBAIC01NSw3ICs1
NCw3IEBAIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhIHsKIHN0YXRpYyBpbmxpbmUKIHN0cnVjdCBw
d21fc2lmaXZlX2RkYXRhICpwd21fc2lmaXZlX2NoaXBfdG9fZGRhdGEoc3RydWN0IHB3bV9jaGlw
ICpjaGlwKQogewotCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IHB3bV9zaWZpdmVf
ZGRhdGEsIGNoaXApOworCXJldHVybiBwd21jaGlwX2dldF9kcnZkYXRhKGNoaXApOwogfQogCiBz
dGF0aWMgaW50IHB3bV9zaWZpdmVfcmVxdWVzdChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVj
dCBwd21fZGV2aWNlICpwd20pCkBAIC0yMzEsMTUgKzIzMCwxNCBAQCBzdGF0aWMgaW50IHB3bV9z
aWZpdmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl1MzIgdmFsOwogCXVu
c2lnbmVkIGludCBlbmFibGVkX3B3bXMgPSAwLCBlbmFibGVkX2Nsa3MgPSAxOwogCi0JZGRhdGEg
PSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFk
ZGF0YSkKLQkJcmV0dXJuIC1FTk9NRU07CisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYyhkZXYs
IDQsIHNpemVvZigqZGRhdGEpKTsKKwlpZiAoSVNfRVJSKGNoaXApKQorCQlyZXR1cm4gUFRSX0VS
UihjaGlwKTsKIAorCWRkYXRhID0gcHdtX3NpZml2ZV9jaGlwX3RvX2RkYXRhKGNoaXApOworCWRk
YXRhLT5wYXJlbnQgPSBkZXY7CiAJbXV0ZXhfaW5pdCgmZGRhdGEtPmxvY2spOwotCWNoaXAgPSAm
ZGRhdGEtPmNoaXA7Ci0JY2hpcC0+ZGV2ID0gZGRhdGEtPnBhcmVudCA9IGRldjsKIAljaGlwLT5v
cHMgPSAmcHdtX3NpZml2ZV9vcHM7Ci0JY2hpcC0+bnB3bSA9IDQ7CiAKIAlkZGF0YS0+cmVncyA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKGRk
YXRhLT5yZWdzKSkKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
