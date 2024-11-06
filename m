Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F46D29F9D
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMmy5DDiW25ZL+v24KjRWnSfbJGFcdcjcQTCDYWeOyQ=; b=wHecbFqIB19Cxl
	EW0R572Xx1jC9wKwi6Act8Zpl0+GYAOnHLQ67MV1947Ww/yWVAYH8E3UjyiAqCf+0dtNTBLV7oKOU
	mqWygojJCOzY1psBRevrztP3wviGu5dPIk66Nz4+GxXYUa/G/llJil91uuPgh9DHtuOQRRkC7DkJ5
	wGE0ZnJfXsfAgRavLckgZJ+JGEkdQsVIaXzCzJ/szoQM4ZtqkicfkuGFpixMdNxGl3ab4eEysP/Sw
	sGXSWF2B0KwHeBMh0C/QFQIVxWQC45LALVHbXRGlvSaCLyEZEQJhNwlIfgYKY83Y16dV/+R1LJ8Xo
	HkV/5RHEeil1y2Ix/YTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aAa-000000024Vb-0dF3;
	Wed, 06 Nov 2024 07:09:36 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a7x-00000002484-3xvZ;
	Wed, 06 Nov 2024 07:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730876806;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h80rEgtJ7qD9jyDyLJcISbRk3INZH8ZPcYosK4VrHHZVogREXxmMdnucgdz5uGIVq
	 2FKIvnwHaCmTCM5h2wCPV5BHvVPqGtTkGb8EMAQ3QpqRcFOIuuN9J+N+f2mo7sMJe/
	 dU4VVqU+Z1FcyNgWJiu6rzNqueMfO3e6FKKNop6UZT1IVzPlW79wIw8rl8ikKnhRpJ
	 +n1/bbdRaP9EQPbjeaxIqHG5JuYMBpoWql3abi4yDgJ1tGm3FhgLFRk5m7yklMr2OW
	 JsGlZDD1354L3XGFFlQ4dOrEE1hpvtyE9IKa50nyhPWS+nOpSyzlxB/+3KkxmrZtK5
	 AOEEtdbWDj8jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xjx8D1mmSz4x11;
	Wed,  6 Nov 2024 18:06:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner
 <tglx@linutronix.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx> <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Wed, 06 Nov 2024 18:06:35 +1100
Message-ID: <877c9glu2s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_230654_789542_DC0D0D94 
X-CRM114-Status: GOOD (  13.01  )
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

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMzAvMTAvMjAyNCDDoCAxMjozOSwgVGhvbWFzIEdsZWl4bmVyIGEgw6ljcml0wqA6Cj4+IEZv
bGtzIQo+PiAKPj4gT24gVGh1LCBPY3QgMTAgMjAyNCBhdCAwOTowMSwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4+PiBIaXN0b3JpY2FsbHkgZWFjaCBhcmNoaXRlY3R1cmUgZGVmaW5lZCB0aGVp
ciBvd24gZGF0YXBhZ2UgdG8gc3RvcmUgdGhlCj4+PiBWRFNPIGRhdGEuIFRoaXMgc3RhbmRzIGlu
IGNvbnRyYXN0IHRvIHRoZSBnZW5lcmljIG5hdHVyZSBvZiB0aGUgVkRTTwo+Pj4gY29kZSBpdHNl
bGYuCj4+PiBXZSBwbGFuIHRvIGludHJvZHVjZSBhIGdlbmVyaWMgZnJhbWV3b3JrIGZvciB0aGUg
bWFuYWdlbWVudCBvZiB0aGUgVkRTTwo+Pj4gZGF0YSBzdG9yYWdlIHRoYXQgY2FuIGJlIHVzZWQg
YnkgYWxsIGFyY2hpdGVjdHVyZXMgYW5kIHdoaWNoIHdvcmtzCj4+PiB0b2dldGhlciB3aXRoIHRo
ZSBleGlzdGluZyBnZW5lcmljIFZEU08gY29kZS4KPj4+Cj4+PiBCZWZvcmUgdGhhdCBpcyBwb3Nz
aWJsZSBhbGlnbiB0aGUgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgYnkKPj4+IHN0YW5kYXJkaXpp
bmcgb24gdGhlIGV4aXN0aW5nIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1cmUgYW5kIG1vdmluZyB0aGlu
Z3MKPj4+IG91dCBvZiB0aGUgVkRTTyBkYXRhIHBhZ2Ugd2hpY2ggZG9lcyBub3QgYmVsb25nIHRo
ZXJlLgo+Pj4KPj4+IFBhdGNoZXMJIDEtIDI6CWNza3kKPj4+IFBhdGNoCSAgICAzOglzMzkwCj4+
PiBQYXRjaGVzCSA0LSA1Oglhcm02NAo+Pj4gUGF0Y2gJICAgIDY6CXJpc2N2Cj4+PiBQYXRjaAkg
ICAgNzoJYXJtCj4+PiBQYXRjaAkgICAgODoJTG9vbmdBcmNoCj4+PiBQYXRjaAkgICAgOToJTUlQ
Uwo+Pj4gUGF0Y2hlcyAxMC0yMDoJeDg2Cj4+PiBQYXRjaGVzIDIxLTI3Oglwb3dlcnBjCj4+PiBQ
YXRjaCAgICAgIDI4OiAJUmVuYW1pbmdzIHRvIGF2b2lkIGEgbmFtZSBjbGFzaCB3aXRoIHRoZSBu
ZXcgY29kZS4KPj4gCj4+IEFzIHRoaXMgaGFzIGJlZW4gc2l0dGluZyBmb3IgdHdvIHdlZWtzIG5v
dyB3aXRob3V0IG1ham9yIGNvbW1lbnRzLCBJJ20KPj4gcGxhbm5pbmcgdG8gbWVyZ2UgdGhhdCB0
aHJvdWdoIHRoZSB0aXAgdHJlZSB0b21vcnJvdy4KPgo+IFRvIGF2b2lkIGFueSBmdXR1cmUgY29u
ZmxpY3RzIHdpdGggcG93ZXJwYyB0cmVlLCBJIHN1Z2dlc3QgeW91IG1lcmdlIAo+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bvd2VycGMvbGludXguZ2l0
IAo+IHRvcGljL3Zkc28gaW50byB5b3VyIHRyZWUgYmVmb3JlIGFwcGx5aW5nIHRoaXMgc2VyaWVz
LgoKSSB0aG91Z2h0IHRoZSBzYW1lLCBidXQgdGhlcmUgYWN0dWFsbHkgaXNuJ3QgYW55IGNvbmZs
aWN0IGF0IHRoZSBtb21lbnQKYmV0d2VlbiB0aGUgdHdvIHRyZWVzLgoKU29tZSBvZiBUaG9tYXMg
VydzIGxhdGVyIGNoYW5nZXMgdG8gY29udmVydCBhcmNoZXMgdG8gZ2VuZXJpYyBWRFNPCnN0b3Jh
Z2UgZG8gY29uZmxpY3QsIGJ1dCB0aGV5IGxvb2sgdG8gYmUgZGVzdGluZWQgZm9yIHRoZSBuZXh0
IG1lcmdlCndpbmRvdy4KCmNoZWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
