Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18761C79FB0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbdYm3wA2Shck8jF16qsip0P2hc9cRqZ0TPNXay2XC4=; b=lLEQ0mpkwFHcBp
	7CQPpkzJ4wMN4H4xHBI+r37NizImRD/t4jfiCr+/2C2iITO367a5Wjt+Zf7y86f4b8BoaepgI7Ham
	VTM5/Xw38KZv91IcwUd1cOKiLQr+XmFvK04EnoUo29Ha5ZD7WrGO8n55W95w6KUT2acWld9wPt7ye
	2Gbegp6b/zQhm3+ynIsY8XFkUV7MeZnF8Zdr4zNEgZOPUVdmAGRobgKvdojSmuMvpCIjoIXRQ0Kb7
	E48FJTtTUrDDcS++ya393vhNzj1bMK3PHHxaM3WVXfpFihrawL4ly8/qknxNsc0fO0fE1s9gttn+D
	8810uMuVp55XClaIZGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP8-0000000893T-05Z0;
	Tue, 08 Sep 2026 06:34:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOz-000000088tD-1G8x;
	Tue, 08 Sep 2026 06:33:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTryvsBgAeqTDNlupTdhz6+byj4x0uN8hxYjIi8mWPU=;
	b=CwOxcB8AhS+rAzoxJxOQZHdTCbx79N6KAe69evSjNQbl8+rQOeBnH057j6GmLbV1DALhq8
	17U86cF62BuTdyueeDeto2D3eKopssoZOXhfcShRfEm5vXV6EqTT598jVyGbc2eORkyLVh
	OrwoiGkQRnDZ5E3ZEV6tw1/gABJPNjg4OfwRNlUx3ukssHhmiUBD9qEjMNgBfiYtN8PegH
	fJT8dIULNkNCSoAbP1VkL7AglDnc0gE8QsTSkJtq+4VoaJqGXcwtWw3SUrOnTednE0pAqq
	eJlyWNdWyLf6mcTMJcSduvMoo3qm72MxPilwuvS8hVqXRSHO5+8hOKLulZ6+Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTryvsBgAeqTDNlupTdhz6+byj4x0uN8hxYjIi8mWPU=;
	b=UvUYKzc74oAN8gP1sKHkjA19TUNUTqCMuc0TKrdtCmkCKri8UrtRvdSUSmYYYqwSID6op/
	x/iNcRKTPUHvcBDw==
Date: Tue, 08 Sep 2026 08:33:38 +0200
Subject: [PATCH v5 04/24] arm64: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-4-3a93791af1cf@linutronix.de>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, 
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=4332;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1i3Et1Jffcz0JOiDRayZilcvn94+w8pBUDpHzT1KG5A=;
 b=gk9oLI1obuvHKDYtmwIh7hRv/wNktDBEtLCnmMT6kMIL5ciJHyu+C7IEaeVwMOyG2DE4YvlNZ
 Q87Mb3y4KJ2C8RfQ2jmI4dzP+9h+ated8T54tLF6WOAYZo1VDmVkg+O
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233353_480087_EE6507B5 
X-CRM114-Status: GOOD (  11.14  )
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
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9lbGYuaCB8IDU0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCAgIHwgNTIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2Vy
dGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vZWxmLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4IGNmZGY0YzVh
YzA4Yi4uNDNmMzc2MzgwN2EyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Vs
Zi5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmgKQEAgLTEzLDYwICsxMyw2IEBA
CiAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgogI2luY2x1ZGUgPGFzbS91c2VyLmg+CiAKLS8qCi0g
KiBBQXJjaDY0IHN0YXRpYyByZWxvY2F0aW9uIHR5cGVzLgotICovCi0KLS8qIE1pc2NlbGxhbmVv
dXMuICovCi0jZGVmaW5lIFJfQUFSQ0g2NF9OT05FCQkJMjU2Ci0KLS8qIERhdGEuICovCi0jZGVm
aW5lIFJfQUFSQ0g2NF9BQlM2NAkJCTI1NwotI2RlZmluZSBSX0FBUkNINjRfQUJTMzIJCQkyNTgK
LSNkZWZpbmUgUl9BQVJDSDY0X0FCUzE2CQkJMjU5Ci0jZGVmaW5lIFJfQUFSQ0g2NF9QUkVMNjQJ
CTI2MAotI2RlZmluZSBSX0FBUkNINjRfUFJFTDMyCQkyNjEKLSNkZWZpbmUgUl9BQVJDSDY0X1BS
RUwxNgkJMjYyCi0KLS8qIEluc3RydWN0aW9ucy4gKi8KLSNkZWZpbmUgUl9BQVJDSDY0X01PVldf
VUFCU19HMAkJMjYzCi0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzBfTkMJMjY0Ci0jZGVm
aW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzEJCTI2NQotI2RlZmluZSBSX0FBUkNINjRfTU9WV19V
QUJTX0cxX05DCTI2NgotI2RlZmluZSBSX0FBUkNINjRfTU9WV19VQUJTX0cyCQkyNjcKLSNkZWZp
bmUgUl9BQVJDSDY0X01PVldfVUFCU19HMl9OQwkyNjgKLSNkZWZpbmUgUl9BQVJDSDY0X01PVldf
VUFCU19HMwkJMjY5Ci0KLSNkZWZpbmUgUl9BQVJDSDY0X01PVldfU0FCU19HMAkJMjcwCi0jZGVm
aW5lIFJfQUFSQ0g2NF9NT1ZXX1NBQlNfRzEJCTI3MQotI2RlZmluZSBSX0FBUkNINjRfTU9WV19T
QUJTX0cyCQkyNzIKLQotI2RlZmluZSBSX0FBUkNINjRfTERfUFJFTF9MTzE5CQkyNzMKLSNkZWZp
bmUgUl9BQVJDSDY0X0FEUl9QUkVMX0xPMjEJCTI3NAotI2RlZmluZSBSX0FBUkNINjRfQURSX1BS
RUxfUEdfSEkyMQkyNzUKLSNkZWZpbmUgUl9BQVJDSDY0X0FEUl9QUkVMX1BHX0hJMjFfTkMJMjc2
Ci0jZGVmaW5lIFJfQUFSQ0g2NF9BRERfQUJTX0xPMTJfTkMJMjc3Ci0jZGVmaW5lIFJfQUFSQ0g2
NF9MRFNUOF9BQlNfTE8xMl9OQwkyNzgKLQotI2RlZmluZSBSX0FBUkNINjRfVFNUQlIxNAkJMjc5
Ci0jZGVmaW5lIFJfQUFSQ0g2NF9DT05EQlIxOQkJMjgwCi0jZGVmaW5lIFJfQUFSQ0g2NF9KVU1Q
MjYJCTI4MgotI2RlZmluZSBSX0FBUkNINjRfQ0FMTDI2CQkyODMKLSNkZWZpbmUgUl9BQVJDSDY0
X0xEU1QxNl9BQlNfTE8xMl9OQwkyODQKLSNkZWZpbmUgUl9BQVJDSDY0X0xEU1QzMl9BQlNfTE8x
Ml9OQwkyODUKLSNkZWZpbmUgUl9BQVJDSDY0X0xEU1Q2NF9BQlNfTE8xMl9OQwkyODYKLSNkZWZp
bmUgUl9BQVJDSDY0X0xEU1QxMjhfQUJTX0xPMTJfTkMJMjk5Ci0KLSNkZWZpbmUgUl9BQVJDSDY0
X01PVldfUFJFTF9HMAkJMjg3Ci0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzBfTkMJMjg4
Ci0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzEJCTI4OQotI2RlZmluZSBSX0FBUkNINjRf
TU9WV19QUkVMX0cxX05DCTI5MAotI2RlZmluZSBSX0FBUkNINjRfTU9WV19QUkVMX0cyCQkyOTEK
LSNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMl9OQwkyOTIKLSNkZWZpbmUgUl9BQVJDSDY0
X01PVldfUFJFTF9HMwkJMjkzCi0KLSNkZWZpbmUgUl9BQVJDSDY0X1JFTEFUSVZFCQkxMDI3Ci0K
IC8qCiAgKiBUaGVzZSBhcmUgdXNlZCB0byBzZXQgcGFyYW1ldGVycyBpbiB0aGUgY29yZSBkdW1w
cy4KICAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvZWxmLXIuaAppbmRleCAwMDE4ODQ2NDFlNzcuLmNmOTMxZmMwNWFmYSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKKysrIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi1yLmgKQEAgLTYxLDQgKzYxLDU2IEBACiAjZGVmaW5lIFJfQVJNX1RITV9NT1ZXX1BS
RUxfTkMJNDkKICNkZWZpbmUgUl9BUk1fVEhNX01PVlRfUFJFTAk1MAogCisvKiBBQXJjaDY0IHN0
YXRpYyByZWxvY2F0aW9uIHR5cGVzICovCisKKy8qIE1pc2NlbGxhbmVvdXMuICovCisjZGVmaW5l
IFJfQUFSQ0g2NF9OT05FCQkJMjU2CisKKy8qIERhdGEuICovCisjZGVmaW5lIFJfQUFSQ0g2NF9B
QlM2NAkJCTI1NworI2RlZmluZSBSX0FBUkNINjRfQUJTMzIJCQkyNTgKKyNkZWZpbmUgUl9BQVJD
SDY0X0FCUzE2CQkJMjU5CisjZGVmaW5lIFJfQUFSQ0g2NF9QUkVMNjQJCTI2MAorI2RlZmluZSBS
X0FBUkNINjRfUFJFTDMyCQkyNjEKKyNkZWZpbmUgUl9BQVJDSDY0X1BSRUwxNgkJMjYyCisKKy8q
IEluc3RydWN0aW9ucy4gKi8KKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfVUFCU19HMAkJMjYzCisj
ZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzBfTkMJMjY0CisjZGVmaW5lIFJfQUFSQ0g2NF9N
T1ZXX1VBQlNfRzEJCTI2NQorI2RlZmluZSBSX0FBUkNINjRfTU9WV19VQUJTX0cxX05DCTI2Ngor
I2RlZmluZSBSX0FBUkNINjRfTU9WV19VQUJTX0cyCQkyNjcKKyNkZWZpbmUgUl9BQVJDSDY0X01P
VldfVUFCU19HMl9OQwkyNjgKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfVUFCU19HMwkJMjY5CisK
KyNkZWZpbmUgUl9BQVJDSDY0X01PVldfU0FCU19HMAkJMjcwCisjZGVmaW5lIFJfQUFSQ0g2NF9N
T1ZXX1NBQlNfRzEJCTI3MQorI2RlZmluZSBSX0FBUkNINjRfTU9WV19TQUJTX0cyCQkyNzIKKwor
I2RlZmluZSBSX0FBUkNINjRfTERfUFJFTF9MTzE5CQkyNzMKKyNkZWZpbmUgUl9BQVJDSDY0X0FE
Ul9QUkVMX0xPMjEJCTI3NAorI2RlZmluZSBSX0FBUkNINjRfQURSX1BSRUxfUEdfSEkyMQkyNzUK
KyNkZWZpbmUgUl9BQVJDSDY0X0FEUl9QUkVMX1BHX0hJMjFfTkMJMjc2CisjZGVmaW5lIFJfQUFS
Q0g2NF9BRERfQUJTX0xPMTJfTkMJMjc3CisjZGVmaW5lIFJfQUFSQ0g2NF9MRFNUOF9BQlNfTE8x
Ml9OQwkyNzgKKworI2RlZmluZSBSX0FBUkNINjRfVFNUQlIxNAkJMjc5CisjZGVmaW5lIFJfQUFS
Q0g2NF9DT05EQlIxOQkJMjgwCisjZGVmaW5lIFJfQUFSQ0g2NF9KVU1QMjYJCTI4MgorI2RlZmlu
ZSBSX0FBUkNINjRfQ0FMTDI2CQkyODMKKyNkZWZpbmUgUl9BQVJDSDY0X0xEU1QxNl9BQlNfTE8x
Ml9OQwkyODQKKyNkZWZpbmUgUl9BQVJDSDY0X0xEU1QzMl9BQlNfTE8xMl9OQwkyODUKKyNkZWZp
bmUgUl9BQVJDSDY0X0xEU1Q2NF9BQlNfTE8xMl9OQwkyODYKKyNkZWZpbmUgUl9BQVJDSDY0X0xE
U1QxMjhfQUJTX0xPMTJfTkMJMjk5CisKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMAkJ
Mjg3CisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzBfTkMJMjg4CisjZGVmaW5lIFJfQUFS
Q0g2NF9NT1ZXX1BSRUxfRzEJCTI4OQorI2RlZmluZSBSX0FBUkNINjRfTU9WV19QUkVMX0cxX05D
CTI5MAorI2RlZmluZSBSX0FBUkNINjRfTU9WV19QUkVMX0cyCQkyOTEKKyNkZWZpbmUgUl9BQVJD
SDY0X01PVldfUFJFTF9HMl9OQwkyOTIKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMwkJ
MjkzCisKKyNkZWZpbmUgUl9BQVJDSDY0X1JFTEFUSVZFCQkxMDI3CisKICNlbmRpZiAvKiBfVUFQ
SV9MSU5VWF9FTEZfUl9IICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
