Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABB1606A33E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9iku1fe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dhUms7oH;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SZJ7c1JZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3kHC8lp88Hm/bjACsSzh1HF/HmWGAajHbQ8p1w1SLVs=; b=l9iku1fepe5C2eXLgLqGXFTnJ/
	CmqXfwj0aY5UVVe3dKkqCwGaCi4N6lnnRz3NGU/VJLpAx9VAjdRHww7wsTl+mCm24aSMLyPR6oPwr
	+KV/ahHebknOsCWhHr4+mjsDChmi+isSXcnQbzcJKbXUFnvZWxMriM2hBM6T4EyoIT3nxhiB+fUSC
	N7tCz75mt3WWPqp8kBNQL3536cXyhBFp1Cqi8HpJSWhsqlNEiKO45x0zxJCcQgfgebdPwqEP9DFwr
	2a5LBvar8TDE+smXQoQXd4M7vvjY5IiBsvpes1zZ8k3nvGXKD2zgYGjVx3qWiBCZyRKoyvK/jHIT3
	NKAkiBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS5-00000003dzw-1rhc;
	Mon, 23 Nov 2026 13:51:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUS0-00000003dxq-2YyB;
	Mon, 23 Nov 2026 13:51:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eDaWEGVSberGT3lup7BUtg92+nPcoIl/POEYu2Hk/qs=;
	b=dhUms7oHgMAyTwjaFQ4RcmHZy3AcRiYZGHrtxzyko2OKJq9ppnxdmoYRgjmCHmDl72nUPK
	L/7fYN96Dq/EWTGaIbc6mSLcy31gm1eTfI4kwupFpFPjC112yyZkM8ESt8bMlcCF8FmAER
	KmEK8t92o7JvwtqkOPsvSFKiP0dHe4+qaQz5h0vFdUIKKWIuL0I9ZQNNlUKxBIx2c7YsVt
	9wFwFcCd8I9ee05oaCZWhsyhqcXGDWdhcn0TprHoLVGNWll7eYv0kGf1d15Xde8wEa17I2
	nVKIeHL9cL2tRun1gCxK7pNUw/9eoEPay1jdaqJRmlkyRrC7OYH3x68J6Bc0fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eDaWEGVSberGT3lup7BUtg92+nPcoIl/POEYu2Hk/qs=;
	b=SZJ7c1JZEJleqouSHibtjvawagbQZiztXnKad+RaVrzqS2CEbt3LfVh0aVKUf8rCz1vARk
	veQbOsz5bF+5U/DA==
Subject: [PATCH v6 00/11] vdso: Reject absolute relocations during build
Date: Mon, 23 Nov 2026 14:50:51 +0100
Message-Id: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QzWoDIRDA8VcJnmtx/LanvkfJQd3ZRljWohtJC
 PvuNYGQUjz+B+Y3MDdSsSSs5ONwIwVbqimvPfTbgcSTX7+Rpqk34YwrJrmlbaqZ+lDzct6QFlx
 ypJ5zzZ2IYDSQvvlTcE6Xh/p17H1Kdcvl+jjS4D59em7oNaCMOms88/MELKjPJa3nreQ1Xd4nJ
 Hez8T+OYGOHd0fhHKMIUQauR454ORpg7IjuSGOdmYwwVoaRI1+OBT52ZHc0eBs0KFQYR456Opo
 5Nv53U90R3gnjwM8Q5//Ovu+/Goaqs9oBAAA=
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3723;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=838wXNltovAdYq5DnbIAatCSo/HDl9G1xi3tlTew/l4=;
 b=JGW/t5g7XakafXkEmZgN47zuaZVRMd5P5Z1iLiNybaoBHrfSDWqN9ASPR8Bxcs9mW00guv58q
 XTXxW/DfNA2DS7eGKT7s34DDNPA2BkV8xQIeN4+3mlNlEP2jFFXWeWs
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055120_818569_59D3D051 
X-CRM114-Status: GOOD (  12.30  )
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

VGhlIGNvbXBpbGVyIGNhbiBlbWl0IGFic29sdXRlIHJlbG9jYXRpb25zIGluIHZEU08gY29kZSwK
d2hpY2ggYXJlIGludmFsaWQgaW4gdkRTTyBjb2RlLgpEZXRlY3QgdGhlbSBhdCBjb21waWxlLXRp
bWUuCgpUaGUgdG9vbCBpcyB3cml0dGVuIGluIFJ1c3QuIEhvd2V2ZXIgdGhpcyBkb2VzICpub3Qq
IGludHJvZHVjZSBhIFJ1c3QKZGVwZW5kZW5jeSBmb3Iga2VybmVsIGJ1aWxkcyB3aXRoIENPTkZJ
R19SVVNUPW4uIElmIG5vIFJ1c3QgdG9vbGNoYWluIGlzCmF2YWlsYWJsZSwgdGhlIG5ldyBjb21w
cmVoZW5zaXZlIGNoZWNrIGlzIHNraXBwZWQgYXV0b21hdGljYWxseS4KCmxpYmMgZWxmLmggaXMg
bWlzc2luZyBzb21lIG9mIHRoZSByZWxvY2F0aW9uIGNvbnN0YW50cywKc28gaGFyZGNvZGUgdGhl
IG1hZ2ljIG51bWJlcnMgaW5zdGVhZC4KCktidWlsZCBhbmQgUnVzdCBmb2xrczogVGhpcyBjb250
YWlucyBjdXN0b20gZGVmaW5pdGlvbnMgb2YgaG9zdHByb2cKYmluZGdlbiBhbmQgcnVzdCBsaWJy
YXJ5IGNvbW1hbmRzLgpUaGVzZSBhcmUgY3VycmVudGx5IG9ubHkgZGVmaW5lZCBpbnNpZGUgdGhl
IHN1YnN5c3RlbSBkaXJlY3RvcnkuCkxldCBtZSBrbm93IGlmIHRoZXkgc2hvdWxkIGdvIGludG8g
c2NyaXB0cy9NYWtlZmlsZS5ob3N0LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWgg
PHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQpDaGFuZ2VzIGluIHY2OgotIERy
b3AgYWxsIFVBUEkgaGVhZGVyIGNoYW5nZXMsIGhhcmRjb2RlIHJlbG9jYXRpb24gbnVtYmVycyBp
bnN0ZWFkLgotIEFkZCBub3RlIGFib3V0IFJ1c3QgKm5vbiotZGVwZW5kZW5jeSB0byBjb3ZlciBs
ZXR0ZXIuCi0gTGluayB0byB2NTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwOTA4LXZk
c28tYWJzb2x1dGUtcmVsb2MtdjUtMC0zYTkzNzkxYWYxY2ZAbGludXRyb25peC5kZQoKQ2hhbmdl
cyBpbiB2NToKLSBSZWJhc2Ugb24gdjcuMy1yYzEKLSBzL0hPU1RSVVNUTElCL0hPU1RSVVNUQyBM
LwotIFBpY2sgdXAgcmV2aWV3IHRhZ3MuCi0gQWxzbyBoYW5kbGUgU1BBUkMuCi0gQnVpbGQgJ3Zk
c29jaGVjaycgZHVyaW5nIHRoZSBwcmVwYXJlIHBoYXNlLgotIERyb3Agbm93IHVubmVjZXNzYXJ5
IHJpc2N2IExUTyBwcmVwYXJhdGlvbiBwYXRjaGVzLgotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTA4MTItdmRzby1hYnNvbHV0ZS1yZWxvYy12NC0wLTYxYThiNjE1
ZTVlY0BsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHY0OgotIFJlcGxhY2UgdGhlIGlubGluZSBz
aGVsbCBsb2dpYyB3aXRoIGEgZGVkaWNhdGVkIGJ1aWxkLXRpbWUgdG9vbAotIExpbmsgdG8gdjM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2MTEtdmRzby1hYnNvbHV0ZS1yZWxvYy12
My0wLTQ3ODk3ZDczNzg0YkBsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYzOgotIERyb3AgYWxy
ZWFkeSBhcHBsaWVkIGJ1Z2ZpeCBmb3IgYXJtNjQKLSBEaXNhYmxlIExUTyBmb3IgdGhlIHJpc2N2
IHZEU08sIGFzIGl0IGlzIGluY29tcGF0aWJsZQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNTA0MzAtdmRzby1hYnNvbHV0ZS1yZWxvYy12Mi0wLTVlZmNjM2JjNGIy
NkBsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYyOgotIExpbmsgdG8gb3BlbmVuZCAoaW52YWxp
ZCkgR0NDIGJ1ZyBjb250YWluaW5nIG1vcmUgZXhwbGFuYXRpb25zCi0gUmVmaW5lIGNvbW1pdCBt
ZXNzYWdlcwotIERvbid0IGZhaWwgb24gY29tbWl0IGFic29sdXRlIHJlbG9jYXRpb25zIGluIGRl
YnVnIGluZm8KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNDI5
LXZkc28tYWJzb2x1dGUtcmVsb2MtdjEtMC05ODdhMGFmZDEwYjVAbGludXRyb25peC5kZQoKLS0t
ClRob21hcyBXZWnDn3NjaHVoICgxMSk6CiAgICAgIHZkc286IEFkZCB0aGUgdmRzb2NoZWNrIHRv
b2wKICAgICAgeDg2L3Zkc286IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgQVJNOiB2
ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIGFybTY0OiB2ZHNvOiBFbmFibGUg
dGhlIHZkc29jaGVjayB0b29sCiAgICAgIHBvd2VycGMvdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hl
Y2sgdG9vbAogICAgICByaXNjdjogdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAogICAg
ICBMb29uZ0FyY2g6IHZEU086IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgczM5MC92
ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIE1JUFM6IHZkc286IEVuYWJsZSB0
aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgc3BhcmM6IHZkc286IEVuYWJsZSB0aGUgdmRzb2NoZWNr
IHRvb2wKICAgICAgdkRTTzogQXV0b21hdGljYWxseSBlbmFibGUgVkRTT19DSEVDSwoKIE1ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTkgKysKIGFyY2gvYXJt
L3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvYXJtNjQv
a2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvbG9vbmdhcmNo
L3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvbWlwcy92ZHNvL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGFyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzby9NYWtlZmlsZSAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28v
TWFrZWZpbGUgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvczM5MC9rZXJuZWwvdmRzby9NYWtl
ZmlsZSAgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvc3BhcmMvdmRzby9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgfCAgIDUgKy0KIGFyY2gveDg2L2VudHJ5L3Zkc28vY29tbW9uL01ha2Vm
aWxlLmluY2x1ZGUgfCAgIDIgKy0KIGxpYi92ZHNvL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDcgKwogbGliL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMiArCiBsaWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlICAgICAgICAgICAgICAgICAg
IHwgIDE0ICsKIGxpYi92ZHNvL2NoZWNrLy5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwogbGliL3Zkc28vY2hlY2svTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAzNCAr
KwogbGliL3Zkc28vY2hlY2svZWxmLnJzICAgICAgICAgICAgICAgICAgICAgICB8IDQ5OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgICAg
ICAgICAgICAgICAgIHwgMjk5ICsrKysrKysrKysrKysrKysrCiAxNyBmaWxlcyBjaGFuZ2VkLCA4
OTYgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMGUyZmNk
NTIwOGE0YmJlNTM0MTlhMGU0MzU5ZGYzYTYxNDEzNTY0OQpjaGFuZ2UtaWQ6IDIwMjUwNDI4LXZk
c28tYWJzb2x1dGUtcmVsb2MtYTIyNjI5M2MxNzYxCgpCZXN0IHJlZ2FyZHMsCi0tICAKVGhvbWFz
IFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
