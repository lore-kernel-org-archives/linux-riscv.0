Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E9C79FAD
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBxAQVM3WDoaBhTlTDs62QLYpU2kKL88zyCp9Sd+Lgo=; b=oREH30tpem5QVl
	spv7OwHiX+VGsksIRLLVHAMJoN0ILXvWQ6xy37mzrgZ5Dp0Qtk22qxIeSURueaJhyufVljjXoPt1u
	HJzQszbqGM+3gVYb4R2lJmvz8POjs7Dxs+vR0oTEcIytHQSJLT1rqGOB50xXa2bWKS0QvbUNmlYfO
	8GiIz++oWM7f4P0+g8Sh+kDWhEkSPA3TF1NGu50PMBufTPwz7Ry36LXXZPWoqPlpP1BMfUDuV+UL8
	zdQffkSh9/EjEItAsKWJpfmvg1aqKgsYrvIJsETxsrt5YTDGoayFHe1qjPnLQNKFsYj/n5KeVp1wV
	VzYGj/irI94Vb7JhKNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP3-000000088xq-33aI;
	Tue, 08 Sep 2026 06:33:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOy-000000088sl-22gq;
	Tue, 08 Sep 2026 06:33:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIZqQqreoVp4jL5VDlYmXNMQM5O5p/caA2tuy/ziotc=;
	b=ebIbHeLLhulPxU96t2LRMg4s4x5K/xNe3iO4CR8LKAIdJ9kYfTc3MXtWBz/fXjFkEU9kMr
	ld8JvPU+EAtF9gbFrTW6gwQHl+2Bclu/F+5tk06gWU+u8YSLGy6Fs+b+dl+oT7u7R+QUlz
	bCl15HE1EVvXEl60ida0PtVa2R2PD9q2BdCLGN1ph/WmXkFBIb+v2gs8Mz4niWS3c+WFNF
	s5L1oWts84MWkE5GzZSbShoQTqSPfKHvYz1OJVecgZ9cSrkKKIh7FoerX+WoXxVwtFF+8f
	hg7jFr8a/amVt5iCyOzW9R3BnRUIfT7WfuRnMScYGrUMlh6kWYjJybJPngonVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIZqQqreoVp4jL5VDlYmXNMQM5O5p/caA2tuy/ziotc=;
	b=5Q9BAPxIl6FXv9Um3lg8pwJD6tKmF767tMf3YrqRNLIA3fzOdbqDAtSMZ58ddEqhSk+iSa
	SWIkWgAern8ootAQ==
Date: Tue, 08 Sep 2026 08:33:35 +0200
Subject: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
MIME-Version: 1.0
Message-Id: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=1348;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BNQHFvTY0jFJrlhn6+RVLpYSgcHasImekBzIK9bpThE=;
 b=ncJJdfJzUputRN+485gg2paJ/pNXo1aFgMnfr2+Vvf39fIyuFgtJ0VGn6HbawU4QQNwNU2xhl
 vPCs3Fdp7LyAWOKAaDyvzvlu+8V715tn72jQFoXKC+X5TMsa0Xr4m74
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233352_664655_709EBA23 
X-CRM114-Status: GOOD (  14.80  )
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

V2hpbGUgdGhlIG51bWVyaWMgY29uc3RhbnRzIGZvciByZWxvY2F0aW9ucyBhcmUgYXJjaGl0ZWN0
dXJlIHNwZWNpZmljLAppdCBpcyBzdGlsbCB1c2VmdWwgdG8gZ2V0IGFjY2VzcyB0byB0aGVtIGZy
b20gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KQWxzbyB0aGUgZGVmaW5pdGlvbnMgYXJlIHVzZWZ1bCBm
b3IgdXNlcnNwYWNlIGluIGdlbmVyYWwuCkZvciBleGFtcGxlIHRvb2xzIHByb2Nlc3NpbmcgZWxm
IGZpbGVzIGR1cmluZyBhIGtlcm5lbCBjcm9zcy1jb21waWxhdGlvbgpjYW4gbWFrZSB1c2Ugb2Yg
dGhlbS4KCkludHJvZHVjZSBhIGRlZGljYXRlZCBoZWFkZXIgZm9yIHRoZW0sIHNpbWlsYXIgdG8g
dGhlIGVsZi1lbS5oIGhlYWRlci4KRm9yIG5vdyB0aGUgaGVhZGVyIGlzIGVtcHR5IGJ1dCBpdCB3
aWxsIGJlIGZpbGxlZCBzdGVwIGJ5IHN0ZXAgaW4KdXBjb21taW5nIGNvbW1pdHMuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaCB8IDUgKysrKysKIGluY2x1ZGUvdWFw
aS9saW51eC9lbGYuaCAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi1yLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yYzM4
MmM4YTQ4MDcKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaApA
QCAtMCwwICsxLDUgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIFdJVEgg
TGludXgtc3lzY2FsbC1ub3RlICovCisjaWZuZGVmIF9VQVBJX0xJTlVYX0VMRl9SX0gKKyNkZWZp
bmUgX1VBUElfTElOVVhfRUxGX1JfSAorCisjZW5kaWYgLyogX1VBUElfTElOVVhfRUxGX1JfSCAq
LwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi5oCmluZGV4IGVlMzBkY2Q4MDkwMS4uYjNlMzEyMjU1NTUyIDEwMDY0NAotLS0gYS9p
bmNsdWRlL3VhcGkvbGludXgvZWxmLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oCkBA
IC00LDYgKzQsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51
eC9lbGYtZW0uaD4KKyNpbmNsdWRlIDxsaW51eC9lbGYtci5oPgogCiAvKiAzMi1iaXQgRUxGIGJh
c2UgdHlwZXMuICovCiB0eXBlZGVmIF9fdTMyCUVsZjMyX0FkZHI7CgotLSAKMi41NS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
