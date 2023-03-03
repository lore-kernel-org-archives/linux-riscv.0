Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E525C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ADI+sf1yYqcm+AjVVJ81kNn7OUpDWvkpEFhaJ3sI7Q=; b=kqFeCve/oiEGX/
	mm7B1ZhPsG+2tLAZGwiMnpDNhou2hdzkI6RM9YYGtu3B6l/r/wPeUhJXzNbzsq9TXQohmsC43Fg+8
	VY4/tNtd+HFVpQn/a2faBTLhAyY840w4WXjkAjiQKy+hGe1cHKM8zdId/YxkFDds1OOxoJIVPifgm
	nCZjZseEKKfMxhIO8Pbf6mrZabvFTfRsn71eZ/P5kukbNr23AEJoOsF3/2I8BTI10g62ja+IerjYd
	jO6d6NZJq1BurhrT49GzD9UzqnTaWNEjsHsEfpMQ9Yp2biAhMvw/ORSI3Xn5ezb35U9ASffX9nqGD
	PT1gFGb9H8YOrJwtJwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY96k-006taE-Td; Fri, 03 Mar 2023 17:22:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95e-006t2r-R6
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:21:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Y-0006l0-G4; Fri, 03 Mar 2023 18:21:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95X-001blT-8T; Fri, 03 Mar 2023 18:20:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95W-001tkD-G8; Fri, 03 Mar 2023 18:20:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 37/87] spi: microchip-core: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:51 +0100
Message-Id: <20230303172041.2103336-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2q5THNKlK4gsquv2lzy7ofOnkVJIgOoYwNhePyYNVus=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiuayFi3bYDqqf9iXAc1czAWs59j6npeXLTFz RlGLZ5ws1CJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrmgAKCRDB/BR4rcrs CSK+B/9Wtf/e7biFxUeF+iCjsLA5hkPiJXTXRuRmrpfFBbNugB6pMsNUDLkp3d1Sg835DWSD5L9 Mlw05kpKgDD0Rg3AE9aR7+47N0DM0Xwj+cyb47fUI6YO32iJ4V+436Zvaoh0NrBRd+o5K3Psb8G O9lseeQbr8uNPwQw8kDyFpZXn1xgchISi7VKdwBx1YxoPdZnPHP8y/WIRZSKUQf5Vu6/mK6ycDi M5NmqTu8S6vW3tztURb7lw2DX41tY5kxsVNwyaf5jL841rlkIRr/y4NhCkVjHKjt4KGGelwNTQt CGjsNJGbdD1fJe2DPrJ50HMxewndgT1IdKBbpedyXu+Pyh2G
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092106_913509_522DFA68 
X-CRM114-Status: GOOD (  15.16  )
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
dmVycy9zcGkvc3BpLW1pY3JvY2hpcC1jb3JlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nw
aS9zcGktbWljcm9jaGlwLWNvcmUuYyBiL2RyaXZlcnMvc3BpL3NwaS1taWNyb2NoaXAtY29yZS5j
CmluZGV4IGFlYWExZGE4OGYzOS4uZTZjZjZmZjA4MDYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Nw
aS9zcGktbWljcm9jaGlwLWNvcmUuYworKysgYi9kcml2ZXJzL3NwaS9zcGktbWljcm9jaGlwLWNv
cmUuYwpAQCAtNTY2LDcgKzU2Niw3IEBAIHN0YXRpYyBpbnQgbWNocF9jb3Jlc3BpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQg
bWNocF9jb3Jlc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGlj
IHZvaWQgbWNocF9jb3Jlc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBzcGlfbWFzdGVyICptYXN0ZXIgID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAJc3RydWN0IG1jaHBfY29yZXNwaSAqc3BpID0gc3BpX21hc3Rlcl9nZXRfZGV2ZGF0YSht
YXN0ZXIpOwpAQCAtNTc0LDggKzU3NCw2IEBAIHN0YXRpYyBpbnQgbWNocF9jb3Jlc3BpX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCW1jaHBfY29yZXNwaV9kaXNhYmxlX2lu
dHMoc3BpKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoc3BpLT5jbGspOwogCW1jaHBfY29yZXNw
aV9kaXNhYmxlKHNwaSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogI2RlZmluZSBNSUNST0NISVBfU1BJ
X1BNX09QUyAoTlVMTCkKQEAgLTU5OSw3ICs1OTcsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBtY2hwX2NvcmVzcGlfZHJpdmVyID0gewogCQkucG0gPSBNSUNST0NISVBfU1BJX1BN
X09QUywKIAkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG1jaHBfY29yZXNwaV9kdF9p
ZHMpLAogCX0sCi0JLnJlbW92ZSA9IG1jaHBfY29yZXNwaV9yZW1vdmUsCisJLnJlbW92ZV9uZXcg
PSBtY2hwX2NvcmVzcGlfcmVtb3ZlLAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobWNocF9j
b3Jlc3BpX2RyaXZlcik7CiBNT0RVTEVfREVTQ1JJUFRJT04oIk1pY3JvY2hpcCBjb3JlU1BJIFNQ
SSBjb250cm9sbGVyIGRyaXZlciIpOwotLSAKMi4zOS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
