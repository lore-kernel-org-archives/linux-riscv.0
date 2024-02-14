Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F44CC48BEE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+7wIwLe7tazaqoHbs+XDYt2cA52aWWd/nad9rY4P9M=; b=m3T4+/whj6zqbM
	sjFk6mVxxXeiuiKGZOb2Cs8+JTcrV0p+mBlPdHnsBMz2VQmzj3fNUscVcj0xsLnsGHN0CZEvyMn6X
	94UbGZUEQ5GMdZanq4lcIV8/3k9hKiI6SSFsi5hwbT2qJ1xooQQxoxtJrXZEUbSlF0hHLG/k64qE1
	uOKmLO28fKVVtpccdeTUYxACdjZsWup2muH3JxgSUZK40EvsNHTONh9PknzMYGO6aQ7W9R/RLunrC
	SIiB22WQOEy85Cza7Wm6HsQYGVSCTgciWnIlpX+X63gg0oAbSEGEbijo6mCugXxyqQTiuuYyzHBsg
	WHoXyQqaX3LngEhb69mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBhO-0000000CMXJ-3y2X;
	Wed, 14 Feb 2024 09:37:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBf7-0000000CKQo-2Hp6
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf3-0005ZL-4w; Wed, 14 Feb 2024 10:34:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-000fF7-NF; Wed, 14 Feb 2024 10:34:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-004Y6n-24;
	Wed, 14 Feb 2024 10:34:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 103/164] pwm: sifive: Prepare removing pwm_chip from driver data
Date: Wed, 14 Feb 2024 10:32:30 +0100
Message-ID: <b7b7985f4dc746f6a36c5048d428c4ed0a2d42dc.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=TS2SuJjkwNJtPUY3FsLwiCtm+q1TFZUqoQ0gsqhcsk4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjBwJd/Jn3oPTdIFr2TkHHzIyM9JaeylwF63 BUOLSlf5A+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIwQAKCRCPgPtYfRL+ Ts0jB/sGYEEaeYWtPA2Dg9FaCXYJzf8tYUyJ72AJZ7KMt8vahWTJgiVMa5ptB3HmBx3VPW3Nutt rwC7cSQKZ7GF5rklLLW9HULeedGp5OYA/oKZYObVJl3pTXzh/vBqPo5SaQpjhv3WE6fmqhStViu 8X27P8tPQuWik1QhXA53L0zTx8HcPx2T4k+FTpNdJ1CYeRJjDkn7qvPyVY+x3/F2PI+uha/RsUk xZt2tuPbvlv8MxIY+9UG9ARypRty9UUdHbyOy+8o+Ik1OpagZhT63mxF8MtpInke9i+m292jDxL CYCbRUu6MFySs+LwmNpybXT9PLlrFCwm1s0PnGQaUi8mB6Fm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013441_864863_C46C0099 
X-CRM114-Status: GOOD (  15.54  )
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

VGhpcyBwcmVwYXJlcyB0aGUgZHJpdmVyIGZvciBmdXJ0aGVyIGNoYW5nZXMgdGhhdCB3aWxsIGRy
b3Agc3RydWN0CnB3bV9jaGlwIGNoaXAgZnJvbSBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YS4gVXNl
IHRoZSBwd21fY2hpcCBhcyBkcml2ZXIKZGF0YSBpbnN0ZWFkIG9mIHRoZSBwd21fc2lmaXZlX2Rk
YXRhIHRvIGdldCBhY2Nlc3MgdG8gdGhlIHB3bV9jaGlwIGluCnB3bV9zaWZpdmVfcmVtb3ZlKCkg
d2l0aG91dCB1c2luZyBkZGF0YS0+Y2hpcC4gSW4gdGhlIGNsb2NrIHJhdGUKbm90aWZpZXIgaXQn
cyBub3QgcG9zc2libGUgdG8gZ2V0IHRoZSBwd21fY2hpcCB3aXRob3V0IGFkZGluZyBhIHBvaW50
ZXIKdG8gdGhpcyB0byBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YS4gSW5zdGVhZCBvZiB0aGF0IGFk
ZCBhIHBhcmVudCBkZXZpY2UKcG9pbnRlciB3aGljaCBpcyBhbGwgdGhhdCBpcyBuZWVkZWQgdGhl
cmUuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDE2ICsrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdt
LXNpZml2ZS5jCmluZGV4IGNmMDBmOTAyZmMzMC4uZWQ0MGE2ODdmOTA5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCkBA
IC00Miw2ICs0Miw3IEBACiAKIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhIHsKIAlzdHJ1Y3QgcHdt
X2NoaXAJY2hpcDsKKwlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQ7CiAJc3RydWN0IG11dGV4IGxvY2s7
IC8qIGxvY2sgdG8gcHJvdGVjdCB1c2VyX2NvdW50IGFuZCBhcHByb3hfcGVyaW9kICovCiAJc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrIG5vdGlmaWVyOwogCXN0cnVjdCBjbGsgKmNsazsKQEAgLTEwMiw3
ICsxMDMsNyBAQCBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3VwZGF0ZV9jbG9jayhzdHJ1Y3QgcHdt
X3NpZml2ZV9kZGF0YSAqZGRhdGEsCiAJLyogQXMgc2NhbGUgPD0gMTUgdGhlIHNoaWZ0IG9wZXJh
dGlvbiBjYW5ub3Qgb3ZlcmZsb3cuICovCiAJbnVtID0gKHVuc2lnbmVkIGxvbmcgbG9uZylOU0VD
X1BFUl9TRUMgPDwgKFBXTV9TSUZJVkVfQ01QV0lEVEggKyBzY2FsZSk7CiAJZGRhdGEtPnJlYWxf
cGVyaW9kID0gZGl2NjRfdWwobnVtLCByYXRlKTsKLQlkZXZfZGJnKGRkYXRhLT5jaGlwLmRldiwK
KwlkZXZfZGJnKGRkYXRhLT5wYXJlbnQsCiAJCSJOZXcgcmVhbF9wZXJpb2QgPSAldSBuc1xuIiwg
ZGRhdGEtPnJlYWxfcGVyaW9kKTsKIH0KIApAQCAtMjM2LDcgKzIzNyw3IEBAIHN0YXRpYyBpbnQg
cHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJbXV0ZXhf
aW5pdCgmZGRhdGEtPmxvY2spOwogCWNoaXAgPSAmZGRhdGEtPmNoaXA7Ci0JY2hpcC0+ZGV2ID0g
ZGV2OworCWNoaXAtPmRldiA9IGRkYXRhLT5wYXJlbnQgPSBkZXY7CiAJY2hpcC0+b3BzID0gJnB3
bV9zaWZpdmVfb3BzOwogCWNoaXAtPm5wd20gPSA0OwogCkBAIC0yOTYsNyArMjk3LDcgQEAgc3Rh
dGljIGludCBwd21fc2lmaXZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
CWdvdG8gdW5yZWdpc3Rlcl9jbGs7CiAJfQogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
ZGRhdGEpOworCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGNoaXApOwogCWRldl9kYmcoZGV2
LCAiU2lGaXZlIFBXTSBjaGlwIHJlZ2lzdGVyZWQgJWQgUFdNc1xuIiwgY2hpcC0+bnB3bSk7CiAK
IAlyZXR1cm4gMDsKQEAgLTMxNCwxNSArMzE1LDE2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMgdm9pZCBwd21fc2lm
aXZlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHB3bV9z
aWZpdmVfZGRhdGEgKmRkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXAgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBwd21f
c2lmaXZlX2RkYXRhICpkZGF0YSA9IHB3bV9zaWZpdmVfY2hpcF90b19kZGF0YShjaGlwKTsKIAlz
dHJ1Y3QgcHdtX2RldmljZSAqcHdtOwogCWludCBjaDsKIAotCXB3bWNoaXBfcmVtb3ZlKCZkZGF0
YS0+Y2hpcCk7CisJcHdtY2hpcF9yZW1vdmUoY2hpcCk7CiAJY2xrX25vdGlmaWVyX3VucmVnaXN0
ZXIoZGRhdGEtPmNsaywgJmRkYXRhLT5ub3RpZmllcik7CiAKLQlmb3IgKGNoID0gMDsgY2ggPCBk
ZGF0YS0+Y2hpcC5ucHdtOyBjaCsrKSB7Ci0JCXB3bSA9ICZkZGF0YS0+Y2hpcC5wd21zW2NoXTsK
Kwlmb3IgKGNoID0gMDsgY2ggPCBjaGlwLT5ucHdtOyBjaCsrKSB7CisJCXB3bSA9ICZjaGlwLT5w
d21zW2NoXTsKIAkJaWYgKHB3bS0+c3RhdGUuZW5hYmxlZCkKIAkJCWNsa19kaXNhYmxlKGRkYXRh
LT5jbGspOwogCX0KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
