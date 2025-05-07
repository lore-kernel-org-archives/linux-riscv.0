Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E51C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/EyK2j/91Xp14RzSSpuPqsIBXpwifPD10/DdnFxx8w=; b=4t+BgiPCHjQlO7
	bo/l6c/uwUJKye2cE0bukggbQO60hGxBKzsizJvtf+KceTK9JKdrEQjZJJ5vUqXW6mT610pBf0/yl
	zlRajmkxQn1X5Kyxmeg18ywbdjjUCvt0AiSHegWGpPTnrGfx6CHwCejedLCh9OViHvRGBwwUHbkm+
	6ICQ+X55GqLzM1pAoIgJELO34h69+O66OYwgeF1ckFBu3f2uHPWeIDPW+ji0LJ8h9mfjYz0sM+m1R
	vGrrZckKVBBKdU6GfriMGx7E9ws9zmaajJBonLwgRCDkA/I2wyGH8s+stZSHATH01FY6uK5AZFqC/
	p3Z81BbEZbZ0POKMdmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbv9-0000000F66R-2vhk;
	Wed, 07 May 2025 10:22:35 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbdI-0000000F3oD-0YOu
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 10:04:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250507100403euoutp01642e35a0f979ea660488d9a68d3fc41a~9NpT4khnh0941809418euoutp01L
	for <linux-riscv@lists.infradead.org>; Wed,  7 May 2025 10:04:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250507100403euoutp01642e35a0f979ea660488d9a68d3fc41a~9NpT4khnh0941809418euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746612243;
	bh=N32TfHVqNTkje4PcTK07rh/HIsJBsQBWcN1H8kWn9js=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JkPLRVWuHBDbxns/R/3DK8w87IPCtNOg2sGMoqr4GavTq/yF0viOnzZnBTs8ZrWI6
	 lYvhnCAFyq59EGWlnhGYpCXwQzDsHeXwqOD/orpLzP+waygrJJjzqYthmqoUeCMMKg
	 PCaedNImP5Y/Dbgr/zZOR/RRE7Oq68itdkMfRpGQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250507100403eucas1p1c31cf23f55512589a7663132f9f50778~9NpTWWOeV1269412694eucas1p11;
	Wed,  7 May 2025 10:04:03 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250507100402eusmtip2f16f3da88a0473dad88a4f960a19539c~9NpSR_l2o2857428574eusmtip2I;
	Wed,  7 May 2025 10:04:02 +0000 (GMT)
Message-ID: <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
Date: Wed, 7 May 2025 12:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
To: Stephen Boyd <sboyd@kernel.org>, Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <c46de621e098b7873a00c1af4ca550a1@kernel.org>
X-CMS-MailID: 20250507100403eucas1p1c31cf23f55512589a7663132f9f50778
X-Msg-Generator: CA
X-RootMTR: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-EPHeader: CA
X-CMS-RootMailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
	<20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1>
	<17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
	<9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
	<475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
	<c46de621e098b7873a00c1af4ca550a1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_030408_742396_280D2191 
X-CRM114-Status: GOOD (  24.88  )
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

CgpPbiA1LzYvMjUgMjM6MzAsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPiBRdW90aW5nIE1pY2hhbCBX
aWxjenluc2tpICgyMDI1LTA0LTMwIDAwOjUyOjI5KQo+Pgo+PiBJbiB0aGUgdjIgdmVyc2lvbiBv
ZiB0aGUgcGF0Y2hzZXQsIHRoZXJlIHdhcyBubyByZXNldCBjb250cm9sbGVyIHlldCwgc28KPj4g
SSB0aG91Z2h0IHlvdXIgY29tbWVudCB3YXMgbWFkZSByZWZlcnJpbmcgdG8gdGhhdCBlYXJsaWVy
IHZlcnNpb24uCj4+IFRoaXMgcmVwcmVzZW50YXRpb24gY2xlYXJseSBkZXNjcmliZXMgdGhlIGhh
cmR3YXJlIGNvcnJlY3RseSwgd2hpY2ggaXMKPj4gdGhlIHJlcXVpcmVtZW50IGZvciB0aGUgRGV2
aWNlIFRyZWUuCj4+Cj4+IFRoZSBtYW51YWwsIGluIHNlY3Rpb24gNS40LjEuNiBWT19TVUJTWVMs
IGRlc2NyaWJlcyB0aGUgcmVzZXQgcmVnaXN0ZXJzCj4+IHN0YXJ0aW5nIGF0IDB4RkZfRUY1Ml84
MDAwOgo+Pgo+PiBHUFVfUlNUX0NGRyAgICAgICAgICAgICAweDAwCj4+IERQVV9SU1RfQ0ZHICAg
ICAgICAgICAgIDB4MDQKPj4gTUlQSV9EU0kwX1JTVF9DRkcgICAgICAgMHg4Cj4+IE1JUElfRFNJ
MV9SU1RfQ0ZHICAgICAgIDB4Ywo+PiBIRE1JX1JTVF9DRkcgICAgICAgICAgICAweDE0Cj4+IEFY
STRfVk9fRFdfQVhJICAgICAgICAgIDB4MTgKPj4gWDJIX1g0X1ZPU1lTX0RXX0FYSV9YMkggMHgy
MAo+Pgo+PiBBbmQgdGhlIGNsb2NrIHJlZ2lzdGVycyBmb3IgVk9fU1VCU1lTLCBtYW51YWwgc2Vj
dGlvbiA0LjQuMS42IHN0YXJ0IGF0IG9mZnNldCAweDUwOgo+PiBWT1NZU19DTEtfR0FURSAgICAg
ICAgICAweDUwCj4+IFZPU1lTX0NMS19HQVRFMSAgICAgICAgIDB4NTQKPj4gVk9TWVNfRFBVX0ND
TEtfQ0ZHMCAgICAgMHg2NAo+PiBURVNUX0NMS19GUkVRX1NUQVQgICAgICAweGM0Cj4+IFRFU1Rf
Q0xLX0NGRyAgICAgICAgICAgIDB4YzgKPj4KPj4gU28gSSBjb25zaWRlcmVkIHRoaXMgYmFjayB0
aGVuIGFuZCB0aG91Z2h0IGl0IHdhcyBhcHByb3ByaWF0ZSB0byBkaXZpZGUKPj4gaXQgaW50byB0
d28gbm9kZXMsIGFzIHRoZSByZXNldCBub2RlIHdhc24ndCBiZWluZyBjb25zaWRlcmVkIGF0IHRo
YXQKPj4gdGltZS4KPj4KPj4gV2hlbiBsb29raW5nIGZvciB0aGUgcmVmZXJlbmNlIFsxXSwgSSBk
aWRuJ3Qgbm90aWNlIGlmIHlvdSBjb3JyZWN0ZWQKPj4geW91cnNlbGYgbGF0ZXIsIGJ1dCBJIGRv
IHJlbWVtYmVyIGNvbnNpZGVyaW5nIHRoZSBzaW5nbGUtbm9kZSBhcHByb2FjaAo+PiBhdCB0aGUg
dGltZS4KPj4KPiAKPiBJZiB0aGUgdHdvIHJlZ2lzdGVyIHJhbmdlcyBkb24ndCBvdmVybGFwIHRo
ZW4gdGhpcyBpcyBwcm9iYWJseSBPSy4gSQo+IGltYWdpbmUgdGhpcyBpcyBvbmUgZGV2aWNlIHNo
aXBwZWQgYnkgdGhlIGhhcmR3YXJlIGVuZ2luZWVyLCBWT19TVUJTWVMsCj4gd2hpY2ggaGFwcGVu
cyB0byBiZSBhIGNsb2NrIGFuZCByZXNldCBjb250cm9sbGVyLiBUaGlzIGlzIHF1aXRlIGNvbW1v
biwKPiBhbmQgd2UgdXN1YWxseSBoYXZlIG9uZSBub2RlIHdpdGggYm90aCAjY2xvY2stY2VsbHMg
YW5kICNyZXNldC1jZWxscyBpbgo+IGl0LiBUaGVuIHdlIHVzZSB0aGUgYXV4aWxpYXJ5IGJ1cyB0
byBjcmVhdGUgdGhlIHJlc2V0IGRldmljZSBmcm9tIHRoZQo+IGNsayBkcml2ZXIgd2l0aCB0aGUg
c2FtZSBub2RlLiBUaGlzIGhlbHBzIG1hdGNoIHRoZSBkZXZpY2UgaW4gdGhlCj4gZGF0YXNoZWV0
IHRvIHRoZSBub2RlIGFuZCBjb21wYXRpYmxlIGluIERUIHdpdGhvdXQgbWFraW5nIHRoZSBjb21w
YXRpYmxlCj4gcHJvdmlkZXIgc3BlY2lmaWMgKGNsayBvciByZXNldCBwb3N0Zml4KS4KPiAKPiBU
aGF0J3MgYW5vdGhlciByZWFzb24gd2h5IHdlIHVzdWFsbHkgaGF2ZSBvbmUgbm9kZS4gRFQgZG9l
c24ndCBkZXNjcmliZQo+IHNvZnR3YXJlLCBpLmUuIHRoZSBzcGxpdCBiZXR3ZWVuIGNsayBhbmQg
cmVzZXQgZnJhbWV3b3JrcyBtYXkgbm90IGV4aXN0Cj4gaW4gb3RoZXIgb3BlcmF0aW5nIHN5c3Rl
bXMuIFdlIGRvbid0IHdhbnQgdG8gcHV0IHRoZSBzb2Z0d2FyZSBkZXNpZ24KPiBkZWNpc2lvbnMg
aW50byB0aGUgRFQuCj4gCj4gSXQgbWF5IGFsc28gYmUgdGhhdCBhIGRldmljZSBsaWtlIHRoaXMg
Y29uc3VtZXMgc2hhcmVkIHBvd2VyIHJlc291cmNlcwo+IGxpa2UgY2xrcyBvciByZWd1bGF0b3Jz
IHRoYXQgbmVlZCB0byBiZSBlbmFibGVkIHRvIGRyaXZlIHRoZSBkZXZpY2UsIG9yCj4gYW4gSU9N
TVUgaXMgdXNlZCB0byB0cmFuc2xhdGUgdGhlIHJlZ2lzdGVyIG1hcHBpbmdzLiBXZSB3b3VsZG4n
dCB3YW50IHRvCj4gc3BsaXQgdGhlIGRldmljZSBpbiBEVCBpbiB0aGF0IGNhc2Ugc28gd2UgY2Fu
IGVhc2lseSBtYW5hZ2UgdGhlIHBvd2VyCj4gcmVzb3VyY2VzIG9yIG1lbW9yeSBtYXBwaW5ncyBm
b3IgdGhlIGRldmljZS4KPiAKPiBUTDtEUjogVGhpcyBpcyBwcm9iYWJseSBPSywgYnV0IEknZCBi
ZSBjYXJlZnVsIHRvIG5vdCBtYWtlIGl0IGEgdGhpbmcuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZv
ciB0aGUgY29tcHJlaGVuc2l2ZSBleHBsYW5hdGlvbi4gQmVjYXVzZSB0aGUKcmVnaXN0ZXJzIGRv
buKAmXQgb3ZlcmxhcCwgaXTigJlzIGZpbmUgaW4gdGhpcyBjYXNlLiBTaW5jZSBEcmV3IGFsc28g
c2VlbSB0bwphZ3JlZSwgd2UgY2FuIHByb2JhYmx5IHB1c2ggdGhlc2UgcGF0Y2hlcyBmb3J3YXJk
LCB3aGlsZSBrZWVwaW5nIGluIG1pbmQKdGhhdCBmb3IgZnV0dXJlIFNvQ3MgaXQgd291bGQgYmUg
YmV0dGVyIHRvIHVzZSBhIHNpbmdsZSBub2RlLgoKPiAKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hh
bCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
