Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D0606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1C/3rz58;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zs2rFukl;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PrBaN3N0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VPo5vBmDKbgD65iaVwnWdJEaQY7hknUGFcZ1OqPaDQU=; b=1C/3rz58et2HtNwKOj8KHWLP1s
	m+S6p4XbA7F1+M4viTBvxeUbRgrCOLJfNnDnk3LtPKJFncC/iaTr1FPO0sWoXIuqxb2XO/KX3FZkQ
	GOpRLPITyvWaJUWCcEjs/L+3QQMPY131iXiJ93rpuJj9Y50zjzrsC/oYIhSfNa+WgA+U02sV4U9p0
	9W1DrCnSDsdkOfbCsKA3Lin9mqEXeb/bKqyODDhpsfjiNhTxaya76zuTeC1hp5lxiq5c5BW1hK7xg
	Jdvt3wcPUSZVgbZQXv0lNPAgr7UJ/u+wt4f+iova22U0Hnw8aQp5RAdz8IqWdZLG73604b5Y3f2d0
	UKfYpoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVR-00000002klj-2XvQ;
	Mon, 23 Nov 2026 09:38:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpq-1hNf;
	Mon, 23 Nov 2026 09:37:38 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XqI/ovDzkmrLY2+2cJN8n7p6UWRDilYHLPeAY+Yquw=;
	b=zs2rFuklTxUZu5QUQvubGD+p6Pyzu9fQaaPPpeVicdMWD9WrOngHzV4/XzWZBGRHsdJ3cc
	quUxa+FO+MT7Qm/1zSlCXev5I2WGMZIh/fLeXdR2vba6jrhmd5wv+j2JDbGxOR8rDRUZTq
	BrS2u4u2bVtIG6e9i5XPQgNb5b0xiqfa7c6Hy/FALHoQLbQ4PissJnR0w7x8W5wTyO+xDz
	W93AeGkWa+PBh71o7o+hiHRXY5BimtaJ7OVjOnYimFgvPF1vB7Sw1JBQRyGxXt9skYIxqX
	1OCyPLXO09TENfB/JZxU1yGMr5vNBBFPKGZp4DoiSMxG8+jwAwxfZJtkcpfl7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XqI/ovDzkmrLY2+2cJN8n7p6UWRDilYHLPeAY+Yquw=;
	b=PrBaN3N0mDSUo7jZ1zD0BdxjTZzR+Nlue0EyvgR0thKd8gbwBgsxQQULaCNGGe53D7j5Fj
	BqzY9hdcO8uUC/AQ==
Date: Mon, 23 Nov 2026 10:37:10 +0100
Subject: [PATCH v3 05/15] x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-5-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1994;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=AMxMWB4XLAUF07GFQRf/ET9aUWKjGb7vCuCYUiBHLok=;
 b=zxx6vGGdxpYVQVUw2UCdVcTPBGb0aQyLdwuRLfgrOIr0g0B+Y9UEJYR4JcBJhIcNn1mnVle0L
 jMOLDNcao4zATn0M7hA6ZDAZUGDgHq+8r7fL+5MoLrHIByaxlnXij9k
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_609036_B20E1AC6 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
ICovCisjZW5kaWYgLyogX1VBUElfQVNNX1g4Nl9BVVhWRUNfSCAqLwoKLS0gCjIuNTYuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
