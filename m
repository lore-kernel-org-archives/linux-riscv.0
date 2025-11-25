Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBFD0E6DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1brJCEi8Yw8eXlvVemKv0T86mq2i6d6g2KP6P/opWE=; b=odc7++3rIKjGAY
	rvhP9ZctKeWI8f9OJd1ajqwqeq7t+rbEhhnvzYk67IjO3Zmtpv5DWifhl9/xCpLdvllEIAdRQCtFg
	/EYPF0w+fIebNd/raVBlBlA4NdpiFT6i0rI/Z/aDkVIy+5MeZM1lqBrCTPP1xRBfF9rYivr0ga6N0
	+MVrt5WNN+ZmtIsMCAHj1jWdGYr0Rqv1oiOaWY/RwicFWMCY2gg5Tl2xNbalRFK4yTIA3sFcL7j0V
	P+x28m7z5o664/cqR2lzh8MFAjU0szdtxm6kbfbBtykl2bh9sy/MqCZuSD01Hl0MEEZ4uX0hneGqE
	+xyIteKn4t4QW/raOsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNsll-0000000DJiP-2VPT;
	Tue, 25 Nov 2025 13:07:45 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNsli-0000000DJgt-1Z1t
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 13:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764076025;
	bh=O8pPEWmwuC1hrOwz6iM27BqW82qWb9y2muB3MkxcZlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UaIlOsIxeq218mJ4EjbDaHlhnI4fEXiIucnhWK8tl0CQFFKMiZRB1/iGCLy6W8c04
	 dkVo4WVpS3kyTnQKy4XWTijZ17i85JDCIvWDUIjUrdCxuNPBF+JsR13W5tfPw+k2o8
	 yFoVITTHEhU/bXcODFASowheKXBVJdoaLQQ+UhAcQF701UKmiEH6/XZg/7hvfSUrxm
	 rPSbWgycfAbnH37hizFMdsj01P0aeF6dYvSA2/8RTRzanOnxCPtk1obmmk34ZMMwGE
	 01TB112C6t3oG4xFVzdUmDn6Sp0ky3kkBUuH+CHnNdjvc75e4ZE7cVIxiWskJGLBSX
	 H/gG/Rq5K8iTQ==
Received: from [192.168.2.54] (unknown [98.97.63.250])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E5401B221459;
	Tue, 25 Nov 2025 14:07:02 +0100 (CET)
Message-ID: <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
Date: Tue, 25 Nov 2025 05:07:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
To: Icenowy Zheng <uwu@icenowy.me>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
 <20251124-state-campsite-3e7788a495c1@spud>
 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
 <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
 <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
 <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_050742_871093_C54398BF 
X-CRM114-Status: GOOD (  21.64  )
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

CgpPbiAxMS8yNS8yNSAwMDowMSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NeaYn+acn+S6jOeahCAwODo0OCArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjUvMTEvMjAyNSAwODozMywgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI1
LTExLTI15pif5pyf5LqM55qEIDA4OjI4ICswMTAw77yMS3J6eXN6dG9mIEtvemxvd3NraeWGmemB
k++8mgo+Pj4+IE9uIDI0LzExLzIwMjUgMjI6NTksIEUgU2hhdHRvdyB3cm90ZToKPj4+Pj4KPj4+
Pj4gT24gMTEvMjQvMjUgMDU6MjIsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4+IE9uIE1vbiwg
Tm92IDI0LCAyMDI1IGF0IDA4OjI4OjEwQU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kKPj4+
Pj4+IHdyb3RlOgo+Pj4+Pj4+IE9uIFN1biwgTm92IDIzLCAyMDI1IGF0IDAyOjUwOjQ0UE0gLTA4
MDAsIEUgU2hhdHRvdyB3cm90ZToKPj4+Pj4+Pj4gRnJvbTogSWNlbm93eSBaaGVuZyA8dXd1QGlj
ZW5vd3kubWU+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFkZCAieHVubG9uZyxvcmFuZ2VwaS1ydiIgYXMg
YSBTdGFyRml2ZSBKSDcxMTAgU29DLWJhc2VkCj4+Pj4+Pj4+IGJvYXJkLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVzaGVsbC5kZT4KPj4+Pj4+Pgo+Pj4+
Pj4+IDxmb3JtIGxldHRlcj4KPj4+Pj4+PiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5kZXIgZHVy
aW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPj4+Pj4+Pgo+Pj4+Pj4+IEl0IGxvb2tzIGxpa2UgeW91
IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0Lgo+Pj4+Pj4KPj4+Pj4+IEl0J3Mg
ZnJvbSBtZSwgZG9uJ3QgcmVzdWJtaXQganVzdCB0byBhZGQgaXQgc2luY2UgaXQnbGwgYmUgbWUK
Pj4+Pj4+IGFwcGx5aW5nCj4+Pj4+PiBhbnl3YXkuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIaSBDb25v
ciwKPj4+Pj4KPj4+Pj4gT2theS4gWWVzIEknZCBkcm9wcGVkIHRoZSB0YWcgc2luY2UgdGhlIGNv
bW1pdCBtZXNzYWdlIGlzCj4+Pj4+IGFwcHJlY2lhYmx5Cj4+Pj4+IGRpZmZlcmVudCwgYW5kIHlv
dSB3b3VsZCBiZSBoYW5kbGluZyBpdCBhZ2FpbiBhbnl3YXlzLiBUaGFua3MhCj4+Pj4+IEFuZAo+
Pj4+PiB0aGFuawo+Pj4+PiB5b3UgS3J6eXN6dG9mIGZvciB0aGUgcmVtaW5kZXIgLUUKPj4+Pgo+
Pj4+Cj4+Pj4gQW5kIHdoZXJlIGRpZCB5b3UgZXhwbGFpbiB0aGF0IHlvdSBkcm9wcGVkIHRoZSB0
YWcgYmVjYXVzZSBvZgo+Pj4+IHRoYXQ/Cj4+Pj4gUGxlYXNlIHJlYWQgdGhlIGZvcm0gbGV0dGVy
IGNhcmVmdWxseS4KPj4+Cj4+PiBXZWxsIEkgdGhpbmsgdGhlcmUncyBubyBjbGVhciBkZWZpbml0
aW9uIG9mICJ0aGUgcGF0Y2ggaGFzIGNoYW5nZWQKPj4+IHN1YnN0YW50aWFsbHkiIGhlcmUuCj4+
Pgo+Pj4gRSBtYXkgdGhpbmsgZm9yIHRoaXMgc3VjaC1zaG9ydCBwYXRjaCwgdGhlIGNvbW1pdCBt
ZXNzYWdlIHdlaWdocyBhCj4+PiBsb3QKPj4+IGFuZCB0aGUgY2hhbmdlIHRvIGl0IGlzIHNpZ25p
ZmljYW50IHRvIHRoZSBwYXRjaCAoZS5nLiBtYWtpbmcgdGhlCj4+PiBwYXRjaAo+Pj4gbm90IGNs
ZWFyIGVub3VnaCkuCj4+Cj4+IFlvdSBzdGlsbCBkaWQgbm90IGJvdGhlciB0byByZWFkIHdoYXQg
d2UgZXhwZWN0LiBJIGRvIG5vdCBkaXNjdXNzIGlmCj4+IHRoaXMgY2hhbmdlZCBzaWduaWZpY2Fu
dGx5IG9yIG5vdCwgYWx0aG91Z2ggaXQgaXMgb2J2aW91cyB0aGF0IGl0IGRpZAo+PiBub3QgY2hh
bmdlIGFuZCB0YWcgc2hvdWxkIGhhdmUgYmVlbiByZXRhaW5lZC4KPj4KPj4gTG9vayBhZ2FpbjoK
Pj4gPFFVT1RFPgo+PiBQbGVhc2UgcmVhZDoKPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLnJzdCNMNTc3Cj4+Cj4+IElmIGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwg
cGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFuZ2VkLgo+PiA8L1FVT1RFPgo+Pgo+PiBXaGVy
ZSBkaWQgeW91IGV4cGxhaW4gdGhhdD8KPiAKPiBTdXJlLCBJIGFncmVlIHRoYXQgZXhwbGFpbmF0
aW9uIG9mIHRoaXMgc2hvdWxkIGJlIGRlbGl2ZXJlZC4KPiAKPj4KPj4KPj4gQmVzdCByZWdhcmRz
LAo+PiBLcnp5c3p0b2YKPiAKCktyenlzenRvZiwKClRoZSBzdWJtaXR0aW5nLXBhdGNoZXMgZG9j
dW1lbnQgZG9lcyBub3Qgc3VwcG9ydCB5b3VyIGFzc2VydGlvbiBpbiB0aGlzCnNpdHVhdGlvbi4g
SSBldmlkZW50bHkgaGF2ZSBhIGRpZmZlcmVudCB1bmRlcnN0YW5kaW5nIG9mIHRoYW4geW91LCBh
cwp3aGVuIEkgcmVhZCBpdCBiZWZvcmUgc2VuZGluZyB0aGUgc2VyaWVzIEkgZGlkIGFycml2ZSBh
dCB0aGUgYWN0aW9uIG9mOgoKMS4gQWNrZWQtYnkgaXMgbGVzcyBmb3JtYWwgYW5kIHNvIGl0IGlz
IGEgbWF0dGVyIG9mIG9waW5pb24gYW5kCmp1ZGdlbWVudCB3aGV0aGVyIHRvIHJldGFpbiBpdCBv
ciBub3QuIEkgY2hvb3NlIG5vdCB0byBoZXJlIGR1ZSB0bwpjaGFuZ2VzIHZpc2libGUgaW4gdGhl
IGNvbW1pdCBsb2cgKHRoZSBjb21taXQgbWVzc2FnZXMgYW5kIHRpdGxlcykuIEkKd291bGQgbGV0
IENvbm9yIGRlY2lkZSBpZiB0aGV5IHdpbGwgYWNrbm93bGVkZ2UgdGhlIHJldmlzZWQgc2VyaWVz
Cmluc3RlYWQgb2YgbWFraW5nIHRoYXQgZGVjaXNpb24gZm9yIHRoZW0uCgoyLiBJIGFtIG5vdCBy
ZXF1aXJlZCB0byBtZW50aW9uIHRoZSBkcm9wIG9mIGFueSBBY2tlZC1ieSB0YWcgaW4gdGhlCmNv
dmVyIGxldHRlciBmb3IgdGhpcyBzaXR1YXRpb24uIENvbm9yIGlzIGhhbmRsaW5nIHRoaXMgc2Vy
aWVzIHNvIEkgZG8KbmVlZCB0byBwYXJ0aWNpcGF0ZSBvbiB0aGUgbWFpbGluZyBsaXN0IHdoZW4g
dGhlcmUncyBhIHF1ZXN0aW9uIG9yCmNvbW1lbnQgYWJvdXQgcGlja2luZyB1cCB0aGUgbGFjayBv
ZiBBY2tlZC1ieS4KCkkgYW0gaW4gdGhlIHVuZGVyc3RhbmRpbmcgYXQgdGhlIGV4Y2hhbmdlIGJl
dHdlZW4gQ29ub3IgYW5kIEkgdGhhdCB0aGlzCmNvbmNlcm4gb2YgeW91cnMgd2lsbCBiZSByZXNv
bHZlZCB3aXRob3V0IG15IGlucHV0IGRlcGVuZGluZyBvbiB0aGUKcmV2aWV3IGZyb20gRW1pbC4g
TGV0IHVzIGtub3cgd2hhdC9pZiBtb3JlIHNwZWNpZmljIGFuZCBhY3Rpb25hYmxlIG5lZWRzCmRv
bmUgYW5kIHdob20gYnkgeW91IGV4cGVjdCBpdCB0byBiZSBkb25lLgoKVGhhbmsgeW91LAoKLUUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
