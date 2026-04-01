Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D3D35159
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+D33scnjj/muxzzpEt/k/S9sF14QbWaiZj5fGfMhtnA=; b=bO7uScq+HJCbWU
	RypT92A1VNCwd4EPQzhh8oO9nDvt9qcyHsP26bSH4YgSoCClFhppLYdKysGt9+540fxMoH0X3B1jn
	XkkYRG7VqE2+eH5p1f31JFBI+eioqw5D9y9C99SZT2Z9ikt9RPfP5cLxqC354Np9PzOT4cTshpUZ6
	qG7xccgZNVH/NAlgAd9zVh8hNHCJ7XK67bSdsEwP1fueG1WSec+swqxtLkZt4yJgwc52KVvUGasuG
	Q5E+I0C7nvIUKsQwRV1FmmWfhDX/rQqxESsyaMt76aKI8nnFWZUtbd7aP6ejg9MGiBYkjm9MiNYS8
	vvyVArND5AP0bNmFPiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qS7-0000000EGF1-0yx5;
	Wed, 01 Apr 2026 07:57:27 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qS4-0000000EGDw-0KzH
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 07:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775030142;
	bh=pWzJr5sN+/hj9UGTGfh32k1ECCerwnrLHHRDyRKuunw=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=ug3IhuDCjLm0KcLwHJFxV1421GPo6IkZQhVGfdAndxsm2q1gWZ5jgjmskI8t0Ubla
	 vYS13RklI1NabO30gGL5RWmOi7L+CQfoIMuIBtxujupB4Rf1t4O9SMEwQXduBfhxwo
	 gvJ3mcCoxdD6rfLruUUMUg5zE0fa7MWUjchSLXBM=
X-QQ-mid: zesmtpgz7t1775030139t3da3fef7
X-QQ-Originating-IP: jHB4dQ90D0UyoRXCU+PAjdnY1rkum7sDxOJO5sDA4Q8=
Received: from = ( [183.48.246.31])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Apr 2026 15:55:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13337976862729012487
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Wed, 01 Apr 2026 15:55:36 +0800
Message-Id: <DHHNO3MKPLX6.10BU0B83KT0GV@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Emil Renner Berthing" <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
 <20260331085925-GKB976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn> <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.20e9d5ae.574e.4942.b529.0e22091ba551@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MUZU+Zjxo+2HbLPbGv8B4Fj+rJ4IXPGbJHaoOqB61O0S85akm97Hbbr/
	DCBoSedsdYetAOPwYu52OK+fnyZoQOexiHE8n0klb6qLvSZoHnIkczbH1Ik+pxNsXTTzPrO
	en7/r43HmtKRWGbcHsJaZ7wypoz65MUf1gKYsGh+auSA1NnAUPAXMutL4ubJI2KymxACeAd
	cqUGap1LyAL66Nc7vagrHX12QicExuPxXnwyFMet5elUt62QZHe4nbFBo4yeI8Ii51Z57ET
	94Bgr1bxfyznQNyLhCUkpBYdeys/aYnwvYGr7/OOASlv4g1RVtZPue11aBRubNq/hUqTw0u
	1Rqr6RDsKqorDDVZDGGHQYZjAO5gm+GLUx24Wxq30FKDbTJhNlCTX8M0yPYUUTS0YOwT2UY
	YNqdTL+l70MDeSAj1pubayO6srYUNAIJ8YTA2bqu3PlA3R/PAXWvVwbWFvTVljYHlUZrZTj
	bDYRJLsrIqFrFZ6Zu/zfHVEU+q3/P0DcfwcF1nXkQESusnwlku8VmJUArky/LM0L7s4mCcv
	6sYLJEFbCofPbKkabEBkgkZveaCTum341RKdpkpyNghEy638lSc3bZYll4FPaT381YDE8AF
	fOvdCF80oePm3r682/QxvA8KFtl7rAlJzXyLcdEYpyxZIbokQzN/LEm1y2FCG6zckhGOMod
	ZGwgCyqPpiv+wVzMzYmE8C/80o49mjimYcILYS0mjcTqX/3cMfUd+Z/YdDFW42OO+udKdKH
	jOJr8my8bkdfRproT83dKtYrUSMj2m1S/9ZswOPLtxxmmckMmol1XZ5Onw9g7+4re/SLRy3
	PTpZR9v7lWH0obZKJR6a6Hk46e78cusb+dfdqWdpuMECQ7eTQRBCAiy/34n66vNrFIWMsOM
	5S4PYmdXKicorzD+PWhUznPUQrSFJ+Xt7yC8qUClt8TuELmFls7zgadWBDh71O6xz9R4NuB
	Mt45GB3hfGxTyqmTA+ig+PU97hUffPPSECm3q1dut2whZeJ5/+w7bCbHyyg93iiB5L3ib7k
	WaN464wKFmovO/PJIsfUQljNSQ8fUKEecOu2a1ObXeLDPP1xP6Dzpp7BqjqsWyCt8Pt493r
	37YqBuibOaO0/mg0wKUbGwUvAHmpN4POxP6abjqoLlQDoGi0WbCTTOnxFr0Pt3KeVzKSdJ4
	KD+1vf7jhELXoA8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_005724_933948_E25F83CD 
X-CRM114-Status: GOOD (  20.47  )
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

T24gV2VkIEFwciAxLCAyMDI2IGF0IDM6MzggUE0gQ1NULCDmm7nnj4rnj4ogd3JvdGU6Cj4gSGkg
VHJveSwKPgo+PiBGcm9tOiAiVHJveSBNaXRjaGVsbCI8dHJveS5taXRjaGVsbEBsaW51eC5zcGFj
ZW1pdC5jb20+Cj4+IERhdGU6wqAgV2VkLCBBcHIgMSwgMjAyNiwgMTQ6NDIKPgo+PiBPbiBXZWQg
QXByIDEsIDIwMjYgYXQgMjoxMCBQTSBDU1QsIOabueePiuePiiB3cm90ZToKPj4gPiBIaSBMYW4s
Cj4+ID4KPj4gPj4gRnJvbTogIllpeHVuIExhbiI8ZGxhbkBrZXJuZWwub3JnPgo+PiA+PiBIaSBT
YW5kaWUswqAKPj4gPj7CoAo+PiA+PiBPbiAxMTo0NiBUdWUgMzEgTWFyIMKgIMKgICwgU2FuZGll
IENhbyB3cm90ZToKPj4gPj4gPiBGcm9tOiBzYW5kaWVjYW8gPHNhbmRpZS5jYW9AZGVlcGNvbXB1
dGluZy5pbz4KPj4gPj4gPsKgCj4+ID4+ID4gVGhlIEZNTDEzVjA1IGJvYXJkIGZyb20gRGVlcENv
bXB1dGluZyBpbmNvcnBvcmF0ZXMgYSBTcGFjZW1pVCBLMyBSSVNDLVYKPj4gPj4gPiBTb0MuSXQg
aXMgYSBtYWluYm9hcmQgZGVzaWduZWQgZm9yIHRoZSBGcmFtZXdvcmsgTGFwdG9wIDEzIENoYXNz
aXMsCj4+ID4+ID4gd2hpY2ggaGFzIChGcmFtZXdvcmspIFNLVSBGUkFOSFEwMDAxLgo+PiA+PiA+
wqAKPj4gPj4gPiBUaGUgRk1MMTNWMDUgYm9hcmQgZmVhdHVyZXM6Cj4+ID4+ID4gLSBTcGFjZW1p
VCBLMyBSSVNDLVYgU29DCj4+ID4+ID4gLSBMUEREUjUgMTZHQiBvciAzMkdCCj4+ID4+ID4gLSBl
TU1DIDMyR0IgfjEyOEdCIChPcHRpb25hbCkKPj4gPj4gPiAtIFVGUyAzLjEgMjU2RyAoT3B0aW9u
YWwpCj4+ID4+ID4gLSBRU1BJIEZsYXNoCj4+ID4+ID4gLSBNaWNyb1NEIFNsb3QKPj4gPj4gPiAt
IFBDSWUtYmFzZWQgV2ktRmkKPj4gPj4gPiAtIDQgVVNCLUMgUG9ydHMKPj4gPj4gPiDCoC0gUG9y
dCAxOiBQRCAzLjAgKDY1VyBNYXgpLCBVU0IgMy4yIEdlbiAxCj4+ID4+ID4gwqAtIFBvcnQgMjog
UEQgMy4wICg2NVcgTWF4KSwgVVNCIDMuMiBHZW4gMSwgRFAgMS40ICg0S0A2MEh6KQo+PiA+PiA+
IMKgLSBQb3J0IDMgJiA0OiBVU0IgMy4yIEdlbiAxCj4+ID4+ID7CoAo+PiA+PiA+IFRoaXMgbWlu
aW1hbCBkZXZpY2UgdHJlZSBlbmFibGVzIGJvb3RpbmcgaW50byBhIHNlcmlhbCBjb25zb2xlIHdp
dGggVUFSVAo+PiA+PiA+IG91dHB1dC4KPj4gPj4gPsKgCj4+ID4+ID4gU2lnbmVkLW9mZi1ieTog
c2FuZGllY2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4+ID4+ID4gUmV2aWV3ZWQt
Ynk6IEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNv
bT4KPj4gPj4gPiArJnVhcnQwIHsKPj4gPj4gQ2FuIHlvdSBhbHNvIGFkZCBwaW5jdHJsIGRhdGEg
ZXhwbGljaXRseT8KPj4gPgo+PiA+IFRvIGF2b2lkIGNvbmZsaWN0LMKgIHRoZSBjb21tb24gcGlu
Y3RybCB0YWJsZSAiazMtcGluY3RybC5kdHNpIiBzaG91bGQgYmUgdXBsb2FkZWQgYnkgc3BhY2Vt
aXQuwqAKPj4gPiBUaGVuIHdlIHdpbGwgYWRkIHRoZSBwaW5jdHJsIGRhdGEgYWZ0ZXIgazMtcGlj
by1pdHguZHRzLiBUaGF0IHNob3VsZCBiZSBhbm90aGVyIHBhdGNoLsKgCj4+ID4gU2FuZGllCj4+
IEkgdGhpbmsgeW91IGRvbid0IHVuZGVyc3RhbmQgd2hhdCBZaXh1biBzYWlkLgo+PiBZb3Ugc2hv
dWxkIGFkZCBwaW5jdHJsIHByb3BlcnRpZXMgaGVyZSBsaWtlOgo+PiBwaW5jdHJsLTAgPSB4eHg7
Cj4+IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+wqAKPj4gV2hpbGUgdGhlIGJvb3Rsb2Fk
ZXIgaXMgZXhwZWN0ZWQgdG8gaW5pdGlhbGl6ZSB0aGUgVUFSVCBwaW5zLCBleHBsaWNpdGx5IGFk
ZGluZyB0aGUgcGluY3RybCBwcm9wZXJ0aWVzCj4+IGVuc3VyZXMgaGFyZHdhcmUgc3RhdGUgY29u
c2lzdGVuY3kuCj4+wqAKPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLSBUcm95Cj4+wqAKPgo+IFllcywgSSBrbm93IHRoaXMuCj4gSWYg
SSBhZGTCoAo+IMKgwqAgwqAgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IMKgwqAg
wqAgwqDCoCBwaW5jdHJsLTAgPSA8JnVhcnQwXzBfY2ZnPjsKPiBUaGVuIGFsc28gbmVlZCB0byBh
ZGQKPiAmcGluY3RybCB7Cj4gwqDCoCDCoCDCoMKgIHVhcnQwXzBfY2ZnOiB1YXJ0MC0wLWNmZyB7
Cj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIHVhcnQwLTAtcGlucyB7Cj4gwqDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIHBpbm11eCA9IDxLM19QQURDT05GKDE0OSwgMik+LCDC
oCDCoCDCoMKgIC8qIHVhcnQwIHR4ICovCj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCA8SzNfUEFEQ09ORigxNTAsIDIpPjsgwqAgwqAgwqDCoCAvKiB1
YXJ0MCByeCAqLwo+Cj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIGJpYXMt
cHVsbC11cDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAvKiBub3JtYWwgcHVs
bC11cCAqLwo+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBkcml2ZS1zdHJl
bmd0aCA9IDwyNT47IMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgLyogRFM4ICovCj4gwqDCoCDCoCDC
oCDCoCDCoCDCoCDCoMKgIH07Cj4gwqDCoCDCoCDCoMKgIH07Cj4gfTsKPiBCdXQgdGhpcyBwYXJ0
IGlzIGNvbW1vbiwgaXQgc2hvdWxkIGJlIGRlZmluZWQgaW4gY29tbW9uIHBpbmN0cmwgdGFibGUg
ImszLXBpbmN0cmwuZHRzaSIuIEFuZCB0aGlzIHBhcnQgaGFzbid0IGNvbWVkIHRvIFVwc3RyZWFt
LgpUaGlzIGxpbmUgZXhjZWVkcyAxMDAgY2hhcmFjdGVycwoKPiBJZiBJIGFkZCBpdCBjdXJyZW50
bHkswqAgV2hlbiBrMy1waW5jdHJsLmR0c2kgaXMgYWNjZXB0ZWQgYnkgVXBzdHJlYW0sIHdlIG5l
ZWQgdG8gcmVtb3ZlIGl0IGFnYWluLgo+IFNvIHdlIGp1c3QgZW1wdHkgaXQgZm9yIHNpbXBsZS4K
Tm8sIEl0IGxvb2tzIGxpa2UgeW91ciBiYXNlIGNvbW1pdCBpcyB3cm9uZy4KSXQgaGFzIGJlZW4g
bWVyZ2VkIGhlcmUgWzFdIHRoYXQgd2hhdCB5b3Ugc2FpZC4KCkJ5IHRoZSB3YXksIEkgbm90aWNl
ZCB0aGF0IHRoZSBuYW1lIGluIHlvdXIgJ0Zyb20nIGhlYWRlciBmb3IgdGhpcyByZXBseSBkb2Vz
bid0IG1hdGNoIHRoZSBvbmUgaW4KeW91ciBwYXRjaCBzdWJtaXNzaW9uLiBJdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQgdG8gYXZvaWQgYW55IGNvbmZ1c2lvbiBmb3Ig
dGhlCm1haW50YWluZXJzL3Jldmlld2VycyByZWdhcmRpbmcgdGhlIGF1dGhvcnNoaXAgb2YgdGhl
IHJlc3BvbnNlLgoKTGluazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE3NzM0MDgzMjUy
My4xNzA1MC4zMjM2MDYwNzYxNzU5NDMyNTEuYjQtdHlAa2VybmVsLm9yZy8gWzFdCgoKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
