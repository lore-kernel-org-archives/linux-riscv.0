Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C43C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/aSXCutbIjG9vpNlnBu7lCcfajR91aKQDbDGrsowXs=; b=hBGbUTK+TGlnXW
	qmSdmz/fCk93yBrDRFpXenEHMlrHJ2QOfLZ6/VjihQ+WUaq4eccZsMXZ3Nl4KMMTu0EtvmymE5lDq
	rcbkU8tHDdXk7n2E8QiBK7dTrglew4C9S5lFm5qx6FgIuwGcbGXWvdy9uI4i59YrkFsQwwVMSldi3
	FJOMY9jFYHcR7VkGyDms17Tvsj+A4JMvCxFq72kuW6V5hfG500F1xXSq/vhTKF5yTExy4tYfLKIPY
	qSM2fX+yPjZUpI2pc6onY+eAbuKaJUvG1GX4Y8DUUhvjmy7dixFEzzPntPsC2vBVsN9dSUf/h3td8
	oJ+SngzwoI4h46jjZvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224t-0000000GcxV-1IWy;
	Thu, 03 Sep 2026 07:41:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GckQ-1lwY;
	Thu, 03 Sep 2026 07:41:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iW4jdWMi73lQm0xNAN3vvMpxq+9yLkV/tkClyyUkd0=;
	b=epr8s8vLWpnga42EE26n/anTxvrFGHH4F82vRsZ686O+FbHTEyfL38Jbyrw33Fao8FUOgP
	YvfpgVnoZnX8uTI0qolELM6IsguWl2qCqGWFBHlWnTJgmPYquNQMwRJfi9XWi6Y5mRGle4
	KW3ueTspexywSZl3IKwRJHiOmkWiXh3Az2QaFtgBu2ylyRNKRnXLJSb4gZuN3or+uhXc+C
	FD6GRaP/A1NC0OFndLerATSc2J8oWgw0KbM/ig2+8dvbYbF0vV+qJArn7vMmZZ7Ov6GROG
	AQU6MqZCgZtTEo2NvDq+V4aCkcTPEMlQGt5c46v4ztQOs+3dQoiiMOY1XvcXvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iW4jdWMi73lQm0xNAN3vvMpxq+9yLkV/tkClyyUkd0=;
	b=/TtDngCq8exQVQLXPVtjCK54BDhStRy2GTyEEXPtifFWiN3MyDpaRwkn0f1Dw6U+PBq7Nh
	AeLBrYQ9oaU/umAw==
Date: Thu, 03 Sep 2026 09:41:20 +0200
Subject: [PATCH v2 05/15] x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-5-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1994;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b7W/p77P/YlmxuUHtTjOCqsXrUn80Pb/0CSphAb3eXc=;
 b=8bCm4iBaPTW9zBWat/+m5Ee1rmwD4EqMaEgVhxezGGaTPE5ECabv+Lrj7OAgMtDB5ybLV0Bjy
 LrdI/FLc2B7BI3Ex+/EIsufonLKjzeY5VOZWKidM6LruyvF2pR3gqlh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004136_665700_43C0F350 
X-CRM114-Status: GOOD (  10.73  )
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxMiArKysrKysrKysrKysKIGFyY2gv
eDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCAxMyArKystLS0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vYXV4
dmVjLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lZDI2YWQwOWYz
ZTMKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hdXh2ZWMuaApAQCAt
MCwwICsxLDEyIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lm
bmRlZiBfQVNNX1g4Nl9BVVhWRUNfSAorI2RlZmluZSBfQVNNX1g4Nl9BVVhWRUNfSAorCisvKiBl
bnRyaWVzIGluIEFSQ0hfRExJTkZPOiAqLworI2lmIGRlZmluZWQoQ09ORklHX0lBMzJfRU1VTEFU
SU9OKSB8fCAhZGVmaW5lZChDT05GSUdfWDg2XzY0KQorIyBkZWZpbmUgQVRfVkVDVE9SX1NJWkVf
QVJDSCAzCisjZWxzZSAvKiBlbHNlIGl0J3Mgbm9uLWNvbXBhdCB4ODYtNjQgKi8KKyMgZGVmaW5l
IEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMgorI2VuZGlmCisKKyNlbmRpZiAvKiBfQVNNX1g4Nl9BVVhW
RUNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCBi
L2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggYmRkZTllMThmOTRlLi42
Njc3YzlhY2UxMTcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVj
LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaApAQCAtMSw2ICsxLDYg
QEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIFdJVEggTGludXgtc3lzY2Fs
bC1ub3RlICovCi0jaWZuZGVmIF9BU01fWDg2X0FVWFZFQ19ICi0jZGVmaW5lIF9BU01fWDg2X0FV
WFZFQ19ICisjaWZuZGVmIF9VQVBJX0FTTV9YODZfQVVYVkVDX0gKKyNkZWZpbmUgX1VBUElfQVNN
X1g4Nl9BVVhWRUNfSAogLyoKICAqIEFyY2hpdGVjdHVyZS1uZXV0cmFsIEFUXyB2YWx1ZXMgaW4g
MC0xNywgbGVhdmUgc29tZSByb29tCiAgKiBmb3IgbW9yZSBvZiB0aGVtLCBzdGFydCB0aGUgeDg2
LXNwZWNpZmljIG9uZXMgYXQgMzIuCkBAIC0xMCwxMSArMTAsNCBAQAogI2VuZGlmCiAjZGVmaW5l
IEFUX1NZU0lORk9fRUhEUgkJMzMKIAotLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTzogKi8KLSNp
ZiBkZWZpbmVkKF9fS0VSTkVMX18pICYmIChkZWZpbmVkKENPTkZJR19JQTMyX0VNVUxBVElPTikg
fHwgIWRlZmluZWQoQ09ORklHX1g4Nl82NCkpCi0jIGRlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNI
IDMKLSNlbHNlIC8qIGVsc2UgaXQncyBub24tY29tcGF0IHg4Ni02NCAqLwotIyBkZWZpbmUgQVRf
VkVDVE9SX1NJWkVfQVJDSCAyCi0jZW5kaWYKLQotI2VuZGlmIC8qIF9BU01fWDg2X0FVWFZFQ19I
ICovCisjZW5kaWYgLyogX1VBUElfQVNNX1g4Nl9BVVhWRUNfSCAqLwoKLS0gCjIuNTUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
