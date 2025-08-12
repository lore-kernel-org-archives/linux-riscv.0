Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4644C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2rWZAZ8PHTTmBnHmGoQXIo+IuFVt7EQZuLFE2+NO7so=; b=f+9Mh+YmF/3fDx
	KsXb2Yh+hlJbXiGNCgrXonXJK6nbgVIc7mHmnm2V+skNDDTdxTvwSot+KqYrc28GGrk8cBxtCvJTw
	inWlKUyNtcCPt9O5s2SHOx/Bah/XM7RJNo7CX01ewAqB6W9+efswN5DAvBcRPVTSMrdYOfzj+3gXY
	JDSAI+5fkn4W9fSVqyzLDQsgM8qJBFqoQx/ScrKt9TbNGikn9GFEknq5irYA9v90mhtwl4H21boWI
	YdeTZ29NkPr7o/OFrrgr5+cWE6EeZTNYh6zqMhGcZCsuHktEpOlbgXMm4XnxIHkGXej1KNsqTr9tL
	ev5KpyaB1Cjfj1OG6TtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoM-00000009unG-25aj;
	Tue, 12 Aug 2025 05:44:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoG-00000009uhW-1qeJ;
	Tue, 12 Aug 2025 05:44:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=we+MV6CKFDKB3+12vM9P1VJPX4SvAjkcslQ93yTTcGw=;
	b=s12TFd7/GLX46A/G/+ECg+vpcMIUu0jowZ+SXwxJhxDEsbG2Hk35x8v41vFM9k2Z6++tsZ
	wOtHuHp8ijmTygwaNTx5/PxJl0C+PgVmopiqAYeFmyp93fiK/W5LuEbOsh3IyEHTsumXei
	i6tmk/KqRX9b+fFm1uMDLY5pyDp5iNUz+97nooXxtzabAVuLTdOGAwSvyTWcI7khghsSLE
	bdXXXK8T2K95P4cnyN2lV0/O0LrMoPZgp2MK6ZFO1mlvjPQFPMcdSkak5L9lDmVY5EFNW5
	a/A3FtNlNwOAu9xQb3LgvY1NyNxolVCEeOfvRv+8gK4bJAO7/0Oi4JyTYshi3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=we+MV6CKFDKB3+12vM9P1VJPX4SvAjkcslQ93yTTcGw=;
	b=1xZIjm9+RbXypIoRNrLytkIGg05FC3Q9oFSLlRkVe8Czn4YJK0dWQqTugq0BBK8RrgRbhf
	1YCXBpgKwYxPOoBg==
Subject: [PATCH v4 00/24] vdso: Reject absolute relocations during build
Date: Tue, 12 Aug 2025 07:44:13 +0200
Message-Id: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK3UmmgC/23NTQrCMBCG4auUrI0kk7RpXXkPcZGfqQ2URpI2K
 NK7GwVRpMv3g3nmQRJGj4kcqgeJmH3yYSohdxWxg54uSL0rTYBBzSS0NLsUqDYpjMuMNOIYLNU
 ADXTCctVwUi6vEXt/e6unc+nBpznE+/tJ5q/143WbXuaU0a5VmunecWbq4+inZY5h8re9Q/IyM
 /w4gm07UJwae2uFsdJAs+WIr9Nwvu2I4kjVdsopoVpp/p11XZ/4YfWZSgEAAA==
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=4542;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sDpXnmBm5KPtwZhOpphGdEN7DYn98pmvrlCD54kPOyk=;
 b=F8W0Goo6R91Iz0mLdbkaVEXEi6NqkHjpz8K4uOJrCpNewCuaYX7400FmNfqyauYk9G9vfxPln
 QO8tldIHen+Dtqsaw7111LfaE5FavUHmtVgedZWUvqMPyN9fiN2z4ak
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224432_653405_1ACF2EDE 
X-CRM114-Status: GOOD (  12.42  )
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
dHMsCnNvIG1ha2UgdXNlciBvZiB0aGUga2VybmVscyBvd24gVUFQSSBoZWFkZXJzIGluc3RlYWQu
CgpLYnVpbGQgYW5kIFJ1c3QgZm9sa3M6IFRoaXMgY29udGFpbnMgY3VzdG9tIGRlZmluaXRpb25z
IG9mIGhvc3Rwcm9nCmJpbmRnZW4gYW5kIHJ1c3QgbGlicmFyeSBjb21tYW5kcy4KVGhlc2UgYXJl
IGN1cnJlbnRseSBvbmx5IGRlZmluZWQgaW5zaWRlIHRoZSBzdWJzeXN0ZW0gZGlyZWN0b3J5LgpM
ZXQgbWUga25vdyBpZiB0aGV5IHNob3VsZCBnbyBpbnRvIHNjcmlwdHMvTWFrZWZpbGUuaG9zdC4K
ClRoaXMgd2lsbCBjb25mbGljdCB3aXRoIG15IFNQQVJDNjQgZ2VuZXJpYyB2RFNPIHBhdGNoZXMg
WzBdLgpJZiBib3RoIGVuZCB1cCBiZWluZyBhcHBsaWVkIGF0IHRoZSBzYW1lIHRpbWUsIHBsZWFz
ZSBsZWF2ZSBvdXQgY29tbWl0IAondmRzby92ZHNvY2hlY2s6IERyb3AgdGhlIHRyYW5zaXRpb25h
bCBrY29uZmlnIG9wdGlvbicgZnJvbSB0aGlzIHNlcmllcy4KClswXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjUwNzI0LXZkc28tc3BhcmM2NC1nZW5lcmljLTItdjEtMC1lMzc2YTNi
ZDI0ZDFAbGludXRyb25peC5kZS8KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0
aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBSZXBs
YWNlIHRoZSBpbmxpbmUgc2hlbGwgbG9naWMgd2l0aCBhIGRlZGljYXRlZCBidWlsZC10aW1lIHRv
b2wKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNjExLXZkc28t
YWJzb2x1dGUtcmVsb2MtdjMtMC00Nzg5N2Q3Mzc4NGJAbGludXRyb25peC5kZQoKQ2hhbmdlcyBp
biB2MzoKLSBEcm9wIGFscmVhZHkgYXBwbGllZCBidWdmaXggZm9yIGFybTY0Ci0gRGlzYWJsZSBM
VE8gZm9yIHRoZSByaXNjdiB2RFNPLCBhcyBpdCBpcyBpbmNvbXBhdGlibGUKLSBMaW5rIHRvIHYy
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNDMwLXZkc28tYWJzb2x1dGUtcmVsb2Mt
djItMC01ZWZjYzNiYzRiMjZAbGludXRyb25peC5kZQoKQ2hhbmdlcyBpbiB2MjoKLSBMaW5rIHRv
IG9wZW5lbmQgKGludmFsaWQpIEdDQyBidWcgY29udGFpbmluZyBtb3JlIGV4cGxhbmF0aW9ucwot
IFJlZmluZSBjb21taXQgbWVzc2FnZXMKLSBEb24ndCBmYWlsIG9uIGNvbW1pdCBhYnNvbHV0ZSBy
ZWxvY2F0aW9ucyBpbiBkZWJ1ZyBpbmZvCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI1MDQyOS12ZHNvLWFic29sdXRlLXJlbG9jLXYxLTAtOTg3YTBhZmQxMGI1QGxp
bnV0cm9uaXguZGUKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMjQpOgogICAgICBlbGYsIHVhcGk6
IEFkZCBhIGhlYWRlciBmb3IgcmVsb2NhdGlvbiBjb25zdGFudHMKICAgICAgeDg2L2VsZiwgdW0v
eDg2L2VsZjogTW92ZSByZWxvY2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAgIEFSTTogZWxm
OiBNb3ZlIHJlbG9jYXRpb24gY29uc3RhbnRzIHRvIFVBUEkKICAgICAgYXJtNjQ6IGVsZjogTW92
ZSByZWxvY2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAgIHBvd2VycGMvZWxmOiBNb3ZlIHJl
bG9jYXRpb24gY29uc3RhbnRzIHRvIFVBUEkKICAgICAgcmlzY3Y6IGVsZjogTW92ZSByZWxvY2F0
aW9uIGNvbnN0YW50cyB0byBVQVBJCiAgICAgIExvb25nQXJjaDogTW92ZSByZWxvY2F0aW9uIGNv
bnN0YW50cyB0byBVQVBJCiAgICAgIHMzOTAvZWxmOiBNb3ZlIHJlbG9jYXRpb24gY29uc3RhbnRz
IHRvIFVBUEkKICAgICAgTUlQUzogRUxGOiBNb3ZlIHJlbG9jYXRpb24gY29uc3RhbnRzIHRvIFVB
UEkKICAgICAgdG9vbHMgaGVhZGVycyBVQVBJOiBTeW5jIEVMRiBoZWFkZXJzIHdpdGggdGhlIGtl
cm5lbCBzb3VyY2VzCiAgICAgIHZkc286IEFkZCB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgeDg2
L3Zkc286IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgQVJNOiB2ZHNvOiBFbmFibGUg
dGhlIHZkc29jaGVjayB0b29sCiAgICAgIGFybTY0OiB2ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVj
ayB0b29sCiAgICAgIHBvd2VycGMvZWxmOiBBZGQgMzItYml0IFJFTDE2IHJlbG9jYXRpb24gZGVm
aW5pdGlvbnMKICAgICAgcG93ZXJwYy92ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0b29sCiAg
ICAgIHJpc2N2OiB2ZHNvOiBEZWR1cGxpY2F0ZSBDRkxBR1NfUkVNT1ZFXyogdmFyaWFibGVzCiAg
ICAgIHJpc2N2OiB2ZHNvOiBEaXNhYmxlIExUTyBmb3IgdGhlIHZEU08KICAgICAgcmlzY3Y6IHZk
c286IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKICAgICAgTG9vbmdBcmNoOiB2RFNPOiBFbmFi
bGUgdGhlIHZkc29jaGVjayB0b29sCiAgICAgIHMzOTAvdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hl
Y2sgdG9vbAogICAgICBNSVBTOiBFTEY6IEFkZCBtb3JlIFBDLXJlbGF0aXZlIHJlbG9jYXRpb24g
ZGVmaW5pdGlvbnMKICAgICAgTUlQUzogdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAog
ICAgICB2ZHNvL3Zkc29jaGVjazogRHJvcCB0aGUgdHJhbnNpdGlvbmFsIGtjb25maWcgb3B0aW9u
CgogYXJjaC9hcm0vaW5jbHVkZS9hc20vZWxmLmggICAgICAgICAgfCAgMjQgLS0KIGFyY2gvYXJt
L3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICA0ICstCiBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2VsZi5oICAgICAgICB8ICA1NSAtLS0tCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2Vm
aWxlICAgICB8ICAgNCArLQogYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vZWxmLmggICAgfCAx
MDAgLS0tLS0tCiBhcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlICAgICAgICB8ICAgNCArLQog
YXJjaC9taXBzL2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICAgfCAgNTMgLS0tCiBhcmNoL21pcHMv
dmRzby9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgOCArLQogYXJjaC9wb3dlcnBjL2luY2x1ZGUv
dWFwaS9hc20vZWxmLmggfCAyMDEgLS0tLS0tLS0tLS0tCiBhcmNoL3Bvd2VycGMva2VybmVsL3Zk
c28vTWFrZWZpbGUgICB8ICAgNCArLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2VsZi5o
ICAgfCAgNjYgLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSAgICAgfCAgMTEg
Ky0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgIHwgIDgzIC0tLS0tCiBhcmNo
L3MzOTAva2VybmVsL3Zkc28zMi9NYWtlZmlsZSAgICB8ICAgNCArLQogYXJjaC9zMzkwL2tlcm5l
bC92ZHNvNjQvTWFrZWZpbGUgICAgfCAgIDQgKy0KIGFyY2gveDg2L2VudHJ5L3Zkc28vTWFrZWZp
bGUgICAgICAgIHwgICA2ICstCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgICB8
ICAzNCAtLQogYXJjaC94ODYvdW0vYXNtL2VsZi5oICAgICAgICAgICAgICAgfCAgMzMgLS0KIGlu
Y2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICAgICAgICAgIHwgNjMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgICAgICAg
fCAgIDEgKwogbGliL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogbGli
L3Zkc28vTWFrZWZpbGUuaW5jbHVkZSAgICAgICAgICAgfCAgMTcgKwogbGliL3Zkc28vY2hlY2sv
LmdpdGlnbm9yZSAgICAgICAgICAgfCAgIDMgKwogbGliL3Zkc28vY2hlY2svTWFrZWZpbGUgICAg
ICAgICAgICAgfCAgMjggKysKIGxpYi92ZHNvL2NoZWNrL2VsZi5ycyAgICAgICAgICAgICAgIHwg
NDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGxpYi92ZHNvL2NoZWNrL3Zkc29jaGVj
ay5ycyAgICAgICAgIHwgMjc5ICsrKysrKysrKysrKysrKysKIHRvb2xzL2luY2x1ZGUvdWFwaS9s
aW51eC9lbGYtZW0uaCAgIHwgIDcxICsrKysKIHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYt
ci5oICAgIHwgNjMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMv
aW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgfCAxMTIgKysrKysrLQogMjkgZmlsZXMgY2hh
bmdlZCwgMjI3NyBpbnNlcnRpb25zKCspLCA2ODQgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1p
dDogNTE4MGM2NTI2YWNjOWYxY2I1OGY4YjExZmJhNjc1ODNjMjJlMDg1NApjaGFuZ2UtaWQ6IDIw
MjUwNDI4LXZkc28tYWJzb2x1dGUtcmVsb2MtYTIyNjI5M2MxNzYxCgpCZXN0IHJlZ2FyZHMsCi0t
IApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
