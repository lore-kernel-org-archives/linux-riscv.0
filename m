Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C4AC5320E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wcf5fAlFXbNjPOpfkpxpPdzYIETMdpwZefoCib68VfA=; b=KEkhTJpQMTVsPa
	dimjUe4462ts6X+prli/41QSHxmaY4YUrBL81BNNxcXY4ockoPMYNebwOwX51WGo+M6YUFr/YTJ9c
	l11/O+HB5k+OPncn1aOGHzIPvWH43ntgTXn3lQbEaShswX8JrCMIhsU8OG2U213+8jYdCS2nXcFen
	fudJMKtINdvQW1EOEYRCpSEX2X1fKClDG9c+9z9I/WnhKyqgtHOPS4GUa8JdseEJcJ2Jio1XmjNiT
	BQvrrqd11msX+fN2tBN3zbryEBH0KAghKHn5PjP5fHpuuGrdSnfWah5H3vFRuFvW4yQ1K4GuNfrUo
	dNMBOHax4uZoZh/kdMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3az-0000000C8Xz-3oIi;
	Thu, 22 Aug 2024 08:55:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3Ys-0000000C88l-1Mk8
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 08:52:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E82640014;
	Thu, 22 Aug 2024 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724316771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UIGzrVaAQPnYlVfpyNoYN2nYYqPJiVh7oMdysgcqNU=;
	b=i7uUTlCDY8YsUUZ29X9DOU5fWK/bhszXgWeO6WruYIikgph+s9xbgkwZovwoqXkPZrcUjV
	gWHBRw8LP7eeMPVL3rAbAmaevFhCJ8fWboLzIrVM03CwV5hp5ohhIM7qJuuIuuyUS/XBQi
	an6YctOHY6YyEkox7+7u84nnsV/i+UZ9HovjLh/CG+f5xjMdL844pm0qbaNHKhArzz2bom
	Nn7nY0Ihc3xVwUDV3OYmQKdkwHvEH3j/3d7OUBQblE/bAJO1g6+XrX4ZHadiFZV3QVfulH
	xKnrDsbGSCAZm8OYq/TSibGYG+akOpMxizy62KrOg66O1+m2H/oKuFE6+CJopg==
Date: Thu, 22 Aug 2024 10:52:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo CV18XX SARADC binding
Message-ID: <20240822105249.0fd64d67@xps-13>
In-Reply-To: <20240821-unholy-statutory-7aa884ebf857@spud>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
	<20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
	<20240812-unwary-mongrel-9f6758bf624c@spud>
	<89aabfbe-79bf-4da7-be44-b6cbd92b72a9@bootlin.com>
	<20240820-borough-latch-17d785301aef@spud>
	<20240821094150.5787905b@xps-13>
	<20240821-unholy-statutory-7aa884ebf857@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_015255_041667_A5875CE3 
X-CRM114-Status: GOOD (  23.42  )
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

SGkgQ29ub3IsCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMjEgQXVnIDIwMjQgMTY6
Mjk6NDIgKzAxMDA6Cgo+IE9uIFdlZCwgQXVnIDIxLCAyMDI0IGF0IDA5OjQxOjUwQU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiA+ID4gPiA+ICsgICAgICBSZXByZXNlbnRzIHRoZSBj
aGFubmVscyBvZiB0aGUgQURDLgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgcHJvcGVy
dGllczoKPiA+ID4gPiA+ID4gKyAgICAgIHJlZzoKPiA+ID4gPiA+ID4gKyAgICAgICAgZGVzY3Jp
cHRpb246IHwKPiA+ID4gPiA+ID4gKyAgICAgICAgICBUaGUgY2hhbm5lbCBudW1iZXIuIEl0IGNh
biBoYXZlIHVwIHRvIDMgY2hhbm5lbHMgbnVtYmVyZWQgZnJvbSAwIHRvIDIuCj4gPiA+ID4gPiA+
ICsgICAgICAgIGl0ZW1zOgo+ID4gPiA+ID4gPiArICAgICAgICAgIC0gbWluaW11bTogMAo+ID4g
PiA+ID4gPiArICAgICAgICAgICAgbWF4aW11bTogMiAgICAKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
SXMgdGhpcyBzdWZmaWNpZW50IHRvIGxpbWl0IHRoZSBudW1iZXIgb2YgY2hhbm5lbHMgdG8gMz8g
QXJlbid0IHlvdSByZWx5aW5nCj4gPiA+ID4gPiBvbiB0aGUgdW5pcXVlIHVuaXQgYWRkcmVzc2Vz
IHdhcm5pbmcgaW4gZHRjIHRvIGxpbWl0IGl0LCByYXRoZXIgdGhhbgo+ID4gPiA+ID4gYWN0dWFs
bHkgbGltaXRpbmcgd2l0aCBtaW4vbWF4SXRlbXM/Cj4gPiA+ID4gPiAgICAgCj4gPiA+ID4gSXQg
c2VlbXMgbGlrZSBJIGNhbid0IHVzZSBtaW4vbWF4SXRlbXMgb24gdGhpcyBwcm9wZXJ0eS4gSSB0
aGluayB0aGF0IGl0IGlzCj4gPiA+ID4gdXNpbmcgc2l6ZS1jZWxscyArIGFkZHJlc3MtY2VsbHMg
dG8gZGVkdWNlIHRoYXQgdGhlIG51bWJlciBvZiBpdGVtcyBzaG91bGQKPiA+ID4gPiBiZSBlcXVh
bCB0byAxLiAgICAKPiA+IAo+ID4gTG9va2luZyBhdCBkdC1zY2hlbWEsIEkgY291bGRuJ3QgcGVy
c29uYWxseSB1bmRlcnN0YW5kIGZyb20gd2hlcmUgZGlkCj4gPiB0aGUgZXJyb3IgbWVzc2FnZXMg
cmVwb3J0ZWQgYnkgVGhvbWFzIGNhbWUgZnJvbS4gVGhlcmUgYXJlIGNsZWFyICAKPiAKPiBJIHRo
aW5rIHRoZSBjb21wbGFpbnRzIGFyZSBvbiBhIG1vcmUgbWV0YSBsZXZlbCB0aGFuIHRoYXQuIEhl
IHByb3ZpZGVkCj4gYW4gaXRlbXMgbGlzdAo+ICAgICAgcHJvcGVydGllczoKPiAgICAgICAgcmVn
Ogo+ICAgICAgICAgIG1heEl0ZW1zOiAxCj4gICAgICAgICAgaXRlbXM6Cj4gICAgICAgICAgICAt
IG1pbmltdW06IDAKPiAgICAgICAgICAgICAgbWF4aW11bTogMgo+IGJ1dCB0aGlzIGxpc3Qgb25s
eSBoYXMgb25lIGVudHJ5IGFzIHRoZXJlJ3Mgb25lIC0uIFRoZSBmaXJzdCBjb21wbGFpbnQKPiBm
cm9tIGR0X2JpbmRpbmdfY2hlY2sgaXMgdGhhdCBoYXZpbmcgbWF4SXRlbXMgaXMgbm90IG5lZWRl
ZCB3aXRoIGFuCj4gaXRlbXMgbGlzdCwgYmVjYXVzZSB0aGUgaXRlbXMgbGlzdCBjb250YWlucyB0
aGUgbWF4aW11bSBudW1iZXIgb2YKPiBlbGVtZW50cy4KPiAKPiBUaGUgc2Vjb25kIG9uZSBjb21l
cyBmcm9tIGNlbGwueWFtbDoKPiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQt
c2NoZW1hL2Jsb2IvbWFpbi9kdHNjaGVtYS9tZXRhLXNjaGVtYXMvY2VsbC55YW1sCj4gCj4gSXQg
ZWl0aGVyIGFsbG93cyBhIHNpbmdsZSBpdGVtLCB3aXRoIG1heEl0ZW1zOiAxIG9yIG11bHRpcGxl
IGl0ZW1zLCBpbgo+IHdoaWNoIGNhc2UgbWF4aXRlbXMgbXVzdCBiZSBncmVhdGVyIHRoYW4gMS4g
VGhhdCdzIHdoZXJlIHRoZSAiYW55T2YKPiBjb25kaXRvbmFsIGZhaWxlZCIgYW5kICIxIGlzIGxl
c3MgdGhhbiB0aGUgbWluaW11bSBvZiAyIiBzdHVmZiBjb21lcwo+IGZyb20uCj4gCj4gSSBob3Bl
IHRoYXQgaGVscHM/CgpBaCB5ZWFoLCBtYWtlcyBzZW5zZS4gVGhhbmtzIGEgbG90IGZvciB5b3Vy
IGZlZWRiYWNrIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
