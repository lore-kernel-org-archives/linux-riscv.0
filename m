Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE979CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kTcSlKjF5N5x/IMtcRlGbWhQnSLxa2vqPSREUUWvPw=; b=MlAIf7a2rG6Cea
	T4jgjGLjYtg6LqduidxWNzQrch6+wSGQBbx4eNcP22O0U1Hp9E9QxkgUmYYgOWhARcLh+M3Gi5/43
	6dXN/51gvE9SW4ro32Pgj6y8AcEko9X4sUzcPQH/gyn/grGOPbnPs9PSQy5IiGvRvxdMCqdH7cwDl
	jAyi2w/e/92vBZjl4SXKZEASelY5kQ6Zmks6wNzzxrA9788ztOiyE97qq/x2wD9r0aqh+EKx85L8t
	eTbWCEocL/1bQCY2tQVOPC3G1BqXDOXd7NuPaG3DHxaKrFM5EvLqa+CItdWkxi0J5j5n0NFaZW/D/
	n1rb/bm9dwsVuu17oftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5OK-00BByy-1n;
	Sat, 23 Sep 2023 16:22:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5OG-00BBwQ-0c;
	Sat, 23 Sep 2023 16:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC50ECE1ED5;
	Sat, 23 Sep 2023 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13699C433C7;
	Sat, 23 Sep 2023 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486112;
	bh=epTBeih4MHoaHBpc48qML+P/ARMeb7d09SNlM/hQxw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofaXj1oNTs/VBLYlvMmVzGA3HsxAlJskkj7XrUmUTDzx/0RPqgkm91Z7JgVfNThA+
	 jF51Gkq+/u8f3Pl9hK1BmDVAsawYyQVDaZs6NfxlIM+VHJDmPuMKHs1TOy64LPBIRA
	 iuS6IcsT1zTuxev9K6pIMvYP5Qodr6WpU9hqxXwD4ixmanyA2+kLliocF453RBJkLn
	 2TOewMq1E/GW1XYu4R2CCfYUfUpS+zAxWOefS4IClhNx863WjbFLsgwwYry2hXBCvO
	 tH3ho75+Hir/pB3LPn6CIdrcMEvj+m5czuQ0yH+wcE6dXhoEdwLJTXJ/XABJAw1gmy
	 81I0fO8rK/6Jg==
Date: Sat, 23 Sep 2023 19:20:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230923162055.GL3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_092156_658711_9E3A4185 
X-CRM114-Status: GOOD (  35.88  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6NTI6MjFQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzHigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiBbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvZXhlY21lbS5oIGIvaW5jbHVkZS9saW51eC9leGVjbWVtLmgKPiA+IGluZGV4IDUxOWJk
ZmRjYTU5NS4uMDlkNDVhYzc4NmU5IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9leGVj
bWVtLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhlY21lbS5oCj4gPiBAQCAtMjksNiArMjks
NyBAQAo+ID4gICAqIEBFWEVDTUVNX0tQUk9CRVM6IHBhcmFtZXRlcnMgZm9yIGtwcm9iZXMKPiA+
ICAgKiBARVhFQ01FTV9GVFJBQ0U6IHBhcmFtZXRlcnMgZm9yIGZ0cmFjZQo+ID4gICAqIEBFWEVD
TUVNX0JQRjogcGFyYW1ldGVycyBmb3IgQlBGCj4gPiArICogQEVYRUNNRU1fTU9EVUxFX0RBVEE6
IHBhcmFtZXRlcnMgZm9yIG1vZHVsZSBkYXRhIHNlY3Rpb25zCj4gPiAgICogQEVYRUNNRU1fVFlQ
RV9NQVg6Cj4gPiAgICovCj4gPiAgZW51bSBleGVjbWVtX3R5cGUgewo+ID4gQEAgLTM3LDYgKzM4
LDcgQEAgZW51bSBleGVjbWVtX3R5cGUgewo+ID4gICAgICAgICBFWEVDTUVNX0tQUk9CRVMsCj4g
PiAgICAgICAgIEVYRUNNRU1fRlRSQUNFLAo+IAo+IEluIGxvbmdlciB0ZXJtLCBJIHRoaW5rIHdl
IGNhbiBpbXByb3ZlIHRoZSBKSVRlZCBjb2RlIGFuZCBtZXJnZQo+IGtwcm9iZS9mdHJhY2UvYnBm
LiB0byB1c2UgdGhlIHNhbWUgcmFuZ2VzLiBBbHNvLCBkbyB3ZSBuZWVkIHNwZWNpYWwKPiBzZXR0
aW5nIGZvciBGVFJBQ0U/IElmIG5vdCwgbGV0J3MganVzdCByZW1vdmUgaXQuCgpJIGRvbid0IHRo
aW5rIHdlIG5lZWQgdG8gbGltaXQgaG93IHRoZSBKSVRlZCBjb2RlIGlzIGdlbmVyYXRlZCBiZWNh
dXNlIHdlCndhbnQgdG8gc3VwcG9ydCBmZXdlciBhZGRyZXNzIHNwYWNlIHJhbmdlcyBmb3IgaXQu
IAoKQXMgZm9yIEZUUkFDRSwgbm93IGl0J3Mgb25seSBuZWVkZWQgb24geDg2IGFuZCBzMzkwIGFu
ZCB0aGVyZSBpdCBoYXBwZW5zCnRvIHVzZSB0aGUgc2FtZSByYW5nZXMgYXMgTU9EVUxFUyBhbmQg
dGhlIHJlc3QsIGJ1dCBpdCBzdGlsbCBnaXZlcyBzb21lCm5vdGlvbiBvZiBwb3RlbnRpYWwgc2Vt
YW50aWMgZGlmZmVyZW5jZXMgYW5kIHRoZSBvdmVyaGVhZCBvZiBrZWVwaW5nIGl0IGlzCnJlYWxs
eSBuZWdsaWdpYmxlLgogCj4gPiAgICAgICAgIEVYRUNNRU1fQlBGLAo+ID4gKyAgICAgICBFWEVD
TUVNX01PRFVMRV9EQVRBLAo+ID4gICAgICAgICBFWEVDTUVNX1RZUEVfTUFYLAo+ID4gIH07Cj4g
Cj4gT3ZlcmFsbCwgaXQgaXMgZ3JlYXQgdGhhdCBrcHJvYmUvZnRyYWNlL2JwZiBubyBsb25nZXIg
ZGVwZW5kIG9uIG1vZHVsZXMuCj4gCj4gT1RPSCwgSSB0aGluayB3ZSBzaG91bGQgbWVyZ2UgZXhl
Y21lbV90eXBlIGFuZCBleGlzdGluZyBtb2RfbWVtX3R5cGUuCj4gT3RoZXJ3aXNlLCB3ZSBzdGls
bCBuZWVkIHRvIGhhbmRsZSBwYWdlIHBlcm1pc3Npb25zIGluIG11bHRpcGxlIHBsYWNlcy4KPiBX
aGF0IGlzIG91ciBwbGFuIGZvciB0aGF0PwoKTWF5YmUsIGJ1dCBJIHRoaW5rIHRoaXMgaXMgdG9v
IGVhcmx5LiBUaGVyZSBhcmUgc2V2ZXJhbCB0aGluZ3MgbWlzc2luZwpiZWZvcmUgd2UgY291bGQg
cmVtb3ZlIHNldF9tZW1vcnkgdXNhZ2UgZnJvbSBtb2R1bGVzLiBFLmcuIHRvIHVzZSBST1gKYWxs
b2NhdGlvbnMgb24geDg2IHdlIGF0IGxlYXN0IHNob3VsZCB1cGRhdGUgYWx0ZXJuYXRpdmVzIGhh
bmRsaW5nIGFuZApyZWFjaCBhIGNvbnNlbnN1cyBhYm91dCBzeW5jaHJvbml6YXRpb24gQW5keSBt
ZW50aW9uZWQgaW4gaGlzIGNvbW1lbnRzIHRvCnYyLgogCj4gVGhhbmtzLAo+IFNvbmcKPiAKPiAK
PiA+Cj4gPiBAQCAtMTA3LDYgKzEwOSwyMyBAQCBzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgKmV4ZWNt
ZW1fYXJjaF9wYXJhbXModm9pZCk7Cj4gPiAgICovCj4gPiAgdm9pZCAqZXhlY21lbV90ZXh0X2Fs
bG9jKGVudW0gZXhlY21lbV90eXBlIHR5cGUsIHNpemVfdCBzaXplKTsKPiA+Cj4gPiArLyoqCj4g
PiArICogZXhlY21lbV9kYXRhX2FsbG9jIC0gYWxsb2NhdGUgbWVtb3J5IGZvciBkYXRhIGNvdXBs
ZWQgdG8gY29kZQo+ID4gKyAqIEB0eXBlOiB0eXBlIG9mIHRoZSBhbGxvY2F0aW9uCj4gPiArICog
QHNpemU6IGhvdyBtYW55IGJ5dGVzIG9mIG1lbW9yeSBhcmUgcmVxdWlyZWQKPiA+ICsgKgo+ID4g
KyAqIEFsbG9jYXRlcyBtZW1vcnkgdGhhdCB3aWxsIGNvbnRhaW4gZGF0YSBjb3VwbGVkIHdpdGgg
ZXhlY3V0YWJsZSBjb2RlLAo+ID4gKyAqIGxpa2UgZGF0YSBzZWN0aW9ucyBpbiBrZXJuZWwgbW9k
dWxlcy4KPiA+ICsgKgo+ID4gKyAqIFRoZSBtZW1vcnkgd2lsbCBoYXZlIHByb3RlY3Rpb25zIGRl
ZmluZWQgYnkgYXJjaGl0ZWN0dXJlLgo+ID4gKyAqCj4gPiArICogVGhlIGFsbG9jYXRlZCBtZW1v
cnkgd2lsbCByZXNpZGUgaW4gYW4gYXJlYSB0aGF0IGRvZXMgbm90IGltcG9zZQo+ID4gKyAqIHJl
c3RyaWN0aW9ucyBvbiB0aGUgYWRkcmVzc2luZyBtb2Rlcy4KPiA+ICsgKgo+ID4gKyAqIFJldHVy
bjogYSBwb2ludGVyIHRvIHRoZSBhbGxvY2F0ZWQgbWVtb3J5IG9yICVOVUxMCj4gPiArICovCj4g
PiArdm9pZCAqZXhlY21lbV9kYXRhX2FsbG9jKGVudW0gZXhlY21lbV90eXBlIHR5cGUsIHNpemVf
dCBzaXplKTsKPiA+ICsKPiA+ICAvKioKPiA+ICAgKiBleGVjbWVtX2ZyZWUgLSBmcmVlIGV4ZWN1
dGFibGUgbWVtb3J5Cj4gPiAgICogQHB0cjogcG9pbnRlciB0byB0aGUgbWVtb3J5IHRoYXQgc2hv
dWxkIGJlIGZyZWVkCj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS9tYWluLmMgYi9rZXJu
ZWwvbW9kdWxlL21haW4uYwo+ID4gaW5kZXggYzQxNDZiZmNkMGE3Li4yYWU4M2E2YWJmNjYgMTAw
NjQ0Cj4gPiAtLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uYwo+ID4gKysrIGIva2VybmVsL21vZHVs
ZS9tYWluLmMKPiA+IEBAIC0xMTg4LDI1ICsxMTg4LDE2IEBAIHZvaWQgX193ZWFrIG1vZHVsZV9h
cmNoX2ZyZWVpbmdfaW5pdChzdHJ1Y3QgbW9kdWxlICptb2QpCj4gPiAgewo+ID4gIH0KPiA+Cj4g
PiAtc3RhdGljIGJvb2wgbW9kX21lbV91c2Vfdm1hbGxvYyhlbnVtIG1vZF9tZW1fdHlwZSB0eXBl
KQo+ID4gLXsKPiA+IC0gICAgICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfV0FOVFNf
TU9EVUxFU19EQVRBX0lOX1ZNQUxMT0MpICYmCj4gPiAtICAgICAgICAgICAgICAgbW9kX21lbV90
eXBlX2lzX2NvcmVfZGF0YSh0eXBlKTsKPiA+IC19Cj4gPiAtCj4gPiAgc3RhdGljIHZvaWQgKm1v
ZHVsZV9tZW1vcnlfYWxsb2ModW5zaWduZWQgaW50IHNpemUsIGVudW0gbW9kX21lbV90eXBlIHR5
cGUpCj4gPiAgewo+ID4gLSAgICAgICBpZiAobW9kX21lbV91c2Vfdm1hbGxvYyh0eXBlKSkKPiA+
IC0gICAgICAgICAgICAgICByZXR1cm4gdnphbGxvYyhzaXplKTsKPiA+ICsgICAgICAgaWYgKG1v
ZF9tZW1fdHlwZV9pc19kYXRhKHR5cGUpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBleGVj
bWVtX2RhdGFfYWxsb2MoRVhFQ01FTV9NT0RVTEVfREFUQSwgc2l6ZSk7Cj4gPiAgICAgICAgIHJl
dHVybiBleGVjbWVtX3RleHRfYWxsb2MoRVhFQ01FTV9NT0RVTEVfVEVYVCwgc2l6ZSk7Cj4gPiAg
fQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBtb2R1bGVfbWVtb3J5X2ZyZWUodm9pZCAqcHRyLCBlbnVt
IG1vZF9tZW1fdHlwZSB0eXBlKQo+ID4gIHsKPiA+IC0gICAgICAgaWYgKG1vZF9tZW1fdXNlX3Zt
YWxsb2ModHlwZSkpCj4gPiAtICAgICAgICAgICAgICAgdmZyZWUocHRyKTsKPiA+IC0gICAgICAg
ZWxzZQo+ID4gLSAgICAgICAgICAgICAgIGV4ZWNtZW1fZnJlZShwdHIpOwo+ID4gKyAgICAgICBl
eGVjbWVtX2ZyZWUocHRyKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGZyZWVfbW9kX21l
bShzdHJ1Y3QgbW9kdWxlICptb2QpCj4gPiBkaWZmIC0tZ2l0IGEvbW0vZXhlY21lbS5jIGIvbW0v
ZXhlY21lbS5jCj4gPiBpbmRleCBhYmNiZDA3ZTA1YWMuLmFlZmY4NTI2MTM2MCAxMDA2NDQKPiA+
IC0tLSBhL21tL2V4ZWNtZW0uYwo+ID4gKysrIGIvbW0vZXhlY21lbS5jCj4gPiBAQCAtNTMsMTEg
KzUzLDIzIEBAIHN0YXRpYyB2b2lkICpleGVjbWVtX2FsbG9jKHNpemVfdCBzaXplLCBzdHJ1Y3Qg
ZXhlY21lbV9yYW5nZSAqcmFuZ2UpCj4gPiAgICAgICAgIHJldHVybiBrYXNhbl9yZXNldF90YWco
cCk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgZXhlY21lbV9yYW5nZV9pc19k
YXRhKGVudW0gZXhlY21lbV90eXBlIHR5cGUpCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gdHlw
ZSA9PSBFWEVDTUVNX01PRFVMRV9EQVRBOwo+ID4gK30KPiA+ICsKPiA+ICB2b2lkICpleGVjbWVt
X3RleHRfYWxsb2MoZW51bSBleGVjbWVtX3R5cGUgdHlwZSwgc2l6ZV90IHNpemUpCj4gPiAgewo+
ID4gICAgICAgICByZXR1cm4gZXhlY21lbV9hbGxvYyhzaXplLCAmZXhlY21lbV9wYXJhbXMucmFu
Z2VzW3R5cGVdKTsKPiA+ICB9Cj4gPgo+ID4gK3ZvaWQgKmV4ZWNtZW1fZGF0YV9hbGxvYyhlbnVt
IGV4ZWNtZW1fdHlwZSB0eXBlLCBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICAgIFdBUk5f
T05fT05DRSghZXhlY21lbV9yYW5nZV9pc19kYXRhKHR5cGUpKTsKPiA+ICsKPiA+ICsgICAgICAg
cmV0dXJuIGV4ZWNtZW1fYWxsb2Moc2l6ZSwgJmV4ZWNtZW1fcGFyYW1zLnJhbmdlc1t0eXBlXSk7
Cj4gPiArfQo+ID4gKwo+ID4gIHZvaWQgZXhlY21lbV9mcmVlKHZvaWQgKnB0cikKPiA+ICB7Cj4g
PiAgICAgICAgIC8qCj4gPiBAQCAtOTMsNyArMTA1LDEwIEBAIHN0YXRpYyB2b2lkIGV4ZWNtZW1f
aW5pdF9taXNzaW5nKHN0cnVjdCBleGVjbWVtX3BhcmFtcyAqcCkKPiA+ICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZXhlY21lbV9yYW5nZSAqciA9ICZwLT5yYW5nZXNbaV07Cj4gPgo+ID4gICAgICAg
ICAgICAgICAgIGlmICghci0+c3RhcnQpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHIt
PnBncHJvdCA9IGRlZmF1bHRfcmFuZ2UtPnBncHJvdDsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChleGVjbWVtX3JhbmdlX2lzX2RhdGEoaSkpCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHItPnBncHJvdCA9IFBBR0VfS0VSTkVMOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByLT5wZ3By
b3QgPSBkZWZhdWx0X3JhbmdlLT5wZ3Byb3Q7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBy
LT5hbGlnbm1lbnQgPSBkZWZhdWx0X3JhbmdlLT5hbGlnbm1lbnQ7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICByLT5zdGFydCA9IGRlZmF1bHRfcmFuZ2UtPnN0YXJ0Owo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgci0+ZW5kID0gZGVmYXVsdF9yYW5nZS0+ZW5kOwo+ID4gLS0KPiA+IDIu
MzkuMgo+ID4KCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
