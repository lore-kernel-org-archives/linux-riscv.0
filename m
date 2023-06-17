Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2884FC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOhMklsWyYqnwRmWXRBUuRBYAtS43HdiYnIx/hFaMLI=; b=TXa1eLqEW56E7P
	JQ6LvUAKHB9XJuT9vQ3dUzY0BMoTeOa8PFccS0L/Y0CUf97NOtERK6ng8LU6vqb5MuNMZS6TerBbo
	0te+sD+cTzGlKfnraXGc3tbpeMKMMsQdbDN9+lSGJfWOO38xNg1lq4PpCjPxSdhZu5z5BX2iwSUyi
	7v/3j++CZuBaGlFFQ5Xblz/87l88zdwqU1g5Ujr6iMQaEH5f8eoTkBpz8PaOTJ3nxYJ3Vuqtrh5dD
	9OM8fCYDDbIOMOd/+VXcDe1sJ6Q5O/Mcp8iebt2kxDZBX/49FVua3JS4EphdAWJ135iGuZir0UQ67
	yze28v8dgjf72t8XOjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPn0-002vfA-32;
	Sat, 17 Jun 2023 06:52:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPmx-002vbu-0T;
	Sat, 17 Jun 2023 06:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69FCC60B07;
	Sat, 17 Jun 2023 06:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5A2C433C0;
	Sat, 17 Jun 2023 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984717;
	bh=/qKKDaoSMPytALuHQ04GytBWLf/bqmvRcK74ppFE2a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0RFez1EfGYRPTyev/ddBuUzPfaI7NYAV3qwPAYDnlRPd3VlORPb9LLwAJNsB7HOD
	 XaTNoL/vc3WgcVwGzmW11kDKJAUwiH+6/aq1FZDc7+GKKGRDNnH6fEazV3xviU4Xdu
	 C+/q5uFaTCGSUOqz7wG3tCyqcwsxuFowQGM9EqAXvug3eByaI82gwGU/LAA7W+0x7N
	 lIyzQgQ47UaYju+tMMa6eYibyB5m2xJlH6icNOvjTXhyI/Ih1KbRLoHwZvr/gyzXyu
	 vOgqeIZZrqb6yw/imXyF8xZATseZuyfjlfKJVafWUrfVejHNNcMI379QODomewks5q
	 shTjXZO35vEXQ==
Date: Sat, 17 Jun 2023 09:51:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230617065111.GR52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_235159_294055_7D47D369 
X-CRM114-Status: GOOD (  29.40  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMDE6MDE6MDhQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxy
cHB0QGtlcm5lbC5vcmc+Cj4gPgo+ID4gRGF0YSByZWxhdGVkIHRvIGNvZGUgYWxsb2NhdGlvbnMs
IHN1Y2ggYXMgbW9kdWxlIGRhdGEgc2VjdGlvbiwgbmVlZCB0bwo+ID4gY29tcGx5IHdpdGggYXJj
aGl0ZWN0dXJlIGNvbnN0cmFpbnRzIGZvciBpdHMgcGxhY2VtZW50IGFuZCBpdHMKPiA+IGFsbG9j
YXRpb24gcmlnaHQgbm93IHdhcyBkb25lIHVzaW5nIGV4ZWNtZW1fdGV4dF9hbGxvYygpLgo+ID4K
PiA+IENyZWF0ZSBhIGRlZGljYXRlZCBBUEkgZm9yIGFsbG9jYXRpbmcgZGF0YSByZWxhdGVkIHRv
IGNvZGUgYWxsb2NhdGlvbnMKPiA+IGFuZCBhbGxvdyBhcmNoaXRlY3R1cmVzIHRvIGRlZmluZSBh
ZGRyZXNzIHJhbmdlcyBmb3IgZGF0YSBhbGxvY2F0aW9ucy4KPiA+Cj4gPiBTaW5jZSBjdXJyZW50
bHkgdGhpcyBpcyBvbmx5IHJlbGV2YW50IGZvciBwb3dlcnBjIHZhcmlhbnRzIHRoYXQgdXNlIHRo
ZQo+ID4gVk1BTExPQyBhZGRyZXNzIHNwYWNlIGZvciBtb2R1bGUgZGF0YSBhbGxvY2F0aW9ucywg
YXV0b21hdGljYWxseSByZXVzZQo+ID4gYWRkcmVzcyByYW5nZXMgZGVmaW5lZCBmb3IgdGV4dCB1
bmxlc3MgYWRkcmVzcyByYW5nZSBmb3IgZGF0YSBpcwo+ID4gZXhwbGljaXRseSBkZWZpbmVkIGJ5
IGFuIGFyY2hpdGVjdHVyZS4KPiA+Cj4gPiBXaXRoIHNlcGFyYXRpb24gb2YgY29kZSBhbmQgZGF0
YSBhbGxvY2F0aW9ucywgZGF0YSBzZWN0aW9ucyBvZiB0aGUKPiA+IG1vZHVsZXMgYXJlIG5vdyBt
YXBwZWQgYXMgUEFHRV9LRVJORUwgcmF0aGVyIHRoYW4gUEFHRV9LRVJORUxfRVhFQyB3aGljaAo+
ID4gd2FzIGEgZGVmYXVsdCBvbiBtYW55IGFyY2hpdGVjdHVyZXMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgo+IFsuLi5dCj4gPiAg
c3RhdGljIHZvaWQgZnJlZV9tb2RfbWVtKHN0cnVjdCBtb2R1bGUgKm1vZCkKPiA+IGRpZmYgLS1n
aXQgYS9tbS9leGVjbWVtLmMgYi9tbS9leGVjbWVtLmMKPiA+IGluZGV4IGE2N2FjZDc1ZmZlZi4u
ZjdiZjQ5NmFkNGMzIDEwMDY0NAo+ID4gLS0tIGEvbW0vZXhlY21lbS5jCj4gPiArKysgYi9tbS9l
eGVjbWVtLmMKPiA+IEBAIC02Myw2ICs2MywyMCBAQCB2b2lkICpleGVjbWVtX3RleHRfYWxsb2Mo
c2l6ZV90IHNpemUpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbGxiYWNrX3N0
YXJ0LCBmYWxsYmFja19lbmQsIGthc2FuKTsKPiA+ICB9Cj4gPgo+ID4gK3ZvaWQgKmV4ZWNtZW1f
ZGF0YV9hbGxvYyhzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnQgPSBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEuc3RhcnQ7Cj4gPiArICAgICAgIHVu
c2lnbmVkIGxvbmcgZW5kID0gZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLmVuZDsKPiA+ICsg
ICAgICAgcGdwcm90X3QgcGdwcm90ID0gZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLnBncHJv
dDsKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGFsaWduID0gZXhlY21lbV9wYXJhbXMubW9kdWxl
cy5kYXRhLmFsaWdubWVudDsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmYWxsYmFja19zdGFy
dCA9IGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5mYWxsYmFja19zdGFydDsKPiA+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBmYWxsYmFja19lbmQgPSBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRh
dGEuZmFsbGJhY2tfZW5kOwo+ID4gKyAgICAgICBib29sIGthc2FuID0gZXhlY21lbV9wYXJhbXMu
bW9kdWxlcy5mbGFncyAmIEVYRUNNRU1fS0FTQU5fU0hBRE9XOwo+ID4gKwo+ID4gKyAgICAgICBy
ZXR1cm4gZXhlY21lbV9hbGxvYyhzaXplLCBzdGFydCwgZW5kLCBhbGlnbiwgcGdwcm90LAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxsYmFja19zdGFydCwgZmFsbGJhY2tfZW5k
LCBrYXNhbik7Cj4gPiArfQo+ID4gKwo+ID4gIHZvaWQgZXhlY21lbV9mcmVlKHZvaWQgKnB0cikK
PiA+ICB7Cj4gPiAgICAgICAgIC8qCj4gPiBAQCAtMTAxLDYgKzExNSwyOCBAQCBzdGF0aWMgYm9v
bCBleGVjbWVtX3ZhbGlkYXRlX3BhcmFtcyhzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgKnApCj4gPiAg
ICAgICAgIHJldHVybiB0cnVlOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgZXhlY21lbV9p
bml0X21pc3Npbmcoc3RydWN0IGV4ZWNtZW1fcGFyYW1zICpwKQo+IAo+IFNoYWxsIHdlIGNhbGwg
dGhpcyBleGVjbWVtX2RlZmF1bHRfaW5pdF9kYXRhPwoKVGhpcyBhbHNvIGZpbGxzIGluIGppdC50
ZXh0IChuZXh0IHBhdGNoKSwgc28gX2RhdGEgZG9lc24ndCB3b3JrIGhlcmUgOikKQW5kIGl0J3Mg
bm90IHJlYWxseSBhIGRlZmF1bHQsIHRoZSBkZWZhdWx0cyBhcmUgc2V0IGV4cGxpY2l0bHkgZm9y
IGFyY2hlcwp0aGF0IGRvbid0IGhhdmUgZXhlY21lbV9hcmNoX3BhcmFtcy4KIAo+ID4gK3sKPiA+
ICsgICAgICAgc3RydWN0IGV4ZWNtZW1fbW9kdWxlc19yYW5nZSAqbSA9ICZwLT5tb2R1bGVzOwo+
ID4gKwo+ID4gKyAgICAgICBpZiAoIXBncHJvdF92YWwoZXhlY21lbV9wYXJhbXMubW9kdWxlcy5k
YXRhLnBncHJvdCkpCj4gPiArICAgICAgICAgICAgICAgZXhlY21lbV9wYXJhbXMubW9kdWxlcy5k
YXRhLnBncHJvdCA9IFBBR0VfS0VSTkVMOwo+IAo+IERvIHdlIHJlYWxseSBuZWVkIHRvIGNoZWNr
IGVhY2ggb2YgdGhlc2U/IElPVywgY2FuIHdlIGRvOgo+IAo+IGlmICghcGdwcm90X3ZhbChleGVj
bWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEucGdwcm90KSkgewo+ICAgICAgICBleGVjbWVtX3BhcmFt
cy5tb2R1bGVzLmRhdGEucGdwcm90ID0gUEFHRV9LRVJORUw7Cj4gICAgICAgIGV4ZWNtZW1fcGFy
YW1zLm1vZHVsZXMuZGF0YS5hbGlnbm1lbnQgPSBtLT50ZXh0LmFsaWdubWVudDsKPiAgICAgICAg
ZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLnN0YXJ0ID0gbS0+dGV4dC5zdGFydDsKPiAgICAg
ICAgZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLmVuZCA9IG0tPnRleHQuZW5kOwo+ICAgICAg
ICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEuZmFsbGJhY2tfc3RhcnQgPSBtLT50ZXh0LmZh
bGxiYWNrX3N0YXJ0Owo+ICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5mYWxsYmFj
a19lbmQgPSBtLT50ZXh0LmZhbGxiYWNrX2VuZDsKPiB9CgpZZXMsIHdlIGNhbiBoYXZlIGEgc2lu
Z2xlIGNoZWNrIGhlcmUuCiAKPiBUaGFua3MsCj4gU29uZwo+IAo+IFsuLi5dCgotLSAKU2luY2Vy
ZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
