Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30C8C83F03
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iEKJvRcI2HdkpDpkuil39ss8wJESk+J1nkWUcnaCok=; b=btz1jjLwawdTdc
	kGW5LOaNJ/udm5lr1kocq1zEv7WL7sBKFNHF15rOsHjoY0K7NS4LFoblRSjEzBM0Vw7lgLKuNMrzw
	MCLbEFP/3lJEXhqGYRWLfAL4aj8SHOLhIbd03hcT9nlDXcR/42YlvM7Bg7ekFhXtEeV1Xv3R1uNwL
	A773t0Vn6nQ7if4uFHS41iHgYeHvQaNiS/2DIIb12O6OpPIhhLEcB69RxXA6guEoGdTRfjytHObXq
	JfmQFan3h3o6RX5VTtSYOwlrkbKlrzRaFZtMQ38Yv+DL4N3ED5Rmjos8RhZSLuK7vqhmxcrDnAHsy
	fQv8VWPs7yWhQgbJCf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDY-00000006PKy-1xRx;
	Tue, 01 Jul 2025 19:00:32 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe6U-000000065dL-13Ib
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:45:10 +0000
Message-ID: <34647b2e-3d9d-42db-9851-34ad8621af02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdTOqogTp5JqM4b0+vAKcrKmgEFcq8WvFyC5EnR/3bg=;
	b=Wzp5qGceGGl95r7D/0lKItVPsPO6qNrVY7lEmWjLAGnLkqaIy2i+/rkJvKWAmC7S0fs0w0
	yTIWAk7S2uKU5znFYHxgjaUy2KY+6aBQepouQEfpE4CtempkqY8gkBezWqdM0GPVlkJYWK
	sD7ARAAqL74oHVw5FGR3QlI77hxl8ig=
Date: Tue, 1 Jul 2025 12:44:55 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 13/18] net: macb: avoid double endianness swap
 in macb_set_hwaddr()
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-13-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-13-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_094506_441212_A197CD2E 
X-CRM114-Status: GOOD (  14.74  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IHdyaXRlbCgpIGRvZXMgYSBD
UFUtPkxFIGNvbnZlcnNpb24uIERyb3AgbWFudWFsIGNwdV90b19sZSooKSBjYWxscy4KPiAKPiBP
biBsaXR0bGUtZW5kaWFuIHN5c3RlbToKPiAgLSBjcHVfdG9fbGUzMigpIGlzIGEgbm8tb3AgKExF
LT5MRSksCj4gIC0gd3JpdGVsKCkgaXMgYSBuby1vcCAoTEUtPkxFKSwKPiAgLSBkZXZfYWRkciB3
aWxsIHRoZXJlZm9yZSBub3QgYmUgc3dhcHBlZCBhbmQgd3JpdHRlbiBhcy1pcy4KPiAKPiBPbiBi
aWctZW5kaWFuIHN5c3RlbToKPiAgLSBjcHVfdG9fbGUzMigpIGlzIGEgc3dhcCAoQkUtPkxFKSwK
PiAgLSB3cml0ZWwoKSBpcyBhIHN3YXAgKEJFLT5MRSksCj4gIC0gZGV2X2FkZHIgd2lsbCB0aGVy
ZWZvcmUgYmUgc3dhcHBlZCB0d2ljZSBhbmQgd3JpdHRlbiBhcyBhIEJFIHZhbHVlLgo+IAo+IFRo
aXMgd2FzIGZvdW5kIHVzaW5nIHNwYXJzZToKPiAgICDin6kgbWFrZSBDPTIgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4ubwo+ICAgIHdhcm5pbmc6IGluY29ycmVjdCB0eXBl
IGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQo+ICAgICAgIGV4cGVjdGVkIHVu
c2lnbmVkIGludCBbdXNlcnR5cGVdIGJvdHRvbQo+ICAgICAgIGdvdCByZXN0cmljdGVkIF9fbGUz
MiBbdXNlcnR5cGVdCj4gICAgd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAo
ZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4gICAgICAgZXhwZWN0ZWQgdW5zaWduZWQgc2hvcnQgW3Vz
ZXJ0eXBlXSB0b3AKPiAgICAgICBnb3QgcmVzdHJpY3RlZCBfX2xlMTYgW3VzZXJ0eXBlXQo+ICAg
IC4uLgo+IAo+IEZpeGVzOiA4OWU1Nzg1ZmM4YTYgKCJbUEFUQ0hdIEF0bWVsIE1BQ0IgZXRoZXJu
ZXQgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJv
b3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFp
bi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFj
Yl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gaW5k
ZXggNTc4ZTcyYzc3MjdkNGY1Nzg0NzhmZjJiM2QwYTYzMTYzMjcyNzFiMS4uMzQyMjNkYWQyZDAx
YWU0YmNlZmMwODIzYzg2OGE2N2Y1OTQzNTYzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
Y2FkZW5jZS9tYWNiX21haW4uYwo+IEBAIC0yNjUsOSArMjY1LDkgQEAgc3RhdGljIHZvaWQgbWFj
Yl9zZXRfaHdhZGRyKHN0cnVjdCBtYWNiICpicCkKPiAgCXUzMiBib3R0b207Cj4gIAl1MTYgdG9w
Owo+ICAKPiAtCWJvdHRvbSA9IGNwdV90b19sZTMyKCooKHUzMiAqKWJwLT5kZXYtPmRldl9hZGRy
KSk7Cj4gKwlib3R0b20gPSAqKCh1MzIgKilicC0+ZGV2LT5kZXZfYWRkcik7Cj4gIAltYWNiX29y
X2dlbV93cml0ZWwoYnAsIFNBMUIsIGJvdHRvbSk7Cj4gLQl0b3AgPSBjcHVfdG9fbGUxNigqKCh1
MTYgKikoYnAtPmRldi0+ZGV2X2FkZHIgKyA0KSkpOwo+ICsJdG9wID0gKigodTE2ICopKGJwLT5k
ZXYtPmRldl9hZGRyICsgNCkpOz4gIAltYWNiX29yX2dlbV93cml0ZWwoYnAsIFNBMVQsIHRvcCk7
Cj4gIAo+ICAJaWYgKGdlbV9oYXNfcHRwKGJwKSkgewo+IAoKUmV2aWV3ZWQtYnk6IFNlYW4gQW5k
ZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
