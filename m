Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C5CCA479
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bV9hwGQ6zpAIpJ8e/rAoUHfMVQ7n9+l6BBsPLS0JbyY=; b=OQi4grF9s6u18o
	/bDb+ToE6uKT7IEkvejKNPHQpiui/E1ZwbWWUQWA0qcBm6GvFjDoSBwt8CNizyVdR7etFR3xB7KF6
	0zOjB6A+Q4vq1adIXInrvzbdVJalzmfgOe8nMrFF1iRkp5YmzzzaptOa+/Hw7Cbmr7xy4vIblkMr+
	TDSBjoc2UKrD0E88MnLKmdFB1mA645nkXClgXdvtTZ1P5VMvJTzhNO8Hc5FELtiKlUKRhAlSEGbz/
	YhgU7nTktEPqYxOArZJu8SGQxGFOze6UwXtM4aOWhLUBarnjhSYOdkCYE46YfQK83s8zQUhoxTduv
	JCI9nOUbB7SrcMQPipzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTJ-003roY-ML; Thu, 21 Jul 2022 10:31:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcj-MV
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002W1-QS; Thu, 21 Jul 2022 12:31:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMt-Ti; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-006ZIY-8Y; Thu, 21 Jul 2022 12:31:36 +0200
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
Subject: [PATCH 7/7] pwm: sifive: Shut down hardware only after pwmchip_remove() completed
Date: Thu, 21 Jul 2022 12:31:29 +0200
Message-Id: <20220721103129.304697-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; h=from:subject; bh=zQLWxgV295stqWE/56SMfwXF5tRzx6Wmb0QC4HH8Cw8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Sr+XeA/kTOnz7lLWTP39p9qGkAtgJshtXu2A/vv Td2ybxGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq/gAKCRDB/BR4rcrsCfIuB/ 4787jU2mMlX1tFBEAWmtDC1irHTvudx25tIFJeJWAZPkm9MasFS3qs8e2lDL3q4NXCOm49Z2IH4m6d rf9raH1+cAJxza7sO8LZnMp4YDaptnSFqKpJG6sqbPxwEKj0aZU1g2g+1Zg5AvrQGQgnwmptatgELU rAXNiH8Psm0aDLStJ5UHJtOBxlEIuQtw466jtcMF06/wMT3LfV36QKIYW8GXF+WwZOshuklCHu4xyS dMdvFn2RkGwyxwAM7fyLiOMDpMyxejx9cUHy3+KQN86EoJhAwHOtamHQAGqAGX8Xr8Bhq7RRSMZ8GA IHNDiElI3/fnq2H2oIyE6eJd9gMs7D
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_765238_1321C5AD 
X-CRM114-Status: GOOD (  11.91  )
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

VGhlIFBXTXMgYXJlIGV4cGVjdGVkIHRvIGJlIGZ1bmN0aW9uYWwgdW50aWwgcHdtY2hpcF9yZW1v
dmUoKSBpcyBjYWxsZWQuClNvIGRpc2FibGUgdGhlIGNsa3Mgb25seSBhZnRlcndhcmRzLgoKRml4
ZXM6IDllMzdhNTNlYjA1MSAoInB3bTogc2lmaXZlOiBBZGQgYSBkcml2ZXIgZm9yIFNpRml2ZSBT
b0MgUFdNIikKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCA1ICsrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUu
YwppbmRleCBkYTQwYWRlMGViZGYuLjJkNGZhNWU1ZmRkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
d20vcHdtLXNpZml2ZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpAQCAtMzA4LDYg
KzMwOCw5IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2KQogCXN0cnVjdCBwd21fZGV2aWNlICpwd207CiAJaW50IGNoOwogCisJcHdtY2hp
cF9yZW1vdmUoJmRkYXRhLT5jaGlwKTsKKwljbGtfbm90aWZpZXJfdW5yZWdpc3RlcihkZGF0YS0+
Y2xrLCAmZGRhdGEtPm5vdGlmaWVyKTsKKwogCWZvciAoY2ggPSAwOyBjaCA8IGRkYXRhLT5jaGlw
Lm5wd207IGNoKyspIHsKIAkJcHdtID0gJmRkYXRhLT5jaGlwLnB3bXNbY2hdOwogCQlpZiAocHdt
LT5zdGF0ZS5lbmFibGVkKQpAQCAtMzE1LDggKzMxOCw2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2
ZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQogCX0KIAogCWNsa191bnByZXBh
cmUoZGRhdGEtPmNsayk7Ci0JcHdtY2hpcF9yZW1vdmUoJmRkYXRhLT5jaGlwKTsKLQljbGtfbm90
aWZpZXJfdW5yZWdpc3RlcihkZGF0YS0+Y2xrLCAmZGRhdGEtPm5vdGlmaWVyKTsKIAogCXJldHVy
biAwOwogfQotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
