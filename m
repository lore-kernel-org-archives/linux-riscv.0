Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D8606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHcu+0n7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vjEARtx3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Bv6jhs2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JLxIaoJPI/XTpr5EAKbS1y+7Py7i0hT14uhBVz1ar8I=; b=VHcu+0n7MC/91NH5ZLFFU5LX/B
	ATg5iEnyZ6kVYbo4QAETWMILDm3ysz5h7OgumFqw9iZpPjgDKEOjt5iUtJjnxp7hgti9umTe35L0Y
	rmSd8I/DrZaBB/SgUqK51dCPRB7QDV8mkluf+E0qW2glxHavdv0NvAfEgggjptdkUVp5CTLfef3pn
	ommBJb0F2rjoD9bixIkvBa0zCoasOQA6uWRCYFk4VT0QNszSEy8dJ2ALHcjpD8wFmgC7YGqhG8W45
	qxq7yWu/SVbwrd/CgQQJImmV8rDMRNKI7L11fnVT2xElagOSULmM6SMdLIcusib1akMsvlPgaUClo
	wbXiTQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUk-00000002k5m-3gjz;
	Mon, 23 Nov 2026 09:37:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUM-00000002jnw-0bkJ;
	Mon, 23 Nov 2026 09:37:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCInxSxfWY/baS2gA67JI3oLj7pEl3r5Kks368DptXU=;
	b=vjEARtx3r8J59QJskATSoUZ4rv6pYKWSlfmjme3JMa5M4SMhc00pFtHMCDgyNo/RDm/jek
	LH4qTgii1hs/98kIl27mTmqCtZSi005DRO4Cjlc2DLVLNphLx+AmEpvn/Bo0ob0YX9+pRi
	JKPkk8wRQhRAMHgB6Hz4v/feQB1i6l2oWyVL0g82/uAuUTmASb7KSJTYlmmOGlOHSxLuDI
	qTwLjbVU4BCKhZW3Nr+zS+wL99k9eWL3ahDiUUJ9i066kUxhW342oFJsKah/cVGgfHJMKU
	gagoIjvT4cj9bTpv6rBImolLvfLwtzW6PjLz0ZdIa6vTYCH59nQyLSTMVlIjwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCInxSxfWY/baS2gA67JI3oLj7pEl3r5Kks368DptXU=;
	b=Bv6jhs2k/3Z98uYG/xj1eKvxvDv2iFmRJNmQwdjgG+GwwWdPZh42RSCDYrGiOJfkoCQKPE
	FuYdk9Hk+TZrO+Dw==
Date: Mon, 23 Nov 2026 10:37:09 +0100
Subject: [PATCH v3 04/15] ARM: drop custom asm/auxvec.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-4-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=523;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QV8Zwqe9GYXvbZYqVlVdwaxoS3NHmxQrRwiam48wlog=;
 b=fdt6Vfk48wvz262HQNr4SmvfAA10Ohk3rYDAIpAbpM/sJECol2LaeV8FpmmHNEQ1ymuzZ847s
 ZXFLZX7e+kYChBQotTOoDfC4e+OHkTMGZp7VlhKb0y5EVgfS9lHxPxn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013730_411176_3E79FCB4 
X-CRM114-Status: UNSURE (   6.40  )
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

V2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIGFzbS1nZW5lcmljL2F1eHZlYy5oLCB0aGlzIGhlYWRl
ciB1bm5lY2Vzc2FyeS4KCkRyb3AgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29v
ayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2F1eHZlYy5oIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXV4dmVjLmgKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZiZDM4OGM0NjI5OS4uMDAwMDAwMDAwMDAwCi0t
LSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2F1eHZlYy5oCisrKyAvZGV2L251bGwKQEAgLTEgKzAs
MCBAQAotI2luY2x1ZGUgPHVhcGkvYXNtL2F1eHZlYy5oPgoKLS0gCjIuNTYuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
