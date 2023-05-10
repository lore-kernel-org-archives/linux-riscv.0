Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08840C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq97tsnyFuwuDWMED8/6xrQ0ZwOMlq1m0r1jDNU0V2A=; b=MV8z8S+EvtHVeq
	cwLnIqacIlHTmIE+7a21XX9XRm1PgS1hqnTVLErJxb+38ZC+BtsSVVj6SPJcS8bCTWFKbBMiEZsyk
	VCI9hHVUBY5Bq3bW5QSE/Kj4mTxC31ZuG5tKGx6GIJInS8iK3l215Z/OvyexbXebHKuUEx6Z7xf/e
	gt0SIV70K7XQAj9jSeHYtIsIhD8Y4w3ueQAlqJNMsrOCtJqgg9pmBUacue4CGijpf0WoCysSNZ9Ut
	BX7DvZYCL2VrwGms+z1oyROBLe6yuS55iia+X4OT8z8eBX9Wt/LBRMNm3faI7a8SQe9SvVR5/Qmxa
	+EWI9VJrbVff9UVqxZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgow-005jUn-2v;
	Wed, 10 May 2023 10:13:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgot-005jU0-1B;
	Wed, 10 May 2023 10:13:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE051063;
	Wed, 10 May 2023 03:13:56 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 217DA3F5A1;
	Wed, 10 May 2023 03:13:09 -0700 (PDT)
Date: Wed, 10 May 2023 11:13:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Maxim Kiselev' <bigunclemax@gmail.com>, Icenowy Zheng
 <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Mark Brown
 <broonie@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner
 <heiko.stuebner@vrull.eu>, Maxime Ripard <mripard@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
Message-ID: <20230510111306.52e30f26@donnerap.cambridge.arm.com>
In-Reply-To: <1592f46b0f794b24a87a964d7208da68@AcuMS.aculab.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
	<20230506232616.1792109-3-bigunclemax@gmail.com>
	<702d085b3b814759a344886364c518f8@AcuMS.aculab.com>
	<CALHCpMh84Q8RAh2Y+cHzAvsm4h5zBZY=9fPF6OVmtLNvX+ePxQ@mail.gmail.com>
	<1592f46b0f794b24a87a964d7208da68@AcuMS.aculab.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_031315_497958_E8B1BC8D 
X-CRM114-Status: GOOD (  31.92  )
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

T24gV2VkLCAxMCBNYXkgMjAyMyAwODo1NToyNyArMDAwMApEYXZpZCBMYWlnaHQgPERhdmlkLkxh
aWdodEBBQ1VMQUIuQ09NPiB3cm90ZToKCkhpIERhdmlkLAoKPiBGcm9tOiBNYXhpbSBLaXNlbGV2
Cj4gPiBTZW50OiAxMCBNYXkgMjAyMyAwOTozNAo+ID4gCj4gPiBIaSwgRGF2aWQKPiA+ICAgCj4g
PiA+IElzIGl0IHdvcnRoIGRvaW5nIGEgc3RydWN0dXJlIGNvcHkgYXQgdGhpcyBwb2ludD8KPiA+
ID4gVGhlICdjZmcnIGRhdGEgaXMgc2hvcnQgYW5kIGNvbnN0YW50IGFuZCBpdCB3b3VsZCBtYWtl
CgpTb3JyeSwgSSBkb24ndCByZWFsbHkgZ2V0IHRoZSByZWFzb24gZm9yIHRoaXMuIFNpbmNlIHRo
ZSBkYXRhIGlzIGNvbnN0YW50LAp3b3VsZG4ndCBpdCBtYWtlIG11Y2ggbW9yZSBzZW5zZSB0byBr
ZWVwIGl0IHRoZXJlIGluIHRoZSBjb25zdCBzZWN0aW9uLAp3aGljaCB3ZSBuZWVkIGFueXdheT8g
V2hhdCB3b3VsZCBhIHNlY29uZCBjb3B5IGJyaW5nIHVzPwoKPiA+ID4gdGhlIGNvZGUgdGhhdCB1
c2VzIGl0IHNtYWxsZXIgYW5kIGZhc3Rlci4gIAoKU21hbGxlcjogRG8geW91IG1lYW4gdGhlIGdl
bmVyYXRlZCBjb2RlPyBOb3Qgc3VyZSB0aGF0IHJlYWxseSBtYXR0ZXJzLCBidXQKeW91ciBza2V0
Y2ggYmVsb3cgaGludHMgdGhhdCB0aGUgQyBjb2RlIHdvdWxkIGdldCBsYXJnZXIsIG1vcmUgZXJy
b3IgcHJvbmUKKHlvdSBtZW50aW9uIHlvdXJzZWxmIHRoYXQgeW91IHNraXBwZWQgb3ZlciB0aGUg
ZXJyb3IgY2hlY2tpbmcpIGFuZCBtb3N0CmltcG9ydGFudGx5IGhhcmRlciB0byByZWFkLgoKRmFz
dGVyOiBEbyB5b3UgaGF2ZSBudW1iZXJzIHRoYXQgYmFjayB0aGF0IHVwLCBvciBkb2VzIHRoYXQg
c29sdmUgYQpwYXJ0aWN1bGFyIHByb2JsZW0gb2YgeW91cnM/ClRoaXMgaXMgcHJvZ3JhbW1pbmcg
YSBTUEkgY29udHJvbGxlciB0cmFuc2Zlciwgd2hpY2ggcnVucyBpbiB0aGUgdmljaW5pdHkKb2Yg
YSBmZXcgTWJpdHMvcy4gSSBkb3VidCB0aGF0IHNhdmluZyBhIGZldyBtZW1vcnkgYWNjZXNzZXMg
KG9uY2UKcGVyIHRyYW5zZmVyLCBub3QgcGVyIHdvcmQpIG1hdHRlcnMgZXZlbiB0aGUgc2xpZ2h0
ZXN0PwpUaGUgYWN0dWFsIE1NSU8gYWNjZXNzIHRvIHByb2dyYW0gdGhlIGNvbnRyb2xsZXIgcmVn
aXN0ZXJzIGFscmVhZHkgdGFrZXMKYSBmZXcgZG96ZW4gdG8gYSBmZXcgaHVuZHJlZCBjeWNsZXMs
IHNvIEkgZG91YnQgdGhhdCBkb2luZyBhIHN0cnVjdCBjb3B5CnNhdmVzIHVzIGFueXRoaW5nIGhl
cmUsIGluIHByYWN0aWNlLgoKQmVzaWRlczogQ29weWluZyB0aGUgcG9pbnRlciBpcyB0aGUgbW9z
dCBjb21tb24gcGF0dGVybiBpbiB0aGUga2VybmVsLCBJCmJlbGlldmUuIEkganVzdCBzYW1wbGVk
IDIxIFNQSSBkcml2ZXJzIGluIHRoZSB0cmVlLCAxNyBvdXQgb2YgdGhlbSBkbwp0aGlzLiBUaGUg
b3RoZXIgZWl0aGVyIGNvcHkgdGhlIG1lbWJlcnMgb2YgdGhlIHN0cnVjdCBpbnRvIHRoZSBkcml2
ZXIgZGF0YQood2hpY2ggd291bGQgYmUgYW4gb3B0aW9uIGZvciB1cywgdG9vKSwgb3IgaW1tZWRp
YXRlbHkgY29uc3VtZSB0aGUgZGF0YSBpbgp0aGUgcHJvYmUoKSByb3V0aW5lLgoKSWYgeW91IGhh
dmUgc29tZSBnb29kIHJlYXNvbiB0byBvcHRpbWlzZSB0aGlzLCBwbGVhc2Ugc2VuZCBhIHBhdGNo
IChvbgp0b3ApLgoKQ2hlZXJzLApBbmRyZS4KCj4gPiAKPiA+IEknbSBzb3JyeSBidXQgSSBkb24n
dCBmdWxseSB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nLgo+ID4gSW4gcGF0Y2gg
M1w1IHdlIGV4dGVuZCB0aGUgc3VuNmlfc3BpX2NmZyBzdHJ1Y3R1cmUgd2l0aCB0aGUgaGFzX2Ns
a19jdGwgZmllbGQuICAKPiAKPiBZb3UgYXJlIHN0aWxsIG9ubHkgYWRkaW5nIGEgc2Vjb25kIGlu
dGVnZXIuCj4gCj4gSSdtIHN1Z2dlc3RpbmcgdGhhdCBpbnN0ZWFkIG9mIHNzcGktPmNmZyBiZWlu
ZyBhIHBvaW50ZXIgdG8gdGhlCj4gY29uZmlnIGRhdGEgaXQgaXMgYSBjb3B5IG9mIHRoZSBjb25m
aWcgZGF0YS4KPiBTbyB0aGUgYXNzaWdubWVudCBiZWxvdyBiZWNvbWVzIChpZ25vcmluZyBlcnJv
ciBjaGVja3MpCj4gCW1lbWNweSgmc3NwaS0+Y2ZnLCBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
JnBkZXYtPmRldiksIHNpemVvZiBzc3BpLT5jZmcpOwo+IGFuZCB0aGUgY29kZSB0aGF0IG5lZWRz
IHRoZSB2YWx1ZXMgaXM6Cj4gCXNzcGktPmNmZy5maWZvX2RlcHRoCj4gKGV0YykKPiAKPiAJRGF2
aWQKPiAKPiA+IAo+ID4g0L/QvSwgOCDQvNCw0Y8gMjAyM+KAr9CzLiDQsiAxMjo0NywgRGF2aWQg
TGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT46ICAKPiA+ID4KPiA+ID4gRnJvbTogTWFr
c2ltIEtpc2VsZXYgIAo+ID4gPiA+IFNlbnQ6IDA3IE1heSAyMDIzIDAwOjI2Cj4gPiA+ID4KPiA+
ID4gPiBBcyB3ZSdyZSBhZGRpbmcgbW9yZSBwcm9wZXJ0aWVzIHRvIHRoZSBPRiBtYXRjaCBkYXRh
LCBjb252ZXJ0IGl0IHRvIGEKPiA+ID4gPiBzdHJ1Y3Qgbm93Lgo+ID4gPiA+ICAKPiA+ID4gLi4u
ICAKPiA+ID4gPiAtICAgICBzc3BpLT5maWZvX2RlcHRoID0gKHVuc2lnbmVkIGxvbmcpb2ZfZGV2
aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ID4gPiA+ICsgICAgIHNzcGktPmNmZyA9
IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsgIAo+ID4gPgo+ID4gPiBJcyBp
dCB3b3J0aCBkb2luZyBhIHN0cnVjdHVyZSBjb3B5IGF0IHRoaXMgcG9pbnQ/Cj4gPiA+IFRoZSAn
Y2ZnJyBkYXRhIGlzIHNob3J0IGFuZCBjb25zdGFudCBhbmQgaXQgd291bGQgbWFrZQo+ID4gPiB0
aGUgY29kZSB0aGF0IHVzZXMgaXQgc21hbGxlciBhbmQgZmFzdGVyLgo+ID4gPgo+ID4gPiAgICAg
ICAgIERhdmlkCj4gPiA+Cj4gPiA+IC0KPiA+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRl
LCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLCj4g
PiA+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCj4gPiA+ICAKPiAKPiAtCj4gUmVn
aXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRv
biBLZXluZXMsIE1LMSAxUFQsIFVLCj4gUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
