Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28266C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 19:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB1I42CcOKwogx3qrl7Em9EoErOOk/NqxqrbbwrCvFQ=; b=sRwhLG0JK2eqch
	GvM31QBkW/v4TGRuQy2BOS8AYWP68kpw/kGWif5Zxgc1KCt2otiDe8+SF6jtRpt2cbe+6GDVMi2/l
	B+x3gLnBc8Rws/T9a2F++JKv9ggK8Ts5pZyrnNFK4utWmw543k8M39t4W6WC7UBp5Or+YGTU7OcUR
	5Wb/B2vihecuaSaFjafAOzZXyTIJeHxDorkMKvjN2q0ZsaNd7+IbJPVawyBO2SPfsKYnfAktgmu/M
	RNVj2gOhGkGssixCgDoLsblc5gM1NcSjP5CTKtjLhlhFgZFZ9FMFNay4vR8Y86tH88ZXksYJebMpR
	WAk0Fbo87t45KVRcXLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgiI-00GPcU-1M;
	Fri, 08 Dec 2023 19:40:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgiG-00GPbr-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 19:40:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3332f1512e8so2206028f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702064438; x=1702669238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGqhfgnTbLSQhTQ1bMee6eK6lcK7c6hE95qruhtgvEk=;
        b=Yl6aJSHt643nNnaptL5KfWYNMHLBwDDhZb2ilFQHYoNGB0nacjisMp2d0ChTWjL+OK
         WpiUYNPEEUkrNeW3OoFrJAFnn8XjZFxAHQdKz+sWPuM0n4upvEa8eeDTm1d5XXP6e2+F
         cAiFD3upS9mbtZucB7IHgjiFyXdlZoW6HFDeIEu7xURLBtsJa+WaF3Xa3tSC8ZabP18O
         LGKJY0e3rh6FWFYIINZcJcT5Nl0tKO2pjaLRsLXrUZHVy5E1BmYfm6GpSiqsBi3L6Wo5
         pfr6DNmI+QUOZdmX//0qeMlJo9Tu7RLsVorNVH/3yZX1Z8qhK/yTPw1cUMhPBH0u4Mok
         bwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702064438; x=1702669238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGqhfgnTbLSQhTQ1bMee6eK6lcK7c6hE95qruhtgvEk=;
        b=XdCJalhNmObjCu+uZaja7RIxUr6IQOX3Kgp6KNvkAeSU1BaDkDigUT7wS/yRAq2jWe
         ZIYmazqdy4Bg8wc+ApuGgqMwwcKrUh/7o7W8t9QeFJLKoyxDfEriv+PEES9Rj7zTQouF
         6uAV6On/9gU/RZwISMpqDKHBieq4/TQQ4oFLUC27ON8S4JbSvT3VgmRnMYziAZzouwNG
         rMWl+/+nSv47n8tkfJIlQKkdG+b0Xm2t0QnOC9edczSLh5OIGrymteGVuke0Y73+OwLv
         6oy5WCn7MjKc2dBlff85xfewvL5Km/DvwP186IKR36jmCHEjZNAoE7lc8Olo4eFNd4PJ
         eq8w==
X-Gm-Message-State: AOJu0YzCNCmtsrwMeYcdJBz0UcTNCS90mwMCLJ50A3+rvovaQqsUyaCR
	p+zqB4Ctb2DmOBxJ1P0BkkJMXPgN76Cs4JQX0p4=
X-Google-Smtp-Source: AGHT+IHt0AOwYtDELssGf1Db4Jmn3pjjJiojkcuC4s+RabiD4a0X0j4NeWSW3wWlhqFCkvQtOof9Rit1N2UOiD+eLQA=
X-Received: by 2002:a05:6000:543:b0:333:381d:6a26 with SMTP id
 b3-20020a056000054300b00333381d6a26mr334324wrf.135.1702064438187; Fri, 08 Dec
 2023 11:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20231204181614.GA7299@noisy.programming.kicks-ass.net>
 <20231204183354.GC7299@noisy.programming.kicks-ass.net> <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208172152.GD36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 11:40:27 -0800
Message-ID: <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231208_114040_170970_47D4019D 
X-CRM114-Status: GOOD (  19.66  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCA5OjIy4oCvQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAyOjQwOjQx
UE0gKzAxMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMDgsIDIwMjMg
YXQgMTE6Mjk6NDBBTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+IFRoZSBvbmx5
IHByb2JsZW0gSSBub3cgaGF2ZSBpcyB0aGUgb25lIFhYWCwgSSdtIG5vdCBlbnRpcmVseSBzdXJl
IHdoYXQKPiA+ID4gc2lnbmF0dXJlIHRvIHVzZSB0aGVyZS4KPiA+Cj4gPiA+IEBAIC0xMTksNiAr
MTE5LDcgQEAgaW50IGJwZl9zdHJ1Y3Rfb3BzX3Rlc3RfcnVuKHN0cnVjdCBicGZfcAo+ID4gPiAg
ICAgb3BfaWR4ID0gcHJvZy0+ZXhwZWN0ZWRfYXR0YWNoX3R5cGU7Cj4gPiA+ICAgICBlcnIgPSBi
cGZfc3RydWN0X29wc19wcmVwYXJlX3RyYW1wb2xpbmUodGxpbmtzLCBsaW5rLAo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdF9vcHMtPmZ1bmNfbW9k
ZWxzW29wX2lkeF0sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogWFhYICovIE5VTEwsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW1hZ2UsIGltYWdlICsgUEFHRV9TSVpFKTsKPiA+ID4gICAgIGlmIChl
cnIgPCAwKQo+ID4gPiAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Cj4gPiBEdWgsIHRoYXQgc2hv
dWxkIG9mY291cnNlIGJlIHNvbWV0aGluZyBvZiBkdW1teV9vcHNfdGVzdF9yZXRfZm4gdHlwZS4K
PiA+IExldCBtZSBnbyBmaXggdGhhdC4KPgo+IE5leHQgb25lLi4gYnBmX29ial9mcmVlX2ZpZWxk
czogZmllbGQtPmtwdHIuZHRvcih4Y2hnX2ZpZWxkKTsKPgo+IFRoZSBvbmUgdGhhdCB0cmlwcyBp
cyBicGZfY2dyb3VwX3JlbGVhc2UoKS4KPgo+IG9ianRvb2wgZG9lc24ndCB0aGluayB0aGUgYWRk
cmVzcyBvZiB0aGF0IGZ1bmN0aW9uICdlc2NhcGVzJyBhbmQKPiAnaGVscGZ1bGx5JyBzZWFscyB0
aGF0IGZ1bmN0aW9uLCBhbmQgdGhlbiBCUEYgdGhpbmtzIGl0IGRvZXMgZXNjYXBlIGFuZAo+IG1h
bmFnZXMgdGhlIGFib3ZlIGluZGlyZWN0IGNhbGwgYW5kICpib29tKi4KPgo+IEhvdyBjYW4gSSB0
ZWxsIHdoaWNoIGZ1bmN0aW9ucyBlc2NhcGUgYWNjb3JkaW5nIHRvIEJQRiBzdWNoIHRoYXQgSSBt
aWdodAo+IHRlYWNoIG9ianRvb2wgdGhpcz8KCkknbSBub3QgZm9sbG93aW5nLgpBcmUgeW91IGFz
a2luZyB0byBhbm5vdGF0ZQpfX2JwZl9rZnVuYyB2b2lkIGJwZl9jZ3JvdXBfcmVsZWFzZShzdHJ1
Y3QgY2dyb3VwICpjZ3JwKQpzb21laG93IHNvIHRoYXQgb2JqdG9vbCBrbm93cyB0aGF0IGl0IHdp
bGwgYmUgY2FsbGVkIGluZGlyZWN0bHk/CnR5cGVkZWYgdm9pZCAoKmJ0Zl9kdG9yX2tmdW5jX3Qp
KHZvaWQgKik7CiAgICAgICAgYnRmX2R0b3Jfa2Z1bmNfdCBkdG9yOwpidXQgdGhlIGJwZl9jZ3Jv
dXBfcmVsZWFzZSB0YWtlcyAnc3RydWN0IGNncm91cConLgpGcm9tIGtjZmkgcG92IHZvaWQgKiA9
PSBzdHJ1Y3QgY2dyb3VwICogPwpEbyB3ZSBuZWVkIHRvIGNoYW5nZSBpdCB0byAndm9pZCAqY2dy
cCcgPwpXaGF0IGlzICJzZWFsaW5nIiBieSBvYmp0b29sPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
