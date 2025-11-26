Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E92D11195
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLVGzGe1F0Dfu+ZTIuNYyooPfue4GEKHCSBD1bVUJ90=; b=OXBC0Ng7OPq8JA
	Ow1nLfSizNoTHYqu8+jF8DOAloUpGReqLH/3VwZwZeiXZPKndz9lIskncT+EACmqPSpj9XKLHt5K5
	0h1tSciYXJMqWn2n6QZ+NcnhFIFslwR2Tyvx0lNBCh0/HnxKOdB8PgdBal+OtGWlt2O5t/qaa8j50
	jNpMew53oPJViDhFnryB8KcR/4K6XTteKcX1CGOaYF2K6KSpGB9E9zZbUCKT/V1JuPrezHPB98ocS
	sUiK9rc4s7hZs5W1hy41EMPG4VoTixGpvay0RYi/Z6AZfXUzr+ZsvWeCAw443OyWuQVRxskshW4Hn
	+SB0CwGBMU9owjCbqkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMEn-0000000Fd25-47ND;
	Wed, 26 Nov 2025 20:35:42 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMEj-0000000Fd19-3mn6
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 20:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764189303;
	bh=izXh+/ex/S8HOJXHsJcERBFQl/fmMLPe+sQvN1oeXII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e98aQG4mS/zX/LytJxg3IMJngS/y/yyxBUbLogwjdgmEpF0YDcDZnU5orSfS02L58
	 RBoFI6BSUrD4/dny3V/wNvIpp3PsJwa8tb739UNjlp77RQFaVP1lUQYTIxe362QsrK
	 bF4RbIT/Hdxi8uJWwV2Ux6FleMBbz9RXvoShtvm6FfK0cqyfn4aC6BzAh77sDISTnD
	 tyaRU+UcuFRmwSrGHDRdBvrieKiE/XUCA0ROBydyL9LXhnJ3tfRF0UBk5voWYvYpEM
	 NRtwAkooocUX8XxUld+go8rCGdRpb8R9lFa5pNoAxlkbpeNB23M67UpY7PMLP+hy/Y
	 tVSkPe/VIaXzQ==
Received: from [192.168.2.54] (unknown [98.97.63.250])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A99DFB2214C4;
	Wed, 26 Nov 2025 21:35:00 +0100 (CET)
Message-ID: <e4aa0839-1b2e-46a6-a33c-94d0da4922bd@freeshell.de>
Date: Wed, 26 Nov 2025 12:34:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
To: Conor Dooley <conor@kernel.org>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
 <20251124-state-campsite-3e7788a495c1@spud>
 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
 <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
 <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
 <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
 <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
 <20251125-borrowing-arming-9c256497af8f@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251125-borrowing-arming-9c256497af8f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_123538_416144_F3405AB3 
X-CRM114-Status: GOOD (  26.64  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDExLzI1LzI1IDExOjE0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBOb3YgMjUs
IDIwMjUgYXQgMDU6MDc6MDBBTSAtMDgwMCwgRSBTaGF0dG93IHdyb3RlOgo+Pgo+Pgo+PiBPbiAx
MS8yNS8yNSAwMDowMSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI1LTExLTI15pif
5pyf5LqM55qEIDA4OjQ4ICswMTAw77yMS3J6eXN6dG9mIEtvemxvd3NraeWGmemBk++8mgo+Pj4+
IE9uIDI1LzExLzIwMjUgMDg6MzMsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+Pj4+IOWcqCAyMDI1
LTExLTI15pif5pyf5LqM55qEIDA4OjI4ICswMTAw77yMS3J6eXN6dG9mIEtvemxvd3NraeWGmemB
k++8mgo+Pj4+Pj4gT24gMjQvMTEvMjAyNSAyMjo1OSwgRSBTaGF0dG93IHdyb3RlOgo+Pj4+Pj4+
Cj4+Pj4+Pj4gT24gMTEvMjQvMjUgMDU6MjIsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4+Pj4g
T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMDg6Mjg6MTBBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraQo+Pj4+Pj4+PiB3cm90ZToKPj4+Pj4+Pj4+IE9uIFN1biwgTm92IDIzLCAyMDI1IGF0IDAy
OjUwOjQ0UE0gLTA4MDAsIEUgU2hhdHRvdyB3cm90ZToKPj4+Pj4+Pj4+PiBGcm9tOiBJY2Vub3d5
IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFkZCAieHVubG9u
ZyxvcmFuZ2VwaS1ydiIgYXMgYSBTdGFyRml2ZSBKSDcxMTAgU29DLWJhc2VkCj4+Pj4+Pj4+Pj4g
Ym9hcmQuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVA
ZnJlZXNoZWxsLmRlPgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IDxmb3JtIGxldHRlcj4KPj4+Pj4+Pj4+
IFRoaXMgaXMgYSBmcmllbmRseSByZW1pbmRlciBkdXJpbmcgdGhlIHJldmlldyBwcm9jZXNzLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBm
b3Jnb3QgdG8gYWRkIGl0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJdCdzIGZyb20gbWUsIGRvbid0IHJl
c3VibWl0IGp1c3QgdG8gYWRkIGl0IHNpbmNlIGl0J2xsIGJlIG1lCj4+Pj4+Pj4+IGFwcGx5aW5n
Cj4+Pj4+Pj4+IGFueXdheS4KPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEhpIENvbm9yLAo+Pj4+
Pj4+Cj4+Pj4+Pj4gT2theS4gWWVzIEknZCBkcm9wcGVkIHRoZSB0YWcgc2luY2UgdGhlIGNvbW1p
dCBtZXNzYWdlIGlzCj4+Pj4+Pj4gYXBwcmVjaWFibHkKPj4+Pj4+PiBkaWZmZXJlbnQsIGFuZCB5
b3Ugd291bGQgYmUgaGFuZGxpbmcgaXQgYWdhaW4gYW55d2F5cy4gVGhhbmtzIQo+Pj4+Pj4+IEFu
ZAo+Pj4+Pj4+IHRoYW5rCj4+Pj4+Pj4geW91IEtyenlzenRvZiBmb3IgdGhlIHJlbWluZGVyIC1F
Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFuZCB3aGVyZSBkaWQgeW91IGV4cGxhaW4gdGhhdCB5b3Ug
ZHJvcHBlZCB0aGUgdGFnIGJlY2F1c2Ugb2YKPj4+Pj4+IHRoYXQ/Cj4+Pj4+PiBQbGVhc2UgcmVh
ZCB0aGUgZm9ybSBsZXR0ZXIgY2FyZWZ1bGx5Lgo+Pj4+Pgo+Pj4+PiBXZWxsIEkgdGhpbmsgdGhl
cmUncyBubyBjbGVhciBkZWZpbml0aW9uIG9mICJ0aGUgcGF0Y2ggaGFzIGNoYW5nZWQKPj4+Pj4g
c3Vic3RhbnRpYWxseSIgaGVyZS4KPj4+Pj4KPj4+Pj4gRSBtYXkgdGhpbmsgZm9yIHRoaXMgc3Vj
aC1zaG9ydCBwYXRjaCwgdGhlIGNvbW1pdCBtZXNzYWdlIHdlaWdocyBhCj4+Pj4+IGxvdAo+Pj4+
PiBhbmQgdGhlIGNoYW5nZSB0byBpdCBpcyBzaWduaWZpY2FudCB0byB0aGUgcGF0Y2ggKGUuZy4g
bWFraW5nIHRoZQo+Pj4+PiBwYXRjaAo+Pj4+PiBub3QgY2xlYXIgZW5vdWdoKS4KPj4+Pgo+Pj4+
IFlvdSBzdGlsbCBkaWQgbm90IGJvdGhlciB0byByZWFkIHdoYXQgd2UgZXhwZWN0LiBJIGRvIG5v
dCBkaXNjdXNzIGlmCj4+Pj4gdGhpcyBjaGFuZ2VkIHNpZ25pZmljYW50bHkgb3Igbm90LCBhbHRo
b3VnaCBpdCBpcyBvYnZpb3VzIHRoYXQgaXQgZGlkCj4+Pj4gbm90IGNoYW5nZSBhbmQgdGFnIHNo
b3VsZCBoYXZlIGJlZW4gcmV0YWluZWQuCj4+Pj4KPj4+PiBMb29rIGFnYWluOgo+Pj4+IDxRVU9U
RT4KPj4+PiBQbGVhc2UgcmVhZDoKPj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xMi1yYzMvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNo
ZXMucnN0I0w1NzcKPj4+Pgo+Pj4+IElmIGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwg
cGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFuZ2VkLgo+Pj4+IDwvUVVPVEU+Cj4+Pj4KPj4+
PiBXaGVyZSBkaWQgeW91IGV4cGxhaW4gdGhhdD8KPj4+Cj4+PiBTdXJlLCBJIGFncmVlIHRoYXQg
ZXhwbGFpbmF0aW9uIG9mIHRoaXMgc2hvdWxkIGJlIGRlbGl2ZXJlZC4KPj4+Cj4+Pj4KPj4+Pgo+
Pj4+IEJlc3QgcmVnYXJkcywKPj4+PiBLcnp5c3p0b2YKPj4+Cj4+Cj4+IEtyenlzenRvZiwKPj4K
Pj4gVGhlIHN1Ym1pdHRpbmctcGF0Y2hlcyBkb2N1bWVudCBkb2VzIG5vdCBzdXBwb3J0IHlvdXIg
YXNzZXJ0aW9uIGluIHRoaXMKPj4gc2l0dWF0aW9uLiBJIGV2aWRlbnRseSBoYXZlIGEgZGlmZmVy
ZW50IHVuZGVyc3RhbmRpbmcgb2YgdGhhbiB5b3UsIGFzCj4+IHdoZW4gSSByZWFkIGl0IGJlZm9y
ZSBzZW5kaW5nIHRoZSBzZXJpZXMgSSBkaWQgYXJyaXZlIGF0IHRoZSBhY3Rpb24gb2Y6Cj4+Cj4+
IDEuIEFja2VkLWJ5IGlzIGxlc3MgZm9ybWFsIGFuZCBzbyBpdCBpcyBhIG1hdHRlciBvZiBvcGlu
aW9uIGFuZAo+PiBqdWRnZW1lbnQgd2hldGhlciB0byByZXRhaW4gaXQgb3Igbm90LiBJIGNob29z
ZSBub3QgdG8gaGVyZSBkdWUgdG8KPj4gY2hhbmdlcyB2aXNpYmxlIGluIHRoZSBjb21taXQgbG9n
ICh0aGUgY29tbWl0IG1lc3NhZ2VzIGFuZCB0aXRsZXMpLiBJCj4+IHdvdWxkIGxldCBDb25vciBk
ZWNpZGUgaWYgdGhleSB3aWxsIGFja25vd2xlZGdlIHRoZSByZXZpc2VkIHNlcmllcwo+PiBpbnN0
ZWFkIG9mIG1ha2luZyB0aGF0IGRlY2lzaW9uIGZvciB0aGVtLgo+IAo+IElmIGFueXRoaW5nLCBh
Y2tlZC1ieSBiZWluZyAibGVzcyBmb3JtYWwiIHdvdWxkIG1lYW4gdGhhdCBpdCdzIG1vcmUKPiBy
ZXNpc3RhbnQgdG8gY2hhbmNlcyBpbiB0aGUgcGF0Y2guCj4gCgpUaGF0IGlzIGFuIGludGVyZXN0
aW5nICJyZWFkIGJldHdlZW4gdGhlIGxpbmVzIiBvcHBvc2l0ZSBtZWFuaW5nIG9mCmZvcm1hbGl0
eSB0aGFuIHdoYXQgSSB1bmRlcnN0YW5kIGl0IHRvIGJlLiBJJ20gbWFraW5nIG15IGludGVybmFs
IG1lbnRhbApub3RlLCB3ZWlyZCwgYnV0IG9rYXkuCgo+PiAyLiBJIGFtIG5vdCByZXF1aXJlZCB0
byBtZW50aW9uIHRoZSBkcm9wIG9mIGFueSBBY2tlZC1ieSB0YWcgaW4gdGhlCj4+IGNvdmVyIGxl
dHRlciBmb3IgdGhpcyBzaXR1YXRpb24uIENvbm9yIGlzIGhhbmRsaW5nIHRoaXMgc2VyaWVzIHNv
IEkgZG8KPj4gbmVlZCB0byBwYXJ0aWNpcGF0ZSBvbiB0aGUgbWFpbGluZyBsaXN0IHdoZW4gdGhl
cmUncyBhIHF1ZXN0aW9uIG9yCj4+IGNvbW1lbnQgYWJvdXQgcGlja2luZyB1cCB0aGUgbGFjayBv
ZiBBY2tlZC1ieS4KPiAKPiBJZiBJIHdlcmUgeW91LCBJIHdvdWxkIHByZXR0eSBtdWNoIGFsd2F5
cyBtZW50aW9uIHRoZSByZWFzb24gZm9yCj4gZHJvcHBpbmcgdGFncyB1bmxlc3MgdGhlIGNoYW5n
ZWxvZyBvciBjb3ZlciBsZXR0ZXIgY29udGFpbnMgc29tZSBwcmV0dHkKPiBkcmFzdGljIGNoYW5n
ZXMgYmV0d2VlbiB2ZXJzaW9ucyB0aGVyZWJ5IG1ha2luZyBpdCByZWFsbHkgb2J2aW91cyB3aHkK
PiB0aGUgdGFncyBhcmUgZ29uZS4KClNvdW5kcyBnb29kIHRvIG1lIGFuZCBJIHdpbGwgY29tcGx5
LiBJIGRpZCBpbmZlciB0aGlzIGZyb20gdGhlIGluaXRpYWwKZm9ybS1sZXR0ZXIgcmVwbHkgYnkg
S3J6eXN6dG9mIHRoYXQgc29tZXRoaW5nIGhhZCBydW4gYWZvdWwgb2Ygbm9ybXMuIE5vCnByb2Js
ZW0gZm9yIG1lIHRvIGV4cGxhaW4gbXkgdW5kZXJzdGFuZGluZyBzbyBpdCBjYW4gYmUgd29ya2Vk
IG91dCB3aGF0Cm5lZWRzIHRvIGhhcHBlbiwgYW5kIHNvIHRoYW5rIHlvdSBmb3IgdGhlIGNsYXJp
ZmljYXRpb24uIFRoaXMgd2FzIG5vdAp0aGUgdGltZS1zYXZpbmcgbm9pc2UgcmVkdWN0aW9uIEkg
aW50ZW5kZWQgZm9yLgoKLUUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
