Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6380CF11C8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH79Tkcf6RiVIOrHCdt2RvrXMReibz6whpZ4CxM0QDw=; b=fwpBolY81vLRCU
	XYQaeV9HsEApElbkOy3B2qSgf/Kct8y5fpWuQHObNUugxNnhck74X3yyqjbSYbOElcDru59F4dIz/
	PMRCrnlQwzxoS6EN9pSD/8d6dGnIjyFB6/PvmsJMiLaCMNd9jVjwcJZr/X1t8xoAjl4ftOxShhB/a
	wLQ6pfyeh0EPWtbuWLp+HPU0n2A2g1hM2gM1tXl7jIyE8hmiRDKLUpb5hNMa4sZv0SiXopL9re5pw
	fA52kgWYTo90jxCUfmR9to4yRZNymjUvbBXqNrCq60M8mBM5+5nUOG66szmezqJbpeNhCOQV9+xGc
	rDPUNqSl7VA7IxHBs85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvcd-0000000DSSZ-1yOa;
	Thu, 10 Oct 2024 16:02:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLd-0000000DOev-1q3Q;
	Thu, 10 Oct 2024 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=; b=fLmpF9wKO1Mob+/zbx4qEnMAVv
	8qSL2Irf5CGf3qJ7c+a1OTcjCU9U6x8msnuWwyoOUZFGlT44n8O5WRiGFOJ00347hThkkZV3mreuq
	Ja5WSBQRSSmbFcO20FWc7rYYIBOIg5WjIGJkUdYRPkIjP0jyEtEx6tcg8Xy+oWdP9B0HiMWwKfILo
	DCkC3crqZXVgmEprxVb9XrxrKZ2zyD4lXpkQ/DHIYJiDWMbOsOKEMPDuutjGAxoSwfz5R36OmVVmD
	8+kqfv95o6apC0WuQ7Qk8HKit+DARzYWQsci1GNfusDZwLhvrKrpCbh9O2LDHH69emT/Vt21jrm+H
	MPjsWOIw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLZ-00000005Qis-23ZC;
	Thu, 10 Oct 2024 15:45:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=;
	b=JeOI7EjGLWzijEdDcl6Tyi4eiJ+IoscNn1jn4Vnt1OJdKL/uMl4CZVmNoWEKL26snSeCc3
	yUpTPNiE6dS+kXCtW/1yOHgifjIaoXu5PN08+QPe2MLJH6B3MorQvyU9c+IOwT3vHUg9ck
	nUlnT87H5MCm3An3Rjd6Om0ySYAyjGgy5ZEi17K9cQzhfP+zJXWKQf3QUzd4pZHVmQ/abD
	3RW6JhvsHdGE/RvnfUfZf56jVx3/uwb8LTV5bMMyjMtZ45FLSkTby93OyLEKukozI71WSX
	NwAl5c4PybYcB33UnzB7wmW8bdj9OQ78VFr+ICgepDAff+wKZqw85Zyvj49WPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY01drBheEGVUpRb1fYSGc/wPWUSgNrxFS5OIkyqJ0M=;
	b=q3gi+1121GrBcixQaKmeu1KvtClMIz0AoNScv5wbMLdknPGj1mZTBeK2w8VhWVCj9v64TY
	VYgJRYX28CCZ+0DQ==
Date: Thu, 10 Oct 2024 17:44:50 +0200
Subject: [PATCH 7/9] x86/vdso: Remove timekeeper include
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-7-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=816;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=l54nGxhAvHD6pY7wtN4Hu9pn70wCVvNZSe9VHdZoefM=;
 b=w5TeMa7L2fBX8rWHCW0VUcxRJmtxwVTWhqmFg4Ar7aOri6rXy8RfO9ACmyKKuOK1EBa7U50Tw
 YyJTJNACEbjDPGQDXMNIPF0R+gdo+aXllV8ZfbtgU2RaAvcg1suki3H
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_164501_692285_B13D729B 
X-CRM114-Status: UNSURE (   8.03  )
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

U2luY2UgdGhlIGdlbmVyaWMgVkRTTyBjbG9jayBtb2RlIHN0b3JhZ2UgaXMgdXNlZCwgdGhpcyBo
ZWFkZXIgZmlsZSBpcwp1bnVzZWQgYW5kIGNhbiBiZSByZW1vdmVkLgoKVGhpcyBhdm9pZHMgaW5j
bHVkaW5nIGEgbm9uLVZEU08gaGVhZGVyIHdoaWxlIGJ1aWxkaW5nIHRoZSBWRFNPLAp3aGljaCBj
YW4gbGVhZCB0byBjb21waWxhdGlvbiBlcnJvcnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vp
w59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5o
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCmluZGV4IDY3ZmVkZjE2OThi
NWUyYjcxMGUwNTA0Njg2MzE4OTQ5YzczOGJmMjkuLmExZjkxNmIxODQwMGY2NWViOTFkNWVjMGUz
ZWI0OWIwNzAzMzI5MDQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5
c2NhbGwuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKQEAgLTQs
NyArNCw2IEBACiAKICNpZm5kZWYgX19BU1NFTUJMWV9fCiAKLSNpbmNsdWRlIDxsaW51eC90aW1l
a2VlcGVyX2ludGVybmFsLmg+CiAjaW5jbHVkZSA8dmRzby9kYXRhcGFnZS5oPgogI2luY2x1ZGUg
PGFzbS92Z3RvZC5oPgogI2luY2x1ZGUgPGFzbS92dmFyLmg+CgotLSAKMi40Ny4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
