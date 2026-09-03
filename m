Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD34C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYrODp/Cn/JKHDiFfTenFskmDIELitHuS3fzXr1XoWI=; b=K8heELuxzuDtBx
	pVmZdXqE5J5/qcsLrZBN1IOswC4FjvStCj6WP84pbwvWgWRZWnhUk8R64islMLgqwZ/53CXBSAljV
	m7Al8RCdkQXHtMWhHnOKX69Vw06ZSS5qXtZ9FGvLM32notOLBnuZUkH7VyZ7hzhvrp6ZluH08ueX8
	oH0rFfZuap8Y3sZl9nshHVcgD694sANUKptWtdoUuZ4J2OWeWG+CR9HJ837RPrEGfLdsiKH0pOmoe
	E75sdt4/vEAyEQHX3J2vwYl4i9iEH3f58ZpBUE/uZNwgF7M2A9mnVDTLC2W3Lm9Q+CeeLm/7jMhXU
	BZNQsxrq9qhixKxBUekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224z-0000000Gd6E-2pg1;
	Thu, 03 Sep 2026 07:41:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224n-0000000Gckp-1iKT;
	Thu, 03 Sep 2026 07:41:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elVYzhuCvmXJBPRZ3gCfrokksTC2QjbDZG7uOX6NqdE=;
	b=x98/uR++5TGb1kE9DatfjBc7vccpt9Tv6Ybqo6Jpm1/OJSJD5KyNHVs69DNPs/A+utplx1
	kfB4ZZcdBUdFM9kNfHH3RmU8srMZxawE9tJ81+G0De8/k90wTz77UrJ/ZA5huABZSnoy1W
	8xIHZGOtgbMGRjdhG/MspxM5XvQ4jhFgE4/OvO5PFuyRioaV0ToxHelPuUjUoJCxVs1jmi
	a7XdgCUGnmhgYMH5GlU6reqy7m0j89/Z9cAyKN5l/lKlSrtK7RD4b4rQQwaWdRJ7D8nqy/
	x1IhVuGARBmfGfthpyoY88Qljhzj8StgQwCNy0bgCdFb3X+pqYUiWXjLOXJGQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elVYzhuCvmXJBPRZ3gCfrokksTC2QjbDZG7uOX6NqdE=;
	b=16lypqC7rW9J+MkVv+rFbiDQP8PUbNH9MQTLL3JpXOtqRwqdnyUyndlvLnhpDqwpWve5tX
	0DkewKfU+GC6NTBA==
Date: Thu, 03 Sep 2026 09:41:25 +0200
Subject: [PATCH v2 10/15] powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-10-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1614;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YIjNA9GHIeGKIog+4ZRlNVoTyE7Q6c9+vbExkNBbN7U=;
 b=tzh2nu86F+qh+b32xMEyYGMszxVH1qArmLc3sUe8halsMjfnsH1mlrvaUFUosJPsV2OmaGV3H
 9t4yw1mYDMtDty4LZwJAm85bi7LB7ZA/JDYQ5/xehieYzIxhOCKT4g4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004137_593357_ADD3A288 
X-CRM114-Status: GOOD (  11.53  )
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
ICovCi0KICNlbmRpZgoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
