Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE59C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=il3Ag3VPwvDeoG588AFq7KBckvk8HHB0AR3w5KHISfs=; b=0ZmnwbCZLmgdcy
	adnT7Y6igodNoyCkI0z08BugCfTVNK8gaNVYMRXeGgjRp3QFJ5PlnVASeL+CCoJoom3IZYoRQuI4U
	Besy+1cykFO/FFH9fAUem4v45vcl6rGjoJopRkXcfhCbz3oGETspTD6AHQkI/ksgUXlYxdTcdfCAD
	8zpW5F6ATbt71VwY4tjwNdQNH68Xt/LiZcbLwZZ914Bmuz/U1iGyX326ODx7w2FUpiP2NZZGXZnvj
	s8IAY77WRlHBz6gNeiZCZiy9yo0Lg270RXd8BMhXFT2Ed0/tTisBNU4rvuHHksytbB3LDJ0XijQRN
	kILeNkMOZe0iJ1wcQ7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETTM-003rqO-Ik; Thu, 21 Jul 2022 10:32:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oETT9-003rcm-OE
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 10:31:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETT0-0002W2-4g; Thu, 21 Jul 2022 12:31:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSz-002IMw-C6; Thu, 21 Jul 2022 12:31:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oETSy-006ZIV-3T; Thu, 21 Jul 2022 12:31:36 +0200
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
Subject: [PATCH 6/7] pwm: sifive: Ensure the clk is enabled exactly one per running PWM
Date: Thu, 21 Jul 2022 12:31:28 +0200
Message-Id: <20220721103129.304697-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; h=from:subject; bh=3zYgBnySD37iMkEgERXBOZoG3gCLgbZr9s4K5gsrSaA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2Sr7s1Xee6KOfmM8IAOEhYJt8QASWiil0jdPQCuL 7xvik02JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtkq+wAKCRDB/BR4rcrsCWApB/ 9NmQ9Q2qgZCanYCyvqEAK0xeFbuNNq+pNUjV8I2bonDCLHyDawvdSynIyKzsXmnJsroYGrZuYcARPs ucb5MqG89QIvc94pYH/Nl2EAOz46lzslSUeKuml/WX8qndJbdqwnOYSHvX/8wo8aSdqgrOCH+/IHQ2 NT/n8pFBMDGO482OwHemUB7URNV1IJezr3U/ga5yxdZn9ZIfV2vhzt/jKn7J/WBeI10WQ2snXRz0eI uWDsQg04L2Nb/8Phl5S+mtQ5tTX+uUOziII2Dop+FtcJ5/fww+nEZeBSj2R39btihQA5zuPaWtQpky t198LoUZn2O2oeQ0LtHN95Gu9wfjRK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_033147_835507_40FA7B11 
X-CRM114-Status: GOOD (  20.31  )
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

LmFwcGx5KCkgYXNzdW1lcyB0aGUgY2xrIHRvIGJlIGZvciBhIGdpdmVuIFBXTSBpZmYgdGhlIFBX
TSBpcyBlbmFibGVkLgpTbyBtYWtlIHN1cmUgdGhpcyBpcyB0aGUgY2FzZSB3aGVuIC5wcm9iZSgp
IGNvbXBsZXRlcy4gQW5kIGluIC5yZW1vdmUoKQpkaXNhYmxlIHRoZSBhY2NvcmRpbmcgbnVtYmVy
IG9mIHRpbWVzLgoKVGhpcyBmaXhlcyBhIGNsayBlbmFibGUvZGlzYWJsZSBpbWJhbGFuY2UsIGlm
IHNvbWUgUFdNcyBhcmUgYWxyZWFkeSBydW5uaW5nCmF0IHByb2JlIHRpbWUuCgpGaXhlczogOWUz
N2E1M2ViMDUxIChwd206IHNpZml2ZTogQWRkIGEgZHJpdmVyIGZvciBTaUZpdmUgU29DIFBXTSkK
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCA0NiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZl
LmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKaW5kZXggMzRkMjNkNTZmYTI1Li5kYTQwYWRl
MGViZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYworKysgYi9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKQEAgLTIxNiw2ICsyMTYsOCBAQCBzdGF0aWMgaW50IHB3bV9zaWZp
dmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgcHdtX3NpZml2
ZV9kZGF0YSAqZGRhdGE7CiAJc3RydWN0IHB3bV9jaGlwICpjaGlwOwogCWludCByZXQ7CisJdTMy
IHZhbDsKKwl1bnNpZ25lZCBpbnQgZW5hYmxlZF9wd21zID0gMCwgZW5hYmxlZF9jbGtzID0gMTsK
IAogCWRkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkZGF0YSksIEdGUF9LRVJORUwp
OwogCWlmICghZGRhdGEpCkBAIC0yNDIsNiArMjQ0LDMzIEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCX0K
IAorCXZhbCA9IHJlYWRsKGRkYXRhLT5yZWdzICsgUFdNX1NJRklWRV9QV01DRkcpOworCWlmICh2
YWwgJiBQV01fU0lGSVZFX1BXTUNGR19FTl9BTFdBWVMpIHsKKwkJdW5zaWduZWQgaW50IGk7CisK
KwkJZm9yIChpID0gMDsgaSA8IGNoaXAtPm5wd207ICsraSkgeworCQkJdmFsID0gcmVhZGwoZGRh
dGEtPnJlZ3MgKyBQV01fU0lGSVZFX1BXTUNNUChpKSk7CisJCQlpZiAodmFsID4gMCkKKwkJCQkr
K2VuYWJsZWRfcHdtczsKKwkJfQorCX0KKworCS8qIFRoZSBjbGsgc2hvdWxkIGJlIG9uIG9uY2Ug
Zm9yIGVhY2ggcnVubmluZyBQV00uICovCisJaWYgKGVuYWJsZWRfcHdtcykgeworCQl3aGlsZSAo
ZW5hYmxlZF9jbGtzIDwgZW5hYmxlZF9wd21zKSB7CisJCQkvKiBUaGlzIGlzIG5vdCBleHBlY3Rl
ZCB0byBmYWlsIGFzIHRoZSBjbGsgaXMgYWxyZWFkeSBvbiAqLworCQkJcmV0ID0gY2xrX2VuYWJs
ZShkZGF0YS0+Y2xrKTsKKwkJCWlmICh1bmxpa2VseShyZXQpKSB7CisJCQkJZGV2X2Vycl9wcm9i
ZShkZXYsIHJldCwgIkZhaWxlZCB0byBlbmFibGUgY2xrXG4iKTsKKwkJCQlnb3RvIGRpc2FibGVf
Y2xrOworCQkJfQorCQkJKytlbmFibGVkX2Nsa3M7CisJCX0KKwl9IGVsc2UgeworCQljbGtfZGlz
YWJsZShkZGF0YS0+Y2xrKTsKKwkJZW5hYmxlZF9jbGtzID0gMDsKKwl9CisKIAkvKiBXYXRjaCBm
b3IgY2hhbmdlcyB0byB1bmRlcmx5aW5nIGNsb2NrIGZyZXF1ZW5jeSAqLwogCWRkYXRhLT5ub3Rp
Zmllci5ub3RpZmllcl9jYWxsID0gcHdtX3NpZml2ZV9jbG9ja19ub3RpZmllcjsKIAlyZXQgPSBj
bGtfbm90aWZpZXJfcmVnaXN0ZXIoZGRhdGEtPmNsaywgJmRkYXRhLT5ub3RpZmllcik7CkBAIC0y
NjQsNyArMjkzLDExIEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogdW5yZWdpc3Rlcl9jbGs6CiAJY2xrX25vdGlmaWVyX3VucmVnaXN0
ZXIoZGRhdGEtPmNsaywgJmRkYXRhLT5ub3RpZmllcik7CiBkaXNhYmxlX2NsazoKLQljbGtfZGlz
YWJsZV91bnByZXBhcmUoZGRhdGEtPmNsayk7CisJd2hpbGUgKGVuYWJsZWRfY2xrcykgeworCQlj
bGtfZGlzYWJsZShkZGF0YS0+Y2xrKTsKKwkJLS1lbmFibGVkX2Nsa3M7CisJfQorCWNsa191bnBy
ZXBhcmUoZGRhdGEtPmNsayk7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtMjcyLDIxICszMDUsMTYg
QEAgc3RhdGljIGludCBwd21fc2lmaXZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiBzdGF0aWMgaW50IHB3bV9zaWZpdmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSAqZGRhdGEgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShkZXYpOwotCWJvb2wgaXNfZW5hYmxlZCA9IGZhbHNlOwogCXN0cnVjdCBwd21fZGV2
aWNlICpwd207CiAJaW50IGNoOwogCiAJZm9yIChjaCA9IDA7IGNoIDwgZGRhdGEtPmNoaXAubnB3
bTsgY2grKykgewogCQlwd20gPSAmZGRhdGEtPmNoaXAucHdtc1tjaF07Ci0JCWlmIChwd20tPnN0
YXRlLmVuYWJsZWQpIHsKLQkJCWlzX2VuYWJsZWQgPSB0cnVlOwotCQkJYnJlYWs7Ci0JCX0KKwkJ
aWYgKHB3bS0+c3RhdGUuZW5hYmxlZCkKKwkJCWNsa19kaXNhYmxlKGRkYXRhLT5jbGspOwogCX0K
LQlpZiAoaXNfZW5hYmxlZCkKLQkJY2xrX2Rpc2FibGUoZGRhdGEtPmNsayk7CiAKLQljbGtfZGlz
YWJsZV91bnByZXBhcmUoZGRhdGEtPmNsayk7CisJY2xrX3VucHJlcGFyZShkZGF0YS0+Y2xrKTsK
IAlwd21jaGlwX3JlbW92ZSgmZGRhdGEtPmNoaXApOwogCWNsa19ub3RpZmllcl91bnJlZ2lzdGVy
KGRkYXRhLT5jbGssICZkZGF0YS0+bm90aWZpZXIpOwogCi0tIAoyLjM2LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
