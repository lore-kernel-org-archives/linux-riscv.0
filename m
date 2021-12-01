Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36497C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR91SGj6coJ39KgDm9Dcw1pYlzj+ynB41GGgFlufgIA=; b=MkpnISxoMXo0Kx
	+wALnVyaldmDef7ZJKS4Ki/MC/mhwYy1SMi3s2qyvbOt8bIz3kthnAGz3i233PTYrGUUHLdmKijHF
	VgEStl2ta0XenQ6IJeLnW3FHCjgrQRMCXC71p2Y/BuNLgM0ht0K5ZwoSIOYX425Bg0btRwk2L4TXJ
	DDyQAG/+09LCHRu3kmo7TPFVlsr1DYdRj15BEZtgG9IFrji8N17eeuMNYap9q0/XPpKQyf8T/DuTp
	niYoTnqmMndeNuuGMgIUX5hwatikTubvZwP1IMp0Hnc5lndkJ+EiKPUAcR+7fw/zXcGmQjeysQ/zf
	MJrqJ1plcEjSqkPWaoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msPem-008pwA-ES; Wed, 01 Dec 2021 13:28:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msPei-008pvY-TZ
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 13:28:19 +0000
Received: from ip4d17a2ab.dynamic.kabel-deutschland.de ([77.23.162.171]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1msPeY-0002eu-RQ; Wed, 01 Dec 2021 14:28:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jessica Clarke <jrtc27@jrtc27.com>, Atish Patra <atishp@atishpatra.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Gordan Markus <gordan.markus@canonical.com>,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Dan Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>,
 Anup Patel <anup@brainfault.org>, Rob Herring <robh+dt@kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, atishp04@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 Christoph =?ISO-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 Wei Wu <lazyparser@gmail.com>, Drew Fustini <drew@beagleboard.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Wed, 01 Dec 2021 14:28:05 +0100
Message-ID: <3495709.4EXlkQ93OV@diego>
In-Reply-To: <CAOnJCUKmP6dsrV9xWC52uEaM0=fZh-FNDYyFg1VxQybpQZABMA@mail.gmail.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <03B8F784-4AF3-425D-99B6-F753F7970273@jrtc27.com>
 <CAOnJCUKmP6dsrV9xWC52uEaM0=fZh-FNDYyFg1VxQybpQZABMA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_052817_148548_B5198E77 
X-CRM114-Status: GOOD (  48.85  )
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

SGkgQXRpc2gsCgpBbSBNaXR0d29jaCwgMS4gRGV6ZW1iZXIgMjAyMSwgMDI6MjE6NDYgQ0VUIHNj
aHJpZWIgQXRpc2ggUGF0cmE6Cj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgODoxMyBBTSBKZXNz
aWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDMwIE5vdiAy
MDIxLCBhdCAxNTowMSwgUGhpbGlwcCBUb21zaWNoIDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+
IHdyb3RlOgo+ID4gPgo+ID4gPiBXZSBkaWQgdG91Y2ggb24gdGhpcyBpbiBvdXIgY29vcmRpbmF0
aW9uIGNhbGwgYSBmZXcgd2Vla3MgYWdvOiB0aGUKPiA+ID4gZ3JvdXBpbmcgdW5kZXIgbW11IGFu
ZCB0aGUgYm9vbC1lbnRyaWVzIHdlcmUgY2hvc2VuIGJlY2F1c2Ugb2YgdGhlaXIKPiA+ID4gc2lt
aWxhcml0eSB0byBvdGhlciBleHRlbnNpb25zIChpLmUuIGZvciBaYlthYmNzXSB0aGVyZSBjb3Vs
ZC9zaG91bGQKPiA+ID4gYmUgYSBib29sLWVudHJ5IHVuZGVyIGVhY2ggY3B1LW5vZGUg4oCUIGZv
ciBzb21lIFp2KiBlbnRyaWVzIGEgc3Vibm9kZQo+ID4gPiBtaWdodCBiZSBuZWVkZWQgd2l0aCBm
dXJ0aGVyIHBhcmFtZXRlcnMpLgo+ID4gPgo+ID4gPiBUaGUgc3RyaW5nLWJhc2VkIGFwcHJvYWNo
IChhcyBpbiB0aGUgb3JpZ2luYWxseSBwcm9wb3NlZCAibW11LXR5cGU9IikKPiA+ID4gd291bGQg
bGlrZSBub3Qgc2NhbGUgd2l0aCB0aGUgcHJvbGlmZXJhdGlvbiBvZiBzbWFsbCAmIG1vZHVsYXIK
PiA+ID4gZXh0ZW5zaW9ucy4KPiA+Cj4gPiBJIGRvbuKAmXQgc2VlIHdoeSB0aGUgU3YqIGV4dGVu
c2lvbnMgbmVlZCB0byBiZSB1bmRlciBhbiBtbXUgbm9kZSB0aGVuLAo+ID4gdW5sZXNzIHRoZSBp
bnRlbnQgaXMgdGhhdCBldmVyeSBleHRlbnNpb24gYmUgZ3JvdXBlZCB1bmRlciBhIHN1Yi1ub2Rl
Cj4gPiAod2hpY2ggZG9lc27igJl0IHNlZW0gdmlhYmxlIGR1ZSB0byBleHRlbnNpb25zIGxpa2Ug
WmJrKiwgdW5sZXNzIHlvdQo+ID4gZ3JvdXAgYnkgU3MsIFN2IGFuZCBaKT8KPiA+Cj4gCj4gSXQg
c2hvdWxkbid0IGJlLiBBbGwgdGhlIElTQSBleHRlbnNpb25zIChpLmUuIHN0YW5kYXJkLCBzdXBl
cnZpc29yICYgaHlwZXJ2aXNvcikKPiB3aXRoIHByZWZpeCBTLFosSCBzaG91bGQgYmUga2VwdCBz
ZXBhcmF0ZSBpbiBhIHNlcGFyYXRlIG5vZGUgZm9yIGVhc3kKPiBwYXJzaW5nLgo+IAo+ICJyaXNj
dixpc2EiIGR0IHByb3BlcnR5IHdpbGwgbm90IHNjYWxlIGF0IGFsbC4gSnVzdCBsb29rIGF0IHRo
ZSBmZXcKPiBleHRlbnNpb25zIHRoYXQgd2VyZSByYXRpZmllZCB0aGlzIHllYXIKPiBhbmQgTGlu
dXgga2VybmVsIG5lZWRzIHRvIHN1cHBvcnQgdGhlbS4KPiAKPiAiU3Njb2ZwbWYiLCAiU3ZwYm10
IiwgIlppY2JvbSIKPiAKPiA+IEFsc28sIHdoYXQgaXMgZ29pbmcgdG8gaGFwcGVuIHRvIHRoZSBj
dXJyZW50IHJpc2N2LGlzYT8gV2lsbCB0aGF0Cj4gPiBjb250aW51ZSB0byBleGlzdCBhbmQgZHVw
bGljYXRlIHRoZSBpbmZvLCBvciB3aWxsIGtlcm5lbHMgYmUgcmVxdWlyZWQKPiA+IHRvIHJlY29u
c3RydWN0IHRoZSBzdHJpbmcgdGhlbXNlbHZlcyBpZiB0aGV5IHdhbnQgdG8gZGlzcGxheSBpdCB0
bwo+ID4gdXNlcnM/Cj4gPgo+IAo+IFRoaXMgaXMgbXkgcGVyc29uYWwgcHJlZmVyZW5jZToKPiBy
aXNjdixpc2Egd2lsbCBjb250aW51ZSB0byBiYXNlIFN0YW5kYXJkIElTQSBleHRlbnNpb25zIHRo
YXQgaGF2ZQo+IHNpbmdsZSBsZXR0ZXIgZXh0ZW5zaW9ucy4KPiAKPiBUaGlzIG5ldyBEVCBub2Rl
IHdpbGwgZW5jb2RlIGFsbCB0aGUgbm9uLXNpbmdsZSBsZXR0ZXIgZXh0ZW5zaW9ucy4KPiBJIGFt
IG5vdCBzdXJlIGlmIGl0IHNob3VsZCBpbmNsdWRlIHNvbWUgcHJvdmlzaW9ucyBmb3IgY3VzdG9t
Cj4gZXh0ZW5zaW9ucyBzdGFydGluZyB3aXRoIFggYmVjYXVzZQo+IHRoYXQgd2lsbCBiZSBwbGF0
Zm9ybSBzcGVjaWZpYy4KPiAKPiBBZ2FpbiwgdGhpcyBpcyBqdXN0IG15IHBlcnNvbmFsIHByZWZl
cmVuY2UuIEkgd2lsbCB0cnkgdG8gc2VuZCBhIHBhdGNoCj4gc29vbiBzbyB0aGF0IHdlIGNhbiBp
bml0aWF0ZSBhIGJyb2FkZXIKPiBkaXNjdXNzaW9uIG9mIHRoZSBzY2hlbWUgYW5kIGFncmVlL2Rp
c2FncmVlIG9uIHNvbWV0aGluZy4KCnRoYXQgd291bGQgYmUgcmVhbGx5IGhlbHBmdWwsIGFzIGl0
IGN1cnJlbnRseSBsb29rcyBsaWtlIHdlIGhhdmUgYSBudW1iZXIKb2YgZGlmZmVyZW50IHBvaW50
cy1vZi12aWV3IHNvIGRpc2N1c3NpbmcgYW4gYWN0dWFsIGltcGxlbWVudGF0aW9uIHdpbGwKcHJv
YmFibHkgbWFrZSB0aGluZ3MgYSBsb3QgZWFzaWVyIGNvbXBhcmVkIHRvIGRhbmNpbmcgYXJvdW5k
IHRoZW9yZXRpYwpjYXNlcyA6LSkgLgoKT3V0IG9mIGN1cmlvc2l0eSwgaG93IHNvb24gaXMgInNv
b24iID8gOi1ECgoKSGVpa28KCgo+ID4gQXMgYSBGcmVlQlNEIGRldmVsb3BlciBJ4oCZbSBvYnZp
b3VzbHkgbm90IGEgcGFydCBvZiBtYW55IG9mIHRoZXNlCj4gPiBkaXNjdXNzaW9ucywgYnV0IHdo
YXQgdGhlIExpbnV4IGNvbW11bml0eSBpbXBvc2VzIGFzIHRoZSBkZXZpY2UgdHJlZQo+ID4gYmlu
ZGluZ3MgaGFzIGEgcmVhbCBpbXBhY3Qgb24gdXMuCj4gPgo+ID4gSmVzcwo+ID4KPiA+ID4gT24g
VHVlLCAzMCBOb3YgMjAyMSBhdCAxNDo1OSwgSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcu
Y29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBPbiAzMCBOb3YgMjAyMSwgYXQgMTM6MjcsIEhlaWtv
IFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPj4+Cj4gPiA+Pj4gSGksCj4g
PiA+Pj4KPiA+ID4+PiBBbSBEaWVuc3RhZywgMzAuIE5vdmVtYmVyIDIwMjEsIDE0OjE3OjQxIENF
VCBzY2hyaWViIEplc3NpY2EgQ2xhcmtlOgo+ID4gPj4+PiBPbiAzMCBOb3YgMjAyMSwgYXQgMTI6
MDcsIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPj4+Pj4KPiA+
ID4+Pj4+IEFtIE1vbnRhZywgMjkuIE5vdmVtYmVyIDIwMjEsIDEzOjA2OjIzIENFVCBzY2hyaWVi
IEhlaWtvIFN0w7xibmVyOgo+ID4gPj4+Pj4+IEFtIE1vbnRhZywgMjkuIE5vdmVtYmVyIDIwMjEs
IDA5OjU0OjM5IENFVCBzY2hyaWViIEhlaW5yaWNoIFNjaHVjaGFyZHQ6Cj4gPiA+Pj4+Pj4+IE9u
IDExLzI5LzIxIDAyOjQwLCB3ZWZ1QHJlZGhhdC5jb20gd3JvdGU6Cj4gPiA+Pj4+Pj4+PiBGcm9t
OiBXZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4KPiA+ID4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiBQcmV2
aW91cyBwYXRjaCBoYXMgYWRkZWQgc3ZwYm10IGluIGFyY2gvcmlzY3YgYW5kIGFkZCAicmlzY3Ys
c3ZwbWJ0Igo+ID4gPj4+Pj4+Pj4gaW4gdGhlIERUIG1tdSBub2RlLiBVcGRhdGUgZHQtYmluZGlu
Z3MgcmVsYXRlZCBwcm9wZXJ0eSBoZXJlLgo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBGdSA8d2VmdUByZWRoYXQuY29tPgo+ID4gPj4+Pj4+Pj4gQ28tZGV2ZWxv
cGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPj4+Pj4+Pj4gQ2M6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gPiA+Pj4+Pj4+PiBDYzogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiA+ID4+Pj4+Pj4+IENjOiBSb2IgSGVycmluZyA8cm9i
aCtkdEBrZXJuZWwub3JnPgo+ID4gPj4+Pj4+Pj4gLS0tCj4gPiA+Pj4+Pj4+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgMTAgKysrKysrKysrKwo+
ID4gPj4+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+ID4+Pj4+Pj4+
Cj4gPiA+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9jcHVzLnlhbWwKPiA+ID4+Pj4+Pj4+IGluZGV4IGFhNWZiNjRkNTdlYi4uOWZmOWNiZGQ4
YTg1IDEwMDY0NAo+ID4gPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPj4+Pj4+Pj4gQEAgLTYzLDYg
KzYzLDE2IEBAIHByb3BlcnRpZXM6Cj4gPiA+Pj4+Pj4+PiAgICAgIC0gcmlzY3Ysc3Y0OAo+ID4g
Pj4+Pj4+Pj4gICAgICAtIHJpc2N2LG5vbmUKPiA+ID4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiArICBt
bXU6Cj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+IFNob3VsZG4ndCB3ZSBrZWVwIHRoZSBpdGVtcyBi
ZSBpbiBhbHBoYWJldGljIG9yZGVyLCBpLmUuIG1tdSBiZWZvcmUKPiA+ID4+Pj4+Pj4gbW11LXR5
cGU/Cj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPj4+Pj4+
Pj4gKyAgICAgIERlc2NyaWJlcyB0aGUgQ1BVJ3MgTU1VIFN0YW5kYXJkIEV4dGVuc2lvbnMgc3Vw
cG9ydC4KPiA+ID4+Pj4+Pj4+ICsgICAgICBUaGVzZSB2YWx1ZXMgb3JpZ2luYXRlIGZyb20gdGhl
IFJJU0MtViBQcml2aWxlZ2VkCj4gPiA+Pj4+Pj4+PiArICAgICAgU3BlY2lmaWNhdGlvbiBkb2N1
bWVudCwgYXZhaWxhYmxlIGZyb20KPiA+ID4+Pj4+Pj4+ICsgICAgICBodHRwczovL3Jpc2N2Lm9y
Zy9zcGVjaWZpY2F0aW9ucy8KPiA+ID4+Pj4+Pj4+ICsgICAgJHJlZjogJy9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3N0cmluZycKPiA+ID4+Pj4+Pj4+ICsgICAgZW51bToKPiA+ID4+
Pj4+Pj4+ICsgICAgICAtIHJpc2N2LHN2cG1idAo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBUaGUg
cHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uIGhhcyBtdWx0aXBsZSBNTVUgcmVsYXRlZCBleHRlbnNp
b25zOgo+ID4gPj4+Pj4+PiBTdm5hcG90LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxs
IGJlIG1vZGVsZWQgaW4gdGhpcyBlbnVtPwo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pj4gSSByZW1lbWJl
ciBpbiBzb21lIGVhcmxpZXIgdmVyc2lvbiBzb21lIHdheSBiYWNrIHRoZXJlIHdhcyB0aGUKPiA+
ID4+Pj4+PiBzdWdnZXN0aW9uIG9mIHVzaW5nIGEgc3ViLW5vZGUgaW5zdGVhZCBhbmQgdGhlbiBh
ZGRpbmcgYm9vbGVhbgo+ID4gPj4+Pj4+IHByb3BlcnRpZXMgZm9yIHRoZSBzdXBwb3J0ZWQgZXh0
ZW5zaW9ucy4KPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IEFrYSBzb21ldGhpbmcgbGlrZQo+ID4gPj4+
Pj4+ICAgbW11IHsKPiA+ID4+Pj4+PiAgICAgICAgICAgcmlzY3Ysc3ZwYm10Owo+ID4gPj4+Pj4+
ICAgfTsKPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBGb3IgdGhlIHJlY29yZCwgSSdtIHRhbGtpbmcgYWJv
dXQgdGhlIG1haWwgZnJvbSBzZXB0ZW1iZXIKPiA+ID4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJCb0xGVlpo
dE9hWjVwUHRFQUBtYWlsLmdtYWlsLmNvbS8KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBTbyBoYXZpbmcg
YSBzdWItbm9kZSB3b3VsZCBtYWtlIGFkZGluZyBmdXR1cmUgZXh0ZW5zaW9ucwo+ID4gPj4+Pj4g
d2F5IG5pY2VyLgo+ID4gPj4+Pgo+ID4gPj4+PiBTdnBibXQgaXMganVzdCBhbiBJU0EgZXh0ZW5z
aW9uLCBhbmQgc2hvdWxkIGJlIHRyZWF0ZWQgbGlrZSBhbnkgb3RoZXIuCj4gPiA+Pj4+IExldOKA
mXMgbm90IGludmVudCB0d28gZGlmZmVyZW50IHdheXMgb2YgcmVwcmVzZW50aW5nIHRoYXQgaW4g
dGhlIGRldmljZQo+ID4gPj4+PiB0cmVlLgo+ID4gPj4+Cj4gPiA+Pj4gSGVpbnJpY2ggYXNrZWQg
aG93IHRoZSBvdGhlciBleHRlbnNpb25zIHNob3VsZCBiZSBoYW5kbGVkCj4gPiA+Pj4gKFN2bmFw
b3QsIFN2cGJtdCwgU3ZpbnZhbCksIHNvIHdoYXQgZG8geW91IHN1Z2dlc3QgdG8gZG8gd2l0aCB0
aGVzZT8KPiA+ID4+Cj4gPiA+PiBXaGF0ZXZlciBpcyBkb25lIGZvciBaYlthYmNzXSwgWmsqLCBa
diosIFppY2JvKiwgZXRjLiBUaGVyZSBtYXkgbm90IGJlCj4gPiA+PiBhIGNvbmNyZXRlIHBsYW4g
Zm9yIHRoYXQgeWV0LCBidXQgdGhhdCBtZWFucyB5b3Ugc2hvdWxkIHNwZWFrIHdpdGggdGhlCj4g
PiA+PiBwZW9wbGUgaW52b2x2ZWQgd2l0aCBzdWNoIGV4dGVuc2lvbnMgYW5kIGNvbWUgdXAgd2l0
aCBzb21ldGhpbmcKPiA+ID4+IGFwcHJvcHJpYXRlIHRvZ2V0aGVyLgo+ID4gPj4KPiA+ID4+IEpl
c3MKPiA+ID4+Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKPiAKPiAKPiAtLQo+IFJlZ2FyZHMsCj4gQXRpc2gK
PiAKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
