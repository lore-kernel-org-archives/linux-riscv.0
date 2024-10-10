Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C31DCF07BE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skd88ZhU34cc4HkMhv4h2mb+RG8x5xVtTuolZL1Ahd4=; b=mj4uM+fFPPE4ib
	PmPVtvozA4EhWZc6oIEPoxMH6ZzCqPOhq3Sz+djxLsajuDzo2LZfFBa0FzqelJ2sazndfpsb+UuKB
	IZdg0zWXOKt7tr7tXuUAg3m3d0nlxfDipMN0Q13TmS3e5H3kL/6X6rbPNzpRqtlCzfkLFrx3l6UTu
	/VOpN5BJ35JiU6Ai1Y1fjWn1oeL4uoNFgyB3OXB8PtYwCarbe/0OIb9JjqsrRpGK0rhhIzPZ9Bnyy
	EvN3X0PWmQLi3z8X22gopGO+tF3L6IbJ22yHyg59cpPcdf0EvJ2VJeP7aWvC5IAZudqPFRatSPbH0
	aaNe+hunp9FhVCihhSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPe-0000000BoQ1-19Bp;
	Thu, 10 Oct 2024 07:16:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBf-0000000BlkB-17c8;
	Thu, 10 Oct 2024 07:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=; b=pil+eoVDarRVYw0y8kyr29imjC
	Hicb8BzzfI26CY3K1gIuz5hKbj3zJld4e9sEHAeYkSQWFuUZ6RHICcmduBLqtKzm5VavN2ZZNW0nJ
	vzQSdaH6/XhVtSNtedtykC6nCHQhsXZU2/1jdkGf1KalO6PCE3jXF8pLdOhYx49jH0HkXW1PfFsRT
	MRdRgUamqpSPJhq95EL1l27BVS0rsSc9xyLXFRjP+G7QZdhDywqQNXMxfnfQ3VXhYkNdNItaVna92
	bP17M19IMxXE1zcgxggEhhJaKlDGCvbCgdks7Iq37vQhrmKXf6EQ7zhycYBlSzw1+oivQreKxr3v2
	xenXZU/Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBa-00000006yCL-1wmn;
	Thu, 10 Oct 2024 07:02:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=Q9YOUPVlbRgarYFZCEn3UByLmZ+tdONBS0jm2Njl7NuYL217YwE9aEGuhhDzPYtI8auXWI
	6EUH0gAxMTswBA+hCJ/uSBXpp7rUJ8dUnVNaSglS6YJ/pO2jv181FiW9TruX1n6wnuoymG
	QBNjWPWFl1HtIKdmgkFMRMM/SW/gJLEcl8Z/NpCXVDRm+Pxerg1xyOrNdLRu8a7tLi/yaQ
	MWZJoK6aQUPZXe+0hirbZKdMT4aFxmGegPMU1LhVE1mlW2YU9zKGaO6JXofmppA0mqxP2D
	O6Q6Q4kN//3QwEoHxIC/FfTFI6FZqd3kyhX/Z5SgGRZn950eO4RGgG8ruOhaTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=TAio2B7lTV1K9VxvAcZ6eNE+Q36Yw79samXTeYefVjIJKo5jhM0OyGWf0mAgAZBaDq9RrV
	oo6TB75HhFT+wsDQ==
Date: Thu, 10 Oct 2024 09:01:11 +0200
Subject: [PATCH 09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-9-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1337;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kTMXixxVJlfX+2o4JjaS2yYnPzAKaCOR1RKXEsusUJ0=;
 b=HVksjM017my4j/baEMdnqIYnTkC5X6ULTM3kipfeka7LvdRE8rDfL1D4EZZQQ5t3NMAkzyRXH
 Z4a3SXUt+vfCNgB3baUfOvVrwy2M2av2cDJKG1sBSM0vWJN6JEF8iOb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080211_198072_1AF57DFB 
X-CRM114-Status: GOOD (  11.55  )
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

VGhlIGdlbmVyaWMgdmRzby9kYXRhcGFnZS5oIGRlY2xhcmVzIGEgc3ltYm9sIG5hbWVkICJ2ZHNv
X2RhdGEiLgpBdm9pZCBhIGNvbmZsaWN0IGJ5IHJlbmFtaW5nIHRoZSBpZGVudGljYWxseSBuYW1l
ZCB2YXJpYWJsZSBpbiBnZW52ZHNvLmMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL21pcHMvdmRzby9n
ZW52ZHNvLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3Zkc28vZ2VudmRzby5jIGIvYXJjaC9t
aXBzL3Zkc28vZ2VudmRzby5jCmluZGV4IDA5ZTMwZWI0YmU4NjA1NTgxZjllYTQwYjc1N2RkNGU1
NzZlZDBjMmEuLmQ0NzQxMmVhNmU2NzM2Yjg3MTRmN2RiN2U0Y2ZlN2MxOGJmMTJjMDQgMTAwNjQ0
Ci0tLSBhL2FyY2gvbWlwcy92ZHNvL2dlbnZkc28uYworKysgYi9hcmNoL21pcHMvdmRzby9nZW52
ZHNvLmMKQEAgLTI3MCw3ICsyNzAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3Yp
CiAKIAkvKiBXcml0ZSBvdXQgdGhlIHN0cmlwcGVkIFZEU08gZGF0YS4gKi8KIAlmcHJpbnRmKG91
dF9maWxlLAotCQkic3RhdGljIHVuc2lnbmVkIGNoYXIgdmRzb19kYXRhW1BBR0VfQUxJR04oJXp1
KV0gX19wYWdlX2FsaWduZWRfZGF0YSA9IHtcblx0IiwKKwkJInN0YXRpYyB1bnNpZ25lZCBjaGFy
IHZkc29faW1hZ2VfZGF0YVtQQUdFX0FMSUdOKCV6dSldIF9fcGFnZV9hbGlnbmVkX2RhdGEgPSB7
XG5cdCIsCiAJCXZkc29fc2l6ZSk7CiAJZm9yIChpID0gMDsgaSA8IHZkc29fc2l6ZTsgaSsrKSB7
CiAJCWlmICghKGkgJSAxMCkpCkBAIC0yODYsNyArMjg2LDcgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQogCiAJZnByaW50ZihvdXRfZmlsZSwgInN0cnVjdCBtaXBzX3Zkc29faW1h
Z2UgdmRzb19pbWFnZSVzJXMgPSB7XG4iLAogCQkodmRzb19uYW1lWzBdKSA/ICJfIiA6ICIiLCB2
ZHNvX25hbWUpOwotCWZwcmludGYob3V0X2ZpbGUsICJcdC5kYXRhID0gdmRzb19kYXRhLFxuIik7
CisJZnByaW50ZihvdXRfZmlsZSwgIlx0LmRhdGEgPSB2ZHNvX2ltYWdlX2RhdGEsXG4iKTsKIAlm
cHJpbnRmKG91dF9maWxlLCAiXHQuc2l6ZSA9IFBBR0VfQUxJR04oJXp1KSxcbiIsIHZkc29fc2l6
ZSk7CiAJZnByaW50ZihvdXRfZmlsZSwgIlx0Lm1hcHBpbmcgPSB7XG4iKTsKIAlmcHJpbnRmKG91
dF9maWxlLCAiXHRcdC5uYW1lID0gXCJbdmRzb11cIixcbiIpOwoKLS0gCjIuNDcuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
