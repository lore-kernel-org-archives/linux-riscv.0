Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF4CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8nNNnRxxYoNK55Efclobl1KCAWYm0aw/y/tYmD83WY=; b=ueneWQ92lFYPYq
	xV6MN45iHIQsDWwrSqrjDahBg3fTmKkeIY1PV7LmiJ8fgvtWPxswPPjUGvJRsjyHhpv0GYwybdZLQ
	VvozRCwdAVGiEIuYBN0bfg7KeT6R1TVOGfHY9KkCjWk3lTLuxC4yGuhO9KG9wvBBGE0dtYoEn5OnV
	Fa5XeWbDfS145oME6ZEdmvT0HfCz1c1+Ky79hPDd1lOjrNHdv8QKcWs5pyZB33NkoKMVkSO8yKO1i
	NeUMT5+fBeDjSk9+V9PPmLdlNSGHIzC/tmM/N5PkD5SzL9B0W90I25PHO6JnIMu19aKsnRyqniYjh
	sDCY9ovmpNVhPoZtbv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4D3M-00000009kXR-1bfS;
	Thu, 02 Oct 2025 06:44:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4D3K-00000009kXC-3jSu
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E957F61E36;
	Thu,  2 Oct 2025 06:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B2C4CEF4;
	Thu,  2 Oct 2025 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759387473;
	bh=JnBN7j5droh3H2pGNS2Yqug4bI9vWf9w2jtC9CcI0Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UG58CB2rWtiMXRchCHwWLofkmsXLn3fKVtWNW04+7L9eNEENg/qRLNowFt/vG/bys
	 3HXtuDxQ1SRoqd+ysPhnEt6fgHCd+OulYKaYQCDquJ7AY+CZngGKkBZ70hzSWs67BA
	 A9dHrIL04xDuCGqWZ5BGnqJ4rryPEuxYsAYKsM6c=
Date: Thu, 2 Oct 2025 08:44:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 00/11] Linux RISC-V trace framework and drivers
Message-ID: <2025100255-catcall-drinkable-23f5@gregkh>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <2025100208-challenge-protrude-d6c3@gregkh>
 <CAK9=C2U9FV6crTL1G2X6tUM=RyRnPBm1dPeFc29n3vmrFTcfHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2U9FV6crTL1G2X6tUM=RyRnPBm1dPeFc29n3vmrFTcfHw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMDIsIDIwMjUgYXQgMTI6MDk6MjNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIE9jdCAyLCAyMDI1IGF0IDExOjU24oCvQU0gR3JlZyBLSCA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgT2N0IDAyLCAyMDI1IGF0
IDExOjM3OjIxQU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+IFRoaXMgc2VyaWVzIGFk
ZHMgaW5pdGlhbCBzdXBwb3J0IGZvciBSSVNDLVYgdHJhY2UgZnJhbWV3b3JrIGFuZCBkcml2ZXJz
Lgo+ID4gPiBUaGUgUklTQy1WIHRyYWNlIHYxLjAgc3BlY2lmaWNhdGlvbiBpcyBhbHJlYWR5IHJh
dGlmaWVkIGFuZCBjYW4gYmUgZm91bmQgYXQ6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di1ub24taXNhL2UtdHJhY2UtZW5jYXAvcmVsZWFzZXMvdGFnL3YxLjAuMC1yYXRpZmllZAo+ID4g
PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS90Zy1uZXh1cy10cmFjZS9yZWxlYXNl
cy90YWcvMS4wX1JhdGlmaWVkCj4gPiA+Cj4gPiA+IFRoZSBSSVNDLVYgdHJhY2UgZnJhbWV3b3Jr
IGFuZCBkcml2ZXJzIGFyZSBkZXNpZ25lZCB0byBiZSBhZ25vc3RpYyB0byB0aGUKPiA+ID4gdW5k
ZXJseWluZyB0cmFjZSBwcm90b2NvbCBoZW5jZSBib3RoIFJJU0MtViBFLXRyYWNlIGFuZCBSSVND
LVYgTi10cmFjZSBzaG91bGQKPiA+ID4gd29yayBmaW5lLiBUaGUgZGlzY292ZXJ5IG9mIHRyYWNl
IHByb3RvY2wgcGFyYW1ldGVycyBhcmUgbGVmdCB0byB1c2VyLXNwYWNlCj4gPiA+IHRyYWNlIGRl
Y29kZXIuCj4gPiA+Cj4gPiA+IEluIHRoZXIgZnV0dXJlLCB0aGVyZSB3aWxsIGJlIHN1YnNlcXVl
bnQgc2VyaWVzIGFkZGluZzoKPiA+ID4gMSkgU3lzZnMgc3VwcG9ydAo+ID4KPiA+IHdoeSBkb2Vz
ICJ0cmFjZSIgbmVlZCBzeXNmcyBzdXBwb3J0PyAgTm8gb3RoZXIgY3B1IHBsYXRmb3JtIHVzZXMg
dGhhdAo+ID4gdG9kYXksIHNvIHdoeSBpcyBhIG5ldyB1c2VyL2tlcm5lbCBhcGkgbmVlZGVkPwo+
IAo+IFdlIHNhdyB0cmFjZSBzdXBwb3J0IGZvciBvdGhlciBhcmNoaXRlY3R1cmVzIChlLmcuIEFS
TSBjb3Jlc2lnaHQpIGFsbG93aW5nCj4gdHJhY2Ugc3RhcnQvc3RvcCB0aHJvdWdoIHN5c2ZzLiBJ
ZiB0aGlzIGlzIGFuIG9ic29sZXRlIG9yIG5vdCBwcmVmZXJyZWQgYXBwcm9hY2gKPiB0aGVuIHdl
IHdpbGwgZGVwcmlvcml0aXplIGFuZCBwb3NzaWJseSBuZXZlciBhZGQgaXQuCgpXaHkgaXMgdGhh
dCBuZWVkZWQgZm9yIGNvcmVzaWdodCBhbmQgb3RoZXIgYXJjaGVzIGRvIG5vdCBuZWVkIGl0PwpQ
ZXJoYXBzIGl0IHNob3VsZCBiZSBkZWxldGVkIGZyb20gdGhhdCBjb2RlYmFzZSBpbnN0ZWFkPwoK
dGhhbmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
