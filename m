Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94656C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9jq1y3ZN8SA6CAnAU/MgyP6A1+2ThLqM/q4tknG7Dg=; b=WjKUbQGLLFlagO
	IqTJ1b0P5OJHE5h7ygFVBDhqFfzN3aMprQJuXw263w1FN3IeDPLEIzW7V8Q4LzPkk2rNPOrT/Isn0
	Kfg91xu//QClHhsXcacVwXtrhYXTasiYO00qfkiKSv0vJ8CqVHS+FyeO6oR1z44Ny2jBGGsTWf3Il
	7jIml+ANKUZeTMxPDDBRLhzV8Z/qaihiUMrbvsDmjSbsOfEILi2UpMKkt2KTFUQG4fMQWqrCowljE
	+GRtPxvYQNPHLai+LQkzcMStC0KwvBmTMqxpsPjCjQNl89sSYUbPHXj+M1xjAxJvslnXKxafTe+SZ
	YF3Yl1COG44Asj5m+VZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY973-006tk3-5i; Fri, 03 Mar 2023 17:22:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95f-006t2t-Be
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:21:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Y-0006k5-3C; Fri, 03 Mar 2023 18:21:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95W-001blL-Rk; Fri, 03 Mar 2023 18:20:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95W-001tkA-7P; Fri, 03 Mar 2023 18:20:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 36/87] spi: microchip-core-qspi: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:50 +0100
Message-Id: <20230303172041.2103336-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TY+4UnhTgaVXz3hOuActUGQoANtfkS0l1nNGk0gJEE4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAiuWWzzNvhL2p7GMZaF5CaagYkEwpwxU5ZAJv ONODTm9de+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrlgAKCRDB/BR4rcrs CYIQB/9ZrF0OG1yobv/duGrJtJqEaqcvRH6h2W6ISjaBxqT2z6MdZq+mywmfKTesM+LpCb0tg8C NgbOUjgsUMuvMj9G5jIwjG3SOYoEcseSydEU3St9QlwTgH1eAnZRw7/d4lB1miyVtQzZpo81Quj n6trGlwoFy293KtBqzGRQTKbLZT/4uAHPXixtIHuBetEk2jvbqrOIeGISl32FvF9jj+m5xkaaeN EXaU0posOFawGEOb8za3eywN7qCndw1z6AbiKMm5MO6lWgwhDM4SsryyhL2gCvQFNG1SV2ILgVA VGG/9NnzSjxI53hd7edsfGcU9UJxilGsU2aj2OgVxbYTNZ/2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092107_433693_6EB371C2 
X-CRM114-Status: GOOD (  15.69  )
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
dmVycy9zcGkvc3BpLW1pY3JvY2hpcC1jb3JlLXFzcGkuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3BpL3NwaS1taWNyb2NoaXAtY29yZS1xc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktbWljcm9j
aGlwLWNvcmUtcXNwaS5jCmluZGV4IDE5YTZhNDY4MjlmNi4uNGY3NmRkZjk3YjEwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3NwaS9zcGktbWljcm9jaGlwLWNvcmUtcXNwaS5jCisrKyBiL2RyaXZlcnMv
c3BpL3NwaS1taWNyb2NoaXAtY29yZS1xc3BpLmMKQEAgLTU2Niw3ICs1NjYsNyBAQCBzdGF0aWMg
aW50IG1jaHBfY29yZXFzcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAly
ZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1jaHBfY29yZXFzcGlfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBtY2hwX2NvcmVxc3BpX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBtY2hwX2NvcmVxc3BpICpx
c3BpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJdTMyIGNvbnRyb2wgPSByZWFkbF9y
ZWxheGVkKHFzcGktPnJlZ3MgKyBSRUdfQ09OVFJPTCk7CkBAIC01NzUsOCArNTc1LDYgQEAgc3Rh
dGljIGludCBtY2hwX2NvcmVxc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWNvbnRyb2wgJj0gfkNPTlRST0xfRU5BQkxFOwogCXdyaXRlbF9yZWxheGVkKGNvbnRyb2ws
IHFzcGktPnJlZ3MgKyBSRUdfQ09OVFJPTCk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHFzcGkt
PmNsayk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbWNocF9jb3JlcXNwaV9vZl9tYXRjaFtdID0gewpAQCAtNTkxLDcgKzU4OSw3IEBAIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1jaHBfY29yZXFzcGlfZHJpdmVyID0gewogCQkubmFt
ZSA9ICJtaWNyb2NoaXAsY29yZXFzcGkiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBtY2hwX2NvcmVx
c3BpX29mX21hdGNoLAogCX0sCi0JLnJlbW92ZSA9IG1jaHBfY29yZXFzcGlfcmVtb3ZlLAorCS5y
ZW1vdmVfbmV3ID0gbWNocF9jb3JlcXNwaV9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihtY2hwX2NvcmVxc3BpX2RyaXZlcik7CiAKLS0gCjIuMzkuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
