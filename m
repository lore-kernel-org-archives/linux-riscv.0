Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E287CE9B375
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohYm1bmI9JFl3r2Unb8jfC5bIQXGUQDzU2N0bRBw0cU=; b=y7XEY017p/wO2p
	AXmLl3h3oHAgh0dzO7ymXi9jd8bwSt5mkvoqw8EiqguCDwVArz/kZ1y7LjNNQlKbeNE1MFJekpmp5
	c8QAU7Qe2twhNeqErw7yQYz8YW/ECrqDsxjYdUIEcWdYMtKac98Ix+OMfqvPRA6IfvcQiPKPvb+1B
	js+hq2Ub1yaK8VMC0B47dC0KZuMYQgDxq9oGMdk8mPqHyxgjDDJpiUf8Afx34k9VEBQEE1Sl1uFpi
	4b4lqsymkLvVMGAMApgHIlh4n2n3n5BoKmlM32JbI4lJMH6A7sTOf/Uv0GiH43kUQNKWgoHlKqv5D
	MPxzkKEgIYT7cIfHF09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LZ-0000000Cw8H-3q29;
	Mon, 02 Mar 2026 12:26:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqe-0PKl;
	Mon, 02 Mar 2026 12:25:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/rC8JaKdvarxwfXTuFmyKVLUxrMKeBR1vS+B+mbt60=;
	b=ajSAQliaS2qS7tskq6tMH3t68+qJUkIdQPRiKkQMCt0DsJ7PTdi8iUy+3o2QlTfA/80+BY
	pL4KjEeMLMt5yVfqYI8OjS5j5Hgc0vW1HnPf+ayu8rkOjs3Vqzr3P8Pvk1qR09O6GiUPU7
	UjvxcgX0fxJ2BXwr0xwniOcLVDPzRXV2NpnJ6qmMXgvTVUCqPxt79l9TQoCuPBc5LqctF5
	MOP0zzVzjZIt8A9dHgSUvittHeK7AIKBGH1r07yFDH3F1nOQGX7jARYyieK4yCcZ8SyVqP
	WgJmsqUP71HlSfhNa2LCC30IGSGkt4eDD2DxsNAdFLLAYMipDWo+OKxY7VeX8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/rC8JaKdvarxwfXTuFmyKVLUxrMKeBR1vS+B+mbt60=;
	b=JwfnIxj0Sdg5oU0oqOjI3YutVwzh75rX2vx7bewd7VBp+XEcIlK6TmXTrPbufqiMTXJYxv
	PB8QnQj/S2BFCGBA==
Date: Mon, 02 Mar 2026 13:25:31 +0100
Subject: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Zpl+G7mVLygoIP0MMSeWtai1WKLwvJyTNt46U7Sw0iE=;
 b=1sF3PQMcvc8QkKpWrYiRBLQP3NxEkxGiX9D/WLc7u5XoilAqV1Gvh/xCY9I+JL4qVtUA6VIVB
 dt3gdx2a1ezB0KhTVbLa5Br+JAHDOGRPvkd3jjBSo797OWQR9U01GlA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_326198_FCA91DE2 
X-CRM114-Status: GOOD (  12.02  )
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
b25peC5kZT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxMyAr
KysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCAgMiAt
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAw
MC4uZmI0MjMzNDQ1Mjc2Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hdXh2ZWMuaApAQCAtMCwwICsxLDEzIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5ICovCisvKgorICogQ29weXJpZ2h0IChDKSAyMDEyIEFSTSBMdGQuCisgKiBD
b3B5cmlnaHQgKEMpIDIwMTUgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlh
CisgKi8KKworI2lmbmRlZiBfQVNNX1JJU0NWX0FVWFZFQ19ICisjZGVmaW5lIF9BU01fUklTQ1Zf
QVVYVkVDX0gKKworLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLworI2RlZmluZSBBVF9WRUNU
T1JfU0laRV9BUkNICTEwCisKKyNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfQVVYVkVDX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAppbmRleCA5NTA1MGViZTlhZDAuLjBhNzI1
ZjJhYTJlNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaApAQCAtMzMsOCArMzMs
NiBAQAogI2RlZmluZSBBVF9MM19DQUNIRVNJWkUJCTQ2CiAjZGVmaW5lIEFUX0wzX0NBQ0hFR0VP
TUVUUlkJNDcKIAotLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotI2RlZmluZSBBVF9WRUNU
T1JfU0laRV9BUkNICTEwCiAjZGVmaW5lIEFUX01JTlNJR1NUS1NaCQk1MQogCiAjZW5kaWYgLyog
X1VBUElfQVNNX1JJU0NWX0FVWFZFQ19IICovCgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
