Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084AAC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK0N//7If3E4Yt6i2bWdWguhR6a/Das8hw1/k3holgM=; b=DWZWK97WX64RPm
	M8XN0C+5mLLaTu+X4kgAXTIHvxiXNykLZ98XjVYYWAlDXAb7uNNOcZ6DG+JiQqYsCFZoA75toDf37
	GXwgtcinvbVj2xd1NAyG+JIMAqXPXG5CHixa54NeVsklCgO/8QiyndfTAPEjdi7KiHCvW9SFSK4u2
	JA66u1xnwoFA0l/7BM2ReYsPxHZx1GZqMeYp/w0PUvz7XEF5tktSTPw7o9tLBcB8esojCW3ncWkjY
	Rp0uDFXqnncDeG9+uG5d28Zmk3mY094l8ErlUOPtLG7VK4bngTYVv1fdTHAz99gb3Zkik0ORMh1OU
	Xc0epHqbdyvD479I5OWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJl08-0000000HBrU-194y;
	Wed, 19 Jun 2024 02:24:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJl05-0000000HBqu-1rJF;
	Wed, 19 Jun 2024 02:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB3D9619FE;
	Wed, 19 Jun 2024 02:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB2BC4AF1D;
	Wed, 19 Jun 2024 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718763879;
	bh=YdTiG/CZB3kW5hJZRirxPSwhHLjUr7Zwx1Rs51gKz1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OvluqBkJzPPPIIgHv9DmTCULgSEsCFZT9e/9wAJkmufU1GmWwfkHPkwQLGl43GwKV
	 C3f4gs+NOOoJGVKBXbcZXqC1HzpCD3KgotUGAvKTQ9umefwIxKlWksRiV4dDV4mlPY
	 SRlhqWB/XOrzZoqeOoeFJxTDuv1ID+QP3cuV2Tg0dpD/1/YNKOPIfmAos0yE7BPXJ5
	 18RyX9IWhRn8BZHlodnqVgcOy3soSjA4ZfYk90hfFJWaiAG9zdXxtekvFWy+qe/IIE
	 61HJR6kXnwFcEigJQIjp/rlUsHwKR8SEcmXyre65taJwys5gIxSSaxRfbMmnbFffSG
	 UrN3xGe8GuMNg==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-363826fbcdeso112709f8f.0;
        Tue, 18 Jun 2024 19:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIOYThII7NxoLPrPMCgvlt7vOEr8uAAcFFWT/Xv6T/ogYnNUzGbUNlRobml5gG/1NNezKf7CDtefKKxSPrYBlKUx8hAsH/Vhlto7UdX3kIq1aZVPFe0bIdXgqKE6/DwUpFdi8Fxyv1PxEla5aciyV9+TEwEpQ=
X-Gm-Message-State: AOJu0YzzOPaRgC8CrpNVOhh4vOwISh8GMoE0PKpxPrNrjyvgEbQY7S80
	xYawUQIq3fgVC2ALebdPkSIrZVtPir/okhraPYCTTuoY0hfVQvhtELDF9Kh9G+T8xwp9Zwb7BZx
	e8F1ieYjwO8X7LMNAKPVrM8TWM5E=
X-Google-Smtp-Source: AGHT+IEQ6lBqSF/SAuTEXT3/C0b8JrIn+1+eVBZa2U4YKfxPYRohzHDTALEnDx9kkLU3Jijf3mBE/Na4m9dHAT/8Vqo=
X-Received: by 2002:a50:c35a:0:b0:57c:4db6:c0fc with SMTP id
 4fb4d7f45d1cf-57d07e7acdbmr508589a12.10.1718763857174; Tue, 18 Jun 2024
 19:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
 <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
 <20240618151820.GA2354@willie-the-truck> <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
In-Reply-To: <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jun 2024 10:24:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6qLrQMVEtGgy7VM_cOh+2HytQEZ-9aZc4Gist-rhNZ0Q@mail.gmail.com>
Message-ID: <CAAhV-H6qLrQMVEtGgy7VM_cOh+2HytQEZ-9aZc4Gist-rhNZ0Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Haibo Xu <xiaobo55x@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_192441_706220_BC6635AC 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOToxOOKAr0FNIEhhaWJvIFh1IDx4aWFvYm81NXhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDI0IGF0IDExOjE44oCvUE0gV2ls
bCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdW4gMTcs
IDIwMjQgYXQgMDk6MzQ6MThQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IEBDYXRhbGlu
IE1hcmluYXMgQEh1YWNhaSBDaGVuCj4gPiA+Cj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgaGF2ZSBh
IGxvb2sgYXQgdGhpcyBwYXRjaCBmb3IgdGhlIEFDUElfTlVNQSBjb25maWcgb24KPiA+ID4gQVJN
NjQgYW5kIExPT05HQVJDSCByZXNwZWN0aXZlbHkuCj4gPiA+Cj4gPiA+IFRoYW5rcyEKPiA+ID4K
PiA+ID4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgNDozN+KAr1BNIEhhaWJvIFh1IDxoYWlibzEu
eHVAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IHg4Ni9hcm02NC9sb29uZ2FyY2gg
d291bGQgc2VsZWN0IEFDUElfTlVNQSBieSBkZWZhdWx0IGFuZCByaXNjdgo+ID4gPiA+IHdvdWxk
IGRvIHRoZSBzYW1lIHRoaW5nLCBzbyBjaGFuZ2UgaXQgdG8gYSBoaWRkZW4gb3B0aW9uIGFuZCB0
aGUKPiA+ID4gPiBzZWxlY3Qgc3RhdGVtZW50cyBleGNlcHQgZm9yIHRoZSBYODZfNjRfQUNQSV9O
VU1BIGNhbiBhbHNvIGdvIGF3YXkuCj4gPiA+ID4KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBTdW5pbCBWIEwg
PHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBY
dSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvYXJtNjQv
S2NvbmZpZyAgICAgICAgfCAxIC0KPiA+ID4gPiAgYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyAgICB8
IDEgLQo+ID4gPiA+ICBkcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnIHwgNSArLS0tLQo+ID4gPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+
IFRoaXMgbG9va3MgZmluZSBmcm9tIGFuIGFybTY0IHBlcnNwZWN0aXZlOgo+ID4KPiA+IEFja2Vk
LWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgpMb29rcyBmaW5lIGZvciBMb29uZ0Fy
Y2g6CgpBY2tlZC1ieTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gPgo+
Cj4gVGhhbmsgeW91LCBXaWxsIQo+Cj4gPiBXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
