Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C56606A695
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wcb/AYC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0j5Gmmlj;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xKFKMpGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NXowfRL2ROo9vClc7SBB1TRaS8zk2akifakM7/QKmSI=; b=1wcb/AYCNEIf95e1GtWFpGkrT7
	P1DOtEiuzgXo+SPbPNzH2332ThAIDeqP7yrcEt/GBk2DvBPysvdPQcZCB4xMqkqhoszkyxr9Vu5SY
	1VQqOE+EZ+B3LhtFOdLp+O3h4bB3InvNWAS1XHc5n3qsHLSlSWupDDuqMFaXMzgT3l6vwHbqd5vfl
	VS4Yh1WM3zNQk/hpCjGAZLd8dKpj1tM6GbG6LI7wq+UyvBX0dg5IyYskHhnP6B1r/sKkY3Sscz91b
	RmHKoN+FXmT6dgW18QZpeWmk3UDiB7y/aVetroJG9rDECyZYmDAweRM1sSNBuseJqNCADh9K/1aKB
	00vSlJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqY-0UeX;
	Mon, 23 Nov 2026 09:37:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUM-00000002jnr-1Wct;
	Mon, 23 Nov 2026 09:37:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDtQZ0VAonHgAXv6V61xlzs7rkDt1P1WSeLVHahPhAk=;
	b=0j5Gmmljkca/E2gltZCv/iUBQbTWeg/kQBkYf9XVAiAvA+qtjrKckZWXQHPA2f/1TeXecV
	/zE0P2DNvoi8HzN3ElVxpGGiQAEUlNEcd6UGF8hYrc/wSMLNce0GBczPBbKvIrUO5X19RR
	R1IdOvKig4vP9CGu5Hhx6vXZPUH55eQ55Cmk36Mb44np+ZIxlZSOLnCp0ymuePoAJEdl+5
	TwmUudfDzyUogJxAH8+mEPtUHitYqGo8y7Cn1b+rbDaEO5y1tmknjd9BzK8UJv7cfl21hY
	ru0ooQgiSTna2g0imjxfqNWRrK9ENYE5x9K6ykIbUErgd+RZ7TijW+6DyYVOYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDtQZ0VAonHgAXv6V61xlzs7rkDt1P1WSeLVHahPhAk=;
	b=xKFKMpGlecHS7QXXG/FYCxByPNPhxibU2GcZwDKmWF1WUgWqaJk6Gin5FmwBxGa5E4PlWb
	9bnxn8NrLGCuOXAA==
Date: Mon, 23 Nov 2026 10:37:07 +0100
Subject: [PATCH v3 02/15] auxvec.h: Move AT_VECTOR_SIZE definitions to
 linux/auxvec.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-2-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1309;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vTIIJIwUFOUw6+gUJjUOc4a2N37x7HojOq0oR0BBlzg=;
 b=GyKn4Bxu+C22SecrgL0rmVE25rtNo0/nZVqR9YcowgOuG6XWN+hFQ7LVwF48ESsfl68yPNaNg
 5OD4YumxPGrDTLDcZ/xMG4kmg7ZscPSTHPCE8zZxHWIbEnZdxHW3/L6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013730_547271_B865B745 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

VGhlIGF1eHZlYy5oIGhlYWRlciBpcyBhIG1vcmUgZml0dGluZyBwbGFjZSBmb3IgdGhlc2UgZGVm
aW5pdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPgotLS0KIGluY2x1ZGUvbGludXgvYXV4dmVjLmggICB8IDcgKysrKysrKwogaW5jbHVkZS9s
aW51eC9tbV90eXBlcy5oIHwgNiAtLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXV4dmVjLmgg
Yi9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCmluZGV4IDhiY2I5YjcyNjI2Mi4uNGIzNjRlNjM5ZjA4
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCisrKyBiL2luY2x1ZGUvbGludXgv
YXV4dmVjLmgKQEAgLTYsNCArNiwxMSBAQAogCiAjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0JBU0Ug
MjQgLyogTkVXX0FVWF9FTlQgZW50cmllcyBpbiBhdXhpbGlhcnkgdGFibGUgKi8KICAgLyogbnVt
YmVyIG9mICIjZGVmaW5lIEFUXy4qIiBhYm92ZSwgbWludXMge0FUX05VTEwsIEFUX0lHTk9SRSwg
QVRfTk9URUxGfSAqLworCisjaWZuZGVmIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gKKyNkZWZpbmUgQVRf
VkVDVE9SX1NJWkVfQVJDSCAwCisjZW5kaWYKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRSAoMioo
QVRfVkVDVE9SX1NJWkVfQVJDSCArIEFUX1ZFQ1RPUl9TSVpFX0JBU0UgKyAxKSkKKwogI2VuZGlm
IC8qIF9MSU5VWF9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbV90eXBl
cy5oIGIvaW5jbHVkZS9saW51eC9tbV90eXBlcy5oCmluZGV4IDFlZDM1ZDI1OGQyZS4uYzc1NjI2
YzVhYWQ0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9tbV90eXBlcy5oCkBAIC0yNiwxMiArMjYsNiBAQAogCiAjaW5jbHVkZSA8YXNtL21t
dS5oPgogCi0jaWZuZGVmIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gKLSNkZWZpbmUgQVRfVkVDVE9SX1NJ
WkVfQVJDSCAwCi0jZW5kaWYKLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkUgKDIqKEFUX1ZFQ1RPUl9T
SVpFX0FSQ0ggKyBBVF9WRUNUT1JfU0laRV9CQVNFICsgMSkpCi0KLQogc3RydWN0IGFkZHJlc3Nf
c3BhY2U7CiBzdHJ1Y3QgZnV0ZXhfcHJpdmF0ZV9oYXNoOwogc3RydWN0IG1lbV9jZ3JvdXA7Cgot
LSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
