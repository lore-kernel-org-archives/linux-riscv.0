Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B16C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMtayZT1DDXYurzzjhTg+5ngV0MBVqZuigH1w5Y0G0U=; b=hDuH3a/GqpXBzf
	cTfm2VczwF+gFvRl6UiSACx38hoJ8pypemKef9XuIqYtO3RuAjvltH8mmkO5t/LfdO0GHVSAQNpgx
	qkHPYHX9eDS8Sokl3V7edtXv0sMLRvXUzG+MpSA3YmJ1VhuXjQHs5T2bBwzw0jcEM/MC6Wq8iHjDM
	Rd0pDT4qzQpaxyEtS6n/dvW5wSa2Ab7PKWtTqW+D4nOexGURgruOqQ0L62ddQ2COhep6RWaxqKzS4
	YzfQIS1YH5uWjq0Jjpr7/iMiaC+JTs/camF7oNySXyAAgQkj3zW682Ey7GKmfr4JUgV0TKbWUXQ2b
	CIUpkQ3AADjm8o77mRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s1N-00000008YIT-05H9;
	Tue, 08 Sep 2026 09:21:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s1L-00000008YIE-0v38;
	Tue, 08 Sep 2026 09:21:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5366660A97;
	Tue,  8 Sep 2026 09:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E861F00A3A;
	Tue,  8 Sep 2026 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859298;
	bh=4k7jM/SARicUfiyID/Zb58FTA6TVrqfjgQqXrSbBJmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Xn9XtBCzNs8WX9mak5mpG8XRdy2i0zrbMydZ5LMlt1Qe6xYAL3LuxfUX8Atn2wQI5
	 1axnL/wqewpo705igfKNy8cNCn9+Zo3sUO5bgJKNWeixiHCJ40tMpOcHYPd0ztKnwc
	 thks3bDKvUFN5YfpBP21ImCqeVd4BuB9bshirgyOkT8qYPLl5IHF7GtOgYNVJtKM5z
	 OWEfgEV7HLlzD0xSV0FLDhASxeMC0R5k+YiWCZlY18vuOZyNV5jOxZq4lBnvbHCbuK
	 MWgRGux7fP8nPYbQvR4llwvXew14x5qlJam3L6qpRO9Kd3dID9dgWciFsi7Ok948U+
	 EV4LzEuy2wGQQ==
Message-ID: <9a27f318-2ab0-4f5e-8e87-daaa85dbc297@kernel.org>
Date: Tue, 8 Sep 2026 11:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/24] powerpc/elf: Add 32-bit REL16 relocation
 definitions
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-16-3a93791af1cf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-16-3a93791af1cf@linutronix.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwOC8wOS8yMDI2IMOgIDA4OjMzLCBUaG9tYXMgV2Vpw59zY2h1aCBhIMOpY3JpdMKgOgo+
IFRoZXNlIGFyZSB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgYXJlIG5lY2Vzc2FyeSBmb3IgdGhlIHZk
c29jaGVjayB0b29sLgo+IFRoZXkgc2hhcmUgdGhlIG51bWJlcnMgd2l0aCB0aGVpciA2NC1iaXQg
dmFyaWFudHMuCj4gCj4gQWxzbyB1cGRhdGUgdGhlIGNvcHkgaW4gdG9vbHMvIHNvIHRoZXkgY2Fu
IGJlIHVzZWQgYnkgdmRzb2NoZWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgKENTIEdST1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgIGlu
Y2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICAgICAgIHwgNyArKysrKystCj4gICB0b29scy9pbmNs
dWRlL3VhcGkvbGludXgvZWxmLXIuaCB8IDcgKysrKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgvZWxmLXIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCj4gaW5kZXgg
NzJmYzkwNDVhNWQ0Li4xNzA4ODg0MjI0MDAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L2VsZi1yLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvZWxmLXIuaAo+IEBAIC0xODIs
OCArMTgyLDEzIEBACj4gICAjZGVmaW5lIFJfUFBDX0dPVF9EVFBSRUwxNl9ISQk5MyAvKiBoYWxm
MTYqCShzeW0rYWRkKUBnb3RAZHRwcmVsQGggKi8KPiAgICNkZWZpbmUgUl9QUENfR09UX0RUUFJF
TDE2X0hBCTk0IC8qIGhhbGYxNioJKHN5bSthZGQpQGdvdEBkdHByZWxAaGEgKi8KPiAgIAo+ICsj
ZGVmaW5lIFJfUFBDX1JFTDE2CQkyNDkKPiArI2RlZmluZSBSX1BQQ19SRUwxNl9MTwkJMjUwCj4g
KyNkZWZpbmUgUl9QUENfUkVMMTZfSEkJCTI1MQo+ICsjZGVmaW5lIFJfUFBDX1JFTDE2X0hBCQky
NTIKPiArCj4gICAvKiBrZWVwIHRoaXMgdGhlIGxhc3QgZW50cnkuICovCj4gLSNkZWZpbmUgUl9Q
UENfTlVNCQk5NQo+ICsjZGVmaW5lIFJfUFBDX05VTQkJMjUzCj4gICAKPiAgIC8qIFBvd2VyUEM2
NCByZWxvY2F0aW9ucyBkZWZpbmVkIGJ5IHRoZSBBQklzICovCj4gICAjZGVmaW5lIFJfUFBDNjRf
Tk9ORSAgICBSX1BQQ19OT05FCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYtci5oIGIvdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1yLmgKPiBpbmRleCA3MmZj
OTA0NWE1ZDQuLjE3MDg4ODQyMjQwMCAxMDA2NDQKPiAtLS0gYS90b29scy9pbmNsdWRlL3VhcGkv
bGludXgvZWxmLXIuaAo+ICsrKyBiL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oCj4g
QEAgLTE4Miw4ICsxODIsMTMgQEAKPiAgICNkZWZpbmUgUl9QUENfR09UX0RUUFJFTDE2X0hJCTkz
IC8qIGhhbGYxNioJKHN5bSthZGQpQGdvdEBkdHByZWxAaCAqLwo+ICAgI2RlZmluZSBSX1BQQ19H
T1RfRFRQUkVMMTZfSEEJOTQgLyogaGFsZjE2Kgkoc3ltK2FkZClAZ290QGR0cHJlbEBoYSAqLwo+
ICAgCj4gKyNkZWZpbmUgUl9QUENfUkVMMTYJCTI0OQo+ICsjZGVmaW5lIFJfUFBDX1JFTDE2X0xP
CQkyNTAKPiArI2RlZmluZSBSX1BQQ19SRUwxNl9ISQkJMjUxCj4gKyNkZWZpbmUgUl9QUENfUkVM
MTZfSEEJCTI1Mgo+ICsKPiAgIC8qIGtlZXAgdGhpcyB0aGUgbGFzdCBlbnRyeS4gKi8KPiAtI2Rl
ZmluZSBSX1BQQ19OVU0JCTk1Cj4gKyNkZWZpbmUgUl9QUENfTlVNCQkyNTMKPiAgIAo+ICAgLyog
UG93ZXJQQzY0IHJlbG9jYXRpb25zIGRlZmluZWQgYnkgdGhlIEFCSXMgKi8KPiAgICNkZWZpbmUg
Ul9QUEM2NF9OT05FICAgIFJfUFBDX05PTkUKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
