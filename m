Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8453EC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFyBK/ZY5bcRjoG+w51ke2FSF01EiUFniqLAZAfO09o=; b=iv3l2Xviwab3Oq
	Yax3Mgtdl4wSi1SOlAoKA9U4Z24VlkdVgAkRmZGugjjM8180SRwvzTVFyjW88cshHruOaCGqzxiLe
	bpcAAZqtw8R8CMUrJbRvXvNU1liiG+YkJ/0GR8UZ/RtKxcnvzJvjNGnDRpy/OIE12ZLcxHp3xwMRT
	/UguXNUwRNDUocUSjB8uSph2iRE/s7bPWa0AxtlNTKDya2GyAR+tEOrw+0WAOCouR9KVq6sOQRNcs
	GpUleSoeH967ZqtzXpG/xO2puCUhDqsKmfuu1H1kZN0fEpffIjzAq6iUaje0EGcaQQ7R7zToVpzeG
	2OyOTpoOVajvyeK5sP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3lv-00GWCo-2X;
	Thu, 27 Jul 2023 16:23:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3lt-00GWAw-1n
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 16:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0584161E06;
	Thu, 27 Jul 2023 16:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2339BC433C7;
	Thu, 27 Jul 2023 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690475004;
	bh=TD7vS16IIuUgR5cYQWuElvIIyOIASC8KrZH5mzivc8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRAPajPHZHEkFEPS1peqox5tcJ7gM95Aa0aCNJgFLnZh76ZjtnFkuBVcnz2VozH3h
	 qZDfeOyYsA4/tOhwZThD1Yql5NWDQyNp3Pj1ax0nmxIR4WnyLuATCbodU9ujfYW53u
	 MCszD3oMGFT7emm3YOylZbPm+wk5j2slsAyhcAOJ65sBLz7/OOsnRbCh4xJ/DUq0Ky
	 1tUlP9y7qi5KYE8aTkRm3LfNM0NvGsiHz4fenNnLWpEz+bnaYoolNpKOn9yy/Jt44z
	 KwzX063DR7Y6SVY/+O7/Thx5Q5WG3hSSTpNkAXQLqX3mQEFEWksyReUFvFNGZxE/06
	 Kp2Bh1KU3ydlA==
Date: Fri, 28 Jul 2023 00:11:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZMKXQpreSr47MFj6@xhacker>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
 <20230725-unheard-dingy-42f0fafe7216@wendy>
 <ZL/jMYL3akl78ZZN@xhacker>
 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
 <ZME1J4mpVf5yth32@xhacker>
 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_092325_640118_88BD2730 
X-CRM114-Status: GOOD (  16.10  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDg6NTQ6NTlBTSArMDgwMCwgWGkgUnVveWFvIHdyb3Rl
Ogo+IE9uIFRodSwgMjAyMy0wNy0yNyBhdCAwODoxNCArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+
ID4gT24gV2VkLCAyMDIzLTA3LTI2IGF0IDIzOjAwICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3Rl
Ogo+ID4gPiB3aGljaCBkdHMgciB1IHVzaW5nPyBzZWUgYmVsb3cuCj4gPiA+IAo+ID4gPiA+IAo+
ID4gPiA+IE9yIG1heWJlIG15IHRvb2xjaGFpbiAoR0NDIDEzLjEuMCwgQmludXRpbHMtMi40MCwg
d2l0aCBubyBwYXRjaGVzKSBjYW4KPiA+ID4gPiBtaXNjb21waWxlIHRoZSBrZXJuZWw/Cj4gPiAK
PiA+IC8qIHNuaXAgKi8KPiA+IAo+ID4gPiA+IEJvb3QgSEFSVCBJRMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDogMAo+ID4gPiA+IEJvb3QgSEFSVCBEb21haW7CoMKgwqDCoMKgwqDCoMKgwqAg
OiByb290Cj4gPiA+ID4gQm9vdCBIQVJUIFByaXYgVmVyc2lvbsKgwqDCoCA6IHYxLjExCj4gPiA+
ID4gQm9vdCBIQVJUIEJhc2UgSVNBwqDCoMKgwqDCoMKgwqAgOiBydjY0aW1hZmRjdngKPiA+ID4g
Cj4gPiA+IHdoYXQ/IEkgZG9uJ3QgdGhpbmsgdGhlIG1haW5saW5lIGR0cyBwcm92aWRlIHYgYW5k
IHguIAo+ID4gCj4gPiBJIGNvcGllZCB0aGUgY29tcGlsZWQgYXJjaC9yaXNjdi9ib290L2R0cy90
aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0Ygo+ID4gaW50byAvYm9vdCBhbmQgbG9hZGVkIGl0
IHdpdGggdS1ib290ICJsb2FkIiBjb21tYW5kIG9udG8gMHg0NjAwMDAwMCwgYW5kCj4gPiBwYXNz
ZWQgdGhpcyBhZGRyZXNzIHRvIHRoZSBib290aSBjb21tYW5kLgo+ID4gCj4gPiBCdXQgbWF5YmUg
SSd2ZSBjb3BpZWQgdGhlIHdyb25nIGZpbGUgb3IgbWFkZSBzb21lIG90aGVyIG1pc3Rha2UuLi4g
SSdsbAo+ID4gcmVjaGVjay4KPiAKPiBIbW0sIGFuZCBpZiBJIHJlYWQgT3BlblNCSSBjb2RlIGNv
cnJlY3RseSwgdGhpcyBsaW5lIHJlZmxlY3RzIHRoZQo+IGNvbnRlbnQgb2YgdGhlIG1pc2EgQ1NS
LCBub3QgdGhlIERUIHJpc2N2LGlzYSB2YWx1ZS4KPiAKCkFoYSBpbmRlZWQgdGhlICJ2eCIgaXNh
IGV4dGVuc2lvbnMgYXJlIG5vdCBmcm9tIHRoZSBEVCByaXNjdixpc2EKcHJvcGVydHkuIEkgd2ls
bCB0cnkgeW91ciBvcGVuc2JpL2xpbnV4L3Vib290IGNvbWJpbmF0aW9ucyBvbiBteQpscGk0YSBi
b2FyZCB0b21vcnJvdy4KCj4gVGhlIGxvZyBvZiBzdWNjZXNzZnVsIGJvb3QgcHJvdmlkZWQgYnkg
RHJldyBhbHNvIGNvbnRhaW5zCj4gInJ2NjRpbWFmZGN2eCI6Cj4gCj4gaHR0cHM6Ly9naXN0Lmdp
dGh1Yi5jb20vcGRwNy8yMzI1OTU5NWE3NTcwZjFmMTEwODZkMjg2ZTE2ZGZiNgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
