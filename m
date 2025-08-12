Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFC1CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4cuKMUbsKnmyewN7Pk8XFZjZ0fhKyYTEhiSNr4hkHM=; b=CakKweO0BeV5jp
	ACiQ2QAURF2FaY/LG9e37owsw9VHjeoIajEXDjgLBZ3oJoiIl0bZD4PScKhOHYBwSxMnx5XZPO8f+
	qNbZzhACn34UicmbN5QB4PSZEJQWyKF3tvuiNC1vWioLREUZWKpEeM5QtNQSJgGpDpBtEGGVZyCbi
	eDnoR1o0qB6nsFGD1xw/HIXAz73hd7yTyAqmn/4WZc4qjts1O4Ya7a4aomCt0blW16z4BqkalAyqB
	WKSkysFSibeHsaS6spdwlsiHZCvyeJFgFNvyWFla0EhEE76ZqYR/OsE/7fjuU8Z9MkVPNVsCZRXfM
	eud/5URiwWshSZXKyUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhol-00000009vLW-2exu;
	Tue, 12 Aug 2025 05:45:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoN-00000009unI-1Cz1;
	Tue, 12 Aug 2025 05:44:42 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfNfmAZ2eWXIcM3gW1RToAS2jXuE+ttAWjtBaA8JivY=;
	b=B1kpGRDy3pua7bopWb/954oKgIRuc3FpjRcj8N8/0woGocR6MrlC63NTftBUFibKS/AICQ
	0l4yLvJDAUL9O9Iv8brOnKZbuEK46aY74M50FME3ez3Pqc0JNVP0cah4ZO+nwmJK1ZETG+
	ahGQ2eL4oYMmBUubBb7TW5qooKJgC0dBGwDMZsgzk0S+hvVfKZybnmYIkMpJmtsWOmDXE/
	7A3+CPHb6uwJ43WFXviOiwG4lW30wI8rFjFt/MBD45XXy8SmYdbOVBvgbqsdc9GpTPAv4z
	YPBooaL0o00WA384eonGN+yemrymWJ8qP4EH0Mydpotgh3etmFhObcSWEnpSWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfNfmAZ2eWXIcM3gW1RToAS2jXuE+ttAWjtBaA8JivY=;
	b=XsxRG5noqNi3QHUb3PsJMNnR3h1efFABfuNPsU4Tp4BzgulPHL9P4+dkMiySHq2nPf5wzI
	aGxuMRcC3js1Y5AQ==
Date: Tue, 12 Aug 2025 07:44:22 +0200
Subject: [PATCH v4 09/24] MIPS: ELF: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-9-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=4434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=URWumLq5cEfF9wP67bk+ZcYfaIdTPXBTgCA3fiF+CgA=;
 b=L2h7+F73PT6iolsNxcu6S1mxeLogHfAutUNfzT1g4xN2qS8cRMLW7GI8H7DLrsC8VYfYYOVEW
 2yK3W8sGTl1CqHowhCCS2gkuE5kLBohKQe3c+i9dq+/6IUgTR2HRtCc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224439_659731_CB639C9B 
X-CRM114-Status: GOOD (  12.95  )
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

VGhlc2UgY29uc3RhbnRzIGFyZSB1c2VmdWwgZm9yIGNyb3NzLXBsYXRmb3JtIHVzZXJzcGFjZSwg
Zm9yIGV4YW1wbGUgdG8KcHJvY2VzcyBFTEYgZmlsZXMgZHVyaW5nIGtlcm5lbCBjcm9zcy1jb21w
aWxhdGlvbi4KCk1vdmUgdGhlbSBmcm9tIHRoZSBrZXJuZWwtcHJpdmF0ZSBhcmNoaXRlY3R1cmUt
c3BlY2lmaWMgaGVhZGVyIHRvIHRoZSBVQVBJLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL2VsZi5oIHwgNTMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICB8IDU0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNl
cnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVk
ZS9hc20vZWxmLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vZWxmLmgKaW5kZXggZGM4ZDI4NjM3
NTJjZmQ1ZThlMmNiZDc1MDI3NmY5NDYzZTBjMzJiOC4uMzQ3ZTEyNTg0YmVlYmJiNWE3MjkwZWZh
ZTMzMTBiMDEyMjBiYmUwYSAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2VsZi5o
CisrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9lbGYuaApAQCAtNzAsNTkgKzcwLDYgQEAKICNk
ZWZpbmUgRFRfTUlQU19ISVBBR0VOTwkweDcwMDAwMDE0CiAjZGVmaW5lIERUX01JUFNfUkxEX01B
UAkJMHg3MDAwMDAxNgogCi0jZGVmaW5lIFJfTUlQU19OT05FCQkwCi0jZGVmaW5lIFJfTUlQU18x
NgkJMQotI2RlZmluZSBSX01JUFNfMzIJCTIKLSNkZWZpbmUgUl9NSVBTX1JFTDMyCQkzCi0jZGVm
aW5lIFJfTUlQU18yNgkJNAotI2RlZmluZSBSX01JUFNfSEkxNgkJNQotI2RlZmluZSBSX01JUFNf
TE8xNgkJNgotI2RlZmluZSBSX01JUFNfR1BSRUwxNgkJNwotI2RlZmluZSBSX01JUFNfTElURVJB
TAkJOAotI2RlZmluZSBSX01JUFNfR09UMTYJCTkKLSNkZWZpbmUgUl9NSVBTX1BDMTYJCTEwCi0j
ZGVmaW5lIFJfTUlQU19DQUxMMTYJCTExCi0jZGVmaW5lIFJfTUlQU19HUFJFTDMyCQkxMgotLyog
VGhlIHJlbWFpbmluZyByZWxvY3MgYXJlIGRlZmluZWQgb24gSXJpeCwgYWx0aG91Z2ggdGhleSBh
cmUgbm90Ci0gICBpbiB0aGUgTUlQUyBFTEYgQUJJLgkgKi8KLSNkZWZpbmUgUl9NSVBTX1VOVVNF
RDEJCTEzCi0jZGVmaW5lIFJfTUlQU19VTlVTRUQyCQkxNAotI2RlZmluZSBSX01JUFNfVU5VU0VE
MwkJMTUKLSNkZWZpbmUgUl9NSVBTX1NISUZUNQkJMTYKLSNkZWZpbmUgUl9NSVBTX1NISUZUNgkJ
MTcKLSNkZWZpbmUgUl9NSVBTXzY0CQkxOAotI2RlZmluZSBSX01JUFNfR09UX0RJU1AJCTE5Ci0j
ZGVmaW5lIFJfTUlQU19HT1RfUEFHRQkJMjAKLSNkZWZpbmUgUl9NSVBTX0dPVF9PRlNUCQkyMQot
LyoKLSAqIFRoZSBmb2xsb3dpbmcgdHdvIHJlbG9jYXRpb24gdHlwZXMgYXJlIHNwZWNpZmllZCBp
biB0aGUgTUlQUyBBQkkKLSAqIGNvbmZvcm1hbmNlIGd1aWRlIHZlcnNpb24gMS4yIGJ1dCBub3Qg
eWV0IGluIHRoZSBwc0FCSS4KLSAqLwotI2RlZmluZSBSX01JUFNfR09USEkxNgkJMjIKLSNkZWZp
bmUgUl9NSVBTX0dPVExPMTYJCTIzCi0jZGVmaW5lIFJfTUlQU19TVUIJCTI0Ci0jZGVmaW5lIFJf
TUlQU19JTlNFUlRfQQkJMjUKLSNkZWZpbmUgUl9NSVBTX0lOU0VSVF9CCQkyNgotI2RlZmluZSBS
X01JUFNfREVMRVRFCQkyNwotI2RlZmluZSBSX01JUFNfSElHSEVSCQkyOAotI2RlZmluZSBSX01J
UFNfSElHSEVTVAkJMjkKLS8qCi0gKiBUaGUgZm9sbG93aW5nIHR3byByZWxvY2F0aW9uIHR5cGVz
IGFyZSBzcGVjaWZpZWQgaW4gdGhlIE1JUFMgQUJJCi0gKiBjb25mb3JtYW5jZSBndWlkZSB2ZXJz
aW9uIDEuMiBidXQgbm90IHlldCBpbiB0aGUgcHNBQkkuCi0gKi8KLSNkZWZpbmUgUl9NSVBTX0NB
TExISTE2CQkzMAotI2RlZmluZSBSX01JUFNfQ0FMTExPMTYJCTMxCi0vKgotICogSW50cm9kdWNl
ZCBmb3IgTUlQU3I2LgotICovCi0jZGVmaW5lIFJfTUlQU19QQzIxX1MyCQk2MAotI2RlZmluZSBS
X01JUFNfUEMyNl9TMgkJNjEKLS8qCi0gKiBUaGlzIHJhbmdlIGlzIHJlc2VydmVkIGZvciB2ZW5k
b3Igc3BlY2lmaWMgcmVsb2NhdGlvbnMuCi0gKi8KLSNkZWZpbmUgUl9NSVBTX0xPVkVORE9SCQkx
MDAKLSNkZWZpbmUgUl9NSVBTX0hJVkVORE9SCQkxMjcKLQogI2RlZmluZSBTSE5fTUlQU19BQ0NP
TU9OCTB4ZmYwMAkJLyogQWxsb2NhdGVkIGNvbW1vbiBzeW1ib2xzICovCiAjZGVmaW5lIFNITl9N
SVBTX1RFWFQJCTB4ZmYwMQkJLyogQWxsb2NhdGVkIHRlc3Qgc3ltYm9scy4gICovCiAjZGVmaW5l
IFNITl9NSVBTX0RBVEEJCTB4ZmYwMgkJLyogQWxsb2NhdGVkIGRhdGEgc3ltYm9scy4gICovCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYtci5oCmluZGV4IGMxMzA5YTYzYTdkYzQ0OTVmMjJlM2Q4YjUxZDNmOTdhYjU4MDkxOTAu
Ljc4MDg1ZDI2ZjRhYjI3YTAwM2ZkZTY1YzhlOTgxZjU3NWY0MTE3NTggMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5o
CkBAIC01NjMsNCArNTYzLDU4IEBACiAvKiBLZWVwIHRoaXMgdGhlIGxhc3QgZW50cnkuICAqLwog
I2RlZmluZSBSXzM5MF9OVU0JNjEKIAorLyogTUlQUyByZWxvY2F0aW9ucyBkZWZpbmVkIGJ5IHRo
ZSBBQklzICovCisjZGVmaW5lIFJfTUlQU19OT05FCQkwCisjZGVmaW5lIFJfTUlQU18xNgkJMQor
I2RlZmluZSBSX01JUFNfMzIJCTIKKyNkZWZpbmUgUl9NSVBTX1JFTDMyCQkzCisjZGVmaW5lIFJf
TUlQU18yNgkJNAorI2RlZmluZSBSX01JUFNfSEkxNgkJNQorI2RlZmluZSBSX01JUFNfTE8xNgkJ
NgorI2RlZmluZSBSX01JUFNfR1BSRUwxNgkJNworI2RlZmluZSBSX01JUFNfTElURVJBTAkJOAor
I2RlZmluZSBSX01JUFNfR09UMTYJCTkKKyNkZWZpbmUgUl9NSVBTX1BDMTYJCTEwCisjZGVmaW5l
IFJfTUlQU19DQUxMMTYJCTExCisjZGVmaW5lIFJfTUlQU19HUFJFTDMyCQkxMgorLyogVGhlIHJl
bWFpbmluZyByZWxvY3MgYXJlIGRlZmluZWQgb24gSXJpeCwgYWx0aG91Z2ggdGhleSBhcmUgbm90
CisgICBpbiB0aGUgTUlQUyBFTEYgQUJJLgkgKi8KKyNkZWZpbmUgUl9NSVBTX1VOVVNFRDEJCTEz
CisjZGVmaW5lIFJfTUlQU19VTlVTRUQyCQkxNAorI2RlZmluZSBSX01JUFNfVU5VU0VEMwkJMTUK
KyNkZWZpbmUgUl9NSVBTX1NISUZUNQkJMTYKKyNkZWZpbmUgUl9NSVBTX1NISUZUNgkJMTcKKyNk
ZWZpbmUgUl9NSVBTXzY0CQkxOAorI2RlZmluZSBSX01JUFNfR09UX0RJU1AJCTE5CisjZGVmaW5l
IFJfTUlQU19HT1RfUEFHRQkJMjAKKyNkZWZpbmUgUl9NSVBTX0dPVF9PRlNUCQkyMQorLyoKKyAq
IFRoZSBmb2xsb3dpbmcgdHdvIHJlbG9jYXRpb24gdHlwZXMgYXJlIHNwZWNpZmllZCBpbiB0aGUg
TUlQUyBBQkkKKyAqIGNvbmZvcm1hbmNlIGd1aWRlIHZlcnNpb24gMS4yIGJ1dCBub3QgeWV0IGlu
IHRoZSBwc0FCSS4KKyAqLworI2RlZmluZSBSX01JUFNfR09USEkxNgkJMjIKKyNkZWZpbmUgUl9N
SVBTX0dPVExPMTYJCTIzCisjZGVmaW5lIFJfTUlQU19TVUIJCTI0CisjZGVmaW5lIFJfTUlQU19J
TlNFUlRfQQkJMjUKKyNkZWZpbmUgUl9NSVBTX0lOU0VSVF9CCQkyNgorI2RlZmluZSBSX01JUFNf
REVMRVRFCQkyNworI2RlZmluZSBSX01JUFNfSElHSEVSCQkyOAorI2RlZmluZSBSX01JUFNfSElH
SEVTVAkJMjkKKy8qCisgKiBUaGUgZm9sbG93aW5nIHR3byByZWxvY2F0aW9uIHR5cGVzIGFyZSBz
cGVjaWZpZWQgaW4gdGhlIE1JUFMgQUJJCisgKiBjb25mb3JtYW5jZSBndWlkZSB2ZXJzaW9uIDEu
MiBidXQgbm90IHlldCBpbiB0aGUgcHNBQkkuCisgKi8KKyNkZWZpbmUgUl9NSVBTX0NBTExISTE2
CQkzMAorI2RlZmluZSBSX01JUFNfQ0FMTExPMTYJCTMxCisvKgorICogSW50cm9kdWNlZCBmb3Ig
TUlQU3I2LgorICovCisjZGVmaW5lIFJfTUlQU19QQzIxX1MyCQk2MAorI2RlZmluZSBSX01JUFNf
UEMyNl9TMgkJNjEKKy8qCisgKiBUaGlzIHJhbmdlIGlzIHJlc2VydmVkIGZvciB2ZW5kb3Igc3Bl
Y2lmaWMgcmVsb2NhdGlvbnMuCisgKi8KKyNkZWZpbmUgUl9NSVBTX0xPVkVORE9SCQkxMDAKKyNk
ZWZpbmUgUl9NSVBTX0hJVkVORE9SCQkxMjcKKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VMRl9S
X0ggKi8KCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
