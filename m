Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F495C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAULwTvD6oqQuChJ7VFMnD1UsXUkTXhb7Xs2thQjSAE=; b=a2FtopD2QfnuIo
	EBqU5AiLzj6WUcnfZTl0o2EECtetSR475KL6oObQqI4HFGmaCSn0rrOFvXm5qGpTE0Tfz26mjqPI/
	jS4qGRwf0myUtZ0i9pOoSSZRp4Evnz5sB2zXje5LSNuFUYN/tR2BCYPeqNPyszSooM7htW1mck0Gc
	nzSMz0rujJCmoQPBlEStGBPqpitYXB+Y3gyyhDOQVLm4Y0PFwsk9gh89eZbWxN1B/5NvEUlkDgAYN
	D8qHEqtpAteIcCp0vLLdfe1ZXJVzKOV71YhEtXWIZuJUyd6rV41w7IdMXJe/HjiJthbOlSaLsfbvz
	gtHm5fmYINPdxo83t8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTI-003ro2-5h; Thu, 21 Jul 2022 10:31:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcn-Nb
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002Vy-QN; Thu, 21 Jul 2022 12:31:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMk-IB; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSx-006ZIS-UD; Thu, 21 Jul 2022 12:31:35 +0200
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
Subject: [PATCH 5/7] pwm: sifive: Simplify clk handling
Date: Thu, 21 Jul 2022 12:31:27 +0200
Message-Id: <20220721103129.304697-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; h=from:subject; bh=0fFwEZkhwtAHdV9/NUnEXXx4U/lJdZQ7HP84P2BZd3U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Sr4PlqUFDXOkb1eWHlVrO1iKgp5d1w/4C1/TlH0 MQzpDGWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq+AAKCRDB/BR4rcrsCdnlB/ 9ZVYl1QMEBzPLGFquFuYMSf8xCwaQK/lcVrfciCCMgu4uOZ6A3srCMqVyMBQwJo9ZPa+jf+UFw4/GE n2aV5tusUN6QVOVZ5a3qgmCzehMnZv5hNWyjMPM+DPB38nHdMVebwHIrgFZB1QGC7zEx4VGNQ/NGN6 5rVN58ustUhIbTBPSlYKxA5pYdfBVSOYsw+M/pzQa1ALWRYW8dxmzxmLcnS0tvlltknksaVmSeKurf u/d4W3x8A6aoA7JTUpuCJsL83OnrXkVhmVqtH8Uc3OLUu4LwA4TrxgGvTmWx8J3TdC4KalbjkwANpZ KfbRdkbB2YdwEezoyAWsxjXwKhCdie
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_822786_2C293181 
X-CRM114-Status: GOOD (  13.57  )
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

VGhlIGNsayBpcyBuZWNlc3NhcnkgZm9yIGJvdGggcmVnaXN0ZXIgYWNjZXNzIGFuZCAoZW5hYmxl
ZCkgb3BlcmF0aW9uIG9mCnRoZSBQV00uIEluc3RlYWQgb2YKCgljbGtfZW5hYmxlKCkKCXVwZGF0
ZV9odygpCglpZiBwd21fZ290X2VuYWJsZWQoKToKCQljbGtfZW5hYmxlKCkKCWVsaWYgcHdtX2dv
dF9kaXNhYmxlZCgpOgoJCWNsa19kaXNhYmxlKCkKCWNsa19kaXNhYmxlKCkKCndoaWNoIGlzIHNv
bWUgY2FzZXMgb25seSBjYWxscyBjbGtfZW5hYmxlKCkgdG8gaW1tZWRpYXRlbHkgYWZ0ZXJ3YXJk
cwpjYWxsIGNsa19kaXNhYmxlIGFnYWluLCBkbzoKCglpZiAoIXByZXZfc3RhdGUuZW5hYmxlZCkK
CQljbGtfZW5hYmxlKCkKCgkjIGNsayBlbmFibGVkIGV4YWN0bHkgb25jZQoKCXVwZGF0ZV9odygp
CgoJaWYgKCFuZXh0X3N0YXRlLmVuYWJsZWQpCgkJY2xrX2Rpc2FibGUoKQoKd2hpY2ggaXMgbXVj
aCBlYXNpZXIuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDI2ICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
IGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCmluZGV4IGQ4MzM1MzZiNWU3YS4uMzRkMjNkNTZm
YTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKKysrIGIvZHJpdmVycy9w
d20vcHdtLXNpZml2ZS5jCkBAIC0xNjgsMjQgKzE2OCwyNCBAQCBzdGF0aWMgaW50IHB3bV9zaWZp
dmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAog
CX0KIAltdXRleF91bmxvY2soJmRkYXRhLT5sb2NrKTsKIAotCXJldCA9IGNsa19lbmFibGUoZGRh
dGEtPmNsayk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRkYXRhLT5jaGlwLmRldiwgIkVuYWJs
ZSBjbGsgZmFpbGVkXG4iKTsKLQkJcmV0dXJuIHJldDsKKwkvKgorCSAqIElmIHRoZSBQV00gaXMg
ZW5hYmxlZCB0aGUgY2xrIGlzIGFscmVhZHkgb24uIFNvIG9ubHkgZW5hYmxlIGl0CisJICogY29u
ZGl0aW9uYWxseSB0byBoYXZlIGl0IG9uIGV4YWN0bHkgb25jZSBhZnRlcndhcmRzIGluZGVwZW5k
ZW50IG9mCisJICogdGhlIFBXTSBzdGF0ZS4KKwkgKi8KKwlpZiAoIWVuYWJsZWQpIHsKKwkJcmV0
ID0gY2xrX2VuYWJsZShkZGF0YS0+Y2xrKTsKKwkJaWYgKHJldCkgeworCQkJZGV2X2VycihkZGF0
YS0+Y2hpcC5kZXYsICJFbmFibGUgY2xrIGZhaWxlZFxuIik7CisJCQlyZXR1cm4gcmV0OworCQl9
CiAJfQogCiAJd3JpdGVsKGZyYWMsIGRkYXRhLT5yZWdzICsgUFdNX1NJRklWRV9QV01DTVAocHdt
LT5od3B3bSkpOwogCi0JaWYgKHN0YXRlLT5lbmFibGVkICE9IGVuYWJsZWQpIHsKLQkJaWYgKHN0
YXRlLT5lbmFibGVkKSB7Ci0JCQlpZiAoY2xrX2VuYWJsZShkZGF0YS0+Y2xrKSkKLQkJCQlkZXZf
ZXJyKGRkYXRhLT5jaGlwLmRldiwgIkVuYWJsZSBjbGsgZmFpbGVkXG4iKTsKLQkJfSBlbHNlIHsK
LQkJCWNsa19kaXNhYmxlKGRkYXRhLT5jbGspOwotCQl9Ci0JfQorCWlmICghc3RhdGUtPmVuYWJs
ZWQpCisJCWNsa19kaXNhYmxlKGRkYXRhLT5jbGspOwogCi0JY2xrX2Rpc2FibGUoZGRhdGEtPmNs
ayk7CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
