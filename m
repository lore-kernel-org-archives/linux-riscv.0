Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13478CCA485
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+uo8ohBWFGcKIOXb/7abhJkXOi7oRENVJS76BCsF/Y=; b=CwTHcGoAeaBp7r
	Kn/2kOSE9Z5QZsSgY2hEaiRjmP4qv0na15RccAimDKVSAkgSsQ1lWeuLA+Qi+Bxsw6jg1f+wt8XgM
	gYOoyHwlhZd3cnAK/y+/OVs0sfJCsOnv+LvfeAEYPFXiOyr3xKtJKFJwts6w3dgG3JdJi1jvQOF1S
	dHHJrZTrV3mF2re63NJZXTdxjhsK04GGD2yAuvAON9GMSWWWiv9noJ4HwYNsmcIaePMjzoPOjHb8k
	Bawo9ifULtKkWrFqpT4gXRclDJOR+3TU8ciJIt2pIVF2cAvxKtCI9VXwC/5KJSQ99wQm9K66zfQav
	E+ISGh4cwnyM/72jaO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTD-003rjw-S5; Thu, 21 Jul 2022 10:31:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcz-KB
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-0002W0-QW; Thu, 21 Jul 2022 12:31:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-002IMq-Rm; Thu, 21 Jul 2022 12:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSx-006ZIP-Od; Thu, 21 Jul 2022 12:31:35 +0200
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
Subject: [PATCH 4/7] pwm: sifive: Enable clk only after period check in .apply()
Date: Thu, 21 Jul 2022 12:31:26 +0200
Message-Id: <20220721103129.304697-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; h=from:subject; bh=c0fLWKgziDkgWoI6+H8lb5WHbrXxOiw4wARKI8YtL8w=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Sr1Zw4qH9xQt0jcTvyTAVVW8eBROsYO15Sy4QQA WoS5sU2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq9QAKCRDB/BR4rcrsCRvCB/ 9frF0VhcjV6YFcVmo+uGdJ5lcNa5Z7TmrJDlamHndttyGzLZ+3xD5JrHqwsCmGwYnxL+Z5qP1BWD3a cASV0TRseaXW0A+SbyGVyMOhZXGTpArSCUO1jCqoWcDsb+kavyPZJresq507ZPqpBQANP5X5sWG2Y/ 9l37G0coHGDTAN8NzI+qDZcynQVZcKIe+K+rhQ3ssLxVtFCiQPjUiuvslDNc1/wXyucXdeKgep9Azr f9ksZ+YmZYHN5pkJ+1ftn8gD7PuFLqqjy2rZUOd5U9fs2c5SAxtREuFlE7k5Xz4mXh40vYmNQlU7O1 wfq+fXcovK5KMepW7TroZ9ixWEnv2W
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_690039_852DFBDF 
X-CRM114-Status: GOOD (  13.09  )
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

Rm9yIHRoZSBwZXJpb2QgY2hlY2sgYW5kIHRoZSBpbml0aWFsIGNhbGN1bGF0aW9ucyBvZiByZWdp
c3RlciB2YWx1ZXMgdGhlcmUKaXMgbm8gaGFyZHdhcmUgYWNjZXNzIG5lZWRlZC4gU28gZGVsYXkg
ZW5hYmxpbmcgdGhlIGNsayBhIGJpdCB0byBzaW1wbGlmeQp0aGUgY29kZSBmbG93IGEgYml0LgoK
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAxOCArKysrKysrKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1z
aWZpdmUuYwppbmRleCA2MDE3ZTMxMWE4NzkuLmQ4MzM1MzZiNWU3YSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpAQCAt
MTM5LDEyICsxMzksNiBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9j
aGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWlmIChzdGF0ZS0+cG9sYXJpdHkg
IT0gUFdNX1BPTEFSSVRZX0lOVkVSU0VEKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXJldCA9IGNs
a19lbmFibGUoZGRhdGEtPmNsayk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRkYXRhLT5jaGlw
LmRldiwgIkVuYWJsZSBjbGsgZmFpbGVkXG4iKTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0KIAljdXJf
c3RhdGUgPSBwd20tPnN0YXRlOwogCWVuYWJsZWQgPSBjdXJfc3RhdGUuZW5hYmxlZDsKIApAQCAt
MTY3LDE0ICsxNjEsMTkgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlpZiAoc3RhdGUtPnBlcmlvZCAh
PSBkZGF0YS0+YXBwcm94X3BlcmlvZCkgewogCQlpZiAoZGRhdGEtPnVzZXJfY291bnQgIT0gMSkg
ewogCQkJbXV0ZXhfdW5sb2NrKCZkZGF0YS0+bG9jayk7Ci0JCQlyZXQgPSAtRUJVU1k7Ci0JCQln
b3RvIGV4aXQ7CisJCQlyZXR1cm4gLUVCVVNZOwogCQl9CiAJCWRkYXRhLT5hcHByb3hfcGVyaW9k
ID0gc3RhdGUtPnBlcmlvZDsKIAkJcHdtX3NpZml2ZV91cGRhdGVfY2xvY2soZGRhdGEsIGNsa19n
ZXRfcmF0ZShkZGF0YS0+Y2xrKSk7CiAJfQogCW11dGV4X3VubG9jaygmZGRhdGEtPmxvY2spOwog
CisJcmV0ID0gY2xrX2VuYWJsZShkZGF0YS0+Y2xrKTsKKwlpZiAocmV0KSB7CisJCWRldl9lcnIo
ZGRhdGEtPmNoaXAuZGV2LCAiRW5hYmxlIGNsayBmYWlsZWRcbiIpOworCQlyZXR1cm4gcmV0Owor
CX0KKwogCXdyaXRlbChmcmFjLCBkZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdNQ01QKHB3bS0+
aHdwd20pKTsKIAogCWlmIChzdGF0ZS0+ZW5hYmxlZCAhPSBlbmFibGVkKSB7CkBAIC0xODYsOSAr
MTg1LDggQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hp
cCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJfQogCX0KIAotZXhpdDoKIAljbGtfZGlzYWJs
ZShkZGF0YS0+Y2xrKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHB3bV9vcHMgcHdtX3NpZml2ZV9vcHMgPSB7Ci0tIAoyLjM2LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
