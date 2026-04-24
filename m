Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF5EFB44C6
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7Q+r9+YclRlpLsVw1aAXRplPWjLFthpo12bmm/txX4=; b=qiM5OdScgQt4q8
	Cg95WACrEnOa7dxp7v08e/jQdzVI061uves9aYIESuV3O4LqLl6UEOgVfvaMXVGqa20unWoPc34x7
	FF1/ghhqstFLmwnb6ogrNrVPnidC1zyihNp0tPmyPvuscnqxaMI86860kVUospakzoGtRBDBqpeQM
	OemrJYwT7HI9z8TQPj3ACaXd71vyh6AMHv6Y/DB2DqQtz4Wgzmm+K2kRT8fADCvp3VSpJXDzZRaMY
	XnNMme58gRJDiiXav3NuUy/KQ8GIYDc4Gu9YldBFC6qnfqxNIkMGxjSG5NIcOyoTO72z6qZF9rsH1
	2S0hS3J8gxSfOJFm0sJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBaU-0000000CqSj-0kvs;
	Fri, 24 Apr 2026 08:08:34 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBaP-0000000CqSL-4910
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=eTJGPHVC+FHEwbvDrrf6WzRnGbVhSBhMK
	KfoizHRA4g=; b=nRF8tvkVgIBhni7R7TB0byk3ixZnyLuhUb4oZqDsYaste+bWm
	2F2LhmtTRMyy/NwKD3TezMwgsKijDmXULScjMsK2ZdH9MJSrdN1gGULovCprVUrN
	8jtE56/Ims7IDktux+CTt6rNOmQUJm2JDE0HB/QUVV4XNlnd+1U+IhIrms=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUISJetpHssCAA--.1691S2;
	Fri, 24 Apr 2026 16:08:50 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/3] PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root
 Complex driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <yqxyjv2q4lp5ymb6mjzpldjp2folqsvu4qneaihapbchrcithl@tcj4gu3ez3wh>
References: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
 <20260415-ultrarisc-pcie-v3-3-73f06e972616@ultrarisc.com>
 <7n5b44ynbem2xve3twofaqunqlkw4aijatuuemujrfq5yd5mzq@5qnikt7ximd3>
 <177693928812.2917474.4251479012132866533.b4-reply@b4>
 <yqxyjv2q4lp5ymb6mjzpldjp2folqsvu4qneaihapbchrcithl@tcj4gu3ez3wh>
Date: Fri, 24 Apr 2026 16:08:06 +0800
Message-Id: <177701808603.4074358.3746548668378362054.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777018086; l=3701;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=2TaKfA1MO3gCCHPa6GQ5SKhvOw5Nx4IuQUaFMqsRiB4=;
 b=I/9P90g2nhfwDMBKNn12m4VK/5/jAxo0LqnT2YIPypNbuHWxsf1jb8N+po2XAdN/NlSDoLaS8
 eA9zCU1hyvGBaNXmbtzDxb81W/SS6FgQf0Cv4g4nV9kQJvesw/kFyDw
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUISJetpHssCAA--.1691S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4UKF1kAw13Jry5Cr45ZFb_yoW5trWxpF
	W5GayjkF1vqFy0qr10qw48A3ZFyan5GF4j9rn8t34UAws8K3WIqr4DtF4Y9as7CryFkr1I
	vr1jqrWagFn8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8ACQATsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_010830_531702_5E0353E1 
X-CRM114-Status: GOOD (  28.02  )
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

T24gMjAyNi0wNC0yMyAxODozNCArMDUzMCwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+
IE9uIFRodSwgQXByIDIzLCAyMDI2IGF0IDA2OjE0OjQ4UE0gKzA4MDAsIEppYSBXYW5nIHdyb3Rl
Ogo+IAo+IFsuLi5dCj4gCj4gPiA+ID4gKwlpbnQgcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArCXBj
aWUgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBjaWUpLCBHRlBfS0VSTkVMKTsKPiA+ID4g
PiArCWlmICghcGNpZSkKPiA+ID4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ID4gPiArCj4gPiA+
ID4gKwlwY2kgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBjaSksIEdGUF9LRVJORUwpOwo+
ID4gPiA+ICsJaWYgKCFwY2kpCj4gPiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiA+ID4gKwo+
ID4gPiA+ICsJcGNpLT5kZXYgPSBkZXY7Cj4gPiA+ID4gKwlwY2ktPm9wcyA9ICZkd19wY2llX29w
czsKPiA+ID4gPiArCj4gPiA+ID4gKwkvKiBTZXQgYSBkZWZhdWx0IHZhbHVlIHN1aXRhYmxlIGZv
ciBhdCBtb3N0IDE2IGluIGFuZCAxNiBvdXQgd2luZG93cyAqLwo+ID4gPiA+ICsJcGNpLT5hdHVf
c2l6ZSA9IFNaXzhLOwo+ID4gPiA+ICsJcGNpLT5tYXhfbGlua19zcGVlZCA9IDQ7Cj4gPiA+IAo+
ID4gPiBHZXQgdGhpcyBmcm9tIERUIHBsZWFzZS4uLiBUaGlzIGNhbiBjaGFuZ2UgYmV0d2VlbiBT
b0MgcmV2aXNpb25zLgo+ID4gPgo+ID4gCj4gPiBEdXJpbmcgdGhlIHYyIERUIGJpbmRpbmcgcmV2
aWV3LCBLcnp5c3p0b2YgcG9pbnRlZCBvdXQgdGhhdCBzaW5jZSB0aGUKPiA+IHByb3BlcnRpZXMg
YXJlIGZpeGVkIGZvciB0aGlzIGhhcmR3YXJlLCB0aGV5IGFyZSBkZWR1Y2libGUgZnJvbSB0aGUK
PiA+IGNvbXBhdGlibGUgc3RyaW5nIGFuZCBzaG91bGQgYmUgZHJvcHBlZCBmcm9tIHRoZSBEVCBi
aW5kaW5ncy4KPiA+IAo+ID4gVGhlIHYyIGRpc2N1c3Npb24gaXMgaGVyZToKPiA+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9jNjBhNzEyZS1lY2YzLTQ5MjYtOTk0Ny0wZTU5M2NkYjkyMWRA
a2VybmVsLm9yZy8KPiA+IAo+ID4gSSB0aGVuIG1vdmVkIHRoZW0gaW50byB0aGUgZHJpdmVyIGZv
ciB2My4gSWYgZnV0dXJlIFNvQyByZXZpc2lvbnMgaW50cm9kdWNlCj4gPiB2YXJpYXRpb25zLCBJ
J2xsIHVwZGF0ZSB0aGUgZHJpdmVyIHRvIGhhbmRsZSB0aGVtIGFjY29yZGluZ2x5Lgo+ID4gCj4g
PiBEb2VzIHRoaXMgbWFrZSBzZW5zZT8KPiA+IAo+IAo+IFRoZXJlIGFyZSB0d28gdXNlcyBvZiB0
aGlzIHByb3BlcnR5Ogo+IAo+IDEuIFRvIHByb3ZpZGUgZGVmYXVsdCBNYXggTGluayBTcGVlZCBv
ZiB0aGUgUm9vdCBQb3J0KHMpIGlmIHRoZSBoYXJkd2FyZSBkZWZhdWx0Cj4gdmFsdWUgaXMgd3Jv
bmcuJwo+IAo+IDIuIFRvIG92ZXJyaWRlIHRoZSBoYXJkd2FyZSBkZWZhdWx0IHRvIHdvcmthcm91
bmQgdGhlIGhhcmR3YXJlIGlzc3VlcyBsaWtlCj4gYnJva2VuIFBDQiByb3V0aW5nIGV0Yy4uLgo+
IAo+IEZvciB0aGUgZmlyc3QgdXNlY2FzZSwgeW91IG5lZWQgdG8gY2hlY2sgaWYgdGhpcyB2YWx1
ZSBkaWZmZXJlbnQgZnJvbQo+IFBDSV9FWFBfTE5LQ0FQX1NMUyBmaWVsZCBvZiBMTktDQVAgcmVn
aXN0ZXI/IElmIG5vdCwgeW91IGRvbid0IG5lZWQgdG8gc2V0IGl0Cj4gaW4gc29jLmR0c2kvZHQt
YmluZGluZyBhbmQgdGhlIERXQyBjb3JlIHdpbGwgZXh0cmFjdCB0aGlzIHZhbHVlIGZyb20gdGhl
IERCSQo+IHJlZ2lzdGVyLgo+IAo+IEZvciB0aGUgc2Vjb25kIGNhc2UsIHlvdSBkb24ndCBuZWVk
IHRvIGRlZmluZSBpdCBpbiB5b3VyIGNvbnRyb2xsZXIgZHQtYmluZGluZwo+IHdpdGggYSBkZWZh
dWx0IHZhbHVlIGFuZCBhbHNvIGluIHlvdXIgc29jLmR0c2kuIFNpbmNlIHRoaXMgcHJvcGVydHkg
aXMgZGVmaW5lZAo+IGluIHRoZSBkdHNjaGVtYSBbMV0sIHlvdSBjYW4ganVzdCBpbmNsdWRlIHRo
ZSBwcm9wZXJ0eSBpbiBib2FyZCBEVFMgZmlsZSB0bwo+IHdvcmthcm91bmQgaGFyZHdhcmUgaXNz
dWVzIChib2FyZCBzcGVjaWZpYykgYW5kIGR0YnNfY2hlY2sgd2lsbCBub3QgY29tcGxhaW4uCj4g
Cj4gTk9URTogRm9yIGJvdGggY2FzZXMsIHlvdSBkb24ndCBuZWVkIGRyaXZlciBjaGFuZ2VzLCBz
aW5jZSBEV0MgY29yZSB3aWxsIGhhbmRsZQo+IGl0Lgo+IAo+IC0gTWFuaQo+IAo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL2Jsb2IvbWFpbi9kdHNjaGVt
YS9zY2hlbWFzL3BjaS9wY2ktYnVzLWNvbW1vbi55YW1sI0wxMTcKPgoKVGhhbmtzIGZvciB0aGUg
ZGV0YWlsZWQgZXhwbGFuYXRpb24sIE1hbmkuCgpUaGF0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuIEkg
aGF2ZSBjb25maXJtZWQgdGhhdCB0aGUgaGFyZHdhcmUgZGVmYXVsdCB2YWx1ZQpmb3Igb3VyIFNv
QyBpcyBjb3JyZWN0IGFuZCB0aGVyZSBpcyBjdXJyZW50bHkgbm8gbmVlZCBmb3IgYm9hcmQtbGV2
ZWwKb3ZlcnJpZGVzLgoKRm9sbG93aW5nIHlvdXIgc3VnZ2VzdGlvbiwgSSB3aWxsIHJlbW92ZSB0
aGUgaGFyZGNvZGVkIG1heC1saW5rLXNwZWVkIGZyb20KdGhlIGRyaXZlciBpbiB2NCBhbmQgcmVs
eSBvbiB0aGUgRFdDIGNvcmUgdG8gaGFuZGxlIGl0LiBJZiBhIGJvYXJkLWxldmVsCndvcmthcm91
bmQgYmVjb21lcyBuZWNlc3NhcnkgaW4gdGhlIGZ1dHVyZSwgd2UgY2FuIGFkZCB0aGUgcHJvcGVy
dHkgaW4gdGhlCmJvYXJkIERUUyBmaWxlIHdpdGhvdXQgdG91Y2hpbmcgdGhlIGRyaXZlci4KCj4g
PiA+ID4gKwlwY2llLT5wY2kgPSBwY2k7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJcHAgPSAmcGNpLT5w
cDsKPiA+ID4gPiArCj4gPiA+ID4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY2llKTsK
PiA+ID4gPiArCj4gPiA+ID4gKwlwcC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsK
PiA+ID4gPiArCWlmIChwcC0+aXJxIDwgMCkKPiA+ID4gPiArCQlyZXR1cm4gcHAtPmlycTsKPiA+
ID4gCj4gPiA+IFdobyBpcyByZXF1ZXN0aW5nIHRoaXMgSVJRPwo+ID4gPiAKPiA+IAo+ID4gTm90
IG5lZWRlZC4gV2lsbCByZW1vdmUgaXQgaW4gdjQuCj4gPiAKPiA+ID4gPiArCj4gPiA+ID4gKwlw
cC0+bnVtX3ZlY3RvcnMgPSBNQVhfTVNJX0lSUVM7Cj4gPiA+IAo+ID4gPiBBcmUgeW91IHN1cmUg
eW91ciBjb250cm9sbGVyIHN1cHBvcnRzIDI1NiBNU0lzIHdpdGggb25lIFNQSSBpbnRlcnJ1cHQ/
IEl0IGlzCj4gPiA+IHBvc3NpYmxlLCBidXQgd2FudCB0byBtYWtlIHN1cmUgaXQgaXMgdGhlIGNh
c2UuCj4gPiA+IAo+ID4gCj4gPiBZZXMuIFRoZSBjb250cm9sbGVyIGltcGxlbWVudHMgOCBNU0kg
Y29udHJvbCBibG9ja3MgKGkgPSAwLi43KSwgZWFjaAo+ID4gcHJvdmlkaW5nIDMyIHZlY3RvcnMs
IHNvIDI1NiBNU0lzIGFyZSBzdXBwb3J0ZWQuIFRoaXMgaXMgZG9jdW1lbnRlZCBpbiB0aGUKPiA+
IGNvbnRyb2xsZXIgSVAgc3BlY2lmaWNhdGlvbi4KPiA+Cj4gCj4gT2ssIHRoYW5rcyBmb3IgY29u
ZmlybWluZy4KPiAKPiAtIE1hbmkKPiAKPiAtLSAKPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqng
r40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCj4gCgpCZXN0IFJlZ2FyZHMsCkppYSBXYW5nCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
