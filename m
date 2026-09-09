Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C9C79FBF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+eYoxeWO5dPi5ayb6jJDQWBy6NHDPEIuk9Q6VSylP4=; b=Q650zpMG4nUrYg
	V1bTODDC4Or154hjyZWY8aNtiw6BYdG93nkckqlA1ULPGbZ+3lmQYC+vxX2qnW4YLj82FhzehP+RJ
	J9BvVCXQIxwBiVAnPEbV8KGUTpfUeZDuXXPM10GYwx4eMi4AEhkvJ3PAOzTaUKJe+2KasLDFi79b7
	Yw48cU+RZH2AIyvbsftA5+me2ABJdsC9IFbrf7Ep+POnJimhskt7wdJWSWmWSELRRqf8qlfGfsfC9
	c7iDt336rRNIDrt0fPZ8YQNVbUoflimMNrVsgS8VKetocxWEK6wda0RcRqnhUXJ7IAKTtsoSgdZdF
	CfKqw48vdCxtn06V1iLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E22-0000000BAaH-2TJx;
	Wed, 09 Sep 2026 08:51:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1j-0000000BAEp-2vn0;
	Wed, 09 Sep 2026 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=; b=OKxaVN09L6VQGWaL4/0wACANNt
	uDsX1wzVtTZuCBli/mntbbz4O4l4Ug1xmXOfzdU8Gv7joj7cp6rXfv6gjMJ3Oodj7BYOiKvJyT5r+
	6DQhH50CkrwHzzYlX+A0q5sSrw0COlkYY9ade5CbGz4fel5hu5uEenIEfhZzb3LUramencXbfSgzK
	UAIqeoNtmp9HSKFmGytKzDXvSKpOdtQ7Rewfg5Wgz8XldLVHUOJvrhnrKFwN7Dy8GMe+cGQdVsXHf
	K2lJ9CB+I2DSfbTYIlxfZzzy7Npb+gS8vftP8hnGiEZuL1K9MogyA3Dplq4oXmYgi8Xc1Exo2xRuX
	pDGdkBjQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1g-00000000wHY-3RTd;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=;
	b=IdgLyGapCdf08hmIlLUWBy5AL4aW14xA2DS8OXFT1Zb3CfDnLbwZzDeXVhoDtbepPja8BN
	ryTtklMY2ERezCHSjJlc8z6NqAmiDSIy1DJogjFxpiZHuvKq7I5LB3MdZv9H4OozHj6Tng
	jbuQ4bPlOXu2wnT85khiyqOCKQBqOycEa8gaAjPIKxtVnd7LNbfnR49SgNv8Yl+pmxE0Ms
	s+Yl7j6gRiBR+fdcJhs4gs56Mczg7vk4/5aJnJbPl7DjBAqCEpkK7rppWwNbmLG9BrzDR7
	ChLjxpdfSnPxkp9jo/Sqv2fznf1ecuWEK6Jrcl1M/D7NpH6KpEFrKYbzuewvbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=;
	b=VVFeQNO/Qr/Vdm/q5BIomEtSc9i3kd9MK5TvsOwwjy2HYSUJfnaUQnR6L8aW7POLHXLm9j
	GGUXnc3tC3NpprCg==
Date: Wed, 09 Sep 2026 10:51:20 +0200
Subject: [PATCH 07/15] sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-7-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1764;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VaPdauFQWLU0KJEV2a1f+WJtOXR8fxXaZFpswc0b434=;
 b=jH77Q51ITwUmOjNWzqUo9lEC+d/JgkdmQkYyv3oztNYP+7L0bV4RFQRJ0PdkZOHP7kKbcLVEn
 InKr6KCGEt+AhGlPxfVPXNdvyax8i9utdLhbRU/m9JgTxddcG4QStTx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_091825_9DA29DD4 
X-CRM114-Status: UNSURE (   9.51  )
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

TW9zdCBhcmNoaXRlY3R1cmVzIGRlZmluZSB0aGUgX19WRFNPX1BBR0VTIHBhZ2UgbWFjcm8gaW4g
YXNtL3Zkc28uaC4KCkFsaWduIHRoZSBTUEFSQyBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJj
aC9zcGFyYy9pbmNsdWRlL2FzbS92ZHNvLmggICAgICAgICAgfCA2ICsrKysrKwogYXJjaC9zcGFy
Yy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggfCAyIC0tCiBhcmNoL3NwYXJjL3Zkc28vdmRz
by1sYXlvdXQubGRzLlMgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20v
dmRzby5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS92ZHNvLmgKaW5kZXggZjA4NTYyZDEwMjE1
Li5iMTdjMzdjODA3NWIgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vdmRzby5o
CisrKyBiL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vdmRzby5oCkBAIC01LDYgKzUsMTAgQEAKICNp
Zm5kZWYgX0FTTV9TUEFSQ19WRFNPX0gKICNkZWZpbmUgX0FTTV9TUEFSQ19WRFNPX0gKIAorI2Rl
ZmluZSBfX1ZEU09fUEFHRVMgNAorCisjaWZuZGVmIF9fQVNTRU1CTEVSX18KKwogc3RydWN0IHZk
c29faW1hZ2UgewogCXZvaWQgKmRhdGE7CiAJdW5zaWduZWQgbG9uZyBzaXplOyAgIC8qIEFsd2F5
cyBhIG11bHRpcGxlIG9mIFBBR0VfU0laRSAqLwpAQCAtMTcsNCArMjEsNiBAQCBleHRlcm4gY29u
c3Qgc3RydWN0IHZkc29faW1hZ2UgdmRzb19pbWFnZV82NF9idWlsdGluOwogZXh0ZXJuIGNvbnN0
IHN0cnVjdCB2ZHNvX2ltYWdlIHZkc29faW1hZ2VfMzJfYnVpbHRpbjsKICNlbmRpZgogCisjZW5k
aWYgLyogX19BU1NFTUJMRVJfXyAqLworCiAjZW5kaWYgLyogX0FTTV9TUEFSQ19WRFNPX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIGIvYXJj
aC9zcGFyYy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggYjA4ZTBiZDVlMzA5Li5m
ZjYyYjI5MWU0ZWIgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vdmRzby92c3lz
Y2FsbC5oCisrKyBiL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCkBAIC0z
LDYgKzMsNCBAQAogI2lmbmRlZiBfQVNNX1NQQVJDX1ZEU09fVlNZU0NBTExfSAogI2RlZmluZSBf
QVNNX1NQQVJDX1ZEU09fVlNZU0NBTExfSAogCi0jZGVmaW5lIF9fVkRTT19QQUdFUyA0Ci0KICNl
bmRpZiAvKiBfQVNNX1NQQVJDX1ZEU09fVlNZU0NBTExfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9z
cGFyYy92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TIGIvYXJjaC9zcGFyYy92ZHNvL3Zkc28tbGF5b3V0
Lmxkcy5TCmluZGV4IDE4MGU1ZDBlZTA3MS4uOTIwMzk2MjAzYTJlIDEwMDY0NAotLS0gYS9hcmNo
L3NwYXJjL3Zkc28vdmRzby1sYXlvdXQubGRzLlMKKysrIGIvYXJjaC9zcGFyYy92ZHNvL3Zkc28t
bGF5b3V0Lmxkcy5TCkBAIC02LDcgKzYsNyBAQAogCiAjaW5jbHVkZSA8dmRzby9kYXRhcGFnZS5o
PgogI2luY2x1ZGUgPHZkc28vcGFnZS5oPgotI2luY2x1ZGUgPGFzbS92ZHNvL3ZzeXNjYWxsLmg+
CisjaW5jbHVkZSA8YXNtL3Zkc28uaD4KIAogU0VDVElPTlMKIHsKCi0tIAoyLjU1LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
