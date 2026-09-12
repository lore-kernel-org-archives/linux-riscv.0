Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A116C88E53
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efEJx9J1aS7Me7NQWsYdF/ncXLebJYPsSRVqku5VzPw=; b=qbggiMEBLBAdYB
	hp+ueNi5qs2qfP9SB09eOOkHlWzEp3VZKb30GFs4YAuWfCA2W+jUK290JqC28e0QZtoBTUBeuLZax
	B+FKhPXXibKG6bZ7lGK1/dd43FTnsgmPmrxcZRTdtaZ42rucdSFSW6HZz5dkYzRqww3FJQeVv16UV
	TGuoLXgtDfDY9XHzK8zGDjlrVhqn4spEWSlc5o1c/qeI6JrJXRjdNfr48VmyB3LWVTpxpW57LjZSN
	o231WMJN0Ej2dZBZV72F3MPcO59KtNc7W1bL2k1NxBfjeMSwen9/4eVdIS+xpkoG3i9S/Hwchxa/V
	WuTe8GSFksB82OFo/Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5MGL-00000000qn0-0tHp;
	Sat, 12 Sep 2026 11:51:17 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5MGH-00000000qmT-3GcI;
	Sat, 12 Sep 2026 11:51:15 +0000
Received: from [IPV6:2a01:e0a:125c:c670:72c:339f:43cb:52bb] (unknown [IPv6:2a01:e0a:125c:c670:72c:339f:43cb:52bb])
	(Authenticated sender: ydroneaud@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id E93ED6012F;
	Sat, 12 Sep 2026 13:50:01 +0200 (CEST)
Message-ID: <4e447b33-574e-425e-bc92-2b728128cf18@droneaud.fr>
Date: Sat, 12 Sep 2026 13:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] modpost: perform srcversion hashing in parallel
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Yann Droneaud <yann@droneaud.fr>
In-Reply-To: <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_045113_978703_61B68CDC 
X-CRM114-Status: GOOD (  15.25  )
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

SGksCgpMZSAwOC8wOS8yMDI2IMOgIDIyOjU1LCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgYSDDqWNy
aXTCoDoKPiBtb2Rwb3N0IGRvZXMgYSBsb3Qgb2Ygc2luZ2xlLXRocmVhZGVkIHdvcmsgaGFzaGlu
ZyBmaWxlcyBmcm9tIGVhY2ggb2JqZWN0J3MKPiAuY21kIGZpbGUuCj4KPiBUaGlzIG1ha2VzIHRo
ZSBidWlsZCBzbG93ZXIgdGhhbiBpdCBuZWVkcyB0byBiZSwgc28gZG8gdGhpcyB3b3JrIGluCj4g
cGFyYWxsZWwuCgoKSWYgeW91J3JlIGdvaW5nIHBhcmFsbGVsLCBpdCB3b3VsZCBiZSBuaWNlciB0
byBkbyBpdCB1bmRlciBtYWtlJ3MgCmpvYnNlcnZlciBzdXBlcnZpc2lvbi4KCgo+IFRoaXMgaXMg
ZWdyZWdpb3VzIGZvciBhbGxtb2Rjb25maWcgYnVpbGRzIC0gZm9yIGluc3RhbmNlIHg4Ni02NCBj
YW4gZW5kIHVwCj4gb3BlbmluZyAyMDAsMDAwIGZpbGVzIGluZGl2aWR1YWxseSBhbmQgaGFzaGlu
ZyB0aGVtIGFsbCBzZXJpYWxseS4KPgo+IFBhcmFsbGVsaXNlIHRoaXMgb3BlcmF0aW9uIGJ5IG1h
aW50YWluaW5nIGEgdGhyZWFkIHBvb2wgZm9yIHRoZSBoYXNoaW5nCj4gd29yay4KPgo+IENvbWJp
bmVkIHdpdGggdGhlIHBlci1maWxlIGhhc2hpbmcgY29tbWl0IHRoaXMgY3V0cyBtb2Rwb3N0J3Mg
cnVuIHRpbWUKPiBuZWFybHkgaW4gaGFsZiBmb3IgYW4gYWxsbW9kY29uZmlnIGJ1aWxkLgo+Cj4g
TW9kdWxlLnN5bXZlcnMgYW5kIGV2ZXJ5ICoubW9kLlMgYXJlIGJ5dGUgZm9yIGJ5dGUgdGhlIHNh
bWUuCj4KPiBtb2Rwb3N0IGlzIG9uIHRoZSBzZXJpYWwgdGFpbCBvZiBldmVyeSBhbGxtb2Rjb25m
aWcgYnVpbGQsIGhvd2V2ZXIKPiBkZWZjb25maWcgZG9lcyBub3Qgc2V0IENPTkZJR19NT0RVTEVf
U1JDVkVSU0lPTl9BTEwgYW5kIGlzIHVuY2hhbmdlZC4KPgo+IFdob2xlIGJ1aWxkLCAxMjgtdGhy
ZWFkIFRocmVhZHJpcHBlciA5OTgwWCwgYmVzdCBvZiBOIHJ1bnM6Cj4KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiZWZvcmUgICBhZnRlciAgICAgZGVsdGEKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gICAgeDg2IGFsbG1vZGNvbmZpZywgdG91Y2ggbW0vdm1hLmMsIGdj
YyAgICAzMy40cyAgICAzMC4ycyAgICAgLTMuMnMgKC0xMCUpCj4gICAgeDg2IGFsbG1vZGNvbmZp
ZywgdG91Y2ggbW0vdm1hLmMsIGNsYW5nICAzMS4xcyAgICAyOC4xcyAgICAgLTMuMHMgKC0xMCUp
Cj4KPiBBc3Npc3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KPiAtLS0KPiAgIHNjcmlwdHMvbW9kL01ha2VmaWxlICAgICB8
ICAxICsKPiAgIHNjcmlwdHMvbW9kL21vZHBvc3QuYyAgICB8IDcyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAgc2NyaXB0cy9tb2QvbW9kcG9zdC5o
ICAgIHwgIDIgKysKPiAgIHNjcmlwdHMvbW9kL3N1bXZlcnNpb24uYyB8ICAzICstCj4gICA0IGZp
bGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KClJlZ2FyZHMu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
