Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF866C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lNkNHkDglJperhiJsEpnmf3cKf95Jz+sID2PTqu9XY=; b=A6c2MCIGahFwpI
	+D/byscEo1QevS8yzVq8iDWZYIoCci7IaTgYH/ggcN2/pcIubDlniX4vtZZl1UKp/Ev+2rfxySc24
	C9ST97dKQ9NQXrD6F3rCBbddAwK6ZkwTeuPZUmvfeTQk2djO0tMKm0kr7yEQYyAUkRsFsPBZmfvpo
	kPliNnXTWuobJemKk6wfItSsdkGQ8zzbNSOCC/RWdGeID8uQnad9OHeqEOVrXVvKoijPOUmppjIGp
	Xdx60hU5a18dkWs0N7gFQsXu3nyRpIGoxFy/4kLDBZldDG6wfMtLMqaEvfegdZU9Cu3PDfa4vYKyP
	SU/zygTxtAhZ29CrRiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYHX-00000006Y0R-0l6a;
	Thu, 27 Feb 2025 07:26:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYFz-00000006Xsa-15J1;
	Thu, 27 Feb 2025 07:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D19FF5C1298;
	Thu, 27 Feb 2025 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3C2C4CEDD;
	Thu, 27 Feb 2025 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740641070;
	bh=6mhB09gcTzebblAjDFwvrQdiH2lOS2WxVu0HWi5oqno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YppbzpmdBkKGD8B+tk+kU7/CkxwHuweAntSFmQesgJES1prcypRfA0PjZtDrwr05t
	 4i4mbwqUb6xLvmSRMqCCXVFUF15PoS0zFEeQMzVnVsIJtIAZ2ZhyP7SYbh7SmeZBAs
	 K2/rOA7kCRj1r/0bffpP5aeSTmf1uYeYCXGCRSY4afykZWeqw8wNY2dBuOeWQCiv50
	 yG7v9uvXKWI3CoIjot+vXoVVAHizez7tWk/lYXjd3l+FO4jUD5ckUqhc5bp8iGywd6
	 kX0/qnby7bbBwg27HGU/eKsXqMLYzsp0pRh73ONE5MReYXR9nXPQdvPstdCebvxC2w
	 D6NX1pHw51foA==
Date: Wed, 26 Feb 2025 23:24:27 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/8] perf: Support multiple system call tables in the
 build
Message-ID: <Z8ATKyAhb-67NGIM@google.com>
References: <20250219185657.280286-1-irogers@google.com>
 <Z702_CQ7nMx9fZQn@google.com>
 <CAP-5=fWYiQP84BMjm69xud4vYaRrutRG-RASKbxQaGSisRm7jA@mail.gmail.com>
 <Z7-rN8iGUpPe6b-1@google.com>
 <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fVAuCF4i8HQEGYx_ApcSuBg82pXCsgk98oU9-2Gm=NOcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_232431_375021_9B7AB438 
X-CRM114-Status: GOOD (  50.58  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMDk6MjQ6MTVQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIEZlYiAyNiwgMjAyNSBhdCA0OjAw4oCvUE0gTmFtaHl1bmcgS2ltIDxuYW1o
eXVuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAw
ODoyMjo1MFBNIC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gPiBPbiBNb24sIEZlYiAyNCwg
MjAyNSBhdCA3OjIw4oCvUE0gTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgRmViIDE5LCAyMDI1IGF0IDEwOjU2OjQ5QU0gLTA4
MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+ID4gPiBUaGlzIHdvcmsgYnVpbGRzIG9uIHRoZSBj
bGVhbiB1cCBvZiBzeXN0ZW0gY2FsbCB0YWJsZXMgYW5kIHJlbW92YWwgb2YKPiA+ID4gPiA+IGxp
YmF1ZGl0IGJ5IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFRoZSBzeXN0ZW0gY2FsbCB0YWJsZSBpbiBwZXJmIHRyYWNlIGlzIHVzZWQg
dG8gbWFwIHN5c3RlbSBjYWxsIG51bWJlcnMKPiA+ID4gPiA+IHRvIG5hbWVzIGFuZCB2aWNlIHZl
cnNhLiBQcmlvciB0byB0aGVzZSBjaGFuZ2VzLCBhIHNpbmdsZSB0YWJsZQo+ID4gPiA+ID4gbWF0
Y2hpbmcgdGhlIHBlcmYgYmluYXJ5J3MgYnVpbGQgd2FzIHByZXNlbnQuIFRoZSB0YWJsZSB3b3Vs
ZCBiZQo+ID4gPiA+ID4gaW5jb3JyZWN0IGlmIHRyYWNpbmcgc2F5IGEgMzItYml0IGJpbmFyeSBm
cm9tIGEgNjQtYml0IHZlcnNpb24gb2YKPiA+ID4gPiA+IHBlcmYsIHRoZSBuYW1lcyBhbmQgbnVt
YmVycyB3b3VsZG4ndCBtYXRjaC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2UgdGhlIGJ1aWxk
IHNvIHRoYXQgYSBzaW5nbGUgc3lzdGVtIGNhbGwgZmlsZSBpcyBidWlsdCBhbmQgdGhlCj4gPiA+
ID4gPiBwb3RlbnRpYWxseSBtdWx0aXBsZSB0YWJsZXMgYXJlIGlkZW50aWZpYWJsZSBmcm9tIHRo
ZSBFTEYgbWFjaGluZSB0eXBlCj4gPiA+ID4gPiBvZiB0aGUgcHJvY2VzcyBiZWluZyBleGFtaW5l
ZC4gVG8gZGV0ZXJtaW5lIHRoZSBFTEYgbWFjaGluZSB0eXBlLCB0aGUKPiA+ID4gPiA+IGV4ZWN1
dGFibGUncyBoZWFkZXIgaXMgcmVhZCBmcm9tIC9wcm9jL3BpZC9leGUgd2l0aCBmYWxsYmFja3Mg
dG8gdXNpbmcKPiA+ID4gPiA+IHRoZSBwZXJmJ3MgYmluYXJ5IHR5cGUgd2hlbiB1bmtub3duLgo+
ID4gPiA+Cj4gPiA+ID4gSG1tLi4gdGhlbiB0aGlzIGlzIGxpbWl0ZWQgdG8gbGl2ZSBtb2RlIGFu
ZCBwb3RlbnRpYWxseSBkZXRlY3Qgd3JvbmcKPiA+ID4gPiBtYWNoaW5lIHR5cGUgaWYgaXQgcmVh
ZHMgYW4gb2xkIGRhdGEsIHJpZ2h0Pwo+ID4gPiA+Cj4gPiA+ID4gQWxzbyBJSVVDIGZhbGxiYWNr
IHRvIHRoZSBwZXJmIGJpbmFyeSBtZWFucyBpdCBjYW5ub3QgdXNlIGNyb3NzLW1hY2hpbmUKPiA+
ID4gPiB0YWJsZS4gIEZvciBleGFtcGxlLCBpdCBjYW5ub3QgcHJvY2VzcyBkYXRhIGZyb20gQVJN
NjQgb24geDg2LCBubz8gIEl0Cj4gPiA+ID4gc2VlbXMgaXQgc2hvdWxkIHVzZSBwZXJmX2Vudi5h
cmNoLgo+ID4gPgo+ID4gPiBUaGUgcGVyZiBlbnYgYXJjaCBpcyBraW5kIG9mIGhvcnJpZC4gT24g
eDg2IGl0IGhhcyB0aGUgdmFsdWUgeDg2IGFuZAo+ID4gPiB0aGVuIHRoZXJlIGlzIGFuIGV4dHJh
IDY0Yml0IGZsYWcsIHdobyBrbm93cyBob3cgeDMyIHNob3VsZCBiZSBlbmNvZGVkCj4gPiA+IC0g
YnV0IHdlIGJhcmVseSBzdXBwb3J0IHgzMiBhcy1pcy4gSSdkIHJhdGhlciB3ZSBhZGRlZCBhIG5l
dyBmZWF0dXJlCj4gPiA+IGZvciB0aGUgZV9tYWNoaW5lL2VfZmxhZ3Mgb2YgdGhlIGV4ZWN1dGFi
bGUgYW5kIHdvcmtlZCB3aXRoIHRob3NlLCBidXQKPiA+ID4gaXQgaXMga2luZCBvZiB3ZWlyZCB3
aXRoIGRvaW5nIHN5c3RlbSB3aWRlIG1vZGUuIEkgZGlkbid0IHdhbnQgdG8gZHJhZwo+ID4gPiB0
aGF0IGludG8gdGhpcyBwYXRjaCBzZXJpZXMgYW55d2F5IGFzIHRoZXJlIGlzIGFscmVhZHkgZW5v
dWdoIGhlcmUuCj4gPgo+ID4gUmlnaHQsIEkgZG9uJ3Qga25vdyBob3cgdG8gaGFuZGxlIHgzMiBw
cm9wZXJseS4gIE1heWJlIHdlIGNhbiBqdXN0Cj4gPiBpZ25vcmUgaXQgZm9yIG5vdy4KPiA+Cj4g
PiBCdXQgYW55d2F5IGxvb2tpbmcgYXQgL3Byb2MvUElEIGZvciByZWNvcmRlZCBkYXRhIGRvZXNu
J3Qgc2VlbSBjb3JyZWN0Lgo+ID4gQ2FuIHlvdSBwbGVhc2UgYWRkIGEgZmxhZyB0byBkbyB0aGF0
IG9ubHkgZnJvbSB0cmFjZV9fcnVuKCkgYW5kIGp1c3QgdXNlCj4gPiBFTV9IT1NUIGZvciB0cmFj
ZV9fcmVwbGF5KCk/Cj4gCj4gU28gSSB3YXMgaG9waW5nIGF0IHNvbWUgbGF0ZXIgcG9pbnQgdGhl
IGVfbWFjaGluZSBvbiB0aGUgdGhyZWFkIGNvdWxkCj4gYmUgcG9wdWxhdGVkIGZyb20gdGhlIGRh
dGEgZmlsZSAtIGhlbmNlIHRoZSBhY2Nlc3NvciBiZWluZyBvbiB0aHJlYWQKPiBhbmQgbm90IHBh
cnQgb2YgdGhlIHRyYWNlIGNvZGUuCgpGYWlyIGVub3VnaC4KCgo+IFdlIGNvdWxkIGFkZCBhIGds
b2JhbCBmbGFnIHRvIHRocmVhZAo+IHRvIGRpc2FibGUgdGhlIHJlYWRpbmcgZnJvbSAvcHJvYyBi
dXQgd2UgZG8gc2ltaWxhciByZWFkaW5nIGluCj4gbWFjaGluZS5jIGZvciAvcHJvYy92ZXJzaW9u
LCAvcHJvYy9rYWxsc3ltcywgL3Byb2MvbW9kdWxlcywgZXRjLgoKWW91IGNhbiBhZGQgYSBmbGFn
IHRvIHN0cnVjdCB0cmFjZSBhbmQgb25seSBjYXJlIGFib3V0IHRoZSBwZXJmIHRyYWNlCnVzZSBj
YXNlIC0gd2hldGhlciB0byBjYWxsIHRocmVhZF9fZ2V0X2VfbWFjaGluZSgpIG9yIG5vdC4KCklu
IGdlbmVyYWwsIHJlYWRpbmcgL3Byb2MgZnJvbSBwZXJmIHJlY29yZCBpcyBmaW5lLiAgQnV0IGRv
aW5nIHRoYXQgZnJvbQpwZXJmIHJlcG9ydCBvciBzaW1pbGFyIGlzIG5vdCBnb29kLiAgWW91IGRv
bid0IG5lZWQgdG8gZml4IHRoZW0sIGlmIGFueSwKd2l0aCB0aGlzIGNoYW5nZS4gIEJ1dCBsZXQn
cyBub3QgaW50cm9kdWNlIG1vcmUgYnVncy4KCgo+IEkgdGhpbmsgdGhlIGNoYW5jZSBhIHBpZCBp
cyByZWN5Y2xlZCBhbmQgdGhlIHByb2Nlc3MgaGFzIGEgZGlmZmVyZW50Cj4gZV9tYWNoaW5lIGFy
ZSByZW1vdGUgZW5vdWdoIHRoYXQgaXQgaXMgc2ltaWxhciBpbiBuYXR1cmUuIEFkZGluZyB0aGUK
PiBmbGFnIG1lYW5zIHdlIG5lZWQgdG8gZ28gYW5kIGZpeCB1cCBhbGwgdXNlcywgd2Ugb25seSBu
ZWVkIHRvIHNldCB0aGUKPiBmbGFnIGluIGJ1aWx0aW4tdHJhY2UuYyBjdXJyZW50bHksIGJ1dCB3
ZSd2ZSBiZWVuIGhpc3RvcmljYWxseSBiYWQgYXQKPiBzZXR0aW5nIHRoZXNlIGdsb2JhbHMgYW5k
IGJ1Z3MgY3JlZXAgaW4uIEkgYWxzbyBkb24ndCB0aGluawo+IHJlY29yZC9yZXBsYXkgaXMgd29y
a2luZyB3ZWxsIGFuZCBJIGRpZG4ndCB3YW50IHRoZSBzeXNjYWxsdGJsIGNsZWFudXAKPiB0byB0
dXJuIGludG8gYSBwZXJmIHRyYWNlIHJlY29yZC9yZXBsYXkgZml4aW5nIGV4ZXJjaXNlLgoKWWVw
LCBwbGVhc2Ugc2VlIGFib3ZlLiAgQW55d2F5IEkgdGhpbmsgcmVjb3JkL3JlcGxheSBvbiB0aGUg
c2FtZSBtYWNoaW5lCmlzIHdvcmtpbmcgd2VsbC4KClRoYW5rcywKTmFtaHl1bmcKCj4gCj4gPiBM
YXRlciwgd2UgbWF5IG5lZWQgdG8gYWRkIGEgbWlzYyBmbGFnIG9yIHNvIHRvIFBFUkZfUkVDT1JE
X0ZPUksgKGFuZAo+ID4gUEVSRl9SRUNPUkRfQ09NTSB3aXRoIE1JU0NfQ09NTV9FWEVDKSB0byBp
bmRpY2F0ZSBub24tc3RhbmRhcmQgQUJJIGZvciBhCj4gPiBuZXcgdGhyZWFkLiAgQnV0IGl0J3Mg
bm90IGNsZWFyIGhvdyB0byBtYWtlIGl0IGFyY2gtaW5kZXBlbmRlbnQuCj4gPgo+ID4gPgo+ID4g
PiA+IE9uZSBtb3JlIGNvbmNlcm4gaXMgQlBGLiAgVGhlIEJQRiBzaG91bGQga25vdyBhYm91dCB0
aGUgQUJJIG9mIHRoZQo+ID4gPiA+IGN1cnJlbnQgcHJvY2VzcyBzbyB0aGF0IGl0IGNhbiBhdWdt
ZW50IHRoZSBzeXNjYWxsIGFyZ3VtZW50cyBjb3JyZWN0bHkuCj4gPiA+ID4gQ3VycmVudGx5IGl0
IG9ubHkgY2hlY2tzIHRoZSBzeXNjYWxsIG51bWJlciBidXQgaXQgY2FuIGJlIGRpZmZlcmVudCBv
bgo+ID4gPiA+IDMyLWJpdCBhbmQgNjQtYml0Lgo+ID4gPgo+ID4gPiBUaGF0J3MgcmlnaHQuIFRo
aXMgY2hhbmdlIGlzIHRyeWluZyB0byBjbGVhbiB1cAo+ID4gPiB0b29scy9wZXJmL3V0aWwvc3lz
Y2FsbHRibC5jIGFuZCB0aGUgcGVyZiB0cmFjZSB1c2FnZS4gSSBkaWRuJ3QgZ28gYXMKPiA+ID4g
ZmFyIGFzIG1ha2luZyBCUEYgcHJvZ3JhbXMgcGFpciBzeXN0ZW0gY2FsbCBudW1iZXIgd2l0aCBl
X21hY2hpbmUgYW5kCj4gPiA+IGVfZmxhZ3MsIHRoZXJlIGlzIGVub3VnaCBoZXJlIGFuZCB0aGUg
YmVoYXZpb3IgYWZ0ZXIgdGhlc2UgcGF0Y2hlcwo+ID4gPiBtYXRjaGVzIHRoZSBiZWhhdmlvciBi
ZWZvcmUgLSB0aGF0IGlzIHRvIGFzc3VtZSB0aGUgc3lzdGVtIGNhbGwgQUJJCj4gPiA+IG1hdGNo
ZXMgdGhhdCBvZiB0aGUgcGVyZiBiaW5hcnkuCj4gPgo+ID4gUmlnaHQsIHRoZSBuZXh0IHN0ZXAg
d291bGQgYmUgYWRkaW5nIGEgQlBGIGtmdW5jIHRvIGlkZW50aWZ5IHRoZSBjdXJyZW50Cj4gPiBB
QkkuCj4gPgo+ID4gVGhhbmtzLAo+ID4gTmFtaHl1bmcKPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
