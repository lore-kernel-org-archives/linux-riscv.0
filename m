Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DD5CEE323
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhDbT0Q+lADsCBPBskCXxgp4Y4syhAemBkK0Q2h2D9c=; b=XnwwJ5DJRDf6cI
	2X8bb7VZHpellsjPt+7GEQhSr0thGKYcWj1llFHWnjrm780qIsdB+rO3/nkbgmppaVHnbroSTjTid
	WxW8uSRRJKeXoO1SVuYL6vTckp1YFW2Af36KGaA9zVVItXLDgjiH0trUbBXY9j42hc3ecwkyGaC4p
	v0O9EOD0uoGC/c25tW3sZ3jz6l+4/R6GO8WOHG886BJ+uE3DCqb2yhe7t/WKSrHfSVn5eS3HxB4nl
	lA8ehSx2YySp0KBMFoND8ehwhiJfHpq5FhlbXFmPi2VzHdwt27UONrnM8+s3pji+fyMH7qwBV2o4l
	pKNedkqwVrrm/T03DNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvZV-0000000DRcL-268l;
	Thu, 10 Oct 2024 15:59:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLT-0000000DOZ2-2QtX;
	Thu, 10 Oct 2024 15:44:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vUnVSJS3DTEb//Gs9BVFoP2u0LwPRGtOqbRqRypbM=;
	b=sIOYAh5NzXO0FOxy5po1A3r9yhCcksujDF8lsizoipoumMt6VTgm2JcDvV6NwBbBMlbGJx
	Kn3LsdIJhEXc0rrXzy1MHxdrkMCWzbNbsg/turOZ6YbjPY3cq/Z+/Rf5iw3YzOZMJeAms+
	inOaqTMkyaJMfzMgx/DJqFoi0ZOImxKYKuwFgYChI4FLMHyE92T9iHRhmVeOcca81HpsXY
	SICMUvoJ2A9p9IUe0zweJ/8yzVc1dttU98/chnLvx+HSrwdY6nP6BSkjfsst/rkXt3kHEE
	9PFuJfMyufxQ26tfvzuwUAoQ6Ij6qCeHRXQT6o52lhnqEbynfzhVl/yRhZ0Szg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vUnVSJS3DTEb//Gs9BVFoP2u0LwPRGtOqbRqRypbM=;
	b=g1Dc/DssNf7HgFLP/aKNzFqQAI+fIyoQsY+40NP2OIH2OwKugLREQbaHbQ8liXUdTYoZ2A
	mIWRh2bOk4Agl8Dw==
Date: Thu, 10 Oct 2024 17:44:45 +0200
Subject: [PATCH 2/9] arm: vdso: Remove timekeeper includes
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-2-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1591;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UwiQqNt43HWSbVEJA12ycEovjhf8yvNhZRUab1vZ6TI=;
 b=3nrK8ribXR6CLoOX+9blmTN0WotnLlJVbn0mBaFSX/u7EyGlJSmB7anjWYMlRkqPO1MDPqqek
 2+m9ZLARYeaC+jFTNzFUSsmzlNKktBc4+BBRN++ne/SFR7a3xWCy7w4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084455_785381_44EC51EE 
X-CRM114-Status: UNSURE (   9.88  )
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
YW4gbGVhZCB0byBjb21waWxhdGlvbiBlcnJvcnMuCgpBbHNvIGRyb3AgdGhlIGNvbW1lbnQgd2hp
Y2ggaXMgb3V0IG9mIGRhdGUgYW5kIGluIHRoZSB3cm9uZyBwbGFjZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvYXJtL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCB8IDQgLS0tLQogYXJjaC9hcm0v
a2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdmRzby92c3lzY2Fs
bC5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCmluZGV4IDQ3ZTQxYWU4
Y2NkMGI5OTdiNTRkZGE1OWFiZWE4YWU5OGJiZTNjNTYuLjcwNTQxNDcxMGRjZGJmYTlhOTdjMzQ0
ODA2YmQwNzljMDgzNjg4MDEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zkc28v
dnN5c2NhbGwuaAorKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKQEAg
LTQsMTYgKzQsMTIgQEAKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAotI2luY2x1ZGUgPGxpbnV4
L3RpbWVrZWVwZXJfaW50ZXJuYWwuaD4KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAjaW5j
bHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KIAogZXh0ZXJuIHN0cnVjdCB2ZHNvX2RhdGEgKnZkc29f
ZGF0YTsKIGV4dGVybiBib29sIGNudHZjdF9vazsKIAotLyoKLSAqIFVwZGF0ZSB0aGUgdkRTTyBk
YXRhIHBhZ2UgdG8ga2VlcCBpbiBzeW5jIHdpdGgga2VybmVsIHRpbWVrZWVwaW5nLgotICovCiBz
dGF0aWMgX19hbHdheXNfaW5saW5lCiBzdHJ1Y3QgdmRzb19kYXRhICpfX2FybV9nZXRfa192ZHNv
X2RhdGEodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5lbC92ZHNvLmMgYi9hcmNo
L2FybS9rZXJuZWwvdmRzby5jCmluZGV4IGQ0OTlhZDQ2MWIwMDRiMDVlMWYwZjEzY2JlZGFkNzFi
NTg3Zjg0NzguLjI5ZGQyZjNjNjJmZWM2NGM3ZjI5MDQ2ODQyMWJmYWQxZTczOWM2NjcgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9hcm0va2VybmVsL3Zkc28u
YwpAQCAtMTQsNyArMTQsNiBAQAogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcHJpbnRrLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgotI2luY2x1ZGUgPGxpbnV4L3Rp
bWVrZWVwZXJfaW50ZXJuYWwuaD4KICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+CiAjaW5jbHVk
ZSA8YXNtL2FyY2hfdGltZXIuaD4KICNpbmNsdWRlIDxhc20vYmFycmllci5oPgoKLS0gCjIuNDcu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
