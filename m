Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B93C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeEDwjc059dgmPuN060PftBp5F+Gbd7mTnamQDfsaEw=; b=KEw84AnnxrBsfA
	bAcn+4mXG+ol1hZtcaiAffSlCfAvuiY4EslAeX9s2x7hXbyZsf3gt4ocLEDPTEJ1wHGyLlVMmFJqz
	OV6jhmV3uayWGYfniwA2tusijxaYgwZqDFEd8QKuyNTZW/9UpPyMMl4pEbJGonS+aaOX3Zon7fbLn
	Y9ojJnRBH3QMDOgLGcWYhmBacoa4g3YXoKk2IcWd2w3SOE6KCvniejj3tL5wiRbDD9sa8hFX6O6wA
	kbGFsbVaH5LGH9V3KIzRBg9GEmNpuCtb+R/hQXO29inpwUp+PJLuk/cyIjZ6Q1eXc48pclOO4RAjz
	9gIYdUcHkhU6+BcTvqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0GF-0000000Fpdn-1yON;
	Fri, 13 Jun 2025 08:59:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0GD-0000000FpdX-35Nu;
	Fri, 13 Jun 2025 08:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SUCUXJtX/FQ0n2RuIYjo9mN42TY+/sRw81vNJDMJO0A=; b=i+jZgFzbWAnJFV8McOJFZkb4Sf
	213aoWkau7/0FLCSmL71S/rEgW17oFy3r0pqc5NX2ZsssYRmX75PR4Hk6JBjQtN7ZWWxcvpZ8ZoRo
	/bjnsqTydACIvzsaWJjA53mvQ6o63MN3IUsWJS4Twz6dBRsR2/RiC9pWDJjI9RTd6IP+7Ep7y6f3m
	9mexwNkblEVjqcHAz69tGo9G+bWLpX4ALTld4qUR+S6YAM4PcXLbXZBddloI7qp3TaU3/NCLaPypq
	1jlshUiwqWniDDcWtXKtCpx1LBHGpepuOBZaCGxdvb2dQ3dvzGrWzqdjilKXbF/hylIb8iLUiLW3u
	OrQ0nGBQ==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0GB-00000002wPY-1c41;
	Fri, 13 Jun 2025 08:59:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DEFE42E7E;
	Fri, 13 Jun 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749805174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUCUXJtX/FQ0n2RuIYjo9mN42TY+/sRw81vNJDMJO0A=;
	b=odU2qoVOJqtmWsv4zb4lepGDdwIrGFVx1azJXmapyDqL96WcBHU3wmTN7q7dQPmyKFqCHI
	rAqafMySpH/EFaSvZ1mPA8XPB64itYMWMRjLI+y9JhypSBAVbn7uBWi7ZcMRo/IBOnvwbQ
	5esOyHBXJvmN2G+ljk317R7i3D4fcRlCkLEQ6ICe/sb+aRuObTcakshd3/wdZEUJ2LrUgk
	5TMr9mGozxkHTrm+MRwSTF64qE4g2cgcgr48VeDhBLpdVtT0mS0PBL7DckMWmv65tfLxtu
	MspFh3LUUD6IifvG5Ga5z6d3PYGcXoafBp+C4hw7u5Y8qm4JyGJ0DAuSLAMGzw==
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 10:59:28 +0200
Message-Id: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Menglong Dong"
 <imagedong@tencent.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, "Pu Lehui" <pulehui@huawei.com>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Hari
 Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Mykola
 Lysenko" <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <ebpf@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when
 args location on stack is uncertain
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net> <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_095939_596162_BEB734E5 
X-CRM114-Status: GOOD (  11.65  )
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

T24gRnJpIEp1biAxMywgMjAyNSBhdCAxMDozMiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90
ZToKPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCAxMDoyNjozN0FNICswMjAwLCBBbGV4aXMgTG90
aG9yw6kgd3JvdGU6Cj4+IEhpIFBldGVyLAo+PiAKPj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAx
MDoxMSBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPj4gPiBPbiBGcmksIEp1biAxMywg
MjAyNSBhdCAwOTozNzoxMUFNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlv
bikgd3JvdGU6CgpbLi4uXQoKPj4gTWF5YmUgbXkgY29tbWl0IHdvcmRpbmcgaXMgbm90IHByZWNp
c2UgZW5vdWdoLCBidXQgaW5kZWVkLCB0aGVyZSdzIG5vdAo+PiBkb3VidCBhYm91dCB3aGV0aGVy
IHRoZSBzdHJ1Y3QgdmFsdWUgaXMgcGFzc2VkIG9uIHRoZSBzdGFjayBvciB0aHJvdWdoIGEKPj4g
cmVnaXN0ZXIvYSBwYWlyIG9mIHJlZ2lzdGVycy4gVGhlIGRvdWJ0IGlzIHJhdGhlciBhYm91dCB0
aGUgc3RydWN0IGxvY2F0aW9uCj4+IHdoZW4gaXQgaXMgcGFzc2VkIF9ieSB2YWx1ZV8gYW5kIF9v
biB0aGUgc3RhY2tfOiB0aGUgQUJJIGluZGVlZCBjbGVhcmx5Cj4+IHN0YXRlcyB0aGF0ICJTdHJ1
Y3R1cmVzIGFuZCB1bmlvbnMgYXNzdW1lIHRoZSBhbGlnbm1lbnQgb2YgdGhlaXIgbW9zdAo+PiBz
dHJpY3RseSBhbGlnbmVkIGNvbXBvbmVudCIgKHAuMTMpLCBidXQgdGhpcyBydWxlIGlzICJzaWxl
bnRseSBicm9rZW4iIHdoZW4KPj4gYSBzdHJ1Y3QgaGFzIGFuIF9fYXR0cmlidXRlX18oKHBhY2tl
ZCkpIG9yIGFuZCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFgpKSksCj4+IGFuZCBBRkFJQ1QgdGhp
cyBjYXNlIGNhbiBub3QgYmUgZGV0ZWN0ZWQgYXQgcnVudGltZSB3aXRoIGN1cnJlbnQgQlRGIGlu
Zm8uCj4KPiBBaCwgb2theS4gU28gaXQgaXMgYSBmYWlsdXJlIG9mIEJURi4gVGhhdCB3YXMgaW5k
ZWVkIG5vdCBjbGVhci4KCklmIEkgbmVlZCB0byByZXNwaW4sIEknbGwgcmV3cml0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gaW5jbHVkZSB0aGUgZGV0YWlscwphYm92ZS4KCkFsZXhpcwoKCgoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
