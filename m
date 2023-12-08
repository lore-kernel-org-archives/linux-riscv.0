Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CAAC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 22:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EwTz+Easu5bOw2XvXSIaBcTwCUDJq7zAsI8Qh4gPJs=; b=1/LJGQ1jWRszqL
	uZZRzvHZHI9a1koDFPYSWBOiQ/9jrTJYChSJJ2mcG6pPY7wkhcCNzs7Yb3Wi1RFlXbyLf7ebFPTU1
	kbOrAd34QFF3C6hep8GdRizlUQ+MoqW/XVG+78kf5CSULMivjuZK/EJI00iqOXwBok52Dshez8rzU
	Eu5sw/CeiqnmIzV4Az/RaEuvcvNSlaLwjlWhkWkjf48R5JQJ5+wtaZ+0qd9KMwwKxV8OuSi0yWfhr
	tw0CgCellUIm7mjkXrM6OFb6T7rmdmfl2aW2AoxvopvDOxgDpp5Oo/AFOn11qA0kyPHssjE6tSzzg
	zek+LQhzwSEH+LUKsAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBjbq-00GiKg-1f;
	Fri, 08 Dec 2023 22:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBjbn-00GiKT-0c
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 22:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9AtZTt6OGfjsPDJQOtDfx5Cu6irtFkmWZMjDyBOLAY8=; b=anFV4EKnBK8gQJUQaPbHBdGbmh
	b2Y7tMQ6hHkQDT5vgOGk/97h6xyIa4MDZnDQV4WFLZMH0Moc2XQBReqMlEddNf22x5eaw0zAoXtGq
	dyQwgTqMZqIOn/1N4xYUukkUwd2BIl/rwN+ayXO0Y2NWwvxlGU3Yxjp8/bdR9jO8fTnclXdXuFPiN
	/eQ1qV70Ux813zNWm90BtR+BVtsuhQ7+lpHQtd95lVHbKAbeBGyJQhSdn2Nf39E/FRT7aa1T5sy3K
	KtlIjlSiXtHdzhKo1SHrWhL9Azqgm2vU4mbnqe/RW5vhus/b8/1CvhOM+ExeLbzwwDLJKGTkrTFIZ
	Ez+2V7qQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rBjba-006iqm-2j;
	Fri, 08 Dec 2023 22:46:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C66943003F0; Fri,  8 Dec 2023 23:45:57 +0100 (CET)
Date: Fri, 8 Dec 2023 23:45:57 +0100
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
Message-ID: <20231208224557.GH36716@noisy.programming.kicks-ass.net>
References: <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net>
 <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net>
 <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net>
 <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
 <20231208205241.GK28727@noisy.programming.kicks-ass.net>
 <CAADnVQL3KsJONShsstDq5jrpbc_4FOU-VQPJgDCt50N9asoFzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQL3KsJONShsstDq5jrpbc_4FOU-VQPJgDCt50N9asoFzA@mail.gmail.com>
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

T24gRnJpLCBEZWMgMDgsIDIwMjMgYXQgMTI6NTg6MDFQTSAtMDgwMCwgQWxleGVpIFN0YXJvdm9p
dG92IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDgsIDIwMjMgYXQgMTI6NTLigK9QTSBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgRGVjIDA4
LCAyMDIzIGF0IDEyOjQxOjAzUE0gLTA4MDAsIEFsZXhlaSBTdGFyb3ZvaXRvdiB3cm90ZToKPiA+
ID4gT24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjozNeKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRl
cnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiA+IC1fX2JwZl9rZnVuYyB2b2lkIGJw
Zl90YXNrX3JlbGVhc2Uoc3RydWN0IHRhc2tfc3RydWN0ICpwKQo+ID4gPiA+ICtfX2JwZl9rZnVu
YyB2b2lkIGJwZl90YXNrX3JlbGVhc2Uodm9pZCAqcCkKPiA+ID4KPiA+ID4gWWVhaC4gVGhhdCB3
b24ndCB3b3JrLiBXZSBuZWVkIGEgd3JhcHBlci4KPiA+ID4gU2luY2UgYnBmIHByb2cgaXMgYWxz
byBjYWxsaW5nIGl0IGRpcmVjdGx5Lgo+ID4gPiBJbiBwcm9ncy90YXNrX2tmdW5jX2NvbW1vbi5o
Cj4gPiA+IHZvaWQgYnBmX3Rhc2tfcmVsZWFzZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnApIF9fa3N5
bTsKPiA+ID4KPiA+ID4gdGhhbiBsYXRlciBib3RoIGxpYmJwZiBhbmQgdGhlIHZlcmlmaWVyIGNo
ZWNrIHRoYXQKPiA+ID4gd2hhdCBicGYgcHJvZyBpcyBjYWxsaW5nIGFjdHVhbGx5IG1hdGNoZXMg
dGhlIHByb3RvCj4gPiA+IG9mIHdoYXQgaXMgaW4gdGhlIGtlcm5lbC4KPiA+ID4gRWZmZWN0aXZl
bHkgd2UncmUgZG9pbmcgc3Ryb25nIHByb3RvdHlwZSBjaGVjayBhdCBsb2FkIHRpbWUuCj4gPgo+
ID4gSSdtIHN0aWxsIHNvbWV3aGF0IGNvbmZ1c2VkIG9uIGhvdyB0aGlzIHdvcmtzLCB3aGVyZSBk
b2VzIEJQRiBnZXQgdGhlCj4gPiBhZGRyZXNzIG9mIHRoZSBmdW5jdGlvbiBmcm9tPyBhbmQgd2hh
dCBzaG91bGQgSSBjYWxsIHRoZSB3cmFwcGVyPwo+IAo+IEl0IHN0YXJ0cyB3aXRoCj4gcmVnaXN0
ZXJfYnRmX2lkX2R0b3Jfa2Z1bmNzKCkgdGhhdCB0YWtlcyBhIHNldCBvZiBidGZfaWRzOgo+IHti
dGZfaWRfb2ZfdHlwZSwgYnRmX2lkX29mX2R0b3JfZnVuY3Rpb259LCAuLi4KPiAKPiBUaGVuIGJh
c2VkIG9uIGJ0Zl9pZF9vZl9kdG9yX2Z1bmN0aW9uIHdlIGZpbmQgaXRzIHR5cGUgcHJvdG8sIG5h
bWUsIGRvIGNoZWNrcywKPiBhbmQgZXZlbnR1YWxseToKPiBhZGRyID0ga2FsbHN5bXNfbG9va3Vw
X25hbWUoZHRvcl9mdW5jX25hbWUpOwo+IGZpZWxkLT5rcHRyLmR0b3IgPSAodm9pZCAqKWFkZHI7
Cj4gCj4gYnBmX3Rhc2tfcmVsZWFzZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnApIHdvdWxkIG5lZWQg
dG8gc3RheSBhcy1pcywKPiBidXQgd2UgY2FuIGhhdmUgYSB3cmFwcGVyCj4gdm9pZCBicGZfdGFz
a19yZWxlYXNlX2R0b3Iodm9pZCAqcCkKPiB7Cj4gICBicGZfdGFza19yZWxlYXNlKHApOwo+IH0K
PiAKPiBBbmQgYWRqdXN0IHRoZSBhYm92ZSBsb29rdXAgd2l0aCBleHRyYSAiX2R0b3IiIHN1ZmZp
eC4KPiAKPiA+ID4gYnR3IGluc3RlYWQgb2YgRVhQT1JUX1NZTUJPTF9HUEwoYnBmX3Rhc2tfcmVs
ZWFzZSkKPiA+ID4gY2FuIF9fQUREUkVTU0FCTEUgYmUgdXNlZCA/Cj4gPiA+IFNpbmNlIGl0J3Mg
bm90IGFuIGV4cG9ydCBzeW1ib2wuCj4gPgo+ID4gTm8gX19BRERSRVNTQUJMRSgpIGlzIGV4cHJl
c3NseSBpZ25vcmVkLCBidXQgd2UgaGF2ZSBJQlRfTk9TRUFMKCkgdGhhdAo+ID4gc2hvdWxkIGRv
IGl0LiBJJ2xsIHJlbmFtZSB0aGUgdGhpbmcgYW5kIGxpZnQgaXQgb3V0IG9mIHg4NiB0byBhdm9p
ZAo+ID4gYnJlYWtpbmcgYWxsIG90aGVyIGFyY2ggYnVpbGRzLgo+IAo+IE1ha2VzIHNlbnNlLgoK
T2ssIGRpZCB0aGF0LiBDdXJyZW50IHBhdGNoZXMgKG9uIHRvcCBvZiBicGYtbmV4dCkgYXJlIGhl
cmU6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXRl
cnovcXVldWUuZ2l0IHg4Ni9jZmkKCihyZWFsbHkgc2hvdWxkIHRyeSBhbmQgd3JpdGUgYmV0dGVy
IGNoYW5nZWxvZ3MsIGJ1dCBpdCdzIHRvbyBsYXRlKQoKVGhlIHRlc3RfcHJvZ3MgdGhpbmcgc3Rp
bGwgZG9lc24ndCBydW4gdG8gY29tcGxldGlvbiwgdGhlIG5leHQgcHJvYmxlbQpzZWVtcyB0byBi
ZSBicGZfdGhyb3coKToKClsgIDI0Ny43MjAxNTldICA/IGRpZSsweGE0LzB4ZDAKWyAgMjQ3Ljcy
MDIxNl0gID8gZG9fdHJhcCsweGE1LzB4MTgwClsgIDI0Ny43MjAyODFdICA/IF9fY2ZpX2JwZl9w
cm9nXzhhYzQ3Mzk1NGFjNmQ0MzFfRisweGQvMHgxMApbICAyNDcuNzIwMzY4XSAgPyBfX2NmaV9i
cGZfcHJvZ184YWM0NzM5NTRhYzZkNDMxX0YrMHhkLzB4MTAKWyAgMjQ3LjcyMDQ1OV0gID8gZG9f
ZXJyb3JfdHJhcCsweGJhLzB4MTIwClsgIDI0Ny43MjA1MjVdICA/IF9fY2ZpX2JwZl9wcm9nXzhh
YzQ3Mzk1NGFjNmQ0MzFfRisweGQvMHgxMApbICAyNDcuNzIwNjE0XSAgPyBoYW5kbGVfaW52YWxp
ZF9vcCsweDJjLzB4NDAKWyAgMjQ3LjcyMDY4NF0gID8gX19jZmlfYnBmX3Byb2dfOGFjNDczOTU0
YWM2ZDQzMV9GKzB4ZC8weDEwClsgIDI0Ny43MjA3NzVdICA/IGV4Y19pbnZhbGlkX29wKzB4Mzgv
MHg2MApbICAyNDcuNzIwODQwXSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxYS8weDIwClsgIDI0
Ny43MjA5MDldICA/IDB4ZmZmZmZmZmZjMDAxYmE1NApbICAyNDcuNzIwOTcxXSAgPyBfX2NmaV9i
cGZfcHJvZ184YWM0NzM5NTRhYzZkNDMxX0YrMHhkLzB4MTAKWyAgMjQ3LjcyMTA2M10gID8gYnBm
X3Rocm93KzB4OWIvMHhmMApbICAyNDcuNzIxMTI2XSAgPyBicGZfdGVzdF9ydW4rMHgxMDgvMHgz
NTAKWyAgMjQ3LjcyMTE5MV0gID8gYnBmX3Byb2dfNTU1NTcxNGI2ODViZjBjZl9leGNlcHRpb25f
dGhyb3dfYWx3YXlzXzErMHgyNi8weDI2ClsgIDI0Ny43MjEzMDFdICA/IGJwZl90ZXN0X3J1bisw
eDEwOC8weDM1MApbICAyNDcuNzIxMzY4XSAgYnBmX3Rlc3RfcnVuKzB4MjEyLzB4MzUwClsgIDI0
Ny43MjE0MzNdICA/IHNsYWJfYnVpbGRfc2tiKzB4MjIvMHgxMTAKWyAgMjQ3LjcyMTUwM10gIGJw
Zl9wcm9nX3Rlc3RfcnVuX3NrYisweDM0Ny8weDRhMAoKQnV0IEknbSB0b28gdGlyZWQgdG8gdGhp
bmsgc3RhaWdodC4gSXMgIHRoaXMgYSBicGZfY2FsbGJhY2tfdCB2cwpicGZfZXhjZXB0aW9uX2Ni
IGRpZmZlcmVuY2U/CgpJJ2xsIHByb2QgbW9yZSBsYXRlci4gWnp6ei4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
