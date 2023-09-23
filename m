Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA39CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=246gzoZt0g337b+CKMqVveh+uj4jt8Gi7OW92Ipigac=; b=nXxD7Xps2uAsDL
	SJ9MJEo2zs3iBaHAw+U7fptahI9bWZnTrTVhivaOTmuyg10YLYinI8+5Gl2FCVMlZm5qG+QW5fRej
	dZnu/tCMLEhpAofw2tL8znAbyWJE4B2xuNfUrSCXcWQfcPw5qBG3tmx8RM6QJ3cCQ/7kj6BZCgmkY
	nYV/SHeaIs7MuyzMqMAO47DR/25JAtubC1yR7oTjaICH4nu+mOVqiesXAZtEKz1YM1b1nLXQQytA1
	0D2O24H+QNw+T7K438qvBLi2o17AapAwr+JOXrTwp7BrBs2hjSVa907JX/g8jdRMZC0tLqNjOf8jR
	3LBQlJtBLmcfmBma00PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4is-00B94u-0A;
	Sat, 23 Sep 2023 15:39:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4ip-00B93W-07;
	Sat, 23 Sep 2023 15:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A4F7AB80092;
	Sat, 23 Sep 2023 15:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2139BC433C8;
	Sat, 23 Sep 2023 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695483543;
	bh=44aW6DcKJaHGXelf02UJMtFK5RbIa4QmGjb00e/7p/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw2A/tcOcobQiglJay8dvPT5bEfVdzbbmq0FwMYYkRDEvMMNze6l5vdxXC61b2ule
	 JFCwMCsxrAuMW6D9gVnh2enWSeUtDeXGmVEjWBDuVv9KbPW1MRt9tzybn9NNKJQMj2
	 y3Lc/W+nmmCK2KsTrqRVvz29GuwFbt1mGULYw6jBfPPwRcYXpuSga9okI5ya4zHkUD
	 tynDeAbBph8ozw0L4VOesv/AFGSBeSrp7QqXSV98fLRWfSHzHFilN6nNqox4/XsFqb
	 GBdnrmPrEZw+uXG8gLcDpColobXRcu9WsCK8bgQKX9ms+oqH3fV0ph2eOZh795NWNU
	 moLZ9gWnlnDaA==
Date: Sat, 23 Sep 2023 18:38:08 +0300
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
Message-ID: <20230923153808.GI3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_083907_374347_48F66891 
X-CRM114-Status: GOOD (  17.26  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6MzQ6MThQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzDigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiAKPiBbLi4uXQo+IAo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvczM5MC9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3MzOTAva2VybmVsL21vZHVsZS5jCj4gPiBp
bmRleCA0MjIxNWY5NDA0YWYuLmRiNTU2MWQwYzIzMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvczM5
MC9rZXJuZWwvbW9kdWxlLmMKPiA+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvbW9kdWxlLmMKPiA+
IEBAIC0yMSw2ICsyMSw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZWxvYWRlci5oPgo+
ID4gICNpbmNsdWRlIDxsaW51eC9idWcuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbWVtb3J5Lmg+
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2V4ZWNtZW0uaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2FsdGVy
bmF0aXZlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9ub3NwZWMtYnJhbmNoLmg+Cj4gPiAgI2luY2x1
ZGUgPGFzbS9mYWNpbGl0eS5oPgo+ID4gQEAgLTc2LDcgKzc3LDcgQEAgdm9pZCAqbW9kdWxlX2Fs
bG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ICAjaWZkZWYgQ09ORklHX0ZVTkNUSU9OX1RSQUNF
Ugo+ID4gIHZvaWQgbW9kdWxlX2FyY2hfY2xlYW51cChzdHJ1Y3QgbW9kdWxlICptb2QpCj4gPiAg
ewo+ID4gLSAgICAgICBtb2R1bGVfbWVtZnJlZShtb2QtPmFyY2gudHJhbXBvbGluZXNfc3RhcnQp
Owo+ID4gKyAgICAgICBleGVjbWVtX2ZyZWUobW9kLT5hcmNoLnRyYW1wb2xpbmVzX3N0YXJ0KTsK
PiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gQEAgLTUxMCw3ICs1MTEsNyBAQCBzdGF0aWMgaW50
IG1vZHVsZV9hbGxvY19mdHJhY2VfaG90cGF0Y2hfdHJhbXBvbGluZXMoc3RydWN0IG1vZHVsZSAq
bWUsCj4gPgo+ID4gICAgICAgICBzaXplID0gRlRSQUNFX0hPVFBBVENIX1RSQU1QT0xJTkVTX1NJ
WkUocy0+c2hfc2l6ZSk7Cj4gPiAgICAgICAgIG51bXBhZ2VzID0gRElWX1JPVU5EX1VQKHNpemUs
IFBBR0VfU0laRSk7Cj4gPiAtICAgICAgIHN0YXJ0ID0gbW9kdWxlX2FsbG9jKG51bXBhZ2VzICog
UEFHRV9TSVpFKTsKPiA+ICsgICAgICAgc3RhcnQgPSBleGVjbWVtX3RleHRfYWxsb2MoRVhFQ01F
TV9GVFJBQ0UsIG51bXBhZ2VzICogUEFHRV9TSVpFKTsKPiAKPiBUaGlzIHNob3VsZCBiZSBFWEVD
TUVNX01PRFVMRV9URVhUPwoKVGhpcyBpcyBhbiBmdHJhY2UgdHJhbXBvbGluZSwgc28gSSB0aGlu
ayBpdCBzaG91bGQgYmUgRlRSQUNFIHR5cGUgb2YKYWxsb2NhdGlvbi4KIAo+IFRoYW5rcywKPiBT
b25nCj4gCj4gPiAgICAgICAgIGlmICghc3RhcnQpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gPiAgICAgICAgIHNldF9tZW1vcnlfcm94KCh1bnNpZ25lZCBsb25nKXN0YXJ0
LCBudW1wYWdlcyk7Cj4gWy4uLl0KCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
