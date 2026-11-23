Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C635606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dblwgMlW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ka+3Z7Va;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+3FEC2I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hOmQYLmFShsKxJmbKPp2QVaDwmstmhmum7d+///2bvw=; b=dblwgMlWfNBHXviaaZfDF7IO0H
	/TiQBcYBB2j2iTaJCIEyu4/IAvGGWz3KeVpbKzHNP7apPeuv7PXS6R/fFf0VqWl7pGxaF2ka0QUTf
	8Do9+1SBcW1FqJvE/CQ/MCT07e8aMOFsWZTfQRqdbfY+3xGiNZGSQwvb2goprxmH7RXm5x9tyi9PE
	gzghNb/bAiGI1JxV0YVhoFbgl5OoWD9SDxrsi9EFodGc6o/j02d2GHIliz6bUUAXDPlhklRAe9pkT
	OXQSv0QKvzNxgjN5x1E0xNQyfIlFupDe3VeN6C5e4Li4pMhQPkHunCPdfJp1gPecLIisLOyWAdRgM
	lAHIrB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVm-00000002lG3-41vZ;
	Mon, 23 Nov 2026 09:38:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUS-00000002jqh-3ejI;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=ka+3Z7VadWdisEHx0nhlsSjM+BJx26vRfZQSKZBaNmkldRHN9izmYdiJ3lbMxC0OucilQO
	x4wajeyPaG9SYXCOYo0mEJbrlyo1Qb6odgIgVyt7RHwE0LwAcOrEw/9ag3SpzJaSdD+/50
	cf84wqq101c0Y7SjIl9MAYkyB/NoCBBDvkAzs3gXDM9eKkDoC5J59Oj+2z90qtXEsKIYjb
	6NCDbIjwyDXjHKXIWzzJogKsraz1G6QbzIpx7dekdRzxvdML7vicPUoeYiNKxgM4iAtCSw
	txYM5rGc4MljvQElOkPCMxyj2ftSGcr1+DILod8yuYSdLAYTq5uXJQbNv9SkwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=+3FEC2I7ganDyUkYlSgk8p5ebQ/W+4z9rJpXxo/+Q6+NHLP1FitfABHLjtVREnjnKzyYQa
	inDCvMd1nvmg6DBA==
Date: Mon, 23 Nov 2026 10:37:17 +0100
Subject: [PATCH v3 12/15] sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-12-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vD8CGJOm5QnknC9kSQAkUBhPNwBGIfJ1kH0awZZC4RM=;
 b=ZqXe3ujMdbEB5uqjyUQ/H+vOfXjC40uRBW01eTcsRo6t6/9jooGMDQTmAxN0GFYsNBJaxy0gu
 pb1295uByM8Ac2cxiZxLoRuOrUYtiCs9VE19YvlZd0nouwzkUZeW8Zd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013737_099039_0895FD5E 
X-CRM114-Status: GOOD (  11.01  )
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
Y2gvc3BhcmMvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDYgKysrKysrCiBhcmNoL3NwYXJj
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCA4ICsrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjUwYzI0OWE4YmQxNwotLS0g
L2Rldi9udWxsCisrKyBiL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCAr
MSw2IEBACisjaWZuZGVmIF9fQVNNU1BBUkNfQVVYVkVDX0gKKyNkZWZpbmUgX19BU01TUEFSQ19B
VVhWRUNfSAorCisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJNAorCisjZW5kaWYgLyogIShf
X0FTTVNQQVJDX0FVWFZFQ19IKSAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmlu
ZGV4IGFiODc4MGZiOWRmMS4uMGZhYjNiMjkxNDhhIDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oCkBAIC0xLDUgKzEsNSBAQAotI2lmbmRlZiBfX0FTTVNQQVJDX0FVWFZFQ19ICi0j
ZGVmaW5lIF9fQVNNU1BBUkNfQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTVNQQVJDX0FVWFZF
Q19ICisjZGVmaW5lIF9fVUFQSV9BU01TUEFSQ19BVVhWRUNfSAogCiAjZGVmaW5lIEFUX1NZU0lO
Rk9fRUhEUgkJMzMKIApAQCAtMTAsNiArMTAsNCBAQAogI2RlZmluZSBBVF9BRElfTkJJVFMJNDkK
ICNkZWZpbmUgQVRfQURJX1VFT05BREkJNTAKIAotI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNI
CTQKLQotI2VuZGlmIC8qICEoX19BU01TUEFSQ19BVVhWRUNfSCkgKi8KKyNlbmRpZiAvKiAhKF9f
VUFQSV9BU01TUEFSQ19BVVhWRUNfSCkgKi8KCi0tIAoyLjU2LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
