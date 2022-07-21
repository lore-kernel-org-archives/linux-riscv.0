Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FAFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLFcDvyDj/C++kpiwKomAuYVq5TURh5hNAseLt5iaPc=; b=1imBS1OwSfde7V
	o9A/+au7lpJkHRir2TUEETIbibBF+fNr17KODEB7c4jt0PtGyHsru95Nyh4dHyfJoZ8drFuNjt8QV
	YpRorqaHhAf2IxID9ex/K6TDJcDElo/tEmcZhPdNLPsNecnZZ1qcw+Dc9Ux50s71p4Rg8WmmPmXH7
	IEDW7fqp9JEBQVESnWkcaWRYJ/6TI26jZq5Qb/7O3sgcGJRWbTl9iIyURcHUTfJeQZ1Mp6nowaep3
	JKNjYI5kFHOovGzRooRmHSiU3lRhVvWuDYax4V6hSffcyvCaK8ibXln+M+qOVpFXCiSkZ2HmkMPMn
	8svaX1WxP4T+XRtZXLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTG-003rn4-Pc; Thu, 21 Jul 2022 10:31:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rco-Ke
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002Vx-QO; Thu, 21 Jul 2022 12:31:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMg-FZ; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSx-006ZIJ-Dh; Thu, 21 Jul 2022 12:31:35 +0200
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
Subject: [PATCH 2/7] pwm: sifive: Fold pwm_sifive_enable() into its only caller
Date: Thu, 21 Jul 2022 12:31:24 +0200
Message-Id: <20220721103129.304697-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; h=from:subject; bh=sKOWXDCL91kq58t0FdekJeukQkU6Bwjo3++M3hvFQls=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Srv+TgOLs1G9g7euiKgebUIZ8RhD3suhSpXS9Vw WaUQQwiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq7wAKCRDB/BR4rcrsCaQaB/ 0UHu0XNU/HMCeI8tIqAxgqTzAnvVsOD0HiVNK5OiNnKzTx5up6NUB1+1vZj5Jog1MjDfMpaBUTekek UYsWcQ4T/l21c0qoq1sKJZHDMFf0H/d/mdj8/1u5Oafi5Ky79GyIuUpzfaEDEppmH9SmwEjf72b3/T K1Q9AAW3+bQF3hpHfrgXgwYpuI7x2GQc4tbxSm3/KCbhnGogkdzkUf8dYc33zYfqcU3LBXVZGMsJuz Qu5JbIkJo3W8zmeKkOVROAtuhAwtJBRIlQFe2EWzZqD39MG2wojWy9R/m4GsutzgIIsXz0Qv7B+0LG WU/grNk7VedR5GloHAORBj5FJaibM2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_714324_4F69E93A 
X-CRM114-Status: GOOD (  11.94  )
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

VGhlcmUgaXMgb25seSBhIHNpbmdsZSBjYWxsZXIgb2YgcHdtX3NpZml2ZV9lbmFibGUoKSB3aGlj
aCBvbmx5IGVuYWJsZXMKb3IgZGlzYWJsZXMgdGhlIGNsay4gUHV0IHRoaXMgaW1wbGVtZW50YXRp
b24gZGlyZWN0bHkgaW50bwpwd21fc2lmaXZlX2FwcGx5KCkgd2hpY2ggYWxsb3dzIGZ1cnRoZXIg
c2ltcGxpZmljYXRpb24gaW4gdGhlIG5leHQKY2hhbmdlLgoKVGhlcmUgaXMgbm8gY2hhbmdlIGlu
IGJlaGF2aW91ci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMjgg
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2
ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IGI3ZmMzM2IwOGQ4Mi4uOTFjZjkw
YmQ0MDgzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVy
cy9wd20vcHdtLXNpZml2ZS5jCkBAIC0xMjQsMjQgKzEyNCw2IEBAIHN0YXRpYyB2b2lkIHB3bV9z
aWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2Ug
KnB3bSwKIAlzdGF0ZS0+cG9sYXJpdHkgPSBQV01fUE9MQVJJVFlfSU5WRVJTRUQ7CiB9CiAKLXN0
YXRpYyBpbnQgcHdtX3NpZml2ZV9lbmFibGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBib29sIGVu
YWJsZSkKLXsKLQlzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSAqZGRhdGEgPSBwd21fc2lmaXZlX2No
aXBfdG9fZGRhdGEoY2hpcCk7Ci0JaW50IHJldDsKLQotCWlmIChlbmFibGUpIHsKLQkJcmV0ID0g
Y2xrX2VuYWJsZShkZGF0YS0+Y2xrKTsKLQkJaWYgKHJldCkgewotCQkJZGV2X2VycihkZGF0YS0+
Y2hpcC5kZXYsICJFbmFibGUgY2xrIGZhaWxlZFxuIik7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0J
fSBlbHNlIHsKLQkJY2xrX2Rpc2FibGUoZGRhdGEtPmNsayk7Ci0JfQotCi0JcmV0dXJuIDA7Ci19
Ci0KIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0
cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCQkgICAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3Rh
dGUpCiB7CkBAIC0xOTIsOCArMTc0LDE0IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAKIAl3cml0ZWwo
ZnJhYywgZGRhdGEtPnJlZ3MgKyBQV01fU0lGSVZFX1BXTUNNUChwd20tPmh3cHdtKSk7CiAKLQlp
ZiAoc3RhdGUtPmVuYWJsZWQgIT0gZW5hYmxlZCkKLQkJcHdtX3NpZml2ZV9lbmFibGUoY2hpcCwg
c3RhdGUtPmVuYWJsZWQpOworCWlmIChzdGF0ZS0+ZW5hYmxlZCAhPSBlbmFibGVkKSB7CisJCWlm
IChzdGF0ZS0+ZW5hYmxlZCkgeworCQkJaWYgKGNsa19lbmFibGUoZGRhdGEtPmNsaykpCisJCQkJ
ZGV2X2VycihkZGF0YS0+Y2hpcC5kZXYsICJFbmFibGUgY2xrIGZhaWxlZFxuIik7CisJCX0gZWxz
ZSB7CisJCQljbGtfZGlzYWJsZShkZGF0YS0+Y2xrKTsKKwkJfQorCX0KIAogZXhpdDoKIAljbGtf
ZGlzYWJsZShkZGF0YS0+Y2xrKTsKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
