Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF959C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWkfkKCBE5527lvOGrLWtY+4fksQ09IZyYunPwHEcqk=; b=RtXDKcPUTLkxF/
	mL6c55GL6vTWShBIsF2FfXouSBNIk68gU0sllM7CEujCEa85nHGAT960Zo11qDdKW/E6sFEku3SLa
	qZ3aaxGFiBvpnAxeVWJVvaKUXJITPGZn2wB1z3lGuAKQh4dyCKflhMTw0wbt9n+ubCuXo2NARQINg
	CjVqiETfydDnNKrJKJQVnKhCyc0bsqGMwFAJa8ZaNbL922Ta1ZNHGl7lTXHzSDcZxJSpR5R1luG1C
	IUIAKlAerM60SKwH9sfxbVTF4jPAv3yE5rR3GsMP+IOHyKHhEVIPYqmLpVdxszPAbNaK8bfLmUxAx
	UgyBrwV50aU9KkIiMmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqQA-00A88B-0g;
	Wed, 06 Dec 2023 11:50:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOQ-00A6Jw-0V
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:48:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOL-0007LU-U1; Wed, 06 Dec 2023 12:48:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOJ-00Dwwt-AX; Wed, 06 Dec 2023 12:48:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOJ-00FR2M-1Z; Wed, 06 Dec 2023 12:48:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 089/115] pwm: sifive: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:44:43 +0100
Message-ID: <500a4f39531bd5fc61eb8ac0092e34d4b1ae2cc0.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=o6rhBlavP1G4sD6ilBFg/xAZ7zerFcGXPH8hYzLL2oM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF8O3CicVdLVjfFqkGuk09ZhGKvN/EkTIYnHk Caq7gZBXJyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBfDgAKCRCPgPtYfRL+ TjwcB/9Av4b+3WV78h6voXb5a747xNA+gK+JnqAx8lSwANpz4mfPNFThkVS6CC7xagANDaj8VcQ Fpo4O0EoBaCniS3b/PatFEdWmG0tL9uCa4d8LxqHwcd5XorNjI7ZAPclpcWNpmCVdJ0sdoXDtan 0EMPyMUj37Cp6cJVRuRqHRH6r0WmDCeVGB+08NZ7jNfk9fVeP/0nGlWkvveYhIBEmbdBaA8paEr gkebz3zuKi6OljGN84+IJHb6g1eRLyGsY5sC7czQH0T8lMSJbTVKGhu3OJ84n283DKjanweFAyj JcMybUKyh1xhcHPuUbs23RRIeEQct4WTEwBNhrAsV5vsn89/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_034842_239354_ABD42E62 
X-CRM114-Status: GOOD (  14.93  )
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
bmRleCBjMWI0MTI5MDVkOWUuLmNmM2ZjZmZlN2IzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpAQCAtNDEsNyArNDEs
NyBAQAogI2RlZmluZSBQV01fU0lGSVZFX0RFRkFVTFRfUEVSSU9ECTEwMDAwMDAwCiAKIHN0cnVj
dCBwd21fc2lmaXZlX2RkYXRhIHsKLQlzdHJ1Y3QgcHdtX2NoaXAJY2hpcDsKKwlzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXA7CiAJc3RydWN0IG11dGV4IGxvY2s7IC8qIGxvY2sgdG8gcHJvdGVjdCB1c2Vy
X2NvdW50IGFuZCBhcHByb3hfcGVyaW9kICovCiAJc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5vdGlm
aWVyOwogCXN0cnVjdCBjbGsgKmNsazsKQEAgLTU0LDcgKzU0LDcgQEAgc3RydWN0IHB3bV9zaWZp
dmVfZGRhdGEgewogc3RhdGljIGlubGluZQogc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKnB3bV9z
aWZpdmVfY2hpcF90b19kZGF0YShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiB7Ci0JcmV0dXJuIGNv
bnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSwgY2hpcCk7CisJcmV0dXJu
IHB3bWNoaXBfZ2V0X2RydmRhdGEoY2hpcCk7CiB9CiAKIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9y
ZXF1ZXN0KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKQEAg
LTEwMiw3ICsxMDIsNyBAQCBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3VwZGF0ZV9jbG9jayhzdHJ1
Y3QgcHdtX3NpZml2ZV9kZGF0YSAqZGRhdGEsCiAJLyogQXMgc2NhbGUgPD0gMTUgdGhlIHNoaWZ0
IG9wZXJhdGlvbiBjYW5ub3Qgb3ZlcmZsb3cuICovCiAJbnVtID0gKHVuc2lnbmVkIGxvbmcgbG9u
ZylOU0VDX1BFUl9TRUMgPDwgKFBXTV9TSUZJVkVfQ01QV0lEVEggKyBzY2FsZSk7CiAJZGRhdGEt
PnJlYWxfcGVyaW9kID0gZGl2NjRfdWwobnVtLCByYXRlKTsKLQlkZXZfZGJnKHB3bWNoaXBfcGFy
ZW50KCZkZGF0YS0+Y2hpcCksCisJZGV2X2RiZyhwd21jaGlwX3BhcmVudChkZGF0YS0+Y2hpcCks
CiAJCSJOZXcgcmVhbF9wZXJpb2QgPSAldSBuc1xuIiwgZGRhdGEtPnJlYWxfcGVyaW9kKTsKIH0K
IApAQCAtMjMwLDE1ICsyMzAsMTQgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdTMyIHZhbDsKIAl1bnNpZ25lZCBpbnQgZW5hYmxl
ZF9wd21zID0gMCwgZW5hYmxlZF9jbGtzID0gMTsKIAotCWRkYXRhID0gZGV2bV9remFsbG9jKGRl
diwgc2l6ZW9mKCpkZGF0YSksIEdGUF9LRVJORUwpOwotCWlmICghZGRhdGEpCi0JCXJldHVybiAt
RU5PTUVNOworCWNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2MoZGV2LCA0LCBzaXplb2YoKmRkYXRh
KSk7CisJaWYgKElTX0VSUihjaGlwKSkKKwkJcmV0dXJuIFBUUl9FUlIoY2hpcCk7CisJZGRhdGEg
PSBwd21fc2lmaXZlX2NoaXBfdG9fZGRhdGEoY2hpcCk7CisJZGRhdGEtPmNoaXAgPSBjaGlwOwog
CiAJbXV0ZXhfaW5pdCgmZGRhdGEtPmxvY2spOwotCWNoaXAgPSAmZGRhdGEtPmNoaXA7Ci0JY2hp
cC0+ZGV2ID0gZGV2OwogCWNoaXAtPm9wcyA9ICZwd21fc2lmaXZlX29wczsKLQljaGlwLT5ucHdt
ID0gNDsKIAogCWRkYXRhLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBk
ZXYsIDApOwogCWlmIChJU19FUlIoZGRhdGEtPnJlZ3MpKQpAQCAtMjk2LDcgKzI5NSw3IEBAIHN0
YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CQlnb3RvIHVucmVnaXN0ZXJfY2xrOwogCX0KIAotCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYs
IGRkYXRhKTsKKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjaGlwKTsKIAlkZXZfZGJnKGRl
diwgIlNpRml2ZSBQV00gY2hpcCByZWdpc3RlcmVkICVkIFBXTXNcbiIsIGNoaXAtPm5wd20pOwog
CiAJcmV0dXJuIDA7CkBAIC0zMTQsMTUgKzMxMywxNiBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogc3RhdGljIHZvaWQgcHdtX3Np
Zml2ZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogewotCXN0cnVjdCBwd21f
c2lmaXZlX2RkYXRhICpkZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGRldik7CisJc3RydWN0
IHB3bV9jaGlwICpjaGlwID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3QgcHdt
X3NpZml2ZV9kZGF0YSAqZGRhdGEgPSBwd21fc2lmaXZlX2NoaXBfdG9fZGRhdGEoY2hpcCk7CiAJ
c3RydWN0IHB3bV9kZXZpY2UgKnB3bTsKIAlpbnQgY2g7CiAKLQlwd21jaGlwX3JlbW92ZSgmZGRh
dGEtPmNoaXApOworCXB3bWNoaXBfcmVtb3ZlKGNoaXApOwogCWNsa19ub3RpZmllcl91bnJlZ2lz
dGVyKGRkYXRhLT5jbGssICZkZGF0YS0+bm90aWZpZXIpOwogCi0JZm9yIChjaCA9IDA7IGNoIDwg
ZGRhdGEtPmNoaXAubnB3bTsgY2grKykgewotCQlwd20gPSAmZGRhdGEtPmNoaXAucHdtc1tjaF07
CisJZm9yIChjaCA9IDA7IGNoIDwgY2hpcC0+bnB3bTsgY2grKykgeworCQlwd20gPSAmY2hpcC0+
cHdtc1tjaF07CiAJCWlmIChwd20tPnN0YXRlLmVuYWJsZWQpCiAJCQljbGtfZGlzYWJsZShkZGF0
YS0+Y2xrKTsKIAl9Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
