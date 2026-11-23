Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A956606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1BrqA3t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jkhqAnQN;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KGBqyz3G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=489eefePEXiUWZRJVymE5/DQKMeF0ZuLjpm4e6Gc7DU=; b=Z1BrqA3tnn3txHFXpjygmFG99Y
	KKVy5+3JrwRTTHTOdtG2sNPRwzN/4Xnl5RLyQtDi23cuPZgSBj/ym8EJ7o1+PvheTQnUfo+2UCCOB
	wCntE2V5n77pgNzdLicnsNBDNdUkC/Tpv21AL5/+He0NSVuYJFQSG+xQegT5A2uTIjR3b5anor83U
	RgYWHndWGd58e5mppoNTqpj362RRAiAGwc0ey4A1s70avM3hlUAzTYBkhqWZhpyu1i1TBb/Nc/E9D
	4wQRTaNv1+oZwEcLO7uP/ke1mnPbFnTj8gPyeZcgIYU4Q3k84EcjRFBq+okuIdQf1Da3Gx9sTTfmh
	JEr/ueAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQWK-00000002luc-3Pf8;
	Mon, 23 Nov 2026 09:39:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUU-00000002jsl-1GXr;
	Mon, 23 Nov 2026 09:37:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/BiTKNpCaOxND2c83McUOfReF7CsUOwl4ywWdEVIsc=;
	b=jkhqAnQNELqjAUyPC+ah0b+ywki2lualhhUkxkV7P3TMrXvXwGyiycaGYRoCbZBpM0RcTn
	X2q9PPlCsravdT3r794YuvNNdQagbYQKFtf9bNwRN1Iu/5EZlLemXEjySqRl802oCFXXBN
	xFQ7t0rPYG02dO0BgPjMOt67Zar5eE6hJqTwbrFc8Ac6PQY+OebLC3xD9Ckcd97nVxtC2Q
	p8pcYvW94R0pQNY9SPNX3yq/qhkzYWAU70LE6jHJ8gf1Bkj3Spqu9mEzfFYbTQtQa2KpjV
	Y9THEgzS7mxC3lm/z8O4Wde4DU0UBYUi74rZ2qlM2nIFIOUzQujqAWDNxKjtsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/BiTKNpCaOxND2c83McUOfReF7CsUOwl4ywWdEVIsc=;
	b=KGBqyz3GdaK1oBFiUeoizJlsqPljXvKlT3ga2tV8p7wV+lhoSN1YNMjumnKIpgLiGs3g+I
	tWCAeCC0Wv8iJ9BA==
Date: Mon, 23 Nov 2026 10:37:19 +0100
Subject: [PATCH v3 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-14-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Magnus Lindholm <linmag7@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1710;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vXjkxYJIlc0NCEosFzkpX8TeQp7Um4IKFK3k2WrdPLI=;
 b=EL3RVXJCnvkuQSc9r9Cl1BTDgl6XF0yfwf03AwNKQGGyAiPL6VTd53BWrWQo89v0CFbbKICYh
 V+VEt6hrynCCWJXvzqn4zeLgAiNjUEfCVNRVTmgGZhdW4+BddfJZUHx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013738_744792_1B2218F6 
X-CRM114-Status: GOOD (  11.69  )
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
b25peC5kZT4KQWNrZWQtYnk6IE1hZ251cyBMaW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FscGhhL2lu
Y2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA3ICsrKysrKysKIGFyY2gvYWxwaGEvaW5jbHVkZS91
YXBpL2FzbS9hdXh2ZWMuaCB8IDggKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUv
YXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZhOTBlZTRmODk5YwotLS0gL2Rldi9udWxs
CisrKyBiL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCArMSw3IEBACisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBfX0FTTV9BTFBI
QV9BVVhWRUNfSAorI2RlZmluZSBfX0FTTV9BTFBIQV9BVVhWRUNfSAorCisjZGVmaW5lIEFUX1ZF
Q1RPUl9TSVpFX0FSQ0ggNCAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCisKKyNlbmRpZiAv
KiBfX0FTTV9BTFBIQV9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hbHBoYS9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5o
CmluZGV4IDU3Y2FlODc4MGQ4MS4uZDIxYjg3YjY3MzBhIDEwMDY0NAotLS0gYS9hcmNoL2FscGhh
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkv
YXNtL2F1eHZlYy5oCkBAIC0xLDYgKzEsNiBAQAogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNpZm5kZWYgX19BU01fQUxQSEFf
QVVYVkVDX0gKLSNkZWZpbmUgX19BU01fQUxQSEFfQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FT
TV9BTFBIQV9BVVhWRUNfSAorI2RlZmluZSBfX1VBUElfQVNNX0FMUEhBX0FVWFZFQ19ICiAKIC8q
IFJlc2VydmUgdGhlc2UgbnVtYmVycyBmb3IgYW55IGZ1dHVyZSB1c2Ugb2YgYSBWRFNPLiAgKi8K
ICNpZiAwCkBAIC0yMiw2ICsyMiw0IEBACiAjZGVmaW5lIEFUX0wyX0NBQ0hFU0hBUEUJMzYKICNk
ZWZpbmUgQVRfTDNfQ0FDSEVTSEFQRQkzNwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gg
NCAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCi0KLSNlbmRpZiAvKiBfX0FTTV9BTFBIQV9B
VVhWRUNfSCAqLworI2VuZGlmIC8qIF9fVUFQSV9BU01fQUxQSEFfQVVYVkVDX0ggKi8KCi0tIAoy
LjU2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
