Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C32C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pianVBoGB1v3ap09amlXeWrWOHFB5mOGggjO8/9Ei9Y=; b=KqlT1Ki4NMp1ad
	FunYp34BXnxpTYhFyJ2KEF38HaZJOL4fFcF3sePl278H84EpTUCM+TZR/MuKie0+CB5SaK5nzfKFQ
	qkqVYbRvlx0ZA2WKzrGCI5aNivL+JV+k9Tqp0Bh55BEgVPfP+a62fvqnDVVdgpRHiqVpPMRdB7pSS
	PW3JC9+XE55a+wW8T6TzUG2WK3q4PSpVGfJhn0Neb/5DIvnNqwXFLNOWsu1bGHwPvzUFSompdF/0G
	HUctAzT3iaF13e+6e9LPZim3SCwPQ9ujjF4SF1JrQEhuorL0MgVQ/FrCpGKUYToqt2Qf4FoqaaRWq
	IRHjHrsmV56QoFnqDX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3g0M-006Cwy-0n; Tue, 21 Jun 2022 15:41:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3g0I-006Cu7-Cz
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 15:41:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1A50B817BD;
	Tue, 21 Jun 2022 15:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16E9C3411C;
	Tue, 21 Jun 2022 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655826079;
	bh=8Ke5wnlYDkO5jPYi69LudjpjdoAfCY+krxfC23GY2ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwruP7zsGpMFJhfm8Non/bFVTOXtlqHamCiwlE9yJj/tQKuNZGvv2SLft8rd/961w
	 8ep7HcVCZuZt37AK3G4nJjtt0ftBxBvq3b9lnqr0Akjt4yy5/6vTiMy9vcHSo9z1LR
	 IMtVs4ZaD8T/WmSxEbpcU9rIerz5lEcTTcBAGiyI=
Date: Tue, 21 Jun 2022 17:41:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Conor.Dooley@microchip.com
Cc: b-liu@ti.com, Daire.McNamara@microchip.com,
	Valentina.FernandezAlanis@microchip.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-riscv@lists.infradead.org, ben.dooks@codethink.co.uk,
	heinrich.schuchardt@canonical.com, Nicolas.Ferre@microchip.com,
	Cristian.Birsan@microchip.com
Subject: Re: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Message-ID: <YrHmnND30o1Rjmcp@kroah.com>
References: <20220613114642.1615292-1-conor.dooley@microchip.com>
 <YrHXZYe4e4vlCHh3@kroah.com>
 <6c9001fa-5315-c9f4-b7b9-05248635750d@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c9001fa-5315-c9f4-b7b9-05248635750d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_084122_654679_C02CABDF 
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

T24gVHVlLCBKdW4gMjEsIDIwMjIgYXQgMDM6MTY6NDlQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gCj4gCj4gT24gMjEvMDYvMjAyMiAxNTozNiwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTMsIDIwMjIgYXQgMTI6NDY6NDFQTSAr
MDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4+IEhleSBCaW4sIEdyZWcsCj4gPj4gU2hvcnQg
c2VyaWVzIGhlcmUgYWRkaW5nIHN1cHBvcnQgZm9yIFVTQiBvbiBNaWNyb2NoaXAgUG9sYXJGaXJl
IFNvQyBGUEdBcy4KPiA+PiBUaGUga2NvbmZpZyBkZXBlbmRlbmN5IGZvciBJTlZFTlRSQV9ETUEg
aGFzIGJlY29tZSBhIGJpdCBvZiBhIG1vdXRoZnVsLAo+ID4+IGlzIHRoZXJlIGEgYmV0dGVyIHdh
eSBvZiBkZWFsaW5nIHdpdGggdGhhdD8KPiA+PiBUaGFua3MsCj4gPj4gQ29ub3IuCj4gPj4KPiA+
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4+IC0gRHJvcCB1bm5lZWRlZCByZXNvdXJjZSBjb3B5aW5n
IGFzIHBlciBSb2IncyBjaGFuZ2VzIHRvIHRoZSBvdGhlciBkcml2ZXJzCj4gPj4gLSBEcm9wIHRo
ZSBkdHMgcGF0Y2gKPiA+Pgo+ID4+IENvbm9yIERvb2xleSAoMik6Cj4gPj4gICB1c2I6IG11c2I6
IEFkZCBzdXBwb3J0IGZvciBQb2xhckZpcmUgU29DJ3MgbXVzYiBjb250cm9sbGVyCj4gPj4gICBN
QUlOVEFJTkVSUzogYWRkIG11c2IgdG8gUG9sYXJGaXJlIFNvQyBlbnRyeQo+ID4+Cj4gPj4gIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4+ICBkcml2ZXJzL3VzYi9tdXNiL0tj
b25maWcgIHwgIDEzICstCj4gPj4gIGRyaXZlcnMvdXNiL211c2IvTWFrZWZpbGUgfCAgIDEgKwo+
ID4+ICBkcml2ZXJzL3VzYi9tdXNiL21wZnMuYyAgIHwgMjY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMjc5IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL211
c2IvbXBmcy5jCj4gPj4KPiA+Pgo+ID4+IGJhc2UtY29tbWl0OiBmMjkwNmFhODYzMzgxYWZiMDAx
NWE5ZWI3ZmVmYWQ4ODVkNGU1YTU2Cj4gPj4gLS0gCj4gPj4gMi4zNi4xCj4gPj4KPiA+IAo+ID4g
QW55IGNoYW5jZSB5b3UgY2FuIGdldCB5b3VyIGNvbXBhbnkgdG8gZml4IHVwIHRoZWlyIGVtYWls
IHNldHRpbmdzOgo+ID4gCj4gPiBHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjIwNjEzMTE0NjQyLjE2MTUyOTItMS1jb25vci5kb29sZXklNDBtaWNyb2NoaXAuY29t
L3QubWJveC5nego+ID4gQW5hbHl6aW5nIDQgbWVzc2FnZXMgaW4gdGhlIHRocmVhZAo+ID4gQ2hl
Y2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4uLgo+
ID4gLS0tCj4gPiAgIOKclyBbUEFUQ0ggdjIgMS8yXSB1c2I6IG11c2I6IEFkZCBzdXBwb3J0IGZv
ciBQb2xhckZpcmUgU29DJ3MgbXVzYiBjb250cm9sbGVyCj4gPiAgIOKclyBbUEFUQ0ggdjIgMi8y
XSBNQUlOVEFJTkVSUzogYWRkIG11c2IgdG8gUG9sYXJGaXJlIFNvQyBlbnRyeQo+ID4gICAtLS0K
PiA+ICAg4pyXIEJBRFNJRzogREtJTS9taWNyb2NoaXAuY29tCj4gPiAtLS0KPiA+IFRvdGFsIHBh
dGNoZXM6IDIKPiA+IAo+ID4gSWYgSSBkaWRuJ3Qga25vdyBiZXR0ZXIsIEkgd291bGQgdGhpbmsg
eW91IHdlcmUgc3Bvb2ZpbmcgdGhlIGFkZHJlc3MuLi4KPiAKPiBHcmVhdCwgdGhhbmtzLiBJIHdh
cyBob25lc3RseSBob3BpbmcgeW91IHdvdWxkIG1ha2UgdGhpcyBjb21wbGFpbnQuCj4gSSBicm91
Z2h0IGl0IHVwIHdpdGggb3VyIElUIGJlZm9yZSAmIG5vdGhpbmcgaGFzIGhhcHBlbmVkIHlldC4K
Ckl0J3MgYW1hemluZyB0aGF0IHlvdXIgY29tcGFueSBlbWFpbHMgYXJlIGV2ZW4gbWFraW5nIGl0
IHRvIG1hbnkgc3lzdGVtcwp0aGVzZSBkYXlzIHdpdGggdGhhdCBicm9rZW4uCgo+IEF0IGxlYXN0
IG5vdyBJIGhhdmUgdGhlIGRpcmVjdCBjb21wbGFpbnQgdG8gZm9yd2FyZCA6KQoKUGxlYXNlIGRv
LCBhbmQgdGVsbCB0aGVtIHRoYXQgaW4gdGhlIGZ1dHVyZSwgc29tZSBvZiB1cyB3aWxsIHByb2Jh
Ymx5CnN0YXJ0IHJlcXVpcmluZyB0aGlzIHRvIHBhc3MgYXMgSSBkb3VidCB0aGV5IHdhbnQganVz
dCBhbnlvbmUgdG8gc3Bvb2YKcGF0Y2hlcyBmcm9tIHlvdXIgZG9tYWluIDopCgp0aGFua3MsCgpn
cmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
