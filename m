Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E087C4167D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXfAxk0XwxGap9Vtk+TWQdM9CAXCBBJFChfaGjjTrEY=; b=pbW5zR8rp1u5Pg
	CuzUrnYhkg8MN9DlCUsAvcrtfCU0qLAB4GsW6/6eNAQdNLMYKS+Z9gsOzNi49uON75nIQNubEOeww
	VcojhfceXLHUNvgy43Z3Zhv5Ns/K+SziH2Uzv+Yx4IWqoDrZ67UeUWEIXU1bqy76M7/yieuAxCxyt
	uJk1D39jXDJ3XCjanfuu6ViX+t772t7los8ktnQBP432YOca9Tr8mYw5ejZUDYzOV9/T372ZXaYXt
	5oSABbDQL7N6gbbhYqH6Cr33hp36Z14ahSSPF6jd9diZsSGRXCG40brkVThAZjnu+qjUKckhIUmDW
	comqDd1W81VfDHAuXFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TTe-0090zw-12;
	Fri, 10 Nov 2023 15:31:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1TTN-0090n1-1f
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 15:31:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT7-0006Qj-6M; Fri, 10 Nov 2023 16:30:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT5-0083L8-R0; Fri, 10 Nov 2023 16:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT5-00GnxP-Hd; Fri, 10 Nov 2023 16:30:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Nick Hu <nick.hu@sifive.com>,
	Tobias Klauser <tklauser@distanz.ch>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	kernel@pengutronix.de,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 39/52] serial: sifive: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:30:07 +0100
Message-ID: <20231110152927.70601-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LLOyW1hbM0/SN58Bgrwns/zlLR/bVWIngKf4jnPWkd0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTkyJRJnUsGPDONa/lKdc3LcXHVgixiKyNcrZf Ql98Gr9N66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU5MiQAKCRCPgPtYfRL+ TtI5B/4jgW6OlsjFTMzan1QKVqk5oRoSVSC44upo/WbaxMGlfGN/boqM1VGFtDAFLsjZ3tXPa+E L0CvM1rrNsgOkjPdS/dtjtVLS5ZHDXfXn4kOlADqDTWrSkP3kT5Xgph78LFVtnAq6dl/LKkFefY sRsdi2Zh5llDfiODVzPLWwiqEPrK8GhmBwlJO08eRFNzMCWkwjHfKXRxpnL8csaB+8G3ub0bLUn +O+H8o6AZBu5dhvTgfmE0Rjd3IHHahBIOsizkso7yTGTEwFZSoTIFWmMRzB/JwOoN9WacIXb2lo 4NvBq/PRAnuzI/fENiGvcyYJEj84GuL1WFkffkO3X1Zvhvdf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_073105_559962_9E520FA7 
X-CRM114-Status: GOOD (  16.02  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvc2lmaXZlLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKaW5kZXggYjI5NmU1N2E5
ZGVlLi4zNTQxMjM1YTNhYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUu
YworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKQEAgLTEwMDcsNyArMTAwNyw3IEBA
IHN0YXRpYyBpbnQgc2lmaXZlX3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXJldHVybiByOwogfQogCi1zdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIHNpZml2ZV9zZXJpYWxfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgc2lmaXZlX3Nlcmlh
bF9wb3J0ICpzc3AgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOwogCkBAIC0xMDE1LDggKzEw
MTUsNiBAQCBzdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKmRldikKIAl1YXJ0X3JlbW92ZV9vbmVfcG9ydCgmc2lmaXZlX3NlcmlhbF91YXJ0X2Ry
aXZlciwgJnNzcC0+cG9ydCk7CiAJZnJlZV9pcnEoc3NwLT5wb3J0LmlycSwgc3NwKTsKIAljbGtf
bm90aWZpZXJfdW5yZWdpc3Rlcihzc3AtPmNsaywgJnNzcC0+Y2xrX25vdGlmaWVyKTsKLQotCXJl
dHVybiAwOwogfQogCiBzdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxfc3VzcGVuZChzdHJ1Y3QgZGV2
aWNlICpkZXYpCkBAIC0xMDQ1LDcgKzEwNDMsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
aWZpdmVfc2VyaWFsX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c2lmaXZlX3NlcmlhbF9wbGF0Zm9ybV9kcml2ZXIgPSB7CiAJLnByb2JlCQk9IHNpZml2ZV9zZXJp
YWxfcHJvYmUsCi0JLnJlbW92ZQkJPSBzaWZpdmVfc2VyaWFsX3JlbW92ZSwKKwkucmVtb3ZlX25l
dwk9IHNpZml2ZV9zZXJpYWxfcmVtb3ZlLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9IFNJRklW
RV9TRVJJQUxfTkFNRSwKIAkJLnBtID0gcG1fc2xlZXBfcHRyKCZzaWZpdmVfdWFydF9wbV9vcHMp
LAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
