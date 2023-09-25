Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB60ECE7A97
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2mXUGVc1MNG7S3GjJcUKQFeS4Ar0WmREQrnOD5q8l8=; b=iviFkKxZuV1XaJ
	B8praRGBp5XF7Gguw1A+yjL4muB1fOILwNzwshMh59WLhLZZmquZdUfuT81mWaZs44+mWKdrOVbGP
	E/J5disOJoiPFw5jaKumaY/7h8XXGYThO22qfz6EpSJkpPccBo/8gW6PF7pkeu+0V32ddvfQ3zsuo
	93zOAQrE8wpIgN7fVAoGlakcRCj58aDWvtuCbi7MScv3qjk61+uKG2w7BdmkfEZW0IKZw72ZgNGW/
	zPFRpf6kdgUKEUfF1N3cf7cMWlJhGDNXIJjIASevI+zbcV72fyYAOjGheX9Yr9Mnzj/Dd91mf+OtH
	oK3brvBQOSWR80cDK1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJs-00DtrJ-2H;
	Mon, 25 Sep 2023 09:56:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJc-00DtfP-3C
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 09:55:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJY-0007vo-4O; Mon, 25 Sep 2023 11:55:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJX-008pzZ-76; Mon, 25 Sep 2023 11:55:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJW-004dlO-UI; Mon, 25 Sep 2023 11:55:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 16/40] soc/microchip: mpfs-sys-controller: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:55:07 +0200
Message-Id: <20230925095532.1984344-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qMSvMdLyWMVv0eJCyiyAecwlWse+6vZrOq8DCVNTw0k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhRLmiPsKzsDJkYR+pBw2aoZnqSIdabHXV7C DpcqEXgCa2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYUQAKCRCPgPtYfRL+ TmTYB/99Y/TSuw+jf9J9wshJHpxLVPHGRUpd5pY81V4tLP2iw+PzEksAiYPeQymUzFoH1qsh1Is t/RZu7byjFUcQGsdQUHYb01thd2I/BwqgtXqnj+9f12ZgIjs7T4uvIpZsMzscvrM2Z1/sMclYZV wdhVIxGpotONKw8apwUR4kd/G8FCPI2TcopqkrjyY9Ct4lrPx14ra2v6XX2VDVxBuH8RCNM/Ux4 eRqP8T8xLhpjFcbn9JNZGJucAUxruSr0cvVjqp0poxFMXVTwr7UVF+8ZZLrWnC6oyqNUrWCyCad HSTQYlWFtRsmsaS2sIQWLy7FhEOniQGQem/769udRIwibvDm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_025545_026487_B3A683F6 
X-CRM114-Status: GOOD (  14.98  )
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
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgoKVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYyB8IDYgKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMgYi9kcml2ZXJzL3NvYy9t
aWNyb2NoaXAvbXBmcy1zeXMtY29udHJvbGxlci5jCmluZGV4IGZiY2Q1ZmQyNGQ3Yy4uMDkzNWU5
ZTk0MTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvYy9taWNyb2NoaXAvbXBmcy1zeXMtY29udHJv
bGxlci5jCisrKyBiL2RyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMK
QEAgLTE0OSwxMyArMTQ5LDExIEBAIHN0YXRpYyBpbnQgbXBmc19zeXNfY29udHJvbGxlcl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMg
aW50IG1wZnNfc3lzX2NvbnRyb2xsZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCitzdGF0aWMgdm9pZCBtcGZzX3N5c19jb250cm9sbGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtcGZzX3N5c19jb250cm9sbGVyICpzeXNfY29u
dHJvbGxlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJbXBmc19zeXNfY29udHJv
bGxlcl9wdXQoc3lzX2NvbnRyb2xsZXIpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1wZnNfc3lzX2NvbnRyb2xsZXJfb2ZfbWF0Y2hbXSA9IHsK
QEAgLTIwNyw3ICsyMDUsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtcGZzX3N5
c19jb250cm9sbGVyX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gbXBmc19zeXNfY29u
dHJvbGxlcl9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZSA9IG1wZnNfc3lzX2NvbnRyb2xsZXJfcHJv
YmUsCi0JLnJlbW92ZSA9IG1wZnNfc3lzX2NvbnRyb2xsZXJfcmVtb3ZlLAorCS5yZW1vdmVfbmV3
ID0gbXBmc19zeXNfY29udHJvbGxlcl9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cihtcGZzX3N5c19jb250cm9sbGVyX2RyaXZlcik7CiAKLS0gCjIuNDAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
