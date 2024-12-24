Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C50E7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 03:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLGUwnhsZxinrkQX8/YBhBemYINeY4NI1s293CMtRwI=; b=x38sntz59pQokP
	hoQyOGzDFS6qPt732tAg6eqHhVrAP8iEaM76dNaHFMu1LcZl+JUPMuzUgy1FhFc60yYrfqKE6HmLZ
	sQNik7iwSOSwRxT/evkd3ewhIvErsGi5eIA3WZdillfKzg6RQB32QNfd8GE3CjmKXchX1RnxbZU9x
	7W3oGsVathXfgE5F/SYB5p6NbK+veOOWtD+LiuvQMuFe5SqxKC4s3fLcp2KaWFFdPZpmJKL4NIFMW
	OMTuBL47hHgxnf6b/elu4JHje3/VjMHbCPvn3GvF9IUyAuiukb4yqnXExUHPaCV0DVu6W1ATKAjQK
	ooOWnWh237b2b1gqI9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvO3-0000000BAeP-2xh3;
	Tue, 24 Dec 2024 03:15:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvO0-0000000BAdw-1ovf
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 03:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4CD1A40C69;
	Tue, 24 Dec 2024 03:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FEC4CED3;
	Tue, 24 Dec 2024 03:15:04 +0000 (UTC)
Date: Mon, 23 Dec 2024 22:15:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com,
 puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com,
 greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
 tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com,
 zong.li@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
Message-ID: <20241223221556.1f5e598f@gandalf.local.home>
In-Reply-To: <87frncmkre.fsf@all.your.base.are.belong.to.us>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <87frncmkre.fsf@all.your.base.are.belong.to.us>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_191508_627240_73ACE52E 
X-CRM114-Status: GOOD (  35.79  )
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

T24gV2VkLCAyNyBOb3YgMjAyNCAyMjoyNTo1NyArMDEwMApCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gQWRkaW5nIFN0ZXZlbi4KCkFuZCB0aGlzIGhhcyBiZWVuIGlu
IG15IGRyYWZ0IGZvbGRlciBmb3IgYWxtb3N0IGEgbW9udGggOi1wCgpJIGtlcHQgY29taW5nIHRv
IHRoaXMgZW1haWwsIGJ1dCB0aGVuIGdvdCBkaXN0cmFjdGVkIGJ5IHNvbWV0aGluZyBlbHNlLgoK
PiAKPiBBbmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+ID4gVGhpcyBz
ZXJpZXMgbWFrZXMgYXRtb2ljIGNvZGUgcGF0Y2hpbmcgcG9zc2libGUgaW4gcmlzY3YgZnRyYWNl
LiBBCj4gPiBkaXJlY3QgYmVuZWZpdCBvZiB0aGlzIGlzIHRoYXQgd2UgY2FuIGdldCByaWQgb2Yg
c3RvcF9tYWNoaW5lKCkgd2hlbgo+ID4gcGF0Y2hpbmcgZnVuY3Rpb24gZW50cmllcy4gVGhpcyBh
bHNvIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHJ1biBmdHJhY2UKPiA+IHdpdGggZnVsbCBrZXJuZWwg
cHJlZW1wdGlvbi4gQmVmb3JlIHRoaXMgc2VyaWVzLCB0aGUga2VybmVsIGluaXRpYWxpemVzCj4g
PiBwYXRjaGFibGUgZnVuY3Rpb24gZW50cmllcyB0byBOT1A0ICsgTk9QNC4gVG8gc3RhcnQgdHJh
Y2luZywgaXQgdXBkYXRlcwo+ID4gZW50cmllcyB0byBBVUlQQyArIEpBTFIgd2hpbGUgaG9sZGlu
ZyBvdGhlciBjb3JlcyBpbiBzdG9wX21hY2hpbmUuCj4gPiBzdG9wX21hY2hpbmUoKSBpcyByZXF1
aXJlZCBiZWNhdXNlIGl0IGlzIGltcG9zc2libGUgdG8gdXBkYXRlIDIKPiA+IGluc3RydWN0aW9u
cywgYW5kIGJlIHNlZW4gYXRvbWljYWxseS4gQW5kIHByZWVtcHRpb24gbXVzdCBoYXZlIHRvIGJl
Cj4gPiBwcmV2ZW50ZWQsIGFzIGtlcm5lbCBwcmVlbXB0aW9uIGFsbG93cyBwcm9jZXNzIHRvIGJl
IHNjaGVkdWxlZCBvdXQgd2hpbGUKPiA+IGV4ZWN1dGluZyBvbiBvbmUgb2YgdGhlc2UgaW5zdHJ1
Y3Rpb24gcGFpcnMuCj4gPgo+ID4gVGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRoZSBwcm9ibGVtIGJ5
IGluaXRpYWxpemluZyB0aGUgZmlyc3QgTk9QNCB0bwo+ID4gQVVJUEMuIFNvLCBhdG1vaWMgcGF0
Y2hpbmcgaXMgcG9zc2libGUgYmVjYXVzZSB0aGUga2VybmVsIG9ubHkgaGFzIHRvCj4gPiB1cGRh
dGUgb25lIGluc3RydWN0aW9uLiBBcyBsb25nIGFzIHRoZSBpbnN0cnVjdGlvbiBpcyBuYXR1cmFs
bHkgYWxpZ25lZCwKPiA+IHRoZW4gaXQgaXMgZXhwZWN0ZWQgdG8gYmUgdXBkYXRlZCBhdG9taWNh
bGx5Lgo+ID4KPiA+IEhvd2V2ZXIsIHRoZSBhZGRyZXNzIHJhbmdlIG9mIHRoZSBmdHJhY2UgdHJh
bXBvbGluZSBpcyBsaW1pdGVkIHRvICstMksKPiA+IGZyb20gZnRyYWNlX2NhbGxlciBhZnRlciBh
cHBwbHlpbmcgdGhpcyBzZXJpZXMuIFRoaXMgaXNzdWUgaXMgZXhwZWN0ZWQKPiA+IHRvIGJlIHNv
bHZlZCBieSBQdXJhbmpheSdzIENBTExfT1BTLCB3aGVyZSBpdCBhZGRzIDhCIG5hdHVyYWxseSBh
bGlnbgo+ID4gZGF0YSBpbiBmcm9udCBvZiBwYWN0aGFibGUgZnVuY3Rpb25zIGFuZCBjYW4gIHVz
ZSBpdCB0byBkaXJlY3QgZXhlY3V0aW9uCj4gPiBvdXQgdG8gYW55IGN1c3RvbSB0cmFtcG9saW5l
cy4KPiA+Cj4gPiBUaGUgc2VyaWVzIGlzIGNvbXBvc2VkIGJ5IHRocmVlIHBhcnRzLiBUaGUgZmly
c3QgcGFydCBjbGVhbnMgdXAgdGhlCj4gPiBleGlzdGluZyBpc3N1ZXMgd2hlbiB0aGUga2VybmVs
IGlzIGNvbXBpbGVkIHdpdGggY2xhbmcuVGhlIHNlY29uZCBwYXJ0Cj4gPiBtb2RpZmllcyB0aGUg
ZnRyYWNlIGNvZGUgcGF0Y2hpbmcgbWVjaGFuaXNtICgyLTQpIGFzIG1lbnRpb25lZCBhYm92ZS4K
PiA+IFRoZW4gcHJlcGFyZSBmdHJhY2UgdG8gYmUgYWJsZSB0byBydW4gd2l0aCBrZXJuZWwgcHJl
ZW1wdGlvbiAoNSw2KQo+ID4KPiA+IEFuIG9uZ29pbmcgZml4Ogo+ID4KPiA+IFNpbmNlIHRoZXJl
IGlzIG5vIHJvb20gZm9yIG1hcmtpbmcgKmtlcm5lbF90ZXh0X2FkZHJlc3MgYXMgbm90cmFjZVsx
XSBhdAo+ID4gc291cmNlIGNvZGUgbGV2ZWwsIHRoZXJlIGlzIGEgc2lnbmlmaWNhbnQgcGVyZm9y
bWFuY2UgcmVncmVzc2lvbiB3aGVuCj4gPiB1c2luZyBmdW5jdGlvbl9ncmFwaCB3aXRoIFRSQUNF
X0lSUUZMQUdTIGVuYWJsZWQuIFRoZXJlIGNhbiBiZSBhcyBtdWNoIGFzCj4gPiA4IGdyYXBoIGhh
bmRsZXIgYmVpbmcgY2FsbGVkIGluIGVhY2ggZnVuY3Rpb24tZW50cnkuIFRoZSBjdXJyZW50Cj4g
PiB3b3JrYXJvdW5kIHJlcXVpcmVzIHVzIGVjaG8gIiprZXJuZWxfdGV4dF9hZGRyZXNzIiBpbnRv
Cj4gPiBzZXRfZnRyYWNlX25vdHJhY2UgYmVmb3JlIHN0YXJ0aW5nIHRoZSB0cmFjZS4gSG93ZXZl
ciwgd2Ugb2JzZXJ2ZWQgdGhhdAo+ID4gdGhlIGtlcm5lbCBzdGlsbCBlbmFibGVzIHRoZSBwYXRj
aCBzaXRlIGluIHNvbWUgY2FzZXMgZXZlbiB3aXRoCj4gPiAqa2VybmVsX3RleHRfYWRkcmVzcyBw
cm9wZXJseSBhZGRlZCBpbiB0aGUgZmlsZSBXaGlsZSB0aGUgcm9vdCBjYXVzZSBpcwo+ID4gc3Rp
bGwgdW5kZXIgaW52ZXN0YWd0aW9uLCB3ZSBjb25zaWRlciB0aGF0IGl0IHNob3VsZCBub3QgYmUg
dGhlIHJlYXNvbgo+ID4gZm9yIGhvbGRpbmcgYmFjayB0aGUgY29kZSBwYXRjaGluZywgaW4gb3Jk
ZXIgdG8gdW5ibG9jayB0aGUgY2FsbF9vcHMKPiA+IHBhcnQuICAKPiAKPiBNYXliZSBTdGV2ZW4g
a25vd3MgdGhpcyBmcm9tIHRoZSB0b3Agb2YgaGlzIGhlYWQhCj4gCj4gQXMgQW5keSBwb2ludHMg
b3V0LCAiKmtlcm5lbF90ZXh0X2FkZHJlc3MiIGlzIHVzZWQgaW4gdGhlIHN0YWNrCj4gdW53aW5k
aW5nIG9uIFJJU0MtVi4gU28sIGlmIHlvdSBkbyBhIHRyYWNpbmcgd2l0aG91dCBmaWx0ZXJpbmcg
KmFuZCoKPiBUUkFDRV9JUlFGTEFHUywgb25lIHdpbGwgZHJvd24gaW4gdHJhY2VzLgoKSSB0ZXN0
ZWQgc2V0X2Z0cmFjZV9ub3RyYWNlIG9uIHg4NiBhbmQgdGhlIGZ1bmN0aW9uIGdyYXBoIHRyYWNl
ciBkb2VzIGhvbm9yCml0LiBJIHdvbmRlciBpZiB0aGVyZSdzIGEga2VybmVsCgkJCj4gCj4gRS5n
LiB0aGUgZnRyYWNlIHNlbGZ0ZXN0Ogo+ICAgfCAkIC4vZnRyYWNldGVzdCAtdnZ2IHRlc3QuZC9m
dHJhY2UvZmdyYXBoLW11bHRpLnRjCj4gCj4gd2lsbCBnZW5lcmF0ZSBhIGxvdCBvZiB0cmFjZXMu
Cj4gCj4gTm93LCBpZiB3ZSBhZGQ6Cj4gLS04PC0tCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1tdWx0aS50YyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1tdWx0aS50Ywo+
IGluZGV4IGZmODhmOTdlNDFmYi4uNGYzMGE0ZDgxZDk5IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1tdWx0aS50Ywo+ICsr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1t
dWx0aS50Ywo+IEBAIC04NCw2ICs4NCw3IEBAIGNkICRJTlNUQU5DRTIKPiAgZG9fdGVzdCAnKnJj
dSonICdyY3UnCj4gIGNkICRXRAo+ICBjZCAkSU5TVEFOQ0UzCj4gK2VjaG8gJyprZXJuZWxfdGV4
dF9hZGRyZXNzJyA+IHNldF9mdHJhY2Vfbm90cmFjZQo+ICBlY2hvIGZ1bmN0aW9uX2dyYXBoID4g
Y3VycmVudF90cmFjZXIKPiAgCj4gIHNsZWVwIDEKPiAtLT44LS0gIAo+IAo+IFRoZSBncmFwaCB0
cmFjZXIgd2lsbCBub3QgaG9ub3IgdGhlICJzZXRfZnRyYWNlX25vdHJhY2UiIGluICRJTlNUQU5D
RTMsCj4gYnV0IHN0aWxsIGVuYWJsZSB0aGUgKmtlcm5lbF90ZXh0X2FkZHJlc3MgdHJhY2VzLiAo
Tm90ZSB0aGF0IHRoZXJlIGFyZQo+IG5vIGZpbHRlcnMgaW4gdGhlIHRlc3QsIHNvICphbGwqIGZ0
cmFjZSByZWNzIHdpbGwgYmUgZW5hYmxlZC4pCj4gCj4gQXJlIHdlIGhvbGRpbmcgdGhlIGdyYXBo
IHRyYWNlciB3cm9uZz8KCldoYXQgZG8geW91IGdldCB3aGVuIHlvdSBkbzoKCiAgIyBncmVwIGtl
cm5lbF90ZXh0X2FkZHJlc3MgYXZhaWxhYmxlX2ZpbHRlcl9mdW5jdGlvbnMKCj8KCj4gCj4gCj4g
SGFwcHkgdGhhbmtzZ2l2aW5nIQo+IEJqw7ZybgoKQW5kIE1lcnJ5IENocmlzdG1hcyEKCi0tIFN0
ZXZlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
