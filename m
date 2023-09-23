Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD72CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTOlEKvBV8fjIGDjuGQqXVT6945X27gk2XWCs9uQtoQ=; b=Ajlt73ypq80wLU
	ugdL8l/eQlUv/3Guwbn34weJm3bq5NQ82QvHlrk0pn2hKnDmP4zr7c/olLiISjhxQv4/FY3w+RBqC
	yJgTconQvL5ABkc9sEmjziRxb1bAAhXsBratv+iqBVlwPTUN1Ndo/PeHQivVT+4y+zMhv+9ZS1fAD
	QzMK1lI9AyCSv2QueUCB+4qdnd0d6hd0MgokySRVVzVXuGQkaU+2DMqfpFmv53+KA7+eJLKjR9rV3
	En9g2eWNDtdcxP9WVAE9lPGMUnFwHDfk33bfoNWAn8siXthocS5a1sjf4onUNOgFshWcK+v4j+02T
	DcHvVo2KeP7bqbipc/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4lh-00B9QK-1H;
	Sat, 23 Sep 2023 15:42:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4ld-00B9Ms-0T;
	Sat, 23 Sep 2023 15:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AA562B8068F;
	Sat, 23 Sep 2023 15:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B41C433C7;
	Sat, 23 Sep 2023 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695483716;
	bh=vXbqktT7b0Qri8xOnKmQsZG7jQ4zimMSvWYPtuArZ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKxK0sfnvR6Mn54iFskJjz+iqQzT7d+5NzV6O/KDvtN3lXtUe/L3iPwKCcy9RJgP3
	 mbD8bMb58MYWC7Tl7U7Pm9c2CxFIZly2LFF5bwScXgaoAZuVMJ1eJZhU6ecWVwTfEE
	 r2oNyeJK2AahVHVr99AtDOSv5pGe23KHFoafNeDpxxm0mmvwtmbI1d6kPT0nWu68z/
	 VE6hznLFs1/tWZv4nZKOvDCd21ai8PHSne6FmcZ1g1J53YE3NQHUgtGoEfJtdU67X3
	 wLZ8mTH2uPqXeKbDrNozy3tf88DdS8OExFmk2KljS0ivcPxrGjBb2Vj5e645SQEJ/u
	 hwwLepGJAxXyg==
Date: Sat, 23 Sep 2023 18:40:59 +0300
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
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and
 execmem_free()
Message-ID: <20230923154059.GJ3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_084201_478015_5617D7B3 
X-CRM114-Status: GOOD (  19.08  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6MTQ6NTRQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzDigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiBbLi4uXQo+ID4gKwo+ID4gKy8qKgo+ID4gKyAqIGVu
dW0gZXhlY21lbV90eXBlIC0gdHlwZXMgb2YgZXhlY3V0YWJsZSBtZW1vcnkgcmFuZ2VzCj4gPiAr
ICoKPiA+ICsgKiBUaGVyZSBhcmUgc2V2ZXJhbCBzdWJzeXN0ZW1zIHRoYXQgYWxsb2NhdGUgZXhl
Y3V0YWJsZSBtZW1vcnkuCj4gPiArICogQXJjaGl0ZWN0dXJlcyBkZWZpbmUgZGlmZmVyZW50IHJl
c3RyaWN0aW9ucyBvbiBwbGFjZW1lbnQsCj4gPiArICogcGVybWlzc2lvbnMsIGFsaWdubWVudCBh
bmQgb3RoZXIgcGFyYW1ldGVycyBmb3IgbWVtb3J5IHRoYXQgY2FuIGJlIHVzZWQKPiA+ICsgKiBi
eSB0aGVzZSBzdWJzeXN0ZW1zLgo+ID4gKyAqIFR5cGVzIGluIHRoaXMgZW51bSBpZGVudGlmeSBz
dWJzeXN0ZW1zIHRoYXQgYWxsb2NhdGUgZXhlY3V0YWJsZSBtZW1vcnkKPiA+ICsgKiBhbmQgbGV0
IGFyY2hpdGVjdHVyZXMgZGVmaW5lIHBhcmFtZXRlcnMgZm9yIHJhbmdlcyBzdWl0YWJsZSBmb3IK
PiA+ICsgKiBhbGxvY2F0aW9ucyBieSBlYWNoIHN1YnN5c3RlbS4KPiA+ICsgKgo+ID4gKyAqIEBF
WEVDTUVNX0RFRkFVTFQ6IGRlZmF1bHQgcGFyYW1ldGVycyB0aGF0IHdvdWxkIGJlIHVzZWQgZm9y
IHR5cGVzIHRoYXQKPiA+ICsgKiBhcmUgbm90IGV4cGxjaXRseSBkZWZpbmVkLgo+ID4gKyAqIEBF
WEVDTUVNX01PRFVMRV9URVhUOiBwYXJhbWV0ZXJzIGZvciBtb2R1bGUgdGV4dCBzZWN0aW9ucwo+
ID4gKyAqIEBFWEVDTUVNX0tQUk9CRVM6IHBhcmFtZXRlcnMgZm9yIGtwcm9iZXMKPiA+ICsgKiBA
RVhFQ01FTV9GVFJBQ0U6IHBhcmFtZXRlcnMgZm9yIGZ0cmFjZQo+ID4gKyAqIEBFWEVDTUVNX0JQ
RjogcGFyYW1ldGVycyBmb3IgQlBGCj4gPiArICogQEVYRUNNRU1fVFlQRV9NQVg6Cj4gPiArICov
Cj4gPiArZW51bSBleGVjbWVtX3R5cGUgewo+ID4gKyAgICAgICBFWEVDTUVNX0RFRkFVTFQsCj4g
Cj4gSSBmb3VuZCBFWEVDTUVNX0RFRkFVTFQgbW9yZSBjb25mdXNpbmcgdGhhbiBoZWxwZnVsLgoK
SSBoZXNpdGF0ZWQgYSBsb3QgYWJvdXQgdGhhdCwgYnV0IGluIHRoZSBlbmQgZGVjaWRlZCB0byBo
YXZlCkVYRUNNRU1fREVGQVVMVCBhbmQgYWxpYXMgRVhFQ01FTV9NT0RVTEVfVEVYVCB0byBpdCBi
ZWNhdXNlIHRoaXMgaXMgd2hhdCB3ZQplc3NlbnRpYWxseSBoYXZlIG5vdyBmb3IgdGhlIG1vc3Qg
YXJjaGl0ZWN0dXJlcy4KCklmIHlvdSdsbCB0YWtlIGEgbG9vayBhdCBhcmNoLXNwZWNpZmljIHBh
dGNoZXMsIGluIG1hbnkgY2FzZXMgdGhlcmUgaXMgb25seQpFWEVDTUVNX0RFRkFVTFQgdGhhdCBh
biBhcmNoaXRlY3R1cmUgZGVmaW5lcyBhbmQgdGhhdCBkZWZhdWx0IGlzIHVzZWQgYnkKYWxsIHRo
ZSBzdWJzeXN0ZW1zLgogCj4gU29uZwo+IAo+ID4gKyAgICAgICBFWEVDTUVNX01PRFVMRV9URVhU
ID0gRVhFQ01FTV9ERUZBVUxULAo+ID4gKyAgICAgICBFWEVDTUVNX0tQUk9CRVMsCj4gPiArICAg
ICAgIEVYRUNNRU1fRlRSQUNFLAo+ID4gKyAgICAgICBFWEVDTUVNX0JQRiwKPiA+ICsgICAgICAg
RVhFQ01FTV9UWVBFX01BWCwKPiA+ICt9Owo+ID4gKwo+IFsuLi5dCgotLSAKU2luY2VyZWx5IHlv
dXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
