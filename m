Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13844C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOjMiRoR8qqGmUwoVYmOxNUjY28mLNeSAJ7n322ZTIs=; b=xZJituvdEBdKLl
	XGwypETwCT1YrSBAxAUbdHeswQjqpYInGu2FYYIWgbB/Wt+GviweSq3DtbS5U0n9BPPqbbde8rNKM
	eq/nlydJ58zOhuDBzPORt87FnClRnRBubZc2DPwMVfToId5GBP+UNndVMkKqCdO/3lqB9v557WjCr
	4VxkM0eFM6PKyokeOhGomJlIHY/kKSl3X4z9GGgeAKIRCWWlIFEstg/RVtkJy+pS4fg88p7Sn1Z4o
	dqQDex6dvEDXdWMlsfKmtbcfWUnAkpwVoaX+4rmfKGD4hdVnljVggnosymcRfZzKS6dXbP1z1sUAO
	AJEPIKkrPk/qX7AJSoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZGxt-00000002bIi-2XEY;
	Wed, 31 Jul 2024 21:34:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZGxr-00000002bHY-0BqS
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 21:34:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42809d6e719so41581115e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 14:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722461665; x=1723066465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bli9lhI61IaRjVxZ6El/2TlE2JOrlJn5Lbi96Tzc1cY=;
        b=KV2l83M27CXEJ1ND2yZ5WaW5pHUw4ZSyIfV08ATaPOJFyFOXRGG5m57HLW31AXObYH
         uqZplKmtWYm7uOBvZoP9okfIKeCSJ568WWT/ZVIb066iVvvKOo8AyG4PRiMXHa6BlET2
         4qoZNs9d/WziHkC0RSHHD37ZLGyE2SuFZ6MJ+xxuKGQ0BOrbLmS6ppdRRy7n0gRFfduV
         gebEtv8yxpFi3cGM4RTVguT2CCKvAn9RD+sczjM4Mz7LsSezAGYfWU6cHXzTdZTu1Dxm
         Z0enUdNiKUkhVJDJnpTgYCgH8MD9WeZYxoWYepP4WCCjzTzWW0p5RDAUcoaRIMy2xL9e
         tPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722461665; x=1723066465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bli9lhI61IaRjVxZ6El/2TlE2JOrlJn5Lbi96Tzc1cY=;
        b=Bx0P8dvmIrlGEzAmCuTeGh++y14vu5UDYLNj8AL/tP2ypfK4jPva19WMs1WZwI2XCx
         yK2jKc3Yk3YsS72x/o5sE63D1ZQQcJ2BSvgfzmrGc5NV0JGxBfYOjtzd+/DBmzxV1noL
         0I71GIeB8eDIwbUkKqCjHb5fsApLcgibbe736ky5ooSQhd2/g9ORh3XoxzgD7qmWINtT
         rtyrpfNHdyij2fLVMyl3GjVwd46pLpYjM2+gadgTzE3xbiVZbItrAwnbrQKjhWTjr233
         LRJqPNYTy6ghIa/UF6Mzhmfz+J7nj10ULH1aaoioU3tlbAPgFyKnHmkOsYLmiVhisVub
         lJFA==
X-Forwarded-Encrypted: i=1; AJvYcCUIhfocXOF5aNIx7tBwg1CoYOEadCQ2sJ77bsjkc5yCye2z+RjMiPGxMShWh03fyh4QnTKSktitUVxF42jELGUCUFhD7Z6RzqVLDtwVmbaN
X-Gm-Message-State: AOJu0YzZgkQq+KbMkYEpvD6wbJC4F4S/RELLH/LeV3r4QyIP+r4dwYrU
	pTILl9i4UpDsvnnnaXlrmHA13V/+E0KCeoksXLDBwVOA6R8hXUeU7nHs4hFG48z6NC7dHwJHVZN
	N5Hssw3fNtq9GfwxJfHI7+s0TvFkqpEr1HydT
X-Google-Smtp-Source: AGHT+IEnnH7Vl1oPP/7poRoKnYi3pQkDBFhO+xnBb/MH3dLIwjkKyZ7/ziEU66uYwoK2Ox4X3gDKYbUA6wyDWgsUmeg=
X-Received: by 2002:a05:600c:3543:b0:426:6ee7:c05a with SMTP id
 5b1f17b1804b1-428a9bdcd50mr4067365e9.15.1722461664765; Wed, 31 Jul 2024
 14:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
 <20240628-tracepoint-v4-1-353d523a9c15@google.com> <20240731170508.GJ33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240731170508.GJ33588@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 23:34:13 +0200
Message-ID: <CAH5fLghYodekhH-1A0BWZVwgbqkWbP3WP70-us2FtHqvOqD_Hw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240731_143431_111118_A2B78940 
X-CRM114-Status: GOOD (  26.37  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNzowNeKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyOCwgMjAyNCBhdCAwMToyMzoz
MVBNICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOgo+Cj4gPiAgcnVzdC9rZXJuZWwvYXJjaC9hcm02
NC9qdW1wX2xhYmVsLnJzICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICBydXN0L2tlcm5lbC9hcmNoL2xvb25nYXJjaC9qdW1wX2xhYmVsLnJzIHwgMzUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBydXN0L2tlcm5lbC9hcmNoL21vZC5ycyAgICAgICAg
ICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysKPiA+ICBydXN0L2tlcm5lbC9hcmNo
L3Jpc2N2L2p1bXBfbGFiZWwucnMgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ICBydXN0L2tlcm5lbC9hcmNoL3g4Ni9qdW1wX2xhYmVsLnJzICAgICAgIHwgMzUg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBydXN0L2tlcm5lbC9saWIucnMgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ICBydXN0L2tlcm5lbC9zdGF0aWNfa2V5LnJz
ICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgc2Ny
aXB0cy9NYWtlZmlsZS5idWlsZCAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgOCBmaWxl
cyBjaGFuZ2VkLCAyMDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gU28gSSByZWFs
bHkgZmluZCB0aGUgYW1vdW50IG9mIGR1cGxpY2F0ZWQgYXNtIG9mZmVuc2l2ZS4gSXMgaXMgZmFy
IHRvbwo+IGVhc3kgZm9yIGFueSBvZiB0aGlzIHRvIGdldCBvdXQgb2Ygc3luYy4KPgo+ID4gZGlm
ZiAtLWdpdCBhL3J1c3Qva2VybmVsL2FyY2gveDg2L2p1bXBfbGFiZWwucnMgYi9ydXN0L2tlcm5l
bC9hcmNoL3g4Ni9qdW1wX2xhYmVsLnJzCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4zODNiZWQyNzNjNTAKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L3J1c3Qva2VybmVsL2FyY2gveDg2L2p1bXBfbGFiZWwucnMKPiA+IEBAIC0wLDAgKzEsMzUgQEAK
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKwo+ID4gKy8vIENv
cHlyaWdodCAoQykgMjAyNCBHb29nbGUgTExDLgo+ID4gKwo+ID4gKy8vISBYODYgUnVzdCBpbXBs
ZW1lbnRhdGlvbiBvZiBqdW1wX2xhYmVsLmgKPiA+ICsKPiA+ICsvLy8geDg2IGltcGxlbWVudGF0
aW9uIG9mIGFyY2hfc3RhdGljX2JyYW5jaAo+ID4gKyNbbWFjcm9fZXhwb3J0XQo+ID4gKyNbY2Zn
KHRhcmdldF9hcmNoID0gIng4Nl82NCIpXQo+ID4gK21hY3JvX3J1bGVzISBhcmNoX3N0YXRpY19i
cmFuY2ggewo+ID4gKyAgICAoJGtleTpwYXRoLCAka2V5dHlwOnR5LCAkZmllbGQ6aWRlbnQsICRi
cmFuY2g6ZXhwcikgPT4geydteV9sYWJlbDogewo+ID4gKyAgICAgICAgY29yZTo6YXJjaDo6YXNt
ISgKPiA+ICsgICAgICAgICAgICByIyIKPiA+ICsgICAgICAgICAgICAxOiAuYnl0ZSAweDBmLDB4
MWYsMHg0NCwweDAwLDB4MDAKPiA+ICsKPiA+ICsgICAgICAgICAgICAucHVzaHNlY3Rpb24gX19q
dW1wX3RhYmxlLCAgImF3Igo+ID4gKyAgICAgICAgICAgIC5iYWxpZ24gOAo+ID4gKyAgICAgICAg
ICAgIC5sb25nIDFiIC0gLgo+ID4gKyAgICAgICAgICAgIC5sb25nIHswfSAtIC4KPiA+ICsgICAg
ICAgICAgICAucXVhZCB7MX0gKyB7Mn0gKyB7M30gLSAuCj4gPiArICAgICAgICAgICAgLnBvcHNl
Y3Rpb24KPiA+ICsgICAgICAgICAgICAiIywKPiA+ICsgICAgICAgICAgICBsYWJlbCB7Cj4gPiAr
ICAgICAgICAgICAgICAgIGJyZWFrICdteV9sYWJlbCB0cnVlOwo+ID4gKyAgICAgICAgICAgIH0s
Cj4gPiArICAgICAgICAgICAgc3ltICRrZXksCj4gPiArICAgICAgICAgICAgY29uc3QgOjpjb3Jl
OjptZW06Om9mZnNldF9vZiEoJGtleXR5cCwgJGZpZWxkKSwKPiA+ICsgICAgICAgICAgICBjb25z
dCAkY3JhdGU6OmFyY2g6OmJvb2xfdG9faW50KCRicmFuY2gpLAo+ID4gKyAgICAgICAgKTsKPiA+
ICsKPiA+ICsgICAgICAgIGJyZWFrICdteV9sYWJlbCBmYWxzZTsKPiA+ICsgICAgfX07Cj4gPiAr
fQo+Cj4gTm90ZSB0aGF0IHRoaXMgdXNlcyB0aGUgZm9yY2VkIDUgYnl0ZSB2ZXJzaW9uLCBhbmQg
bm90IHRoZSBkeW5hbWljIHNpemVkCj4gb25lLiBPbiB0b3Agb2YgdGhhdCBpdCBoYXJkLWNvZGVz
IHRoZSBub3A1IHN0cmluZyA6Lwo+Cj4gUGxlYXNlIHdvcmsgaGFyZGVyIHRvIG5vdCBoYXZlIHRv
IGR1cGxpY2F0ZSBzdHVmZiBsaWtlIHRoaXMuCgpJIHJlYWxseSBkaWRuJ3Qgd2FudCB0byBkdXBs
aWNhdGUgaXQsIGJ1dCBpdCdzIHZlcnkgaGFyZCB0byBmaW5kIGEKcGVyZm9ybWFudCBhbHRlcm5h
dGl2ZS4gSXMgdGhlcmUgYW55IHdheSB3ZSBjb3VsZCBhY2NlcHQgZHVwbGljYXRpb24Kb25seSBp
biB0aGUgY2FzZXMgd2hlcmUgYW4gJ2knIHBhcmFtZXRlciBpcyB1c2VkPyBJIGRvbid0IGhhdmUg
dGhlCmNob2ljZSBvZiB1c2luZyBhIFJ1c3QgaGVscGVyIGZvciAnaScgcGFyYW1ldGVycy4KClBl
cmhhcHMgb25lIG9wdGlvbiBjb3VsZCBiZSB0byBwdXQgdGhlIFJ1c3QgY29kZSBpbnNpZGUganVt
cF9sYWJlbC5oCmFuZCBoYXZlIHRoZSBoZWFkZXIgZmlsZSBldmFsdWF0ZSB0byBlaXRoZXIgQyBv
ciBSdXN0IGRlcGVuZGluZyBvbiB0aGUKdmFsdWUgb2Ygc29tZSAjaWZkZWZzPwoKI2lmbmRlZiBS
VVNUX0FTTQovKiBleGlzdGluZyBDIGNvZGUgZ29lcyBoZXJlICovCiNlbmRpZgojaWZkZWYgUlVT
VF9BU00KLy8gcnVzdCBjb2RlIGdvZXMgaGVyZQojZW5kaWYKClRoYXQgd2F5IHRoZSBkdXBsaWNh
dGlvbiBpcyBhbGwgaW4gYSBzaW5nbGUgZmlsZS4gSXQgd291bGQgYWxzbyBhdm9pZAp0aGUgbmVl
ZCBmb3IgZHVwbGljYXRpbmcgdGhlIG5vcDUgc3RyaW5nLCBhcyB0aGUgUnVzdCBjYXNlIGlzIHN0
aWxsCmdvaW5nIHRocm91Z2ggdGhlIEMgcHJlcHJvY2Vzc29yIGFuZCBjYW4gdXNlIHRoZSBleGlz
dGluZyAjZGVmaW5lLgoKSSdtIGFsc28gb3BlbiB0byBvdGhlciBhbHRlcm5hdGl2ZXMuIEJ1dCBJ
IGRvbid0IGhhdmUgaW5maW5pdGUKcmVzb3VyY2VzIHRvIGRyaXZlIG1ham9yIGxhbmd1YWdlIGNo
YW5nZXMuCgpBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
