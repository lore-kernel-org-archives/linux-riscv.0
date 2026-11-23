Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863AF606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atoMaLt4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sy6wKMMi;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EIfbqxqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wwIbbmofNtMCBeZCsGmJATFjB5UTI8taA6mJNJObivE=; b=atoMaLt48b+EsvFq4eGxiLXNvI
	RbTjsHxqnYCCDFVs/NsYQ0kPpjADLgDYiuNYpSj85CK1XXx8xZHJ55erJwLMsRhYkXhQQ6BhBnTAX
	4eBDCClQtfi/hz1D89BjlOkK1lrB47By2J94E23+eIwZAOjhFKw6u1aYtvuF7dFz1beahfm0XoqIn
	Zk3sRGDjMJRPQWHJ6S6iywiXVXqdu2s4XVEi+j537SPujfVZbSTpXdK4w4wIRLVB2dUNbhrmuXelz
	7fpDpf5vlouk5zRKsf/tVudaQaS4y04KwBAfc2kk4+wWuEsTdtliR0gR6IGIGyEEFk92a+JoMSaz7
	fyFRNVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVR-00000002klF-1PHw;
	Mon, 23 Nov 2026 09:38:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqI-3nXa;
	Mon, 23 Nov 2026 09:37:38 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyQVJDn0J0MtFHgb5Qr9bVYS1xHAFGjzONhCtcrDq0g=;
	b=sy6wKMMiSIYJJrLVs8OtFCFEbAMDezBV33VL71jtQheALKkWfogtOtkMSo7f3iDpx1hnmH
	DCow9DPdvS16RqXtCng1RNmV+NhFA2xClLPkTLPOYfmJGRa8ojIpmcuQsaxu56R6M4Fm+F
	kWBEw+7wIe+yzmSezbHp2T0eZORxNQJkDKd/9DCeDLuJAd/R7aeaufQ9FSQHhA2EizTWnq
	xfUG5037egX7h41/8CHjMiihW5FLjTaXA3mTegbNGNV896H0etpBsr0RNnEtHhkJFChwPx
	ujWRQS8fQWadjGCep69ydOg4Axb/KfFESJIPml36wiPo21QQXQ8D1RJkrL8ZZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyQVJDn0J0MtFHgb5Qr9bVYS1xHAFGjzONhCtcrDq0g=;
	b=EIfbqxqQDY5EeJRfGC/cqaJZmr3BsSxE/bXQsnuaukyukzxhYJf5e7OI+OIDmQ4Kkwp59O
	ifnISwgD66ulBTCQ==
Date: Mon, 23 Nov 2026 10:37:15 +0100
Subject: [PATCH v3 10/15] powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-10-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1614;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lq2CTgfwZG73WGl5OVl7p6mIHPWbhjx1Tz1RNRtR7N8=;
 b=bJ5A5zd3pfSWIa+VMd5QiOGWtRTF6UJscvwGWocaeSTuxYx7he2xiLti1KebdjyptmSFP9R36
 LWL13Cj7QasDcyXmn53dOiu+z7BAW25TVHWTaylnvQbJlD/oDtlC0ip
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013736_113172_560F1022 
X-CRM114-Status: GOOD (  11.22  )
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
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgNyArKysrKysrCiBhcmNoL3Bv
d2VycGMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8IDYgKystLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXV4
dmVjLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kNmMxODBlOWFj
MmMKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXV4dmVjLmgK
QEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwor
I2lmbmRlZiBfQVNNX1BPV0VSUENfQVVYVkVDX0gKKyNkZWZpbmUgX0FTTV9QT1dFUlBDX0FVWFZF
Q19ICisKKyNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSAkxNSAvKiBlbnRyaWVzIGluIEFSQ0hf
RExJTkZPICovCisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaApp
bmRleCBhYTdjMTYyMTU0NTMuLjlhYjViNmQxNzkyOSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmgKQEAgLTEsNiArMSw2IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotI2lmbmRlZiBfQVNNX1BPV0VS
UENfQVVYVkVDX0gKLSNkZWZpbmUgX0FTTV9QT1dFUlBDX0FVWFZFQ19ICisjaWZuZGVmIF9VQVBJ
X0FTTV9QT1dFUlBDX0FVWFZFQ19ICisjZGVmaW5lIF9VQVBJX0FTTV9QT1dFUlBDX0FVWFZFQ19I
CiAKIC8qCiAgKiBXZSBuZWVkIHRvIHB1dCBpbiBzb21lIGV4dHJhIGF1eCB0YWJsZSBlbnRyaWVz
IHRvIHRlbGwgZ2xpYmMgd2hhdApAQCAtNTAsNiArNTAsNCBAQAogCiAjZGVmaW5lIEFUX01JTlNJ
R1NUS1NaCQk1MSAgICAgIC8qIHN0YWNrIG5lZWRlZCBmb3Igc2lnbmFsIGRlbGl2ZXJ5ICovCiAK
LSNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSAkxNSAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZP
ICovCi0KICNlbmRpZgoKLS0gCjIuNTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
