Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6473CCE7A89
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oWKgdYZQqU/gJus7Zr2fMk6vAMNl1+V3mb/irhtUrE=; b=tbuglctkSZpOxa
	a20hgf2qbjOZdK7/vSHXhplTWGTO40gfavfZhdcFbbloPC3z6oyiTkJjr4RWl4s9B0AXEDzhPBB6Y
	pYjsUxUs0lh/57W9tuBJJru8qLiEdn5Fj8jQa/lmpBY5Rt1wAHTOZycOsYdw9SemIkoIJT5Kr53PZ
	x+5H4kjVLhsazDSA/N9VSG/vbGDJ5LqGdL0wzGcFpD7ufPjji0jarxNfdLv5JK0W9alkcy/8x93wI
	f6exnHMtfAgsICODj/wLO7xpOEcvUxMZ9zWIX097nzeo96E7Q1ZB0jH+eqlpEDdOd4ZCrDgY9/WpP
	M6Py7+2YYhPSBHRLddHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Sz-00BCUy-1H;
	Sat, 23 Sep 2023 16:26:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Sw-00BCTC-2Z;
	Sat, 23 Sep 2023 16:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 345E5B8047E;
	Sat, 23 Sep 2023 16:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE71FC433C7;
	Sat, 23 Sep 2023 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486404;
	bh=2piJOAc4UtCWCg8jsg4cD2ZIAtKbobPaZdza3lM1trU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1TXhCaOUKwD4i9ywBsaA7fqhllTiUUEop2bqUBzfEeLiBK0GMJal6TZCH02gcByL
	 753jvJ06wYTsHa9bNjwSyI/D53kLiYdlB1AiITQEZl13j1+ufZspu8eHeVKiSfnDPa
	 Xnzc94p2Es7bJABHatU5GnvCNtXzBwLW/ClIG+R90OCKZCTnz4sBwhPKehiv0ITJJM
	 +UjHKGlf0w5d8TT9nGbQtF1BeBR/tDz6eSth+IHkKyRVTlF1gKubvNuOjqYZN8sC6v
	 yInZcSWBoyftCQIH5y4EX0l+ogMUchapNByEIoCoBWaItl9SpqS6bxW8Fm8jrgT5Hv
	 hjgDbZyqE8rAA==
Date: Sat, 23 Sep 2023 19:25:47 +0300
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
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Message-ID: <20230923162547.GN3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-10-rppt@kernel.org>
 <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_092646_990511_D897FF8E 
X-CRM114-Status: GOOD (  13.72  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6MzA6NDZQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzHigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiBbLi4uXQo+ID4gQEAgLTEzNSw1ICsxMzgsMTMgQEAg
c3RydWN0IGV4ZWNtZW1fcGFyYW1zIF9faW5pdCAqZXhlY21lbV9hcmNoX3BhcmFtcyh2b2lkKQo+
ID4KPiA+ICAgICAgICAgcmFuZ2UtPnBncHJvdCA9IHByb3Q7Cj4gPgo+ID4gKyAgICAgICBleGVj
bWVtX3BhcmFtcy5yYW5nZXNbRVhFQ01FTV9LUFJPQkVTXS5zdGFydCA9IFZNQUxMT0NfU1RBUlQ7
Cj4gPiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnN0YXJ0
ID0gVk1BTExPQ19FTkQ7Cj4gCj4gLmVuZCA9IFZNQUxMT0NfRU5ELgoKVGhhbmtzLCB0aGlzIHNo
b3VsZCBoYXZlIGJlZW4KCglleGVjbWVtX3BhcmFtcy5yYW5nZXNbRVhFQ01FTV9LUFJPQkVTXS5z
dGFydCA9IHJhbmdlLT5zdGFydDsKCWV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9C
RVNdLmVuZCA9IHJhbmdlLT5lbmQ7Cgp3aGVyZSByYW5nZSBwb2ludHMgdG8gdGhlIHNhbWUgcmFu
Z2UgYXMgRVhFQ01FTV9NT0RVTEVfVEVYVC4KCiAKPiBUaGFua3MsCj4gU29uZwo+IAo+ID4gKwo+
ID4gKyAgICAgICBpZiAoc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQo+ID4gKyAgICAgICAg
ICAgICAgIGV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnBncHJvdCA9IFBB
R0VfS0VSTkVMX1JPWDsKPiA+ICsgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIGV4ZWNt
ZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnBncHJvdCA9IFBBR0VfS0VSTkVMX0VY
RUM7Cj4gPiArCj4gPiAgICAgICAgIHJldHVybiAmZXhlY21lbV9wYXJhbXM7Cj4gPiAgfQo+ID4g
LS0KPiA+IDIuMzkuMgo+ID4KPiA+CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
