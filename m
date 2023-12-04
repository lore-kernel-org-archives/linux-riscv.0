Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E3FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxRrZP+fQnboETtfy4t0YEaVfzDGg1qFtyl4d6yEHRw=; b=QfbuyqGERCPgyK
	/2OXBGpJQA/SfjHTL3QXtInvLzOAk+fHRsNmQqIM0bZXbQw46ImVmovMCfOynaMwbPuDW6VSGdxWN
	MSGQnK3UbAKRaYpYpi9xDPg4rPk+C4CT+qEUcJ51sSuDZtdOT97MglOrOPrGhbVhX5UVJks7ITxA0
	js3tRu26IWxlU36Zpiu7F35r2N58PKDUx7rDLwgf0WufSjU6j5EUGZCRC/1ydfqVaH4vSmi6gHdWP
	WR3Gn4mW8iJg1t3SyKLPJ0MpD/BvpA+JsrNtyhgGcIKwBBDQHnsDHRbBvVN8svY/uA6I1HCHFyHVL
	llbJbhv7TimcFKBaxCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA51Q-003Ni9-2S;
	Mon, 04 Dec 2023 09:13:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA51P-003Ni3-0F
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Dec 2023 09:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=17YJ1z3ogS9ZFtbiaMgUZd7PQ1LHRkBWBWcBGoc/CJ8=; b=Oq2r/tZ4GMYvXmULCX+LD6Qfz7
	HO9OVNz8XCXQMgxz/LWfORxgl/H3LTq81ngFJsgHC93qrKcMcjpBQX8v5qQhdci74NGvXZAJ/yVju
	sK9gFvSFKKjG+KTta5qWhde5JaQQriDgSlX54kLf3MXV6oHLk1PYPA8HeGphIfHdNTawm8bbTLJrU
	NgcMlwn6/lrZmRXbfPHQFRxpn4ftLCB5eM9fnRnJvlMZpH3BmDJrGqa4dnsA7VRIdxnJbQVajyNOi
	Bn006jXGBXzTqb9dfS3GtKtm0DDTPpLydkfwONe+R1/uAJi3EvwQfUiJ18EbM5lGDJHCoVpl5xoSe
	3fM7hPwA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rA51D-004JwZ-2M;
	Mon, 04 Dec 2023 09:13:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D01F300472; Mon,  4 Dec 2023 10:13:34 +0100 (CET)
Date: Mon, 4 Dec 2023 10:13:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <song@kernel.org>, Song Liu <songliubraving@meta.com>,
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
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20231204091334.GM3818@noisy.programming.kicks-ass.net>
References: <20231130133630.192490507@infradead.org>
 <20231130134204.136058029@infradead.org>
 <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
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

T24gU3VuLCBEZWMgMDMsIDIwMjMgYXQgMDI6NTY6MzRQTSAtMDgwMCwgQWxleGVpIFN0YXJvdm9p
dG92IHdyb3RlOgo+IE9uIFRodSwgTm92IDMwLCAyMDIzIGF0IDU6NDPigK9BTSBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+Cj4gPiAgdm9pZCBicGZf
cHJvZ19rYWxsc3ltc19kZWwoc3RydWN0IGJwZl9wcm9nICpmcCkKPiA+IEBAIC02OTEsNiArNzA4
LDkgQEAgdm9pZCBicGZfcHJvZ19rYWxsc3ltc19kZWwoc3RydWN0IGJwZl9wcgo+ID4gICAgICAg
ICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICAgIGJwZl9rc3ltX2RlbCgmZnAtPmF1eC0+
a3N5bSk7Cj4gPiArI2lmZGVmIENPTkZJR19GSU5FSUJUCj4gPiArICAgICAgIGJwZl9rc3ltX2Rl
bCgmZnAtPmF1eC0+a3N5bV9wcmVmaXgpOwo+ID4gKyNlbmRpZgo+ID4gIH0KPiAKPiBUaGFuayB5
b3UgZm9yIGFkZHJlc3NpbmcgYWxsIGNvbW1lbnRzLCBidXQgaXQgcGFuaWNzIGR1cmluZyBib290
IHdpdGg6Cj4gCj4gWyAgICAzLjEwOTQ3NF0gUklQOiAwMDEwOmJwZl9wcm9nX2thbGxzeW1zX2Rl
bCsweDEwZi8weDE0MAo+IFsgICAgMy4xMDk4NjddIENvZGU6IDI2IGUwIDAwIGZmIDA1IDMyIGRk
IGRkIDAxIDQ4IDhkIGJiIDgwIDAzIDAwIDAwCj4gNDggYzcgYzYgYjggYjMgMDAgODMgZTggZWYg
MjUgZTAgMDAgNDggOGIgODMgNTggMDMgMDAgMDAgNDggOGIgOGIgNjAKPiAwMyAwMCAwMCA8NDg+
IDg5IDQ4IDA4IDQ4IDg5IDAxIDRjIDg5IGIzIDYwIDAzIDAwIDAwIDQ4IGM3IGM3IDEwIDBiIDdi
Cj4gODMgNWIKPiBbICAgIDMuMTExMjgyXSBSU1A6IDAwMDA6ZmZmZmM5MDAwMDAxM2UwOCBFRkxB
R1M6IDAwMDEwMjQ2Cj4gWyAgICAzLjExNjk2OF0gQ2FsbCBUcmFjZToKPiBbICAgIDMuMTE3MTYz
XSAgPFRBU0s+Cj4gWyAgICAzLjExNzMyOF0gID8gX19kaWVfYm9keSsweDY4LzB4YjAKPiBbICAg
IDMuMTE3NTk5XSAgPyBwYWdlX2ZhdWx0X29vcHMrMHgzMTcvMHgzOTAKPiBbICAgIDMuMTE3OTA5
XSAgPyBkZWJ1Z19vYmplY3RzX2ZpbGxfcG9vbCsweDE5LzB4NDQwCj4gWyAgICAzLjExODI4M10g
ID8gZGVidWdfb2JqZWN0c19maWxsX3Bvb2wrMHgxOS8weDQ0MAo+IFsgICAgMy4xMTg3MTVdICA/
IGRvX3VzZXJfYWRkcl9mYXVsdCsweDRjZC8weDU2MAo+IFsgICAgMy4xMTkwNDVdICA/IGV4Y19w
YWdlX2ZhdWx0KzB4NjIvMHgxYzAKPiBbICAgIDMuMTE5MzUwXSAgPyBhc21fZXhjX3BhZ2VfZmF1
bHQrMHgyNi8weDMwCj4gWyAgICAzLjExOTY3NV0gID8gYnBmX3Byb2dfa2FsbHN5bXNfZGVsKzB4
MTBmLzB4MTQwCj4gWyAgICAzLjEyMDAyM10gID8gYnBmX3Byb2dfa2FsbHN5bXNfZGVsKzB4MTAx
LzB4MTQwCj4gWyAgICAzLjEyMDM4MV0gIF9fYnBmX3Byb2dfcHV0X25vcmVmKzB4MTIvMHhmMAo+
IFsgICAgMy4xMjA3MDRdICBicGZfcHJvZ19wdXRfZGVmZXJyZWQrMHhlOS8weDExMAo+IFsgICAg
My4xMjEwMzVdICBicGZfcHJvZ19wdXQrMHhiYi8weGQwCj4gWyAgICAzLjEyMTMwN10gIGJwZl9w
cm9nX3JlbGVhc2UrMHgxNS8weDIwCj4gCj4gQWRkaW5nIHRoZSBmb2xsb3dpbmc6Cj4gCj4gZGlm
ZiAtLWdpdCBhL2tlcm5lbC9icGYvY29yZS5jIGIva2VybmVsL2JwZi9jb3JlLmMKPiBpbmRleCA1
Yzg0YTkzNWJhNjMuLjUwMTNmZDUzYWRmZCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvYnBmL2NvcmUu
Ywo+ICsrKyBiL2tlcm5lbC9icGYvY29yZS5jCj4gQEAgLTcwOSw2ICs3MDksOCBAQCB2b2lkIGJw
Zl9wcm9nX2thbGxzeW1zX2RlbChzdHJ1Y3QgYnBmX3Byb2cgKmZwKQo+IAo+ICAgICAgICAgYnBm
X2tzeW1fZGVsKCZmcC0+YXV4LT5rc3ltKTsKPiAgI2lmZGVmIENPTkZJR19GSU5FSUJUCj4gKyAg
ICAgICBpZiAoY2ZpX21vZGUgIT0gQ0ZJX0ZJTkVJQlQpCj4gKyAgICAgICAgICAgICAgIHJldHVy
bjsKPiAgICAgICAgIGJwZl9rc3ltX2RlbCgmZnAtPmF1eC0+a3N5bV9wcmVmaXgpOwo+ICAjZW5k
aWYKPiAgfQo+IAo+IGZpeGVzIHRoZSBib290IGlzc3VlLCBidXQgdGVzdF9wcm9ncyBpcyBub3Qg
aGFwcHkuCgpEYW1uLCBJJ20gYW4gaWRpb3QgOi0pLCBJIGtuZXcgSSBzaG91bGQndmUgYm9vdCB0
ZXN0ZWQgYWxsCmNvbmZpZ3VyYXRpb25zIGFnYWluIDovCgo+IEp1c3QgcnVubmluZyB0ZXN0X3By
b2dzIGl0IHNwbGF0cyByaWdodCBhd2F5Ogo+IAo+IFsgICA3NC4wNDc3NTddIGttZW1sZWFrOiBG
b3VuZCBvYmplY3QgYnkgYWxpYXMgYXQgMHhmZmZmZmZmZmEwMDAxZDgwCj4gWyAgIDc0LjA0ODI3
Ml0gQ1BVOiAxNCBQSUQ6IDEwNCBDb21tOiBrd29ya2VyLzE0OjAgVGFpbnRlZDogRyAgICAgICAg
Vwo+ICBPICAgICAgIDYuNy4wLXJjMy0wMDcwMi1nNDFjMzBmZWMzMDRkLWRpcnR5ICM1MjQxCj4g
WyAgIDc0LjA0OTExOF0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsg
UElJWCwgMTk5NiksCj4gQklPUyByZWwtMS4xMi4wLTU5LWdjOWJhNTI3NmUzMjEtcHJlYnVpbHQu
cWVtdS5vcmcgMDQvMDEvMjAxNAo+IFsgICA3NC4wNTAwNDJdIFdvcmtxdWV1ZTogZXZlbnRzIGJw
Zl9wcm9nX2ZyZWVfZGVmZXJyZWQKPiBbICAgNzQuMDUwNDQ4XSBDYWxsIFRyYWNlOgo+IFsgICA3
NC4wNTA2NjNdICA8VEFTSz4KPiBbICAgNzQuMDUwODQxXSAgZHVtcF9zdGFja19sdmwrMHg1NS8w
eDgwCj4gWyAgIDc0LjA1MTE0MV0gIF9fZmluZF9hbmRfcmVtb3ZlX29iamVjdCsweGRiLzB4MTEw
Cj4gWyAgIDc0LjA1MTUyMV0gIGttZW1sZWFrX2ZyZWUrMHg0MS8weDcwCj4gWyAgIDc0LjA1MTgy
OF0gIHZmcmVlKzB4MzYvMHgxMzAKCkR1cnIsIEknbGwgc2VlIGlmIEkgY2FuIGdldCB0aGF0IHN0
dWZmIHJ1bm5pbmcgbG9jYWxseSwgYW5kIG90aGVyd2lzZQpwbGF5IHdpdGggdGhlIHJvYm90IGFz
IHlvdSBzdWdnZXN0ZWQuIFRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
