Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E21ACF34D5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sCm41fhO3RvvrOHSXxkoanSGFDzyDZTOYEkW5pFur1M=; b=oudkoJS31XYetg
	i2GPZUG9f533jzh96/QTWfjDSkmoNz1Si6sSodKSoYFLQSu1956lOikPImQqBGWPz5baWI2guOu2W
	EwwZqikrI9zAQ9tqLI6DdGrGaiY0kJW3s1IPBZBqSKxXsAgln+qRrYRmlgMHos/s5YqaQH6yG7OGO
	nl8X2tjpoP/2dXlQVyxaXYuSfM9G1VwhUsroD6qbxJX9zrRI1kJhGLqOe6KeVoGVX+0o9kfmcpJAp
	VT8l4+Jhv0xHOL8dfjrz3jxtCqq72VCDnLKA+XqQTR4NZXjW8FBNgtrI+ikg0WTUZq0IU9TlBv/D0
	GNyY/Spz8fzERjcdykDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjxH-00000003TjV-2GfT;
	Wed, 19 Nov 2025 15:18:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjxF-00000003Tiz-0mST
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 15:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 846B843CB2;
	Wed, 19 Nov 2025 15:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B3C16AAE;
	Wed, 19 Nov 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763565524;
	bh=BV0+oJp55OaG73vSKM3QbI89e9sCDc8t5TtKjk1GcPI=;
	h=From:To:Cc:Subject:Date:From;
	b=p5stpctk3TGwUVCqj/L3a9gC2sP1jL6cO4XkDOSZG35WGh9sTK746Hs/h8QdOzO1+
	 g9m+xIyZBqv8Qz7zs1hgEd/2Joz1/5Cjrf5mBRZhrmUauMRgSrL84F2/ZI6L1YbAZc
	 F9P+gll2FPh17XWn7i70yLTypV2pNGzlC04Ynrgg4xoopuwpL7VPFsi9Ph47TMV2L/
	 57L1eero+Q9cM+zDREXRCTlEsXwPOHCxdFbz7DkbApqaALLh5KCmpetAjSRbV+g9ix
	 QGlZ2BtnXyt+ypFzULbSr300eUZhMJ6BhQ+M574iHikH23EVM+8xOf3bWckzcaUlVW
	 zK3Xabq3JGB+g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Michael=20B=C3=BCsch?= <mb@bues.ch>
Subject: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Date: Wed, 19 Nov 2025 23:00:49 +0800
Message-ID: <20251119150049.13537-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_071845_273794_6B3102D9 
X-CRM114-Status: GOOD (  14.00  )
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

Rm9sZCBkd2FwYl9jb250ZXh0IGludG8gc3RydWN0IGR3YXBiX2dwaW9fcG9ydCB0byBmdXJ0aGVy
IHNpbXBsaWZ5CnRoZSBjb2RlLiBTdXJlIHRoaXMgYnJpbmdzIGEgdGlueSAzNiBieXRlcyBkYXRh
IG92ZXJoZWFkIGZvcgohUE1fU0xFRVAuIEFmdGVyIGdyZXBwaW5nIHRoZSBhcm0vYXJtNjQvcmlz
Y3YgZHRzIGRpciwgdGhlIG1heCBkd2FwYgpncGlvIHBvcnQgbnVtYmVyIGlzIDYodGhlIGJlcmxp
bjJxIHNvYyBmYW1pbHkpLCBzbyB0aGlzIG1lYW5zIHdlIHdpbGwKd2FzdGUgMjE2IGJ5dGVzIG1l
bW9yeSBpbiB0b3RhbCB3aGljaCBpcyB0cml2aWFsIGNvbXBhcmVkIHRvIHRoZQpzeXN0ZW0gbWVt
b3J5LgoKRnJvbSBhbm90aGVyIHNpZGUsIGFzIE1pY2hhZWwgbWVudGlvbmVkOgoiVGhlIGRyaXZl
ciBjdXJyZW50bHkgYWxsb2NhdGVzIHRoZSBzdHJ1Y3Qgd2l0aCBremFsbG9jIGFuZCBzdG9yZXMg
YQpwb2ludGVyIHRvIGl0IGluIGNhc2Ugb2YgUE09eS4KU28gdGhpcyBwcm9iYWJseSBoYXMgYW4g
b3ZlcmhlYWQgaW4gdGhlIHNhbWUgb3JkZXIgb2YgbWFnbml0dWRlCihwb2ludGVyICsgbWFsbG9j
IG92ZXJoZWFkL2FsaWdubWVudC9mcmFnbWVudGF0aW9uKSBpbiBjYXNlIG9mIFBNPXkKbm93LiIK
ClNvIGxldCdzIEZvbGQgZHdhcGJfY29udGV4dCBpbnRvIHN0cnVjdCBkd2FwYl9ncGlvX3BvcnQu
CgpTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+CkNDOiBN
aWNoYWVsIELDvHNjaCA8bWJAYnVlcy5jaD4KLS0tCk5PVEU6IHRoaXMgcGF0Y2ggaXMgYXBwbGll
ZCBhZ2FpbnN0IHRoZSBmb2xsb3dpbmcgc2VyaWVzOgpbUEFUQ0ggdjMgMDAvMTVdIGdwaW86IFVz
ZSBtb2Rlcm4gUE0gbWFjcm9zCgogZHJpdmVycy9ncGlvL2dwaW8tZHdhcGIuYyB8IDE0ICsrKyst
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1kd2FwYi5jIGIvZHJpdmVycy9ncGlv
L2dwaW8tZHdhcGIuYwppbmRleCA0OTg2YzQ2NWM5YTguLmE0MzFiZWE5NTllZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncGlvL2dwaW8tZHdhcGIuYworKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1kd2Fw
Yi5jCkBAIC0xMDEsNyArMTAxLDcgQEAgc3RydWN0IGR3YXBiX2dwaW9fcG9ydCB7CiAJc3RydWN0
IGdwaW9fZ2VuZXJpY19jaGlwIGNoaXA7CiAJc3RydWN0IGR3YXBiX2dwaW9fcG9ydF9pcnFjaGlw
ICpwaXJxOwogCXN0cnVjdCBkd2FwYl9ncGlvCSpncGlvOwotCXN0cnVjdCBkd2FwYl9jb250ZXh0
CSpjdHg7CisJc3RydWN0IGR3YXBiX2NvbnRleHQJY3R4OwogCXVuc2lnbmVkIGludAkJaWR4Owog
fTsKIApAQCAtMzYzLDcgKzM2Myw3IEBAIHN0YXRpYyBpbnQgZHdhcGJfaXJxX3NldF93YWtlKHN0
cnVjdCBpcnFfZGF0YSAqZCwgdW5zaWduZWQgaW50IGVuYWJsZSkKIHsKIAlzdHJ1Y3QgZ3Bpb19j
aGlwICpnYyA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOwogCXN0cnVjdCBkd2FwYl9n
cGlvICpncGlvID0gdG9fZHdhcGJfZ3BpbyhnYyk7Ci0Jc3RydWN0IGR3YXBiX2NvbnRleHQgKmN0
eCA9IGdwaW8tPnBvcnRzWzBdLmN0eDsKKwlzdHJ1Y3QgZHdhcGJfY29udGV4dCAqY3R4ID0gJmdw
aW8tPnBvcnRzWzBdLmN0eDsKIAlpcnFfaHdfbnVtYmVyX3QgYml0ID0gaXJxZF90b19od2lycShk
KTsKIAogCWlmIChlbmFibGUpCkBAIC01MDcsMTIgKzUwNyw2IEBAIHN0YXRpYyBpbnQgZHdhcGJf
Z3Bpb19hZGRfcG9ydChzdHJ1Y3QgZHdhcGJfZ3BpbyAqZ3BpbywKIAlwb3J0LT5ncGlvID0gZ3Bp
bzsKIAlwb3J0LT5pZHggPSBwcC0+aWR4OwogCi0jaWZkZWYgQ09ORklHX1BNX1NMRUVQCi0JcG9y
dC0+Y3R4ID0gZGV2bV9remFsbG9jKGdwaW8tPmRldiwgc2l6ZW9mKCpwb3J0LT5jdHgpLCBHRlBf
S0VSTkVMKTsKLQlpZiAoIXBvcnQtPmN0eCkKLQkJcmV0dXJuIC1FTk9NRU07Ci0jZW5kaWYKLQog
CWRhdCA9IGdwaW8tPnJlZ3MgKyBHUElPX0VYVF9QT1JUQSArIHBwLT5pZHggKiBHUElPX0VYVF9Q
T1JUX1NUUklERTsKIAlzZXQgPSBncGlvLT5yZWdzICsgR1BJT19TV1BPUlRBX0RSICsgcHAtPmlk
eCAqIEdQSU9fU1dQT1JUX0RSX1NUUklERTsKIAlkaXJvdXQgPSBncGlvLT5yZWdzICsgR1BJT19T
V1BPUlRBX0REUiArIHBwLT5pZHggKiBHUElPX1NXUE9SVF9ERFJfU1RSSURFOwpAQCAtNzYxLDcg
Kzc1NSw3IEBAIHN0YXRpYyBpbnQgZHdhcGJfZ3Bpb19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKIAkJZm9yIChpID0gMDsgaSA8IGdwaW8tPm5yX3BvcnRzOyBpKyspIHsKIAkJCXVuc2lnbmVk
IGludCBvZmZzZXQ7CiAJCQl1bnNpZ25lZCBpbnQgaWR4ID0gZ3Bpby0+cG9ydHNbaV0uaWR4Owot
CQkJc3RydWN0IGR3YXBiX2NvbnRleHQgKmN0eCA9IGdwaW8tPnBvcnRzW2ldLmN0eDsKKwkJCXN0
cnVjdCBkd2FwYl9jb250ZXh0ICpjdHggPSAmZ3Bpby0+cG9ydHNbaV0uY3R4OwogCiAJCQlvZmZz
ZXQgPSBHUElPX1NXUE9SVEFfRERSICsgaWR4ICogR1BJT19TV1BPUlRfRERSX1NUUklERTsKIAkJ
CWN0eC0+ZGlyID0gZHdhcGJfcmVhZChncGlvLCBvZmZzZXQpOwpAQCAtODA5LDcgKzgwMyw3IEBA
IHN0YXRpYyBpbnQgZHdhcGJfZ3Bpb19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCWZvciAo
aSA9IDA7IGkgPCBncGlvLT5ucl9wb3J0czsgaSsrKSB7CiAJCXVuc2lnbmVkIGludCBvZmZzZXQ7
CiAJCXVuc2lnbmVkIGludCBpZHggPSBncGlvLT5wb3J0c1tpXS5pZHg7Ci0JCXN0cnVjdCBkd2Fw
Yl9jb250ZXh0ICpjdHggPSBncGlvLT5wb3J0c1tpXS5jdHg7CisJCXN0cnVjdCBkd2FwYl9jb250
ZXh0ICpjdHggPSAmZ3Bpby0+cG9ydHNbaV0uY3R4OwogCiAJCW9mZnNldCA9IEdQSU9fU1dQT1JU
QV9EUiArIGlkeCAqIEdQSU9fU1dQT1JUX0RSX1NUUklERTsKIAkJZHdhcGJfd3JpdGUoZ3Bpbywg
b2Zmc2V0LCBjdHgtPmRhdGEpOwotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
