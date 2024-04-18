Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515C7C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ys3on/HDAYGAWlXAgIYnuHXtD0e6ibNaeGnQtYFqiVI=; b=sviQpzwiyYEGjS
	sipm/eXb1hudOiXqH4m7OyK32E7iQUzzfauIco6dPN5GWIsjYwKkVJBgScm0/OBpt4XhcCTVsaawY
	SsrFTS8y+Li4YKQkmrjFpZtnBM1h0Oo+OQR1s2+n33J5NORp2HueabKvDg3+06p8qiaAE2/c5vWOh
	rvmwxrZCoQ0pKosCAWhsAdAx1ExxwwXK97nKomHQs8IuvRIJFgRcIIBc4Ki1/EkqeaUNAeP63O5/1
	LVSwNASiJ552OYMTHzjmZyH+3WA3qepw5FjjDvrBwaUYBZj/nRl49iytxgvXqDX44RsZjLrZaX3/n
	tk7gF5pxY8aR3s7/TaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVxU-00000003Gjc-29pJ;
	Thu, 18 Apr 2024 17:54:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVxQ-00000003GhI-131r;
	Thu, 18 Apr 2024 17:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80D62618A3;
	Thu, 18 Apr 2024 17:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F12DC3277B;
	Thu, 18 Apr 2024 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713462839;
	bh=GVKHg9/GMb+Q7svthQO5bm+rPzNDL6zXlQZOsDeKWL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qitx/umwjvXDKNme47QxvztrUiipBcKV2Lg0Yvd1RXezrm9EMN+zfFrxXb923+dxO
	 AxZ6KgXvjlorR3mUIjvBXST4+3n8nelthPynguxJTOQoS9rNBrqZ+3MIlU37kTQ9FA
	 a4e+nx+8unMMLT17+KcFFJ93DVlkbK2eXc4Av0nU3f2Yxj+rBXrkR0WI95IANr/7qX
	 uZj4q1Xb4qjUIP87QNJk+Jgy4oid7eW9FtvEPOx7D0x1Tt1iXSqSWNLPcTP4XbQ2OW
	 z8BEya9Rxr0dlQHlDm5T4jpRs2aqcA2Iy8EkKuiv4ehWjUKDt48ywWZ7K+xjdgeN4d
	 Qxf4CJCyjHkiA==
Date: Thu, 18 Apr 2024 20:52:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Topel <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiFd567L4Zzm2okO@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_105400_426280_7591F39C 
X-CRM114-Status: GOOD (  23.58  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDk6MTM6MjdBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODozN+KAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBJJ20gbG9va2luZyBhdCBleGVjbWVt
X3R5cGVzIG1vcmUgYXMgZGVmaW5pdGlvbiBvZiB0aGUgY29uc3VtZXJzLCBtYXliZSBJCj4gPiA+
ID4gc2hvdWxkIGhhdmUgbmFtZWQgdGhlIGVudW0gZXhlY21lbV9jb25zdW1lciBhdCB0aGUgZmly
c3QgcGxhY2UuCj4gPiA+Cj4gPiA+IEkgdGhpbmsgbG9va2luZyBhdCBleGVjbWVtX3R5cGUgZnJv
bSBjb25zdW1lcnMnIHBvaW50IG9mIHZpZXcgYWRkcwo+ID4gPiB1bm5lY2Vzc2FyeSBjb21wbGV4
aXR5LiBJSVVDLCBmb3IgbW9zdCAoaWYgbm90IGFsbCkgYXJjaHMsIGZ0cmFjZSwga3Byb2JlLAo+
ID4gPiBhbmQgYnBmIChhbmQgbWF5YmUgYWxzbyBtb2R1bGUgdGV4dCkgYWxsIGhhdmUgdGhlIHNh
bWUgcmVxdWlyZW1lbnRzLgo+ID4gPiBEaWQgSSBtaXNzIHNvbWV0aGluZz8KPiA+Cj4gPiBJdCdz
IGVub3VnaCB0byBoYXZlIG9uZSBhcmNoaXRlY3R1cmUgd2l0aCBkaWZmZXJlbnQgY29uc3RyYWlu
cyBmb3Iga3Byb2Jlcwo+ID4gYW5kIGJwZiB0byB3YXJyYW50IGEgdHlwZSBmb3IgZWFjaC4KPiAK
PiBBRkFJQ1QsIHNvbWUgb2YgdGhlc2UgY29uc3RyYWludHMgY2FuIGJlIGNoYW5nZWQgd2l0aG91
dCB0b28gbXVjaCB3b3JrLgoKQnV0IHdoeT8KSSBob25lc3RseSBkb24ndCB1bmRlcnN0YW5kIHdo
YXQgYXJlIHlvdSB0cnlpbmcgdG8gb3B0aW1pemUgaGVyZS4gQSBmZXcKbGluZXMgb2YgaW5pdGlh
bGl6YXRpb24gaW4gZXhlY21lbV9pbmZvPwpXaGF0IGlzIHRoZSBhZHZhbnRhZ2UgaW4gZm9yY2lu
ZyBhcmNoaXRlY3R1cmVzIHRvIGhhdmUgaW1wb3NlZCBsaW1pdHMgb24Ka3Byb2JlcyBvciBicGYg
YWxsb2NhdGlvbnM/Cgo+ID4gV2hlcmUgZG8geW91IHNlZSB1bm5lY2Vzc2FyeSBjb21wbGV4aXR5
Pwo+ID4KPiA+ID4gSU9XLCB3ZSBoYXZlCj4gPiA+Cj4gPiA+IGVudW0gZXhlY21lbV90eXBlIHsK
PiA+ID4gICAgICAgICBFWEVDTUVNX0RFRkFVTFQsCj4gPiA+ICAgICAgICAgRVhFQ01FTV9URVhU
LAo+ID4gPiAgICAgICAgIEVYRUNNRU1fS1BST0JFUyA9IEVYRUNNRU1fVEVYVCwKPiA+ID4gICAg
ICAgICBFWEVDTUVNX0ZUUkFDRSA9IEVYRUNNRU1fVEVYVCwKPiA+ID4gICAgICAgICBFWEVDTUVN
X0JQRiA9IEVYRUNNRU1fVEVYVCwgICAgICAvKiB3ZSBtYXkgZW5kIHVwIHdpdGhvdXQKPiA+ID4g
X0tQUk9CRSwgX0ZUUkFDRSwgX0JQRiAqLwo+ID4gPiAgICAgICAgIEVYRUNNRU1fREFUQSwgIC8q
IHJ3ICovCj4gPiA+ICAgICAgICAgRVhFQ01FTV9ST19EQVRBLAo+ID4gPiAgICAgICAgIEVYRUNN
RU1fUk9fQUZURVJfSU5JVCwKPiA+ID4gICAgICAgICBFWEVDTUVNX1RZUEVfTUFYLAo+ID4gPiB9
Owo+ID4gPgo+ID4gPiBEb2VzIHRoaXMgbWFrZSBzZW5zZT8KPiA+Cj4gPiBIb3cgZG8geW91IHN1
Z2dlc3QgdG8gZGVhbCB3aXRoIGUuZy4gcmlzY3YgdGhhdCBoYXMgc2VwYXJhdGUgYWRkcmVzcyBz
cGFjZXMKPiA+IGZvciBtb2R1bGVzLCBrcHJvYmVzIGFuZCBicGY/Cj4gCj4gSUlVQywgbW9kdWxl
cyBhbmQgYnBmIHVzZSB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIG9uIHJpc2N2CgpOb3QgZXhhY3Rs
eSwgYnBmIGlzIGEgc3Vic2V0IG9mIG1vZHVsZXMgb24gcmlzY3YuCgo+IHdoaWxlIGtwcm9iZXMg
dXNlIHZtYWxsb2MgYWRkcmVzcy4KClRoZSB3aG9sZSBwb2ludCBvZiB1c2luZyB0aGUgZW50aXJl
IHZtYWxsb2MgZm9yIGtwcm9iZXMgaXMgdG8gYXZvaWQKcG9sbHV0aW9uIG9mIGxpbWl0ZWQgbW9k
dWxlcyBzcGFjZS4KIAo+IFRoYW5rcywKPiBTb25nCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
