Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D93BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC8lljDkKXj5t3tmG5+zTz6gtYtiK5fuSAXQdov7oCM=; b=JE2lUSGIMfI41h
	PPmaqRgIkyzCVkGanqIIVqC2Q7t3BLEsRAFC4EUs62hjNNyyH/3QxYciFHT4EeeiPsRdtkW7OsFv5
	MCDlZ1+nBPuutJUKEm0H+BFg/onZbS9DppcKarBwlSKD74xPnNnPKqV1VqC6u+rq4UdU+zVX2AXUJ
	JaE7AXMs/DF0HXDxzsYYxap9WVkxILrUKOXJFEnslmSOf62w2sclgmVKubQv6Zor9ST4QGu6uh+1l
	mXoSbny+t9I5t67nvuUxPGUZgrmiYDfmKNpGOtVqSPAN3zjyWs5Qif+tgXz72wX3YYLkxbWaDVJog
	P4jMs/fuhe0V0A+M9JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaVw-00000006No1-0caV;
	Thu, 01 Aug 2024 18:27:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaVs-00000006Nmq-3UYf
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:26:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3684407b2deso3681211f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722536815; x=1723141615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GkfD0g8hTHOTE05py9mAwmf1QYzZu9yR2OS6+zzI80=;
        b=ppZwe+iBR44RX2zhQbq8wrB+37m6SksThbYi8aGI4oh91afH64347QeQPdMM5wUKcI
         m3V2I54a+mFPdsEX2B9oJbpwnUu+Ue3KgyiuMzyW9KzYVh4mgIZJCkuJ5RWsgfLruKuC
         fkw5WETZ56SIoQcPiePPo6l6SJJHahrvOHemsgMo/LdzAPJ+UwBhcQLzGm76PRHO0SHd
         syFG9ilS7ug5J+yyHUxzL7c1L6OyYspqP533KYQCIBmo7fZXCJ1A2B3Y6PS5IsCsqwWL
         y1TTK/8iXAb1AkaY7VMOSO8zvL+3HGno/p6oKKMODyDu746io5g0hiD4aa4laHQ2Z7rD
         ce8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722536815; x=1723141615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GkfD0g8hTHOTE05py9mAwmf1QYzZu9yR2OS6+zzI80=;
        b=bokFBCfLfNURzgrQvrvD3xDKjBK1xfJEJej4euqBEpUDRr2888hDhgnVeoFiSxgSmU
         71ZKI6rm+mBQ0eQRuLspQ5uFRlFXVFDt3Ui2O/mVzXVNF8Ch7sSQYVEZzYnq9eAnjqQf
         44TRgdyD8QSewvn3vfN3OHzBV0CNcYp6D5doRYSfquJVOXtd8/TCjFJlS6cdt/MuRNie
         EQNZcAaZiWu0QlZgxOQudZyn9Urjn1CXSHg6o3CF7zyc9GZDm8bE3QOH+WZOye4Rbs+1
         yvITObLKM2JUaprAYpV/svOAAwszkq3WzU082ISYHBjOFPPT9Fd82BKpW9XpeXwW7+Am
         q2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUDewK1yRaqNH0pnrYJPzHd34AUGljlAlYj+cZRgADGG9ceA/BppU5lbEMttOD63/Pu4ynwnGVNsJr23pF2uIZ4ZTiIwkhd9//B67y/Ek
X-Gm-Message-State: AOJu0YyGt5zYN4hPnSIByvCfULKdX3riHJLj3m0JMLR2WUoGPqCrYkTf
	frHN9AoNRJgTTwrMeYkU9J65PyJAvpk3s01mkGW8oNFfUV/n2nqPCtdaZPOz/C9K9tztzXaC9NU
	p8Xponhn59fPGnspGMopWXqf2LEE9Wu7jQVmT
X-Google-Smtp-Source: AGHT+IGwaGkw42I/amAH0IQd6LdSV/vkI/phXZAUV/1lm1vKxK6jNhFtpwWWcpoa+ZqQDQpJUtDs/GFofzfYgLUeu2Q=
X-Received: by 2002:adf:a356:0:b0:368:3895:67d6 with SMTP id
 ffacd0b85a97d-36bbc0cbe69mr533475f8f.20.1722536814320; Thu, 01 Aug 2024
 11:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
 <20240628-tracepoint-v4-1-353d523a9c15@google.com> <20240731170508.GJ33588@noisy.programming.kicks-ass.net>
 <CAH5fLghYodekhH-1A0BWZVwgbqkWbP3WP70-us2FtHqvOqD_Hw@mail.gmail.com> <20240801102804.GQ33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240801102804.GQ33588@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 20:26:42 +0200
Message-ID: <CAH5fLgiOe1ECCwE1cwczsT13iPyymdUTbV-9ZHeDrp_OGq5FgQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: add static_key_false
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, 
	Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_112656_898468_4DCAE018 
X-CRM114-Status: GOOD (  24.35  )
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

T24gVGh1LCBBdWcgMSwgMjAyNCBhdCAxMjoyOOKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAzMSwgMjAyNCBhdCAxMTozNDox
M1BNICswMjAwLCBBbGljZSBSeWhsIHdyb3RlOgo+Cj4gPiA+IFBsZWFzZSB3b3JrIGhhcmRlciB0
byBub3QgaGF2ZSB0byBkdXBsaWNhdGUgc3R1ZmYgbGlrZSB0aGlzLgo+ID4KPiA+IEkgcmVhbGx5
IGRpZG4ndCB3YW50IHRvIGR1cGxpY2F0ZSBpdCwgYnV0IGl0J3MgdmVyeSBoYXJkIHRvIGZpbmQg
YQo+ID4gcGVyZm9ybWFudCBhbHRlcm5hdGl2ZS4gSXMgdGhlcmUgYW55IHdheSB3ZSBjb3VsZCBh
Y2NlcHQgZHVwbGljYXRpb24KPiA+IG9ubHkgaW4gdGhlIGNhc2VzIHdoZXJlIGFuICdpJyBwYXJh
bWV0ZXIgaXMgdXNlZD8gSSBkb24ndCBoYXZlIHRoZQo+ID4gY2hvaWNlIG9mIHVzaW5nIGEgUnVz
dCBoZWxwZXIgZm9yICdpJyBwYXJhbWV0ZXJzLgo+ID4KPiA+IFBlcmhhcHMgb25lIG9wdGlvbiBj
b3VsZCBiZSB0byBwdXQgdGhlIFJ1c3QgY29kZSBpbnNpZGUganVtcF9sYWJlbC5oCj4gPiBhbmQg
aGF2ZSB0aGUgaGVhZGVyIGZpbGUgZXZhbHVhdGUgdG8gZWl0aGVyIEMgb3IgUnVzdCBkZXBlbmRp
bmcgb24gdGhlCj4gPiB2YWx1ZSBvZiBzb21lICNpZmRlZnM/Cj4gPgo+ID4gI2lmbmRlZiBSVVNU
X0FTTQo+ID4gLyogZXhpc3RpbmcgQyBjb2RlIGdvZXMgaGVyZSAqLwo+ID4gI2VuZGlmCj4gPiAj
aWZkZWYgUlVTVF9BU00KPiA+IC8vIHJ1c3QgY29kZSBnb2VzIGhlcmUKPiA+ICNlbmRpZgo+ID4K
PiA+IFRoYXQgd2F5IHRoZSBkdXBsaWNhdGlvbiBpcyBhbGwgaW4gYSBzaW5nbGUgZmlsZS4gSXQg
d291bGQgYWxzbyBhdm9pZAo+ID4gdGhlIG5lZWQgZm9yIGR1cGxpY2F0aW5nIHRoZSBub3A1IHN0
cmluZywgYXMgdGhlIFJ1c3QgY2FzZSBpcyBzdGlsbAo+ID4gZ29pbmcgdGhyb3VnaCB0aGUgQyBw
cmVwcm9jZXNzb3IgYW5kIGNhbiB1c2UgdGhlIGV4aXN0aW5nICNkZWZpbmUuCj4KPiBJIHN1cHBv
c2UgdGhhdCBpcyBzbGlnaHRseSBiZXR0ZXIsIGJ1dCBpZGVhbGx5IHlvdSBnZW5lcmF0ZSB0aGUg
d2hvbGUgb2YKPiB0aGUgUnVzdCB0aGluZyBmcm9tIHRoZSBDIHZlcnNpb24uIEFmdGVyIGFsbCwg
Q2xhbmcgY2FuIGFscmVhZHkgcGFyc2UKPiB0aGlzLgo+Cj4gVGhhdCBzYWlkLCB3aXRoIHRoZSBi
ZWxvdyBwYXRjaCwgSSB0aGluayB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gcmV1c2UgdGhlCj4gSlVN
UF9UQUJMRV9FTlRSWSBtYWNybyBsaWtlOgo+Cj4gICAgICAgICBKVU1QX1RBQkxFX0VOVFJZKHsw
fSwgezF9LCB7Mn0gKyB7M30pCgpZZWFoLCBJIHRoaW5rIHRoaXMgY2FuIHdvcmsuIEkgd2lsbCBz
dWJtaXQgYSBmb2xsb3ctdXAgcGF0Y2ggdGhhdApyZW1vdmVzIHRoZSBkdXBsaWNhdGlvbiBzb29u
LgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
