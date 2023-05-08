Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B6C7EE25
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWPiy7mvwKsiBS9OJdNUQN3pMcsy2jqLuAB6uVpRpX4=; b=sl85KD7B7fGo/P
	QPIvPG2IgzhBIKP6qz2Jub1x1Q0zMqmyoK7DiFmb9+TOV/Mggci1B6YJ9khlzq/vFJU5IRF9uvumG
	Rnc9TzBwFyplt7IlWsGPI0N2UWElZtkkmqTr/S3lSzZuOevfgliInEm29nQAOi4s9vKfGlldJCNYI
	ru5/SScabg5mkLgNYrDA3g21rKNHWgXq/EOr70XQJAkyKJtLvBRFY/FuTw04X8D0LsInWeXn7iT7K
	/wIkg1fxky90sK5+k0d0ssOPn45uK5eOGUG1gleLm7XUn/yHd/ADoNYx+KcK12IAVW5RUP91CehCf
	VekasoWp9Rdi8OdHAWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7rg-001O9Z-0a;
	Mon, 08 May 2023 20:53:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7rL-001Npq-1U
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 20:53:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rG-0003XR-Md; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rF-0024rw-7O; Mon, 08 May 2023 22:53:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rE-002YX9-9Q; Mon, 08 May 2023 22:53:20 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 37/89] i2c: microchip-corei2c: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:52:14 +0200
Message-Id: <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lWdXgJ4CxH9qZP1Xdbaoi7MsOoYjB8b3ajtHyZeUpkc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDPa+5ut0Ft+T6NAEvZvV6QryBo+d6FsCDfy GFgkaPxUBWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgzwAKCRCPgPtYfRL+ TvIXB/49cA24WBxNK9hQRxWDY+sCVvQR+IRhBLHEFsbq7lbOL1604nY4WODvwPONw1tytt6mxT2 Nw0mWdTAG7P2BqyzxOYiV8zPGoVn0FbF/Bk4FnPAfMFNLeuAXLuuq68vbVDP+bhSP3FP/EvsN1G 87x3E4X+n6v4e+XpjYA67I3HffxlL2q5O4iprtw/rbo/4+JQDDHL2MSGIzoGugyl8XDyg218ySc +aik23W7aXh2RTjRL3loi/qKyruNQOFGhnlIf4cCVQEfm6JXwj/v1jYM3pj1nLmDCymUUhKK65z qA/+52o1deeoWpvrisi+rvSITmSiTfDJ+G58/JXg9knyCDMx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_135327_495995_EE5DE569 
X-CRM114-Status: GOOD (  15.75  )
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
dmVycy9pMmMvYnVzc2VzL2kyYy1taWNyb2NoaXAtY29yZWkyYy5jIHwgNiArKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1taWNyb2NoaXAtY29yZWkyYy5jIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1taWNyb2NoaXAtY29yZWkyYy5jCmluZGV4IDRkN2U5YjI1ZjAxOC4uN2Y1OGY3
ZWFhYmI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1pY3JvY2hpcC1jb3Jl
aTJjLmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1taWNyb2NoaXAtY29yZWkyYy5jCkBA
IC00NDYsMTQgKzQ0NiwxMiBAQCBzdGF0aWMgaW50IG1jaHBfY29yZWkyY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IG1jaHBf
Y29yZWkyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lk
IG1jaHBfY29yZWkyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3QgbWNocF9jb3JlaTJjX2RldiAqaWRldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGlkZXYtPmkyY19jbGspOwogCWkyY19kZWxfYWRh
cHRlcigmaWRldi0+YWRhcHRlcik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbWNocF9jb3JlaTJjX29mX21hdGNoW10gPSB7CkBAIC00NjUsNyAr
NDYzLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWNocF9jb3JlaTJjX29mX21hdGNoKTsK
IAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWNocF9jb3JlaTJjX2RyaXZlciA9IHsK
IAkucHJvYmUgPSBtY2hwX2NvcmVpMmNfcHJvYmUsCi0JLnJlbW92ZSA9IG1jaHBfY29yZWkyY19y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBtY2hwX2NvcmVpMmNfcmVtb3ZlLAogCS5kcml2ZXIgPSB7
CiAJCS5uYW1lID0gIm1pY3JvY2hpcC1jb3JlaTJjIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gbWNo
cF9jb3JlaTJjX29mX21hdGNoLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
