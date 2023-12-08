Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF15C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DR6ODWxtKBLiE/+/QBvsOt+JrQuNNq95LgoO8rlAA8=; b=OiPiwv2rElCFAc
	sX/qMpf8eHcQEyG0EBwTHCdzJgDmMffokPjCM6ImMq0Owms7+qJTmR0FyePxwFW/fM7pYh2Puvhah
	PbPeb030EsZcYF843zk9YWGwQQ1rntpgsd5cniGhbCEXFgAYUKUQjvfmhV4tSdkq8WnRoEUNrzTYn
	trRIQLfy/1ygfqOrDJckpMH+sgI4eItQivQsNUjnZbK8XK6bjeSsd7nnctbcKOZbkMjaLQLEXk7BP
	eZHsUPlAtHeSVPI5jHgg3ukv9c7Q0NZ1eqeqL5MjsWTBPUbqLBMj9DWLc9BSiX3JHt1SbNAIX+tCf
	Q/YuLalE7+aAE6mu4EVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhjd-00GXAw-38;
	Fri, 08 Dec 2023 20:46:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhjb-00GX9L-0M
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 20:46:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so2271965f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 12:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702068363; x=1702673163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlXQF//AUsnwP+nKFBoybb7LMYNoRVOQuSpa/LCcRfc=;
        b=YnSgFEQGqUsimncu6lPuHcV0SXbVrR3zJSzuUPfnWIQUGy3yfIkLzO9trFSBmBPlBl
         seGn8L6H8jr0kX9UL4A6HGerN0Ljl0EqG0OIA2RUTMLuMoy8cTGqcuGIYqI6xodS6ulZ
         BqUYqpOnk02OdtMMfFAk9UKuox7OfVqEVNSGiB/UawmtnS1MVrPqPNiTnymlAdZ7k/mr
         JNPLg+xEjN/PTKl/37ECYSrjIH3jrrWQaNpnvAHsVQhPDKWYM+OZqPSMaxC8jZ4WPeTl
         wPKmU+MnhF92YaQXpvBo6CfF44rsuH1/vTJqelmPV+dCWn4K0jzj8ZPDKLreNgrtAYic
         ZTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702068363; x=1702673163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlXQF//AUsnwP+nKFBoybb7LMYNoRVOQuSpa/LCcRfc=;
        b=BOa6MUO83l7ebNsG6iuvNqkRihbwLU7r1vBFVjZKMfN5ABdGY35Dm7M4QXRnmoy4kq
         qGrqWyP0ZGWvvJ7ZYUkMI1T5oZDY4a10BSdNQqM8d8xeshfQT1UjPYRQ6tE1dQLqUGfc
         3GUtOO5Jj6VzYaICVRVj27D9j2C1bZ/vULJgl2fgDJZfrEpBpIRBGHycsrh9ZV7+sDhB
         NjXGWXC5lrTcCCkWiYqua3L5diP8raARYXNTfKgtRDymGsSr+V0mqr9cncqpb0s/W17b
         OAbxgbpwRfQa7CO9wsYn95Diuucbu4X/U4huWE4geJaEE6i9kgEgJ2gRpe15PToTPIsO
         mZ5A==
X-Gm-Message-State: AOJu0YyO5t8EI01oxEs5NuEqqONonf1o5JZRqP6SBa58gAo1QCoG/org
	CV65/2VsYrvqdQUpTM3mYAGTVOorS8/FZrbHu+8=
X-Google-Smtp-Source: AGHT+IE4sHBb5/cNR7lbKXUMWA7pBzCk+Azp42Xup3bWyH2dubUwP/oKuFvKD+DnRI3AEHKgZH07K+Gk15b7iovJNI8=
X-Received: by 2002:a5d:457b:0:b0:333:129d:239 with SMTP id
 a27-20020a5d457b000000b00333129d0239mr393721wrc.0.1702068362601; Fri, 08 Dec
 2023 12:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
 <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com> <20231208201819.GE36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208201819.GE36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:45:51 -0800
Message-ID: <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231208_124607_149313_574A284C 
X-CRM114-Status: GOOD (  22.74  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjoxOOKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAxMTozMjow
N0FNIC0wODAwLCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gPiBPbiBGcmksIERlYyA4LCAy
MDIzIGF0IDU6NDHigK9BTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAxMToyOTo0MEFNICswMTAw
LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+ID4gPiBUaGUgb25seSBwcm9ibGVtIEkgbm93IGhh
dmUgaXMgdGhlIG9uZSBYWFgsIEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0Cj4gPiA+ID4gc2ln
bmF0dXJlIHRvIHVzZSB0aGVyZS4KPiA+ID4KPiA+ID4gPiBAQCAtMTE5LDYgKzExOSw3IEBAIGlu
dCBicGZfc3RydWN0X29wc190ZXN0X3J1bihzdHJ1Y3QgYnBmX3AKPiA+ID4gPiAgICAgICBvcF9p
ZHggPSBwcm9nLT5leHBlY3RlZF9hdHRhY2hfdHlwZTsKPiA+ID4gPiAgICAgICBlcnIgPSBicGZf
c3RydWN0X29wc19wcmVwYXJlX3RyYW1wb2xpbmUodGxpbmtzLCBsaW5rLAo+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3Rfb3BzLT5mdW5jX21v
ZGVsc1tvcF9pZHhdLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiBYWFggKi8gTlVMTCwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW1hZ2UsIGltYWdlICsgUEFHRV9TSVpFKTsKPiA+ID4g
PiAgICAgICBpZiAoZXJyIDwgMCkKPiA+ID4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4g
Pgo+ID4gPiBEdWgsIHRoYXQgc2hvdWxkIG9mY291cnNlIGJlIHNvbWV0aGluZyBvZiBkdW1teV9v
cHNfdGVzdF9yZXRfZm4gdHlwZS4KPiA+ID4gTGV0IG1lIGdvIGZpeCB0aGF0Lgo+ID4KPiA+IFJp
Z2h0LiBUaGF0IHNob3VsZCB3b3JrLgo+ID4gQSBiaXQgd2FzdGVmdWwgdG8gZ2VuZXJhdGUgcmVh
bCBjb2RlIGp1c3QgdG8gcmVhZCBoYXNoIGZyb20gaXQKPiA+IHZpYSBjZmlfZ2V0X2Z1bmNfaGFz
aCgpLCBidXQgaXQncyBhIG5lYXQgaWRlYS4KPgo+IFJpZ2h0LCBiaXQgd2FzdGVmdWwuIEJ1dCB0
aGUgYWR2YW50YWdlIGlzIHRoYXQgSSBnZXQgYSBzdHJ1Y3R1cmUgd2l0aAo+IHBvaW50ZXJzIHRo
YXQgZXhhY3RseSBtaXJyb3JzIHRoZSBzdHJ1Y3R1cmUgd2UncmUgd3JpdGluZy4KPgo+ID4gSSBn
dWVzcyBpdCdzIGhhcmQgdG8gZ2V0IGtjZmkgZnJvbSBfX0FERFJFU1NBQkxFIGluIHBsYWluIEMK
PiA+IGFuZCBzcHJpbmtsaW5nIGFzbSgiY2ZpX3h4eDogLmxvbmcgICBfX2tjZmlfdHlwZWlkLi4u
Iik7IGlzIHdvcnNlPwo+ID4gRXZlbiBpZiBpdCdzIGEgbWFjcm8gPwo+Cj4gSSBjYW4gdHJ5IHRo
aXMsIGJ1dCBJJ20gbm90IHN1cmUgaXQnbGwgYmUgcHJldHR5LiBFdmVuIGlmIEkgd3JhcCBpdCBp
biBhCj4gZGVjZW50IG1hY3JvLCBJIHN0aWxsIGdldCB0byBkZWZpbmUgYSB0b24gb2YgdmFyaWFi
bGVzIGFuZCB0aGVuIHdyYXAgdGhlCj4gbG90IGludG8gYSBzdHJ1Y3R1cmUgLS0gb25lIHRoYXQg
ZXhwZWN0cyBmdW5jdGlvbiBwb2ludGVycy4KPgo+IEknbGwgc2VlIGhvdyBob3JyaWJsZSBpdCB3
aWxsIGJlY29tZS4KCkkgbWVhbiB3ZSBkb24ndCBuZWVkIHRvIHN0b3JlIGEgcG9pbnRlciB0byBh
IGZ1bmMgaW4gc3R1YnMuCkNhbiBpdCBiZSwgcm91Z2hseToKCmV4dGVybiB2b2lkIGJwZl90Y3Bf
Y2FfY29uZ19hdm9pZChzdHJ1Y3Qgc29jayAqc2ssIHUzMiBhY2ssIHUzMiBhY2tlZCk7CktDRklf
TUFDUk8oaGFzaF9vZl9jb25nX2F2b2lkLCBicGZfdGNwX2NhX2NvbmdfYXZvaWQpOwp1MzIgX19h
cnJheV9vZl9rY2ZpX2hhc2hbXSA9IHtoYXNoX29mX2NvbmdfYXZvaWQsIGhhc2hfb2Zfc2V0X3N0
YXRlLC4uLn07CiAgICAgIC5icGZfb3BzX3N0dWJzID0gX19hcnJheV9vZl9rY2ZpX2hhc2gsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
