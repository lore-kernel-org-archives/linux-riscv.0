Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF32ACCA479
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ib/Xxug3QFeKQ/U0itMCKLzl6WEOGgPHfBCHz1eST8=; b=WVYl+keCEQgrIr
	xje1iaDFI9E7n+TJiW/75RN98VowBQw6qZQxQ1sCLwbzLtcZaTEZwhvcPiPmHYS81B3U0ntrYv8UN
	Z8bpU84PBPQnllb3xC6jMVXCYecGWtgABgoR31cKP2nk+jCQp7veI084avQUgxv6LTyrDjkwtAqbP
	1tdgerjUPAJzkWtCY++T1TeZks8fCCNmgvuKs5pRyXZF74naSAh5MM4LUD0+vStNMQ0LFQtuxIf7g
	qTTaBUxvE2Vl5XEHlAfUBqSfaWZe/gE1nWfQWo7a8wbtLljzJoA0Emwk4RYSRS/TjNhroLDqNfT8v
	Awpgur2Uq7gJJIxF8DLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTF-003rlz-ED; Thu, 21 Jul 2022 10:31:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcl-Ge
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002Vz-QO; Thu, 21 Jul 2022 12:31:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMl-IZ; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSx-006ZIM-JH; Thu, 21 Jul 2022 12:31:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Wan Jiabing <wanjiabing@vivo.com>,
	kernel@pengutronix.de,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yash Shah <yash.shah@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>
Subject: [PATCH 3/7] pwm: sifive: Reduce time the controller lock is held
Date: Thu, 21 Jul 2022 12:31:25 +0200
Message-Id: <20220721103129.304697-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; h=from:subject; bh=J40tL02o9FO4AFx8pwx3mZeFbRQCIoDJSyD9wHvo7Bo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Srys/0egwS0iYQbrd+sk9wZXWLS+eWFR8ARYEas Y8+EXc2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq8gAKCRDB/BR4rcrsCcG1B/ 4ipirIA6LplygiukGiSZZJ+OP+ym5swDwJGcI5D7TWYk/jD+kmQTsvzSnbG2mCSIP16fp1MyZKacCf 96W3WZvxXLQBs4XkAP60pZ2YX/5puZJE77TNMepcAAD18FENyT6EwnfYeeWy3Ben9qjUepVX3iyhhR 7qIlP6yK+fkUnH7ml5OgvkVCTf3sOwYoMoiEEPafbAMlJImjxDxy0OvQagk4X9KQCYkxBfJ8Y4QpUM goss5DoYNMsC3TruNIMaLoeWecmB6+mZgTh3xNE8vgg+4KqT4yQyW1BrjVzIjhhiWAX3a1ZkGJ4X+q FmnEpj4OvVzXhVtxEisAM8PTwPpApB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_575450_E974A2EB 
X-CRM114-Status: GOOD (  14.04  )
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

VGhlIGxvY2sgaXMgb25seSB0byBzZXJpYWxpemUgYWNjZXNzIGFuZCB1cGRhdGUgdG8gdXNlcl9j
b3VudCBhbmQKYXBwcm94X3BlcmlvZCBiZXR3ZWVuIGRpZmZlcmVudCBQV01zIHNlcnZlZCBieSB0
aGUgc2FtZSBwd21fY2hpcC4KU28gdGhlIGxvY2sgbmVlZHMgb25seSB0byBiZSB0YWtlbiBkdXJp
bmcgdGhlIGNoZWNrIGlmIHRoZSAoY2hpcCBnbG9iYWwpCnBlcmlvZCBjYW4gYW5kL29yIG5lZWRz
IHRvIGJlIGNoYW5nZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8
IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCmluZGV4IDkxY2Y5MGJkNDA4My4uNjAxN2UzMTFhODc5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
CkBAIC00MSw3ICs0MSw3IEBACiAKIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhIHsKIAlzdHJ1Y3Qg
cHdtX2NoaXAJY2hpcDsKLQlzdHJ1Y3QgbXV0ZXggbG9jazsgLyogbG9jayB0byBwcm90ZWN0IHVz
ZXJfY291bnQgKi8KKwlzdHJ1Y3QgbXV0ZXggbG9jazsgLyogbG9jayB0byBwcm90ZWN0IHVzZXJf
Y291bnQgYW5kIGFwcHJveF9wZXJpb2QgKi8KIAlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgbm90aWZp
ZXI7CiAJc3RydWN0IGNsayAqY2xrOwogCXZvaWQgX19pb21lbSAqcmVnczsKQEAgLTc2LDYgKzc2
LDcgQEAgc3RhdGljIHZvaWQgcHdtX3NpZml2ZV9mcmVlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwg
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIAltdXRleF91bmxvY2soJmRkYXRhLT5sb2NrKTsKIH0K
IAorLyogQ2FsbGVkIGhvbGRpbmcgZGRhdGEtPmxvY2sgKi8KIHN0YXRpYyB2b2lkIHB3bV9zaWZp
dmVfdXBkYXRlX2Nsb2NrKHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSwKIAkJCQkgICAg
dW5zaWduZWQgbG9uZyByYXRlKQogewpAQCAtMTQ0LDcgKzE0NSw2IEBAIHN0YXRpYyBpbnQgcHdt
X3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20sCiAJCXJldHVybiByZXQ7CiAJfQogCi0JbXV0ZXhfbG9jaygmZGRhdGEtPmxvY2spOwogCWN1
cl9zdGF0ZSA9IHB3bS0+c3RhdGU7CiAJZW5hYmxlZCA9IGN1cl9zdGF0ZS5lbmFibGVkOwogCkBA
IC0xNjMsMTQgKzE2MywxNyBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3
bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCS8qIFRoZSBoYXJkd2FyZSBj
YW5ub3QgZ2VuZXJhdGUgYSAxMDAlIGR1dHkgY3ljbGUgKi8KIAlmcmFjID0gbWluKGZyYWMsICgx
VSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEpOwogCisJbXV0ZXhfbG9jaygmZGRhdGEtPmxv
Y2spOwogCWlmIChzdGF0ZS0+cGVyaW9kICE9IGRkYXRhLT5hcHByb3hfcGVyaW9kKSB7CiAJCWlm
IChkZGF0YS0+dXNlcl9jb3VudCAhPSAxKSB7CisJCQltdXRleF91bmxvY2soJmRkYXRhLT5sb2Nr
KTsKIAkJCXJldCA9IC1FQlVTWTsKIAkJCWdvdG8gZXhpdDsKIAkJfQogCQlkZGF0YS0+YXBwcm94
X3BlcmlvZCA9IHN0YXRlLT5wZXJpb2Q7CiAJCXB3bV9zaWZpdmVfdXBkYXRlX2Nsb2NrKGRkYXRh
LCBjbGtfZ2V0X3JhdGUoZGRhdGEtPmNsaykpOwogCX0KKwltdXRleF91bmxvY2soJmRkYXRhLT5s
b2NrKTsKIAogCXdyaXRlbChmcmFjLCBkZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdNQ01QKHB3
bS0+aHdwd20pKTsKIApAQCAtMTg1LDcgKzE4OCw2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9h
cHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAKIGV4
aXQ6CiAJY2xrX2Rpc2FibGUoZGRhdGEtPmNsayk7Ci0JbXV0ZXhfdW5sb2NrKCZkZGF0YS0+bG9j
ayk7CiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
