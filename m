Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2FC10DCE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSFBp4n6a25YF0tNX8VCkbpBLEbdGybfArmACSHddHE=; b=P+DK3AUSOJeG8m
	USEK2lC/P78doFCjpb1xsAuu+VL1a1esNNVBk22XHygwwRlyA6Y0ATP50+pYuZ1pEp/evqdnQFdM3
	dG5wXEHnhcdHDOj1rLWAemAmZTjaL4JxOjLi5DjllXX4IXPLIP6euO+dg1/A3azj0FK+vwHEsOU1y
	hH3Eu8EHUrtyp+15cIIRPVRLuDUb0IGdPaN2LPyTJ8AkvPPBg8R2EqmzOV+iv3JzvS9DKxOrXBSYW
	rWptVyM2u6JNGdLlMa6vpMua/TLt3m8brRYedmFsiZgSNlwTCFu0fE5eACzwohNI6BV+DNdtSwF7O
	L5+tTQpitzF+z0pQjH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOP-00A6JM-0D;
	Wed, 06 Dec 2023 11:48:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOC-00A635-0k
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:48:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOA-0006LZ-7J; Wed, 06 Dec 2023 12:48:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO9-00DwtI-Pj; Wed, 06 Dec 2023 12:48:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO9-00FQyR-Gj; Wed, 06 Dec 2023 12:48:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 031/115] pwm: sifive: Make use of pwmchip_parent() macro
Date: Wed,  6 Dec 2023 12:43:45 +0100
Message-ID: <97729fa5438d05626c8b83c13892c63da7bd7e50.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ItlQpYUXEstYhNFNdEVbRgED9w4SaS6zldtNLGor7lI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF6FJQLDT/6RotOS62rWjUkJHmBKasIU3XRRu MtA7PSz+peJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBehQAKCRCPgPtYfRL+ TpS7B/9m+lrgfd9N31AhuVTEOY1WjeK1XWnl4oXV17GcP+WUquky5UjPBuuz4FvAivRzv6fdqOW AdbR/PDFpHb3j1Ny06ZQdhYxT4uhFhsYSrkVWSiybDXuYluHk/XPFIzfSMeyFjTHJPywxIvY/yf 4nnhfKslKXjHun/RYH9J12j7EP66jlHSEEXcN7TGu33KziTBf6YMWtLiGG0kaHbPnIZ4wE4//m5 OupzhCXPNrE/p9Nhe2+/M6vIf9WkHz6Je2yftMOba0mQCH/DARRgAyX7tAHzGG5A1EdqUGhJhhW 5EvCTxc6pYwzliDvTLk6l8Ee5jomZSSaAvZIayeTRKFnYmwK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_034828_266029_21BA4626 
X-CRM114-Status: GOOD (  12.14  )
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
