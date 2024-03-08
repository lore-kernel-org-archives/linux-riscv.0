Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9EBC54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPhTARyy0+EhK4dCeGmKqurZ0jyRKmimDQpX2PUYGWg=; b=WoB9gjB6kJdm5O
	7qKweTmdKV44Y2vruOpVjQkx63gd3Yf/dw4pxEsameAZ+GPnCQxPHxsTve5mVvfj8oGS4srJ5DwZa
	OEFMpUt16HEcd4KdJM4svIeUUfj4s14ekwOloxuVGUcsmXr0/ZuStwcb0Nd9Tag6QPrzGwUveUZGC
	mTmXsrjFFr1Cx0GHRt5Wm4RM0bSgxTWJcNMIhBiQMk2vZQUIp/m5/wGhWeOxwcWTyi6LdvqNyN9Dh
	fd9Vt0hWMa9VWwM7a0pbeDp95eb0WvXN3hN3Y1ThqQk9b2jK+08RFxEBw5PtlBB/FSGtctTsMxD3z
	9G7+87PGow00eD58IfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXHE-00000008ivA-1hsD;
	Fri, 08 Mar 2024 10:16:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXHA-00000008isl-3PKl
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 10:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB163CE2569;
	Fri,  8 Mar 2024 10:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0534C43394;
	Fri,  8 Mar 2024 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709892986;
	bh=sr34wHQR+GgEvXvJDRqEnla88k1cwdRe+zsxhA2KPFk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EJedCYhXdgxyKjMGasPYqipqYYnAZ65LM3kQ+MHKrTlT9ZQ6rN+iU1TjJzblviJlf
	 Bp0hjP/p0J+cqLJIc+OoPiaXTDVcq3/JNysNf8vghkPPjzzT04VAd13OhUxFgtUkNO
	 UZYcqCM7BCzjgfhi22rKrbkYVKw+9r8SjfIRYuNnE7FVE3I+drOz8NvYcWzQulUUL6
	 VYrhEdiK/NfyqFLsn4IrrH6lKiiJNVx6HDIe6BNPQRVQkAUt+LbYtqAsbaT1uFhkcR
	 Cm5AuETZI2VtDtymRdum/yjwzIB0IFswVkTbhlI18Jyd1jaTdIkL7kpFHYKmFDPpGx
	 HYJ3JRpC1CkMQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Song
 Shuai <suagrfillet@gmail.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com>
Date: Fri, 08 Mar 2024 11:16:23 +0100
Message-ID: <87jzmdowp4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_021629_325070_9F84FAB7 
X-CRM114-Status: GOOD (  28.57  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEhpIEJqw7Zy
biwKPgo+IE9uIFRodSwgTWFyIDcsIDIwMjQgYXQgODoyN+KAr1BNIEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBQdXJhbmpheSEKPj4KPj4gUHVyYW5qYXkgTW9o
YW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cj4+Cj4+ID4gVGhpcyBwYXRjaCBlbmFi
bGVzIHN1cHBvcnQgZm9yIERZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMgb24gUklTQy1WLgo+
PiA+IFRoaXMgYWxsb3dzIGVhY2ggZnRyYWNlIGNhbGxzaXRlIHRvIHByb3ZpZGUgYW4gZnRyYWNl
X29wcyB0byB0aGUgY29tbW9uCj4+ID4gZnRyYWNlIHRyYW1wb2xpbmUsIGFsbG93aW5nIGVhY2gg
Y2FsbHNpdGUgdG8gaW52b2tlIGRpc3RpbmN0IHRyYWNlcgo+PiA+IGZ1bmN0aW9ucyB3aXRob3V0
IHRoZSBuZWVkIHRvIGZhbGwgYmFjayB0byBsaXN0IHByb2Nlc3Npbmcgb3IgdG8KPj4gPiBhbGxv
Y2F0ZSBjdXN0b20gdHJhbXBvbGluZXMgZm9yIGVhY2ggY2FsbHNpdGUuIFRoaXMgc2lnbmlmaWNh
bnRseSBzcGVlZHMKPj4gPiB1cCBjYXNlcyB3aGVyZSBtdWx0aXBsZSBkaXN0aW5jdCB0cmFjZSBm
dW5jdGlvbnMgYXJlIHVzZWQgYW5kIGNhbGxzaXRlcwo+PiA+IGFyZSBtb3N0bHkgdHJhY2VkIGJ5
IGEgc2luZ2xlIHRyYWNlci4KPj4gPgo+PiA+IFRoZSBpZGVhIGFuZCBtb3N0IG9mIHRoZSBpbXBs
ZW1lbnRhdGlvbiBpcyB0YWtlbiBmcm9tIHRoZSBBUk02NCdzCj4+ID4gaW1wbGVtZW50YXRpb24g
b2YgdGhlIHNhbWUgZmVhdHVyZS4gVGhlIGlkZWEgaXMgdG8gcGxhY2UgYSBwb2ludGVyIHRvCj4+
ID4gdGhlIGZ0cmFjZV9vcHMgYXMgYSBsaXRlcmFsIGF0IGEgZml4ZWQgb2Zmc2V0IGZyb20gdGhl
IGZ1bmN0aW9uIGVudHJ5Cj4+ID4gcG9pbnQsIHdoaWNoIGNhbiBiZSByZWNvdmVyZWQgYnkgdGhl
IGNvbW1vbiBmdHJhY2UgdHJhbXBvbGluZS4KPj4KPj4gTm90IHJlYWxseSBhIHJldmlldywgYnV0
IHNvbWUgbW9yZSBiYWNrZ3JvdW5kOyBBbm90aGVyIHJhdGlvbmFsZSAob24tdG9wCj4+IG9mIHRo
ZSBpbXByb3ZlZCBwZXItY2FsbCBwZXJmb3JtYW5jZSEpIGZvciBDQUxMX09QUyB3YXMgdG8gdXNl
IGl0IHRvCj4+IGJ1aWxkIGZ0cmFjZSBkaXJlY3QgY2FsbCBzdXBwb3J0ICh3aGljaCBCUEYgdXNl
cyBhIGxvdCEpLiBNYXJrLCBwbGVhc2UKPj4gY29ycmVjdCBtZSBpZiBJJ20gbHlpbmcgaGVyZSEK
Pj4KPj4gT24gQXJtNjQsIENBTExfT1BTIG1ha2VzIGl0IHBvc3NpYmxlIHRvIGltcGxlbWVudCBk
aXJlY3QgY2FsbHMsIHdoaWxlCj4+IG9ubHkgcGF0Y2hpbmcgb25lIEJMIGluc3RydWN0aW9uIC0t
IG5pY2UhCj4+Cj4+IE9uIFJJU0MtViB3ZSBjYW5ub3QgdXNlIHVzZSB0aGUgc2FtZSBpZGVhcyBh
cyBBcm02NCBzdHJhaWdodCBvZmYsCj4+IGJlY2F1c2UgdGhlIHJhbmdlIG9mIGphbCAoY29tcGFy
ZSB0byBCTCkgaXMgc2ltcGx5IHRvbyBzaG9ydCAoKy8tMU0pLgo+PiBTbywgb24gUklTQy1WIHdl
IG5lZWQgdG8gdXNlIGEgZnVsbCBhdWlwYy9qYWwgcGFpciAodGhlIHRleHQgcGF0Y2hpbmcKPj4g
c3RvcnkgaXMgYW5vdGhlciBjaGFwdGVyLCBidXQgbGV0J3MgbGVhdmUgdGhhdCBhc2lkZSBmb3Ig
bm93KS4gU2luY2Ugd2UKPj4gaGF2ZSB0byBwYXRjaCBtdWx0aXBsZSBpbnN0cnVjdGlvbnMsIHRo
ZSBjbW9keCBzaXR1YXRpb24gZG9lc24ndCByZWFsbHkKPj4gaW1wcm92ZSB3aXRoIENBTExfT1BT
Lgo+Pgo+PiBMZXQncyBzYXkgdGhhdCB3ZSBjb250aW51ZSBidWlsZGluZyBvbiB5b3VyIHBhdGNo
IGFuZCBpbXBsZW1lbnQgZGlyZWN0Cj4+IGNhbGxzIG9uIENBTExfT1BTIGZvciBSSVNDLVYgYXMg
d2VsbC4KPj4KPj4gRnJvbSBGbG9yZW50J3MgY29tbWl0IG1lc3NhZ2UgZm9yIGRpcmVjdCBjYWxs
czoKPj4KPj4gICB8ICAgIFRoZXJlIGFyZSBhIGZldyBjYXNlcyB0byBkaXN0aW5ndWlzaDoKPj4g
ICB8ICAgIC0gSWYgYSBkaXJlY3QgY2FsbCBvcHMgaXMgdGhlIG9ubHkgb25lIHRyYWNpbmcgYSBm
dW5jdGlvbjoKPj4gICB8ICAgICAgLSBJZiB0aGUgZGlyZWN0IGNhbGxlZCB0cmFtcG9saW5lIGlz
IHdpdGhpbiB0aGUgcmVhY2ggb2YgYSBCTAo+PiAgIHwgICAgICAgIGluc3RydWN0aW9uCj4+ICAg
fCAgICAgICAgIC0+IHRoZSBmdHJhY2UgcGF0Y2hzaXRlIGp1bXBzIHRvIHRoZSB0cmFtcG9saW5l
Cj4+ICAgfCAgICAgIC0gRWxzZQo+PiAgIHwgICAgICAgICAtPiB0aGUgZnRyYWNlIHBhdGNoc2l0
ZSBqdW1wcyB0byB0aGUgZnRyYWNlX2NhbGxlciB0cmFtcG9saW5lIHdoaWNoCj4+ICAgfCAgICAg
ICAgICAgIHJlYWRzIHRoZSBvcHMgcG9pbnRlciBpbiB0aGUgcGF0Y2hzaXRlIGFuZCBqdW1wcyB0
byB0aGUgZGlyZWN0Cj4+ICAgfCAgICAgICAgICAgIGNhbGwgYWRkcmVzcyBzdG9yZWQgaW4gdGhl
IG9wcwo+PiAgIHwgICAgLSBFbHNlCj4+ICAgfCAgICAgIC0+IHRoZSBmdHJhY2UgcGF0Y2hzaXRl
IGp1bXBzIHRvIHRoZSBmdHJhY2VfY2FsbGVyIHRyYW1wb2xpbmUgYW5kIGl0cwo+PiAgIHwgICAg
ICAgICBvcHMgbGl0ZXJhbCBwb2ludHMgdG8gZnRyYWNlX2xpc3Rfb3BzIHNvIGl0IGl0ZXJhdGVz
IG92ZXIgYWxsCj4+ICAgfCAgICAgICAgIHJlZ2lzdGVyZWQgZnRyYWNlIG9wcywgaW5jbHVkaW5n
IHRoZSBkaXJlY3QgY2FsbCBvcHMgYW5kIGNhbGxzIGl0cwo+PiAgIHwgICAgICAgICBjYWxsX2Rp
cmVjdF9mdW5jcyBoYW5kbGVyIHdoaWNoIHN0b3JlcyB0aGUgZGlyZWN0IGNhbGxlZAo+PiAgIHwg
ICAgICAgICB0cmFtcG9saW5lJ3MgYWRkcmVzcyBpbiB0aGUgZnRyYWNlX3JlZ3MgYW5kIHRoZSBm
dHJhY2VfY2FsbGVyCj4+ICAgfCAgICAgICAgIHRyYW1wb2xpbmUgd2lsbCByZXR1cm4gdG8gdGhh
dCBhZGRyZXNzIGluc3RlYWQgb2YgcmV0dXJuaW5nIHRvIHRoZQo+PiAgIHwgICAgICAgICB0cmFj
ZWQgZnVuY3Rpb24KPj4KPj4gT24gUklTQy1WLCB3aGVyZSBhdWlwYy9qYWxyIGlzIHVzZWQsIHRo
ZSBkaXJlY3QgY2FsbGVkIHRyYW1wb2xpbmUgd291bGQKPj4gYWx3YXlzIGJlIHJlYWNoYWJsZSwg
YW5kIHRoZW4gZmlyc3QgRWxzZS1jbGF1c2Ugd291bGQgbmV2ZXIgYmUgZW50ZXJlZC4KPj4gVGhp
cyBtZWFucyB0aGUgdGhlIHBlcmZvcm1hbmNlIGZvciBkaXJlY3QgY2FsbHMgd291bGQgYmUgdGhl
IHNhbWUgYXMgdGhlCj4+IG9uZSB3ZSBoYXZlIHRvZGF5IChpLmUuIG5vIHJlZ3Jlc3Npb24hKS4K
Pj4KPj4gUklTQy1WIGRvZXMgbGlrZSB4ODYgZG9lcyAoLWlzaCkgLS0gcGF0Y2ggbXVsdGlwbGUg
aW5zdHJ1Y3Rpb25zLCBsb25nCj4+IHJlYWNoLgo+Pgo+PiBBcm02NCB1c2VzIENBTExfT1BTIGFu
ZCBwYXRjaCBvbmUgaW5zdHJ1Y3Rpb24gQkwuCj4+Cj4+IE5vdywgd2l0aCB0aGlzIGJhY2tncm91
bmQgaW4gbWluZCwgY29tcGFyZWQgdG8gd2hhdCB3ZSBoYXZlIHRvZGF5LAo+PiBDQUxMX09QUyB3
b3VsZCBnaXZlIHVzIChhZ2FpbiBhc3N1bWluZyB3ZSdyZSB1c2luZyBpdCBmb3IgZGlyZWN0IGNh
bGxzKToKPj4KPj4gKiBCZXR0ZXIgcGVyZm9ybWFuY2UgZm9yIHRyYWNlciBwZXItY2FsbCAoZmFz
dGVyIG9wcyBsb29rdXApIEdPT0QKPgo+IF4gdGhpcyB3YXMgdGhlIG9ubHkgbW90aXZhdGlvbiBm
b3IgbWUgdG8gaW1wbGVtZW50IHRoaXMgcGF0Y2guCj4KPiBJIGRvbid0IHRoaW5rIGltcGxlbWVu
dGluZyBkaXJlY3QgY2FsbHMgb3ZlciBjYWxsIG9wcyBpcyBmcnVpdGZ1bCBmb3IKPiBSSVNDLVYg
YmVjYXVzZSBvbmNlCj4gdGhlIGF1aXBjL2phbHIgY2FuIGJlIHBhdGNoZWQgYXRvbWljYWxseSwg
dGhlIGRpcmVjdCBjYWxsIHRyYW1wb2xpbmUKPiBpcyBhbHdheXMgcmVhY2hhYmxlLgo+IFNvbHZp
bmcgdGhlIGF0b21pYyB0ZXh0IHBhdGNoaW5nIHByb2JsZW0gd291bGQgYmUgZnVuISEgSSBhbSBl
YWdlciB0bwo+IHNlZSBob3cgaXQgd2lsbCBiZQo+IHNvbHZlZC4KCkdpdmVuIHRoZSB1cGNvbWlu
ZyBaamlkIHNwZWMsIHdlJ2xsIHNvb24gYmUgaW4gYSBtdWNoIGJldHRlciBwbGFjZSB3aGVyZQp3
ZSBjYW4gcmVhc29uIGFib3V0IGNtb2R4LgoKPj4gKiBMYXJnZXIgdGV4dCBzaXplIChmdW5jdGlv
biBhbGlnbm1lbnQgKyBleHRyYSBub3BzKSBCQUQKPj4gKiBTYW1lIGRpcmVjdCBjYWxsIHBlcmZv
cm1hbmNlIE5FVVRSQUwKPj4gKiBTYW1lIGNvbXBsaWNhdGVkIHRleHQgcGF0Y2hpbmcgcmVxdWly
ZWQgTkVVVFJBTAo+Pgo+PiBJdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgaG93IHRoZSBw
ZXItY2FsbCBwZXJmb3JtYW5jZSB3b3VsZAo+PiBpbXByb3ZlIG9uIHg4NiB3aXRoIENBTExfT1BT
ISA7LSkKPgo+IElmIEkgcmVtZW1iZXIgZnJvbSBTdGV2ZW4ncyB0YWxrLCB4ODYgdXNlcyBkeW5h
bWljYWxseSBhbGxvY2F0ZWQgdHJhbXBvbGluZXMKPiBmb3IgcGVyIGNhbGxzaXRlIHRyYWNlcnMs
IHdvdWxkIENBTExfT1BTIHByb3ZpZGUgYmV0dGVyIHBlcmZvcm1hbmNlIHRoYW4gdGhhdD8KClBy
b2JhYmx5IG5vdCwgYW5kIGl0IHdhcyByZWFsbHkgYSB0b25ndWUtaW4tY2hlZWsgY29tbWVudCAt
LSBub3RoaW5nIEkKZW5jb3VyYWdlIHlvdSB0byBkbyEKCk5vdywgSSB0aGluayBhIGJldHRlciBh
cHByb2FjaCBmb3IgUklTQy1WIHdvdWxkIGJlIGltcGxlbWVudGluZyB3aGF0IHg4NgpoYXMgKGFy
Y2hfZnRyYWNlX3VwZGF0ZV90cmFtcG9saW5lKCkpLCByYXRoZXIgdGhhbiBDQUxMX09QUyBmb3Ig
UklTQy1WLgoKVGhvdWdodHM/CgoKQmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
