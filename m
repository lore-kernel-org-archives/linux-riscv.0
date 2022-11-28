Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC4C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9mp6GsLd8ECEFkyIczqRwpbljlKYmLWYZiV/KuLqyU=; b=qICm4xztNpuY27
	JJtEuOmlBTa2LiTdnUfi+IQGr9Kln7Pa1MkBZLR9KpR3Fl0vck5J1GvIQSYxzZf0Ad9SMdVGokVv0
	gZC1qHuoWmHid7pqcRsAZIgfDJcP1bJhOrZry+s9JmhJWY9EIQ/Wyq8GpxylXLIjbdigjOLVTWPDZ
	1DaMxtPpUTGj5CulxJ8R0dS/Z3MJQXpHZva0tQZsXgAKqBF29BtUxnXR/gQdeq2gWUKmIQikrc/d1
	+qS0q1u/zNH1NXUvLyVqPcJROoOZZPrhYuzWK+SraEpFg5chRn+K1IMV0jPpFotiRKUEUfAa2fJ18
	s3HwE0SRFP9/PhdK/Oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfVA-002Lo8-V0; Mon, 28 Nov 2022 14:52:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfV7-002LnF-TZ
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669647173; x=1701183173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vhgp5H+xO8Wpgp3xe6RQ0CkwZcxSWEbiNdhdyI++Qsc=;
  b=InTULldFRVcihdTsPtxB3hpvgP2fYEs6WOlvXFiGcl8q5IB24rRm3NG3
   dOGWijDIvonZ0bgf11I5Ymyt37IGiHfCSDdfp3xra/m6dzs8svx3iaSDh
   0JpiwzOJKU36SUkLxzQNlIkE2SVo7Er91o46k9KQeRpOBz6cnD2pZFfgb
   FCKg/dWZ+ElWOZZN9v6rj50R7Xw0V1fI58+yMtkslOm2Hg3GM9KHGCGy2
   Izyrp6KJyUqHnwHZHaRO3jWuzMpwE83Ks1hx5EBr5Qbn4sjU6dwvltiTg
   ShPGq5O1jbWIFSZd8wpv67Cr8tENwXB6/cqSOoHsNzLOAd9N8XcC1ngF3
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="188967612"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Nov 2022 07:52:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 07:52:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 28 Nov 2022 07:52:50 -0700
Date: Mon, 28 Nov 2022 14:52:32 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <uwu@icenowy.me>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Message-ID: <Y4TLMLKDG5SVNoJ7@wendy>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-7-jszhang@kernel.org>
 <Y4OcngDlw/4Szt7g@spud>
 <3ad94a3fc3558da2da80d238d26f29e2c42db5c1.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ad94a3fc3558da2da80d238d26f29e2c42db5c1.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_065254_037917_EE3A8F05 
X-CRM114-Status: GOOD (  16.06  )
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

T24gTW9uLCBOb3YgMjgsIDIwMjIgYXQgMDU6NTI6NTFQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyMi0xMS0yN+aYn+acn+aXpeeahCAxNzoyMSArMDAwMO+8jENvbm9yIERv
b2xleeWGmemBk++8mgo+ID4gK0NDIEljZW5vd3kKPiA+IAo+ID4gT24gU3VuLCBOb3YgMjcsIDIw
MjIgYXQgMDk6MjQ6NDVQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+ID4gQWRkIGEg
YmFpc2MgZHRzaSBmb3IgdGhlIGJvdWZmYWxvbGFiIGJsODA4IFNvQy4KPiA+ID4gCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4gLS0t
Cj4gPiA+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC5kdHNpIHwgNzQK
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbGljOiBpbnRlcnJ1cHQtY29u
dHJvbGxlckBlMDAwMDAwMCB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTAwLXBsaWMiOwo+ID4gCj4gPiBI
bW0sIEBJY2Vub3d5IC0gc2hvdWxkIHRoaXMgdXNlIHlvdXIgbmV3IG9wZW4tYzkwNi1wbGljIGNv
bXBhdGlibGUKPiA+IGZyb20KPiA+IDIwMjIxMTIxMDQxNzU3LjQxODY0NS00LXV3dUBpY2Vub3d5
Lm1lwqA/Cj4gCj4gSSBhbSBhZ2FpbnN0IHVzaW5nIG9wZW5jOTA2LXBsaWMuCj4gCj4gTWF5YmUg
SSB3aWxsIGFkZCAidGhlYWQsYzkwNi1wbGljIiwgInRoZWFkLGM5MDAtcGxpYyIgYXMgYW4gdmFs
aWQKPiBjb21wYXRpYmxlLCBhcyB0aGVyZSBzZWVtcyB0byBiZSBmZXcgb3B0aW9ucyByZWxhdGVk
IHRvIFBMSUMvQ0xJTlQgZm9yCj4gQzkwNi9DOTEwIChhdCBsZWFzdCBhcyB0aGUgb3BlbiBkb2N1
bWVudCBvZiB0aGVtIHNheSkuCgpZb3UgdHdvIGtub3cgdGhpcyBhIGxvdCBiZXR0ZXIgdGhhbiBJ
IGRvLCBJJ2xsIGxlYXZlIGl0IHVwIHRvIHlvdSB0d28gdG8Kc29ydCBvdXQgOikgRWl0aGVyIHdh
eSwgd2UgbmVlZCBzb21ldGhpbmcgY2hhbmdlZCBoZXJlIHRvIHNhdGlzZnkgdGhlCmJpbmRpbmdz
LgoKPiA+IEFzIGlzLCBkdGJzX2NoZWNrIGdpdmVzIGE6Cj4gPiBibDgwOC1zaXBlZWQtbTFzLWRv
Y2suZHRiOiBpbnRlcnJ1cHQtY29udHJvbGxlckBlMDAwMDAwMDogY29tcGF0aWJsZToKPiA+ICdv
bmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKPiA+IMKgwqDCoMKg
wqDCoMKgIFsndGhlYWQsYzkwMC1wbGljJ10gaXMgdG9vIHNob3J0Cj4gPiAKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MHhlMDAwMDAw
MCAweDQwMDAwMDA+Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50Ywo+ID4gPiAweGZmZmZm
ZmZmPiwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjcHUwX2ludGMg
OT47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2ludGVycnVwdC1jZWxscyA9IDwy
PjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
aXNjdixuZGV2ID0gPDY0PjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH07Cj4gPiA+ICt9OwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
