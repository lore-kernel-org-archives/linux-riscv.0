Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C33C54731
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNz/umsetMEi+EvN+7/7kVdIAzyYrP6Pq0EEy+54o3M=; b=U6LvOaOAvnuCrP
	jELmBANEBT6wSuh/3SIvXeAJiNlxpjGGRknYEIYlCOjtE9aPZ+kkCpd0hnCKGR4RE8wec94C4e5Xm
	NYod/LYYc+KbViqwigtdHDoOVEoZ+Rfp4r/LjEqFoFwaMz4PXldx4stoZG9E8UbmerkZVWnbd7DqV
	FLWOfzFiwym1QsDGvrEHp7mxoTjhHmsaABCnmrWBuUZQXuapEHttw7qMwO5eOY8nWc+BuPBoJI/Vy
	3UXAJNeRVF74ykfCnYjjIkB6OqW2CCoGtkehoO/Wqk9wlHPsJGQN+W32oid19PWXgauOkbWytwLZ6
	LjBJe3LFr4bA+rL9xxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidX1-00000008Dm6-1gaj;
	Mon, 26 Aug 2024 17:29:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidUq-00000008D1h-1iw6;
	Mon, 26 Aug 2024 17:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3C53A4070C;
	Mon, 26 Aug 2024 17:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E78C8B7B2;
	Mon, 26 Aug 2024 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724693235;
	bh=jluxAjnMBBxT+jQgOmGR1cISEr6+r0Kq9+uePRXDtFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PftyNCxiSU2HF5iiBVaKfqyEe8S2fKNNfyDnw6oUAc7LXmQnm7Hzx445+EntqyX3t
	 EQMcqffBS5DINl0pTYcZH36sw4sreDcI9aVYi8NqlvNbEk5uOGlaTBG5/geQVSivWK
	 x24+x70CO2As1ilLABouXQKMpMGUxTYCts+SxrOXgC2iQICfGn9IPSVxHlXMgWIQnA
	 mGUnfzaTRSCFo4EhdiGN9qbI2SGNERRaXHq2lhPQ/wlV304VFxG0MF7nfsupg68Whp
	 //zW01isTa6Q2t/rrofytD/uUprqXGOfAPm8Kh8huPiRScv+c9Jps1qsa1mhV9Z4Bo
	 ruLJQkvGNTGOw==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70df4b5cdd8so3697641a34.1;
        Mon, 26 Aug 2024 10:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUspx36l5r6JNZqT/QHYKzgSAp+PqHpkbO8F/L4G+WSQ94TiRFxdSrEOyCAFY19VNlWpLZC/7uVi59moEOrkTMj@lists.infradead.org, AJvYcCWdmEal+EENj/rUNt/sIYZRAb79ng3WvP6AO5yEm9k2tNtr3k9Kg41+dnYTjScZcrS1bxBNGQoqRUjKAR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeMFUsWF5IMpMhQoufClTAPPqcJHA5Jjv4MzqJ6aHYyhgZvotd
	ZnGtCi1fn9TeD1s+SwYrInFc1uiuhCNz2K/kSnGqvUp4yO5pONe9K77mQFvF9LnxvqQX8gsnBfx
	yShj/bBuSBW8JNXJrTX36dXf2nho=
X-Google-Smtp-Source: AGHT+IGabP5rUQeDMaKstGBTtOtjVR0sHISWc8glBPAEMT0KYqPbrLLqofcN1Sv1vQiJRcY5fD1HAp0JPlQiNF5N92o=
X-Received: by 2002:a05:6870:1592:b0:261:7af:719c with SMTP id
 586e51a60fabf-2775a03604bmr460351fac.35.1724693234145; Mon, 26 Aug 2024
 10:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx> <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop>
In-Reply-To: <Zsy3o_N8hvc6GfTp@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Aug 2024 19:27:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
Message-ID: <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240826_102716_601361_09D21507 
X-CRM114-Status: GOOD (  23.54  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNzoyMuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDA2OjE1OjE4
UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMjYsIDIw
MjQgYXQgNToyNeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBBdWcgMTIgMjAyNCBhdCAwNjozNywgU3VuaWwgVi4gTC4g
d3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDY6Mjk6MTJBTSArMDUzMCwg
U3VuaWwgViBMIHdyb3RlOgo+ID4gPiA+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRo
ZSBiZWxvdyBFQ1IgYXBwcm92ZWQgYnkgQVNXRy4KPiA+ID4gPj4gMSkgTUFEVCAtIGh0dHBzOi8v
ZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMW9NR1B5T0Q1OEphUGdNbDFwS2FzVC1WS3NJS2lhN3pS
L3ZpZXc/dXNwPXNoYXJpbmcKPiA+ID4gPj4KPiA+ID4gPj4gVGhlIHNlcmllcyBwcmltYXJpbHkg
ZW5hYmxlcyBpcnFjaGlwIGRyaXZlcnMgZm9yIFJJU0MtViBBQ1BJIGJhc2VkCj4gPiA+ID4+IHBs
YXRmb3Jtcy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBzcGVudCBxdWl0ZSBhIGJp
dCBvZiB0aW1lIG5vdyBvbiB0aGUgbGlzdC4gQXMgeW91IGFyZQo+ID4gPiA+IGF3YXJlLCBmZXcg
Y2xhcmlmaWNhdGlvbnMgbGlrZSBfUElDIGNvZGVzIGFyZSBhbHNvIGRvbmUgbm93LiBUaGVyZSBp
cwo+ID4gPiA+IG5vIG1ham9yIGNoYW5nZSBhZnRlciB5b3UgaGFkIGFncmVlZCBmb3IgdGhlIGRl
c2lnbi4gU28sIGNhbiB0aGlzIGJlCj4gPiA+ID4gY29uc2lkZXJlZCBmb3IgdGhlIG5leHQgcmVs
ZWFzZSBwbGVhc2U/Cj4gPiA+Cj4gPiA+IFJhZmFlbCwgaWYgeW91IHdhbnQgdG8gdGFrZSBpdCB0
aHJvdWdoIHRoZSBBQ1BJIHRyZWUsIHRoZW4gZm9yIHRoZQo+ID4gPiBpcnFjaGlwIHBhcnRzIHBs
ZWFzZSBhZGQ6Cj4gPiA+Cj4gPiA+ICAgQWNrZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgo+ID4KPiA+IFllcywgSSdtIGdvaW5nIHJvIGRvIHRoaXMuCj4gPgo+ID4g
VGhhbmsgeW91IQo+IFRoYW5rcyEKPgo+IFRoZXJlIHdpbGwgYmUgYSBjb25mbGljdCBpbiBQTElD
IGlycWNoaXAgZHJpdmVyIGR1ZSB0byBhIHJlY2VudCBwYXRjaCBbMV0uCj4gVGhpcyBwYXRjaCBp
cyBub3QgaW4gbGF0ZXN0IFJDNSByZWxlYXNlIGJ1dCBpbiBsaW51eC1uZXh0LiBJIHVzdWFsbHkg
YmFzZSB0aGUKPiBzZXJpZXMgb24gbGF0ZXN0IFJDIHJlbGVhc2UuIFNob3VsZCBJIHJlYmFzZSB0
byBsaW51eC1uZXh0IGluIHRoaXMgY2FzZQo+IGFuZCBzZW5kIHRoZSBuZXh0IHJldmlzaW9uIG9m
IHRoZSBzZXJpZXMgcmVzb2x2aW5nIHRoZSBjb25mbGljdD8KCk5vLCBwbGVhc2UgZG9uJ3QuCgpU
aGF0IHdpbGwgYmUgcmVzb2x2ZWQgYXQgdGhlIG1lcmdlIHRpbWUuCgo+IFsxXSAtIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5n
aXQvY29tbWl0Lz9pZD00ZDkzNmYxMGZmODAyNzQ4NDE1MzdhMjZkMWZiZmU5OTg0ZGUwZWY5CgpU
aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
