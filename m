Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60044C61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSFBp4n6a25YF0tNX8VCkbpBLEbdGybfArmACSHddHE=; b=Hcmk+cEL1mmNAC
	NwHHDD/Hff/D8mDALLV4ydmiMvYOr8S6e2OlstUm5nbkgNXhEt2ndzKw2DGN1sM2pZ6ssE7dIgsqA
	KG6QHJ4Bx7wC/b7mTpnawrdXk+wQYFogQ9M7SLp1MoFVVVHKmBwy2F6S/C0rjwJo5V3Vzm/XilzMf
	sUsaJb9dN4c52FtogYOqHMMiS6NGmB7vNJMiCJ9f4ST4tv92+1ML0imZsMcq41Ro3uRuMzWEI90XZ
	C3pPILnuZU65CNDaRAFxCgLQ4svp7xYNzbpgLjJROPCGvRbm2VmWq0WiiCvm5XkhQ0GD4x1WQDSOT
	hQ5lv9aUB0H1CdAtKw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAb-00GuLf-11;
	Tue, 21 Nov 2023 13:52:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAO-00GuAJ-2w
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 13:51:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAM-0005Kv-JO; Tue, 21 Nov 2023 14:51:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAM-00Aay1-4X; Tue, 21 Nov 2023 14:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAL-004xcN-Rl; Tue, 21 Nov 2023 14:51:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v3 026/108] pwm: sifive: Make use of pwmchip_parent() macro
Date: Tue, 21 Nov 2023 14:49:28 +0100
Message-ID: <20231121134901.208535-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ItlQpYUXEstYhNFNdEVbRgED9w4SaS6zldtNLGor7lI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLVpzS9AHqndKJ3b8keNfZ49PWB8VdxmjiZs4 qJGkoAPhPWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1aQAKCRCPgPtYfRL+ TgObCACi5wtfu2xxH2gzWPdAlas2i1mShyDm6JBpQwmJFEBQZUyX/GW3aUWvOboaW/AcU8YPUvs 9EtoP+//Drk7dUns+l2HMuxIKEIao8awYFjkPec1o8znxQeXME9f2h71iDmUuBaQH/+gpTGLfBc WCpwJBO1zA3432hhxApHk3RMzSKCSpL0Eh8FUPbgrT+b8Ibkrq3Ngb4D0w6d6ZUl50F2QTK53iB /zzPUunjLHwCkWTr6eGNnqN+0GuZ+IMv7NbYMXG+vwyixseT/yOzd/CFwrAatjN2+vGuNk99ksE vlDTO77mKp7NKoGdufKMGcWHRXd9wFGHshbY9OaNqTK1YsfM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055152_971542_121DC2B4 
X-CRM114-Status: GOOD (  12.93  )
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
ZXYsIHVzZSB0aGUgbWFjcm8KcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBwdXJwb3NlLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IDA4OWU1
MGJkYmJmMC4uYzFiNDEyOTA1ZDllIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZl
LmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCkBAIC0xMDIsNyArMTAyLDcgQEAgc3Rh
dGljIHZvaWQgcHdtX3NpZml2ZV91cGRhdGVfY2xvY2soc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEg
KmRkYXRhLAogCS8qIEFzIHNjYWxlIDw9IDE1IHRoZSBzaGlmdCBvcGVyYXRpb24gY2Fubm90IG92
ZXJmbG93LiAqLwogCW51bSA9ICh1bnNpZ25lZCBsb25nIGxvbmcpTlNFQ19QRVJfU0VDIDw8IChQ
V01fU0lGSVZFX0NNUFdJRFRIICsgc2NhbGUpOwogCWRkYXRhLT5yZWFsX3BlcmlvZCA9IGRpdjY0
X3VsKG51bSwgcmF0ZSk7Ci0JZGV2X2RiZyhkZGF0YS0+Y2hpcC5kZXYsCisJZGV2X2RiZyhwd21j
aGlwX3BhcmVudCgmZGRhdGEtPmNoaXApLAogCQkiTmV3IHJlYWxfcGVyaW9kID0gJXUgbnNcbiIs
IGRkYXRhLT5yZWFsX3BlcmlvZCk7CiB9CiAKQEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMgaW50
IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtLAogCWlmICghZW5hYmxlZCkgewogCQlyZXQgPSBjbGtfZW5hYmxlKGRkYXRhLT5jbGsp
OwogCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyKGRkYXRhLT5jaGlwLmRldiwgIkVuYWJsZSBjbGsg
ZmFpbGVkXG4iKTsKKwkJCWRldl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJFbmFibGUgY2xr
IGZhaWxlZFxuIik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfQotLSAKMi40Mi4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
