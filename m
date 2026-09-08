Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D1EC79FA0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEG2+5D6b96l5yw0Pd1cBv6pzU6BJykIWytq1oJ79W4=; b=CP6/NbaVIervfG
	a9qEzIwIWDpkjmau9GqZV3QgLBFe8fe5SNebqfsG02xtJK7WjdCUEUNf3WkyjsAH8JCl5pyBjAyXx
	cSyep1p4YSbuSsHkXJWrjU92rgrjNzp7UG2ES/Q0PP3I+iXUEYeXyHt593VpK883MvYWk+xfhPtke
	3ZdbYjGCBoCAk2aaKY0zetzujORr5CZ0VvsQR4E/e9HtD98rmiBe11X2jkRjLSUzWKTs4vWdaFo4R
	tgohKCU6NhL9BG5j2hCR2nQfXUG6u68HCphEYhDEb8cSEZsr5c+kfCQcFZ3QG/E85j5kqueA+fvob
	Z0lZmHjX8z+FPN8s9FCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rqE-00000008WZZ-1qum;
	Tue, 08 Sep 2026 09:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rqB-00000008WYb-0kS8;
	Tue, 08 Sep 2026 09:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8375160A98;
	Tue,  8 Sep 2026 09:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569471F00A3A;
	Tue,  8 Sep 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858606;
	bh=R0gSNJNsFiBELJzc2W3yE5oEemx5pk46RuJIr17mKUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DAE45L0Ti7ZzN2J9EggKEpXt9EOFC/xe7EhCLBEAgKZ1EKM0gpJTm6lUAH9Rv1Y/l
	 Qb9gt8wqAJzrDQsE15lcnh+2LUSKHF7Y85tsfXTkApAmKRChoYKRr7LNH1NO5zCDxA
	 DgSV71bDNblo942RePIiEaOET6DD2BAm6jQXNwGXYyYXCVrrPfTDwooEAWl2+nKYnh
	 ROImd7jwopGGxZDYzhcgEHbseuZcsu9rqsTTi0oEx18R978jIBC68KJY6GiEvY9ucn
	 ZPViZj8X62xbMqmZxsQcKY9LdenN66zHgBKx4TLNgSPHoQy5QHpClKrY1uem3vgjH+
	 BNFhyDw3+tpqw==
Message-ID: <41c824f9-aa04-49a4-9d0a-9ffba7b014b4@kernel.org>
Date: Tue, 8 Sep 2026 11:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/24] tools headers UAPI: Sync ELF headers with the
 kernel sources
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
 <20260908-vdso-absolute-reloc-v5-11-3a93791af1cf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260908-vdso-absolute-reloc-v5-11-3a93791af1cf@linutronix.de>
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
IFBpY2sgdXAgY2hhbmdlcyBmcm9tIHRoZSBVQVBJIEVMRiBoZWFkZXIgZmlsZXMuCj4gVGhpcyBw
aWNrcyB1cCBnZW5lcmFsIGNoYW5nZXMgdG8gZWxmLmgsIGVsZi1lbS5oIHdoaWNoIHdhcyBmb3Jn
b3R0ZW4KPiBwcmV2aW91c2x5IGFuZCB0aGUgbmV3IGVsZi1yLmguCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Cj4g
Cj4gLS0tCj4gQ2M6IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRoYXQuY29tPgo+
IC0tLQo+ICAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1lbS5oIHwgIDcxICsrKysKPiAg
IHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICB8IDY5NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5o
ICAgIHwgMTEyICsrKysrLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA4NjggaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYtZW0uaCBiL3Rvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtZW0uaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lZjM4YzJiYzVhYjcKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi1lbS5oCj4gQEAgLTAs
MCArMSw3MSBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExp
bnV4LXN5c2NhbGwtbm90ZSAqLwo+ICsjaWZuZGVmIF9MSU5VWF9FTEZfRU1fSAo+ICsjZGVmaW5l
IF9MSU5VWF9FTEZfRU1fSAo+ICsKPiArLyogVGhlc2UgY29uc3RhbnRzIGRlZmluZSB0aGUgdmFy
aW91cyBFTEYgdGFyZ2V0IG1hY2hpbmVzICovCj4gKyNkZWZpbmUgRU1fTk9ORQkJMAo+ICsjZGVm
aW5lIEVNX00zMgkJMQo+ICsjZGVmaW5lIEVNX1NQQVJDCTIKPiArI2RlZmluZSBFTV8zODYJCTMK
PiArI2RlZmluZSBFTV82OEsJCTQKPiArI2RlZmluZSBFTV84OEsJCTUKPiArI2RlZmluZSBFTV80
ODYJCTYJLyogUGVyaGFwcyBkaXN1c2VkICovCj4gKyNkZWZpbmUgRU1fODYwCQk3CgpBZGQgYSBj
b21tZW50IHRoYXQgaXQgaXMgLyogSW50ZWwgODA4NjAgKi8gdG8gYXZvaWQgY29uZnVzaW9uIHdp
dGggCnBvd2VycGMgODYwCgo+ICsjZGVmaW5lIEVNX01JUFMJCTgJLyogTUlQUyBSMzAwMCAob2Zm
aWNpYWxseSwgYmlnLWVuZGlhbiBvbmx5KSAqLwo+ICsJCQkJLyogTmV4dCB0d28gYXJlIGhpc3Rv
cmljYWwgYW5kIGJpbmFyaWVzIGFuZAo+ICsJCQkJICAgbW9kdWxlcyBvZiB0aGVzZSB0eXBlcyB3
aWxsIGJlIHJlamVjdGVkIGJ5Cj4gKwkJCQkgICBMaW51eC4gICovCj4gKyNkZWZpbmUgRU1fTUlQ
U19SUzNfTEUJMTAJLyogTUlQUyBSMzAwMCBsaXR0bGUtZW5kaWFuICovCj4gKyNkZWZpbmUgRU1f
TUlQU19SUzRfQkUJMTAJLyogTUlQUyBSNDAwMCBiaWctZW5kaWFuICovCj4gKwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
