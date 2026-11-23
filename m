Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F32606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaqrP0MM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kEyAOZ+f;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lIn2F/rY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mr8YTqj3VPdRjV7gMJCLtDFYve471yTf0vshBmqL8zc=; b=KaqrP0MMwaXI7DbNeuNk2D5Ymi
	5GzxZeHuw8uMjwktEmR7IgoZxquyGhUfOcm9AKdiCl/gyKm0Rrn6N6wMImItRUVrfsmdhzV/0V043
	DSl/xEE0l16kT8JCwnWkBK2UWo5GNPDZpzlF4xjBN2bueQHayoi6WC6UtaEfGxBjqwQELE8l76YTL
	un4YzTGe9m8+pPM7JY2ArqbXNOvRImkvGT/eq0MbJtZ6zwekFbqlURjzHr3oOpY9NkX1iSmk2/ewC
	kJqKQxYgjvfJ6Bdi1c/D06OOMcyWmppIyIbSUKwQCpLQCej8n1h7iPIKIHnwSt6Up1snhLdApSZvD
	kSWZSGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUl-00000002k5x-06QU;
	Mon, 23 Nov 2026 09:37:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUM-00000002jne-1z55;
	Mon, 23 Nov 2026 09:37:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1kpH9qtmZAMmYTBOk6CnIKFezpBGJI84FmVahSpOrc=;
	b=kEyAOZ+fXfpEFfXli9cKb4jaOvep+YD+wGpQAMUQQojZWoFAqgtWYb70a2ykA+VO1bRedq
	xJ1z/x/EoR0vCb1RSKcWCP09fC16ImShi/WU9K9AboAh6Pl6VYOpQX7L3Va0rbVF8sRgwZ
	j1VkZWwgTUUpmxL3P+j222I9Hpz4yBmTIIBjdDdZJBGCITy12dETeke7yfjVz6eOwfrX2T
	qwIgn0zPKXkYeYkzAhQRrFUZf3oInFDCx1beSUFl6BqCyxq769Dp3hpWe19ngJScL2Wjxr
	jwMUd1tmM8P3eypY0Zj/ISZvHtFUuVCqtBxqaoGWMGH3MzUX5NwVGjxH9YMJBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1kpH9qtmZAMmYTBOk6CnIKFezpBGJI84FmVahSpOrc=;
	b=lIn2F/rYSSMxABLTJM4B3AbW/3uEZC8vK5/mSmfekSgDDXw9MHlSZZVoCJyH3+Wc1EX+Zc
	QINruovqqc4qHEBA==
Date: Mon, 23 Nov 2026 10:37:06 +0100
Subject: [PATCH v3 01/15] MAINTAINERS: exec: Add more auxvec.h variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-1-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=979;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hyCnjfQwzbLi6OQVQUQL35+BD4s52Bt4na4vvI8iM88=;
 b=Yd3vnnMHSBep+pRQRmyi1AA40DEVjxA2c8/dBeFWV4J0rKudeRDSHvhOeNFfw6AFADdjfzkJf
 OYY7DU1b6DAAWfLpRxBPgKDgCI6NtpX+tyAlSPU38iJqHr9hcKiFypZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013731_862152_59FD5099 
X-CRM114-Status: UNSURE (   6.28  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlcmUgYXJlIHF1aXRlIGEgZmV3IGF1eHZlYy5oIGhlYWRlcnMuIE1hcmsgYWxsIG9mIHRoZW0g
bWFpbnRhaW5lZAphcyBwYXJ0IG9mICdFWEVDICYgQklORk1UIEFQSSwgRUxGJy4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5F
UlMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggOTNhYmJiMzE1MDY1Li5hNjU5YzliZmIw
ZjAgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMDA3Mywx
MyArMTAwNzMsMTYgQEAgTDoJbGludXgtbW1Aa3ZhY2sub3JnCiBTOglTdXBwb3J0ZWQKIFQ6CWdp
dCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2Vlcy9saW51
eC5naXQgZm9yLW5leHQvZXhlY3ZlCiBGOglEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvRUxG
LnJzdAorRjoJYXJjaC8qL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKIEY6CWZzLypiaW5mbXRf
Ki5jCiBGOglmcy9LY29uZmlnLmJpbmZtdAogRjoJZnMvZXhlYy5jCiBGOglmcy90ZXN0cy9iaW5m
bXRfKl9rdW5pdC5jCiBGOglmcy90ZXN0cy9leGVjX2t1bml0LmMKK0Y6CWluY2x1ZGUvbGludXgv
YXV4dmVjLmgKIEY6CWluY2x1ZGUvbGludXgvYmluZm10cy5oCiBGOglpbmNsdWRlL2xpbnV4L2Vs
Zi5oCitGOglpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvYXV4dmVjLmgKIEY6CWluY2x1ZGUvdWFw
aS9saW51eC9hdXh2ZWMuaAogRjoJaW5jbHVkZS91YXBpL2xpbnV4L2JpbmZtdHMuaAogRjoJaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi5oCgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
