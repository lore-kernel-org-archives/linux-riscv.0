Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DEC678DB
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQqqCH/GBE1CDQDTE74Q2MjG8XhxLwyJ8Xd4zOR2/4c=; b=OKvKzfTr9j7rR1
	LZqBlq8KHYb/A8rVB3drsHfGuBrrH1YV8M4yJGgEE1QQ26uGuOqaeRgAcdz14xWpSYjpERsF6gaWl
	SlusZ5b3UfOD53wrDL9WA1urWY4DQAmmlChRCMeSJVMVs2UliPmNnqi4UVLm7jTaE+XrBaHUi63Sn
	CYDPSxVVd0C+IABN8izCLC8+BNRJC8CzqnZw1J5VRdw1Rw2Cu/1LRtmnZe66cufaez0dIkmZHhVHk
	kSU9qtfRBtsM036xbORpRVIliCm2ggh/wPu/wvPEFx7mioFV9lDR0VUrTdVGc0wywDd/Ot+aH2wbS
	DuIJPA+9AyLFnZnbJ6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRyy-0091NO-36; Sat, 04 Mar 2023 13:31:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRyO-0091FT-Gc
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 13:30:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyI-0000hO-96; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyH-001naN-Dw; Sat, 04 Mar 2023 14:30:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyG-0027HJ-IO; Sat, 04 Mar 2023 14:30:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 18/41] rtc: mpfs: Convert to platform remove callback returning void
Date: Sat,  4 Mar 2023 14:30:05 +0100
Message-Id: <20230304133028.2135435-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rJ+uxoSyVi0xpiSqvOg6XeWDbaaKjouhoP5FXih3Wtk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0egsAdFAfPhlrlhdqgp7TvITrbFGGivWjhvZ VUeadKi8dyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHoAAKCRDB/BR4rcrs CWFkB/9PAeiMZeUCBlKdFMUy/66bIhVxWlTVuqqVtvkYs2HuU4/tCO1iqT6g/XxesAzDaylfLfK ocpOggUXytNG+aC31UrAmNsygKVkfCLTHHd5ENLpKv3SInI7H+u5I4szl7vkHNs504DvKCPHFK8 ICbQSptyQXQExHx0hQDoEA0vQNomTkCEX2uELuNhT+OXpuGMyA2HpMDVqXN0vSY8aW2v8e0+P0P yMIfDMOWF5i9T1lTRutDAHu/zcpH3GefM7OLkEvzflBonbWURFiO2cygxvMlJ4YzdL9K/AuNmNQ EZ0Sj+iIUWNEVpBJT4Ppel61Bg0sltKyMJsKDQcveZPFpczu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_053052_611884_BF06326F 
X-CRM114-Status: GOOD (  16.59  )
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
dmVycy9ydGMvcnRjLW1wZnMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tcGZz
LmMgYi9kcml2ZXJzL3J0Yy9ydGMtbXBmcy5jCmluZGV4IDJhNDc5ZDQ0ZjE5OC4uNWI5NmE2ZDM5
MjEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtbXBmcy5jCisrKyBiL2RyaXZlcnMvcnRj
L3J0Yy1tcGZzLmMKQEAgLTI3NCwxMSArMjc0LDkgQEAgc3RhdGljIGludCBtcGZzX3J0Y19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rl
cl9kZXZpY2UocnRjZGV2LT5ydGMpOwogfQogCi1zdGF0aWMgaW50IG1wZnNfcnRjX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgbXBmc19ydGNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJZGV2X3BtX2NsZWFyX3dha2VfaXJx
KCZwZGV2LT5kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG1wZnNfcnRjX29mX21hdGNoW10gPSB7CkBAIC0yOTAsNyArMjg4LDcgQEAgTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgbXBmc19ydGNfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBtcGZzX3J0Y19kcml2ZXIgPSB7CiAJLnByb2JlID0gbXBmc19ydGNf
cHJvYmUsCi0JLnJlbW92ZSA9IG1wZnNfcnRjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IG1wZnNf
cnRjX3JlbW92ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZSA9ICJtcGZzX3J0YyIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IG1wZnNfcnRjX29mX21hdGNoLAotLSAKMi4zOS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
