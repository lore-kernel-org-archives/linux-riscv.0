Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37642CE7A89
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWCTEd4F9CIBVQQ3NrhB1B/ylk2untn5Df23ZfztfgE=; b=q7yhnRQ9xnLodl
	vKubByrER29a1kc8Cmc+lpcS3vfCd2pX4wxFO7IKsvwoDRlqca5odkTmI8F3MlQlJr0xaIPwkMBiS
	KWdWVcOlt/yP4kQvt7DXfz5wb78xy6idfn4sLyIrlCAwZJ4/cVTdbSOfHvRu6jThFj8+yIDe16yjK
	7VsEPzCeyDNfLDcmkKNWvS4oWnPxn5OFNW7KAlHzp498zxQmcT2PCcztv02JRLPuuF3lfoGxcsX3J
	2hBgwNHJEfNHKanrfX5S5BbkLINwavoX3QWloJ35Y28aUA1T4CcUJfmaEYMGCioSOEK+ETE81dU0t
	/wzl1lmVn/PEVZBID3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4nI-00B9gJ-05;
	Sat, 23 Sep 2023 15:43:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4nE-00B9dY-1R;
	Sat, 23 Sep 2023 15:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EECAACE1F4E;
	Sat, 23 Sep 2023 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A27C433C7;
	Sat, 23 Sep 2023 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695483816;
	bh=ljgPDKGzFtkM9CGruxS2yf0TQKHwYcBRpz7ZIM8VO3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdoqwjNCGj6+dmcR2by5om8f6OGdHooNrFAdirAK1+mff8rgXeaENEbWOfJO5o/PC
	 OJ43I0E8Te05bmcEVu+q3++C1e9dGOgWncbQbW9sES2Ibe2Pdsm+p44SaI/GSc9eJn
	 k1TIpPAI+1+0z14moXMdYfGTEFg/c4FGc6F68knV28yyNaM4SU8WYGPaWhzn5xPNAt
	 FG0AxN1gAVv9xHc/jH6GfcIvluITorwBbApgU2SfgTJcYKv7Yh/vBJZDq2ZFWWRfdD
	 gacKAomGi0R18n+DQTrEIea+0KrDaRDhkeAyfdIkOyz1+kcZ1YK3P1S2X1RDLM9+UU
	 ZFkbq4f/xAuEw==
Date: Sat, 23 Sep 2023 18:42:40 +0300
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
Message-ID: <20230923154240.GK3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_084340_670951_9AEB5CF5 
X-CRM114-Status: GOOD (  15.54  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6MTA6MjZQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzDigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiBbLi4uXQo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51
eC9tbS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L2V4ZWNtZW0uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlbG9hZGVyLmg+Cj4gPiAr
Cj4gPiArc3RhdGljIHZvaWQgKmV4ZWNtZW1fYWxsb2Moc2l6ZV90IHNpemUpCj4gPiArewo+ID4g
KyAgICAgICByZXR1cm4gbW9kdWxlX2FsbG9jKHNpemUpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lk
ICpleGVjbWVtX3RleHRfYWxsb2MoZW51bSBleGVjbWVtX3R5cGUgdHlwZSwgc2l6ZV90IHNpemUp
Cj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gZXhlY21lbV9hbGxvYyhzaXplKTsKPiA+ICt9Cj4g
Cj4gZXhlY21lbV90ZXh0X2FsbG9jIChhbmQgbGF0ZXIgZXhlY21lbV9kYXRhX2FsbG9jKSBib3Ro
IHRha2UgInR5cGUiIGFzCj4gaW5wdXQuIEkgZ3Vlc3Mgd2UgY2FuIGp1c3QgdXNlIGV4ZWNtZW1f
YWxsb2ModHlwZSwgc2l6ZSkgZm9yIGV2ZXJ5dGhpbmc/CgpXZSBjb3VsZCBidXQgSSBzdGlsbCBw
cmVmZXIgdG8ga2VlcCB0aGlzIGRpc3RpbmN0aW9uLgogCj4gVGhhbmtzLAo+IFNvbmcKPiAKPiA+
ICsKPiA+ICt2b2lkIGV4ZWNtZW1fZnJlZSh2b2lkICpwdHIpCj4gPiArewo+ID4gKyAgICAgICAv
Kgo+ID4gKyAgICAgICAgKiBUaGlzIG1lbW9yeSBtYXkgYmUgUk8sIGFuZCBmcmVlaW5nIFJPIG1l
bW9yeSBpbiBhbiBpbnRlcnJ1cHQgaXMgbm90Cj4gPiArICAgICAgICAqIHN1cHBvcnRlZCBieSB2
bWFsbG9jLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgV0FSTl9PTihpbl9pbnRlcnJ1cHQo
KSk7Cj4gPiArICAgICAgIHZmcmVlKHB0cik7Cj4gPiArfQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4K
Ci0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
