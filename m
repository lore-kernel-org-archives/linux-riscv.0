Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7F6C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDxFJ8YX/Lg2/LHbDb5HfdRJDrTps6A2jqTlPePc6eo=; b=P/QxQ45ob9SPhR
	1GNcvoJFdHV/0d1lkP2oG5DhNRlM0Q3Cyj1WU3sNxBxKcT7Y9fRArHyUJmc/hATm8g7NQ4bftZkAR
	8naVBYhSoaEMi4YKo5LH4xuMzSlhvZwfEfNRapq1uhWHS7cdE8w+SI/Uy1+NuntXkhAAeBoqHWrQ9
	J7kMwTU6yWjWMsex1K9In6onnCPBSghh048kW+1BeAGIEH7c8Wz4X2v26Wu0eb702/lxPaWtcxZxF
	I4pPzhlfJclTpj3ZJjYThEUMPrKOB2NAWrkVfUIsp/6gdlHPLpHGPbs2o8iwYinFluqkiniLvnj7O
	E0u/7wMV6i0UxnQm+3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgaJ-00GObq-1C;
	Fri, 08 Dec 2023 19:32:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgaF-00GOam-0F
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 19:32:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so27358135e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 11:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702063940; x=1702668740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6ndbVL4uxU82m7aXPrJdtt1Twlz3kSpUXUFiW9WyCw=;
        b=Ww6XPuhqVRQHv/jDEz6q1TSli5gCS+tJK4xHTCz6yP5CyBxt4HlEF61g4CeZuhvjUD
         iL69nDk9yifH3vvmaJBISMUiCaLyySYM66Eb4CeFAwv9CZKsT04zlW0f0dH7x5GCso+l
         Eav8ZkKII1xKKbJT4xVHSPKHCWbXpXRdw0Y27B92YLtUY5NqxUHWL0GfIAlhHxBwmHTz
         tI3AkD0RazQupC3l+Y/HBqCh/UXww2kKp81b9LOwIje1ASkzNAG+RuFy7ETh867UDEAA
         UTOHdbQhq1dDOJuFyFhpfZZ5uCZ9DJEl+PfpYobVAnqFz6usmnEuDBAS9qD4TUV73m4a
         BACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702063940; x=1702668740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6ndbVL4uxU82m7aXPrJdtt1Twlz3kSpUXUFiW9WyCw=;
        b=Xe4hv5R8IKoGz6SvDVjDSw2Ri7ZyA98+iCkrwHFHJB/Q/GuH+I0Yf5lEoGGtup6SSk
         5B2lerX2ZM1uLJJpM+95F3aIl3TTyKk00adIqqaR931e9QLCVKNx2Gp/Ii/9WTj+CKrZ
         xPcP2u0nO9EQEAQ2iSlkvTJWlvzJvrSNKD96EKVC1Am/vXfoQJjOY9h2INHNY3Hkhsl3
         SFu9ZOpFS3yP9W1t+uCyGNL4hqFAoPyGxgzLdPnnhJldsiQgYGUtXziaKLAVOrM35iGu
         MdSL19gXW2IDx5fKzBlXxbm6fXD9fnuGDALQevm6FKUd75vP/vpgzcz+XumWPI2bBIYN
         O0rg==
X-Gm-Message-State: AOJu0YyX5pWw0tgCTdQ0kQZ6AWYuIJN/QGRMj4WO/BNEgLxROWm63RRP
	hnfsy33JTTTXGs/XpMoZ1nIDpI84ywzZXJxuqr0=
X-Google-Smtp-Source: AGHT+IHnV39yPn1QoB9tAG00NDGLMqs4S2voOP0fLNkjc4tsDhdkd7wBpq6Za2gZRDVXSqGwHJCKQCHJJH2FbwjEGAU=
X-Received: by 2002:a05:600c:1d95:b0:40b:5f03:b3ca with SMTP id
 p21-20020a05600c1d9500b0040b5f03b3camr131680wms.236.1702063939942; Fri, 08
 Dec 2023 11:32:19 -0800 (PST)
MIME-Version: 1.0
References: <ZW4LjmUKj1q6RWdL@krava> <20231204181614.GA7299@noisy.programming.kicks-ass.net>
 <20231204183354.GC7299@noisy.programming.kicks-ass.net> <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208134041.GD28727@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 11:32:07 -0800
Message-ID: <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231208_113223_116017_A813E658 
X-CRM114-Status: GOOD (  15.43  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCA1OjQx4oCvQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDExOjI5OjQw
QU0gKzAxMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+ID4gVGhlIG9ubHkgcHJvYmxlbSBJIG5v
dyBoYXZlIGlzIHRoZSBvbmUgWFhYLCBJJ20gbm90IGVudGlyZWx5IHN1cmUgd2hhdAo+ID4gc2ln
bmF0dXJlIHRvIHVzZSB0aGVyZS4KPgo+ID4gQEAgLTExOSw2ICsxMTksNyBAQCBpbnQgYnBmX3N0
cnVjdF9vcHNfdGVzdF9ydW4oc3RydWN0IGJwZl9wCj4gPiAgICAgICBvcF9pZHggPSBwcm9nLT5l
eHBlY3RlZF9hdHRhY2hfdHlwZTsKPiA+ICAgICAgIGVyciA9IGJwZl9zdHJ1Y3Rfb3BzX3ByZXBh
cmVfdHJhbXBvbGluZSh0bGlua3MsIGxpbmssCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnN0X29wcy0+ZnVuY19tb2RlbHNbb3BfaWR4XSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBYWFggKi8gTlVM
TCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbWFn
ZSwgaW1hZ2UgKyBQQUdFX1NJWkUpOwo+ID4gICAgICAgaWYgKGVyciA8IDApCj4gPiAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+Cj4gRHVoLCB0aGF0IHNob3VsZCBvZmNvdXJzZSBiZSBzb21ldGhp
bmcgb2YgZHVtbXlfb3BzX3Rlc3RfcmV0X2ZuIHR5cGUuCj4gTGV0IG1lIGdvIGZpeCB0aGF0LgoK
UmlnaHQuIFRoYXQgc2hvdWxkIHdvcmsuCkEgYml0IHdhc3RlZnVsIHRvIGdlbmVyYXRlIHJlYWwg
Y29kZSBqdXN0IHRvIHJlYWQgaGFzaCBmcm9tIGl0CnZpYSBjZmlfZ2V0X2Z1bmNfaGFzaCgpLCBi
dXQgaXQncyBhIG5lYXQgaWRlYS4KSSBndWVzcyBpdCdzIGhhcmQgdG8gZ2V0IGtjZmkgZnJvbSBf
X0FERFJFU1NBQkxFIGluIHBsYWluIEMKYW5kIHNwcmlua2xpbmcgYXNtKCJjZmlfeHh4OiAubG9u
ZyAgIF9fa2NmaV90eXBlaWQuLi4iKTsgaXMgd29yc2U/CkV2ZW4gaWYgaXQncyBhIG1hY3JvID8K
VGhhdCBtYWNybyB3b3VsZCBiZSB1c2VkIHRvIGRlZmluZSBjZmlfYnBmX2hhc2ggYW5kIGFsbCBv
dGhlciBzdHVicz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
