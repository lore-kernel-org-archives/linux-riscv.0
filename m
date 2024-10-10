Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EBCCF07BC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3sgN5WSZ8XDATQR4uA6GJyctOc8TCGHm18PBBv2/NU=; b=VqTqjqgywokYyE
	WjwMB7wFVUbvpQH1KbUqdQkasLiMmhmf2n9YnFuPOzr3xNPX6nK6jKf13+F6KtwwmYeZPPweFZ6Im
	8R6NZ/HTEmakwTNCzK2Rf4it0WNf1j3xRM8HEUUlumapze2l7fMjgZ3lpbDM+OIyKgKK/dh8OQgog
	efnfiZKApE2WaqW/YBlv3ZWgSLJF6ekWLKt3oyzwn4+nl0QZx6HemPg1T/LSnvbEzpYjyx9LC2C1i
	FMzAIwl/79GdeXrudT9tI8B7TYEBVGPgQ9GcbZONJcxGviPyydJEveIs8pkWFx+gkRCEvh4xIOP0S
	m6Uijx5rt9baGsr+m9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPW-0000000BoKW-3MKt;
	Thu, 10 Oct 2024 07:16:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBe-0000000Bljx-3QMM;
	Thu, 10 Oct 2024 07:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=; b=uXfVFoTys/LofZj8XEb+kB8ORT
	lJrx33zs7CdgSeIcE3tM/Hv5OQ5b/+MyhlMP0prES3F8XB0MjxHoO/P8W+6/2Zp2CWLOFn9G0LOQU
	ncWRFpI/W6DL+hmMiZtNDp0mTEc1k3xgbKCh+M1EFhip8FOH1MEeCVHqX2Eod6slF/yRUEITDRubG
	pCifWOth8Ab5hOniqX6Hqv8Z6vrvqmiSXWK+KptsElDacK2ogJ2x7EbwrfPKDNWRbnLbWRMq6bxQH
	91G6spcgRw9s1h31ldD/PM0KfOCCcCppW0D+3UVKQqmy2Fn9IN3AgMyPlTza2DD9dtj/ohHE4TOS+
	4i/PZWQA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBa-00000006yCM-2Yhc;
	Thu, 10 Oct 2024 07:02:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=tklXBa7xWPl+94ERFSx5VYFVU6R2SM+ueh7GGooFNR6Mp7U7q+HRsvN4m5KNEiANvjBB32
	8bo3I3tg+ABsVYW3oWyHT48H0ysVjbAC4Xy51Sty7YUC9+/eOMfH7BDXI9d4wghh8FLABS
	YjH2GLE3On43Z3aBpofYG2nQUmPAdm6dup09L3ZaRfeJJI2OnA0Y54Lpl05YZpIUtWybL9
	+MTHCX3NKefTyQQXjbWoFEVVCVX0klqqcDGcmaITXKcLnmVvtf3nsXkMKn4SoQnNIKqBG5
	v9bnr3FOLLd/zj8gKdKRFHfjToA67jwOVYMa8bN5Vz2YWXJ5Q5uDbXUS2qKfrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=4KV9SqG+okf/1Ooh0DC9aya12Po7rP+0eNk/wrqju5ibqZTy9FUvHZqgGqiLHiD8XPBHt0
	Hn5PUudGn66tgQAw==
Date: Thu, 10 Oct 2024 09:01:12 +0200
Subject: [PATCH 10/28] x86/mm/mmap: Remove arch_vma_name()
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-10-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dMMe+I6fcjh0GGIC72EgiCzXdt0VcHRiCFHYCaqC+kg=;
 b=m9t57qVudUvQD7qumicgQPp+/WUG5fIfqupzAy4yMaYthYPm9/oO8yU7qpoE5ULp19HrG7r/s
 +zUDjxBFvCqBxs4uey8HDMXMTjnS0wBto/zlOtGPRIl8B5vfTM+9eGR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080211_323761_15DBD933 
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

VGhpcyBmdW5jdGlvbiBkb2VzIG5vdCBjb250YWluIGFueSBsb2dpYywgZGVsZXRlIGl0IHNvIHRo
ZSBlcXVpdmFsZW50CndlYWsgZGVmaW5pdGlvbiBmcm9tIGtlcm5lbC9zaWduYWwuYyBpcyB1c2Vk
IGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3g4Ni9tbS9tbWFwLmMgfCA1IC0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9t
bWFwLmMgYi9hcmNoL3g4Ni9tbS9tbWFwLmMKaW5kZXggYTJjYWJiMWM4MWUxYWVjMmZjODIzMzlj
MTA5MmJmOGI4MTY3OTA4YS4uYjhhNmZmZmZiNDUxOWNkNzdmNmE1NDA1NjJlZjZkM2VmYTRlN2Iw
ZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbW0vbW1hcC5jCisrKyBiL2FyY2gveDg2L21tL21tYXAu
YwpAQCAtMTYzLDExICsxNjMsNiBAQCB1bnNpZ25lZCBsb25nIGdldF9tbWFwX2Jhc2UoaW50IGlz
X2xlZ2FjeSkKIAlyZXR1cm4gaXNfbGVnYWN5ID8gbW0tPm1tYXBfbGVnYWN5X2Jhc2UgOiBtbS0+
bW1hcF9iYXNlOwogfQogCi1jb25zdCBjaGFyICphcmNoX3ZtYV9uYW1lKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKQotewotCXJldHVybiBOVUxMOwotfQotCiAvKioKICAqIG1tYXBfYWRkcmVz
c19oaW50X3ZhbGlkIC0gVmFsaWRhdGUgdGhlIGFkZHJlc3MgaGludCBvZiBtbWFwCiAgKiBAYWRk
cjoJQWRkcmVzcyBoaW50CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
