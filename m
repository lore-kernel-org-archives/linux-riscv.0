Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E913ECA0EC0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uES1S1h+INnDTHLPu+RmCCKH5wBdnIlt8b7ozaeK5bE=; b=1bNWIzTRmHoJxb
	Jz9DoTpYlslSeYE8g0Lt81QVY1wJuExq+yFMyPMupvG+Kbw+mif0kc2B9xDF2TphWrpU3+enEw4Po
	2fkV9Lzug0b+PJCfxpHSNPR2ewd1YZKGv7mIFRjqdHc66jCpfoj+97ZuLG4U6UJ/89S3gW3ZPkB8w
	fJFxc0ycSy4GGl7dZYRVbVLMuArI/xrWmpra5DPAVgSk+c/FTpD4PMHv1xgIkdrVpB1fX+Fky23Et
	6xGR1ZtIF3/OGDxLz+WJt4ZMZXng946h7DHDJ8p4CvVDgB5VSD845eMbfaNuDnA+OSmb3wcQ5zBqM
	QDSL/H7zkwOlrw+RDnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIjH-00000002M49-3CVO;
	Fri, 08 Aug 2025 08:45:35 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIdU-00000002LKV-0qnS
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 08:39:37 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C63E912FB458;
	Fri, 08 Aug 2025 01:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754642373; bh=C5oQDH2C4AYPc13lRN5KYUvuF+nlKWXe35dAwNKKKQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2LjNYcL9eqKmruQHc21P2hU8hg2IOYCBvjctagJ2Az1XMnr6X1nETA8xEf6cn68q
	 MgPY5cR99L0oGpWxt4Pv4fXeSjjtE1YVzExFRvkVIIdZ61lBxWpOtrnMl0/rCyasdT
	 c+Ai+3jh+PASw0+utr1RVGMpTt8trDLutpwblovCkG0yHDTKBekvbs69ibIJ2IcEz2
	 BLaxkxk2vkzB+efa1tj1e5zWTjfUgqRgjdgNKBOOOQQ87q/vetYpegQKuTuzt5fuZP
	 CB4UbqLXJq6pzNRckiHoilscaf51nNRl/SXVCgmqLED2JGLVE+b47ND7SAO/pHarW8
	 3hf3Ae2OwHRzQ==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWhw2vAtAcjx; Fri,  8 Aug 2025 01:39:29 -0700 (PDT)
Received: from ketchup (unknown [117.171.65.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 3CC5E12FB405;
	Fri, 08 Aug 2025 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754642369; bh=C5oQDH2C4AYPc13lRN5KYUvuF+nlKWXe35dAwNKKKQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1PoWh6/voAcLo+G3AldL51Mrxwo3fgOzUJ231BYpZMALndqcZt3QlOBSfemJA19H
	 kwwY2YvN0/GRdNkrZ8jDY+l7vGohCA9EXKtKPKxiqmAUR14LPEekyJcdGlFjSHIxA0
	 SJMag4t3qxCnJ4iSOBLPoDTHMIHASCtek+9JGfIm6ceErU1zou5T/WXm0/SEN3HkdV
	 pOzk04iJZC62qCiRkrj1owif8d/dmrNPYYL526bNgqGAIgE3M+g7yn+z68mclJi09s
	 A6oiDTG5kllPNHkVts88BQMzzCA9LRBnzRda8JMAtBkWi3SKYAf08H/ZnXJpAfJHFq
	 m50KPmH+j6keA==
Date: Fri, 8 Aug 2025 08:39:22 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH 2/2] clk: spacemit: introduce i2s pre-clock and fix i2s
 clock
Message-ID: <aJW3uvqI--Bwrld3@ketchup>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-k1-clk-i2s-generation-v1-2-7dc25eb4e4d3@linux.spacemit.com>
 <aJQXKN_ccpWVJ5oZ@ketchup>
 <C7EA7A1D0F9884EB+aJVcqFqix0GF_RnX@LT-Guozexi>
 <aJV2EIC_0E1FQX7L@ketchup>
 <78351F50C5DA0C45+aJWaWKEyO_f2a6Kp@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78351F50C5DA0C45+aJWaWKEyO_f2a6Kp@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_013936_539113_D52E1B76 
X-CRM114-Status: GOOD (  54.19  )
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

T24gRnJpLCBBdWcgMDgsIDIwMjUgYXQgMDI6MzQ6MDBQTSArMDgwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBPbiBGcmksIEF1ZyAwOCwgMjAyNSBhdCAwMzo1OToxMkFNICswMDAwLCBIYXlsZW4g
Q2h1IHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMDgsIDIwMjUgYXQgMTA6MTA6NDhBTSArMDgwMCwg
VHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4gSGksIEhheWxlbiEKPiA+ID4gCj4gPiA+IE9uIFRo
dSwgQXVnIDA3LCAyMDI1IGF0IDAzOjAyOjAwQU0gKzAwMDAsIEhheWxlbiBDaHUgd3JvdGU6Cj4g
PiA+ID4gT24gVGh1LCBBdWcgMDcsIDIwMjUgYXQgMDk6MzA6MTFBTSArMDgwMCwgVHJveSBNaXRj
aGVsbCB3cm90ZToKPiA+ID4gPiA+IERlZmluaW5nIGkyc19iY2xrIGFuZCBpMnNfc3lzY2xrIGFz
IGZpeGVkLXJhdGUgY2xvY2tzIGlzIGluc3VmZmljaWVudAo+ID4gPiA+ID4gZm9yIHJlYWwgSTJT
IHVzZSBjYXNlcy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGlzIGEgbGl0dGxlIG1pc2xlYWRpbmc6
IHRoZXkncmUgbW9kZWxlZCBhcyBnYXRlcyB3aXRoIGZpeGVkLWZhY3Rvcgo+ID4gPiA+IGZvciBu
b3cgd2hvc2UgcmF0ZSBpcyBjYWxjdWxhdGVkIGZyb20gdGhlaXIgcGFyZW50cyBpbnN0ZWFkIG9m
IGRlZmluZWQKPiA+ID4gPiBzdGF0aWNhbGx5LiBZb3UgY291bGQgYXZvaWQgcG9zc2libGUgY29u
ZnVzaW9uIGJ5IHJlcGxhY2luZyAiZml4ZWQtcmF0ZSIKPiA+ID4gPiB3aXRoICJmaXhlZC1mYWN0
b3IiLgo+ID4gPiA+Cj4gPiA+IEknbGwgY2hhbmdlIGl0IGluIG5leHQgdmVyc2lvbi4KPiA+ID4g
Cj4gPiA+ID4gCj4gPiA+ID4gPiBNb3Jlb3ZlciwgdGhlIGN1cnJlbnQgSTJTIGNsb2NrIGNvbmZp
Z3VyYXRpb24gZG9lcyBub3Qgd29yayBhcyBleHBlY3RlZAo+ID4gPiA+ID4gZHVlIHRvIG1pc3Np
bmcgcGFyZW50IGNsb2Nrcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHRo
ZSBtaXNzaW5nIHBhcmVudCBjbG9ja3MsIGRlZmluZXMgaTJzX3N5c2NsayBhcwo+ID4gPiA+ID4g
YSBERE4gY2xvY2ssIGFuZCBpMnNfYmNsayBhcyBhIERJViBjbG9jay4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gVGhlIGkyc19zeXNjbGsgYmVoYXZlcyBhcyBhbiBNL04gZnJhY3Rpb25hbCBkaXZpZGVy
IGluIGhhcmR3YXJlLAo+ID4gPiA+ID4gd2l0aCBhbiBhZGRpdGlvbmFsIGdhdGUgY29udHJvbC4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gVG8gcHJvcGVybHkgbW9kZWwgdGhpcywgQ0NVX0RETl9HQVRF
X0RFRklORSBpcyBpbnRyb2R1Y2VkLgo+ID4gPiA+IAo+ID4gPiA+IENvdWxkIGl0IGJlIHJlcHJl
c2VudGVkIGFzIGEgREROIGNsb2NrIHRha2luZyBhIGdhdGUgYXMgcGFyZW50PyBKdXN0Cj4gPiA+
ID4gbGlrZSB3aGF0IGlzIGRlc2NyaWJlZCBpbiB0aGUgcHVibGlzaGVkIGNsb2NrIGRpYWdyYW0u
IEdlbmVyYWxseSBJJ2QKPiA+ID4gPiBsaWtlIHRvIGF2b2lkIGludHJvZHVjaW5nIG1vcmUgY2xv
Y2sgdHlwZXMsIHRoZXJlJ3JlIGFscmVhZHkgYSBsb3QuCj4gPiA+IFVoLCBvdXIgbmV3IGNoaXAo
SzMpIG1heSB1c2VzIHRoaXMgbWFjcm8gdGhhdCBJIGludHJvZHVjZWQuLgo+ID4gPiBzbyBJIGRv
bid0IHdhbm5hIHRha2UgYSBnYXRlIGFzIHBhcmVudCBldmVyeXdoZXJlLi4KPiA+ID4gaG93IGFi
b3V0IHdlIGxlYXZlIGl0PyA7KQo+ID4gCj4gPiBJIHdhc24ndCBwcm9wb3NpbmcgYSB3b3JrYXJv
dW5kLiBXaGF0IHdpbGwgZ28gd3JvbmcgaWYgYSBnYXRlIGlzIHRha2VuCj4gPiBhcyBwYXJlbnQg
b2YgREROIGV2ZXJ5d2hlcmU/IAo+IEkgdGhpbmsgdGhpcyBhIGJpdCB0cm91Ymxlc29tZS4uLgoK
SSBkb24ndCBhZ3JlZS4gSXQganVzdCBjb3N0cyBvbmUgZXh0cmEgbGluZSBhbmQgb25lIGV4dHJh
IG1hY3JvLgoKPiA+IE5vdCB0byBtZW50aW9uIHRoaXMgREROIHZhcmlhbnQgYWN0dWFsbHkKPiA+
IGR1cGxpY2F0ZXMgdGhlIGNvZGUgaW4gY2N1X21peC5jLgo+ID4KPiBTbyBJ4oCZdmUgdWx0aW1h
dGVseSBkZWNpZGVkIG5vdCB0byBpbnRyb2R1Y2UgREROX0dBVEUuCj4gSeKAmWxsIGNoYW5nZSB0
aGUgbWFjcm8gZm9yIGkyc19zeXNjbGtfc3JjIGZyb20KPiBDQ1VfTVVYX0RFRklORSB0byBDQ1Vf
TVVYX0dBVEVfREVGSU5FLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPyBGcm9tIHRoZSBjbG9jayB0
cmVlIHBlcnNwZWN0aXZlLCB0aGlzIHNob3VsZCBiZSBmaW5lLgoKVGhhbmtzIGZvciB0aGUgY2hh
bmdlLCBpdCdzIGZpbmUgZm9yIG1lLCB0b28uCgo+ID4gCj4gPiA+ID4gCj4gPiA+ID4gPiBUaGUg
b3JpZ2luYWwgREROIG9wZXJhdGlvbnMgYXBwbGllZCBhbiBpbXBsaWNpdCBkaXZpZGUtYnktMiwg
d2hpY2ggc2hvdWxkCj4gPiA+ID4gPiBub3QgYmUgYSBkZWZhdWx0IGJlaGF2aW9yLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhhdCBhc3N1bXB0aW9uLCBsZXR0aW5n
IGVhY2ggY2xvY2sgZGVmaW5lIGl0cwo+ID4gPiA+ID4gYWN0dWFsIGJlaGF2aW9yIGV4cGxpY2l0
bHkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBpMnNfYmNsayBpcyBhIG5vbi1saW5lYXIsIGRp
c2NyZXRlIGRpdmlkZXIgY2xvY2suCj4gPiA+ID4gPiBUaGUgcHJldmlvdXMgbWFjcm8gb25seSBz
dXBwb3J0ZWQgbGluZWFyIGRpdmlkZXJzLAo+ID4gPiA+ID4gc28gQ0NVX0RJVl9UQUJMRV9HQVRF
X0RFRklORSBpcyBpbnRyb2R1Y2VkIHRvIHN1cHBvcnQKPiA+ID4gPiA+IHRoZSBoYXJkd2FyZSBh
Y2N1cmF0ZWx5Lgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBkaXZpZGVyIElTIGxpbmVhciwgZnJvbSB0
aGUgcGVyc3BlY3RpdmUgb2YgZnVuY3Rpb25hbGl0eSwgaXQganVzdAo+ID4gPiA+IGltcGxpZXMg
YSAxLzIgZmFjdG9yLiBDb3VsZCBpdCBiZSByZXByZXNlbnRlZCBhcyBhbiB1c3VhbCBkaXZpZGVy
IGFuZCBhCj4gPiA+ID4gMS8yIGZpeGVkIGZhY3Rvcj8KPiA+ID4gZGl0dG8uCj4gPiA+IAo+ID4g
PiBJIGtub3cgeW91IGRvbid0IHdhbm5hIGludHJvZHVjZSBuZXcgbWFjcm8uLgo+ID4gCj4gPiBJ
dCdzIG5vdCBhYm91dCBuZXcgbWFjcm9zLiBJdCdzIGFib3V0IG5ldyBjbG9jayB0eXBlcy4gQW5k
IHRoZSBzb2x1dGlvbgo+ID4gSSBwcm9wb3NlZCBmb3IgdGhlIGRpdmlkZXIgd2l0aCBhIGZhY3Rv
ciBpc24ndCBtZWFudCB0byBiZSBhIHdvcmthcm91bmQuCj4gPiAKPiA+IEZvciB0aGUgZGl2aWRl
cidzIGNhc2UsIEkgdGhpbmsgY29tYmluaW5nIGEgZml4ZWQtZmFjdG9yIGFuZCBhIG5vcm1hbAo+
ID4gZGl2aWRlciBsb29rcyBtb3JlIGNsZWFuIHRoYW4gaW50cm9kdWNpbmcgYSBuZXcgTFVULiBJ
dCBzb2x2ZXMgdGhlCj4gPiBwcm9ibGVtIGZvciBLMSwgcmlnaHQ/Cj4geWVzLCBJdCBzb2x2ZXMu
Cj4gCj4gPiAKPiA+ID4gQnV0IEszIHJlcXVpcmVzIHRoaXMsIHNvIHdoZXRoZXIgaXQgaXMgaW50
cm9kdWNlZCBub3cgb3IgZnV0dXJlLAo+ID4gPiB0aGUgZmluYWwgcmVzdWx0IGlzIHRoZSBzYW1l
Lgo+ID4gCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gd2hldGhlciBLMydzIGRpdmlkZXJz
IHJlcXVpcmluZyB0aGlzIHBhdGNoIGFyZQo+ID4gcmVhbGx5IG5vbi1saW5lYXIgb3IganVzdCBp
bXBseSBhIGZpeGVkLWZhY3Rvcj8KPiBJIHdpbGwgY29uZmlybSB0aGlzIHBvaW50Lgo+IAo+IElm
IEkgc2VuZCB2MiB3aXRob3V0IHJlbW92aW5nIHRoZSBDQ1VfRElWX1RBQkxFX0dBVEVfREVGSU5F
IG1hY3JvLAo+IHRoYXQgd291bGQgbWVhbiBLMyByZWFsbHkgbmVlZHMgaXQuCgpUaGFua3MsIHRo
aXMgd2lsbCBoZWxwLgoKPiA+IAo+ID4gPiBQbGVhc2UgbGVhdmUgaXQuLgo+ID4gPiA+IAo+ID4g
PiA+ID4gVGhlIEkyUy1yZWxhdGVkIGNsb2NrIHJlZ2lzdGVycyBjYW4gYmUgZm91bmQgaGVyZSBb
MV0uCj4gPiA+ID4gCj4gPiA+ID4gU28gdGhpcyBwYXRjaCBhY3R1YWxseSBkb2VzIGZvdXIgc2Vw
YXJhdGUgdGhpbmdzLAo+ID4gPiA+IAo+ID4gPiA+IC0gSW50cm9kdWNlIGEgZ2F0ZS1jYXBhYmxl
IHZhcmlhbnQgb2YgREROIGNsb2Nrcwo+ID4gPiA+IC0gTWFrZSB0aGUgcHJlLWRpdmlkZXIgb2Yg
REROIGNsb2NrcyBmbGV4aWJsZQo+ID4gPiA+IC0gU3VwcG9ydCBsb29raW5nIHVwIG1hcHBpbmdz
IGJldHdlZW4gcmVnaXN0ZXIgdmFsdWVzIGFuZCBkaXZpc29ycwo+ID4gPiA+ICAgdGhyb3VnaCBh
IHRhYmxlIHdoZW4gY2FsY3VsYXRpbmcgcmF0ZXMgb2YgZGl2aWRlcnMKPiA+ID4gPiAtIEZpeCB0
aGUgZGVmaW5pdGlvbiBvZiBpMnNfYmNsayBhbmQgaTJzX3N5c2Nsawo+ID4gPiA+IAo+ID4gPiA+
IElNSE8gaXQncyBiZXR0ZXIgdG8gc3BsaXQgdGhlbSBpbnRvIHNlcGFyYXRlIHBhdGNoZXMgZm9y
IGNsZWFybmVzcy4KPiA+ID4gT2ssIEkgd2lsbCBzcGxpdCB0aGVtIGludG8gc2VwYXJhdGUgcGF0
Y2hlcy4KPiA+IAo+ID4gVGhhbmtzLCB0aGF0J2xsIGJlIGVhc2llciB0byByZXZpZXcuCj4gPiAK
PiA+ID4gLi4uCj4gPiA+ID4gCj4gPiA+ID4gLi4uCj4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zb2Mvc3BhY2VtaXQvazEtc3lzY29uLmggYi9pbmNsdWRlL3NvYy9zcGFj
ZW1pdC9rMS1zeXNjb24uaAo+ID4gPiA+ID4gaW5kZXggYzU5YmQ3YTM4ZTViNDIxOTEyMTM0MWI5
YzBkOWZmZGExM2E5YzNlMi4uMjUzZGI4YTYwMmZlNDNhMTEwOWUyYmEyNDhhZjExMTA5YzdiYWEy
MiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvc29jL3NwYWNlbWl0L2sxLXN5c2Nvbi5o
Cj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL3NvYy9zcGFjZW1pdC9rMS1zeXNjb24uaAo+ID4gPiA+
ID4gQEAgLTI5LDEwICsyOSwxMSBAQCB0b19zcGFjZW1pdF9jY3VfYWRldihzdHJ1Y3QgYXV4aWxp
YXJ5X2RldmljZSAqYWRldikKPiA+ID4gPiA+ICAjZGVmaW5lIEFQQlNfUExMM19TV0NSMwkJCTB4
MTJjCj4gPiA+ID4gPiAgCj4gPiA+ID4gPiAgLyogTVBNVSByZWdpc3RlciBvZmZzZXQgKi8KPiA+
ID4gPiA+ICsjZGVmaW5lIE1QTVVfRkNDUgkJCTB4MDAwOAo+ID4gPiA+ID4gICNkZWZpbmUgTVBN
VV9QT1NSCQkJMHgwMDEwCj4gPiA+ID4gPiAtI2RlZmluZSAgUE9TUl9QTEwxX0xPQ0sJCQlCSVQo
MjcpCj4gPiA+ID4gPiAtI2RlZmluZSAgUE9TUl9QTEwyX0xPQ0sJCQlCSVQoMjgpCj4gPiA+ID4g
PiAtI2RlZmluZSAgUE9TUl9QTEwzX0xPQ0sJCQlCSVQoMjkpCj4gPiA+ID4gPiArI2RlZmluZSBQ
T1NSX1BMTDFfTE9DSwkJCUJJVCgyNykKPiA+ID4gPiA+ICsjZGVmaW5lIFBPU1JfUExMMl9MT0NL
CQkJQklUKDI4KQo+ID4gPiA+ID4gKyNkZWZpbmUgUE9TUl9QTEwzX0xPQ0sJCQlCSVQoMjkpCj4g
PiA+ID4gCj4gPiA+ID4gVGhpcyByZWZvcm1hdHRpbmcgZG9lc24ndCBzZWVtIHJlbGF0ZWQgdG8g
dGhlIHBhdGNoLgo+ID4gPiBJdCdzIHdvcnRoIHRoYXQgY3JlYXRlIGEgbmV3IGNvbW1pdCB0byBy
ZWZvcm1hdHRpbmcgaXQ/Cj4gPiAKPiA+IElJUkMsIHRoZSBpbmRlbnRhdGlvbiBpcyBpbnRlbmRl
ZCB0byBzaG93IHRoZSByZWxhdGlvbnNoaXAgYmV0d2Vlbgo+ID4gcmVnaXN0ZXIgYml0cyBhbmQg
b2Zmc2V0cywgd2hpY2ggc2VlbXMgZWFzaWVyIHRvIHJlYWQgZm9yIG1lLiAKPiBTcnkgSSBpZ25v
cmUgdGhpcy4uCj4gCj4gQnV0IGlzbuKAmXQgdGhlIFBPU1IgcHJlZml4IGFscmVhZHkgc3VmZmlj
aWVudCB0byBpbmRpY2F0ZSB0aGUgcmVsYXRpb25zaGlwPwoKSSB0aGluayB0aGUgb3JpZ2luYWwg
Zm9ybSBpcyBlYXNpZXIgdG8gcmVhZCwgaXNuJ3QgaXQ/IEV2ZW4gaWYgeW91IGRvbid0CnRoaW5r
IHNvLCB0aGlzIGNoYW5nZSBvYnZpb3VzbHkgZXhjZWVkcyBzY29wZSBvZiB0aGlzIHBhdGNoIGFu
ZCBwbGVhc2UKc2VwYXJhdGUgYSBzZXJpZXMgZm9yIGRpc2N1c3Npb24uCgo+IEhhdmUgYSBuaWNl
IGRheSEKPiAKPiAgICAgICAgICAgICAgICAgLSBUcm95CgpCZXN0IHJlZ2FyZHMsCkhheWxlbiBD
aHUKCj4gPiBEbyB5b3UKPiA+IGhhdmUgYSBnb29kIHJlYXNvbiB0byBjaGFuZ2UgaXQ/Cj4gPiAK
PiA+ID4gICAgICAgICAgICAgICAgIC0gVHJveQo+ID4gPiA+IAo+ID4gPiA+ID4gICNkZWZpbmUg
TVBNVV9TVUNDUgkJCTB4MDAxNAo+ID4gPiA+ID4gICNkZWZpbmUgTVBNVV9JU0NDUgkJCTB4MDA0
NAo+ID4gPiA+ID4gICNkZWZpbmUgTVBNVV9XRFRQQ1IJCQkweDAyMDAKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gLS0gCj4gPiA+ID4gPiAyLjUwLjEKPiA+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEJl
c3QgcmVnYXJkcywKPiA+ID4gPiBIYXlsZW4gQ2h1Cj4gPiA+ID4gCj4gPiAKPiA+IEJlc3QgcmVn
YXJkcywKPiA+IEhheWxlbiBDaHUKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
