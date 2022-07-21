Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92114C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CRtUVuspOEXdcjzwqbAmdbpK6z/kHIS8C5gtwskBOz8=; b=FNREgPponwJ/Jw
	9LWt2wreWdeVom8rFNn3rkoLGAd2X3m7npbBtOkhQgc0hvYR+F9/YBSy95F3jbuCQEajKcvuRSYV/
	Gexgvv5xBPl8au96NzHrPWgRmlPgU7Y69LAf5izT2yaPhGRxGKjdCVnuF0l+ctXfCiCzhylAPn91y
	6yBnl4/ESMiipQgSlrNs0DpkhgTgRamEWm7UseHscJgki+9+vqh53NKkuZ0XwRfojJKjEhGNMqJjD
	TzZ3b08eqCkusmxRg6c2gVoqIsrBv+AvbqOYDazxJNN0SZnwC15D+8IlAIzXsaqByTuBVio2jLZSW
	rAeYvfnqRDnWPao6Im4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTL-003rpW-3h; Thu, 21 Jul 2022 10:31:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcq-OR
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002Vw-QO; Thu, 21 Jul 2022 12:31:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMc-9X; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSx-006ZIG-8g; Thu, 21 Jul 2022 12:31:35 +0200
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
Subject: [PATCH 1/7] pwm: sifive: Simplify offset calculation for PWMCMP registers
Date: Thu, 21 Jul 2022 12:31:23 +0200
Message-Id: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206; h=from:subject; bh=S9GIGL+Cct/zyqgr/ikWe3LQhbttxTcRa9DxXEHmNkE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2SrrxbR6WH/xT1XiSbvMGpd7KdnUxvzpxZ52l/3U 7p4plO2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq6wAKCRDB/BR4rcrsCdCLCA ChSWsJTopykEY66sAPoljOUbgwbe5BclCZKRJyMy7TtVK5CtIsUs5cBly/ahVIJX4fFuX012X++rop WkUTBtyyB2GNIwvjL4PapHBuV2zOdrljrtPEyjZ2bJGh+4fEXQJR8u6aHpcGaWKoodorvT+OzhegBl 3C9isWIU/SJeALqb9OPWT6tSV3WAjJ1T4o6XnsxuJhKJvq5bEJWqYwIyizoGD/UT7w6BRHrnEUjDSx L45pMXhfRf6aI7ozoSaTE9oq0bppgFSu4rW61kqx5yxzSHiWlgGdis5CAkAFdNktUjpOJY+J/GE7wR 9uIJP94GSbMvn6Th/K02QgD1lFOlj7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_838530_29DE86C3 
X-CRM114-Status: GOOD (  13.80  )
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

SW5zdGVhZCBvZiBleHBsaWNpdGx5IHVzaW5nIFBXTV9TSUZJVkVfUFdNQ01QMCArIHB3bS0+aHdw
d20gKgpQV01fU0lGSVZFX1NJWkVfUFdNQ01QIGZvciBlYWNoIGFjY2VzcyB0byBvbmUgb2YgdGhl
IFBXTUNNUCByZWdpc3RlcnMsCmludHJvZHVjZSBhIG1hY3JvIHRoYXQgdGFrZXMgdGhlIGh3cHdt
IGlkIGFzIHBhcmFtZXRlci4KCkZvciB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiB1c2luZyBhIHBs
YWluIDQgaW5zdGVhZCBvZiB0aGUgY3BwIGNvbnN0YW50ClBXTV9TSUZJVkVfU0laRV9QV01DTVAg
aXMgZWFzaWVyIHRvIHJlYWQsIHNvIGRlZmluZSB0aGUgb2Zmc2V0IG1hY3JvCndpdGhvdXQgdGhl
IGNvbnN0YW50LiBUaGUgbGF0dGVyIGNhbiB0aGVuIGJlIGRyb3BwZWQgYXMgdGhlcmUgYXJlIG5v
CnVzZXJzIGxlZnQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDEw
ICsrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCmluZGV4IGU2ZDA1YTMyOTAwMi4uYjdmYzMzYjA4ZDgyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
CkBAIC0yMyw3ICsyMyw3IEBACiAjZGVmaW5lIFBXTV9TSUZJVkVfUFdNQ0ZHCQkweDAKICNkZWZp
bmUgUFdNX1NJRklWRV9QV01DT1VOVAkJMHg4CiAjZGVmaW5lIFBXTV9TSUZJVkVfUFdNUwkJCTB4
MTAKLSNkZWZpbmUgUFdNX1NJRklWRV9QV01DTVAwCQkweDIwCisjZGVmaW5lIFBXTV9TSUZJVkVf
UFdNQ01QKGkpCQkoMHgyMCArIDQgKiAoaSkpCiAKIC8qIFBXTUNGRyBmaWVsZHMgKi8KICNkZWZp
bmUgUFdNX1NJRklWRV9QV01DRkdfU0NBTEUJCUdFTk1BU0soMywgMCkKQEAgLTM2LDggKzM2LDYg
QEAKICNkZWZpbmUgUFdNX1NJRklWRV9QV01DRkdfR0FORwkJQklUKDI0KQogI2RlZmluZSBQV01f
U0lGSVZFX1BXTUNGR19JUAkJQklUKDI4KQogCi0vKiBQV01fU0lGSVZFX1NJWkVfUFdNQ01QIGlz
IHVzZWQgdG8gY2FsY3VsYXRlIG9mZnNldCBmb3IgcHdtY21wWCByZWdpc3RlcnMgKi8KLSNkZWZp
bmUgUFdNX1NJRklWRV9TSVpFX1BXTUNNUAkJNAogI2RlZmluZSBQV01fU0lGSVZFX0NNUFdJRFRI
CQkxNgogI2RlZmluZSBQV01fU0lGSVZFX0RFRkFVTFRfUEVSSU9ECTEwMDAwMDAwCiAKQEAgLTEx
Miw4ICsxMTAsNyBAQCBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX2dldF9zdGF0ZShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJc3RydWN0IHB3bV9zaWZpdmVf
ZGRhdGEgKmRkYXRhID0gcHdtX3NpZml2ZV9jaGlwX3RvX2RkYXRhKGNoaXApOwogCXUzMiBkdXR5
LCB2YWw7CiAKLQlkdXR5ID0gcmVhZGwoZGRhdGEtPnJlZ3MgKyBQV01fU0lGSVZFX1BXTUNNUDAg
KwotCQkgICAgIHB3bS0+aHdwd20gKiBQV01fU0lGSVZFX1NJWkVfUFdNQ01QKTsKKwlkdXR5ID0g
cmVhZGwoZGRhdGEtPnJlZ3MgKyBQV01fU0lGSVZFX1BXTUNNUChwd20tPmh3cHdtKSk7CiAKIAlz
dGF0ZS0+ZW5hYmxlZCA9IGR1dHkgPiAwOwogCkBAIC0xOTMsOCArMTkwLDcgQEAgc3RhdGljIGlu
dCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKIAkJcHdtX3NpZml2ZV91cGRhdGVfY2xvY2soZGRhdGEsIGNsa19nZXRfcmF0ZShk
ZGF0YS0+Y2xrKSk7CiAJfQogCi0Jd3JpdGVsKGZyYWMsIGRkYXRhLT5yZWdzICsgUFdNX1NJRklW
RV9QV01DTVAwICsKLQkgICAgICAgcHdtLT5od3B3bSAqIFBXTV9TSUZJVkVfU0laRV9QV01DTVAp
OworCXdyaXRlbChmcmFjLCBkZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdNQ01QKHB3bS0+aHdw
d20pKTsKIAogCWlmIChzdGF0ZS0+ZW5hYmxlZCAhPSBlbmFibGVkKQogCQlwd21fc2lmaXZlX2Vu
YWJsZShjaGlwLCBzdGF0ZS0+ZW5hYmxlZCk7CgpiYXNlLWNvbW1pdDogZjI5MDZhYTg2MzM4MWFm
YjAwMTVhOWViN2ZlZmFkODg1ZDRlNWE1NgotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
