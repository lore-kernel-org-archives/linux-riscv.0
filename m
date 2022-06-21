Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B798BCCA481
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJUWblj+6G8eXSHmntemaOY3ZRYLnw018N+QxruAFXY=; b=HDA9i2nNgd3IcX
	QeIRDiLmjInh5rFCZlghvzLyMVzoSa6L5XbiV7Q3ZcdvkpCm/325s8eEU9vb6snQWRkzsuSPtv6d3
	UhPHw7PxroLR8pvjaaqN6XMFQhYIuHYsz+/wjf6ZnxvzmyUigHvpf3hvukhzZG346kgcIbDV+6T/u
	+jNmUzQDUqE92Lmk1B3EfdgVlxysGFcDUN20JwAC9GOBVVYcVLK92cJ3sobJ164WNsJ3eA3FJI3hO
	LDsHdVreT6JjIGXDHHJzJ2NqeSlx6r9V4sLIE17cpKTwz52Bnq4jeuv0VJPLH8SGbYCr44VWLRbEy
	kIpTasR4sP3LCjm8FK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3hGt-006UDy-HY; Tue, 21 Jun 2022 17:02:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3hGr-006UD1-4S
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 17:02:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0FD7B816D8;
	Tue, 21 Jun 2022 17:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D0BC341C6;
	Tue, 21 Jun 2022 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655830950;
	bh=QE4+UA3NK3Ve7E8Z63ZBPqjWhAiabpLThO1TMvB6X1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4wysRmnrhaJBpYRdB5ywNmA1LZUAFQu4HsN4tNnA+3BCaPtBq0mM1GQoTFp/2mkf
	 7YCXsp8XCi+kJkadJHvHyOe75ch+BZzRHgFtwHtZZTN8H5nQWkGhlbAIVkGnVMDp5Y
	 m8QmInDKtt+9ZoCa87w+GaaPRACOohkfhMLz+gw8=
Date: Tue, 21 Jun 2022 19:02:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Conor.Dooley@microchip.com
Cc: b-liu@ti.com, Daire.McNamara@microchip.com,
	Valentina.FernandezAlanis@microchip.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-riscv@lists.infradead.org, ben.dooks@codethink.co.uk,
	heinrich.schuchardt@canonical.com, Nicolas.Ferre@microchip.com,
	Cristian.Birsan@microchip.com
Subject: Re: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Message-ID: <YrH5onHHaiafU5Om@kroah.com>
References: <20220613114642.1615292-1-conor.dooley@microchip.com>
 <YrHXZYe4e4vlCHh3@kroah.com>
 <6c9001fa-5315-c9f4-b7b9-05248635750d@microchip.com>
 <YrHmnND30o1Rjmcp@kroah.com>
 <eb87a311-0a06-8a96-d8cc-ea0bd08efeeb@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb87a311-0a06-8a96-d8cc-ea0bd08efeeb@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_100233_488809_D43918CC 
X-CRM114-Status: GOOD (  26.23  )
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

T24gVHVlLCBKdW4gMjEsIDIwMjIgYXQgMDM6NDg6MDNQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gCj4gCj4gT24gMjEvMDYvMjAyMiAxNjo0MSwgR3JlZyBLSCB3
cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDIxLCAyMDIyIGF0IDAzOjE2OjQ5UE0gKzAwMDAsIENvbm9y
LkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBPbiAyMS8wNi8yMDIy
IDE1OjM2LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPj4+IE9uIE1vbiwgSnVuIDEzLCAy
MDIyIGF0IDEyOjQ2OjQxUE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+Pj4+IEhleSBC
aW4sIEdyZWcsCj4gPj4+PiBTaG9ydCBzZXJpZXMgaGVyZSBhZGRpbmcgc3VwcG9ydCBmb3IgVVNC
IG9uIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DIEZQR0FzLgo+ID4+Pj4gVGhlIGtjb25maWcgZGVw
ZW5kZW5jeSBmb3IgSU5WRU5UUkFfRE1BIGhhcyBiZWNvbWUgYSBiaXQgb2YgYSBtb3V0aGZ1bCwK
PiA+Pj4+IGlzIHRoZXJlIGEgYmV0dGVyIHdheSBvZiBkZWFsaW5nIHdpdGggdGhhdD8KPiA+Pj4+
IFRoYW5rcywKPiA+Pj4+IENvbm9yLgo+ID4+Pj4KPiA+Pj4+IENoYW5nZXMgc2luY2UgdjE6Cj4g
Pj4+PiAtIERyb3AgdW5uZWVkZWQgcmVzb3VyY2UgY29weWluZyBhcyBwZXIgUm9iJ3MgY2hhbmdl
cyB0byB0aGUgb3RoZXIgZHJpdmVycwo+ID4+Pj4gLSBEcm9wIHRoZSBkdHMgcGF0Y2gKPiA+Pj4+
Cj4gPj4+PiBDb25vciBEb29sZXkgKDIpOgo+ID4+Pj4gICB1c2I6IG11c2I6IEFkZCBzdXBwb3J0
IGZvciBQb2xhckZpcmUgU29DJ3MgbXVzYiBjb250cm9sbGVyCj4gPj4+PiAgIE1BSU5UQUlORVJT
OiBhZGQgbXVzYiB0byBQb2xhckZpcmUgU29DIGVudHJ5Cj4gPj4+Pgo+ID4+Pj4gIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4+Pj4gIGRyaXZlcnMvdXNiL211c2IvS2NvbmZp
ZyAgfCAgMTMgKy0KPiA+Pj4+ICBkcml2ZXJzL3VzYi9tdXNiL01ha2VmaWxlIHwgICAxICsKPiA+
Pj4+ICBkcml2ZXJzL3VzYi9tdXNiL21wZnMuYyAgIHwgMjY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyNzkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Vz
Yi9tdXNiL21wZnMuYwo+ID4+Pj4KPiA+Pj4+Cj4gPj4+PiBiYXNlLWNvbW1pdDogZjI5MDZhYTg2
MzM4MWFmYjAwMTVhOWViN2ZlZmFkODg1ZDRlNWE1Ngo+ID4+Pj4gLS0gCj4gPj4+PiAyLjM2LjEK
PiA+Pj4+Cj4gPj4+Cj4gPj4+IEFueSBjaGFuY2UgeW91IGNhbiBnZXQgeW91ciBjb21wYW55IHRv
IGZpeCB1cCB0aGVpciBlbWFpbCBzZXR0aW5nczoKPiA+Pj4KPiA+Pj4gR3JhYmJpbmcgdGhyZWFk
IGZyb20gbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYxMzExNDY0Mi4xNjE1MjkyLTEtY29ub3Iu
ZG9vbGV5JTQwbWljcm9jaGlwLmNvbS90Lm1ib3guZ3oKPiA+Pj4gQW5hbHl6aW5nIDQgbWVzc2Fn
ZXMgaW4gdGhlIHRocmVhZAo+ID4+PiBDaGVja2luZyBhdHRlc3RhdGlvbiBvbiBhbGwgbWVzc2Fn
ZXMsIG1heSB0YWtlIGEgbW9tZW50Li4uCj4gPj4+IC0tLQo+ID4+PiAgIOKclyBbUEFUQ0ggdjIg
MS8yXSB1c2I6IG11c2I6IEFkZCBzdXBwb3J0IGZvciBQb2xhckZpcmUgU29DJ3MgbXVzYiBjb250
cm9sbGVyCj4gPj4+ICAg4pyXIFtQQVRDSCB2MiAyLzJdIE1BSU5UQUlORVJTOiBhZGQgbXVzYiB0
byBQb2xhckZpcmUgU29DIGVudHJ5Cj4gPj4+ICAgLS0tCj4gPj4+ICAg4pyXIEJBRFNJRzogREtJ
TS9taWNyb2NoaXAuY29tCj4gPj4+IC0tLQo+ID4+PiBUb3RhbCBwYXRjaGVzOiAyCj4gPj4+Cj4g
Pj4+IElmIEkgZGlkbid0IGtub3cgYmV0dGVyLCBJIHdvdWxkIHRoaW5rIHlvdSB3ZXJlIHNwb29m
aW5nIHRoZSBhZGRyZXNzLi4uCj4gPj4KPiA+PiBHcmVhdCwgdGhhbmtzLiBJIHdhcyBob25lc3Rs
eSBob3BpbmcgeW91IHdvdWxkIG1ha2UgdGhpcyBjb21wbGFpbnQuCj4gPj4gSSBicm91Z2h0IGl0
IHVwIHdpdGggb3VyIElUIGJlZm9yZSAmIG5vdGhpbmcgaGFzIGhhcHBlbmVkIHlldC4KPiA+IAo+
ID4gSXQncyBhbWF6aW5nIHRoYXQgeW91ciBjb21wYW55IGVtYWlscyBhcmUgZXZlbiBtYWtpbmcg
aXQgdG8gbWFueSBzeXN0ZW1zCj4gPiB0aGVzZSBkYXlzIHdpdGggdGhhdCBicm9rZW4uCj4gCj4g
V2VsbCBES0lNIGlzIGFjdHVhbGx5IGVuYWJsZWQgZm9yIHRoZSBkb21haW4gLSBqdXN0IGl0IGlz
IHNpbXBsZS9zaW1wbGUKPiB3aGljaCBJIHdvdWxkIGltYWdpbmUgcGFzc2VzIGluIGRpcmVjdCBl
bWFpbHM/CgpJIGRvIG5vdCBrbm93IHdoYXQgaXMgd3JvbmcsIG9ubHkgdGhhdCBvdXIgY2hlY2tp
bmcgb2YgdGhlIGVtYWlsIHNob3dzCnNvbWV0aGluZyB3ZW50IHdyb25nLiAgSSB3aWxsIGxldCB0
aGUgZW1haWwgYWRtaW5zIGZpZ3VyZSBvdXQgd2hhdCBpcwpnb2luZyBvbiBhcyB0aGF0IGlzIHRo
ZWlyIGRvbWFpbiwgbm90IG1pbmUuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
