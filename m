Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBF8C369C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnbnyrvNW9Sr1TQI94nC1NUTtvhlDo5Dw04NgHUomwE=; b=w0Mc0a8WZBgxG/
	qrUaLeHxIqw1GkhZfKemL8oBjVo1jVi1BFR2P6SIcv71f/iwOf/WPGwvSSPIADxl2p6znmCGqdMWD
	x5TJziNYc9SJSLqmJcAldknL5v4IAxWj8GzeyR9X0Q4Q4T08fzsxHZ91QFjpHKeKvye8I39QJWpuy
	nHOVg4G30JFWTsPlZqoEwcyexXCOSS56IAcqXbjU6rbctGKSxiDY1hotb0NMRqpfrSn0+AWvK9Hto
	w8VWVvLtIBgohJYnMNvT/TQ93eKn02zAprPmj+rsTeTCcgE6RPClX8ptyBypty7Hslm0JTowJExdF
	6q7wvjzB8Y8YD7iIoNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58nU-0000000AkHl-31D8;
	Wed, 16 Apr 2025 19:51:48 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58nS-0000000AkGk-0aMF
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 19:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744833065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iIjK98sxkynmff0y9oMplzffXbtE6Nc3uESpZz/KiihpFRzt261y4QXeXsv7Fdq/SgR1dd8ZK40e1tA96jY4M6dMKaMilMu+7ivGLwJExUINoJ/5ggE5ulEV/Mm8r38zfdLflEPdr3NsEZ2boExoAXBfH8cWRRq2WZMiK08TbBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744833065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QQnMgSN3RMHftVhAZYOIOMgtEA4ud0N6wZt7HLG7xN0=; 
	b=PHWqcG/6l1wCuYU9C2MxnTE+kaiWKUq+t3M1ak1J9DV8HSIQ2tp95jVEl0xYjVoXTG9ncAz6TxKzmzeJcK98KXs4b2AGYWBo9LbQIca1TiiHRZtboKeo5w7PsjR45hU7ep7Bvfkx4J6dNiSF+YfNbtCF7VaH8QZh0TMFyAfpdog=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744833065;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QQnMgSN3RMHftVhAZYOIOMgtEA4ud0N6wZt7HLG7xN0=;
	b=VrIlqo3CHxeq2BeVRuDRR2dUSjFQMtn0rqowxJQJBE6m183lMnDvmzrJ68zx5PA0
	hS1YrFwmnzfmip4Nr7aK6NLKIhYV7MuQeKrDZnvGAeTEoqM8S71bhDKxfSHRFWqM/zk
	z4wj6uCmsaKt7Q005bhSX3Z9e/cq9JN07NsjGA6s=
Received: by mx.zohomail.com with SMTPS id 17448330628774.730471333362061;
	Wed, 16 Apr 2025 12:51:02 -0700 (PDT)
Message-ID: <b82ae3ed-442c-4a87-82be-a973cd333287@collabora.com>
Date: Wed, 16 Apr 2025 16:50:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Sjoerd Simons <sjoerd@collabora.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
 <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
 <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_125146_217263_4952EA75 
X-CRM114-Status: GOOD (  21.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U2FtdWVsLCBTam9lcmQsCgpPbiA0LzE1LzI1IDQ6MzkgQU0sIFNqb2VyZCBTaW1vbnMgd3JvdGU6
Cj4gSGV5LAo+IAo+IE9uIE1vbiwgMjAyNS0wNC0xNCBhdCAxMTowMCAtMDUwMCwgU2FtdWVsIEhv
bGxhbmQgd3JvdGU6Cj4+IEhpIEFyaWVsLAo+Pgo+PiBPbiAyMDI1LTA0LTE0IDc6NTUgQU0sIEFy
aWVsIEQnQWxlc3NhbmRybyB3cm90ZToKPj4+IEhpIFBpbmtlc2gsCj4+Pgo+Pj4gT24gNC8xMC8y
NSAxMjoyNSBQTSwgUGlua2VzaCBWYWdoZWxhIHdyb3RlOgo+Pj4+IEZyb206IE1pbiBMaW4gPGxp
bm1pbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4+Pgo+IDxzbmlwPgo+IAo+Pj4gQWx0aG91Z2ggY29t
bWl0IGxvZyBzYXlzIHRoYXQgdGhpcyBpbmNsdWRlcyBEUkFNIGNvbmZpZ3VyYXRpb24sIGxvb2tz
IGxpa2UKPj4+IGl0J3MKPj4+IG1pc3Npbmc/IEluIG9yZGVyIHRvIHRlc3QgdGhpcyBwYXRjaHNl
dCwgaGFkIHRvIGFkZCB0aGlzIGZvbGxvd2luZyBtZW1vcnkKPj4+IGRlZmluaXRpb24gKHBpY2tl
ZCBmcm9tIHZlbmRvciBrZXJuZWwgcmVwb3NpdG9yeSk6Cj4+Pgo+Pj4gIMKgwqDCoCBMNTA6IG1l
bW9yeUA4MDAwMDAwMCB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InNpZml2ZSxheGk0LW1lbS1wb3J0IiwgInNpZml2ZSxheGk0LXBvcnQiLAo+Pj4gInNpZml2ZSxt
ZW0tcG9ydCI7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICJtZW1v
cnkiOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDgwMDAwMDAwIDB4
N2YgMHg4MDAwMDAwMD47Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaWZpdmUscG9ydC13
aWR0aC1ieXRlcyA9IDwzMj47Cj4+PiAgwqDCoMKgIH07Cj4+Cj4+IFRoYXQgaXMgYSBtaXNzdGF0
ZW1lbnQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGUgbWVtb3J5IG5vZGUgaXMgbm90IGluY2x1
ZGVkCj4+IGluCj4+IHRoZSBzdGF0aWMgZGV2aWNldHJlZSBiZWNhdXNlIHRoZSBhbW91bnQgb2Yg
UkFNIGluc3RhbGxlZCBvbiB0aGUgYm9hcmQgaXMKPj4gdmFyaWFibGUuIEl0IGlzIHRoZSByZXNw
b25zaWJpbGl0eSBvZiBmaXJtd2FyZSB0byBwcm92aWRlIHRoZSBtZW1vcnkgbWFwLAo+PiBlaXRo
ZXIKPj4gdGhyb3VnaCBFRkkgb3IgYnkgcGF0Y2hpbmcgdGhlIG1lbW9yeSBub2RlIGludG8gdGhl
IERUIGF0IHJ1bnRpbWUuIEkgYmVsaWV2ZQo+PiB0aGUKPj4gY3VycmVudCBCU1AgVS1Cb290IGRv
ZXMgdGhlIGZvcm1lciBidXQgbm90IHRoZSBsYXR0ZXIuCj4gCj4gQW1vdW50IG9mIFJBTSBiZWlu
ZyB2YXJpYWJsZSBpcyBwcmV0dHkgY29tbW9uIG9uIGRldmljZXMgdXNpbmcgRkRUIHRoZXNlIGRh
eXM7Cj4gVHlwaWNhbGx5IHRoZSBkdHMgc3RpbGwgZ2V0cyBhIG1lbW9yeSBub2RlIHRoYXQncyBh
IHJlYXNvbmFibGUgZGVmYXVsdCwgd2l0aCB0aGUKPiBleHBlY3RhdGlvbiB0aGF0IGUuZy4gdS1i
b290IHdpbGwgZml4IGl0IHVwLiBJZiB5b3UgbG9vayBhdCBvdGhlciByaXNjLXYKPiBkZXZpY2V0
cmVlcyBpbiB1cHN0cmVhbSB0aGV5IChhbG1vc3Q/KSBhbGwgY29tZSB3aXRoIGEgcHJlLWRlZmlu
ZWQgbWVtb3J5IG5vZGUuCj4gRm9yIHRoZSBQNTUwIGJvYXJkIGEgZGVmYXVsdCBtZW1vcnkgbm9k
ZSBmb3IgMTZHIHJhbSBzZWVtcyByZWFzb25hYmxlIChhcyB0aGF0Cj4gc2VlbXMgdGhlIG1pbmlt
YWwgU0tVPykKPiAKPiBUaGF0IGFsbCBiZWluZyBzYWlkLiBJbmRlZWQgdGhlIHNpZml2ZSBCU1Ag
dS1ib290IGRvZXNuJ3Qgc2VlbSB0byBjYWxsIHRoZQo+IHJlbGV2YW50IGBmZHRfZml4dXBfbWVt
b3J5YCB0byBmaXh1cCB0aGUgbWVtb3J5IG5vZGUsIGhlbmNlIHVzIGhhdmluZyBpc3N1ZXMKPiBi
b290aW5nIHdpdGggdS1ib290IGRpcmVjdGx5ICh3aXRob3V0IGdvaW5nIHRocm91Z2ggRUZJKS4g
SG9uZXN0bHkgdGhpcyB3YXMgYQo+IGJpdCBvZiBhIHN1cnByaXNlIHRvIG1lIGFzIG9ubHkgbW9z
dCBvdGhlciBhcmNoaXRlY3R1cmVzIHRoYXQncyBqdXN0IGRvbmUgYnkKPiBjb21tb24gY29kZSwg
YnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBjYXNlIGZvciByaXNjLXYgKGVpdGhlciB1
cHN0cmVhbSBvcgo+IGRvd25zdHJlYW0pCgpBcyBTYW11ZWwgbWVudGlvbmVkLCB0aGUgbGF0ZXN0
IEJTUCBVLUJvb3QgaXMgbm93IHBhdGNoaW5nL3BvcHVsYXRpbmcgCnRoZSBEVCBtZW1vcnkgbm9k
ZSBhdCBydW50aW1lLCBhZnRlciBjb21taXQgWzBdLiBBbmQgdGhpcyBpbmRlZWQgZW5kcyB1cCAK
Y2FsbGluZyBgZmR0X2ZpeHVwX21lbW9yeSgpYCBhcyBTam9lcmQgcG9pbnRlZCBvdXQuCgpJbiBj
b25jbHVzaW9uLCB0aGlzIGlzIHdvcmtpbmcgcHJvcGVybHkgd2l0aCB0aGUgY3VycmVudCBCU1Ag
VS1Cb290LiAKRmVlbCBmcmVlIHRvIGFkZDoKCiAgIFRlc3RlZC1ieTogQXJpZWwgRCdBbGVzc2Fu
ZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bjb2xsYWJvcmEuY29tPgoKVGhhbmtzIQoKWzBdIApodHRw
czovL2dpdGh1Yi5jb20vZXN3aW5jb21wdXRpbmcvdS1ib290L2NvbW1pdC83ZmFiNTA0NjhmMTll
ZmVhNzJmZjI3YWMwOGNiMzg4ZmJmNWJlMzA3CgotLSAKQXJpZWwgRCdBbGVzc2FuZHJvClNvZnR3
YXJlIEVuZ2luZWVyCgpDb2xsYWJvcmEgTHRkLgpQbGF0aW51bSBCdWlsZGluZywgU3QgSm9obidz
IElubm92YXRpb24gUGFyaywgQ2FtYnJpZGdlIENCNCAwRFMsIFVLIApSZWdpc3RlcmVkIGluIEVu
Z2xhbmQgJiBXYWxlcywgbm8uIDU1MTM3MTgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
