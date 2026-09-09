Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A14C79FBD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InZ4NQcycqfBQiXH9RTsg1JTaFeDHAYh/MTS0T7CXdQ=; b=ngWZB2WkcFwEWU
	QoC1vwl6ULtNR2zCJWSemLzwGvGn0nK88RQC3qPLUQHAez4YDRZR1iiHQ0uM9PUbCtvSJcE3/s628
	SamMb8P7GrXEWSlpuwRZ+DDf571XWro/2vAETM6tuXaBWSy68NDvAeUvxti9YtsvtLHE7S7t+za2u
	6MDrjfQ2mr9ek/TL53lS7uuhz2kDvbsnN/WBBZBBthYRSwYsJeIXYCR/FueEkr31D73LyAMMPVkaa
	zeLMftz0p0hCVgFuV86noe37KRpUBnswjORasdSmTUHymu3L0ZCnZsOmYdXm/NEA43o21rr3SZ/MI
	yUUyiY+vqqX8UHHxQNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E21-0000000BAXZ-09Pf;
	Wed, 09 Sep 2026 08:51:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1j-0000000BAEj-2pi0;
	Wed, 09 Sep 2026 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=; b=OVlZAnIw+/baqnydri1w0mI2Z0
	7mYNtwDg4iysmN3Yt9Oa3yp71481WiJ+7FaPlcpDyZZCVMohJde4XG32qF6r8o0tA+cYTtflzUuvq
	aOn6ReLJxZlrk4c2esu+NCXT0AzKtvPKE2OykakokeGhl330RD14D/375X8ftRtmRA/Cs9PzLVbfQ
	D1K3vD2fQQwNpTF5oWCagJzLbp/x1mwCRvwWIoFuezMqqChkzuayEpKlUaGpOf48YBYWyeS55s4Zp
	rvAVJzabL1truQ4YoxK6MNlRxngZUhX6E1LUMYETa0M3dWmbScqjNjGec46cOKFRkpPtu8484Kk5P
	D1Xeezfg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1g-00000000wHX-3Qef;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=;
	b=fY43G6LBWdQkHYdyVBIxlLabTz9sY1wdEwbix3guUJj3EMTAlgttvjyicJzcS1byA/EYdy
	G2GOcuMDfq5geeNDnOjPbvRb7EzsEL1Clk/H8WaN0sddjYKMQS4eG0BqCIjRr0OlvTLJSN
	RN90tB/5INV6w2dlX8afOXI3xFKQezguucJCgLOZTNwjr6RY6fTr4CjhnpG2JJQfq8bTxY
	xQ1o1MTBSTdqjdBasvcUb1G+ogTvTjmpXkvfnYDAWwEY82x7oyBpb3faiydAcgcQB9K5Yj
	qx0k7QtEbJReCwJRQceG/UD512/jPmjWdRPduWsrE9i7v+i6KjtZJ5SCxfdJxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=;
	b=fS/qMfZfymFeZyXXZSlfW6pLXpcG8P6cUd3bXFewTMfnuYEoBNdNlxmu56kaFJOQgmnkTU
	azAqtLuPsNDaytDw==
Date: Wed, 09 Sep 2026 10:51:21 +0200
Subject: [PATCH 08/15] s390/vdso: Delete asm/vdso/vsyscall.h inclusions
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-8-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XEkGmHaO9UQ15JGGo9EFCqoDzN0VZwQacIVpi6I6eho=;
 b=tWx5LzZMM3tFuh6dvop7MXiyaao+GWjDBE8xefvCVu+hYibUJLQsMpisPmgpEGcWAc/Wv8tBg
 BkTPk+qz6khArKF3lgV/FIsobdzvGD8+AIMA3xOqRUfKNBft+tKTA1x
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_065315_0E3CF54F 
X-CRM114-Status: UNSURE (   6.72  )
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

VGhlIGluY2x1c2lvbnMgYXJlIHVubmVjZXNzYXJ5LCByZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oIHwgMSAtCiBhcmNoL3Mz
OTAva2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgICB8IDEgLQogYXJjaC9zMzkwL2tlcm5lbC92
ZHNvL3Zkc28ubGRzLlMgICAgICAgfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCBi
L2FyY2gvczM5MC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCmluZGV4IDY3NDFhMjcxOTlm
OC4uZmY1ODgyZjJmYzcwIDEwMDY0NAotLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9n
ZXRyYW5kb20uaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaApA
QCAtNiw3ICs2LDYgQEAKICNpZm5kZWYgX19BU1NFTUJMRVJfXwogCiAjaW5jbHVkZSA8dmRzby9k
YXRhcGFnZS5oPgotI2luY2x1ZGUgPGFzbS92ZHNvL3ZzeXNjYWxsLmg+CiAjaW5jbHVkZSA8YXNt
L3N5c2NhbGwuaD4KICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4KZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvdmRzby5jIGIvYXJjaC9zMzkwL2tlcm5l
bC92ZHNvLmMKaW5kZXggMGZlNjE2YzQ5ZmNjLi5hOTA1Zjk4OWY5MTAgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvczM5MC9rZXJuZWwvdmRzby5jCisrKyBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby5jCkBAIC0x
OCw3ICsxOCw2IEBACiAjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+CiAjaW5jbHVkZSA8bGludXgv
dmRzb19kYXRhc3RvcmUuaD4KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+Ci0jaW5jbHVkZSA8
YXNtL3Zkc28vdnN5c2NhbGwuaD4KICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KICNpbmNs
dWRlIDxhc20vdmRzby5oPgogCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3Zkc28vdmRz
by5sZHMuUyBiL2FyY2gvczM5MC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCmluZGV4IDg0MWRhZWVj
NGJlMi4uNmJjZGI2NDMxNWYyIDEwMDY0NAotLS0gYS9hcmNoL3MzOTAva2VybmVsL3Zkc28vdmRz
by5sZHMuUworKysgYi9hcmNoL3MzOTAva2VybmVsL3Zkc28vdmRzby5sZHMuUwpAQCAtNCw3ICs0
LDYgQEAKICAqIGxpYnJhcnkKICAqLwogCi0jaW5jbHVkZSA8YXNtL3Zkc28vdnN5c2NhbGwuaD4K
ICNpbmNsdWRlIDxhc20vcGFnZS5oPgogI2luY2x1ZGUgPGFzbS92ZHNvLmg+CiAjaW5jbHVkZSA8
YXNtLWdlbmVyaWMvdm1saW51eC5sZHMuaD4KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
