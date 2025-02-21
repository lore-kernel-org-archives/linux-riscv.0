Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9974C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZDSs5wSAbPtGhQCD2d6zUGUpzBezeQr6YU186xmFvQ=; b=EQXxVCnh27BZiC
	lS4B7ituoh2bPP4wX32OxqORHD93sMy9R7hrzTAgudzALIxfm2bY1ZN4chEi7ow1zwIbj3E3mhoHv
	1hYPYNZJW17Uyj1kFrRqocgtq9y1BqMzfpMWOaeEf6i9paz11GxQgJ0wJ3KsjGVCNmXYLF2e5exbz
	ezQMebPIuxlj3+a76L5gwAkGT8PDPWYpVz5d6eMfuqIMlNR4mEM0yuEGkdK3Ld3TxH9PEW6yuueH2
	Gw1T3hKsFI2xoe7t1yfAhUNnXH3v8Q6fc80i06LgV03KSYwtKKww42rJfaZSuxJ1xookxohwOyAW9
	UAUTr325kC9VKUFlUs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVqe-00000006Ahb-20q4;
	Fri, 21 Feb 2025 16:25:56 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj3-000000068Jj-2VsB;
	Fri, 21 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UFXO1Gy61HIc3X2s04g2rF4mqurOzi2/2JTsODv/dro=; b=1o8W83wHSBrDm/t1B7qCpi4ixz
	kf7OYIbWcpgCR+W1fnJIk9ILEvIsEbePlyNmxteQto38eQZK6X3bWzcIHM/uNLN/bnhwOwlEZ78Pn
	/Zac86Vl6IzLzK/YrbB8gywurgnIbab7Cu581QjuwUxEMpO9rKuVUdB4dSRULi8Vo+CYFWIH7cFFK
	nCxQaB55szc822dBf1LSfD8LYwZf7ackLHJsjLAkagUpwIdbm9rAxE3MyMp92QrVNeJll1F5SGzaW
	X2m0uBcUfIZTv4I0Ijn5OlcF7PBhwgI9esG8YF2zqsZ4B2v/UOE59YT0NI1fL1OIoNRK+3lgLWORV
	WZTju8dA==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViv-00AOLX-0d;
	Fri, 21 Feb 2025 17:17:57 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Date: Fri, 21 Feb 2025 17:17:48 +0100
Message-Id: <20250221161751.1278049-3-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081805_810334_B482BDCC 
X-CRM114-Status: GOOD (  16.94  )
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

T24gQWxsd2lubmVyIGNoaXBzIHdpdGggYSBjb21ibyBELVBIWSwgdGhlIFRDT04gTENEMCBzaG91
bGQgZmV0Y2ggaXQKZnJvbSBkZXZpY2UgdHJlZSwgaW4gb3JkZXIgdG8gZW5hYmxlIExWRFMuIFNp
bmNlIHRoZSBQSFkgYWxzbyBuZWVkcyB0bwpiZSBwb3dlcmVkIG9mZiB0byBkaXNhYmxlIExWRFMs
IGFkZCBhIGZ1bmN0aW9uIHRvIHRoZSBxdWlya3MuCgpTaWduZWQtb2ZmLWJ5OiBLdWJhIFN6Y3pv
ZHJ6ecWEc2tpIDxrdWJhQHN6Y3pvZHJ6eW5za2kucGw+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX3Rjb24uYyB8IDEyICsrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX3Rjb24uaCB8ICA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKaW5kZXggOTYwZTgzYzgyLi5jY2YzMzVh
NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpAQCAtMTIsNiArMTIsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8
bGludXgvb2ZfcGxhdGZvcm0uaD4KKyNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KQEAgLTE4Myw2ICsxODQsOCBAQCBzdGF0aWMgdm9pZCBz
dW40aV90Y29uX2x2ZHNfc2V0X3N0YXR1cyhzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAl9IGVs
c2UgewogCQlyZWdtYXBfdXBkYXRlX2JpdHModGNvbi0+cmVncywgU1VONElfVENPTjBfTFZEU19J
Rl9SRUcsCiAJCQkJICAgU1VONElfVENPTjBfTFZEU19JRl9FTiwgMCk7CisJCWlmICh0Y29uLT5x
dWlya3MtPmRpc2FibGVfbHZkc19waHkpCisJCQl0Y29uLT5xdWlya3MtPmRpc2FibGVfbHZkc19w
aHkodGNvbiwgZW5jb2Rlcik7CiAJfQogfQogCkBAIC0xMjQ1LDYgKzEyNDgsMTUgQEAgc3RhdGlj
IGludCBzdW40aV90Y29uX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsCiAJCWdvdG8gZXJyX2ZyZWVfZGNsazsKIAl9CiAKKwlpZiAodGNvbi0+cXVpcmtzLT5o
YXNfY29tYm9fZHBoeSkgeworCQl0Y29uLT5kcGh5ID0gZGV2bV9waHlfZ2V0KGRldiwgImRwaHki
KTsKKwkJaWYgKElTX0VSUih0Y29uLT5kcGh5KSkgeworCQkJZGV2X2VycihkZXYsICJDb3VsZG4n
dCBnZXQgdGhlIGNvbWJvIEQtUEhZXG4iKTsKKwkJCXJldCA9IFBUUl9FUlIodGNvbi0+ZHBoeSk7
CisJCQlnb3RvIGVycl9mcmVlX2RjbGs7CisJCX0KKwl9CisKIAlpZiAodGNvbi0+cXVpcmtzLT5o
YXNfY2hhbm5lbF8wKSB7CiAJCS8qCiAJCSAqIElmIHdlIGhhdmUgYW4gTFZEUyBwYW5lbCBjb25u
ZWN0ZWQgdG8gdGhlIFRDT04sIHdlIHNob3VsZApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjRpX3Rjb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmgK
aW5kZXggZmEyM2FhMjNmLi5iMjcwZDFhMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW40aV90Y29uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24u
aApAQCAtMjM5LDYgKzIzOSw3IEBAIHN0cnVjdCBzdW40aV90Y29uX3F1aXJrcyB7CiAJYm9vbAlo
YXNfY2hhbm5lbF8wOwkvKiBhODN0IGRvZXMgbm90IGhhdmUgY2hhbm5lbCAwIG9uIHNlY29uZCBU
Q09OICovCiAJYm9vbAloYXNfY2hhbm5lbF8xOwkvKiBhMzMgZG9lcyBub3QgaGF2ZSBjaGFubmVs
IDEgKi8KIAlib29sCWhhc19sdmRzX2FsdDsJLyogRG9lcyB0aGUgTFZEUyBjbG9jayBoYXZlIGEg
cGFyZW50IG90aGVyIHRoYW4gdGhlIFRDT04gY2xvY2s/ICovCisJYm9vbAloYXNfY29tYm9fZHBo
eTsgLyogSXMgdGhlIEQtUEhZIHVzZWQgZm9yIExWRFMgb3V0cHV0PyAqLwogCWJvb2wJbmVlZHNf
ZGVfYmVfbXV4OyAvKiBzdW42aSBuZWVkcyBtdXggdG8gc2VsZWN0IGJhY2tlbmQgKi8KIAlib29s
ICAgIG5lZWRzX2VkcF9yZXNldDsgLyogYTgwIGVkcCByZXNldCBuZWVkZWQgZm9yIHRjb24wIGFj
Y2VzcyAqLwogCWJvb2wJc3VwcG9ydHNfbHZkczsgICAvKiBEb2VzIHRoZSBUQ09OIHN1cHBvcnQg
YW4gTFZEUyBvdXRwdXQ/ICovCkBAIC0yNTAsNiArMjUxLDggQEAgc3RydWN0IHN1bjRpX3Rjb25f
cXVpcmtzIHsKIAkvKiBoYW5kbGVyIGZvciBMVkRTIHNldHVwIHJvdXRpbmUgKi8KIAl2b2lkCSgq
c2V0dXBfbHZkc19waHkpKHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAogCQkJCSAgY29uc3Qgc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKKwl2b2lkCSgqZGlzYWJsZV9sdmRzX3BoeSkoc3Ry
dWN0IHN1bjRpX3Rjb24gKnRjb24sCisJCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2Rlcik7CiB9OwogCiBzdHJ1Y3Qgc3VuNGlfdGNvbiB7CkBAIC0yODIsNiArMjg1LDkgQEAg
c3RydWN0IHN1bjRpX3Rjb24gewogCS8qIEFzc29jaWF0ZWQgY3J0YyAqLwogCXN0cnVjdCBzdW40
aV9jcnRjCQkqY3J0YzsKIAorCS8qIEFzc29jaWF0ZWQgRC1QSFkgKi8KKwlzdHJ1Y3QgcGh5CQkJ
KmRwaHk7CisKIAlpbnQJCQkJaWQ7CiAKIAkvKiBUQ09OIGxpc3QgbWFuYWdlbWVudCAqLwotLSAK
Mi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
