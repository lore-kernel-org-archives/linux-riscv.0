Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF07C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NerD3/T72PhcBDraClyNB5oh2VlDAdJoSgyXmDSNGr8=; b=fW8wfmXHQVJL47
	3JrILQ94He6dsyQ6uRoSaSUgPxwEKLfiNp5Dq5tBh7xxRTFsy/ON5Ycj9yjZF+HWt5t40RSvZj70D
	ciGkdcJv7Zfy1xriNVXYMoaTma+gsjXFylU4P/TIaboFW8amDn0w77t8y4o16uXIpNIBC0f7o45Qs
	2Usrgb98rAvYfg8jz2PoVdeZcwzu86HKs5iEkbtii1wdCC7h0GZ3fkJTDpU6uWGlSxHpL4jqJSGUj
	RqgPRI8oC59W3JEazUtgUf513zLvm07/six76imunKKr8+KG5x6x8FOKAjhwvmveHm4NbrzCvexrm
	ULAiWtMFmtNTY70EqwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3Dq-000uSJ-2w;
	Mon, 08 May 2023 15:56:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3Dn-000uR6-1a
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 15:56:21 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pw3DW-00063i-N6; Mon, 08 May 2023 17:56:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Date: Mon, 08 May 2023 17:56:01 +0200
Message-ID: <3554468.R56niFO833@diego>
In-Reply-To: <20230508-refute-reliable-f50dafa6afbd@wendy>
References:  <20230507182304.2934-1-jszhang@kernel.org> <7518428.EvYhyI6sBW@diego>
 <20230508-refute-reliable-f50dafa6afbd@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_085619_531689_280C6A84 
X-CRM114-Status: GOOD (  29.98  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW0gTW9udGFnLCA4LiBNYWkgMjAyMywgMTA6MzU6MzggQ0VTVCBzY2hyaWViIENvbm9yIERvb2xl
eToKPiBPbiBNb24sIE1heSAwOCwgMjAyMyBhdCAxMDoyMzowMkFNICswMjAwLCBIZWlrbyBTdMO8
Ym5lciB3cm90ZToKPiA+IEFtIE1vbnRhZywgOC4gTWFpIDIwMjMsIDA1OjMyOjE3IENFU1Qgc2No
cmllYiBJY2Vub3d5IFpoZW5nOgo+ID4gPiDlnKggMjAyMy0wNS0wN+aYn+acn+aXpeeahCAyMjoz
NSArMDEwMO+8jENvbm9yIERvb2xleeWGmemBk++8mgo+ID4gPiA+IEhleSBKaXNoZW5nLAo+ID4g
PiA+IAo+ID4gPiA+IE9uIE1vbiwgTWF5IDA4LCAyMDIzIGF0IDAyOjIzOjAyQU0gKzA4MDAsIEpp
c2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgYzkx
MF8wOiBjcHVAMCB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gInRoZWFkLGM5MTAiLCAicmlzY3YiOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJpc2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPiA+ID4gPiAKPiA+ID4gPiBEb2VzIHRoaXMgc3Vw
cG9ydCBtb3JlIHRoYW4gInJ2NjRpbWFmZGMiPwo+ID4gPiA+IEkgYXNzdW1lIHRoZXJlJ3Mgc29t
ZSBfeHRoZWFkZm9vIGV4dGVuc2lvbnMgdGhhdCBpdCBkb2VzIHN1cHBvcnQsCj4gPiA+ID4gYWx0
aG91Z2ggSSBhbSBub3Qgc3VyZSBob3cgd2UgYXJlIHByb2NlZWRpbmcgd2l0aCB0aG9zZSAtIEhl
aWtvIG1pZ2h0Cj4gPiA+ID4gaGF2ZSBhIG1vcmUgbnVhbmNlZCB0YWtlLgo+ID4gCj4gPiBJIGd1
ZXNzIHRoZSBpbnRlcmVzdGluZyBxdWVzdGlvbiBzdGlsbCBpcywgYXJlIHRoZXNlIHBhcnQgb2Yg
dGhlIGlzYQo+ID4gc3RyaW5nIG9yIG1vcmUgb2YgYW4gZXJyYXRhPwo+IAo+IFllYWgsIEkgZHVu
bm8uIFRoYXQncyBwb3NzaWJsZSBhIHBvbGljeSBkZWNpc2lvbiBtb3JlIHRoYW4gYW55dGhpbmcK
PiBlbHNlLiBJIGRvbid0IHJlbWVtYmVyIGlmIGl0IHdhcyBvbmUgb2YgeW91ciBwYXRjaHNldHMg
b3IgZWxzZXdoZXJlLCBidXQKPiBJIGRvIHJlY2FsbCBhIHNwbGl0IGJldHdlZW4geHRoZWFkYmEg
ZXRjIGFuZCB2ZWN0b3IsIHdoZXJlIHh0aGVhZGJhIHdhcwo+IGRlZmluZWQgYXMgYSB2ZW5kb3Ig
ZXh0ZW5zaW9uLCB3aGVyZWFzIHZlY3RvciBpcyBub3QuIFRoZWlyIGV4dGVuc2lvbgo+IHNwZWMg
cmVwbyA8aHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVj
PiBhcHBlYXJzCj4gdG8gYmUgYWxpZ25lZCB3aXRoIHRoYXQgdmlldywgYXBhcnQgZnJvbSB0aGUg
Q01PcyB0aGF0IHdlIGhhdmUgYWxyZWFkeQo+IGNhbGxlZCBhbiBlcnJhdHVtLgoKSSB0aGluayB0
aGUgQ01PIHN0dWZmIGNhbWUgYSBiaXQgYmVmb3JlIHRoYXQgcmVwbyBhY3R1YWxseSBleGlzdGVk
IDstKSAuCgpJIGd1ZXNzIGFub3RoZXIgYXJndW1lbnQgZm9yIHJpc2N2LGlzYSB3b3VsZCBiZSB0
aGF0IHdlIGRvbid0IGhhdmUgdG8KdHJ1c3QgTVZFTkRPUklELCBhbmQgZXNwZWNpYWxseSB2YWx1
ZXMgaW4gTUFSQ0hJRCBhbmQgTUlNUElELgoKU29tZWhvdyBwYXJ0IG9mIG1lIGRvZXNuJ3QgaGF2
ZSBlbm91Z2ggdHJ1c3QgdGhhdCB0aGVzZSB2YWx1ZXMgd2lsbAphbHdheXMgYmUgc3VpdGFibHkg
ZGlmZmVyZW50IHdoZW4gdGhleSBhcmUgYmFrZWQgaW50byB0aGUgaGFyZHdhcmUgOy0pIC4KCgpJ
IGd1ZXNzIHZlY3RvciBpcyBzb21ld2hhdCBzcGVjaWFsLCB3aXRoIGl0IGltcGxlbWVudGluZyB2
ZXJzaW9uIDAuNy4xCml0J3Mgbm90IGEgdC1oZWFkIGludmVudGlvbiBidXQgYWxzbyBub3QgdGhl
IHJlYWwgUklTQ1YgInYiIC4KClNvIEkgX2d1ZXNzXyB0aGUganVyeSBtaWdodCBzdGlsbCBiZSBv
dXQgb24gaG93IHRvIGhhbmRsZSB0aGF0IGV2ZXJ5d2hlcmUuCgoKPiA+IFRoZSBiaW5kaW5nIGN1
cnJlbnRseSBzYXlzCj4gPiAgICAgICBJZGVudGlmaWVzIHRoZSBzcGVjaWZpYyBSSVNDLVYgaW5z
dHJ1Y3Rpb24gc2V0IGFyY2hpdGVjdHVyZQo+ID4gICAgICAgc3VwcG9ydGVkIGJ5IHRoZSBoYXJ0
LiAgVGhlc2UgYXJlIGRvY3VtZW50ZWQgaW4gdGhlIFJJU0MtVgo+ID4gICAgICAgVXNlci1MZXZl
bCBJU0EgZG9jdW1lbnQsIGF2YWlsYWJsZSBmcm9tCj4gPiAgICAgICBodHRwczovL3Jpc2N2Lm9y
Zy9zcGVjaWZpY2F0aW9ucy8KPiA+IAo+ID4gCj4gPiBJIGd1ZXNzIGlmIHdlIGRlY2lkZSB0byBt
YWtlIHRoZW0gcGFydCBvZiB0aGUgaXNhLXN0cmluZyB0aGUgYmluZGluZwo+ID4gdGhlbiBzaG91
bGQgZ2V0IGEgcGFyYWdyYXBoIG1lbnRpb24gX3hmb28gdmVuZG9yLWV4dGVuc2lvbnMgdG9vLgo+
IAo+IEkgaGF2ZSBhbiBpZGVhIGluIHRoZSB3b3JrcyB0aGF0IG1heSBhbGxvdyBkZWFsaW5nIHdp
dGggdGhpcyBraW5kIG9mCj4gdGhpbmcsIGJ1dCBpdCdzIGEgYml0IG9mIGEgZGVwYXJ0dXJlIGZy
b20gdGhlIGV4aXN0aW5nIGJpbmRpbmcuCj4gSSB3aWxsIGhvcGVmdWxseSBwb3N0IGFuIGVhcmx5
IFJGQyBvZiBpdCBsYXRlciB0b2RheS4KPiBUaGF0IHNhaWQsIHRoZSBiaW5kaW5nIGRvZXMgY3Vy
cmVudGx5IGFsbG93IHlvdSB0byBwdXQgaW4gX3hmb28gdmVuZG9yCj4gZXh0ZW5zaW9ucyBhcy1p
cy4KPiAKPiA+IFBlcnNvbmFsbHksIG1ha2luZyB0aGVzZSBwYXJ0IG9mIHRoZSBJU0Egc3RyaW5n
IGRlZmluaXRseSBzb3VuZHMgbGlrZQo+ID4gdGhlIGJlc3Qgc29sdXRpb24gdGhvdWdoIDotKSAu
Cj4gCj4gWW91IHdvdWxkIHNheSB0aGF0IHdvdWxkbid0IHlvdSEgSW4gZ2VuZXJhbCwgSSdkIHJh
dGhlciB3ZSBmaWxsZWQgaW4gYXMKPiBtdWNoIGluZm9ybWF0aW9uIGFzIHBvc3NpYmxlIGhlcmUs
IGV2ZW4gaWYgaXQgaXMgbm90IGN1cnJlbnRseSBpbiB1c2UsCj4gdG8gYXZvaWQgaGF2aW5nIHRv
IHJldHJvZml0IGFzIHN1cHBvcnQgYmVjb21lcyBhdmFpbGFibGUuCgp5ZXAgZGVmaW5pdGl2ZWx5
LgpFc3BlY2lhbGx5IGFzIHN3aXRjaGluZyB0byBleHBlY3RpbmcgX3hmb28gbGF0ZXIgb24gdGhl
biBjYXVzZXMgb2YgY291cnNlCmNvbXBhdGlibGl0eSBpc3N1ZXMuIFRoZSBmdW4gcGFydCB3aWxs
IGJlIHRob3VnaCB0byBnZXQgdmVuZG9ycywKdG9vbGNoYWlucyBhbmQgZnJpZW5kcyB0byBhZ3Jl
ZSBvbiB0aGUgbmFtaW5nLgoKCkhlaWtvCiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
