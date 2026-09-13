Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BC5C88E63
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZ4ylp4JWnZIJ7FRuv/0XCkQyfD5GN2n/LUsrezQbd0=; b=CRH0OdPXLmcsOF
	DWucVOaeE3r1WhKaWA6CTilME64p3GXO21vUUTD/Kra6u1vThustuAiNX/5QI0O/EUZW/DNjIXzvL
	rsMLOTDiLjSUSecXwld36swuPezbpc58OPfASNgQniGjCPqr5nlGVeMe8rLF0eRx1hPM5yelaIreV
	w1xQ9NGjNLLmIvAXIiv8gdOOfBgVJIlKBgn5/8N3CVNUeSIWS1q/7EdRQA5dmlrHA5ktahqjnroWE
	MXf7NVUxzARjYHbmgvr3FHY5hoIFzBIi/p6RzIGibsgF/8s32gwmsspMAc5I34YZZrmJxIxfykMjh
	JaOzbAWIA/Px1nQ+yDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ozS-00000001uvN-2zjm;
	Sun, 13 Sep 2026 18:31:46 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ozP-00000001urZ-0HaC;
	Sun, 13 Sep 2026 18:31:45 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id AAD2ACF9C9;
	Sun, 13 Sep 2026 21:31:33 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro AAD2ACF9C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789324295;
	bh=9dER/J/8MdqEP/M3Ls+38r00y1seRCBppFrIe7sL3Ak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YcbeyvW7sSnnTfZTr/uCbcnFTlenGpzO6ymRZncRXn46x5A4ETMeyTu1u76htinxb
	 HNHqDW2pA2lRL/+B2wINBujBetFK7t8nC33MvgFUaud2K1lH65XirYDPGFGST8KBg0
	 P/Yqj8zKBqNjaNnkjfdpGsyVrylFggefTJykvBAdpRuuzNA/ZzXuia19AL3vHJvZ+R
	 ehkm+GzmviHEaV5QJJM2J4q7lpReWTj/n+ksNLXKSwgzFCTpHC3oyE9Ncbl2b0ADvv
	 7B4ICR/9eRUXKwBAvUdwCoetgsY8bJI3OLvb7LsQISqBExAXXfOQSHi6iCtfeyMRox
	 2WGKHRSqJDAsQ==
Message-ID: <159c52926a01c84a24d039b234bd1d3450fe5a9c.camel@rendec.net>
Subject: Re: [PATCH 02/14] irqchip: fix typos in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Paul
 Walmsley	 <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Linus Walleij	 <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Date: Sun, 13 Sep 2026 14:31:32 -0400
In-Reply-To: <20260907065328.32009-1-hemanth.selam@gmail.com>
References: <20260907065328.32009-1-hemanth.selam@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_113143_289585_5D96CC90 
X-CRM114-Status: GOOD (  19.32  )
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

T24gTW9uLCAyMDI2LTA5LTA3IGF0IDEyOjIzICswNTMwLCBIZW1hbnRoIFNlbGFtIHdyb3RlOgo+
IEZpeCB0eXBvcyBpbiBjb21tZW50cywgcmVwb3J0ZWQgYnkgc2NyaXB0cy9jaGVja3BhdGNoLnBs
IHVzaW5nIHRoZQo+IG1pc3NwZWxsaW5nIGxpc3QgaW4gc2NyaXB0cy9zcGVsbGluZy50eHQuwqAg
T25seSB0b3VjaGVzIGNvbW1lbnRzLCBubyBjb2RlCj4gY2hhbmdlcy4KPiAKPiBBc3Npc3RlZC1i
eTogQ3Vyc29yOmNsYXVkZS1vcHVzLTUKPiBTaWduZWQtb2ZmLWJ5OiBIZW1hbnRoIFNlbGFtIDxo
ZW1hbnRoLnNlbGFtQGdtYWlsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtbXRr
LWNpcnEuY8KgwqDCoCB8IDIgKy0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMu
YyB8IDIgKy0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtdmljLmPCoMKgwqDCoMKgwqDCoMKgIHwg
MiArLQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpUaGUgY2hhbmdlcyBsb29rIGdvb2QsIGJ1dCBpbiBteSBvcGluaW9uIHNob3VsZCBiZSBzcGxp
dCBpbnRvIDMKZGlmZmVyZW50IHBhdGNoZXMsIG9uZSBwZXIgZHJpdmVyLCBhbmQgZ3JvdXBlZCBp
bnRvIGEgc2VyaWVzLiBOb3QgdGhhdAppdCBtYXR0ZXJzIHRvbyBtdWNoIGluIHRoaXMgcGFydGlj
dWxhciBjYXNlICh3aGVyZSBvbmx5IGNvbW1lbnRzIGFyZQp0b3VjaGVkKSwgYnV0IGl0J3MgY29t
bW9uIHByYWN0aWNlIGluIHRoZSBMaW51eCBrZXJuZWwgZGV2ZWxvcG1lbnQuCgpUaGVyZSBhcmUg
bXVsdGlwbGUgcmVhc29ucy4gVGhlIG1haW4gb25lIGlzIHRoYXQgZGlmZmVyZW50IGRyaXZlcnMg
Y2FuCmJlIHJldmlld2VkL21haW50YWluZWQgYnkgZGlmZmVyZW50IHBlb3BsZSwgYW5kIHBhdGNo
ZXMgdG8gdGhlbSBtYXkgYmUKcGlja2VkIHVwIHZpYSBkaWZmZXJlbnQgKEdpdCkgbWFpbnRhaW5l
ciB0cmVlcy4gQWxzbywgc29tZSBjb21wYW5pZXMKc2VsZWN0aXZlbHkgcG9ydCBwYXRjaGVzIGFn
YWluc3Qgc3BlY2lmaWMgZHJpdmVycyB0byB0aGUga2VybmVsIHRyZWVzCnRoZXkgbWFpbnRhaW4u
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLW10ay1jaXJxLmMgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLW10ay1jaXJxLmMKPiBpbmRleCA5MTRkMWQ2MzlmZTMuLmQzMGMzNGNlMGY1
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLW10ay1jaXJxLmMKPiArKysgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLW10ay1jaXJxLmMKPiBAQCAtMjQ3LDcgKzI0Nyw3IEBAIHN0YXRp
YyBpbnQgbXRrX2NpcnFfc3VzcGVuZCh2b2lkICpkYXRhKQo+IMKgCQl3cml0ZWxfcmVsYXhlZCht
YXNrLCByZWcpOwo+IMKgCX0KPiDCoAo+IC0JLyogc2V0IGVkZ2Vfb25seSBtb2RlLCByZWNvcmQg
ZWRnZS10cmlnZ2VyZCBpbnRlcnJ1cHRzICovCj4gKwkvKiBzZXQgZWRnZV9vbmx5IG1vZGUsIHJl
Y29yZCBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHRzICovCj4gwqAJLyogZW5hYmxlIGNpcnEgKi8K
PiDCoAlyZWcgPSBtdGtfY2lycV9yZWcoY2lycV9kYXRhLCBDSVJRX0NPTlRST0wpOwo+IMKgCXZh
bHVlID0gcmVhZGxfcmVsYXhlZChyZWcpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXNpZml2ZS1wbGljLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMKPiBp
bmRleCA1YjBkYWMxMDQ4MTQuLmE3Y2RkYWRkZGY0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLXNpZml2ZS1wbGljLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2
ZS1wbGljLmMKPiBAQCAtNDUyLDcgKzQ1Miw3IEBAIHN0YXRpYyBpcnFfaHdfbnVtYmVyX3QgY3Ax
MDBfZ2V0X2h3aXJxKHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIsIHZvaWQgX19pb21lCj4g
wqAJCXJldHVybiAwOwo+IMKgCj4gwqAJLyoKPiAtCSAqIEludGVycnVwdHMgZGVsaWV2ZXJlZCB0
byBoYXJkd2FyZSBzdGlsbCBiZWNvbWUgcGVuZGluZywgYnV0IG9ubHkKPiArCSAqIEludGVycnVw
dHMgZGVsaXZlcmVkIHRvIGhhcmR3YXJlIHN0aWxsIGJlY29tZSBwZW5kaW5nLCBidXQgb25seQo+
IMKgCSAqIGludGVycnVwdHMgdGhhdCBhcmUgYm90aCBwZW5kaW5nIGFuZCBlbmFibGVkIGNhbiBi
ZSBjbGFpbWVkLgo+IMKgCSAqIENsZWFyaW5nIHRoZSBlbmFibGUgYml0IGZvciBhbGwgaW50ZXJy
dXB0cyBidXQgdGhlIGZpcnN0IHBlbmRpbmcKPiDCoAkgKiBvbmUgYXZvaWRzIGEgaGFyZHdhcmUg
YnVnIHRoYXQgb2NjdXJzIGR1cmluZyByZWFkIGZyb20gdGhlIGNsYWltCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtdmljLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXZpYy5jCj4g
aW5kZXggZTM4MTA0YzUwNjRlLi42MDdlMzI4NGY3MDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS12aWMuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtdmljLmMKPiBAQCAt
NDc4LDcgKzQ3OCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBfX3ZpY19pbml0KHZvaWQgX19pb21l
bSAqYmFzZSwgaW50IHBhcmVudF9pcnEsIGludCBpcnFfc3RhcnQsCj4gwqAvKioKPiDCoCAqIHZp
Y19pbml0KCkgLSBpbml0aWFsaXNlIGEgdmVjdG9yZWQgaW50ZXJydXB0IGNvbnRyb2xsZXIKPiDC
oCAqIEBiYXNlOiBpb21lbSBiYXNlIGFkZHJlc3MKPiAtICogQGlycV9zdGFydDogc3RhcnRpbmcg
aW50ZXJydXB0IG51bWJlciwgbXVzdCBiZSBtdWxpcGxlIG9mIDMyCj4gKyAqIEBpcnFfc3RhcnQ6
IHN0YXJ0aW5nIGludGVycnVwdCBudW1iZXIsIG11c3QgYmUgbXVsdGlwbGUgb2YgMzIKPiDCoCAq
IEB2aWNfc291cmNlczogYml0bWFzayBvZiBpbnRlcnJ1cHQgc291cmNlcyB0byBhbGxvdwo+IMKg
ICogQHJlc3VtZV9zb3VyY2VzOiBiaXRtYXNrIG9mIGludGVycnVwdCBzb3VyY2VzIHRvIGFsbG93
IGZvciByZXN1bWUKPiDCoCAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
