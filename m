Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC8606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08a+FY0I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=auLbbl2o;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qMqMlGFZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oW8GPTRqPGZ5fu5QTanu7t/CA3y7RO+N4ENPz0E+wxE=; b=08a+FY0IBM6iVxCHRfM1F/wOH7
	oZHrHqhylyqLzrRZXHm7cH7Goi2oYMOofYCr7wq7wJ5MQWaAsntxUKnJkkiK8DW3BCTUlmlo4sn3i
	PusdCGWLH8pl0DfURT5NVdEc9bdsBRO715ZhQooKhtkQoWNX2imv3BtkRyfkorYaqNWTDe3kpobNl
	NbG6HipzcTdfW4KYiLigTcfEExPka6VtSKf7eSwCTLeJRWTz/FA9moI/xmYqvpBIB/L4YU5YEL8YY
	N0pMri4or/wuMjpO4bm2N/T9yiOXcZtS9XSuTSb6VVXHA+vrIhg3qTB3I/bhnDbVP1KEX3s3JS5JC
	3aJR/rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQWA-00000002lhK-1S3a;
	Mon, 23 Nov 2026 09:39:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUU-00000002jtt-2rqA;
	Mon, 23 Nov 2026 09:37:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWYGWS4auZwM9Q07LV23QUYJ6/wrrSYEmZV3T9JL0KQ=;
	b=auLbbl2oH4Ot5YpCeUEcYQ2dIFo74raPeSEpSgBeepfy72T3dv6ySqNZw8grm6xlh59KuT
	i7WWn60yQYtSqGOjySH/D5mPaenZdFLjQryxByxKOS8oKkotAVm++xQQ/BfFWq0WydplG7
	Bc3VI1YdNWooahhM59wa1198KWdmK1pmX5ZxVOlwkUPefFYYwSOgHhVMfbt1yaDxsxTQRw
	QvaT84wAf4K0nwWClg3Zan10Pwtp9aucgSxaEQ4bzDDgd19eRgjLZOyFQ8fPOY8Qe8yEg1
	B/xsSTsGNrZ0LAIMJP7x7jGA7J7+iD6ijUD8C4UHQUeo3CCHawC1aw7IuMaVeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWYGWS4auZwM9Q07LV23QUYJ6/wrrSYEmZV3T9JL0KQ=;
	b=qMqMlGFZf4t4nwAx7Fj+UHvCQee1C2mTmihf6zAwsYxwJeLug2K+qgxMTQI0UA9bbmc37v
	oXm3bpJIAE5VGxDg==
Date: Mon, 23 Nov 2026 10:37:20 +0100
Subject: [PATCH v3 15/15] auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-15-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=772;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JAUB4d6w3tpvVvnJFyNZBhcXBgmmxi5dKlrBgo20+M4=;
 b=kCgAOd1xOlVd/uE/bDzZYB74ed4Qvm9zJWmY1xGZI3IKoxs4346rY6+SlaWFSlHZ/Fy/xnAaO
 7YsjYIIefxeCjUKx3kra6gHNuGjcu1KYMGOdN3sVIQWVAqnwsOe+Hdb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013739_195095_E16D430A 
X-CRM114-Status: UNSURE (   7.52  )
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

QWxsIGFzbSBoZWFkZXJzIG5vdyBkZWZpbmUgdGhpcyBjb25zdGFudC4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgpSZXZp
ZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9h
dXh2ZWMuaCB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9hdXh2ZWMuaCBiL2luY2x1ZGUvbGludXgvYXV4dmVjLmgKaW5k
ZXggZGUxYzMzYzRhMjU2Li5mN2RkZWExZGJjOGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
YXV4dmVjLmgKKysrIGIvaW5jbHVkZS9saW51eC9hdXh2ZWMuaApAQCAtOSwxMCArOSw2IEBACiAj
ZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0JBU0UgMjQgLyogTkVXX0FVWF9FTlQgZW50cmllcyBpbiBh
dXhpbGlhcnkgdGFibGUgKi8KICAgLyogbnVtYmVyIG9mICIjZGVmaW5lIEFUXy4qIiBhYm92ZSwg
bWludXMge0FUX05VTEwsIEFUX0lHTk9SRSwgQVRfTk9URUxGfSAqLwogCi0jaWZuZGVmIEFUX1ZF
Q1RPUl9TSVpFX0FSQ0gKLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAwCi0jZW5kaWYKLQog
I2RlZmluZSBBVF9WRUNUT1JfU0laRSAoMiooQVRfVkVDVE9SX1NJWkVfQVJDSCArIEFUX1ZFQ1RP
Ul9TSVpFX0JBU0UgKyAxKSkKIAogI2VuZGlmIC8qIF9MSU5VWF9BVVhWRUNfSCAqLwoKLS0gCjIu
NTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
