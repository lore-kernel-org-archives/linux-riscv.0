Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC3AC7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lv6GQJV4Sr4qXRQEgcdSwrI0EuorRVtbJud7X192Kx4=; b=PSRiLLfN14eNJV
	IjgGci0QuiZSE76qdbGSmOSmzfYOHL0qLmioPUc8cN2p5CbV85NdTokiqZOWAFLwCePw/0OOgQty7
	og38W5dEFiCYwaYjrmqoJAbXHNRiMTWLPtS+Ds26+wrgsLcgldxoACeDM/fGezgC813JQe1u+9kr9
	DOcSiYNZ1l6wz1/+FUZLTcvZhiBtsloziQyvZB4XdjoVUN4uBgJyFJeaYKR8MxxIItWMiRcRWbNw2
	8dRH6vvHG/DcDaKn3LZLXa7hmhMktV6YYvbJ/BDbutrgy18O3G60Bcz7n0e8QN3bg6uUr9z4JfVPr
	vvjjtUGecwtqepQM+yJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bJz-002jtk-1r;
	Tue, 06 Jun 2023 18:22:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bJv-002js0-2o;
	Tue, 06 Jun 2023 18:22:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E461D636A7;
	Tue,  6 Jun 2023 18:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCA9C4331F;
	Tue,  6 Jun 2023 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686075734;
	bh=08bgDTu6K2r14VqmkEIMfCPJQ/ZZrnAx7Zh60inB9tQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZWPc2Ay9qV+46W5EIl1Hat/oWhCmkf2atoI7Djyx7M9K8nTcPWM51zO0JgXQR/xJA
	 t6kkVflNQu8aEchQ0gWokejvbn0lD4N+mkDVLz/vpv4NfXuw4Ue4w5/ggGi9dBfKiZ
	 FbyGdgANCc28tlTGlHG3sjNhVLTPxaSnMiPYhxWksxnkaN6w7Z8t8XpDCqJBTwrewz
	 7miB72dJ8VC2moDFlWb2Dg+2pHaD8TB88qpU65gh5ZEErvyTm+QOEYn4FI4IN5NnX+
	 vSaQ/C5uDNk1W0XxM90aSXxJjvBdgk4T++XB8N2/4BPrh3DvP9IK4m5Qlazjdmj/3m
	 EHdGa+FT3FpmQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b1a6a8e851so72152051fa.2;
        Tue, 06 Jun 2023 11:22:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDx8vJxF4wXBEewLNUOaMWBRkggbwgiRpmweafg8qAgCL6pefZKz
	2LHYUqaxGCKjXZz1oMNWACCgRaRvWepena+gN3s=
X-Google-Smtp-Source: ACHHUZ5bLSr3tA3IB8xCjeC0rEYdnEDeq7vmc1y/QuS5oHjyhnnuqZDpSw2PwmODz4CMTnRxT8zG59Qp1zLSa+hdG70=
X-Received: by 2002:a2e:82d0:0:b0:2b0:297c:cbdf with SMTP id
 n16-20020a2e82d0000000b002b0297ccbdfmr1546782ljh.1.1686075731505; Tue, 06 Jun
 2023 11:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org> <ZH20XkD74prrdN4u@FVFF77S0Q05N>
In-Reply-To: <ZH20XkD74prrdN4u@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Tue, 6 Jun 2023 11:21:59 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
Message-ID: <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_112216_002578_0AF28623 
X-CRM114-Status: GOOD (  26.48  )
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

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCAzOjA54oCvQU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6CgpbLi4uXQoKPiA+ID4gPiBDYW4geW91IGdpdmUgbW9yZSBkZXRh
aWwgb24gd2hhdCBwYXJhbWV0ZXJzIHlvdSBuZWVkPyBJZiB0aGUgb25seSBleHRyYQo+ID4gPiA+
IHBhcmFtZXRlciBpcyBqdXN0ICJkb2VzIHRoaXMgYWxsb2NhdGlvbiBuZWVkIHRvIGxpdmUgY2xv
c2UgdG8ga2VybmVsCj4gPiA+ID4gdGV4dCIsIHRoYXQncyBub3QgdGhhdCBiaWcgb2YgYSBkZWFs
Lgo+ID4gPgo+ID4gPiBNeSB0aGlua2luZyB3YXMgdGhhdCB3ZSBhdCBsZWFzdCBuZWVkIHRoZSBz
dGFydCArIGVuZCBmb3IgZWFjaCBjYWxsZXIuIFRoYXQKPiA+ID4gbWlnaHQgYmUgaXQsIHRiaC4K
PiA+Cj4gPiBEbyB5b3UgbWVhbiB0aGF0IG1vZHVsZXMgd2lsbCBoYXZlIHNvbWV0aGluZyBsaWtl
Cj4gPgo+ID4gICAgICAgaml0X3RleHRfYWxsb2Moc2l6ZSwgTU9EVUxFU19TVEFSVCwgTU9EVUxF
U19FTkQpOwo+ID4KPiA+IGFuZCBrcHJvYmVzIHdpbGwgaGF2ZQo+ID4KPiA+ICAgICAgIGppdF90
ZXh0X2FsbG9jKHNpemUsIEtQUk9CRVNfU1RBUlQsIEtQUk9CRVNfRU5EKTsKPiA+ID8KPgo+IFll
cy4KCkhvdyBhYm91dCB3ZSBzdGFydCB3aXRoIHR3byBBUElzOgogICAgIGppdF90ZXh0X2FsbG9j
KHNpemUpOwogICAgIGppdF90ZXh0X2FsbG9jX3JhbmdlKHNpemUsIHN0YXJ0LCBlbmQpOwoKQUZB
SUNULCBhcm02NCBpcyB0aGUgb25seSBhcmNoIHRoYXQgcmVxdWlyZXMgdGhlIGxhdHRlciBBUEku
IEFuZCBUQkgsIEkgYW0Kbm90IHF1aXRlIGNvbnZpbmNlZCBpdCBpcyBuZWVkZWQuCgo+Cj4gPiBJ
dCBzaWxsIGNhbiBiZSBhY2hpZXZlZCB3aXRoIGEgc2luZ2xlIGppdF9hbGxvY19hcmNoX3BhcmFt
cygpLCBqdXN0IGJ5Cj4gPiBhZGRpbmcgZW51bSBqaXRfdHlwZSBwYXJhbWV0ZXIgdG8gaml0X3Rl
eHRfYWxsb2MoKS4KPgo+IFRoYXQgZmVlbHMgYmFja3dhcmRzIHRvIG1lOyBpdCBjZW50cmFsaXpl
cyBhIGJ1bmNoIG9mIGluZm9ybWF0aW9uIGFib3V0Cj4gZGlzdGluY3QgdXNlcnMgdG8gYmUgYWJs
ZSB0byBzaG92ZSB0aGF0IGludG8gYSBzdGF0aWMgYXJyYXksIHdoZW4gdGhlIGNhbGxzaXRlcwo+
IGNhbiBwYXNzIHRoYXQgaW5mb3JtYXRpb24uCgpJIHRoaW5rIHdlIG9ubHkgdHdvIHR5cGUgb2Yg
dXNlcnM6IG1vZHVsZSBhbmQgZXZlcnl0aGluZyBlbHNlIChmdHJhY2UsIGtwcm9iZSwKYnBmIHN0
dWZmKS4gVGhlIGtleSBkaWZmZXJlbmNlcyBhcmU6CgogIDEuIG1vZHVsZSB1c2VzIHRleHQgYW5k
IGRhdGE7IHdoaWxlIGV2ZXJ5dGhpbmcgZWxzZSBvbmx5IHVzZXMgdGV4dC4KICAyLiBtb2R1bGUg
Y29kZSBpcyBnZW5lcmF0ZWQgYnkgdGhlIGNvbXBpbGVyLCBhbmQgdGh1cyBoYXMgc3Ryb25nZXIK
ICByZXF1aXJlbWVudHMgaW4gYWRkcmVzcyByYW5nZXM7IGV2ZXJ5dGhpbmcgZWxzZSBhcmUgZ2Vu
ZXJhdGVkIHZpYSBzb21lCiAgSklUIG9yIG1hbnVhbCB3cml0dGVuIGFzc2VtYmx5LCBzbyB0aGV5
IGFyZSBtb3JlIGZsZXhpYmxlIHdpdGggYWRkcmVzcwogIHJhbmdlcyAoaW4gSklULCB3ZSBjYW4g
YXZvaWQgdXNpbmcgaW5zdHJ1Y3Rpb25zIHRoYXQgcmVxdWlyZXMgYSBzcGVjaWZpYwogIGFkZHJl
c3MgcmFuZ2UpLgoKVGhlIG5leHQgcXVlc3Rpb24gaXMsIGNhbiB3ZSBoYXZlIHRoZSB0d28gdHlw
ZXMgb2YgdXNlcnMgc2hhcmUgdGhlIHNhbWUKYWRkcmVzcyByYW5nZXM/IElmIG5vdCwgd2UgY2Fu
IHJlc2VydmUgdGhlIHByZWZlcnJlZCByYW5nZSBmb3IgbW9kdWxlcywKYW5kIGxldCBldmVyeXRo
aW5nIGVsc2UgdXNlIHRoZSBvdGhlciByYW5nZS4gSSBkb24ndCBzZWUgcmVhc29ucyB0byBmdXJ0
aGVyCnNlcGFyYXRlIHVzZXJzIGluIHRoZSAiZXZlcnl0aGluZyBlbHNlIiBncm91cC4KCj4KPiBX
aGF0J3MgKmFjdHVhbGx5KiBjb21tb24gYWZ0ZXIgc2VwYXJhdGluZyBvdXQgdGhlIHJhbmdlcz8g
SXMgaXQganVzdCB0aGUKPiBwZXJtaXNzaW9ucz8KCkkgYmVsaWV2ZSBwZXJtaXNzaW9uIGlzIHRo
ZSBrZXksIGFzIHdlIG5lZWQgdGhlIGhhcmR3YXJlIHRvIGVuZm9yY2UKcGVybWlzc2lvbi4KCj4K
PiBJZiB3ZSB3YW50IHRoaXMgdG8gYmUgYWJsZSB0byBzaGFyZSBhbGxvY2F0aW9ucyBhbmQgc28g
b24sIHdoeSBjYW4ndCB3ZSBkbyB0aGlzCj4gbGlrZSBhIGttZW1fY2FjaGUsIGFuZCBoYXZlIHRo
ZSBjYWxsc2l0ZSBwYXNzIGEgcG9pbnRlciB0byB0aGUgYWxsb2NhdG9yIGRhdGE/Cj4gVGhhdCB3
b3VsZCBtYWtlIGl0IGVhc3kgZm9yIGNhbGxzaXRlcyB0byBzaGFyZSBhbiBhbGxvY2F0b3Igb3Ig
dXNlIGEgZGlzdGluY3QKPiBvbmUuCgpTaGFyaW5nIGFtb25nIGRpZmZlcmVudCBjYWxsIHNpdGVz
IHdpbGwgZ2l2ZSB1cyBtb3JlIGJlbmVmaXQgKGluIFRMQgptaXNzZXMgcmF0ZSwKZXRjLikuIEZv
ciBleGFtcGxlLCBhIDJNQiBwYWdlIG1heSBob3N0IHRleHQgb2YgdHdvIGtlcm5lbCBtb2R1bGVz
LCA0IGtwcm9iZXMsCjYgZnRyYWNlIHRyYW1wb2xpbmVzLCBhbmQgMTAgQlBGIHByb2dyYW1zLiBB
bGwgb2YgdGhlc2Ugb25seSByZXF1aXJlIG9uZSBlbnRyeQppbiB0aGUgaVRMQi4KClRoYW5rcywK
U29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
