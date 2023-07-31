Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA3AC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 05:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuKNmqJhoV1OZbDtPZUpA1VnOaISGcyGswBKVBHwVMQ=; b=H95CxWf+eVT8rU
	+aVdK8kVp4BPMCRWpjjVG9zYxOxyBqCOJadvAzrxlfYQz81qoWAkbJIg0hxA/ByXA3SpqbHE1bsCl
	2VirvMP4lNeRpF4tyw46uysyEB+ja791gA+xXYP+biAgrdTMCW1fH3u+3c2OyfIft5I2WBIqLmBwa
	EdeW075S5W3pTMBnPg74J2/kRJbQyA5OfMk1nhQSXF/sBFk6eZDIZvYCgT4Bv15fBqBkL2BAgocE/
	pQJispLapNIfcUYpc46CYOSi3dXQfBpjwx0UpZKws4xbZD1pmfGODKfjMGip5Iiqus4zA862nnKu2
	57xXhI0ndyQe7+NVKLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQLdR-00DzAH-0c;
	Mon, 31 Jul 2023 05:40:01 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQLdO-00Dz99-2S
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 05:40:00 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7F2155C0103;
	Mon, 31 Jul 2023 01:39:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 31 Jul 2023 01:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1690781992; x=1690868392; bh=UrQ44egSsYKrgrC8lXSaEIOM2nJnUB+IsN4
	O98912zA=; b=db2uzzxQtgivo508fRTO8f4XT0UETH9ryLw+9yH+LWGIeJWJsCJ
	HyAkf5A99D/hyoKbJOko/ceLBuwZp2QtRooFcET2ZSJwaqbE4XTiUv+2ML8KaYYr
	tt8Ij6oLz9J3q18bAAOJaYnkH6yKUrILmwSFmfJM13iSYvenRqhyQQqGJh7PJCgB
	Kk6ktQNggVLNepXFQkg9hrbSvPSYoyF9eAs0xMuHa3xVMrzH5dMfaQUjEpSG2CHo
	mZKgUWbVbnZpTXQCcByWUxXsR5+0RmMUIfNBtlHVn4/qTnbVbb6vHbK6G5qFeXe9
	dlcwt1USgct6rxxQiGj/1DBjCiZXcngSYUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1690781992; x=1690868392; bh=UrQ44egSsYKrgrC8lXSaEIOM2nJnUB+IsN4
	O98912zA=; b=SfnVnfPXXL3mwHIIIuxPP6P+wTbpKu+T6nwkEpJpH+uTqi10iQl
	lD6rkBhcUmKB0he2oTsKCEaftfGrtSaqsYJM+K8d3W2oSMvoD56zpeUQ3WlPSzr3
	4MWl9xiznEpkINcxm8BeUmkGejh123fEjEY9a9Q6EiELNqwX+K5H0uNMTMXeMi1b
	JnnccxzQVYFYS79Uib2hmQXRRlKzYLqdciQvM7zVwq/JtGNDe1MqWdreZGZw1elt
	XNvMJ+M7dCsV1mGGKcvWo/CJ+pU39XDBGqIImYfqgc4OBunU2MmKSzOG8UxRRUhU
	MhYl+QjUDC6CfSnaepOeCe5ZcXCZKyfmNrg==
X-ME-Sender: <xms:JknHZOMr2B4otX3Whv5p7QD31LWKZOV1ZByR19K3gtbtUbPwFhNm7g>
    <xme:JknHZM-9svD2oW6dTXmKjS-jUEVrQ_rqiGBAenlNEiBElmdzYvvw6omz1MiwHqp_3
    4_celspL1uzJzMXq0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjedvgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JknHZFQj14YdLw_Py2F6LCjGho0W-InNWUSUf3BIsHyO6kNrRQGrag>
    <xmx:JknHZOvuqmGJScNtxpxYPB1lJNKlYCo_xghCmtbd94kWOGCl2Sv2fA>
    <xmx:JknHZGegVm_0iakLrtjFQGm0TP735QzgOq6DLHfE1nSsO160ldBXew>
    <xmx:KEnHZJUFsthMA4fissNqKUiT-ALEs3M42gkkAfH9V-DqtYFiAL0ZOw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CC613B60089; Mon, 31 Jul 2023 01:39:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <8b3466e4-a295-4249-bd05-2edbf7b3f6e3@app.fastmail.com>
In-Reply-To: <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker>
 <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
 <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
 <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
Date: Mon, 31 Jul 2023 07:39:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>,
 "Jisheng Zhang" <jszhang@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 "Christoph Hellwig" <hch@infradead.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache operations
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_223959_115028_F03256D3 
X-CRM114-Status: GOOD (  18.80  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMsIGF0IDAyOjQ5LCBHdW8gUmVuIHdyb3RlOgo+IE9uIE1vbiwg
SnVsIDMxLCAyMDIzIGF0IDQ6MzbigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4KPj4gT24gU3VuLCBKdWwgMzAsIDIwMjMsIGF0IDE3OjQyLCBFbWlsIFJlbm5lciBC
ZXJ0aGluZyB3cm90ZToKPj4gPiBPbiBTdW4sIDMwIEp1bCAyMDIzIGF0IDE3OjExLCBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiA+PiA+ICsKPj4gPj4gPiAg
c3RhdGljIGlubGluZSB2b2lkIGFyY2hfZG1hX2NhY2hlX3diYWNrKHBoeXNfYWRkcl90IHBhZGRy
LCBzaXplX3Qgc2l6ZSkKPj4gPj4gPiAgewo+PiA+PiA+ICAgICAgIHZvaWQgKnZhZGRyID0gcGh5
c190b192aXJ0KHBhZGRyKTsKPj4gPj4gPgo+PiA+PiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX05P
TlNUQU5EQVJEX0NBQ0hFX09QUwo+PiA+PiA+ICsgICAgIGlmICh1bmxpa2VseShub25jb2hlcmVu
dF9jYWNoZV9vcHMud2JhY2spKSB7Cj4+ID4+Cj4+ID4+IEknbSB3b3JyaWVkIGFib3V0IHRoZSBw
ZXJmb3JtYW5jZSBpbXBhY3QgaGVyZS4KPj4gPj4gRm9yIHVuaWZpZWQga2VybmVsIEltYWdlIHJl
YXNvbiwgUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTIHdpbGwgYmUKPj4gPj4gZW5hYmxlZCBi
eSBkZWZhdWx0LCBzbyBzdGFuZGFyZCBDTU8gYW5kIFQtSEVBRCdzIENNTyBwbGF0Zm9ybSdzCj4+
ID4+IHBlcmZvcm1hbmNlIHdpbGwgYmUgaW1wYWN0ZWQsIGJlY2F1c2UgZXZlbiBhbiB1bmxpa2Vs
eSBpcyBwdXQKPj4gPj4gaGVyZSwgdGhlIGNoZWNrIGFjdGlvbiBzdGlsbCBuZWVkcyB0byBiZSBk
b25lLgo+PiA+Cj4+ID4gT24gSVJDIEkgYXNrZWQgd2h5IG5vdCB1c2UgYSBzdGF0aWMga2V5IHNv
IHRoZSBvdmVyaGVhZCBpcyBqdXN0IGEKPj4gPiBzaW5nbGUgbm9wIHdoZW4gdGhlIHN0YW5kYXJk
IENNTyBvcHMgYXJlIGF2YWlsYWJsZSwgYnV0IHRoZSBjb25zZW5zdXMKPj4gPiBzZWVtZWQgdG8g
YmUgdGhhdCB0aGUgZmx1c2hpbmcgd291bGQgY29tcGxldGVseSBkb21pbmF0ZSB0aGlzIGJyYW5j
aC4KPj4gPiBBbmQgb24gcGxhdGZvcm1zIHdpdGggdGhlIHN0YW5kYXJkIENNTyBvcHMgdGhlIGJy
YW5jaCBiZSBjb3JyZWN0bHkKPj4gPiBwcmVkaWN0ZWQgYW55d2F5Lgo+Pgo+PiBOb3QganVzdCB0
aGUgZmx1c2hpbmcsIGJ1dCBhbHNvIGxvYWRpbmcgYmFjayB0aGUgaW52YWxpZGF0ZWQKPj4gY2Fj
aGUgbGluZXMgYWZ0ZXJ3YXJkcyBpcyBqdXN0IHZlcnkgZXhwZW5zaXZlLiBJIGRvbid0IHRoaW5r
Cj4+IHlvdSB3b3VsZCBiZSBhYmxlIHRvIG1lYXN1cmUgYSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IHN0YXRpYwo+PiBrZXkgYW5kIGEgY29ycmVjdGx5IHByZWRpY3RlZCBicmFuY2ggb24gYW55IHJl
bGV2YW50IHVzZWNhc2UgaGVyZS4KPiBNYXliZSB3ZSBzaG91bGQgbW92ZSBDTU8gJiBUSEVBRCBv
cHMgdG8gdGhlIG5vbmNvaGVyZW50X2NhY2hlX29wcywgYW5kCj4gb25seSBrZWVwIG9uZSBvZiB0
aGVtLgo+Cj4gSSBwcmVmZXIgbm9uY29oZXJlbnRfY2FjaGVfb3BzLCBpdCdzIG1vcmUgbWFpbnRh
bmNlIHRoYW4gQUxURVJOQVRJVkUuCgpJIHRoaW5rIG1vdmluZyB0aGUgVEhFQUQgb3BzIGF0IHRo
ZSBzYW1lIGxldmVsIGFzIGFsbCBub25zdGFuZGFyZApvcGVyYXRpb25zIG1ha2VzIHNlbnNlLCBi
dXQgSSdkIHN0aWxsIGxlYXZlIENNTyBhcyBhbiBleHBsaWNpdApmYXN0IHBhdGggdGhhdCBhdm9p
ZHMgdGhlIGluZGlyZWN0IGJyYW5jaC4gVGhpcyBzZWVtcyBsaWtlIHRoZSByaWdodAp0aGluZyB0
byBkbyBib3RoIGZvciByZWFkYWJpbGl0eSBhbmQgZm9yIHBsYXRmb3JtcyBvbiB3aGljaCB0aGUK
aW5kaXJlY3QgYnJhbmNoIGhhcyBhIG5vdGljZWFibGUgb3ZlcmhlYWQuCgogICAgQXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
