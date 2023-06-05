Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C02C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 04:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrRKiSTdSQO1jhH5gdcNOB2yXMNLy1f+XnZNTUlxB+4=; b=yarHWqrAvNVvit
	PKMTKZqnnxMhcRGCaUYO1sc86RAJoTqypSyGXbFablnn+Kq9EXCak9CL9SkARo7TPf9I/Ljgxfb2/
	MunsgfLuhE7q6NMZq5zJdRA/UzjrSmoekKdpXE25dvDqUCVE4f+OFza7Cb3Dx+60laqdX355Awjs6
	g++YBF3tvcMCNrjtoBWC4iVoW+kultF61S6cP0NqufCP1lweipn29nYCKLv/se/c4ZlNAHYwCfm0S
	zGORwM+hCZEeXVHdqEVi+vjR49ffVpEnzvgV681MklPN2r9KiJNLs1IkK2V5mhzXOIZiW91b3LFFD
	zTwxcgsZDNLFfTlz99NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61Tq-00E1Fs-27;
	Mon, 05 Jun 2023 04:06:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61Tm-00E1Do-31;
	Mon, 05 Jun 2023 04:06:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA76D60FE5;
	Mon,  5 Jun 2023 04:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFCEC433D2;
	Mon,  5 Jun 2023 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685937961;
	bh=WtI1jY3mnr9zb4/0mcezfP7YgsPqPtpWRWa72DAZTTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uxKGktXNqn49bEfc54rxrLont7pLs83GyZuzAufBwsGBjuGMKdcRP/bEdwYmfXXxU
	 WvxTYj5OfeXmTt5HLnDLwPgr67Lkt70CP1EvdU2veiDINIXLIDAS+iKL+CqrOBDxNc
	 W/VQJXu20GHLghTy7G8UfIn1gM+F5ueXv0na8lU8CSN0FmokvQ65P4mX8K8i05YG/W
	 fPh72tKYwA3H59nPmnDH3bp9qH5k5y+9C+A7tg1dtcxIc9fAAEgtE2WRW9gNO+56RG
	 rnpEhaZc8TsRLxnuELVYU2NxAebO69dROiM74lzh42BNKszJ2YPFsTB9bCrjTQGdS0
	 SNLJmYWsBwYSA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso34310281fa.0;
        Sun, 04 Jun 2023 21:06:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDxQpeHsXWwbcdd8UEAI+ppNUW8lmVk9TkNh5yR4j/vzE3RsG+iS
	PZD23THObF8f8t7Hjx8gOn7AEzGxHh7p46o6bc4=
X-Google-Smtp-Source: ACHHUZ5GrSEK3PQNTobRaaPR4GI9Q/dG/dH9vtDqov4NPtsLbAuvSoOBGIqnwRO1u3fwexaWyE5OrfsdUvjgUci7FZk=
X-Received: by 2002:a2e:2419:0:b0:2ad:d6cd:efdd with SMTP id
 k25-20020a2e2419000000b002add6cdefddmr3089294ljk.32.1685937959380; Sun, 04
 Jun 2023 21:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
 <ZHzRxE5V6YzGVsHy@moria.home.lan> <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
 <ZH0EseWI9F1n9yJx@moria.home.lan>
In-Reply-To: <ZH0EseWI9F1n9yJx@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sun, 4 Jun 2023 21:05:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7S40xCz_e0fdimfC+ybO=kvMg3SSzTd1s4qiOcvmJJcA@mail.gmail.com>
Message-ID: <CAPhsuW7S40xCz_e0fdimfC+ybO=kvMg3SSzTd1s4qiOcvmJJcA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_210603_082710_CEDE4799 
X-CRM114-Status: GOOD (  27.40  )
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

T24gU3VuLCBKdW4gNCwgMjAyMyBhdCAyOjQw4oCvUE0gS2VudCBPdmVyc3RyZWV0CjxrZW50Lm92
ZXJzdHJlZXRAbGludXguZGV2PiB3cm90ZToKPgo+IE9uIFN1biwgSnVuIDA0LCAyMDIzIGF0IDAy
OjIyOjMwUE0gLTA3MDAsIFNvbmcgTGl1IHdyb3RlOgo+ID4gT24gU3VuLCBKdW4gNCwgMjAyMyBh
dCAxMTowMuKAr0FNIEtlbnQgT3ZlcnN0cmVldAo+ID4gPGtlbnQub3ZlcnN0cmVldEBsaW51eC5k
ZXY+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIEp1biAwMiwgMjAyMyBhdCAxMToyMDo1OEFN
IC0wNzAwLCBTb25nIExpdSB3cm90ZToKPiA+ID4gPiBJSVVDLCBhcm02NCB1c2VzIFZNQUxMT0Mg
YWRkcmVzcyBzcGFjZSBmb3IgQlBGIHByb2dyYW1zLiBUaGUgcmVhc29uCj4gPiA+ID4gaXMgZWFj
aCBCUEYgcHJvZ3JhbSB1c2VzIGF0IGxlYXN0IDY0a0IgKG9uZSBwYWdlKSBvdXQgb2YgdGhlIDEy
OE1CCj4gPiA+ID4gYWRkcmVzcyBzcGFjZS4gUHVyYW5qYXkgTW9oYW4gKENDJ2VkKSBpcyB3b3Jr
aW5nIG9uIGVuYWJsaW5nCj4gPiA+ID4gYnBmX3Byb2dfcGFjayBmb3IgYXJtNjQuIE9uY2UgdGhp
cyB3b3JrIGlzIGRvbmUsIG11bHRpcGxlIEJQRiBwcm9ncmFtcwo+ID4gPiA+IHdpbGwgYmUgYWJs
ZSB0byBzaGFyZSBhIHBhZ2UuIFdpbGwgdGhpcyBpbXByb3ZlbWVudCByZW1vdmUgdGhlIG5lZWQg
dG8KPiA+ID4gPiBzcGVjaWZ5IGEgZGlmZmVyZW50IGFkZHJlc3MgcmFuZ2UgZm9yIEJQRiBwcm9n
cmFtcz8KPiA+ID4KPiA+ID4gQ2FuIHdlIHBsZWFzZSBzdG9wIHdvcmtpbmcgb24gQlBGIHNwZWNp
ZmljIHN1YiBwYWdlIGFsbG9jYXRpb24gYW5kIGZvY3VzCj4gPiA+IG9uIGRvaW5nIHRoaXMgaW4g
bW0vPyBUaGlzIG5ldmVyIHNob3VsZCBoYXZlIGJlZW4gaW4gQlBGIGluIHRoZSBmaXJzdAo+ID4g
PiBwbGFjZS4KPiA+Cj4gPiBUaGF0IHdvcmsgaXMgbW9zdGx5IGluZGVwZW5kZW50IG9mIHRoZSBh
bGxvY2F0b3Igd29yayB3ZSBhcmUgZGlzY3Vzc2luZyBoZXJlLgo+ID4gVGhlIGdvYWwgUHVyYW5q
YXkncyB3b3JrIGlzIHRvIGVuYWJsZSB0aGUgYXJtNjQgQlBGIEpJVCBlbmdpbmUgdG8gdXNlIGEK
PiA+IFJPWCBhbGxvY2F0b3IuIFRoZSBhbGxvY2F0b3IgY291bGQgYmUgdGhlIGJwZl9wcm9nX3Bh
Y2sgYWxsb2NhdG9yLCBvciBqaXRhbGxvYywKPiA+IG9yIG1vZHVsZV9hbGxvY190eXBlLiBQdXJh
bmpheSBpcyB1c2luZyBicGZfcHJvZ19hbGxvYyBmb3Igbm93LiBCdXQgb25jZQo+ID4gaml0YWxs
b2Mgb3IgbW9kdWxlX2FsbG9jX3R5cGUgKGVpdGhlciBvbmUpIGlzIG1lcmdlZCwgd2Ugd2lsbCBt
aWdyYXRlIEJQRgo+ID4gSklUIGVuZ2luZXMgKHg4Nl82NCBhbmQgYXJtNjQpIHRvIHRoZSBuZXcg
YWxsb2NhdG9yIGFuZCB0aGVuIHRlYXIgZG93bgo+ID4gYnBmX3Byb2dfcGFjay4KPiA+Cj4gPiBE
b2VzIHRoaXMgbWFrZSBzZW5zZT8KPgo+IFllYWgsIGFzIGxvbmcgYXMgdGhhdCdzIHRoZSBwbGFu
LiBNYXliZSBvbmUgb2YgeW91IGNvdWxkIHRlbGwgdXMgd2hhdAo+IGlzc3VlcyB3ZXJlIHByZXZl
bnRpbmcgcHJvZ19wYWNrIGZyb20gYmVpbmcgdXNlZCBpbiB0aGUgZmlyc3QgcGxhY2UsIGl0Cj4g
bWlnaHQgYmUgcmVsZXZhbnQgLSB0aGlzIGlzIHRoZSB0aW1lIHRvIGdldCB0aGUgbmV3IGFsbG9j
YXRvciBBUEkgcmlnaHQuCgpUaGUgSklUIGVuZ2luZSBkb2VzIGEgbG90IG9mIHdyaXRlcy4gSW5z
dGVhZCBvZiBkb2luZyBtYW55IHRleHRfcG9rZSgpLAp3ZSBhcmUgdXNpbmcgYSB0ZW1wb3Jhcnkg
Ulcgd3JpdGUgYnVmZmVyLCBhbmQgdGhlbiBkbyB0ZXh0X3Bva2VfY29weSgpCmF0IHRoZSBlbmQu
IFRvIG1ha2UgdGhpcyB3b3JrLCB3ZSBuZWVkIHRoZSBKSVQgZW5naW5lIHRvIGJlIGFibGUgdG8K
aGFuZGxlIGFuIFJXIHRlbXBvcmFyeSBidWZmZXIgYW5kIGFuIFJPIGZpbmFsIG1lbW9yeSByZWdp
b24uIFRoZXJlCmlzIG5vdGhpbmcgcHJldmVudGluZyBwcm9nX3BhY2sgdG8gd29yay4gSXQgaXMg
anVzdCB3ZSBuZWVkIHRvIGRvIHRoZQp3b3JrLgoKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
