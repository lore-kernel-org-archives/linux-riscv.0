Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA7BC7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQrjrIj1VMabRbJXTvJjMu+4F5wIXPtz6e7UouGEzOQ=; b=lmUGvDICMVUN4s
	YQDwE6WLDaA+Q0uWCI18yaQvCZqfoX4QecQK2I9QgUcyN1UukgJE1xXbvivIxgeyN7V93XwomjBl2
	ngfCtRvzu7yFKq7XMVZfuuLWjEZHUxp3ZXconzOadLGexIek1aTnSi0BF5PPWfYSDYiLpM+FvmAwH
	avKRUhvG7GeXO1zeSpFKI2wh4UVRTz9tuICxsregLtQKx2I/3rcda6zHldfDqnPl4eh9wvJL8xWFo
	WVHmoKw36Zytx1Fera7dcwabaOrBsWQhPNzFkGe+etq7p/qJ2cEKoqks3EPPqKmD2j4dbfRQ9C+KF
	eNGaHGRAWiAxYaMzC4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY975-006tlb-8t; Fri, 03 Mar 2023 17:22:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95h-006t5U-5J
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:21:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95e-00071m-D4; Fri, 03 Mar 2023 18:21:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95d-001bns-BD; Fri, 03 Mar 2023 18:21:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95c-001tm9-JU; Fri, 03 Mar 2023 18:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 67/87] spi: sifive: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:20:21 +0100
Message-Id: <20230303172041.2103336-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Tl7WkauIutM+b3al3H9SYheO/VLRXWleqG0ok9ZALEM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiwP6Nec85xqvkHvbxOkc/4mdy7srvBaTQekZ w0Q1BH74N+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIsDwAKCRDB/BR4rcrs CdjyCACLr+zFqnQpOA6JiQxM9YjKlvQVr0zzLOTl4aT/8OfjOzJgE99fhZXdxWktwMpl1qs4pLY 9eg8Ti2aLX+ZnB4ZXgHnvbSGiA9qMkRaCHVvLkU/nVeGIYe1GFEB+qcopMOl0oFbnNR3cnK05k6 LQ5Nnd/QHNLI7loh6Lb+67uo+48wzGYmvtn17jFVZbfPH53MECPjlf8cBFz0sNMR6ojTsyD43cu VK0y9iqxmu0D+PMKC9Q3YjRFRBu30VDEcSzg2zR69vLayDbyWaZPlyDAZ7+81BbEWlrkN3Hmtf0 9sA9nQk8NVTOz1bSvED4ILUiOnao/fJw0mQmr6RmaK84cZ4s
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092109_236253_EA07A76E 
X-CRM114-Status: GOOD (  16.28  )
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
dmVycy9zcGkvc3BpLXNpZml2ZS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXNp
Zml2ZS5jIGIvZHJpdmVycy9zcGkvc3BpLXNpZml2ZS5jCmluZGV4IGUyOWU4NWNlZTg4YS4uMDU1
ZGU0NGUwZDIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc2lmaXZlLmMKKysrIGIvZHJp
dmVycy9zcGkvc3BpLXNpZml2ZS5jCkBAIC00MTUsNyArNDE1LDcgQEAgc3RhdGljIGludCBzaWZp
dmVfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCBzaWZpdmVfc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQorc3RhdGljIHZvaWQgc2lmaXZlX3NwaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3BpX21hc3RlciAqbWFzdGVyID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7CiAJc3RydWN0IHNpZml2ZV9zcGkgKnNwaSA9IHNwaV9tYXN0ZXJfZ2V0
X2RldmRhdGEobWFzdGVyKTsKQEAgLTQyMyw4ICs0MjMsNiBAQCBzdGF0aWMgaW50IHNpZml2ZV9z
cGlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogRGlzYWJsZSBhbGwg
dGhlIGludGVycnVwdHMganVzdCBpbiBjYXNlICovCiAJc2lmaXZlX3NwaV93cml0ZShzcGksIFNJ
RklWRV9TUElfUkVHX0lFLCAwKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoc3BpLT5jbGspOwot
Ci0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgc2lmaXZlX3NwaV9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKQEAgLTQ3Myw3ICs0NzEsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
aWZpdmVfc3BpX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc2lm
aXZlX3NwaV9kcml2ZXIgPSB7CiAJLnByb2JlID0gc2lmaXZlX3NwaV9wcm9iZSwKLQkucmVtb3Zl
ID0gc2lmaXZlX3NwaV9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzaWZpdmVfc3BpX3JlbW92ZSwK
IAkuZHJpdmVyID0gewogCQkubmFtZSA9IFNJRklWRV9TUElfRFJJVkVSX05BTUUsCiAJCS5wbSA9
ICZzaWZpdmVfc3BpX3BtX29wcywKLS0gCjIuMzkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
