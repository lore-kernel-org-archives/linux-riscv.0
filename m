Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55251CF11CE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/2xvPnP7UZA5QE1IzZ/HLbp4Ah2bZcSeUKzXu0aCy4=; b=mQJg4lNz0ti5FT
	/38yra6xcfk3ou0A5NQBbb2j+wdnHEilwA7n3n86BLmBQkFeQMhJjnEsugwl1F8DdDpRGju/kqZrf
	2HTA7YyraSowp3URL7X7MSenVFuJpBc+pjO4lsT/QJurSMqL/ehOO07aAFQ/69vb7StyfuHryWpB3
	/d8vhcbAsYk21PDhOfzXRCjwrVNSKVjfB5Cz4YM41V0FrvoLQEF9P06bMqaBrNO49KOLbntd/qhYh
	DnYLN9S5hwSVV9i7YILrV85zbjR+1XwOEeAxIxkC1l6O+Re5ozau6kasi8TD+wGJLPbiBKlDmaEep
	T/FfNS5MJ4Ff6e88f8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqmd-0000000CSy0-3KLm;
	Thu, 10 Oct 2024 10:52:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqfV-0000000CRf9-2Q2r;
	Thu, 10 Oct 2024 10:45:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F8B497;
	Thu, 10 Oct 2024 03:45:46 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1225C3F58B;
	Thu, 10 Oct 2024 03:45:11 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:45:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all
 architectures
Message-ID: <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
 <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_034518_333421_09BC5258 
X-CRM114-Status: GOOD (  41.17  )
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

T24gV2VkLCBPY3QgMDksIDIwMjQgYXQgMTA6MTU6MzVQTSArMDIwMCwgQWxpY2UgUnlobCB3cm90
ZToKPiBPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDc6NDPigK9QTSBNYXJrIFJ1dGxhbmQgPG1hcmsu
cnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGljZSwKPiA+Cj4gPiBPbiBUdWUs
IE9jdCAwOCwgMjAyNCBhdCAwNTozNzoxNlBNICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOgo+ID4g
PiBUaGUgS0NGSSBzYW5pdGl6ZXIgc3RvcmVzIHRoZSBDRkkgdGFnIG9mIGEgZnVuY3Rpb24ganVz
dCBiZWZvcmUgaXRzCj4gPiA+IG1hY2hpbmUgY29kZS4gSG93ZXZlciwgdGhlIHBhdGNoYWJsZS1m
dW5jdGlvbi1lbnRyeSBmbGFnIGNhbiBiZSB1c2VkIHRvCj4gPiA+IGludHJvZHVjZSBhZGRpdGlv
bmFsIG5vcCBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSBtYWNoaW5lIGNvZGUsIHRha2luZyB1cAo+
ID4gPiB0aGUgc3BhY2UgdGhhdCBub3JtYWxseSBob2xkcyB0aGUgQ0ZJIHRhZy4KPiA+Cj4gPiBU
byBjbGFyaWZ5LCB3aGVuIHlvdSBzYXkgImJlZm9yZSB0aGUgbWFjaGluZSBjb2RlIiwgZG8geW91
IG1lYW4gd2hlbgo+ID4gTk9QcyBhcmUgcGxhY2VkIGJlZm9yZSB0aGUgZnVuY3Rpb24gZW50cnkg
cG9pbnQ/IGUuZy4gaWYgd2UgY29tcGlsZWQKPiA+IHdpdGggLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnk9TSxOIHdoZXJlIE4gPiAwPyBJJ2xsIHJlZmVyIHRobyB0aGlzIGFzCj4gPiAicHJlLWZ1
bmN0aW9uIE5PUHMiIGJlbG93Lgo+ID4KPiA+IFRoZXJlJ3MgYW4gZXhpc3RpbmcgaW5jb21wYXRp
YmlsaXR5IGJldHdlZW4gQ0ZJIGFuZCBwcmUtZnVuY3Rpb24gTk9Qcwo+ID4gZm9yIEMgY29kZSwg
YmVjYXVzZSB3ZSBvdmVycmlkZSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBvbiBhCj4gPiBw
ZXItZnVuY3Rpb24gYmFzaXMgKGUuZy4gZm9yIG5vaW5zdHIgYW5kIG5vdHJhY2UpLCBhbmQgd2Ug
ZG9uJ3QKPiA+IGN1cnJlbnRseSBoYXZlIGEgbWVjaGFuaXNtIHRvIGVuc3VyZSB0aGUgQ0ZJIHRh
ZyBpcyBpbiB0aGUgc2FtZSBwbGFjZQo+ID4gcmVnYXJkbGVzcy4gVGhpcyBpcyB3aHkgYXJtNjQg
aGFzIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0NBTExfT1BTCj4gPiBkZXBlbmQgb24gIUNG
SS4KPiA+Cj4gPiBGb3IgQyBjb2RlIGF0IGxlYXN0LCBqdXN0IHVzaW5nIHJlZ3VsYXIgLWZwYXRj
aGFibGUtZnVuY3Rpb24tZW50cnk9TSBvcgo+ID4gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9
TSwwIHNob3VsZG4ndCBjaGFuZ2UgdGhlIGxvY2F0aW9uIG9mIHRoZSBDRkkKPiA+IHRhZyByZWxh
dGl2ZSB0byB0aGUgZnVuY3Rpb24gZW50cnlwb2ludCwgYW5kIHNvIHNob3VsZCBoYXZlIG5vIGFk
dmVyc2UKPiA+IGVmZmVjdCBvbiBDRkkuCj4gPgo+ID4gSXMgUnVzdCBhbnkgZGlmZmVyZW50IGhl
cmU/Cj4gCj4gQWgsIG5vIGl0IHNob3VsZG4ndCBiZS4gU2FtaSBjYW4geW91IGNvbmZpcm0/Cj4g
Cj4gPiA+IEluIHRoaXMgY2FzZSwgYSBiYWNrd2FyZHMgb2Zmc2V0IGlzIGFwcGxpZWQgdG8gdGhl
IENGSSB0YWcgdG8gbW92ZQo+ID4gPiB0aGVtIG91dCBvZiB0aGUgd2F5IG9mIHRoZSBub3AgaW5z
dHJ1Y3Rpb25zLiBUbyBlbnN1cmUgdGhhdCBDIGFuZCBSdXN0Cj4gPiA+IGFncmVlIG9uIHRoZSBv
ZmZzZXQgdXNlZCBieSBDRkkgdGFncywgcGFzcyB0aGUKPiA+ID4gLVpwYXRjaGFibGUtZnVuY3Rp
b24tZW50cnkgdG8gcnVzdGMgd2hlbmV2ZXIgaXQgaXMgcGFzc2VkIHRvIHRoZSBDCj4gPiA+IGNv
bXBpbGVyLgo+ID4KPiA+IEFzIGFib3ZlLCBJIHN1c3BlY3QgdGhpcyBpc24ndCBuZWNlc3Nhcnkg
dG8gbWFrZSBDRkkgd29yaywgZm9yIGFueSBjYXNlCj4gPiB0aGF0IHdvcmtzIHdpdGggQyB0b2Rh
eSwgZHVlIHRvIC1mcGF0Y2hhYmxlLWZ1bnRpb24tZW50cnkgYmVpbmcKPiA+IG92ZXJyaWRkZW4g
b24gYSBwZXItZnVuY3Rpb24gYmFzaXMuIEFyZSB5b3Ugc2VlaW5nIGEgcHJvYmxlbSBpbgo+ID4g
cHJhY3RpY2UsIG9yIHdhcyB0aGlzIGZvdW5kIGJ5IGluc3BlY3Rpb24/Cj4gPgo+ID4gSG93ZXZl
ciBJSVVDIHRoaXMgd2lsbCBhbGxvdyBydXN0IHRvIGJlIHRyYWNlZCB2aWEgZnRyYWNlIChhc3N1
bWluZyBydXN0Cj4gPiByZWNvcmRzIHRoZSBpbnN0cnVtZW50ZWQgbG9jYXRpb25zIGFzIGdjYyBh
bmQgY2xhbmcgZG8pOyBpcyB0aGF0IHRoZQo+ID4gY2FzZT8gQXNzdW1pbmcgc28sIGlzIHRoZXJl
IGFueSBBQkkgZGlmZmVyZW5jZSB0aGF0IG1pZ2h0IGJpdGUgdXM/IE9uCj4gPiBhcm02NCB3ZSBy
ZXF1aXJlIHRoYXQgYW55dGhpbmcgbWFya2VkIGluc3RydW1lbnRlZCB3aXRoCj4gPiBwYXRjaGFi
bGUtZnVuY3Rpb24tZW50cnkgc3RyaWN0bHkgZm9sbG93cyB0aGUgQUFQQ1M2NCBjYWxsaW5nIGNv
bnZlbnRpb24KPiA+IGFuZCBvdXIgZnRyYWNlIHRyYW1wb2xpbmVzIHNhdmUvcmVzdG9yZSB0aGUg
bWluaW1hbCBzZXQgb2YgbmVjZXNzYXJ5Cj4gPiByZWdpc3RlcnMsIGFuZCBJIGRvbid0IGtub3cg
aG93IHJ1c3Qgd2hldGhlciBydXN0IHdpbGwgYmVoYXZlIHRoZSBzYW1lCj4gPiBvciBlLmcuIHVz
ZSBzcGVjaWFsaXplZCBjYWxsaW5nIGNvbnZlbnRpb25zIGludGVybmFsbHkuCj4gCj4gV2VsbCwg
SSB3YXMgdG9sZCB0aGF0IGl0J3MgYSBwcm9ibGVtIGFuZCB3YXMgYWJsZSB0byB0cmlnZ2VyIGEg
ZmFpbHVyZQo+IG9uIHg4Ni4gSSBkaWRuJ3QgbWFuYWdlIHRvIHRyaWdnZXIgb25lIG9uIGFybTY0
LCBidXQgSSB3YXNuJ3Qgc3VyZQo+IHdoZXRoZXIgdGhhdCB3YXMgbWUgZG9pbmcgc29tZXRoaW5n
IHdyb25nLCBvciB3aGV0aGVyIHRoZSBwcm9ibGVtIG9ubHkKPiBleGlzdHMgb24geDg2LiBXZSBh
bHJlYWR5IGhhdmUgdGhlIGZsYWcgb24geDg2IGZvciBGSU5FSUJULCAKCkkgYmVsaWV2ZSB0aGF0
IGh0ZSBwcm9ibGVtIG9ubHkgZXhpc3RzIG9uIHg4NiwgYmVjYWF1c2UgdGhleSB1c2UgCnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeSBmb3IgdGhlaXIgRklORUlCVCBwYXRjaGluZyAoYW5kIHVzZSAt
bWZlbnRyeQpmb3IgZnRyYWNlKSwgd2hlcmVhcyBldmVyeW9uZSBlbHNlIHVzZXMgcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5IGZvcgpmdHJhY2UuCgo+IGJ1dCBJIHRob3VnaHQgb24gdGhlIG9mZiBj
aGFuY2UgdGhhdCBpdCdzIG5vdCBhIHByb2JsZW0gaW4gcHJhY3RpY2Ugb24KPiBhcm0sIGl0IHN0
aWxsIGRvZXNuJ3QgaHVydCB0byBhZGQgdGhlIGZsYWcuCgpJdCB3b24ndCBhZHZlcnNlbHkgYWZm
ZWN0IENGSSwgYnV0IGl0IHdpbGwgb3BlbiB1cCBydXN0IGNvZGUgZm9yIGZ0cmFjZSwKc28gSSdt
IG5vdCBzdXJlIHRoYXQgIml0IGRvZXNuJ3QgaHVydCIuCgpBRkFJQ1QgYXQgdGhlIG1vbWVudCB0
aGlzIGlzbid0IG5lY2Vzc2FyeSBmb3IgQ0ZJLCBzbyBjYW4gd2UgZHJvcCB0aGlzCnBhdGNoIGZv
ciBub3c/CgpJZiB3ZSB3YW50IHRvIHBhc3MgdGhlc2UgZmxhZ3MgZm9yICF4ODYsIHRoZSBqdXN0
aWZpY2F0aW9uIHNob3VsZCBiZSB0bwplbmFibGUgZnRyYWNlIGZvciBydXN0IGNvZGUsIGFuZCB3
ZSBzaG91bGQgdGVzdCB0aGF0IGFjdHVhbGx5IHdvcmtzCihlLmcuIGJ5IHRlc3RpbmcgZnRyYWNl
IHdpdGggcnVzdCBjb2RlKS4KCldoYXQgaGFwcGVucyBvbiB4ODYgZm9yIGZ0cmFjZSBhbmQgcnVz
dD8KCj4gUmVnYXJkaW5nIHRoZSBBQVBDUzY0IGNhbGxpbmcgY29udmVudGlvbiB0aGluZyAuLi4g
cnVzdGMgdXNlcyB0aGUgUnVzdAo+IGNhbGxpbmcgY29udmVudGlvbiBmb3IgZnVuY3Rpb25zIGlu
dGVybmFsbHkgaW4gUnVzdCBjb2RlIGFuZCBJIGRvbid0Cj4ga25vdyB3aGV0aGVyIHRoYXQgY2hh
bmdlcyBhbnl0aGluZyByZWxldmFudCBmb3Igd2hhdCB5b3UgbWVudGlvbi4KPiBNYXR0aGV3L1Nh
bWkgZG8geW91IGtub3c/CgpGcm9tIHRoZWlyIHJlcGxpZXMgaXQgc291bmRzIGxpa2UgdGhhdCBo
YXBwZW5zIHRvIGJlIHRydWUgaW4gcHJhY3RpY2UKdG9kYXksIGJ1dCBhcyBhYm92ZSBJIHRoaW5r
IHdlIHNob3VsZCBnbyB0ZXN0IHRoaXMgYWN0dWFsbHkgd29ya3MuCgpNYXJrLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
