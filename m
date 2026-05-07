Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B1CD343F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJiu2KOhHVCkRMHalljoL05KQADDGiTHUAOMvEsEPGM=; b=je8a2IDvFA83VN
	yBNLYcoUhbPTRUCEkPyfj79+3Yvve+4n2HPVa3xAHHyLkQdY63zyJdSY9MUePVJQnJyRh9TghRwr0
	rVvkJdIynpQbx1247P+Nnss/cQ8LnA8jBR/HMt7TaD1E+IxUD5/4SsNF++qmKcVFiPBaOVA7M7eio
	HNzGS8UYipGne130cjkcHcSdFW5TkFZquX7OQvUIXXy9jiuNt5YM/u/AZYYzDHQ8+7njY/V7ukPku
	WGQVaFwLWbldvj+S+FB3Vw7kfh6+4nO/LG+XzVLJuxKjcBgO8MI5ACIU6rw99dqUMfPJOdKCU35Ap
	63BrRplAxvaSXPaaYqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwF0-00000003X66-0KPs;
	Thu, 07 May 2026 10:46:02 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwEy-00000003X4b-0YTj
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:46:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778150742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfLuyOPRCmmDdUHD7nj8FmD30fIBLkwBsUJFvuCmkBQ=;
	b=qPQvdZZ9NGUW5GSrDqiO42DiH/zl3tkl6A1e9fYYs1UYUXWFnjsHBfbC/scvJ2rOxMtX6M
	OU0bhSlvZDm6kNsbvILN5h9ybLDylI6fzaRmXJZBq2/GhPeAxFGOv+TbyRXdS5hXW6KeXn
	4b3UWDEyiFf1sYzQuWFt5cXI513OGmw=
Date: Thu, 07 May 2026 18:45:07 +0800
Message-Id: <DICDTHYTPDSP.210EBVHTQ6966@linux.dev>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD
 card support with UHS modes
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Margherita Milani"
 <margherita.milani@amarulasolutions.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
In-Reply-To: <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_034600_322794_638E146D 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert
 Ou <aou@eecs.berkeley.edu>, Michael
 Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul
 Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1IE1heSA3LCAyMDI2IGF0IDU6NTMgUE0gQ1NULCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4g
SGksCj4KPiBFbCBqdWUsIDcgbWF5IDIwMjYgYSBsYXMgMTA6MjAsIE1hcmdoZXJpdGEgTWlsYW5p
Cj4gKDxtYXJnaGVyaXRhLm1pbGFuaUBhbWFydWxhc29sdXRpb25zLmNvbT4pIGVzY3JpYmnDszoK
Pj4KPj4gR29vZCBtb3JuaW5nIElrZXIsCj4+Cj4+ID4gQWRkIGNvbXBsZXRlIFNEIGNhcmQgY29u
dHJvbGxlciBzdXBwb3J0IHdpdGggVUhTIGhpZ2gtc3BlZWQgbW9kZXMuCj4+ID4KPj4gPiAtIEVu
YWJsZSBzZGhjaTAgY29udHJvbGxlciB3aXRoIDQtYml0IGJ1cyB3aWR0aAo+PiA+IC0gQ29uZmln
dXJlIGNhcmQgZGV0ZWN0IEdQSU8gd2l0aCBpbnZlcnNpb24KPj4gPiAtIENvbm5lY3Qgdm1tYy1z
dXBwbHkgdG8gYnVjazQgZm9yIDMuM1YgY2FyZCBwb3dlcgo+PiA+IC0gQ29ubmVjdCB2cW1tYy1z
dXBwbHkgdG8gYWxkbzEgZm9yIDEuOFYvMy4zViBJL08gc3dpdGNoaW5nCj4+ID4gLSBBZGQgZHVh
bCBwaW5jdHJsIHN0YXRlcyBmb3Igdm9sdGFnZS1kZXBlbmRlbnQgcGluIGNvbmZpZ3VyYXRpb24K
Pj4gPiAtIFN1cHBvcnQgVUhTLUkgU0RSMjUsIFNEUjUwLCBhbmQgU0RSMTA0IG1vZGVzCj4+Cj4+
Cj4+IFRlc3RlZC1ieTogTWFyZ2hlcml0YSBNaWxhbmkgPG1hcmdoZXJpdGEubWlsYW5pQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPgo+Pgo+PiBIb3dldmVyIEkgbm90aWNlZCBpdCBvbmx5IHdvcmtzIHdo
ZW4gQ09ORklHX0kyQ19LMSBpcyBlbmFibGVkLgo+PiBNaWNoYWVsIE9wZGVuYWNrZXIgdG9sZCBt
ZSBpdCdzIG5lY2Vzc2FyeSB0byBlbmFibGUgdGhlIHJlZ3VsYXRvcnMKPj4gdXNlZCBieSB0aGUg
bW1jIGNvbnRyb2xsZXIuCj4+IFNob3VsZCB3ZSBhZGQgdGhlIGRlcGVuZGVuY3kgYmV0d2VlbiBD
T05GSUdfTU1DX1NESENJX09GX0sxIGFuZAo+PiBDT05GSUdfSTJDX0sxPyAoVW5sZXNzIHNvbWUg
Ym9hcmRzIGRvbid0IGhhdmUgdGhlc2UgZGVwZW5kZW5jeT8pCj4+IFRoYW5rIHlvdSBmb3IgeW91
ciBwYXRjaHNldCB3aGljaCB3YXMgcmVhbGx5IG5pY2UhCj4KPiBUaGFuayB5b3UgZm9yIGNhdGNo
aW5nIHRoaXMhIFlvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0IGFib3V0IHRoZSBkZXBlbmRlbmN5Lgo+
Cj4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgYWxsIGN1cnJlbnQgU3BhY2VtaVQgSzEgYm9hcmRzIGZv
bGxvdyB0aGlzIGRlc2lnbgo+IHBhdHRlcm4gd2hlcmUgdGhlIFNEIGNhcmQgcG93ZXIgaXMgcHJv
dmlkZWQgYnkgYW4gSTJDLWNvbnRyb2xsZWQgUE1JQy4KPiBIb3dldmVyLCBiZWZvcmUgYWRkaW5n
IGEgaGFyZCBkZXBlbmRlbmN5LCBJJ2QgbGlrZSB0byBnZXQgaW5wdXQgZnJvbQo+IHRoZSBjb21t
dW5pdHksIGRvZXMgYW55b25lIGtub3cgb2YgSzEtYmFzZWQgYm9hcmRzIHRoYXQgcHJvdmlkZSBT
RAo+IGNhcmQgcG93ZXIgdGhyb3VnaCBmaXhlZCByZWd1bGF0b3JzIG9yIG90aGVyIG1lYW5zIHRo
YXQgZG9uJ3QgcmVxdWlyZQo+IEkyQz8KaWYgSzEgbmVlZHMgdG8gc3dpdGNoIGJldHdlZW4gc3Rh
bmRhcmQgYW5kIGhpZ2gtc3BlZWQgKFVIUykgbW9kZXMsCkkgYmVsaWV2ZSB0aGUgSTJDLWNvbnRy
b2xsZWQgUE1JQyBpcyBtYW5kYXRvcnkgdG8gaGFuZGxlIHRoZSB2b2x0YWdlCnN3aXRjaGluZyAo
dHlwaWNhbGx5IDMuM1YgdG8gMS44VikuCgpJIGRvbid0IHRoaW5rIGFueSBib2FyZCB3b3VsZCB3
YW50IHRvIGJlIHN0dWNrIGluIHN0YW5kYXJkIG1vZGUgcGVybWFuZW50bHkuCklmIGhpZ2gtc3Bl
ZWQgbW9kZSBpcyBhbiBvcHRpb24sIHdoeSBub3QgdXNlIGl0PyBJIHRoaW5rIGFkZGluZyB0aGlz
CmRlcGVuZGVuY3kgaXMgYSBnb29kIGlkZWEsIGJ1dCBrZWVwIGluIG1pbmQgaXQgYWxzbyBuZWVk
cyB0byBkZXBlbmQgb24gUDEuCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
