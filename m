Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FD2C5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yELjoCdEhaCzrCc0GBaHxtFwGS2zySuzilqYADl2FYE=; b=0oqnVXLWs8blNK
	I3jbKSVvgo0W4MmY4VmrDkKqjK0qaL6dk0ljR/bo6XTtRazUMTczp2r7aFl5OeNjPqBBNCobbrLkt
	kxdHWW8FX8kxlhG6I3PZE/RZ34py3N2g1OwZhpEnZ2klE0rVKaB3817KJ21TbRauYxf+pNclIa7sY
	JKSmJ8yej94kuXyzO3Poq5AToAJXqlOiyhUvIeKXX1uQOqgXLP/9y2XHJFMf6btUVOxdsjX1s4WEF
	xtH5q2xmg8P/FjqZc0n/fdDGTy4hK1tlSpKJJiurdEVeNNwEHCH+N7XOpar8Gyf2TsB7xn1AeFq0G
	G/SZf6dLEiEh3zMcYM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0TQ-0000000COGU-3lSw;
	Tue, 27 Aug 2024 17:59:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0RI-0000000CNqR-1t7g;
	Tue, 27 Aug 2024 17:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 221D5CE13D0;
	Tue, 27 Aug 2024 17:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828D0C58121;
	Tue, 27 Aug 2024 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724781424;
	bh=OptW6RUfILHvbgx1GROy+YCtAO9VnTyYH8If/uUZl9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r7WCloVoYuM9ww7zwA6zTDGNcuy2DT8wtpbwHYllBDwTb6TZBn9p4VtQAlU6UTzBX
	 dW898KLVdBEgG2AVYmb7Er91/fY4QbZkovmDakzhgCmpfUV3YP3xabc2nu2Ow9gDUq
	 g3VaoXbrMKfi0haM9wwvX/8halYF+J/nHZL1qIL6CNYqajCWG4YeSJZP4wztnKjrhr
	 M94cDGWhNfq6VHdxaKrQPZLz3zxij104USu/epHOJfPf5u8IDq3GL4j7VTlSc6bZ4x
	 sVb/xh5HBqToIzLyzloDJbL3bVF/tJ+6b2VL8yZZ4Y1xtCxkN4dNv8qEKxT2fU5Hbp
	 Zkr3kPcF/m4rA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-273cf2dbf7dso3863853fac.1;
        Tue, 27 Aug 2024 10:57:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnzKqqPRUHi6X4PLbsGGJEcruszIh5a6P+lRi3Z5PZKEGVX7W1L/Qo+NBj4SWnR2ZXXOZ2P8jOjMEmIJ4=@lists.infradead.org, AJvYcCXCsnePw4o1atdgPo7bpM2TIj84CHVH0N9G5K+bAgwHfe5g8DIGdzn3wJOP1nBTUWS5NJthwrmkiggojR5co0Tr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp1VH2qXJIpMPcVgtHnRIvSyvIcSXwGstBOTkvUghYUeuUoifq
	sp8eCq07YcyC8HD4PAp9Vb+W0CDuyKsriacKlO/nBdnuSeJ2j9M503b39Ra29mAA2Iz5OpOxwC2
	8VRk2eii5hbyjPSodMwjLnueB28U=
X-Google-Smtp-Source: AGHT+IFu6T80cIoH2IuG57YoKLSfrmXhE5E+Qf/cSlYkLOAMDpJFXXRx8jvbWvu1aUtvkEAiMaN8kHOwbvIrkBuQYBM=
X-Received: by 2002:a05:6870:b252:b0:270:6ec0:c00 with SMTP id
 586e51a60fabf-273e64b5c7dmr15986972fac.12.1724781423743; Tue, 27 Aug 2024
 10:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx> <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop> <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx> <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
 <Zs4HCZH3M9nRXUvu@sunil-laptop> <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
 <Zs4NcmM79kMUc7Ol@sunil-laptop>
In-Reply-To: <Zs4NcmM79kMUc7Ol@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Aug 2024 19:56:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hRWxNSrx9XPBdsU-mQpDurRJAUmzHtHNkyCTf0Hz1TgQ@mail.gmail.com>
Message-ID: <CAJZ5v0hRWxNSrx9XPBdsU-mQpDurRJAUmzHtHNkyCTf0Hz1TgQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Robert Moore <robert.moore@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_105708_859389_B494BF98 
X-CRM114-Status: GOOD (  22.27  )
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgNzozMeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDI3LCAyMDI0IGF0IDA3OjEyOjEx
UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjcsIDIw
MjQgYXQgNzowNOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMDY6MjA6MjRQTSArMDIwMCwg
UmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQg
MTE6MjLigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBBdWcgMjYgMjAyNCBhdCAxOToyNywgUmFmYWVsIEou
IFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDc6MjLi
gK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
PiA+PiBUaGVyZSB3aWxsIGJlIGEgY29uZmxpY3QgaW4gUExJQyBpcnFjaGlwIGRyaXZlciBkdWUg
dG8gYSByZWNlbnQgcGF0Y2ggWzFdLgo+ID4gPiA+ID4gPj4gVGhpcyBwYXRjaCBpcyBub3QgaW4g
bGF0ZXN0IFJDNSByZWxlYXNlIGJ1dCBpbiBsaW51eC1uZXh0LiBJIHVzdWFsbHkgYmFzZSB0aGUK
PiA+ID4gPiA+ID4+IHNlcmllcyBvbiBsYXRlc3QgUkMgcmVsZWFzZS4gU2hvdWxkIEkgcmViYXNl
IHRvIGxpbnV4LW5leHQgaW4gdGhpcyBjYXNlCj4gPiA+ID4gPiA+PiBhbmQgc2VuZCB0aGUgbmV4
dCByZXZpc2lvbiBvZiB0aGUgc2VyaWVzIHJlc29sdmluZyB0aGUgY29uZmxpY3Q/Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IE5vLCBwbGVhc2UgZG9uJ3QuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFRoYXQgd2lsbCBiZSByZXNvbHZlZCBhdCB0aGUgbWVyZ2UgdGltZS4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gcHVsbAo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IGly
cS11cmdlbnQtMjAyNC0wOC0yNQo+ID4gPiA+ID4KPiA+ID4gPiA+IHdoaWNoIEknbSBhYm91dCB0
byBzZW5kIHRvIExpbnVzIGxhdGVzdCB0b21vcnJvdyBtb3JuaW5nLiBUaGF0IGNvbnRhaW5zCj4g
PiA+ID4gPiB0aGUgY29uZmxpY3RpbmcgY2hhbmdlLgo+ID4gPiA+Cj4gPiA+ID4gU28gSSd2ZSBh
cHBsaWVkIHRoZSBzZXJpZXMgb24gdG9wIG9mIHRoZSBhYm92ZS4KPiA+ID4gPgo+ID4gPiBUaGFu
a3MhCj4gPiA+Cj4gPiA+ID4gVGhpcyBpbmNsdWRlZCBhIGZ1bGwtc3dpbmcgcmViYXNlIG9mIHRo
ZSBsYXN0IHBhdGNoLCB3aGljaCBJIGhvcGUgSSd2ZQo+ID4gPiA+IGRvbmUgY29ycmVjdGx5LCBi
dXQgU3VuaWwgcGxlYXNlIHNlZQo+ID4gPiA+Cj4gPiA+IFllYWgsIHNvcnJ5IGFib3V0IHRoYXQu
IFlvdSBoYXZlIHJlc29sdmVkIG1vc3Qgb2YgdGhlIGNvbmZsaWN0cyBidXQgZmV3Cj4gPiA+IGFy
ZSBtaXNzaW5nICh3aGljaCB3ZXJlIG5vdCBvYnZpb3VzIGFueXdheSkuIENvdWxkIHlvdSBwbGVh
c2UgdGFrZSBiZWxvdwo+ID4gPiBjb21taXQgYW5kIHNxdWFzaD8KPiA+ID4KPiA+ID4gaHR0cHM6
Ly9naXRodWIuY29tL3Zsc3VuaWwvbGludXgvY29tbWl0L2M4NWY5ZDBkYzMxYzBlNzc5MTZlY2Ri
YjQ1Nzc0OGMwNWNmNGU3NWEKPiA+Cj4gPiBDYW4geW91IHBsZWFzZSBzZW5kIG1lIGEgZGlmZj8K
PiA+Cj4gSGkgUmFmYWVsLAo+Cj4gSSBoYXZlIHNlbnQgdGhlIGRpZmYgdG8geW91LiBIb3BlIHRo
YXQgaXMgZmluZS4KClNxdWFzaGVkIGFuZCBwdXNoZWQgb3V0LCBwbGVhc2Ugc2VlCgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yYWZhZWwvbGludXgtcG0u
Z2l0L2NvbW1pdC8/aD1ibGVlZGluZy1lZGdlJmlkPTkxNTNmZGFlMzA4NjdmZTVkNzFmNmExNWI4
YTE5NzRkN2U4MDFmMzkKClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
