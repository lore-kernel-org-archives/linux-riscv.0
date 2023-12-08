Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9ECC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+xsPVIQ7MQbafTjv39rx3ZORAk5l7MXJnmHWW2ZgNA=; b=Nh8UBr0GQ49I3B
	axvYZDdOj8hIg+/Jazv2ipX8m5+bGz8EFlvPlxg27+dHV3umUtxceS11ssW2XlzUwLRXVg+NthLO5
	ZKL6QXgDNZ1wEts+/6ORor/FjDxhq56Ehj2utMHeUWpUwfEE8e5wXaWq9u+djoYpLUBxS3VhHiioL
	JKBnJ6HXu7kYzL1lRm4SvN6uMWf3ekdhWss+m/i9MwuLgq58D/rXBh9GG060QvEaYN8vFyaPQAmcz
	kj4AMf5HVQkbBJRs+oBt/D0wPC+66tSs/aEPSDGyRJ9e4AMEsvANgWIUb4BMiowBUNHpr/Em9oBQc
	ak90/FeuHE3FYjxHpo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhIq-00GT2d-1M;
	Fri, 08 Dec 2023 20:18:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhIp-00GT2V-0T
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 20:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rRfUKKpVJaX2GBwm20UFJtXdCC5Gt18eCCN9NLFBXGg=; b=S1ntypyXXnH5/Zhmllff4W7CqE
	zvKEGCwpJiV6CNOuMqcAx4RdNPWtDIz2wWfgO64jF9VTQsJPihe7ZgsJ5Aui0fouYWgOcD9MnMek/
	Qw0qaDYlc8wkXBNuBNMpvKGH1proCkWQ7owqEVwrXCdttqYkXESI6larGqgZwhg9OBfBUOQtOI/29
	x071uzp8HcuHIXHZAB0KuEs0TbzqucgbaSkUc/nB5qIR+l6CS7NooXMW1vzUQHxDz0ebc3/9JpYtW
	cVJqlZa1MBgZfaxao7Q0joX1+LKJW8Lf1KS/RKmyC2puCXnf8JHhnhKq7CsotPXpzzlAbIkfFuetu
	UOGg6Fiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rBhIi-006Ud2-EY; Fri, 08 Dec 2023 20:18:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5BE5B3003F0; Fri,  8 Dec 2023 21:18:19 +0100 (CET)
Date: Fri, 8 Dec 2023 21:18:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>,
	Song Liu <songliubraving@meta.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Joao Moreira <joao@overdrivepizza.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231208201819.GE36716@noisy.programming.kicks-ass.net>
References: <20231204183354.GC7299@noisy.programming.kicks-ass.net>
 <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net>
 <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
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

T24gRnJpLCBEZWMgMDgsIDIwMjMgYXQgMTE6MzI6MDdBTSAtMDgwMCwgQWxleGVpIFN0YXJvdm9p
dG92IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDgsIDIwMjMgYXQgNTo0MeKAr0FNIFBldGVyIFppamxz
dHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBEZWMgMDgs
IDIwMjMgYXQgMTE6Mjk6NDBBTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+IFRo
ZSBvbmx5IHByb2JsZW0gSSBub3cgaGF2ZSBpcyB0aGUgb25lIFhYWCwgSSdtIG5vdCBlbnRpcmVs
eSBzdXJlIHdoYXQKPiA+ID4gc2lnbmF0dXJlIHRvIHVzZSB0aGVyZS4KPiA+Cj4gPiA+IEBAIC0x
MTksNiArMTE5LDcgQEAgaW50IGJwZl9zdHJ1Y3Rfb3BzX3Rlc3RfcnVuKHN0cnVjdCBicGZfcAo+
ID4gPiAgICAgICBvcF9pZHggPSBwcm9nLT5leHBlY3RlZF9hdHRhY2hfdHlwZTsKPiA+ID4gICAg
ICAgZXJyID0gYnBmX3N0cnVjdF9vcHNfcHJlcGFyZV90cmFtcG9saW5lKHRsaW5rcywgbGluaywK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdF9v
cHMtPmZ1bmNfbW9kZWxzW29wX2lkeF0sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAvKiBYWFggKi8gTlVMTCwKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGltYWdlLCBpbWFnZSArIFBBR0VfU0laRSk7
Cj4gPiA+ICAgICAgIGlmIChlcnIgPCAwKQo+ID4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4KPiA+IER1aCwgdGhhdCBzaG91bGQgb2Zjb3Vyc2UgYmUgc29tZXRoaW5nIG9mIGR1bW15X29w
c190ZXN0X3JldF9mbiB0eXBlLgo+ID4gTGV0IG1lIGdvIGZpeCB0aGF0Lgo+IAo+IFJpZ2h0LiBU
aGF0IHNob3VsZCB3b3JrLgo+IEEgYml0IHdhc3RlZnVsIHRvIGdlbmVyYXRlIHJlYWwgY29kZSBq
dXN0IHRvIHJlYWQgaGFzaCBmcm9tIGl0Cj4gdmlhIGNmaV9nZXRfZnVuY19oYXNoKCksIGJ1dCBp
dCdzIGEgbmVhdCBpZGVhLgoKUmlnaHQsIGJpdCB3YXN0ZWZ1bC4gQnV0IHRoZSBhZHZhbnRhZ2Ug
aXMgdGhhdCBJIGdldCBhIHN0cnVjdHVyZSB3aXRoCnBvaW50ZXJzIHRoYXQgZXhhY3RseSBtaXJy
b3JzIHRoZSBzdHJ1Y3R1cmUgd2UncmUgd3JpdGluZy4KCj4gSSBndWVzcyBpdCdzIGhhcmQgdG8g
Z2V0IGtjZmkgZnJvbSBfX0FERFJFU1NBQkxFIGluIHBsYWluIEMKPiBhbmQgc3ByaW5rbGluZyBh
c20oImNmaV94eHg6IC5sb25nICAgX19rY2ZpX3R5cGVpZC4uLiIpOyBpcyB3b3JzZT8KPiBFdmVu
IGlmIGl0J3MgYSBtYWNybyA/CgpJIGNhbiB0cnkgdGhpcywgYnV0IEknbSBub3Qgc3VyZSBpdCds
bCBiZSBwcmV0dHkuIEV2ZW4gaWYgSSB3cmFwIGl0IGluIGEKZGVjZW50IG1hY3JvLCBJIHN0aWxs
IGdldCB0byBkZWZpbmUgYSB0b24gb2YgdmFyaWFibGVzIGFuZCB0aGVuIHdyYXAgdGhlCmxvdCBp
bnRvIGEgc3RydWN0dXJlIC0tIG9uZSB0aGF0IGV4cGVjdHMgZnVuY3Rpb24gcG9pbnRlcnMuCgpJ
J2xsIHNlZSBob3cgaG9ycmlibGUgaXQgd2lsbCBiZWNvbWUuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
