Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCA4C61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ7xwrhez45ayCRHWJGt0zcisKobRagC40biKRr4Fhg=; b=cdnCTAdNwEVwtu
	yBCz4dgpCBY7bdMMfsBKbBXHP1k1NwDdc3rp7pg2ZuEV3vOVl+CP9d5SODJpXc/GJNBUJxmJyBZ5d
	mVO57OTVUr7mv92vIU/1WaKPIPxspKPfa+w60p5sITt+MyW81Pr3fGA3o9tWxWiTff1qlh0c/RPiY
	wZ2T7C25xoXaD07gwUTNrkdWOYpzQ3F2tYQqO7SBgBQHI4GuPG9/IroFUU5N+5/9QhEvEBuEzNKUp
	lozr7O+WGZHnd24wYzjw4yeVBf16+JmOw2t/16cSqHxNuQx60zXs4D/RES3RjgvPWt1VIIJSQRcND
	3VBVe+EuM29EdTHiXFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RBe-00GvY5-1C;
	Tue, 21 Nov 2023 13:53:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAe-00GuOp-1W
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 13:52:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAa-0006GG-Eo; Tue, 21 Nov 2023 14:52:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAY-00Ab1Y-0Y; Tue, 21 Nov 2023 14:52:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAX-004xgX-NS; Tue, 21 Nov 2023 14:52:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v3 083/108] pwm: sifive: Make use of devm_pwmchip_alloc() function
Date: Tue, 21 Nov 2023 14:50:25 +0100
Message-ID: <20231121134901.208535-84-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bq6oGUNw3twpEEw3Xxtv6KtBRgfpfqaTqcIAr/U12XQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWo2/ckebPr78FuPrlhSlNEcRHW0SDFawSnu FE5IEuUHYSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1qAAKCRCPgPtYfRL+ Tm4yB/9Q2UkmyOd/IK3SHV3hc2ji0grQMmqPHrd1nXFf+/0joeIH/j2WitSRC8jg+0STOz/ZE89 dLqqsigfURL4IMWWRl6kwVTVb0Ne5S+cPTEaS+jqBLw21FssoixVIGRCKPe3Npzapl55/QqWfEP B7Yjv87a+Dcv+TNMRNTQaapwjniSNGqD+7tqVQXpIsBQIPKx3UZBoUMvZ6KKE/znmGu8JQgPz0O 0K2ZPRrwx7Ngo6QbVpgc3ri09XeZtFZwI6mYeQrnyT94RR12kf+Sc4dvpjsvrnXlVTCogioyuGm LLghtdhRebblOntpnhqc44Zu6vgCtdnu0Yk9dZKCHFGJNaOY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055208_557382_A9FE10A0 
X-CRM114-Status: GOOD (  15.71  )
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
cy9wd20vcHdtLXNpZml2ZS5jIHwgMjggKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpp
bmRleCBjMWI0MTI5MDVkOWUuLjk5YjdlOTgxY2RkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpAQCAtNDEsNyArNDEs
NyBAQAogI2RlZmluZSBQV01fU0lGSVZFX0RFRkFVTFRfUEVSSU9ECTEwMDAwMDAwCiAKIHN0cnVj
dCBwd21fc2lmaXZlX2RkYXRhIHsKLQlzdHJ1Y3QgcHdtX2NoaXAJY2hpcDsKKwlzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXA7CiAJc3RydWN0IG11dGV4IGxvY2s7IC8qIGxvY2sgdG8gcHJvdGVjdCB1c2Vy
X2NvdW50IGFuZCBhcHByb3hfcGVyaW9kICovCiAJc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5vdGlm
aWVyOwogCXN0cnVjdCBjbGsgKmNsazsKQEAgLTU0LDcgKzU0LDcgQEAgc3RydWN0IHB3bV9zaWZp
dmVfZGRhdGEgewogc3RhdGljIGlubGluZQogc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKnB3bV9z
aWZpdmVfY2hpcF90b19kZGF0YShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiB7Ci0JcmV0dXJuIGNv
bnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSwgY2hpcCk7CisJcmV0dXJu
IHB3bWNoaXBfcHJpdihjaGlwKTsKIH0KIAogc3RhdGljIGludCBwd21fc2lmaXZlX3JlcXVlc3Qo
c3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQpAQCAtMTAyLDcg
KzEwMiw3IEBAIHN0YXRpYyB2b2lkIHB3bV9zaWZpdmVfdXBkYXRlX2Nsb2NrKHN0cnVjdCBwd21f
c2lmaXZlX2RkYXRhICpkZGF0YSwKIAkvKiBBcyBzY2FsZSA8PSAxNSB0aGUgc2hpZnQgb3BlcmF0
aW9uIGNhbm5vdCBvdmVyZmxvdy4gKi8KIAludW0gPSAodW5zaWduZWQgbG9uZyBsb25nKU5TRUNf
UEVSX1NFQyA8PCAoUFdNX1NJRklWRV9DTVBXSURUSCArIHNjYWxlKTsKIAlkZGF0YS0+cmVhbF9w
ZXJpb2QgPSBkaXY2NF91bChudW0sIHJhdGUpOwotCWRldl9kYmcocHdtY2hpcF9wYXJlbnQoJmRk
YXRhLT5jaGlwKSwKKwlkZXZfZGJnKHB3bWNoaXBfcGFyZW50KGRkYXRhLT5jaGlwKSwKIAkJIk5l
dyByZWFsX3BlcmlvZCA9ICV1IG5zXG4iLCBkZGF0YS0+cmVhbF9wZXJpb2QpOwogfQogCkBAIC0y
MzAsMTUgKzIzMCwxNCBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAl1MzIgdmFsOwogCXVuc2lnbmVkIGludCBlbmFibGVkX3B3bXMg
PSAwLCBlbmFibGVkX2Nsa3MgPSAxOwogCi0JZGRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFkZGF0YSkKLQkJcmV0dXJuIC1FTk9NRU07
CisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYyhkZXYsIDQsIHNpemVvZigqZGRhdGEpKTsKKwlp
ZiAoSVNfRVJSKGNoaXApKQorCQlyZXR1cm4gUFRSX0VSUihjaGlwKTsKKwlkZGF0YSA9IHB3bV9z
aWZpdmVfY2hpcF90b19kZGF0YShjaGlwKTsKKwlkZGF0YS0+Y2hpcCA9IGNoaXA7CiAKIAltdXRl
eF9pbml0KCZkZGF0YS0+bG9jayk7Ci0JY2hpcCA9ICZkZGF0YS0+Y2hpcDsKLQljaGlwLT5kZXYg
PSBkZXY7CiAJY2hpcC0+b3BzID0gJnB3bV9zaWZpdmVfb3BzOwotCWNoaXAtPm5wd20gPSA0Owog
CiAJZGRhdGEtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7
CiAJaWYgKElTX0VSUihkZGF0YS0+cmVncykpCkBAIC0yOTYsNyArMjk1LDcgQEAgc3RhdGljIGlu
dCBwd21fc2lmaXZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWdvdG8g
dW5yZWdpc3Rlcl9jbGs7CiAJfQogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGRhdGEp
OworCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGNoaXApOwogCWRldl9kYmcoZGV2LCAiU2lG
aXZlIFBXTSBjaGlwIHJlZ2lzdGVyZWQgJWQgUFdNc1xuIiwgY2hpcC0+bnB3bSk7CiAKIAlyZXR1
cm4gMDsKQEAgLTMxNCwxNSArMzEzLDE2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHB3bV9zaWZpdmVf
ZGRhdGEgKmRkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3QgcHdtX2No
aXAgKmNoaXAgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBwd21fc2lmaXZl
X2RkYXRhICpkZGF0YSA9IHB3bV9zaWZpdmVfY2hpcF90b19kZGF0YShjaGlwKTsKIAlzdHJ1Y3Qg
cHdtX2RldmljZSAqcHdtOwogCWludCBjaDsKIAotCXB3bWNoaXBfcmVtb3ZlKCZkZGF0YS0+Y2hp
cCk7CisJcHdtY2hpcF9yZW1vdmUoY2hpcCk7CiAJY2xrX25vdGlmaWVyX3VucmVnaXN0ZXIoZGRh
dGEtPmNsaywgJmRkYXRhLT5ub3RpZmllcik7CiAKLQlmb3IgKGNoID0gMDsgY2ggPCBkZGF0YS0+
Y2hpcC5ucHdtOyBjaCsrKSB7Ci0JCXB3bSA9ICZkZGF0YS0+Y2hpcC5wd21zW2NoXTsKKwlmb3Ig
KGNoID0gMDsgY2ggPCBjaGlwLT5ucHdtOyBjaCsrKSB7CisJCXB3bSA9ICZjaGlwLT5wd21zW2No
XTsKIAkJaWYgKHB3bS0+c3RhdGUuZW5hYmxlZCkKIAkJCWNsa19kaXNhYmxlKGRkYXRhLT5jbGsp
OwogCX0KLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
