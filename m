Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42187C77B6C
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7fq4h5MjsaTretSxM4RwJxMVPtXUb2p0g4mTrkH3gw=; b=sbe12+J8r6cd6Y
	BGmCvjGRs1ZCE5uZXp78e4hEI9IyAZv0SQVzka1HyYKBkSxmfoyxdoCMaKyVPXCqt93TzezsFiM1O
	q/MKzUn8Y/yPDjwcE7sUGux9xXyFuyaBU4MtABGzXXYJ3GNnRRzdb5DUNBIoesjqMyCbCbe8hNeIm
	Y8aYNZWNGkfWZ/x5aaCNAK+shjj9UCKstc+fOPEZPqwMnuSoRsCJR1RzK14b2Ixl13/LyhsTBo5Wh
	veU9b0PckOxnQovfY85P6G0SV3ygBcEBCFpQpnYo+AKXihG0QVq9cPSZH6I7bwIcvGykhWCc0aWqX
	jBooqSnqs38jOjGjikpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qF-004cSN-0e;
	Wed, 05 Apr 2023 14:10:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qC-004cRF-38
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 14:10:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q5-0003FN-2p; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q4-009Abm-57; Wed, 05 Apr 2023 16:10:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q3-00AmTv-DA; Wed, 05 Apr 2023 16:10:15 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 04/10] usb: musb: mpfs: Convert to platform remove callback returning void
Date: Wed,  5 Apr 2023 16:10:03 +0200
Message-Id: <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=33gaBA4Y6a4NaItjwqP6ZDVvbHUivrlSDU1JTOlXqYo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE0cAo6wW2W/ZfnRAyWEZgKaGnL27Sw/5V1a LwcHR5o0XWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BNAAKCRCPgPtYfRL+ TloSCACUkxuwkt7CPpgYZVAcJzKsyqRMZO+aTxnp616JRovzeEwiFsPb+C4pFnc+NSBISz3IIx/ yMr193y0Oji9VxGuiPzrJTR0iyHHgkfmt6E2drYrn2rKhIpGNE2/luuWcqUDuLX4nIPiOSKBl0G SzrIa9PXzc4KsIND0i6xATDxPHjB4ZRnodvJj254eyO+xUlDf2gO+RFlY3nsz9RYMPlNAXwQVz+ ClFoETrLnGGduLle/ZMzGhbJozjo2MbjoJPwiy5Ujv2q0gUT2aKhICo4wkPxO5pM6as8+G2w2WP QJkmGjMYlTIqpI6FYMxQacYLEYS9XRTldpPcHq6+H7L2kiTJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_071025_006829_B4F763E8 
X-CRM114-Status: GOOD (  14.94  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy91c2IvbXVzYi9tcGZzLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdXNiL21w
ZnMuYyBiL2RyaXZlcnMvdXNiL211c2IvbXBmcy5jCmluZGV4IGNlYTJlODEwODg2Ny4uMjRiOTg3
MTZmN2ZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9tdXNiL21wZnMuYworKysgYi9kcml2ZXJz
L3VzYi9tdXNiL21wZnMuYwpAQCAtMjM1LDE1ICsyMzUsMTMgQEAgc3RhdGljIGludCBtcGZzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3Rh
dGljIGludCBtcGZzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGlj
IHZvaWQgbXBmc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3QgbXBmc19nbHVlICpnbHVlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKIAljbGtf
ZGlzYWJsZV91bnByZXBhcmUoZ2x1ZS0+Y2xrKTsKIAlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rl
cihnbHVlLT5tdXNiKTsKIAl1c2JfcGh5X2dlbmVyaWNfdW5yZWdpc3RlcihwZGV2KTsKLQotCXJl
dHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX09GCkBAIC0yNTYsNyArMjU0LDcgQEAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbXBmc19pZF90YWJsZSk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIG1wZnNfbXVzYl9kcml2ZXIgPSB7CiAJLnByb2JlID0gbXBmc19wcm9iZSwKLQku
cmVtb3ZlID0gbXBmc19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtcGZzX3JlbW92ZSwKIAkuZHJp
dmVyID0gewogCQkubmFtZSA9ICJtcGZzLW11c2IiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIobXBmc19pZF90YWJsZSkKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
