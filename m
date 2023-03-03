Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736D7C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjzMNyFtjwKj+Sjdq9tAb75VUiPkLcMNusou++0kdmo=; b=vy4l9+W3UHSx6q
	LmA41faaLNVitZ8HkxGZngSyweQ4fl0hw49VzerQfEK8bKC28YeTJPxDuam97gUibQ7g1VT5uFchb
	Yp98JZceVzbLWgNMtpejyc9fJkw9KBZugVrvrnoHpOgVBzqllc5e81AQKQZJPPzBip5uMUhmz+mvX
	SsV0VLzYMRHOu+vh6B8zeqpqFyI5k6wDYVfaaqgcDUZsRbKZUvlnk1GZj6ZErnu6paKAfSYH6lKiL
	adBu0xP638ZdbQxfrCE9SnreNgV+jEa4ImujZkuGwYQo1+rzZ44YCq/ArEtwmlANaZwz3Xy/g2jPY
	rYNvs6q7Gkdi77hBcluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAbX-007EOe-FS; Fri, 03 Mar 2023 18:58:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAYf-007Cra-Rk
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 18:55:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYc-0006Ut-0F; Fri, 03 Mar 2023 19:55:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYa-001cVb-Sa; Fri, 03 Mar 2023 19:55:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYX-001ukn-76; Fri, 03 Mar 2023 19:55:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: kernel@pengutronix.de,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 20/30] pwm: sifive: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 19:54:35 +0100
Message-Id: <20230303185445.2112695-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qMafb/hg7zFL02UFPEZV5gEG/vwYDPL5U0C7Ndq8GYw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAkJHsO7KnsALZ/5vaBUA+pXb5ayVMdj/m7kLY d/YanFOSx2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJCRwAKCRDB/BR4rcrs CU77B/9hdSMSFrKcMQw1LLDMm/Gvonnt6aLpyqaNJ3xz/Mj5q+af9TlcBIrHQlsA/lSKSf1A19j s1TkrM6/60gi1ZGeXqbe4wXel+u9YZGizM/4rF2gkxnHSknoV27JCv6RrYiAdkanv+xqYqYI9wV 1KJghKXYKvaVBBhYatJ7A9ej5hUln0gHow3bzpBNDIFdp4ZrxPzuSFyGptsv4OmdNJrHLA2a7kN pSnmWu60RBFLi4m9oc1W8RDzk1w6pd37vLwR4M5Uh+a/CQY4W3Ux/WJrQK/DS40vj4WkA9oOgil 1xtSg+enYsEFQ7DUWffooVu0bcuLUJfVOHVSsFdV9n585p5+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_105509_976784_2257A90E 
X-CRM114-Status: GOOD (  16.12  )
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
dmVycy9wd20vcHdtLXNpZml2ZS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNp
Zml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IDM5M2E0Yjk3ZmMxOS4uNWIw
NTc0ZjYzNWY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jCkBAIC0zMTMsNyArMzEzLDcgQEAgc3RhdGljIGludCBwd21f
c2lmaXZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCBwd21fc2lmaXZlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpkZXYpCitzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXYpCiB7CiAJc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKmRkYXRhID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEoZGV2KTsKIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtOwpAQCAtMzI5LDggKzMy
OSw2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2KQogCX0KIAogCWNsa191bnByZXBhcmUoZGRhdGEtPmNsayk7Ci0KLQlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcHdtX3NpZml2ZV9vZl9tYXRj
aFtdID0gewpAQCAtMzQxLDcgKzMzOSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHB3bV9z
aWZpdmVfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBwd21fc2lm
aXZlX2RyaXZlciA9IHsKIAkucHJvYmUgPSBwd21fc2lmaXZlX3Byb2JlLAotCS5yZW1vdmUgPSBw
d21fc2lmaXZlX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHB3bV9zaWZpdmVfcmVtb3ZlLAogCS5k
cml2ZXIgPSB7CiAJCS5uYW1lID0gInB3bS1zaWZpdmUiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBw
d21fc2lmaXZlX29mX21hdGNoLAotLSAKMi4zOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
