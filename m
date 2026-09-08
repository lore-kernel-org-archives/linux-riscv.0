Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D63C79FAF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DK2rnw7kRwxuhW60r5EPcCJk1JAikYo0S/1yOueUGJg=; b=F0JRskRfRpAgZ8
	iy8c8rJcBf3/p2F9HDWU4vGIM5Bq3DpxSw7M7YUE/QciZg0eNB1IrcGO1EcRab0XQQiuA4wBL5P6C
	MWgC4pvCMdEtF1IZesNlb89ARNkSzQ8xc9x41Avae6qbfUJPG3SrPfhrzyP4tq3AQDZDALxVzKCDz
	2MLc3Jdh0x5UER7OIn3TxxuV9uh5w+mDul9rFvQ9he+Jr5zoCtuk/g4IzW6OOtWHEXy3qHLNf2efh
	FLi/m1xvd6hfmrBrEdAFC8YjG+UPj1qQgqPpIg8jCGkJ1343Mbc9XcCtm5HPOGGC0yzWadeVcquNe
	tgI2O6trAMdeEPUMGZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pP8-0000000895I-3Tjp;
	Tue, 08 Sep 2026 06:34:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pOy-000000088si-22CY;
	Tue, 08 Sep 2026 06:33:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp0o8EDFYqgaI/CEiEvUg/mXT7EeRnDPR+/NOomvS88=;
	b=ugOOuW9qKhAU3jefF5rh08PT3vrE2IXdbueWnqZqCpmyV5bvOudbWlrbHjpeje1u8xgjfv
	AKlGo1M9CxgVkcWML1tdQGO/+Yr8wRNl4W1A12PQz3BNS1oUOkekAz+Ae2u3Y3gaWX6IOs
	JtboaftOyUindIxACXrEnFvSVVXEFw0jfPd2Zaq9Wtkkl+YHzfskypxnguHiNVMOQLXuwJ
	ChiyKIktCY98YbQi6nKlJ+gVx5YgpcujMOZYC1T+Yw0xzGUGXsCB76CVtAr/DucEjwjQ3A
	sF3OFbYIbiqCePh0eg5o0M79ii6HYcWDmcoD0jLFasuMbIDQ6s/LvL3pagYykA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp0o8EDFYqgaI/CEiEvUg/mXT7EeRnDPR+/NOomvS88=;
	b=An9/D7tx9snxErbmaoktle4MclQvGq4BeA4eqME/OXmkgI1ozhe/GSz/tKB6Fu1fAZBtoW
	ktDVIIqBQgCerXCw==
Subject: [PATCH v5 00/24] vdso: Reject absolute relocations during build
Date: Tue, 08 Sep 2026 08:33:34 +0200
Message-Id: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Ny2rDMBCF4VcJWldFGl3dVd+jZKHLuBEYK0iOS
 Al+9yiBklK0/A/MNzdSsSSs5ONwIwVbqimvPdTbgYSTW7+RptibAAPFJFjaYs3U+ZqXy4a04JI
 DdQAaJhG40Zz0y3PBOV2f6tex9ynVLZef55PGH+uvNw29ximjkzWOuTly5tXnktbLVvKaru8Ry
 cNs8McRbOxAdxTOIQgfpAc9csTL0ZyPHdEdaexkohHGSj9y5MuxHMaO7I7mznrNFSoM/5193+9
 FRYP1kgEAAA==
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
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788849226; l=5051;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HrYSsshejm3MdwopK0QyrP0YNb7baHfULTYkmKafnyk=;
 b=6vZ688HbgWJhdTRQDorQBzK+M44QpmiNq6teG+NERQLRF70axqHuYGFGpQXkaBAwsvu/byckc
 GVjxkQ/ryyNA0SOqbZDiyxRuUih42hmJ5lsZUQGQM/E4vA20m25CVaf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_233352_826313_BFD78DCC 
X-CRM114-Status: GOOD (  13.53  )
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

VGhlIGNvbXBpbGVyIGNhbiBlbWl0IGFic29sdXRlIHJlbG9jYXRpb25zIGluIHZEU08gY29kZSwK
d2hpY2ggYXJlIGludmFsaWQgaW4gdkRTTyBjb2RlLgpEZXRlY3QgdGhlbSBhdCBjb21waWxlLXRp
bWUuCgpsaWJjIGVsZi5oIGlzIG1pc3Npbmcgc29tZSBvZiB0aGUgcmVsb2NhdGlvbiBjb25zdGFu
dHMsCnNvIG1ha2UgdXNlIG9mIHRoZSBrZXJuZWxzIG93biBVQVBJIGhlYWRlcnMgaW5zdGVhZC4K
ClBhdGNoZXMgMTMgb253YXJkIGNvbnRhaW4gdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBjaGFu
Z2VzLAppbnRlcmVzdGluZyBmb3IgdGhlIGFyY2hpdGVjdHVyZSBtYWludGFpbmVzLgoKS2J1aWxk
IGFuZCBSdXN0IGZvbGtzOiBUaGlzIGNvbnRhaW5zIGN1c3RvbSBkZWZpbml0aW9ucyBvZiBob3N0
cHJvZwpiaW5kZ2VuIGFuZCBydXN0IGxpYnJhcnkgY29tbWFuZHMuClRoZXNlIGFyZSBjdXJyZW50
bHkgb25seSBkZWZpbmVkIGluc2lkZSB0aGUgc3Vic3lzdGVtIGRpcmVjdG9yeS4KTGV0IG1lIGtu
b3cgaWYgdGhleSBzaG91bGQgZ28gaW50byBzY3JpcHRzL01ha2VmaWxlLmhvc3QuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0gUmViYXNlIG9uIHY3LjMtcmMxCi0gcy9IT1NUUlVTVExJ
Qi9IT1NUUlVTVEMgTC8KLSBQaWNrIHVwIHJldmlldyB0YWdzLgotIEFsc28gaGFuZGxlIFNQQVJD
LgotIEJ1aWxkICd2ZHNvY2hlY2snIGR1cmluZyB0aGUgcHJlcGFyZSBwaGFzZS4KLSBEcm9wIG5v
dyB1bm5lY2Vzc2FyeSByaXNjdiBMVE8gcHJlcGFyYXRpb24gcGF0Y2hlcy4KLSBMaW5rIHRvIHY0
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwODEyLXZkc28tYWJzb2x1dGUtcmVsb2Mt
djQtMC02MWE4YjYxNWU1ZWNAbGludXRyb25peC5kZQoKQ2hhbmdlcyBpbiB2NDoKLSBSZXBsYWNl
IHRoZSBpbmxpbmUgc2hlbGwgbG9naWMgd2l0aCBhIGRlZGljYXRlZCBidWlsZC10aW1lIHRvb2wK
LSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNjExLXZkc28tYWJz
b2x1dGUtcmVsb2MtdjMtMC00Nzg5N2Q3Mzc4NGJAbGludXRyb25peC5kZQoKQ2hhbmdlcyBpbiB2
MzoKLSBEcm9wIGFscmVhZHkgYXBwbGllZCBidWdmaXggZm9yIGFybTY0Ci0gRGlzYWJsZSBMVE8g
Zm9yIHRoZSByaXNjdiB2RFNPLCBhcyBpdCBpcyBpbmNvbXBhdGlibGUKLSBMaW5rIHRvIHYyOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNDMwLXZkc28tYWJzb2x1dGUtcmVsb2MtdjIt
MC01ZWZjYzNiYzRiMjZAbGludXRyb25peC5kZQoKQ2hhbmdlcyBpbiB2MjoKLSBMaW5rIHRvIG9w
ZW5lbmQgKGludmFsaWQpIEdDQyBidWcgY29udGFpbmluZyBtb3JlIGV4cGxhbmF0aW9ucwotIFJl
ZmluZSBjb21taXQgbWVzc2FnZXMKLSBEb24ndCBmYWlsIG9uIGNvbW1pdCBhYnNvbHV0ZSByZWxv
Y2F0aW9ucyBpbiBkZWJ1ZyBpbmZvCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDQyOS12ZHNvLWFic29sdXRlLXJlbG9jLXYxLTAtOTg3YTBhZmQxMGI1QGxpbnV0
cm9uaXguZGUKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMjQpOgogICAgICBlbGYsIHVhcGk6IEFk
ZCBhIGhlYWRlciBmb3IgcmVsb2NhdGlvbiBjb25zdGFudHMKICAgICAgeDg2L2VsZiwgdW0veDg2
L2VsZjogTW92ZSByZWxvY2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAgIEFSTTogZWxmOiBN
b3ZlIHJlbG9jYXRpb24gY29uc3RhbnRzIHRvIFVBUEkKICAgICAgYXJtNjQ6IGVsZjogTW92ZSBy
ZWxvY2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAgIHBvd2VycGMvZWxmOiBNb3ZlIHJlbG9j
YXRpb24gY29uc3RhbnRzIHRvIFVBUEkKICAgICAgcmlzY3Y6IGVsZjogTW92ZSByZWxvY2F0aW9u
IGNvbnN0YW50cyB0byBVQVBJCiAgICAgIExvb25nQXJjaDogTW92ZSByZWxvY2F0aW9uIGNvbnN0
YW50cyB0byBVQVBJCiAgICAgIHMzOTAvZWxmOiBNb3ZlIHJlbG9jYXRpb24gY29uc3RhbnRzIHRv
IFVBUEkKICAgICAgTUlQUzogRUxGOiBNb3ZlIHJlbG9jYXRpb24gY29uc3RhbnRzIHRvIFVBUEkK
ICAgICAgc3BhcmM6IGVsZjogTW92ZSByZWxvY2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAg
IHRvb2xzIGhlYWRlcnMgVUFQSTogU3luYyBFTEYgaGVhZGVycyB3aXRoIHRoZSBrZXJuZWwgc291
cmNlcwogICAgICB2ZHNvOiBBZGQgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIHg4Ni92ZHNvOiBF
bmFibGUgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIEFSTTogdmRzbzogRW5hYmxlIHRoZSB2ZHNv
Y2hlY2sgdG9vbAogICAgICBhcm02NDogdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAog
ICAgICBwb3dlcnBjL2VsZjogQWRkIDMyLWJpdCBSRUwxNiByZWxvY2F0aW9uIGRlZmluaXRpb25z
CiAgICAgIHBvd2VycGMvdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAogICAgICByaXNj
djogdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAogICAgICBMb29uZ0FyY2g6IHZEU086
IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgczM5MC92ZHNvOiBFbmFibGUgdGhlIHZk
c29jaGVjayB0b29sCiAgICAgIE1JUFM6IEVMRjogQWRkIG1vcmUgUEMtcmVsYXRpdmUgcmVsb2Nh
dGlvbiBkZWZpbml0aW9ucwogICAgICBNSVBTOiB2ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0
b29sCiAgICAgIHNwYXJjOiB2ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIHZE
U086IEF1dG9tYXRpY2FsbHkgZW5hYmxlIFZEU09fQ0hFQ0sKCiBNYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICsKIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Vs
Zi5oICAgICAgICAgICAgICAgICAgfCAgMjQgLQogYXJjaC9hcm0vdmRzby9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9lbGYuaCAg
ICAgICAgICAgICAgICB8ICA1NSAtLS0KIGFyY2gvYXJtNjQva2VybmVsL3Zkc28vTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2VsZi5oICAg
ICAgICAgICAgfCAxMzAgLS0tLS0KIGFyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgIDQgKy0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgICAg
ICAgICAgfCAgNTUgLS0tCiBhcmNoL21pcHMvdmRzby9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgIHwgICA4ICstCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS91YXBpL2FzbS9lbGYuaCAgICAgICAg
IHwgMjAxIC0tLS0tLS0tCiBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAg
ICAgIHwgICA0ICstCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vZWxmLmggICAgICAgICAg
IHwgIDY2IC0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSAgICAgICAgICAgICB8
ICAgNCArLQogYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICAgICAgICAgICB8ICA4
MyAtLS0tCiBhcmNoL3MzOTAva2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICA0
ICstCiBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2VsZl8zMi5oICAgICAgICAgICAgIHwgIDQzIC0t
CiBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2VsZl82NC5oICAgICAgICAgICAgIHwgIDQ0IC0tCiBh
cmNoL3NwYXJjL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBhcmNo
L3g4Ni9lbnRyeS92ZHNvL2NvbW1vbi9NYWtlZmlsZS5pbmNsdWRlIHwgICAyICstCiBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgICAgICAgICAgIHwgIDMzIC0tCiBhcmNoL3g4Ni91
bS9hc20vZWxmLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDMzIC0tCiBpbmNsdWRlL3VhcGkv
bGludXgvZWxmLXIuaCAgICAgICAgICAgICAgICAgIHwgNzA1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9lbGYuaCAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogbGliL3Zkc28vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyAr
CiBsaWIvdmRzby9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGxp
Yi92ZHNvL01ha2VmaWxlLmluY2x1ZGUgICAgICAgICAgICAgICAgICAgfCAgMTQgKwogbGliL3Zk
c28vY2hlY2svLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICB8ICAgMyArCiBsaWIvdmRzby9j
aGVjay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgIDM0ICsrCiBsaWIvdmRzby9jaGVj
ay9lbGYucnMgICAgICAgICAgICAgICAgICAgICAgIHwgNDk4ICsrKysrKysrKysrKysrKysrKysr
CiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgICAgICAgICAgICAgICAgIHwgMjk5ICsrKysr
KysrKysrKwogdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1lbS5oICAgICAgICAgICB8ICA3
MSArKysKIHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICAgICAgICAgICAgfCA3MDUg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2Vs
Zi5oICAgICAgICAgICAgICB8IDExMiArKysrLQogMzMgZmlsZXMgY2hhbmdlZCwgMjQ3OSBpbnNl
cnRpb25zKCspLCA3OTcgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMmY3MzdhMTMzZmFk
MzgwOGY5OTkzZjcwNGZiMjdmZDc3OTFhMGE0MQpjaGFuZ2UtaWQ6IDIwMjUwNDI4LXZkc28tYWJz
b2x1dGUtcmVsb2MtYTIyNjI5M2MxNzYxCgpCZXN0IHJlZ2FyZHMsCi0tICAKVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
