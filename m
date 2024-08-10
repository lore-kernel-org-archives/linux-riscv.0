Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101A1C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Atqy2XOj5KwtcBw8AwbT0qzvb8daSfneqK4HDvbRlA0=; b=3/FYJHKftV+Lzo
	IBGHHkDni89ur/iC/lDJCyk+SYiJ/KB2D3HrNZR1QhhwR3GPb7YestWTlzT0h1CyKZa108ueFlD5c
	f2Ln7It9ONW92/1pzGRbclfIeS9RTQGvdFum1iUxL0e/eI5386oqnmi2Gi0w68a7Z+CYgVaUqS1DL
	1dkYaV36TYbywBX0w445AJO5gC8farEzKvDQXg4cJnIXEY8lK65kZhFTQExf0mqYFKdwDpNwCA9dd
	t2AaR0SLE29do/ehxUxv8gjMpn1AZ7SkyOguK0CCNi9fnorqGssFm30oH6FJf5uldgdzHnBAHvDll
	OM3sjcvrVbsG4M5REZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scu5n-0000000Eepi-0EUv;
	Sat, 10 Aug 2024 21:57:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scu5k-0000000EepX-0YWa;
	Sat, 10 Aug 2024 21:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nv4fvDJIpIyu7ak6kOoHUmIFrheca8Dy1SaM5jKCQBw=; b=CchIcJEStTW3QCkJIHj3lmbQSu
	xf8QRZuNWJlB+wiL4FjeZvZPIThB4Ijc0mM3hrLuBpq04UhU0FgjYhY5g+dpNedWesJl/kIsq8PhD
	46rKuujxcgXCnAxFBmMNymWw/hO2A3FCudxNbjaD4fCOmNlJstMjZd+q8S0/9M/yadBGQNda4Jgez
	AnAKJfcys04AoLltQB+0vwatNC0cvDq9lezZgRPkWapjL8nHIgOTMB5dzFqmOAZy9gk7CO+vhkM/3
	LQvyL68QUnRLtiufKuwckn1MBeRo8wa1YS/BpFT0AvfTq64ilA7JxP2ll5q6O3H3ZmH4w9JN6bmlN
	134UCeEQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scu5R-00000007G0f-2ye9;
	Sat, 10 Aug 2024 21:57:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6FDB5300729; Sat, 10 Aug 2024 23:57:20 +0200 (CEST)
Date: Sat, 10 Aug 2024 23:57:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 5/5] rust: add arch_static_branch
Message-ID: <20240810215720.GH11646@noisy.programming.kicks-ass.net>
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-5-a23f800f1189@google.com>
 <20240810210359.GD11646@noisy.programming.kicks-ass.net>
 <CAH5fLggwLOhP_6b==dc73uJCUBcu2fNQ7SCnqovv2hVXFtUHEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLggwLOhP_6b==dc73uJCUBcu2fNQ7SCnqovv2hVXFtUHEQ@mail.gmail.com>
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

T24gU2F0LCBBdWcgMTAsIDIwMjQgYXQgMTE6NDQ6MTNQTSArMDIwMCwgQWxpY2UgUnlobCB3cm90
ZToKPiBPbiBTYXQsIEF1ZyAxMCwgMjAyNCBhdCAxMTowNOKAr1BNIFBldGVyIFppamxzdHJhIDxw
ZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBBdWcgMDgsIDIwMjQg
YXQgMDU6MjM6NDFQTSArMDAwMCwgQWxpY2UgUnlobCB3cm90ZToKPiA+Cj4gPiA+ICsvLy8gV3Jh
cHBlciBhcm91bmQgYGFzbSFgIHRoYXQgdXNlcyBhdCZ0IHN5bnRheCBvbiB4ODYuCj4gPiA+ICsv
LyBVc2VzIGEgc2VtaWNvbG9uIHRvIGF2b2lkIHBhcnNpbmcgYW1iaWd1aXRpZXMsIGV2ZW4gdGhv
dWdoIHRoaXMgZG9lcyBub3QgbWF0Y2ggbmF0aXZlIGBhc20hYAo+ID4gPiArLy8gc3ludGF4Lgo+
ID4gPiArI1tjZmcodGFyZ2V0X2FyY2ggPSAieDg2XzY0IildCj4gPiA+ICsjW21hY3JvX2V4cG9y
dF0KPiA+ID4gK21hY3JvX3J1bGVzISBhc20gewo+ID4gPiArICAgICgkKCRhc206ZXhwciksKiA7
ICQoJHJlc3Q6dHQpKikgPT4gewo+ID4gPiArICAgICAgICA6OmNvcmU6OmFyY2g6OmFzbSEoICQo
JGFzbSkqLCBvcHRpb25zKGF0dF9zeW50YXgpLCAkKCRyZXN0KSogKQo+ID4gPiArICAgIH07Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gKy8vLyBXcmFwcGVyIGFyb3VuZCBgYXNtIWAgdGhhdCB1c2Vz
IGF0JnQgc3ludGF4IG9uIHg4Ni4KPiA+Cj4gPiBeIHRoZSBhYm92ZSBsaW5lIHNlZW1zIG91dCBv
ZiBwbGFjZSBnaXZlbiB0aGUgJ25vdCcgYmVsb3cuCj4gCj4gQ29tbWVudHMgd2l0aCB0aHJlZSBz
bGFzaGVzIGFyZSB3aGF0IGdldHMgcmVuZGVyZWQgaW4gdGhlIGh0bWwgdmVyc2lvbgo+IG9mIHRo
ZSBkb2NzIFsxXS4gVGhpcyB3YXksIHRoZSByZW5kZXJlZCBkb2NzIHdpbGwgc2F5IHRoYXQgdGhl
IGBhc20hYAo+IG1hY3JvIGlzIGEgd3JhcHBlciBhcm91bmQgdGhlIGJ1aWx0LWluIGBhc20hYCB0
aGF0IHVzZXMgYXQmdCBzeW50YXggb24KPiB4ODYgcmVnYXJkbGVzcyBvZiB3aGljaCBwbGF0Zm9y
bSB5b3UgYnVpbGQgdGhlIGRvY3Mgb24uCj4gCgpVcmdoLCB0aGF0J3Mgbm90IGhhbGYtd2F5IGNv
bmZ1c2luZy4gQWxzbywgd2hvZXZlciB3YW50cyB0byByZWFkIEhUTUwKd2hlbiB5b3UgYWxyZWFk
eSBoYXZlIHRoZSBjb2RlIG9wZW4gaW4geW91ciB0ZXh0LWVkaXRvcj8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
