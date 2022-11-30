Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3994C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nD/WDU7EiDZBSrVofBbDx5zljr0yNg6Da6OzlD4Opc4=; b=xLezeT6vZlV1b4
	BpzfFf5cWLcB7/20irsn8DeXO7Fqt5GttmoyC7hQIF4vopfqeUvsOY4vzVVa7+VyS6TUmKIv/u60w
	VcZLXh2WQX0JsgbauWqSZRawkfmbIMO3quYUHCeRHOaxuVF3jtR33kALhgVrp1DPmz5jaSgR27oTm
	v+LxgISQ3Deg9JtbiYQ6T32EDoDM117+ESenCscYHH+h6sHyEnFYc8oW4ezb3ta2QvLDfCZh17I8Q
	eEa3CwGaFL4OCuzgvVafogCocV8MkfKeaDg6K1CKWD9ppMWsyX4A3YX9iSw8mmohpoWjP8AblHDPr
	J3IMjiuLUMVruGGIitDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Rw3-001daI-Lg; Wed, 30 Nov 2022 18:35:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Rvi-001dCE-1n
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:35:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6F80FCE1AD4;
	Wed, 30 Nov 2022 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D66C433D7;
	Wed, 30 Nov 2022 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669833324;
	bh=m9ZbOfSOhqrV9QbDkO0wnkpV571DI07sybMViITSyfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIzaMYtxRDjt6r5k1t1vOIEvc1oWyXA2ZqG9SdSqoF9X65WLxO/euqmX2ZRJvxWee
	 IdwL0374yXGXYH7bU8Bn806VTOSG/Lm6w6FMITSa/xJZCM+EGtjDyM3OZHg7j16Ea2
	 RyE+q+P7qmQ0NWp6zWrCiRz3DFfkV5MzZeaV0K+J367lrXFwW/44ZBu2UOM6RR4zx9
	 KeGnVS67fVMe9b9p8GOUpKT2iZk7xhfcQHh907w5lclBeZoW+/4Q7Yk4r1rzM6k96F
	 OIE/msMLmRpgSsjgiH+HjS8Ia85l+ZtRxOhlCv3AnZ6U/Kf+OMKGtH3O1aMU/m1J9I
	 vC+Gm+8ahSIKA==
Date: Wed, 30 Nov 2022 18:35:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: fix underscore requirement
 for addtional standard extensions
Message-ID: <Y4eiZ1AS+///9svR@spud>
References: <20221130180422.1642652-1-conor@kernel.org>
 <20221130180422.1642652-2-conor@kernel.org>
 <E52B0E0B-F27B-43C8-85DA-4C7AC0C52369@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E52B0E0B-F27B-43C8-85DA-4C7AC0C52369@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_103534_467469_FD3ED6B8 
X-CRM114-Status: GOOD (  25.06  )
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

T24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMDY6Mjk6MThQTSArMDAwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMzAgTm92IDIwMjIsIGF0IDE4OjA0LCBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4gCj4gPiBUaGUgUklTQy1WIElTQSBNYW51YWwgYWxsb3dzIGZv
ciB0aGUgZmlyc3QgQWRkaXRpb25hbCBTdGFuZGFyZAo+ID4gRXh0ZW5zaW9uIGhhdmluZyBubyBs
ZWFkaW5nIHVuZGVyc2NvcmUuIE9ubHkgaWYgdGhlcmUgYXJlIG11bHRpcGxlCj4gPiBBZGRpdGlv
bmFsIFN0YW5kYXJkIEV4dGVuc2lvbnMgaXMgaXQgbmVlZGVkIHRvIGhhdmUgYW4gdW5kZXJzY29y
ZS4KPiA+IAo+ID4gVGhlIGR0LWJpbmRpbmcgZG9lcyBub3QgdmFsaWRhdGUgdGhhdCBhIG11bHRp
LWxldHRlciBleHRlbnNpb24gaXMKPiA+IGNhbm9uaWNhbGx5IG9yZGVyZWQsIGFzIHRoYXQnZCBu
ZWVkIGFuIGV2ZW4gd29yc2UgcmVnZXggdGhhbiBpcyBoZXJlLAo+ID4gYnV0IGl0IHNob3VsZCBu
b3QgZmFpbCB2YWxpZGF0aW9uIGZvciB2YWxpZCBJU0Egc3RyaW5ncy4KPiA+IAo+ID4gQWxsb3cg
dGhlIGZpcnN0IFogbXVsdGktbGV0dGVyIGV4dGVuc2lvbiB0byBhcHBlYXIgaW1tZWRpYXRlbHkg
cHJpb3IKPiA+IGFmdGVyIHRoZSBzaW5nbGUtbGV0dGVyIGV4dGVuc2lvbnMuCj4gPiAKPiA+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL3JlbGVhc2VzL3Rh
Zy9yaXNjdi11bnByaXYtcGRmLWZyb20tYXNjaWlkb2MtMTUxMTIwMjIgIyBDaGFwdGVyIDI5LjUK
PiA+IEZpeGVzOiAyOTk4MjRlNjhiZDAgKCJkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBuZXcgcmlz
Y3YsaXNhIHN0cmluZ3MgZm9yIGVtdWxhdG9ycyIpCj4gPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+ID4gLS0tCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgMiArLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gaW5kZXggOTBhN2NhYmY1OGZl
Li5lODBjOTY3YTRmYTQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiBAQCAtODAsNyArODAsNyBAQCBwcm9wZXJ0
aWVzOgo+ID4gICAgICAgaW5zZW5zaXRpdmUsIGxldHRlcnMgaW4gdGhlIHJpc2N2LGlzYSBzdHJp
bmcgbXVzdCBiZSBhbGwKPiA+ICAgICAgIGxvd2VyY2FzZSB0byBzaW1wbGlmeSBwYXJzaW5nLgo+
ID4gICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmciCj4g
PiAtICAgIHBhdHRlcm46IF5ydig/OjY0fDMyKWltYWY/ZD9xP2M/Yj92P2s/aD8oPzpfW2hzeHpd
KD86W2Etel0pKykqJAo+ID4gKyAgICBwYXR0ZXJuOiBecnYoPzo2NHwzMilpbWFmP2Q/cT9jP2I/
dj9rP2g/KD86eig/OlthLXpdKSspPyg/Ol9baHN4el0oPzpbYS16XSkrKSokCj4gCj4gSXNu4oCZ
dCBpdCBhbnkgbXVsdGktbGV0dGVyIGV4dGVuc2lvbiwgaS5lLCB0aGlzIHNob3VsZCBiZSBbaHN4
el0gYWdhaW4/Cj4gCj4gSXQgY2VydGFpbmx5IHVzZWQgdG8gYmUgYXQgbGVhc3Q7IHdlIHVzZSBy
djY0Z2N4Y2hlcmkuLi4KCjxxdW90ZT4KTm9uLXN0YW5kYXJkIGV4dGVuc2lvbnMgbXVzdCBiZSBs
aXN0ZWQgYWZ0ZXIgYWxsIHN0YW5kYXJkIGV4dGVuc2lvbnMuClRoZXkgbXVzdCBiZSBzZXBhcmF0
ZWQgZnJvbSBvdGhlciBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucwpieSBhbiB1bmRlcnNjb3JlCjxc
cXVvdGU+CgpOb3BlLCB5b3UncmUgcmlnaHQuIEkgcmVhbGlzZWQgdGhhdCB0aGUgb3RoZXIgZGF5
IHdpdGggdGhlIG5vbi1iaW5kaW5nCnNlcmllcyB0aGF0IHdhcyBhIHJlc3BvbnNlIHRvIHYxLiBJ
IGhhZCB0aGF0IGl0Y2hpbmcgZmVlbGluZyB0aGF0IEkgaGFkCmZvcmdvdHRlbiB0byBkbyBzb21l
dGhpbmcgd2hlbiBJIHdhcyB3cml0aW5nIG15IGNoYW5nZWxvZyBidXQgY291bGQgbm90CnJlbWVt
YmVyIHdoYXQuLi4KClRoYW5rcyBKZXNzIQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
