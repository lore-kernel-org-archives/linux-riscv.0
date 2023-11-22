Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2095C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 02:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7+9RyJTZCknVkmjtlHYqyC38MGTcoQBbH7SgXUt3r0=; b=JfmA7hP0CEPnkU
	PV3WyGI3kwCw1uYoxTuQfvyAgZ5XcQLL+/pb9NjIcMK+5J071fMi+3cODl+hR5LxiJhTqZjT2otbW
	H+wVL9NYvyK5jrdbwn9ivaJB/dZT3Y/PLA/kvkxSj9+OarpdpeyA4B0LhjKROgnpu00dFQiEFLe0i
	gtmghvI+BUSwh2YDRieG4JFRTqKc07PICv8lULlbl2OW9HR1LadkeaGw/tAY+eM5fQrZFVC4XkZ0y
	R3jmI3c4iGtutT9iHiFNWVKU0kn8NOi5iBpfzFLnu+KHTN9Jn54Fw7DDo5T2Bqwj4J72E6wa7j99U
	qKjteQ52mDLpiN/vQrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5cww-000TdJ-2g;
	Wed, 22 Nov 2023 02:26:46 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5cws-000Tch-2C
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 02:26:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AM2Q9xm022966;
	Wed, 22 Nov 2023 10:26:09 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 22 Nov 2023 10:26:09 +0800
Date: Wed, 22 Nov 2023 10:26:05 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley
	<conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
Message-ID: <ZV1mvc86BdgdPL1y@APC323>
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AM2Q9xm022966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_182643_186675_FF4DCEA8 
X-CRM114-Status: GOOD (  18.03  )
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

T24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMDg6MjQ6NTlQTSArMDAwMCwgUHJhYmhha2FyIHdyb3Rl
Ogo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KPiAKPiBXZSBzaG91bGQgYmUgcHJvYmluZyBmb3IgSU9DUCBkdXJpbmcgYm9vdCBz
dGFnZSBvbmx5LiBBcyB3ZSB3ZXJlIHByb2JpbmcKPiBmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFn
ZXMgdGhpcyBjYXVzZWQgdGhlIGJlbG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdAo+IHN0YWdl
LAo+IAo+IFs5LjAxOTEwNF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3Qg
YXQgdmlydHVhbCBhZGRyZXNzIGZmZmZmZmZmODEwMGQzYTAKPiBbOS4wMjcxNTNdIE9vcHMgWyMx
XQo+IFs5LjAyOTQyMV0gTW9kdWxlcyBsaW5rZWQgaW46IHJjYXJfY2FuZmQgcmVuZXNhc191c2Jo
cyBpMmNfcmlpYyBjYW5fZGV2IHNwaV9yc3BpIGkyY19jb3JlCj4gWzkuMDM3Njg2XSBDUFU6IDAg
UElEOiA5MCBDb21tOiB1ZGV2ZCBOb3QgdGFpbnRlZCA2LjcuMC1yYzErICM1Nwo+IFs5LjA0Mzc1
Nl0gSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDQzZjAx
IChEVCkKPiBbOS4wNTAzMzldIGVwYyA6IHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCsweDEw
LzB4M2UKPiBbOS4wNTU1NThdIMKgcmEgOiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4
NTIKPiBbOS4wNjA0MThdIGVwYyA6IGZmZmZmZmZmODAwMGQ4YzIgcmEgOiBmZmZmZmZmZjgwMDBk
OTVjIHNwIDogZmZmZmZmYzgwMDNhYmIwMAo+IFs5LjA2NzYwN10gwqBncCA6IGZmZmZmZmZmODE0
ZTI1YTAgdHAgOiBmZmZmZmZkODAzNjFlNTQwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+IFs5LjA3
NDc5NV0gwqB0MSA6IDAwMDAwMDAwMDkwMDAzMWUgdDIgOiAwMDAwMDAwMDAwMDAwMDAxIHMwIDog
ZmZmZmZmYzgwMDNhYmIyMAo+IFs5LjA4MTk4NF0gwqBzMSA6IGZmZmZmZmZmMDE1YjU3YzcgYTAg
OiAwMDAwMDAwMDAwMDAwMDAwIGExIDogMDAwMDAwMDAwMDAwMDAwMQo+IFs5LjA4OTE3Ml0gwqBh
MiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogZmZmZmZmZmY4
MTAwZDhiZQo+IFs5LjA5NjM2MF0gwqBhNSA6IDAwMDAwMDAwMDAwMDAwMDEgYTYgOiAwMDAwMDAw
MDAwMDAwMDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQo+IFs5LjEwMzU0OF0gwqBzMiA6IGZmZmZm
ZmZmMDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAwMDAwMDAxIHM0IDogMDAwMDAwMDAwMDAwMDMxZQo+
IFs5LjExMDczNl0gwqBzNSA6IDgwMDAwMDAwMDAwMDhhNDUgczYgOiAwMDAwMDAwMDAwMDAwNTAw
IHM3IDogMDAwMDAwMDAwMDAwMDAzZgo+IFs5LjExNzkyNF0gwqBzOCA6IGZmZmZmZmM4MDAzYWJk
NDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDogZmZmZmZmZmY4MTUxYTFiMAo+IFs5LjEyNTEx
M10gwqBzMTE6IGZmZmZmZmZmMDE1YjEwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAxIHQ0IDogZmVm
ZWZlZmVmZWZlZmVmZgo+IFs5LjEzMjMwMV0gwqB0NSA6IGZmZmZmZmZmMDE1YjU3YzcgdDYgOiBm
ZmZmZmZkOGI2M2E2MDAwCj4gWzkuMTM3NTg3XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFk
YWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgo+IFs5LjE0NTQ2
OF0gWzxmZmZmZmZmZjgwMDBkOGMyPl0gcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAv
MHgzZQo+IFs5LjE1MTk3Ml0gWzxmZmZmZmZmZjgwMDAyN2U4Pl0gX2FwcGx5X2FsdGVybmF0aXZl
cysweDg0LzB4ODYKPiBbOS4xNTc3ODRdIFs8ZmZmZmZmZmY4MDAwMjliZT5dIGFwcGx5X21vZHVs
ZV9hbHRlcm5hdGl2ZXMrMHgxMC8weDFhCj4gWzkuMTY0MTEzXSBbPGZmZmZmZmZmODAwMDhmY2M+
XSBtb2R1bGVfZmluYWxpemUrMHg1ZS8weDdhCj4gWzkuMTY5NTgzXSBbPGZmZmZmZmZmODAwODVj
ZDY+XSBsb2FkX21vZHVsZSsweGZkOC8weDE3OWMKPiBbOS4xNzQ5NjVdIFs8ZmZmZmZmZmY4MDA4
NjYzMD5dIGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDc2LzB4YWEKPiBbOS4xODA5NDhdIFs8ZmZm
ZmZmZmY4MDA4NjdmNj5dIF9fcmlzY3Zfc3lzX2Zpbml0X21vZHVsZSsweDE3Ni8weDJhOAo+IFs5
LjE4NzM2NV0gWzxmZmZmZmZmZjgwODg5ODYyPl0gZG9fdHJhcF9lY2FsbF91KzB4YmUvMHgxMzAK
PiBbOS4xOTI5MjJdIFs8ZmZmZmZmZmY4MDg5MjBiYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAv
MHg2NAo+IFs5LjE5ODU3M10gQ29kZTogMDAwOSBiN2U5IDY3OTcgMDE0ZCBhNzgzIDg1YTcgYzc5
OSA0Nzg1IDA3MTcgMDEwMCAoMDEyMykgYWVmNwo+IFs5LjIwNTk5NF0gLS0tWyBlbmQgdHJhY2Ug
MDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gCj4gVGhpcyBpcyBiZWNhdXNlIHdlIGNhbGxlZCByaXNj
dl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmb3IgYWxsIHRoZSBzdGFnZXMKPiBkdXJpbmcgSU9D
UCBwcm9iZS4gcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZnVuY3Rpb24gc2V0cwo+IG5v
bmNvaGVyZW50X3N1cHBvcnRlZCB2YXJpYWJsZSB0byB0cnVlIHdoaWNoIGhhcyBhbiBhbm5vdGF0
aW9uIHNldCB0bwo+ICJfX3JvX2FmdGVyX2luaXQiIGR1ZSB0byB3aGljaCB3ZSB3ZXJlIHNlZWlu
ZyB0aGUgYWJvdmUgc3BsYXQuIEZpeCB0aGlzIGJ5Cj4gcHJvYmluZyBJT0NQIGR1cmluZyBib290
IHN0YWdlIG9ubHkuCj4gCj4gRml4ZXM6IGUwMjFhZTdmNTE0NSAoInJpc2N2OiBlcnJhdGE6IEFk
ZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIpCj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6
IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KClRoYW5rcywKUGV0
ZXIgTGluCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYyB8IDMgKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2
L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+IGluZGV4IGQyZTFhYmNhYzk2Ny4uMWMwZmVmMTExMjcz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMKPiBAQCAtNjAsNyArNjAsOCBAQCB2b2lk
IF9faW5pdF9vcl9tb2R1bGUgYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9lbnRy
eSAqYmVnaW4sIHN0cnVjdCBhbAo+ICAJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYXJjaGlkLCB1
bnNpZ25lZCBsb25nIGltcGlkLAo+ICAJCQkJCSAgICAgIHVuc2lnbmVkIGludCBzdGFnZSkKPiAg
ewo+IC0JZXJyYXRhX3Byb2JlX2lvY3Aoc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwo+ICsJaWYgKHN0
YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19CT09UKQo+ICsJCWVycmF0YV9wcm9iZV9pb2NwKHN0
YWdlLCBhcmNoaWQsIGltcGlkKTsKPiAgCj4gIAkvKiB3ZSBoYXZlIG5vdGhpbmcgdG8gcGF0Y2gg
aGVyZSBBVE0gc28ganVzdCByZXR1cm4gYmFjayAqLwo+ICB9Cj4gLS0gCj4gMi4zNC4xCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
