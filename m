Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3467AC48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dcyRaQfADpary7S/DXZOJvRm91s053ssKqESp4IDso=; b=XN29QDvX32i9dd
	3p0hvlEaqHch1NXu/HDeLtw4dNMPm7eyLUfjRC/OVDIPa6TUsbljhCj7wQjdcvlMwBj6YITNPUtSX
	DuRyEAcuPJEcN/lw14qxnELa757I1X1lAQTf3HFrY219W7ceuHU8l55CKK7xQz6xVXqkJLssA4H/q
	NM/5a0R2rWrcBHtoRZZFB8zmVuigHR4eKyCEGGLTucXCAZJd0CnUded6Z2SCc5s7fizJHp/8322EJ
	YQ+zmwPoptJIcXvuaA7mqdOO1ugkVphHTRwLfdJd/k6aI2rFt014eCHw7X8m8kE+2NsUocHnChXln
	aeXMdgPKEFNWuIK98f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBhX-0000000CMf1-2kyO;
	Wed, 14 Feb 2024 09:37:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBf8-0000000CKRr-3rQW
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf3-0005aW-AF; Wed, 14 Feb 2024 10:34:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-000fFA-SI; Wed, 14 Feb 2024 10:34:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-004Y6r-2a;
	Wed, 14 Feb 2024 10:34:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 104/164] pwm: sifive: Make use of pwmchip_parent() accessor
Date: Wed, 14 Feb 2024 10:32:31 +0100
Message-ID: <170c3c61707992cbc57dce31f70c168fcd3dbe51.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=yvSEaJYnF7CooEKDOl/Y3z2R+Ytvs9m7kGSX9/DCHgc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjCx1+v/kJVRtfzLCiVQGYhc60gZOm86GULV dms9EZrE5iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIwgAKCRCPgPtYfRL+ ThQcCAChumSvRSxpwTj3umlxZHziiK3tNtRFcerDwhF08tCqzl94WwnIzoys1G27O8aRtDpTplT zQarcYL1zR6psvcRQCsOuvLEIDlic0AGYa+p5gHQ/UV1IkW1e9WTZ0xxYtTTAPKs1ZYpLUn+oj/ Ld1KHPQ2Eart8g/6OppO1irj6yHGEKXKId/F5x3pLUvuDSFPrLW9rDt5XmRnLF+fYsjSllRb8oX eNdeyP1GF2adtN8H+mFqgT8tnKg0GfWS5cELUxXGJa1ry5zOYXsi3rjLYmjun+70BSdqTWe2wPH xcd8oj3ysv+WpSBMYe2INRd+9uyAWRxyVgUJzGATzbLpMPhJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013443_238541_46A6D716 
X-CRM114-Status: GOOD (  11.79  )
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

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzCmRyaXZlciBpbiB0aGUgc2FtZSBjb21taXQgYXMgc3RydWN0IHB3bV9jaGlwOjpk
ZXYsIHVzZSB0aGUgYWNjZXNzb3IKZnVuY3Rpb24gcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBw
dXJwb3NlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKaW5k
ZXggZWQ0MGE2ODdmOTA5Li42YWJlOTFkMmYyMWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3
bS1zaWZpdmUuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKQEAgLTE4Niw3ICsxODYs
NyBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBz
dHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWlmICghZW5hYmxlZCkgewogCQlyZXQgPSBjbGtfZW5h
YmxlKGRkYXRhLT5jbGspOwogCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyKGNoaXAtPmRldiwgIkVu
YWJsZSBjbGsgZmFpbGVkXG4iKTsKKwkJCWRldl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJF
bmFibGUgY2xrIGZhaWxlZFxuIik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfQotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
