Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F117BCA0EDB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNK1VNfaCo/wsEqj5/aH7332vRiu30t41TvWroJEWJ0=; b=WkYTEMIa471iOV
	KSIHAgKxuzghfEKei5SaAT55xvWPuq6kk45dO97WVRuMmScJnda6zZrP18LtFy+fxao5r8mWqejxP
	S0ZH5x4gYUVqIQ/tqiZfaWoNissjLMsvyXWSQqy0svgHo9BspLkdUOHPgMLA1tame4f7N3cEfJxnz
	gunl9X3OiLeL3pNvwrweXlDBxKV2vbf0GGlgla8Z+RRlyL75yp6NBW+7By6l9dyI9PsjKu32NNSJA
	UPjWe53OcSVNWjMxrlxSambiwKJB07HlDH6W9scrDYldlefg2mWR2Pe8q0udfnfqIaiEr9Y1NX/qJ
	dyGvj1b/J6dXX5nMO9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhof-00000009vC7-2DB6;
	Tue, 12 Aug 2025 05:44:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoK-00000009ukX-1ZDm;
	Tue, 12 Aug 2025 05:44:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLFF7RcTXEh7J++8oRFtDMgib541QPR3j3iTPRakVR4=;
	b=xmdZdIHsWwP/TxhfVFisseNTc/0hbdZicN0qfGKNGeNlzKewzVkXv5sdA4lM27FEH7QMYE
	4QKhLUaNxvKkExW0VFtSrE4t0q9FrVpd4/cBeivIZBP5fi3pj0Q2Y7QMvLbWQkr6+n1wo9
	jFox27nxR//Pwo5WgItwK6Jj3DT4yo/xZpgFYRbQd4kP0McfvtHYIMbAHq/4T8kPOxsiTN
	MYSLVKmQvoc0cVXaSB+H07FPBTnFfNQJ4YoXXoiC+NBV0aOeKZ5CttUwtasDbWQyh/Mby2
	CBKsQ8v4MYuZI2Y6GLTDGq3dYFUTYHoJSpVxJD8nQwTQhoAHmOkryjb4sNqxLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLFF7RcTXEh7J++8oRFtDMgib541QPR3j3iTPRakVR4=;
	b=p9LomzChEORTxM1tlQ8Uf6LNOyTc69rJSBAcj7cgFyKnXKqJPsVlZUyH8jeP2NLLcC3ZbB
	bztzjjgIw+CLksCA==
Date: Tue, 12 Aug 2025 07:44:19 +0200
Subject: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=5027;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JvVhNnXqLZi9Urcv3cUqECDYuPaTssZzAN5WZwS9T8c=;
 b=cptfkIfZYzK20UK+A4ARj+d2phq5mEEoCRFgWfpV+I4Wc+7KlP2R8hpKDZkDsX1BB87WWP8wh
 BGrov+RrHd1CwtMXd0tfU3+rXk87A3z6hSUldor6cipygzbxcVGxdE+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224436_657876_C728F5F0 
X-CRM114-Status: GOOD (  10.94  )
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
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2VsZi5oIHwgNjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCAgICAgICAgfCA2NiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5z
ZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2VsZi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2VsZi5oCmlu
ZGV4IDExYTcxYjg1MzNkNTc1OWVjNzI0YTgzNTlkMGZmYTJhNGYyZTk3NmQuLjA1Y2Y3NGE0YTUz
NTc5MDA2YTljZWYxZWQxZGJmZjgxZDBlNTBjODcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9lbGYuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vZWxm
LmgKQEAgLTMyLDcwICszMiw0IEBAIHR5cGVkZWYgdW5pb24gX19yaXNjdl9mcF9zdGF0ZSBlbGZf
ZnByZWdzZXRfdDsKICNkZWZpbmUgRUxGX1JJU0NWX1JfVFlQRShyX2luZm8pCUVMRjMyX1JfVFlQ
RShyX2luZm8pCiAjZW5kaWYKIAotLyoKLSAqIFJJU0MtViByZWxvY2F0aW9uIHR5cGVzCi0gKi8K
LQotLyogUmVsb2NhdGlvbiB0eXBlcyB1c2VkIGJ5IHRoZSBkeW5hbWljIGxpbmtlciAqLwotI2Rl
ZmluZSBSX1JJU0NWX05PTkUJCTAKLSNkZWZpbmUgUl9SSVNDVl8zMgkJMQotI2RlZmluZSBSX1JJ
U0NWXzY0CQkyCi0jZGVmaW5lIFJfUklTQ1ZfUkVMQVRJVkUJMwotI2RlZmluZSBSX1JJU0NWX0NP
UFkJCTQKLSNkZWZpbmUgUl9SSVNDVl9KVU1QX1NMT1QJNQotI2RlZmluZSBSX1JJU0NWX1RMU19E
VFBNT0QzMgk2Ci0jZGVmaW5lIFJfUklTQ1ZfVExTX0RUUE1PRDY0CTcKLSNkZWZpbmUgUl9SSVND
Vl9UTFNfRFRQUkVMMzIJOAotI2RlZmluZSBSX1JJU0NWX1RMU19EVFBSRUw2NAk5Ci0jZGVmaW5l
IFJfUklTQ1ZfVExTX1RQUkVMMzIJMTAKLSNkZWZpbmUgUl9SSVNDVl9UTFNfVFBSRUw2NAkxMQot
I2RlZmluZSBSX1JJU0NWX0lSRUxBVElWRQk1OAotCi0vKiBSZWxvY2F0aW9uIHR5cGVzIG5vdCB1
c2VkIGJ5IHRoZSBkeW5hbWljIGxpbmtlciAqLwotI2RlZmluZSBSX1JJU0NWX0JSQU5DSAkJMTYK
LSNkZWZpbmUgUl9SSVNDVl9KQUwJCTE3Ci0jZGVmaW5lIFJfUklTQ1ZfQ0FMTAkJMTgKLSNkZWZp
bmUgUl9SSVNDVl9DQUxMX1BMVAkxOQotI2RlZmluZSBSX1JJU0NWX0dPVF9ISTIwCTIwCi0jZGVm
aW5lIFJfUklTQ1ZfVExTX0dPVF9ISTIwCTIxCi0jZGVmaW5lIFJfUklTQ1ZfVExTX0dEX0hJMjAJ
MjIKLSNkZWZpbmUgUl9SSVNDVl9QQ1JFTF9ISTIwCTIzCi0jZGVmaW5lIFJfUklTQ1ZfUENSRUxf
TE8xMl9JCTI0Ci0jZGVmaW5lIFJfUklTQ1ZfUENSRUxfTE8xMl9TCTI1Ci0jZGVmaW5lIFJfUklT
Q1ZfSEkyMAkJMjYKLSNkZWZpbmUgUl9SSVNDVl9MTzEyX0kJCTI3Ci0jZGVmaW5lIFJfUklTQ1Zf
TE8xMl9TCQkyOAotI2RlZmluZSBSX1JJU0NWX1RQUkVMX0hJMjAJMjkKLSNkZWZpbmUgUl9SSVND
Vl9UUFJFTF9MTzEyX0kJMzAKLSNkZWZpbmUgUl9SSVNDVl9UUFJFTF9MTzEyX1MJMzEKLSNkZWZp
bmUgUl9SSVNDVl9UUFJFTF9BREQJMzIKLSNkZWZpbmUgUl9SSVNDVl9BREQ4CQkzMwotI2RlZmlu
ZSBSX1JJU0NWX0FERDE2CQkzNAotI2RlZmluZSBSX1JJU0NWX0FERDMyCQkzNQotI2RlZmluZSBS
X1JJU0NWX0FERDY0CQkzNgotI2RlZmluZSBSX1JJU0NWX1NVQjgJCTM3Ci0jZGVmaW5lIFJfUklT
Q1ZfU1VCMTYJCTM4Ci0jZGVmaW5lIFJfUklTQ1ZfU1VCMzIJCTM5Ci0jZGVmaW5lIFJfUklTQ1Zf
U1VCNjQJCTQwCi0jZGVmaW5lIFJfUklTQ1ZfR05VX1ZUSU5IRVJJVAk0MQotI2RlZmluZSBSX1JJ
U0NWX0dOVV9WVEVOVFJZCTQyCi0jZGVmaW5lIFJfUklTQ1ZfQUxJR04JCTQzCi0jZGVmaW5lIFJf
UklTQ1ZfUlZDX0JSQU5DSAk0NAotI2RlZmluZSBSX1JJU0NWX1JWQ19KVU1QCTQ1Ci0jZGVmaW5l
IFJfUklTQ1ZfR1BSRUxfSQkJNDcKLSNkZWZpbmUgUl9SSVNDVl9HUFJFTF9TCQk0OAotI2RlZmlu
ZSBSX1JJU0NWX1RQUkVMX0kJCTQ5Ci0jZGVmaW5lIFJfUklTQ1ZfVFBSRUxfUwkJNTAKLSNkZWZp
bmUgUl9SSVNDVl9SRUxBWAkJNTEKLSNkZWZpbmUgUl9SSVNDVl9TVUI2CQk1MgotI2RlZmluZSBS
X1JJU0NWX1NFVDYJCTUzCi0jZGVmaW5lIFJfUklTQ1ZfU0VUOAkJNTQKLSNkZWZpbmUgUl9SSVND
Vl9TRVQxNgkJNTUKLSNkZWZpbmUgUl9SSVNDVl9TRVQzMgkJNTYKLSNkZWZpbmUgUl9SSVNDVl8z
Ml9QQ1JFTAk1NwotI2RlZmluZSBSX1JJU0NWX1BMVDMyCQk1OQotI2RlZmluZSBSX1JJU0NWX1NF
VF9VTEVCMTI4CTYwCi0jZGVmaW5lIFJfUklTQ1ZfU1VCX1VMRUIxMjgJNjEKLQotCiAjZW5kaWYg
LyogX1VBUElfQVNNX1JJU0NWX0VMRl9IICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGlu
dXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCmluZGV4IDBkMGRmYWE3Yzcy
NGQ1ZjAyMzBlNWI3YjliNzEzZDg1ODcwMzA2MzcuLjAyZTQyMGMyNTVkZjY3ZjhmN2U0YmMzMTY1
ZjgwOGI5OTM1ZjViMWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCisr
KyBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCkBAIC0zMTQsNCArMzE0LDcwIEBACiAvKiBL
ZWVwIHRoaXMgdGhlIGxhc3QgZW50cnkuICAqLwogI2RlZmluZSBSX1BQQzY0X05VTQkJMjUzCiAK
KworLyoKKyAqIFJJU0MtViByZWxvY2F0aW9uIHR5cGVzCisgKi8KKworLyogUmVsb2NhdGlvbiB0
eXBlcyB1c2VkIGJ5IHRoZSBkeW5hbWljIGxpbmtlciAqLworI2RlZmluZSBSX1JJU0NWX05PTkUJ
CTAKKyNkZWZpbmUgUl9SSVNDVl8zMgkJMQorI2RlZmluZSBSX1JJU0NWXzY0CQkyCisjZGVmaW5l
IFJfUklTQ1ZfUkVMQVRJVkUJMworI2RlZmluZSBSX1JJU0NWX0NPUFkJCTQKKyNkZWZpbmUgUl9S
SVNDVl9KVU1QX1NMT1QJNQorI2RlZmluZSBSX1JJU0NWX1RMU19EVFBNT0QzMgk2CisjZGVmaW5l
IFJfUklTQ1ZfVExTX0RUUE1PRDY0CTcKKyNkZWZpbmUgUl9SSVNDVl9UTFNfRFRQUkVMMzIJOAor
I2RlZmluZSBSX1JJU0NWX1RMU19EVFBSRUw2NAk5CisjZGVmaW5lIFJfUklTQ1ZfVExTX1RQUkVM
MzIJMTAKKyNkZWZpbmUgUl9SSVNDVl9UTFNfVFBSRUw2NAkxMQorI2RlZmluZSBSX1JJU0NWX0lS
RUxBVElWRQk1OAorCisvKiBSZWxvY2F0aW9uIHR5cGVzIG5vdCB1c2VkIGJ5IHRoZSBkeW5hbWlj
IGxpbmtlciAqLworI2RlZmluZSBSX1JJU0NWX0JSQU5DSAkJMTYKKyNkZWZpbmUgUl9SSVNDVl9K
QUwJCTE3CisjZGVmaW5lIFJfUklTQ1ZfQ0FMTAkJMTgKKyNkZWZpbmUgUl9SSVNDVl9DQUxMX1BM
VAkxOQorI2RlZmluZSBSX1JJU0NWX0dPVF9ISTIwCTIwCisjZGVmaW5lIFJfUklTQ1ZfVExTX0dP
VF9ISTIwCTIxCisjZGVmaW5lIFJfUklTQ1ZfVExTX0dEX0hJMjAJMjIKKyNkZWZpbmUgUl9SSVND
Vl9QQ1JFTF9ISTIwCTIzCisjZGVmaW5lIFJfUklTQ1ZfUENSRUxfTE8xMl9JCTI0CisjZGVmaW5l
IFJfUklTQ1ZfUENSRUxfTE8xMl9TCTI1CisjZGVmaW5lIFJfUklTQ1ZfSEkyMAkJMjYKKyNkZWZp
bmUgUl9SSVNDVl9MTzEyX0kJCTI3CisjZGVmaW5lIFJfUklTQ1ZfTE8xMl9TCQkyOAorI2RlZmlu
ZSBSX1JJU0NWX1RQUkVMX0hJMjAJMjkKKyNkZWZpbmUgUl9SSVNDVl9UUFJFTF9MTzEyX0kJMzAK
KyNkZWZpbmUgUl9SSVNDVl9UUFJFTF9MTzEyX1MJMzEKKyNkZWZpbmUgUl9SSVNDVl9UUFJFTF9B
REQJMzIKKyNkZWZpbmUgUl9SSVNDVl9BREQ4CQkzMworI2RlZmluZSBSX1JJU0NWX0FERDE2CQkz
NAorI2RlZmluZSBSX1JJU0NWX0FERDMyCQkzNQorI2RlZmluZSBSX1JJU0NWX0FERDY0CQkzNgor
I2RlZmluZSBSX1JJU0NWX1NVQjgJCTM3CisjZGVmaW5lIFJfUklTQ1ZfU1VCMTYJCTM4CisjZGVm
aW5lIFJfUklTQ1ZfU1VCMzIJCTM5CisjZGVmaW5lIFJfUklTQ1ZfU1VCNjQJCTQwCisjZGVmaW5l
IFJfUklTQ1ZfR05VX1ZUSU5IRVJJVAk0MQorI2RlZmluZSBSX1JJU0NWX0dOVV9WVEVOVFJZCTQy
CisjZGVmaW5lIFJfUklTQ1ZfQUxJR04JCTQzCisjZGVmaW5lIFJfUklTQ1ZfUlZDX0JSQU5DSAk0
NAorI2RlZmluZSBSX1JJU0NWX1JWQ19KVU1QCTQ1CisjZGVmaW5lIFJfUklTQ1ZfR1BSRUxfSQkJ
NDcKKyNkZWZpbmUgUl9SSVNDVl9HUFJFTF9TCQk0OAorI2RlZmluZSBSX1JJU0NWX1RQUkVMX0kJ
CTQ5CisjZGVmaW5lIFJfUklTQ1ZfVFBSRUxfUwkJNTAKKyNkZWZpbmUgUl9SSVNDVl9SRUxBWAkJ
NTEKKyNkZWZpbmUgUl9SSVNDVl9TVUI2CQk1MgorI2RlZmluZSBSX1JJU0NWX1NFVDYJCTUzCisj
ZGVmaW5lIFJfUklTQ1ZfU0VUOAkJNTQKKyNkZWZpbmUgUl9SSVNDVl9TRVQxNgkJNTUKKyNkZWZp
bmUgUl9SSVNDVl9TRVQzMgkJNTYKKyNkZWZpbmUgUl9SSVNDVl8zMl9QQ1JFTAk1NworI2RlZmlu
ZSBSX1JJU0NWX1BMVDMyCQk1OQorI2RlZmluZSBSX1JJU0NWX1NFVF9VTEVCMTI4CTYwCisjZGVm
aW5lIFJfUklTQ1ZfU1VCX1VMRUIxMjgJNjEKKwogI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0VMRl9S
X0ggKi8KCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
