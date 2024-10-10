Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864FECFC5EB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTGpPIDJCVNDz0lcYl/HgPmiLyAaCAODDAvTlX4UfYw=; b=T//gJ0KETZU2an
	D6NTHDU3c5csO1LCgBigH5MkYmspGnhxjwGu0WLIHv1LBP0Yqhn0N/akgnQFd4ypifoPFy3USF82b
	jfLheNyjoUq5Cl6tXMEUS/NDp8BCeobpl+9U8QdBGnP78FxBN7sbSewSc/VshE5KOLDAloHAPaqH/
	f9XD4nxRYywlYNkKezw++l5PJMOt+kukDFxg2i6repqd3ng3Bc+uiBVp5yNXeseVpQOX5F2iQHj7G
	IER/5amiOSCu1GM7PwMliijORP/Vg6v7g/sYqDInNUa52GqWU64ObdFlahxoma+2+6EIQvjXXVMWc
	vLcajGtZQ1jk/s0RIMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywls-0000000Ddos-2nrK;
	Thu, 10 Oct 2024 17:16:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLg-0000000DOg0-3Cra;
	Thu, 10 Oct 2024 15:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=; b=JBNbDuMODoMFcAimJjg8W0NtvR
	CBZPK2uni2Qxv6Yo5CCdTbJTs3YZBVMzi9HeFEI5zjQEl+YmFaecEA4xNrRZPqdH9OnkIl671Glss
	+G4tHD3H0tv0jEem8lUT9dGkUD75CHpw8hrPpKgfSNfCOusLfyPWGE96mir2pmH4gmXevSxgqEdVu
	sUC6wOdzX83898kN8VDAAn4rKYsVr+MXzeC5xAKwVmCjKf+Z+hZOJFk3s2xrpaKMu5rIVMi/PeCaY
	H57L90oZbqRWbU9kx21oFJWNvAWaDuloxd+IvjYgTAr/hRuNLT6ps8y89WpN6BYgdF4vRd8B7yQVK
	e98BZXGA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLd-00000005QlH-0yiu;
	Thu, 10 Oct 2024 15:45:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=;
	b=r7gfiTCAQsC/p9L8arvUB1AcmoVbCb06KBfvAwUFBPwE66xPrDZQdOplzHIkTk8Ac+gZDw
	U0EI8/RO2Lf8EqoHHhdV4kOrPr72E2evRfwp3/650RyeQ8xtIomCo6LTOQ1/ibOpBYkYEZ
	r7s96u2+hJUxvZiXOQUgdiY7W6DG3HNC8YgqGQzz6Xat0ZwQJsfXNo1Z5JwLHl9z76Rg0T
	DGjebvVvqJXVuxA25TVBeCwHEPgSItZzu56rtV7mC5kN3RCXB4sCckDrEbdeLy0B5tUmFf
	kMZ/7UlwgoXOdjavq4NU/tC3ZP6yn9+GecVyQ/QP5XU8uP+K27J2wvgwBKvp8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=;
	b=/DL35uF2ubZb8FaGaS2Xtk8IO1KgnsvpfdbZ00U4SPY460WhPFgu+WtEUEO78djLJSq7mr
	9SWI6gYYUV4MWGDg==
Date: Thu, 10 Oct 2024 17:44:48 +0200
Subject: [PATCH 5/9] riscv: vdso: Remove timekeeper include
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-5-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1078;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hpe2ufKxO4wcPCONeGKr9TgGjUW1E936UNjQ+nG3JrU=;
 b=Z6RtjK/nc0O8tEfVBTBZ0WJ1sj/stEr5ZpmR3YKRCxCah4hYNPuy68GyBh4E+r7C/qWgfxerT
 IHK16qphOLZBJGY2dzcOgcs6USZ+7MX7DH4slmMU1FQj0Mj/nZG1UXo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_164505_363862_FF1BF8D0 
X-CRM114-Status: UNSURE (   9.25  )
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
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIHwgNCAtLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Zkc28vdnN5c2NhbGwuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby92c3lzY2Fs
bC5oCmluZGV4IDgyZmQ1ZDgzYmQ2MDJjNzJjMTY4OGE3ZGZmYTI5MmIzN2I1ZmE3OTAuLmU4YTlj
NGI1M2MwYzlmNDc0NDE5NmVlZDgwMGIyMWYzOTE4ZDEwNDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmRzby92c3lzY2FsbC5oCkBAIC00LDE0ICs0LDEwIEBACiAKICNpZm5kZWYgX19BU1NFTUJM
WV9fCiAKLSNpbmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+CiAjaW5jbHVkZSA8
dmRzby9kYXRhcGFnZS5oPgogCiBleHRlcm4gc3RydWN0IHZkc29fZGF0YSAqdmRzb19kYXRhOwog
Ci0vKgotICogVXBkYXRlIHRoZSB2RFNPIGRhdGEgcGFnZSB0byBrZWVwIGluIHN5bmMgd2l0aCBr
ZXJuZWwgdGltZWtlZXBpbmcuCi0gKi8KIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgc3RydWN0IHZk
c29fZGF0YSAqX19yaXNjdl9nZXRfa192ZHNvX2RhdGEodm9pZCkKIHsKIAlyZXR1cm4gdmRzb19k
YXRhOwoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
