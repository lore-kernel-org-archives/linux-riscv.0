Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168D2CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hle/s0kXqjBA4jl8npJ+/bNQMYCpWNwG4GpiyDcvgQE=; b=TVWtJb2UpDl50Z
	4+zke8V4+COk1uWgjSUwar/wJWjRT9v8LI7j4i8YFqxyUze1BDyAjY0i+9yU4OOAcGRyOyo8CYZep
	uf58j54JkQPM7a0rIqptuPycOy9FFa024OSVO8axit97VxWF1Ka0MK5237Qm098i6f5N7T2cWxiEf
	+zL2s2Q4nDr+HiFKbq7KwKDQ3MyGwmLKOv5fthSUlrsRJMM6KWcJQb0d1nFygRBKNEmgd09xnUCIN
	Jfmq+fwuu/bYCqsyf7yja8dspDuZX0Fkf7mVzdUCiAbLP1WclsU/Gp2dS11RIias2iDqLm5X/KxmL
	WkP8tVvvNMhDkGF+mToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulild-0000000A3Fb-1cVs;
	Tue, 12 Aug 2025 06:45:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoI-00000009uj6-2iTV;
	Tue, 12 Aug 2025 05:44:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkZKFkMLET6nFcPB2WNffaOSCveGBK/DoVsJr+6leSI=;
	b=LKiTWvfbe4sMF2JqJpsl5CRdkfSHca9QAI6VsemqVTqROhwCEorsYpYPKmr+pCeUzczBPL
	lHiLvd6vhjMW+nDOKYD8HJiFnADn8FYNXoy3PLssT7rxID6/ofIv5S6BU93tu/BjTQ3zFZ
	f+21QfpLHJ+20Cv6mZbG6zxNBKvj7HT/hFCAA3DjqZwewTsOPEzPa95cGSRO7jioU6muIg
	r+AfsplYFpXa1HtHFAkSc/u3FYPvQslQo5BqvTx3yjG40NQJEXQgELqm3Y/R91vyPu6YFj
	lnGELQzhXrNx6pRaRRbu8P9vTDjg6NfngtEE3BLPdXDCaAsI48w14NVifsW7gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkZKFkMLET6nFcPB2WNffaOSCveGBK/DoVsJr+6leSI=;
	b=4TwJQtL0DH1Y8FEY0nXw5JLyqTIDve3EQ5RM8bs+Izei6SC/5r+S+kSlkbwlcwESU+Bzxx
	vL69R3DfS2dxTZAg==
Date: Tue, 12 Aug 2025 07:44:17 +0200
Subject: [PATCH v4 04/24] arm64: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-4-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=4444;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HzT2SYHSNRm4ZtRujeJaJIJT/indjE0TyRY6RtPSNtQ=;
 b=S9P2n5/cBPWTmkH8+DZZ91/PGYQizVg5PAYegpw8TUQhE90iFtIunP8BCI0PJECMORxxw1wn5
 kPEmqcrLaUdCEdmy5grg/+JQY5xzBpIU7jPXrEa9kA+HChds1EvqNqF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224434_978984_B1A53C03 
X-CRM114-Status: GOOD (  11.60  )
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
ZS9hc20vZWxmLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4IDhlZmNmZTdl
ZmUwYzcwYzU5YjliODFmOTNhYzljMTQ0MmJjNzY1NmEuLmExNGI4OGZiNDg1ZTYwZjg5MzMyZjBj
NmI1OGVkOTI5ZWI2NjAwYjYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxm
LmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9lbGYuaApAQCAtMTMsNjAgKzEzLDYgQEAK
ICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+CiAjaW5jbHVkZSA8YXNtL3VzZXIuaD4KIAotLyoKLSAq
IEFBcmNoNjQgc3RhdGljIHJlbG9jYXRpb24gdHlwZXMuCi0gKi8KLQotLyogTWlzY2VsbGFuZW91
cy4gKi8KLSNkZWZpbmUgUl9BQVJDSDY0X05PTkUJCQkyNTYKLQotLyogRGF0YS4gKi8KLSNkZWZp
bmUgUl9BQVJDSDY0X0FCUzY0CQkJMjU3Ci0jZGVmaW5lIFJfQUFSQ0g2NF9BQlMzMgkJCTI1OAot
I2RlZmluZSBSX0FBUkNINjRfQUJTMTYJCQkyNTkKLSNkZWZpbmUgUl9BQVJDSDY0X1BSRUw2NAkJ
MjYwCi0jZGVmaW5lIFJfQUFSQ0g2NF9QUkVMMzIJCTI2MQotI2RlZmluZSBSX0FBUkNINjRfUFJF
TDE2CQkyNjIKLQotLyogSW5zdHJ1Y3Rpb25zLiAqLwotI2RlZmluZSBSX0FBUkNINjRfTU9WV19V
QUJTX0cwCQkyNjMKLSNkZWZpbmUgUl9BQVJDSDY0X01PVldfVUFCU19HMF9OQwkyNjQKLSNkZWZp
bmUgUl9BQVJDSDY0X01PVldfVUFCU19HMQkJMjY1Ci0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VB
QlNfRzFfTkMJMjY2Ci0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzIJCTI2NwotI2RlZmlu
ZSBSX0FBUkNINjRfTU9WV19VQUJTX0cyX05DCTI2OAotI2RlZmluZSBSX0FBUkNINjRfTU9WV19V
QUJTX0czCQkyNjkKLQotI2RlZmluZSBSX0FBUkNINjRfTU9WV19TQUJTX0cwCQkyNzAKLSNkZWZp
bmUgUl9BQVJDSDY0X01PVldfU0FCU19HMQkJMjcxCi0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1NB
QlNfRzIJCTI3MgotCi0jZGVmaW5lIFJfQUFSQ0g2NF9MRF9QUkVMX0xPMTkJCTI3MwotI2RlZmlu
ZSBSX0FBUkNINjRfQURSX1BSRUxfTE8yMQkJMjc0Ci0jZGVmaW5lIFJfQUFSQ0g2NF9BRFJfUFJF
TF9QR19ISTIxCTI3NQotI2RlZmluZSBSX0FBUkNINjRfQURSX1BSRUxfUEdfSEkyMV9OQwkyNzYK
LSNkZWZpbmUgUl9BQVJDSDY0X0FERF9BQlNfTE8xMl9OQwkyNzcKLSNkZWZpbmUgUl9BQVJDSDY0
X0xEU1Q4X0FCU19MTzEyX05DCTI3OAotCi0jZGVmaW5lIFJfQUFSQ0g2NF9UU1RCUjE0CQkyNzkK
LSNkZWZpbmUgUl9BQVJDSDY0X0NPTkRCUjE5CQkyODAKLSNkZWZpbmUgUl9BQVJDSDY0X0pVTVAy
NgkJMjgyCi0jZGVmaW5lIFJfQUFSQ0g2NF9DQUxMMjYJCTI4MwotI2RlZmluZSBSX0FBUkNINjRf
TERTVDE2X0FCU19MTzEyX05DCTI4NAotI2RlZmluZSBSX0FBUkNINjRfTERTVDMyX0FCU19MTzEy
X05DCTI4NQotI2RlZmluZSBSX0FBUkNINjRfTERTVDY0X0FCU19MTzEyX05DCTI4NgotI2RlZmlu
ZSBSX0FBUkNINjRfTERTVDEyOF9BQlNfTE8xMl9OQwkyOTkKLQotI2RlZmluZSBSX0FBUkNINjRf
TU9WV19QUkVMX0cwCQkyODcKLSNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMF9OQwkyODgK
LSNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMQkJMjg5Ci0jZGVmaW5lIFJfQUFSQ0g2NF9N
T1ZXX1BSRUxfRzFfTkMJMjkwCi0jZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzIJCTI5MQot
I2RlZmluZSBSX0FBUkNINjRfTU9WV19QUkVMX0cyX05DCTI5MgotI2RlZmluZSBSX0FBUkNINjRf
TU9WV19QUkVMX0czCQkyOTMKLQotI2RlZmluZSBSX0FBUkNINjRfUkVMQVRJVkUJCTEwMjcKLQog
LyoKICAqIFRoZXNlIGFyZSB1c2VkIHRvIHNldCBwYXJhbWV0ZXJzIGluIHRoZSBjb3JlIGR1bXBz
LgogICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUv
dWFwaS9saW51eC9lbGYtci5oCmluZGV4IDAwMTg4NDY0MWU3NzAzMTQ2ZjkxZTJkZDk2ZmI1YTJi
YmZjN2EzMjQuLmNmOTMxZmMwNWFmYTE4MjVhYTk3MzdhNGU2MjU5ZWMwZGE2NzhkM2EgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYtci5oCkBAIC02MSw0ICs2MSw1NiBAQAogI2RlZmluZSBSX0FSTV9USE1fTU9WV19QUkVM
X05DCTQ5CiAjZGVmaW5lIFJfQVJNX1RITV9NT1ZUX1BSRUwJNTAKIAorLyogQUFyY2g2NCBzdGF0
aWMgcmVsb2NhdGlvbiB0eXBlcyAqLworCisvKiBNaXNjZWxsYW5lb3VzLiAqLworI2RlZmluZSBS
X0FBUkNINjRfTk9ORQkJCTI1NgorCisvKiBEYXRhLiAqLworI2RlZmluZSBSX0FBUkNINjRfQUJT
NjQJCQkyNTcKKyNkZWZpbmUgUl9BQVJDSDY0X0FCUzMyCQkJMjU4CisjZGVmaW5lIFJfQUFSQ0g2
NF9BQlMxNgkJCTI1OQorI2RlZmluZSBSX0FBUkNINjRfUFJFTDY0CQkyNjAKKyNkZWZpbmUgUl9B
QVJDSDY0X1BSRUwzMgkJMjYxCisjZGVmaW5lIFJfQUFSQ0g2NF9QUkVMMTYJCTI2MgorCisvKiBJ
bnN0cnVjdGlvbnMuICovCisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzAJCTI2MworI2Rl
ZmluZSBSX0FBUkNINjRfTU9WV19VQUJTX0cwX05DCTI2NAorI2RlZmluZSBSX0FBUkNINjRfTU9W
V19VQUJTX0cxCQkyNjUKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfVUFCU19HMV9OQwkyNjYKKyNk
ZWZpbmUgUl9BQVJDSDY0X01PVldfVUFCU19HMgkJMjY3CisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZX
X1VBQlNfRzJfTkMJMjY4CisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1VBQlNfRzMJCTI2OQorCisj
ZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1NBQlNfRzAJCTI3MAorI2RlZmluZSBSX0FBUkNINjRfTU9W
V19TQUJTX0cxCQkyNzEKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfU0FCU19HMgkJMjcyCisKKyNk
ZWZpbmUgUl9BQVJDSDY0X0xEX1BSRUxfTE8xOQkJMjczCisjZGVmaW5lIFJfQUFSQ0g2NF9BRFJf
UFJFTF9MTzIxCQkyNzQKKyNkZWZpbmUgUl9BQVJDSDY0X0FEUl9QUkVMX1BHX0hJMjEJMjc1Cisj
ZGVmaW5lIFJfQUFSQ0g2NF9BRFJfUFJFTF9QR19ISTIxX05DCTI3NgorI2RlZmluZSBSX0FBUkNI
NjRfQUREX0FCU19MTzEyX05DCTI3NworI2RlZmluZSBSX0FBUkNINjRfTERTVDhfQUJTX0xPMTJf
TkMJMjc4CisKKyNkZWZpbmUgUl9BQVJDSDY0X1RTVEJSMTQJCTI3OQorI2RlZmluZSBSX0FBUkNI
NjRfQ09OREJSMTkJCTI4MAorI2RlZmluZSBSX0FBUkNINjRfSlVNUDI2CQkyODIKKyNkZWZpbmUg
Ul9BQVJDSDY0X0NBTEwyNgkJMjgzCisjZGVmaW5lIFJfQUFSQ0g2NF9MRFNUMTZfQUJTX0xPMTJf
TkMJMjg0CisjZGVmaW5lIFJfQUFSQ0g2NF9MRFNUMzJfQUJTX0xPMTJfTkMJMjg1CisjZGVmaW5l
IFJfQUFSQ0g2NF9MRFNUNjRfQUJTX0xPMTJfTkMJMjg2CisjZGVmaW5lIFJfQUFSQ0g2NF9MRFNU
MTI4X0FCU19MTzEyX05DCTI5OQorCisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzAJCTI4
NworI2RlZmluZSBSX0FBUkNINjRfTU9WV19QUkVMX0cwX05DCTI4OAorI2RlZmluZSBSX0FBUkNI
NjRfTU9WV19QUkVMX0cxCQkyODkKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMV9OQwky
OTAKKyNkZWZpbmUgUl9BQVJDSDY0X01PVldfUFJFTF9HMgkJMjkxCisjZGVmaW5lIFJfQUFSQ0g2
NF9NT1ZXX1BSRUxfRzJfTkMJMjkyCisjZGVmaW5lIFJfQUFSQ0g2NF9NT1ZXX1BSRUxfRzMJCTI5
MworCisjZGVmaW5lIFJfQUFSQ0g2NF9SRUxBVElWRQkJMTAyNworCiAjZW5kaWYgLyogX1VBUElf
TElOVVhfRUxGX1JfSCAqLwoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
