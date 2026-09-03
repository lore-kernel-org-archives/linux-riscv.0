Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44403C624DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27e3LuoyUgUX+qlLjlXA3c0emWRTWQKvs1d9OXxE1Pk=; b=3wSbwOU5vLFIfo
	DfQU+wkBRP4JoFvfF9VAyMYsn1CGWB8/dD2c353L/xsvTSBR1kU89FnnE4zSE7PgwJICswLhNaJvL
	Zq8Hs0FsrW5bgHh6+0fjnM1C/RRsREsEGPft8Y9OxVAPEAvItSzmlrAG1IaDP/qDeBM6x4UxLLzjW
	FVSsZywcLGeZ52Y2fx/x3cSinYnJOJ84VI0xJB14tHkdHRKiDSlZKRD4TV1mX2WXpuSCCzM4r6jWA
	R5ikhhUKbPjtd40R5qbVekAtsmGPee8wp72wRhcudNdlA6T8O2BsZJgT8KnRXVVno8Twbgzrt29Mb
	0nVkqi1HBZv80bykoWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2257-0000000GdSS-0hNF;
	Thu, 03 Sep 2026 07:41:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224q-0000000Gcpo-2xm4;
	Thu, 03 Sep 2026 07:41:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZut8kA+4chJGGwM3gCf5+HQ533NpmMKcsyR+MQing=;
	b=2n1aEsewcEY2O/4HmcehE0YE0VieS3W2Gs7Xi6wKvR4tHUFLZZdAgWR7QSYOOUkhJPQYgK
	Kf2YukB5g2gEpDitBxuqTpqVK1ts0CgTyVz6Ft/ZacoKjUo1xHG5dq9fA1bxtdIte/vSMa
	58oCWjCpgyI39K14Qkp11rzvyd7YXsrvwZGArqXZ/wa7XZbFvsNdzIviRN6F3eu02VelMS
	0IR+KoFKvbjgJLQBuTr2jCrJ0mmGsc4gS7EcrDz4+L54rrwo5R2h8w1UoisMF/Lh8uc4m0
	RuqlyQoxX8m9GiTcSRlUh4IIaO/IBeLdHZwcZlUEiN865f/h5LeGkrWqIAfMTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZut8kA+4chJGGwM3gCf5+HQ533NpmMKcsyR+MQing=;
	b=amGLpWRCPzszmWf2agPqW3Fg7V59XzpRILVaIxSaD3ICIskVDU9Cfpi1H6/i1xn+cRW6Jq
	FawyH8+8sQE1GjBg==
Date: Thu, 03 Sep 2026 09:41:30 +0200
Subject: [PATCH v2 15/15] auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-15-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=772;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h0d3/9vi5+RkvDv34sEYqTWGje2TjQ5iv2oSp1yFOKY=;
 b=JaGBRkuyra1orRqWHzX95kpMA0xW4S8rfsJ0pler5rGlI0La87KEeut8woUGbU1ptSxEISgz0
 Ljvg0UEOZ/ZBH8ervfYSiUK0bZeaLfogWTUGiQhqsWdwyQWXx54SvJ8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004140_922688_5868DD7E 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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
NTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
