Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0DCE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pxfcn9LdMKAKXryr2tp8fN2mcLoRIb1LAgImAkdWzo=; b=t/nhq5PbIZW9j0
	dcB4zfzWQm9HB0HINoZaosAUJug5xAEMXAuJsXSmYaBkpCykNmZ3Km6Kl4ikJnR9yqx2BOZ2ys/I8
	kBab0M2f2tK17lan1nzKNLHAnMBU8TLpyiEXQCMVDcczDnzzCf7EDD/kpOX/X6E1BPzwU6DhdncqC
	lAB+coYDcc1mSl+fCjj5mdcNbe9X7qxGHx+4bQLG5usJgEl8zdTaP2PSprAXHDGf9Qq7AATANeAve
	4no24NdpSuHBO1ymlPnAlO7r4JeG6eBNt3J0JldOr6H3hYJXZBBfzXPqmxQoL1LV5hrV5J7PffrQR
	D2b/ShElay0EiBzoOg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH2Z-0000000Fy4c-0eWa;
	Fri, 10 Jan 2025 15:35:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGrd-0000000Ftgs-0BLy;
	Fri, 10 Jan 2025 15:24:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiMr/7r350FDztI+yfZ4NjY6nn3Y/Nl0egJSTBaRpLs=;
	b=nU7XbmRIRbhhK3BkvK5wfJIUOzyhNhYr4+SxVEuPhBTWH94wR20ECLrVBsQjZPzYkf27Hq
	p2rG+NUsuOEuqR7htHgrqBwxFzrcQEcKmXRDAqJtMFlnHplhWows76OHkWiLGjUd08m92b
	mBpT0EMoBlt3Kcl9d2OqDlpFbIhDxvId+27k2ovO7ZNYxchvunKinis62iQU34Q24aickE
	Zp1+OCGdsAbDvg6R+vfXDrFRhw0YZiwZCJy8jWZ+U3+mKI4jRBU8/yYHtS33aEoGTPZrA3
	zA8A6xvDiBGOWZRlQbnPxPfKh7N3BF7e0X/cHC/0YyvsM+THVaYj5xz5Tuu37w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiMr/7r350FDztI+yfZ4NjY6nn3Y/Nl0egJSTBaRpLs=;
	b=2HokUJVxbHn8F785G0CHjr9RFD9ifVK8x4g4TuI0POw2FWzUOAxJJbiw3xjwoD7htuVi2G
	QcErSkg3qE8OauDA==
Date: Fri, 10 Jan 2025 16:23:40 +0100
Subject: [PATCH v2 01/18] x86/vdso: Fix latent bug in vclock_pages
 calculation
MIME-Version: 1.0
Message-Id: <20250110-vdso-store-rng-v2-1-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=2531;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mrCwYwONHFoKf8BOecbFCAndYakgmDivYb/K3zc9HyU=;
 b=5bbXPNT2cixA+c9v6k3mfkn19z8uqdUaa+GjcugpIz/DlZVc7ni5HOahVN4GdNyeokUKqBUiu
 28329iUY//8CtJtkaCSEgQyd+P1Xi7/4bXcZMBPdBToJqyU81Gwpxz1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072357_395794_382FE080 
X-CRM114-Status: GOOD (  14.00  )
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

VGhlIHZjbG9jayBwYWdlcyBhcmUgKmFmdGVyKiB0aGUgbm9uLXZjbG9jayBwYWdlcy4KQ3VycmVu
dGx5IHRoZXJlIGFyZSBib3RoIHR3byB2Y2xvY2sgYW5kIHR3byBub24tdmNsb2NrIHBhZ2VzIHNv
IHRoZQpleGlzdGluZyBsb2dpYyB3b3JrcyBieSBhY2NpZGVudC4KQXMgc29vbiBhcyB0aGUgbnVt
YmVyIG9mIHBhZ2VzIGNoYW5nZXMgaXQgd2lsbCBicmVhayBob3dldmVyLgpUaGlzIHdpbGwgYmUg
dGhlIGNhc2Ugd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBnZW5lcmljIHZEU08gZGF0YQpz
dG9yYWdlLgoKVXNlIGEgbWFjcm8gdG8ga2VlcCB0aGUgY2FsY3VsYXRpb24gdW5kZXJzdGFuZGFi
bGUgYW5kIGluIHN5bmMgYmV0d2Vlbgp0aGUgbGlua2VyIHNjcmlwdCBhbmQgbWFwcGluZyBjb2Rl
LgoKRml4ZXM6IGU5M2QyNTIxYjI3ZiAoIng4Ni92ZHNvOiBTcGxpdCB2aXJ0dWFsIGNsb2NrIHBh
Z2VzIGludG8gZGVkaWNhdGVkIG1hcHBpbmciKQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3g4Ni9lbnRy
eS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TIHwgMiArLQogYXJjaC94ODYvZW50cnkvdmRzby92bWEu
YyAgICAgICAgICAgICB8IDIgKy0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwu
aCAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMgYi9h
cmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TCmluZGV4IDg3Mjk0N2MxMDA0YzM1
YzAwNmY3NTA4ZWFjN2RmZjI1MWMyODZhZWIuLjkxODYwNmZmOTJhOTg4YjE0ZjVlNjRmOTg0NzUw
YWUwNGIzYjZlZGUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQu
bGRzLlMKKysrIGIvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUwpAQCAtMjQs
NyArMjQsNyBAQCBTRUNUSU9OUwogCiAJdGltZW5zX3BhZ2UgID0gdnZhcl9zdGFydCArIFBBR0Vf
U0laRTsKIAotCXZjbG9ja19wYWdlcyA9IHZ2YXJfc3RhcnQgKyBWRFNPX05SX1ZDTE9DS19QQUdF
UyAqIFBBR0VfU0laRTsKKwl2Y2xvY2tfcGFnZXMgPSBWRFNPX1ZDTE9DS19QQUdFU19TVEFSVCh2
dmFyX3N0YXJ0KTsKIAlwdmNsb2NrX3BhZ2UgPSB2Y2xvY2tfcGFnZXMgKyBWRFNPX1BBR0VfUFZD
TE9DS19PRkZTRVQgKiBQQUdFX1NJWkU7CiAJaHZjbG9ja19wYWdlID0gdmNsb2NrX3BhZ2VzICsg
VkRTT19QQUdFX0hWQ0xPQ0tfT0ZGU0VUICogUEFHRV9TSVpFOwogCmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni9lbnRyeS92ZHNvL3ZtYS5jIGIvYXJjaC94ODYvZW50cnkvdmRzby92bWEuYwppbmRleCAz
OWU2ZWZjMWE5Y2FiNzYwYjhhNjVlNGIwMmM2MjRlOGM3NTI0NGI1Li5hYTYyOTQ5MzM1ZWNlYzM3
NjVkM2I0NmVhYzdmN2I4M2JlNWVmZGRhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS92ZHNv
L3ZtYS5jCisrKyBiL2FyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMKQEAgLTI5MCw3ICsyOTAsNyBA
QCBzdGF0aWMgaW50IG1hcF92ZHNvKGNvbnN0IHN0cnVjdCB2ZHNvX2ltYWdlICppbWFnZSwgdW5z
aWduZWQgbG9uZyBhZGRyKQogCX0KIAogCXZtYSA9IF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyht
bSwKLQkJCQkgICAgICAgYWRkciArIChfX1ZWQVJfUEFHRVMgLSBWRFNPX05SX1ZDTE9DS19QQUdF
UykgKiBQQUdFX1NJWkUsCisJCQkJICAgICAgIFZEU09fVkNMT0NLX1BBR0VTX1NUQVJUKGFkZHIp
LAogCQkJCSAgICAgICBWRFNPX05SX1ZDTE9DS19QQUdFUyAqIFBBR0VfU0laRSwKIAkJCQkgICAg
ICAgVk1fUkVBRHxWTV9NQVlSRUFEfFZNX0lPfFZNX0RPTlREVU1QfAogCQkJCSAgICAgICBWTV9Q
Rk5NQVAsCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggMzdiNGE3MDU1OWE4
MjI4NjAxMjAzZmU3Yjk5YjlkZGZjM2Q5NGYxYi4uODhiMzFkNGNkZmFmMzMxZDJkNTk3OTgxZDNm
OGVlMGM1YTMzOTA4NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lz
Y2FsbC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaApAQCAtNiw2
ICs2LDcgQEAKICNkZWZpbmUgX19WVkFSX1BBR0VTCTQKIAogI2RlZmluZSBWRFNPX05SX1ZDTE9D
S19QQUdFUwkyCisjZGVmaW5lIFZEU09fVkNMT0NLX1BBR0VTX1NUQVJUKF9iKQkoKF9iKSArIChf
X1ZWQVJfUEFHRVMgLSBWRFNPX05SX1ZDTE9DS19QQUdFUykgKiBQQUdFX1NJWkUpCiAjZGVmaW5l
IFZEU09fUEFHRV9QVkNMT0NLX09GRlNFVAkwCiAjZGVmaW5lIFZEU09fUEFHRV9IVkNMT0NLX09G
RlNFVAkxCiAKCi0tIAoyLjQ3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
