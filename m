Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FC606A33B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iaKWBmTa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NuQxcyBf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ee7e9mzF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TA2aLaaqlbMglRgk97447AsN0FxmlqaeML0BS+27Klk=; b=iaKWBmTaD5aEM9BKkSOscIXJSG
	IA/OYVggiKfv6Qg/+FaXW61zsCe5jFvn0BOjX/ur0LDmFNRqL7coGdXr0pLQhZzg9R9nuLtgCuaG+
	reDAeva6hPJ0iEJuGm6xzJ/DOLTukasvAS8MnNq+0JSvwyFJMvUCmMQrJR+6jnB6tEbao2zgZTMtX
	G4ggjugO4jJ12Fo9s+C4/9or5pTgpFhL+Yex/pNvVcfKB9cTC+P9LW6UhXKT7A/kjlHfjWdrW1RHt
	hqNiv5066oDZas9KxAXx9+fP6gRTKrh5to1KaPC8/ocIdY0/oDyirEEc8xAAguyakvdAWAysKOOpJ
	syE5CvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUSI-00000003eDt-2pg9;
	Mon, 23 Nov 2026 13:51:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS4-00000003dyf-0MH5;
	Mon, 23 Nov 2026 13:51:25 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Guhg1K0FMFBPE0u0CIJl3O+ZgtOjrn7cr+GEqqxWqko=;
	b=NuQxcyBfhV7EAPhhJJ0IrWwI8Sg6agHEvml/ui+39lfH4IvCvHOhVb3sTcEszxrptDYhzM
	KOTWGp0s724CoC63fsCVglfZK3pNCVB8Dpc4O3J+oZJetwugA7rRVDeJweiqPTc8fFxGvo
	RmhJHmEu3rwm40c8zSLI4bxEI1qi65sJ8cASKE5pWCVY38ce3oB6mbJaStD5r9bHbVd18/
	R42vVr0ltwptVz13BPAw5JmRofzhPG5tYJKVGp3gS5RHItjXpfpb6NKiTXVnBsh/nC0c3b
	8kgM8WRRit79N6lKDO5GVLdWFOxuL3Rdld+lG35LGAQjhk+TpvfZuqpuvy+zig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Guhg1K0FMFBPE0u0CIJl3O+ZgtOjrn7cr+GEqqxWqko=;
	b=Ee7e9mzFD85deKLGcm8e5YD0L+U1o17HaFbybIhTLTjFkWWkRB4gFePrbUFQEhupkaPgbn
	0vbj4CqmhgO4CrAg==
Date: Mon, 23 Nov 2026 14:50:55 +0100
Subject: [PATCH v6 04/11] arm64: vdso: Enable the vdsocheck tool
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-vdso-absolute-reloc-v6-4-161e218dd217@linutronix.de>
References: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
In-Reply-To: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
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
 Peter Zijlstra <peterz@infradead.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2617;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ORz4l21C1iPuk7FCAsvH2byEFW0UweMz0824cCTy53M=;
 b=q7DXOLJiNCyz2OBeq2mHIOnoqJ70WoExeUnEefxSG/lSMIqTsqHDcIrncJ9VEiIXA1Umw12+U
 OOQlmf3HB4zBZUGjar3eMCLr8sFDPZAeV+wIvbVyQBy37Hse7yPcaaY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055124_273495_511D5F64 
X-CRM114-Status: GOOD (  11.77  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHZkc29jaGVjayB0b29sIHZhbGlkYXRlcyB0aGUgb2JqZWN0IGZpbGVzIGFuZCBmaW5hbCAu
c28gbGlicmFyeS4KSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxvY2F0
aW9ucyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCndpdGggdGhlIHZEU08gd2hpY2ggbmVlZCB0byBi
ZSB3b3JrZWQgYXJvdW5kLgoKV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KClRoZSBj
b21wYXQgdkRTTyB3aWxsIGJlIGhhbmRsZWQgYnkgdGhlIGV4aXN0aW5nIDMyLWJpdCBBUk0gY29u
ZmlndXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgMSArCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgIDQgKystLQogbGli
L3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzICAgICB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvS2NvbmZpZyBiL2FyY2gvYXJtNjQvS2NvbmZpZwppbmRleCAxMDc1YmM2NjE4MzMu
LmRmMjJiNGVkNWUyOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gv
YXJtNjQvS2NvbmZpZwpAQCAtMjU4LDYgKzI1OCw3IEBAIGNvbmZpZyBBUk02NAogCXNlbGVjdCBU
UkFDRV9JUlFGTEFHU19OTUlfU1VQUE9SVAogCXNlbGVjdCBIQVZFX1NPRlRJUlFfT05fT1dOX1NU
QUNLCiAJc2VsZWN0IFVTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUCisJc2VsZWN0IFZEU09fQ0hFQ0sK
IAlzZWxlY3QgVkRTT19HRVRSQU5ET00KIAlzZWxlY3QgVk1BUF9TVEFDSwogCWhlbHAKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL2FybTY0L2tlcm5l
bC92ZHNvL01ha2VmaWxlCmluZGV4IGY2NjE5ZTFjYjJjZS4uNWQ4YzM0YzdiZTUxIDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL3Zkc28vTWFrZWZpbGUKQEAgLTYxLDcgKzYxLDcgQEAgdGFyZ2V0cyArPSB2ZHNvLmxkcwog
Q1BQRkxBR1NfdmRzby5sZHMgKz0gLVAgLUMgLVUkKEFSQ0gpCiAKICMgTGluayBydWxlIGZvciB0
aGUgLnNvIGZpbGUsIC5sZHMgaGFzIHRvIGJlIGZpcnN0Ci0kKG9iaikvdmRzby5zby5kYmc6ICQo
b2JqKS92ZHNvLmxkcyAkKG9iai12ZHNvKSBGT1JDRQorJChvYmopL3Zkc28uc28uZGJnOiAkKG9i
aikvdmRzby5sZHMgJChvYmotdmRzbykgJCh2ZHNvY2hlY2spIEZPUkNFCiAJJChjYWxsIGlmX2No
YW5nZWQsdmRzb2xkX2FuZF92ZHNvX2NoZWNrKQogCiAjIFN0cmlwIHJ1bGUgZm9yIHRoZSAuc28g
ZmlsZQpAQCAtNzksNCArNzksNCBAQCBpbmNsdWRlL2dlbmVyYXRlZC92ZHNvLW9mZnNldHMuaDog
JChvYmopL3Zkc28uc28uZGJnIEZPUkNFCiAKICMgQWN0dWFsIGJ1aWxkIGNvbW1hbmRzCiBxdWll
dF9jbWRfdmRzb2xkX2FuZF92ZHNvX2NoZWNrID0gTEQgICAgICAkQAotICAgICAgY21kX3Zkc29s
ZF9hbmRfdmRzb19jaGVjayA9ICQoY21kX2xkKTsgJChjbWRfdmRzb19jaGVjaykKKyAgICAgIGNt
ZF92ZHNvbGRfYW5kX3Zkc29fY2hlY2sgPSAkKGNtZF9sZF92ZHNvKTsgJChjbWRfdmRzb19jaGVj
aykKZGlmZiAtLWdpdCBhL2xpYi92ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyBiL2xpYi92ZHNvL2No
ZWNrL3Zkc29jaGVjay5ycwppbmRleCBlMjhlZTU5YTkwMGQuLjBkNWNlYWNhMzRkNyAxMDA2NDQK
LS0tIGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zk
c29jaGVjay5ycwpAQCAtNTcsNiArNTcsMTggQEAgZm4gYWxsb3dlZF9yZWxvY2F0aW9uc19mb3Jf
bWFjaGluZShtYWNoaW5lOiB1MTYpIC0+IE9wdGlvbjxBbGxvd2VkUmVsb2NhdGlvbnM8J3MKICAg
ICAgICAgICAgIC4uRGVmYXVsdDo6ZGVmYXVsdCgpCiAgICAgICAgIH0KICAgICAgICAgLmludG8o
KSwKKyAgICAgICAgYmluZGluZ3M6OkVNX0FBUkNINjQgPT4gQWxsb3dlZFJlbG9jYXRpb25zIHsK
KyAgICAgICAgICAgIGluX29iamVjdF9maWxlOiAmWworICAgICAgICAgICAgICAgIDI2MCwgLyog
Ul9BQVJDSDY0X1BSRUw2NCAqLworICAgICAgICAgICAgICAgIDI2MSwgLyogUl9BQVJDSDY0X1BS
RUwzMiAqLworICAgICAgICAgICAgICAgIDI2MiwgLyogUl9BQVJDSDY0X1BSRUwxNiAqLworICAg
ICAgICAgICAgICAgIDI3MywgLyogUl9BQVJDSDY0X0xEX1BSRUxfTE8xOSAqLworICAgICAgICAg
ICAgICAgIDI3NCwgLyogUl9BQVJDSDY0X0FEUl9QUkVMX0xPMjEgKi8KKyAgICAgICAgICAgICAg
ICAyODMsIC8qIFJfQUFSQ0g2NF9DQUxMMjYgKi8KKyAgICAgICAgICAgIF0sCisgICAgICAgICAg
ICAuLkRlZmF1bHQ6OmRlZmF1bHQoKQorICAgICAgICB9CisgICAgICAgIC5pbnRvKCksCiAgICAg
ICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
