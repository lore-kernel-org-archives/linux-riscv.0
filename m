Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6BBC6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1pqmcaDdZywGvsftwLJ4C3CDHGdhzjLA/1Bwc1mkBU=; b=NSR33950time9m
	UGeaf3r8A75LQx584pKIhoUL6tEz8uP7f5dlv2HiPzzSqXkJIWhWHZrr+CHed17cPRNvgkLcqdTQC
	M1C0PfenWFK9GjwYKQUk/7Z+YuvELu5QFVgyE+5bX+RC0y+keUrbj2mxE1Ix/J7GRiDjkJssYEh30
	aOS7bO4KNACVyJddYHGaqJ790LGgT/+GR2SPR7+20L6k0HbwDKAGAyXlGp9Cx1qAFc+FasRTdmG0p
	lPAxz6KvluuXj++DSZnTzhY1IO5idsa8pri4XsBeD+Tf6PAoeF/yukMDv8hOKOZsY/G/A+e/bp3UV
	U8SNwCz0YwFavrncqXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCG6-006z8B-1l;
	Fri, 31 Mar 2023 10:45:26 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCG1-006z6U-2p
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:45:23 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A26FF5C00E3;
	Fri, 31 Mar 2023 06:45:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 06:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1680259517; x=1680345917; bh=pzy3nJ30w0x4nrGzKOJJ8rRyt47zboRy5gx
	fhKC4NYI=; b=A7YeMzUJVhHQHNgRPcCCzPVnsvvJW/+RlJHcot4BrK9OnCx+4Nr
	ggbru+dt4n3iLcF60cSoLKHEAG6Bb4YbtAhmElrZcs9HCCdB5RFb/k8NoArODb92
	+EqoLY8OmnZYkwunpoQIJSY2u68OccDdU8z/JgFundu7Jbw3EJX1q74r6yFgJiVD
	HQDFQyB5IqiNntc52jkAhFEXPO0Al3gfjKHGhy1adumV75lyqrZivOh8zeacl97h
	XSSLQSJZp/5Qr9+gm99/rKqIxoYMZb6mMPaFnYGYupD/l0ym/i8RuxS7NPO/1BC0
	ytOMGQ1UG04vwBX2SaP/8zmk2DqZFnDEwQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680259517; x=1680345917; bh=pzy3nJ30w0x4nrGzKOJJ8rRyt47zboRy5gx
	fhKC4NYI=; b=rRLpijf7nAfAb9LM1qqYp6dF8Z5Mj6xTdPJoDYABChmA8MUlAWs
	VcoEfUYpSeki5Io71aV0OfMdb34D+Xu5PBxU25zuYqgexM7rgqE5rkk+jHpHlzj+
	Qk/LG6+budISvSoeWaPuQIGh5DqNUnlOtYaIoYZmvjL97UIBk98ATs6KMZjU5Voz
	I9QLBf2uGkbsADdWT/UtEJaqqF6Gz4f1Jg5cLBUM0PIkheTq8onN8J2/RiZi2h8e
	RE3F2FNRq/dwlg1b8HFR8vAW+TfvigZkKCHtIvKWTTwyHPB0d4Fj9Q1k1FY89vfD
	FokczKERpeSl9Nnim0sIUDju1VqgrQnQLMw==
X-ME-Sender: <xms:vLkmZNrl6H1Tc7fB5jrm4lqdNJ0LtmefjT3I8b1YIC1q-J49hL-k8Q>
    <xme:vLkmZPrVmRMXZyoH7f__R98oiB3KzRM7vJO7aSdBENIqtz2lkPoEj2_3a10qgIBcZ
    j7xgCDSFxvN4DI0Nuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:vLkmZKMPl5Rso5qEETRCL4RnVxWW2c-ERzdNvmHt718-ajWblUVhLA>
    <xmx:vLkmZI6GhQXD2Sk3buXdUqrEFQBqo80UhkuO9cJ1c4Ws_IjyZGWmCg>
    <xmx:vLkmZM6i6bvzE5I-SHBRUMuxVIohfc2ZGDIbt73gwvR8yNzDOiHPCQ>
    <xmx:vbkmZHo_EqC7oO3WQFk1S3wK_PR5n3PcF5Ga-HLg1Ivau52NgmnVyA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4266AB6008D; Fri, 31 Mar 2023 06:45:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <1c441d20-951d-407b-90ba-4cda3b0505b2@app.fastmail.com>
In-Reply-To:  <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
 <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
Date: Fri, 31 Mar 2023 12:44:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function pointers
 for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_034521_980990_F8F54D49 
X-CRM114-Status: GOOD (  15.22  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMsIGF0IDEyOjM3LCBMYWQsIFByYWJoYWthciB3cm90ZToKPiBP
biBUaHUsIE1hciAzMCwgMjAyMyBhdCAxMDozNOKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4+IEl0IGFsc28gc2VlbXMgd3JvbmcgdG8gaGF2ZSB0aGUgZmFsbGJh
Y2sgYmUgdG8gZG8gbm90aGluZwo+PiB3aGVuIHRoZSBwb2ludGVyIGlzIE5VTEwsIHNpbmNlIHRo
YXQgY2Fubm90IGFjdHVhbGx5IHdvcmsKPj4gd2hlbiBhIGRldmljZSBpcyBub3QgY2FjaGUgY29o
ZXJlbnQuCj4+Cj4gSWYgdGhlIGRldmljZSBpcyBub24gY2FjaGUgY29oZXJlbnQgYW5kIGlmIGl0
IGRvZXNuJ3Qgc3VwcG9ydCBaSUNCT00KPiBJU0EgZXh0ZW5zaW9uIHRoZSBkZXZpY2Ugd29uJ3Qg
d29yayBhbnl3YXkuIFNvIG5vbi1jYWNoZSBjb2hlcmVudAo+IGRldmljZXMgdW50aWwgdGhleSBo
YXZlIHRoZWlyIENNTyBjb25maWcgZW5hYmxlZCB3b24ndCB3b3JrIGFueXdheS4gU28KPiBJIGRp
ZG4ndCBzZWUgYW55IGJlbmVmaXQgaW4gZW5hYmxpbmcgWklDQk9NIGJ5IGRlZmF1bHQuIFBsZWFz
ZSBsZXQgbWUKPiBrbm93IGlmIEkgYW0gbWlzdW5kZXJzdGFuZGluZy4KClR3byB0aGluZ3M6Cgot
IEhhdmluZyBhIGJyb2tlbiBtYWNoaW5lIGNyYXNoIHdpdGggaW4gaW52YWxpZCBpbnN0cnVjdGlv
bgogIGV4Y2VwdGlvbiBpcyBiZXR0ZXIgdGhhbiBoYXZpbmcgaXQgcnVuIGludG8gc2lsZW50IGRh
dGEKICBjb3JydXB0aW9uLgoKLSBhIGNvcnJlY3RseSBwcmVkaWN0ZWQgYnJhbmNoIGlzIHR5cGlj
YWxseSBmYXN0ZXIgdGhhbiBhbgogIGluZGlyZWN0IGZ1bmN0aW9uIGNhbGwsIHNvIHRoZSBmYWxs
YmFjayB0byB6aWNib20gbWFrZXMgdGhlCiAgZXhwZWN0ZWQgKGF0IGxlYXN0IGluIHRoZSBmdXR1
cmUpIGNhc2UgdGhlIGZhc3Qgb25lLgoKPiBAQCAtNDY1LDcgKzQ2Niw2IEBAIGNvbmZpZyBSSVND
Vl9JU0FfWklDQk9NCj4gICAgICAgICBkZXBlbmRzIG9uIE1NVQo+ICAgICAgICAgZGVwZW5kcyBv
biBSSVNDVl9BTFRFUk5BVElWRQo+ICAgICAgICAgZGVmYXVsdCB5Cj4gLSAgICAgICBzZWxlY3Qg
UklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgICBBZGRzIHN1
cHBvcnQgdG8gZHluYW1pY2FsbHkgZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB0aGUgWklDQk9NCj4g
ICAgICAgICAgICBleHRlbnNpb24gKENhY2hlIEJsb2NrIE1hbmFnZW1lbnQgT3BlcmF0aW9ucykg
YW5kIGVuYWJsZSBpdHMKPgo+IEJ1dCB3aGF0IGlmIHRoZSBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUg
dGhlIFpJQ0JPTSBJU0EgZXh0ZW5zaW9uPwoKVGhlbiBpdCBuZWVkcyB0byByZWdpc3RlciBpdHMg
Y2FjaGUgb3BlcmF0aW9ucyBiZWZvcmUgdGhlIGZpcnN0CkRNQSwgd2hpY2ggaXMgc29tZXRoaW5n
IHRoYXQgaXQgc2hvdWxkIGRvIGFueXdheS4gV2l0aCB5b3VyCmN1cnJlbnQgY29kZSwgaXQgbWF5
IHdvcmsgYnkgYWNjaWRlbnQgZGVwZW5kaW5nIG9uIHRoZSBzdGF0ZSBvZgp0aGUgY2FjaGUsIGJ1
dCB3aXRoIHRoZSB2ZXJzaW9uIEkgc3VnZ2VzdGVkLCBpdCB3aWxsIGVpdGhlciB3b3JrCmNvcnJl
Y3RseSBhbGwgdGhlIHRpbWUgb3IgY3Jhc2ggaW4gYW4gb2J2aW91cyB3YXkgd2hlbiBtaXNjb25m
aWd1cmVkLgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
