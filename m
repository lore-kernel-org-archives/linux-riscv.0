Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F939C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpBPXUA+0XWisQPEYi5RgU5tIyp9YuqNyekMADKGux8=; b=ApqaOxcOO1v+9B
	BE8r8HTwEewD9fGUiP4lDortUB8hS7PMK3XWh3YqmLuz7nO06fOKJ3QkoUMKa+5B0Yiez9xbmtn/r
	6YpE/LLZ97Bs4VbKK1DkX1ll0GOmM7k7CJqIZDwTyjo/1buQ3rqxeAZKbJhA7ZuD/bVbroCgc2wkz
	t1BC9NpsX/6eB5HL4ujDytamHXhj5rTPeMya5RquMBtlVOtRkS4TY+SvGrGPB0d5/uEc5o1Bs6QbU
	l6VHS+ar/kPv1l1J/alVu5xnTL+6hwgWcHsJceFYEi/5pQdBZ8LS4xJZg4f1JhAmj6o5wRMxtjAAN
	rubah3MhcDmcT1mqIxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPqF-007Ekt-1t;
	Fri, 14 Jul 2023 20:56:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPqC-007Eix-01
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 20:56:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq6-00085L-Jq; Fri, 14 Jul 2023 22:56:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq5-00EQSp-RS; Fri, 14 Jul 2023 22:56:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq5-004u4B-5d; Fri, 14 Jul 2023 22:56:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 08/10] pwm: sifive: Consistenly name pwm_chip variables "chip"
Date: Fri, 14 Jul 2023 22:56:21 +0200
Message-Id: <20230714205623.2496590-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BMcjYLEWzp9vBXgIDVtaex6uUybr0ko5zvax6INeS/o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksbZvFVQpNLyF8V35ZOAn7byJn1uVCEuAf/T5B 54N5woKG8SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLG2bwAKCRCPgPtYfRL+ Tru1CACJbPDN3Zvz+IYCuXCeHQ0g65/VEBd5eI0R/h+CuONNXq3grLikeU+90uMgd5eEGXRaaG3 AKbdyCehV06XJ5mx1bkJIfkVKJDxYMWE3peRsW4c8Lc3x4fnC7ZSkMtdYxYIbvyeDoCC+tFW8N5 5EOG+nISZSHntHn2I6wG3KVW19XmoX4rfCu5IIoKSXm9xat9Q5lqMp0Wy2sIKb8Mh9wt/gdybJU KmveczWY1cnAobiilup+tGg9/nIiFZlP1owK+xkVzkQKkA6JQmLJCv3UmE64U4yl4+29daJh9uQ tTs6ypw/5FeeXee5Y6ElXI1p5xnrBznPK9SRsx9qDkSWd8fw
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_135640_038878_DD709AAF 
X-CRM114-Status: GOOD (  11.90  )
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

TW9zdCB2YXJpYWJsZXMgaG9sZGluZyBhIHBvaW50ZXIgdG8gYSBwd21fY2hpcCBhcmUgY2FsbGVk
ICJjaGlwIiB3aGljaAppcyBhbHNvIHRoZSB1c3VhbCBuYW1lIGluIG1vc3Qgb3RoZXIgcHdtIGRy
aXZlcnMuIFJlbmFtZSB0aGUgc2luZ2xlCnZhcmlhYmxlIHRoYXQgaGF2ZSBhIGRpZmZlcmVudCBu
YW1lIHRvIGJlIGNhbGxlZCAiY2hpcCIsIHRvbywgZm9yCmNvbnNpc3RlbmN5LgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IGFlNDlkNjdhYjJi
MS4uMjViOWI3ZDk0NzZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysr
IGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCkBAIC01MSw5ICs1MSw5IEBAIHN0cnVjdCBwd21f
c2lmaXZlX2RkYXRhIHsKIH07CiAKIHN0YXRpYyBpbmxpbmUKLXN0cnVjdCBwd21fc2lmaXZlX2Rk
YXRhICpwd21fc2lmaXZlX2NoaXBfdG9fZGRhdGEoc3RydWN0IHB3bV9jaGlwICpjKQorc3RydWN0
IHB3bV9zaWZpdmVfZGRhdGEgKnB3bV9zaWZpdmVfY2hpcF90b19kZGF0YShzdHJ1Y3QgcHdtX2No
aXAgKmNoaXApCiB7Ci0JcmV0dXJuIGNvbnRhaW5lcl9vZihjLCBzdHJ1Y3QgcHdtX3NpZml2ZV9k
ZGF0YSwgY2hpcCk7CisJcmV0dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgcHdtX3NpZml2
ZV9kZGF0YSwgY2hpcCk7CiB9CiAKIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9yZXF1ZXN0KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKLS0gCjIuMzkuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
