Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E9C48285
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5GQuyAeeIiKQASG4JLxa5ICzlieLs5qHHRd1O+y8zE=; b=NBzKX+2i1kCUB1
	UEg5oPlOIxtGIFujuuxRNWG8c/zHgln+Vli8kCDc/shj6cGTkCSFBCQ7n3OA4xIoRKxDtUAsK/mcS
	5qpePaYwu9okf6XxDFHfZKs0wlGKTlnamfPNr0u4zkYQ0UYWSABBIHQaI/BWeNHAzTdc+jTMrPsMb
	Cy2dtI6q8DSA7Qdu4N52TzsZ44gZmJFr/RYVaHhlsB6JceZunaXCa/09zxmgILMe3Fj1Q/T9jN3T4
	d9/bqyd18YJHZ4N0mveNA7FJCyEOM3Wq7BR2ivxJMPAwIHSSYOQa137UKxXczm2iNtVG7RX6JOVHM
	/8t43acCiU18hYEj/Fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0RJ-00000000Gfr-1Apr;
	Thu, 25 Jan 2024 14:10:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Pj-00000000FbC-0u8e
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WfsGegSf9tr9W2yUHYApTCsEq9Ad1ZwgcRWQrX3cFW8=; b=rn18SrYlkGFrLyrBeYRedFiNXd
	wFUCWWN1tY1GkrIP0aAIQQhpkJ7XUJxu8jRn+OD5ziFk2LkXEYBHtTzNV3vTPuUttfAtZEH9dVWS8
	y0L47h7JmC1Lz+PPZJBdEfrm9VehH1sqdZAWwyRQak4Jxb9/PWCqwmXMIV42RBb5+e9d4KVNY9l/P
	LSJPHsJ2Zw4yOsin1+MX5bHhDmTH3sCYZ1tbKxe3HRmCI0fTk/IWJEyoPhwNWr0OdYS82+h/UyECg
	b0rkfsjFmJcdGqtWadMha4VbtweSR7Rd6gRPSKzpsPKYFWgSX+6ZTU/1aiS3tLsgNgy/qDO1cTxf+
	7UxhvgXw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSybU-00000009sDQ-1lC8
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:13:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZC-0003ov-3u; Thu, 25 Jan 2024 13:10:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZB-002HQQ-7O; Thu, 25 Jan 2024 13:10:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZB-007mzt-0U;
	Thu, 25 Jan 2024 13:10:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v5 027/111] pwm: sifive: Make use of pwmchip_parent() macro
Date: Thu, 25 Jan 2024 13:08:49 +0100
Message-ID: <6987fafe69071c2f91a19b79a688c51f38be3853.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=DYvqfTqENk16A4KlpGQN9yUJm5r3OjrI/v9vK4Lp4UE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9Z6WxidC+q10uGRzkSEunktXEDpLIL3nt/9 OECs9SYk8eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPWQAKCRCPgPtYfRL+ TnxpB/4myeH3GhvtWa4I8obN5rm2g+L040e/o3EReiWARmsV9z97K0W0vp2mOOEsMXcGFYJJhOH NQGhfRkwcDm/nnKH/WcXUpv9x1Vgk8ib5lZLN7pDSVNnoYuGRozomv2i03XnNBwuhfKrl/0KE6n eVhM7CAbiSdnZAReuf0PSeVaezi4Qlpob7bYbhfKCOd3xTOeSVVTl0qVO6aaG7U/978BFCFPd69 QlX9WWBRXUP/uCgkvU2VCDuLY2KTp3y44DV9e9228hRac1I2Fkx9K7umEH/sUSd49TaKZ8Vsafm RsiURvhQ/jagsgfRbZQJmA83n/bthqd0cOptez2nJyP9I3Or
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121309_842831_9EC69170 
X-CRM114-Status: GOOD (  11.15  )
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
IGZhaWxlZFxuIik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfQotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
