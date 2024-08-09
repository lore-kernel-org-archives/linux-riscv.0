Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCACC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 18:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wo/vDhkr7cUAZRE9YMEgEKSj5qz0aeO477OyG3/ufi4=; b=SQamzAPKFafAYh
	s/Ypgg/V6L7hYhzkkJ2dDvrABj0DPIDKmeyiDI8uQ8IOQBrfKHU2MaGWgnyc9lCiDYPcnQheRBSDi
	FlL6reqfY7+qlknTJo7vDRGcjo22x1BTjFwBtdi1mjI0BijWd7sDohEC9nxaUct/jMR5Ryl9v3K14
	+g2JSp6b0oBye/S/Hn5DJL7S8OMz8EMv250Ot8Lwz2eJjWi9faMWS6qnUSQqWiiBHkoZmtVXnwlG3
	zCTQajejDC7WFuuAapYbb3m8TDe56eCc7VtP7QAagf6hHwDv9GcTcDBSJr0f7/2QvKiMv6qcEY2hE
	7OaHeLjpVx+QbGQqsKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUF2-0000000CC4A-16EE;
	Fri, 09 Aug 2024 18:21:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUEz-0000000CC2U-079F
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 18:21:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-36868fcb919so1418770f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723227683; x=1723832483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=0PD0BN9olQW8dNOBN/m5HkSIvKer7pHc08Icjn6MXTPHboehziR+pPQGzYFcrXNw72
         41iIRfGlmxQOIrgx2HfiJ2jZ8lBqnI+n6Pe945Agf9UfS4NjBQLJSAVkjRmTDZ9bU1wc
         fhP5QzQKG8thHbMfe46+U2soAIWVTF0X2MUNsmJgkohHUmXnRSVTj09mPOv/jl0g6euj
         qho8k4UuxBKcUbYkSHueqI3ND4TcQaSSyr/yqgHq2efbtbPT2MliYQaQUOKQHMQJKEGW
         5S8yns/ITigV9DSKp4KIeaukKiibvDyV5GVCi3r5cLdHNDH4xbcjdXNgVIooyJkuFBS8
         gUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723227683; x=1723832483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=vd8uaqa4Hh/uYJvQ/DVKT1mi+3KcK6WxgBFB1JuAAqjwdntPc1o32MyHA6RJks1S80
         8PCjLI17DvsPyFFm6hp/0qm4RdmHJ9lD05TgpP6S+RzxAWOdtLjhEmJcuYFbvO8HmmyV
         WyQNFz6MAV9w9OCm7wOOgGF4ShDrRTwxtyHWo39iLxwOyLOfUS3A9NkjkICn3oDqSYKY
         qdeurg1KVPM7xvOSHcUFqdid2INPaOFW29B8ubHim2WdGSnoUQ+JhlQzcahYhzdLlAvy
         LFSXeCW+SQPtnIn/m8RNY1AQGq/0cnXi8Xm6ouA/IsKK0kJcmuXxH7quNTTjsLo2eTuz
         H4dg==
X-Forwarded-Encrypted: i=1; AJvYcCXlrf6iAtd/Nyx+WPDZL3x3o5RhGGQf2xkCsrV9mkJqOp3caquApNLvoofD2qjMJ97C8v7uYOujXj/PGy3R7XZGMqvVVlkIAPEYm5OLF0G0
X-Gm-Message-State: AOJu0YxOy1HqDhuRvl0u6i0D8eM8sLFAfuPuUkbMgHSjPodLszaHjFRQ
	vy3s3RLITUo+UJMNWkqnYV4qXvntIIZvyOgnfwjoI7xb1ju7409kQOd7x4humpXKqhpJoPSN9Ji
	x490xKCxaSO54l3kF2Swhm9W7iTW5FLtW+CFv
X-Google-Smtp-Source: AGHT+IH5Ep/88bbCWZXRUVBPEQ+tzupqROr5HmyaRJfMyZWiEj8it63tIiOzqdgNyDMpwvhyZfPAAiV2XhcMqLgvZrs=
X-Received: by 2002:a5d:4642:0:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-36d5ff6f35bmr1589390f8f.34.1723227683079; Fri, 09 Aug 2024
 11:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-1-a23f800f1189@google.com> <20240809191601.3d15e3af.gary@garyguo.net>
In-Reply-To: <20240809191601.3d15e3af.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Aug 2024 20:21:10 +0200
Message-ID: <CAH5fLgi7dy9PV+YfCJuVoH98M0z2FUnOAjBoFKkqyG8P9iPSEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] rust: add generic static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240809_112129_135708_3553D31E 
X-CRM114-Status: GOOD (  29.10  )
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

T24gRnJpLCBBdWcgOSwgMjAyNCBhdCA4OjE24oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gT24gVGh1LCAwOCBBdWcgMjAyNCAxNzoyMzozNyArMDAwMAo+IEFsaWNl
IFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZToKPgo+ID4gQWRkIGp1c3QgZW5vdWdo
IHN1cHBvcnQgZm9yIHN0YXRpYyBrZXkgc28gdGhhdCB3ZSBjYW4gdXNlIGl0IGZyb20KPiA+IHRy
YWNlcG9pbnRzLiBUcmFjZXBvaW50cyByZWx5IG9uIGBzdGF0aWNfa2V5X2ZhbHNlYCBldmVuIHRo
b3VnaCBpdCBpcwo+ID4gZGVwcmVjYXRlZCwgc28gd2UgYWRkIHRoZSBzYW1lIGZ1bmN0aW9uYWxp
dHkgdG8gUnVzdC4KPiA+Cj4gPiBUaGlzIHBhdGNoIG9ubHkgcHJvdmlkZXMgYSBnZW5lcmljIGlt
cGxlbWVudGF0aW9uIHdpdGhvdXQgY29kZSBwYXRjaGluZwo+ID4gKG1hdGNoaW5nIHRoZSBvbmUg
dXNlZCB3aGVuIENPTkZJR19KVU1QX0xBQkVMIGlzIGRpc2FibGVkKS4gTGF0ZXIKPiA+IHBhdGNo
ZXMgYWRkIHN1cHBvcnQgZm9yIGlubGluZSBhc20gaW1wbGVtZW50YXRpb25zIHRoYXQgdXNlIHJ1
bnRpbWUKPiA+IHBhdGNoaW5nLgo+ID4KPiA+IFdoZW4gQ09ORklHX0pVTVBfTEFCRUwgaXMgdW5z
ZXQsIGBzdGF0aWNfa2V5X2NvdW50YCBpcyBhIHN0YXRpYyBpbmxpbmUKPiA+IGZ1bmN0aW9uLCBz
byBhIFJ1c3QgaGVscGVyIGlzIGRlZmluZWQgZm9yIGBzdGF0aWNfa2V5X2NvdW50YCBpbiB0aGlz
Cj4gPiBjYXNlLiBJZiBSdXN0IGlzIGNvbXBpbGVkIHdpdGggTFRPLCB0aGlzIGNhbGwgc2hvdWxk
IGdldCBpbmxpbmVkLiBUaGUKPiA+IGhlbHBlciBjYW4gYmUgZWxpbWluYXRlZCBvbmNlIHdlIGhh
dmUgdGhlIG5lY2Vzc2FyeSBpbmxpbmUgYXNtIHRvIG1ha2UKPiA+IGF0b21pYyBvcGVyYXRpb25z
IGZyb20gUnVzdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIHJ1c3QvYmluZGluZ3MvYmluZGluZ3NfaGVscGVyLmgg
ICAgICAgfCAgMSArCj4gPiAgcnVzdC9oZWxwZXJzLmMgICAgICAgICAgICAgICAgICAgICAgICB8
ICA5ICsrKysrKysrKwo+ID4gIHJ1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMg
fCAgMSArCj4gPiAgcnVzdC9rZXJuZWwvanVtcF9sYWJlbC5ycyAgICAgICAgICAgICB8IDI5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgcnVzdC9rZXJuZWwvbGliLnJzICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcnVzdC9rZXJuZWwvYXJjaF9zdGF0aWNfYnJhbmNoX2Fz
bS5ycyBiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjk1OGYxZjEzMDQ1NQo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvcnVzdC9rZXJuZWwvYXJjaF9zdGF0aWNfYnJhbmNoX2FzbS5y
cwo+ID4gQEAgLTAsMCArMSBAQAo+ID4gKzo6a2VybmVsOjpjb25jYXRfbGl0ZXJhbHMhKCIxOiBq
bXAgIiAie2xfeWVzfSIgIiAjIG9ianRvb2wgTk9QcyB0aGlzIFxuXHQiICIucHVzaHNlY3Rpb24g
X19qdW1wX3RhYmxlLCAgXCJhd1wiIFxuXHQiICIgIiAiLmJhbGlnbiA4IiAiICIgIlxuXHQiICIu
bG9uZyAxYiAtIC4gXG5cdCIgIi5sb25nICIgIntsX3llc30iICItIC4gXG5cdCIgIiAiICIucXVh
ZCIgIiAiICIgIiAie3N5bWJ9ICsge29mZn0gKyB7YnJhbmNofSIgIiAtIC4gXG5cdCIgIi5wb3Bz
ZWN0aW9uIFxuXHQiKQo+Cj4KPiBJIGJlbGlldmUgdGhpcyBmaWxlIGlzIGluY2x1ZGVkIGJ5IG1p
c3Rha2UsIGdpdmVuIGl0J3MgYWRkZWQgdG8KPiBnaXRpZ25vcmUgaW4gcGF0Y2ggNS4KCldlIG1h
eSBoYXZlIHRvIHJldGhpbmsgdGhlIGZpbGUgZXh0ZW5zaW9uIHVzZWQgaGVyZS4gWW91IGhhdmUg
bm8gaWRlYQpob3cgbWFueSB0aW1lcyBJJ3ZlIGRlbGV0ZWQgdGhhdCBmaWxlIGZyb20gdGhpcyBj
b21taXQuCgpBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
