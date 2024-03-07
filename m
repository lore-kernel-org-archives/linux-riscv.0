Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D488C54E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zAqtzQz3ao42y4FLIAOuUqBDQdNgNDfPKwtNmPFXP0=; b=JCg3xBq+1RbvoE
	rUuMlLqso2fgVCqCU//AY5MUBdh8QU1fwwqgirKTO4F6xNXGYv9eCDWQJH4r0z55kiAkWBgocxQ3C
	NHTpiqhLm4rtBhf0uZEZfebFEvPD0XwZlbYhIw2Y+dy77Azk882PEvG7XEjL4VadyoNR0un4LjHPh
	CShUkd/kkUCWZrVWjPADGPiG58NBp4e0j5GvfJ5HyLC1+IHGYq/gl7KlIz7YXn37ztsM8RJTnjOKw
	wn/dxB2ZcrMbif+iN0XeL0Y8x/mFg7szwzx4+6WTX8kAkaKnIlXyA5PkFJdCFgH4PXJRayeFzDFMa
	sERe0siMkl8c6mKifrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJPB-000000064lc-27s5;
	Thu, 07 Mar 2024 19:27:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJP8-000000064l9-3fou
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 19:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE17ECE25BC;
	Thu,  7 Mar 2024 19:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB9AC433C7;
	Thu,  7 Mar 2024 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709839664;
	bh=wSn0lMhiUdEJLAQ/CSKSPIkdVmeocFWCR58yeTReo/c=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=id5sNgChAhaoQLDntlupIrGJSiOWSOR4JIwhpsVeqDXWj/Dq+S2VSGsFNjQt6KOUr
	 Wqiv0QK+W7Wjx6WK3ab84PxhhP9xOLYhHqg+tEneqwFVsK7tIRESRyeEE9DOBmLORB
	 V9yZT0H+meLNW5IQ7oKJMIiRfove7Dv4nD/s/Pm+8+dHaA8O8nkYiiA9rraHhf/dPP
	 U3j5GPHj5WwIZ6Jif74NqUVF122MJFxZqrkcvfnyHBVdSVDaaLiFzdD4udnWQSvoe8
	 BjjX795BUeizOXtUNkfkfJL4y6jh0RBfMmKlzwGlkpRMVFC6hO5c5C4/5UvNQTMXWt
	 ael/BswBzXpPA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sami
 Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, Puranjay
 Mohan <puranjay12@gmail.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Song
 Shuai <suagrfillet@gmail.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <20240306165904.108141-1-puranjay12@gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
Date: Thu, 07 Mar 2024 20:27:40 +0100
Message-ID: <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_112747_280962_1B0E1ED9 
X-CRM114-Status: GOOD (  24.15  )
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

UHVyYW5qYXkhCgpQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyaXRlczoK
Cj4gVGhpcyBwYXRjaCBlbmFibGVzIHN1cHBvcnQgZm9yIERZTkFNSUNfRlRSQUNFX1dJVEhfQ0FM
TF9PUFMgb24gUklTQy1WLgo+IFRoaXMgYWxsb3dzIGVhY2ggZnRyYWNlIGNhbGxzaXRlIHRvIHBy
b3ZpZGUgYW4gZnRyYWNlX29wcyB0byB0aGUgY29tbW9uCj4gZnRyYWNlIHRyYW1wb2xpbmUsIGFs
bG93aW5nIGVhY2ggY2FsbHNpdGUgdG8gaW52b2tlIGRpc3RpbmN0IHRyYWNlcgo+IGZ1bmN0aW9u
cyB3aXRob3V0IHRoZSBuZWVkIHRvIGZhbGwgYmFjayB0byBsaXN0IHByb2Nlc3Npbmcgb3IgdG8K
PiBhbGxvY2F0ZSBjdXN0b20gdHJhbXBvbGluZXMgZm9yIGVhY2ggY2FsbHNpdGUuIFRoaXMgc2ln
bmlmaWNhbnRseSBzcGVlZHMKPiB1cCBjYXNlcyB3aGVyZSBtdWx0aXBsZSBkaXN0aW5jdCB0cmFj
ZSBmdW5jdGlvbnMgYXJlIHVzZWQgYW5kIGNhbGxzaXRlcwo+IGFyZSBtb3N0bHkgdHJhY2VkIGJ5
IGEgc2luZ2xlIHRyYWNlci4KPgo+IFRoZSBpZGVhIGFuZCBtb3N0IG9mIHRoZSBpbXBsZW1lbnRh
dGlvbiBpcyB0YWtlbiBmcm9tIHRoZSBBUk02NCdzCj4gaW1wbGVtZW50YXRpb24gb2YgdGhlIHNh
bWUgZmVhdHVyZS4gVGhlIGlkZWEgaXMgdG8gcGxhY2UgYSBwb2ludGVyIHRvCj4gdGhlIGZ0cmFj
ZV9vcHMgYXMgYSBsaXRlcmFsIGF0IGEgZml4ZWQgb2Zmc2V0IGZyb20gdGhlIGZ1bmN0aW9uIGVu
dHJ5Cj4gcG9pbnQsIHdoaWNoIGNhbiBiZSByZWNvdmVyZWQgYnkgdGhlIGNvbW1vbiBmdHJhY2Ug
dHJhbXBvbGluZS4KCk5vdCByZWFsbHkgYSByZXZpZXcsIGJ1dCBzb21lIG1vcmUgYmFja2dyb3Vu
ZDsgQW5vdGhlciByYXRpb25hbGUgKG9uLXRvcApvZiB0aGUgaW1wcm92ZWQgcGVyLWNhbGwgcGVy
Zm9ybWFuY2UhKSBmb3IgQ0FMTF9PUFMgd2FzIHRvIHVzZSBpdCB0bwpidWlsZCBmdHJhY2UgZGly
ZWN0IGNhbGwgc3VwcG9ydCAod2hpY2ggQlBGIHVzZXMgYSBsb3QhKS4gTWFyaywgcGxlYXNlCmNv
cnJlY3QgbWUgaWYgSSdtIGx5aW5nIGhlcmUhCgpPbiBBcm02NCwgQ0FMTF9PUFMgbWFrZXMgaXQg
cG9zc2libGUgdG8gaW1wbGVtZW50IGRpcmVjdCBjYWxscywgd2hpbGUKb25seSBwYXRjaGluZyBv
bmUgQkwgaW5zdHJ1Y3Rpb24gLS0gbmljZSEKCk9uIFJJU0MtViB3ZSBjYW5ub3QgdXNlIHVzZSB0
aGUgc2FtZSBpZGVhcyBhcyBBcm02NCBzdHJhaWdodCBvZmYsCmJlY2F1c2UgdGhlIHJhbmdlIG9m
IGphbCAoY29tcGFyZSB0byBCTCkgaXMgc2ltcGx5IHRvbyBzaG9ydCAoKy8tMU0pLgpTbywgb24g
UklTQy1WIHdlIG5lZWQgdG8gdXNlIGEgZnVsbCBhdWlwYy9qYWwgcGFpciAodGhlIHRleHQgcGF0
Y2hpbmcKc3RvcnkgaXMgYW5vdGhlciBjaGFwdGVyLCBidXQgbGV0J3MgbGVhdmUgdGhhdCBhc2lk
ZSBmb3Igbm93KS4gU2luY2Ugd2UKaGF2ZSB0byBwYXRjaCBtdWx0aXBsZSBpbnN0cnVjdGlvbnMs
IHRoZSBjbW9keCBzaXR1YXRpb24gZG9lc24ndCByZWFsbHkKaW1wcm92ZSB3aXRoIENBTExfT1BT
LgoKTGV0J3Mgc2F5IHRoYXQgd2UgY29udGludWUgYnVpbGRpbmcgb24geW91ciBwYXRjaCBhbmQg
aW1wbGVtZW50IGRpcmVjdApjYWxscyBvbiBDQUxMX09QUyBmb3IgUklTQy1WIGFzIHdlbGwuCgpG
cm9tIEZsb3JlbnQncyBjb21taXQgbWVzc2FnZSBmb3IgZGlyZWN0IGNhbGxzOgoKICB8ICAgIFRo
ZXJlIGFyZSBhIGZldyBjYXNlcyB0byBkaXN0aW5ndWlzaDoKICB8ICAgIC0gSWYgYSBkaXJlY3Qg
Y2FsbCBvcHMgaXMgdGhlIG9ubHkgb25lIHRyYWNpbmcgYSBmdW5jdGlvbjoKICB8ICAgICAgLSBJ
ZiB0aGUgZGlyZWN0IGNhbGxlZCB0cmFtcG9saW5lIGlzIHdpdGhpbiB0aGUgcmVhY2ggb2YgYSBC
TAogIHwgICAgICAgIGluc3RydWN0aW9uCiAgfCAgICAgICAgIC0+IHRoZSBmdHJhY2UgcGF0Y2hz
aXRlIGp1bXBzIHRvIHRoZSB0cmFtcG9saW5lCiAgfCAgICAgIC0gRWxzZQogIHwgICAgICAgICAt
PiB0aGUgZnRyYWNlIHBhdGNoc2l0ZSBqdW1wcyB0byB0aGUgZnRyYWNlX2NhbGxlciB0cmFtcG9s
aW5lIHdoaWNoCiAgfCAgICAgICAgICAgIHJlYWRzIHRoZSBvcHMgcG9pbnRlciBpbiB0aGUgcGF0
Y2hzaXRlIGFuZCBqdW1wcyB0byB0aGUgZGlyZWN0CiAgfCAgICAgICAgICAgIGNhbGwgYWRkcmVz
cyBzdG9yZWQgaW4gdGhlIG9wcwogIHwgICAgLSBFbHNlCiAgfCAgICAgIC0+IHRoZSBmdHJhY2Ug
cGF0Y2hzaXRlIGp1bXBzIHRvIHRoZSBmdHJhY2VfY2FsbGVyIHRyYW1wb2xpbmUgYW5kIGl0cwog
IHwgICAgICAgICBvcHMgbGl0ZXJhbCBwb2ludHMgdG8gZnRyYWNlX2xpc3Rfb3BzIHNvIGl0IGl0
ZXJhdGVzIG92ZXIgYWxsCiAgfCAgICAgICAgIHJlZ2lzdGVyZWQgZnRyYWNlIG9wcywgaW5jbHVk
aW5nIHRoZSBkaXJlY3QgY2FsbCBvcHMgYW5kIGNhbGxzIGl0cwogIHwgICAgICAgICBjYWxsX2Rp
cmVjdF9mdW5jcyBoYW5kbGVyIHdoaWNoIHN0b3JlcyB0aGUgZGlyZWN0IGNhbGxlZAogIHwgICAg
ICAgICB0cmFtcG9saW5lJ3MgYWRkcmVzcyBpbiB0aGUgZnRyYWNlX3JlZ3MgYW5kIHRoZSBmdHJh
Y2VfY2FsbGVyCiAgfCAgICAgICAgIHRyYW1wb2xpbmUgd2lsbCByZXR1cm4gdG8gdGhhdCBhZGRy
ZXNzIGluc3RlYWQgb2YgcmV0dXJuaW5nIHRvIHRoZQogIHwgICAgICAgICB0cmFjZWQgZnVuY3Rp
b24KCk9uIFJJU0MtViwgd2hlcmUgYXVpcGMvamFsciBpcyB1c2VkLCB0aGUgZGlyZWN0IGNhbGxl
ZCB0cmFtcG9saW5lIHdvdWxkCmFsd2F5cyBiZSByZWFjaGFibGUsIGFuZCB0aGVuIGZpcnN0IEVs
c2UtY2xhdXNlIHdvdWxkIG5ldmVyIGJlIGVudGVyZWQuClRoaXMgbWVhbnMgdGhlIHRoZSBwZXJm
b3JtYW5jZSBmb3IgZGlyZWN0IGNhbGxzIHdvdWxkIGJlIHRoZSBzYW1lIGFzIHRoZQpvbmUgd2Ug
aGF2ZSB0b2RheSAoaS5lLiBubyByZWdyZXNzaW9uISkuCgpSSVNDLVYgZG9lcyBsaWtlIHg4NiBk
b2VzICgtaXNoKSAtLSBwYXRjaCBtdWx0aXBsZSBpbnN0cnVjdGlvbnMsIGxvbmcKcmVhY2guCgpB
cm02NCB1c2VzIENBTExfT1BTIGFuZCBwYXRjaCBvbmUgaW5zdHJ1Y3Rpb24gQkwuCgpOb3csIHdp
dGggdGhpcyBiYWNrZ3JvdW5kIGluIG1pbmQsIGNvbXBhcmVkIHRvIHdoYXQgd2UgaGF2ZSB0b2Rh
eSwKQ0FMTF9PUFMgd291bGQgZ2l2ZSB1cyAoYWdhaW4gYXNzdW1pbmcgd2UncmUgdXNpbmcgaXQg
Zm9yIGRpcmVjdCBjYWxscyk6CgoqIEJldHRlciBwZXJmb3JtYW5jZSBmb3IgdHJhY2VyIHBlci1j
YWxsIChmYXN0ZXIgb3BzIGxvb2t1cCkgR09PRAoqIExhcmdlciB0ZXh0IHNpemUgKGZ1bmN0aW9u
IGFsaWdubWVudCArIGV4dHJhIG5vcHMpIEJBRAoqIFNhbWUgZGlyZWN0IGNhbGwgcGVyZm9ybWFu
Y2UgTkVVVFJBTAoqIFNhbWUgY29tcGxpY2F0ZWQgdGV4dCBwYXRjaGluZyByZXF1aXJlZCBORVVU
UkFMCgpJdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgaG93IHRoZSBwZXItY2FsbCBwZXJm
b3JtYW5jZSB3b3VsZAppbXByb3ZlIG9uIHg4NiB3aXRoIENBTExfT1BTISA7LSkKCkknbSB0cnlp
bmcgdG8gd3JhcCBteSBoZWFkIGlmIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgaXQgb24gUklTQy1W
LCBnaXZlbgp0aGF0IHdlJ3JlIGEgYml0IGRpZmZlcmVudCBmcm9tIEFybTY0LiBEb2VzIHRoZSBz
Y2FsZSB0aXAgdG8gdGhlIEdPT0QKc2lkZT8KCk9oLCBhbmQgd2UgcmVhbGx5IG5lZWQgdG8gc2Vl
IHBlcmZvcm1hbmNlIG51bWJlcnMgb24gcmVhbCBIVyEgSSBoYXZlIGEKVkYyIHRoYXQgSSBjb3Vs
ZCB0cnkgdGhpcyBzZXJpZXMgb24uCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
