Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD60C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjEm1Qt1gOt8AdPfhhJNdsUmONghMT0CKzlSst4qRsk=; b=4zaAJsnWO+eeYw
	XZwOyJHvY3k8MCXHoOqNaVsG3uXWimsY6Mziw5fxfAPJYbEcP7g7rnEnUwRo4vmK/PWsgCnViQiYy
	dBxhxmclBUNVl4uRCdEld7SbueTTdqxf+N0COWmDCmMDz08+iEGiK+egtzbL0OkInksvuBNG4fH46
	kKBfsw8FnO6T2nl840yZGKBScmrzwN/A96zNHpBbJcbcaDaPdSsM5599OeuJzrkD3SVVcLlBnufQE
	9EXVOMLCbDhZa5UyOghM9wOhENq+2Jt73a8598a2oI3nXPJwZl3Qkpf+t6MHj+OtLE8Q5a/DC6Hrf
	Bl0MokW6C/ulPsZCMPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhvO-00GYMv-1J;
	Fri, 08 Dec 2023 20:58:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhvM-00GYM2-0V
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 20:58:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso26048965e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702069093; x=1702673893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPbPGj/N+kFsGtRBn7sHjIbGBUsdMj/nlx3HBVB+JYE=;
        b=BEQ2A/njv+67QYz5vV3LbsyBkqo7vh0eCb5TCzL9N/FZoEr//2M8OFt0qcspM//7pI
         DiA+PJ62c81y70Rqr0QHmEDoOwlxDij2lfsBfpuNYJXStp+wO3ZUelzeJbBo8okvNZkh
         22QUg7w2fjz5jIYjcBFjepH1Vh8Qg5igCrn+nxRqh1sDkV6xdnwV7N1h4oYumPahDJxq
         Uo5aB2dgFJk3IaentdHWh7UtnGZX60HCtOgnu+sUdB8XOhMqM/n+C1uT4r/btrWKurKp
         j6ZqB55IuPrNxt2JiVnb1QWE/dbDZK/Na8Pz+hOwktXoJrryR6xvdC1QlVBvC5YZ82IM
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069093; x=1702673893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPbPGj/N+kFsGtRBn7sHjIbGBUsdMj/nlx3HBVB+JYE=;
        b=LEftrFgR/eX8XLQTWRMS+QziLq9ZHD6w0VmpzH7pgRDRlv6JisosWvPtvOGcJsZTQY
         WeIWmbYpz4Cp2sZ+cXEpjXTuuk4w/sFMmxCvJ8ukg4YTUBesKMZ0J9VI7FRCLlXxumPU
         1HTRXAg3xXx0V2XJ4wvA0KLiV9mT6vOVUMtWjmZpPEWpJ2uBOZGkGMkG9zaJHSk//j72
         QETqbvdBYPJWzM18G4TUhsAJvEoG4ClTGGrtSq/v6i9t3wB3vdmSB9+twQvdOJSvkNze
         Iey7CPrgbY5n7uU2AkYW76vffm3Y35xeg9j+p5VcNF/hcwceeeWsnPVSozxbJXNlzKPF
         7RIA==
X-Gm-Message-State: AOJu0YxbPmgTQnXPGRWYce8fmGgdH72cZWZMttScAG6/CA3k9XPExql7
	CwcJ+4KMQ3FPEcBJRxsn5cayFXZjudDp4780MZA=
X-Google-Smtp-Source: AGHT+IHEvTazMB26cXxqydUXzZjQ0E1EF3LcABQy94WqsbsZZavl6RKIzemfxTaf1pZCNseT7Ws4y7rzsk2OXl7MDFE=
X-Received: by 2002:a05:600c:2947:b0:40c:2954:5ad7 with SMTP id
 n7-20020a05600c294700b0040c29545ad7mr288834wmd.120.1702069092800; Fri, 08 Dec
 2023 12:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net> <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net> <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
 <20231208205241.GK28727@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208205241.GK28727@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:58:01 -0800
Message-ID: <CAADnVQL3KsJONShsstDq5jrpbc_4FOU-VQPJgDCt50N9asoFzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_125816_192775_908307FE 
X-CRM114-Status: GOOD (  19.07  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjo1MuKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAxMjo0MTow
M1BNIC0wODAwLCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gPiBPbiBGcmksIERlYyA4LCAy
MDIzIGF0IDEyOjM14oCvUE0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3
cm90ZToKPgo+ID4gPiAtX19icGZfa2Z1bmMgdm9pZCBicGZfdGFza19yZWxlYXNlKHN0cnVjdCB0
YXNrX3N0cnVjdCAqcCkKPiA+ID4gK19fYnBmX2tmdW5jIHZvaWQgYnBmX3Rhc2tfcmVsZWFzZSh2
b2lkICpwKQo+ID4KPiA+IFllYWguIFRoYXQgd29uJ3Qgd29yay4gV2UgbmVlZCBhIHdyYXBwZXIu
Cj4gPiBTaW5jZSBicGYgcHJvZyBpcyBhbHNvIGNhbGxpbmcgaXQgZGlyZWN0bHkuCj4gPiBJbiBw
cm9ncy90YXNrX2tmdW5jX2NvbW1vbi5oCj4gPiB2b2lkIGJwZl90YXNrX3JlbGVhc2Uoc3RydWN0
IHRhc2tfc3RydWN0ICpwKSBfX2tzeW07Cj4gPgo+ID4gdGhhbiBsYXRlciBib3RoIGxpYmJwZiBh
bmQgdGhlIHZlcmlmaWVyIGNoZWNrIHRoYXQKPiA+IHdoYXQgYnBmIHByb2cgaXMgY2FsbGluZyBh
Y3R1YWxseSBtYXRjaGVzIHRoZSBwcm90bwo+ID4gb2Ygd2hhdCBpcyBpbiB0aGUga2VybmVsLgo+
ID4gRWZmZWN0aXZlbHkgd2UncmUgZG9pbmcgc3Ryb25nIHByb3RvdHlwZSBjaGVjayBhdCBsb2Fk
IHRpbWUuCj4KPiBJJ20gc3RpbGwgc29tZXdoYXQgY29uZnVzZWQgb24gaG93IHRoaXMgd29ya3Ms
IHdoZXJlIGRvZXMgQlBGIGdldCB0aGUKPiBhZGRyZXNzIG9mIHRoZSBmdW5jdGlvbiBmcm9tPyBh
bmQgd2hhdCBzaG91bGQgSSBjYWxsIHRoZSB3cmFwcGVyPwoKSXQgc3RhcnRzIHdpdGgKcmVnaXN0
ZXJfYnRmX2lkX2R0b3Jfa2Z1bmNzKCkgdGhhdCB0YWtlcyBhIHNldCBvZiBidGZfaWRzOgp7YnRm
X2lkX29mX3R5cGUsIGJ0Zl9pZF9vZl9kdG9yX2Z1bmN0aW9ufSwgLi4uCgpUaGVuIGJhc2VkIG9u
IGJ0Zl9pZF9vZl9kdG9yX2Z1bmN0aW9uIHdlIGZpbmQgaXRzIHR5cGUgcHJvdG8sIG5hbWUsIGRv
IGNoZWNrcywKYW5kIGV2ZW50dWFsbHk6CmFkZHIgPSBrYWxsc3ltc19sb29rdXBfbmFtZShkdG9y
X2Z1bmNfbmFtZSk7CmZpZWxkLT5rcHRyLmR0b3IgPSAodm9pZCAqKWFkZHI7CgpicGZfdGFza19y
ZWxlYXNlKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCkgd291bGQgbmVlZCB0byBzdGF5IGFzLWlzLApi
dXQgd2UgY2FuIGhhdmUgYSB3cmFwcGVyCnZvaWQgYnBmX3Rhc2tfcmVsZWFzZV9kdG9yKHZvaWQg
KnApCnsKICBicGZfdGFza19yZWxlYXNlKHApOwp9CgpBbmQgYWRqdXN0IHRoZSBhYm92ZSBsb29r
dXAgd2l0aCBleHRyYSAiX2R0b3IiIHN1ZmZpeC4KCj4gPiBidHcgaW5zdGVhZCBvZiBFWFBPUlRf
U1lNQk9MX0dQTChicGZfdGFza19yZWxlYXNlKQo+ID4gY2FuIF9fQUREUkVTU0FCTEUgYmUgdXNl
ZCA/Cj4gPiBTaW5jZSBpdCdzIG5vdCBhbiBleHBvcnQgc3ltYm9sLgo+Cj4gTm8gX19BRERSRVNT
QUJMRSgpIGlzIGV4cHJlc3NseSBpZ25vcmVkLCBidXQgd2UgaGF2ZSBJQlRfTk9TRUFMKCkgdGhh
dAo+IHNob3VsZCBkbyBpdC4gSSdsbCByZW5hbWUgdGhlIHRoaW5nIGFuZCBsaWZ0IGl0IG91dCBv
ZiB4ODYgdG8gYXZvaWQKPiBicmVha2luZyBhbGwgb3RoZXIgYXJjaCBidWlsZHMuCgpNYWtlcyBz
ZW5zZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
