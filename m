Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF9FD46BFC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTCtX7vkGzlFOmNfSHjJmMkuSDdJtKijdULUdO2/NKA=; b=0vBH/qvVqRgAZ/
	ziAqnZ1KimntpNUBw+ugav0V5Q+m969ZTSo2O3WwYKEAqFquRGfnhFUtq/iiV3huuIOTwYShZJqZu
	QbpN4IbX8CRcgWeUCPRfY29zzEPGCgG4rbhNS1gZkZ5NasWRfbXKR6QYsAVbU21Vw9N3n+sTMibUJ
	rud/pYytgzFBglodwN9sl79z5epaBMAe8e61HgCHLx8ctY/bXIRX20NSdR/x+Z+ewSqxd2snCNHTC
	40yztBj+PvhltWLpeDE4oi6JyvmQF3C2JL9oaJvtJ3yw4HBglv2amsXIbsFTXgKu/1cWkdMocx8y4
	6+Tchjz7dhFkmlN0KfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCVA-0000000Gnqa-2jrd;
	Wed, 28 Jan 2026 20:51:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCV4-0000000Gnpe-1tI1
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF8F460137
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A662CC2BC86
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769633453;
	bh=ksVa7i053Gqvf5wbPc/HrTEHP7zm0EUFO3JlMtMt06k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=msfm9JudaB4iljw/Je2k9+mMvyqev+mms7mUQ9Mq/OD4Ti/EobONMorms0WSdJ3mj
	 2thOa60VmGPUkABxlF1ZfpktHn6LniqsC+jXKfQo6gL1tX7bxNmmeWaCS+mrn7O67P
	 7PNG+FYO8Yy8r029/3DXWY0XVaw1BEr/zqk2ckSRpSbPSRcjVHoKcYKP7QudDV7aS7
	 /jwjh9rE9i1KBtutV46RLOnZk7sipUCaHPIEdcAhBVpLAEHRnLzq22izCg7GaCcMSX
	 tiSpxjP+vCWRBnQMLNRuxC2SL6zsc0+k3vKImVA54zmuiLTM7CV5+LjfT+jgG76IQF
	 AYg1k5aBjOVpg==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so115114fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 12:50:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwn7Hp7dh7ie6h8LHbl0/0J711iapKF5MKfDg1vVGi20VQrakA1oDaX8rF8XKadrQvrquzfvXZB9QoeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+lEH+0xBdUL1z2jh+mLpCSAIc2cUySse68RANVtz/hBJRwsvT
	ucVtnkd5G2Jzmx7jDo1yVHg28vz+60ebm4TjoBp/O/hJJnsLHvlDk9abhLoi0kZitC+sIJmWKsU
	DRWzvRTK8/AoXM28s0/8NyF6Bmnupslw=
X-Received: by 2002:a4a:e7d2:0:b0:662:f764:9050 with SMTP id
 006d021491bc7-662f76491cbmr2156938eaf.41.1769633452515; Wed, 28 Jan 2026
 12:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org> <CAJZ5v0iSZ6qvhUWHtrWuO5XBviMcLUMfRB_hWn-FxAhe=LoA-Q@mail.gmail.com>
 <aXp1HexsqZst1xXu@x1>
In-Reply-To: <aXp1HexsqZst1xXu@x1>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 28 Jan 2026 21:50:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gZaijBJBT24ZZkXPpqggkbXHqVB2u-MOaNJ7X0Ls08pA@mail.gmail.com>
X-Gm-Features: AZwV_Qig52UoHvD8XkTqFmnO9_rJtBsUhA_OiCKW2V4vwWKvPytXGv8uGMe7cv4
Message-ID: <CAJZ5v0gZaijBJBT24ZZkXPpqggkbXHqVB2u-MOaNJ7X0Ls08pA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 14/17] include: acpi: actbl2: Add structs for RQSC table
To: Drew Fustini <fustini@kernel.org>
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgOTo0NOKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDI4LCAyMDI2IGF0IDA5OjMxOjE2UE0g
KzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gMjgsIDIwMjYg
YXQgOToyOOKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4gQWRkIHN0cnVjdHMgZm9yIHRoZSBSUVNDIHRhYmxlIHdoaWNoIGRlc2NyaWJlcyB0
aGUgcHJvcGVydGllcyBvZiB0aGUKPiA+ID4gUklTQy1WIFFvUyBjb250cm9sbGVycyAoQ0JRUkkp
IGluIHRoZSBzeXN0ZW0uIFRoZSB0YWJsZSBhbHNvIGRlc2NyaWJlcwo+ID4gPiB0aGUgdG9wb2xv
Z2ljYWwgYXJyYW5nZW1lbnQgb2YgdGhlIFFvUyBjb250cm9sbGVycyBhbmQgcmVzb3VyY2VzIGlu
IHRoZQo+ID4gPiBzeXN0ZW0uIFRoZSB0b3BvbG9neSBpcyBleHByZXNzZWQgaW4gdGVybXMgb2Yg
dGhlIGxvY2F0aW9uIG9mIHRoZQo+ID4gPiByZXNvdXJjZXMgd2l0aGluIHRoZSBzeXN0ZW0gYW5k
IHRoZSByZWxhdGlvbiBiZXR3ZWVuIHRoZSBRb1MgQ29udHJvbGxlcgo+ID4gPiBhbmQgdGhlIHJl
c291cmNlIGl0IG1hbmFnZXMuCj4gPiA+Cj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LWNicXJpL3JlbGVhc2VzL3RhZy92MS4wCj4gPiA+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJxc2MvYmxvYi9tYWluL3NyYy9j
aGFwdGVyMi5hZG9jCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPgo+ID4KPiA+IE9mIGNvdXJzZSwgdGhpcyBjaGFuZ2UgbmVlZHMgdG8gZ28gdGhy
b3VnaCB1cHN0cmVhbSBBQ1BJQ0EuCj4KPiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0
LiBJJ3ZlIG5vdCB3b3JrZWQgd2l0aCBBQ1BJIHByaW9yIHRvCj4gZGVhbGluZyB3aXRoIHRoZSBS
UVNDIHRhYmxlLgo+Cj4gSXMgdGhlIHB1bGwgcmVxdWVzdCBmb3IgUklTQy1WIFJJTVQgYSBnb29k
IGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoYXQ/Cj4gaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9h
Y3BpY2EvcHVsbC8xMDAzCgpJIHRoaW5rIHNvLgoKWW91IG1heSBhbHNvIGhhdmUgYSBsb29rIGF0
CkRvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9hY3BpL2xpbnV4aXplZC1hY3BpY2EucnN0IChzb3Jy
eSBmb3IgdGhlCmNvdW50ZXItaW50dWl0aXZlIGxvY2F0aW9uKS4KCkFzIGEgZ2VuZXJhbCBydWxl
LCBMaW51eCBwYXRjaGVzIHRoYXQgY2hhbmdlIHRoZSBBQ1BJQ0EgY29kZSBuZWVkIHRvCmJlIGF1
dG8tZ2VuZXJhdGVkIGZyb20gdGhlIGNvcnJlc3BvbmRpbmcgdXBzdHJlYW0gQUNQSUNBIGNvbW1p
dHMgKGFuZAp3aGVuIHlvdSBkbyBzbywgcGxlYXNlIGFkZCBhIExpbms6IHRhZyBwb2ludGluZyB0
byB0aGUgc291cmNlIEFDUElDQQpjb21taXQgdG8gdGhlIExpbnV4IHBhdGNoKS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
