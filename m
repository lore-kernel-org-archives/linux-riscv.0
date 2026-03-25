Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B81106B526
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3qai4cUsq0F8SZOShO7qlBFOZ66cLkgPwHA774c3fU=; b=a1Rw847mWhKx6z
	qWnOWYkoC5L05t4TfZJItN/AoBB7+/QemTsHJdyws2qLf9bzQ8LberbGg002RPh+HHhaKXvTlMPJJ
	KspJ14cIR51zEZ9SfaItpGfJSROA9u3Xq/SsuifTNpvwCEXYWqrf1rVj4+WxhO64nAxJCRQxGeeQK
	lJ7ijxa5oIiGRNr25D5GrhXiw56Z4s2MhLDYoUATQ+K1csUqbnyIgmeHfs1Zbke9YR15MxtgNzkzt
	XrYQJltjCj+geXcJrZty+bB3oslJVeddt69XsBLoQIYIPFoU0GDyH64WLxmmkes8cE4tz50PGM0Kn
	f9zopxyfRCEz2WngDvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NfB-00000003P8j-0mZZ;
	Wed, 25 Mar 2026 12:48:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Nf7-00000003P7o-2Ml2
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 12:48:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A50D4E4270B;
	Wed, 25 Mar 2026 12:48:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C5CE601E2;
	Wed, 25 Mar 2026 12:48:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C7110451386;
	Wed, 25 Mar 2026 13:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774442914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrUb56OKoILRudzSP2HC6iXbV4b/pdrYXylo4VOm6Ak=;
	b=cg24GlqAq71cIWMFccmLB7wrDVQ2wuWCHWIU+/af6+vNtyEkQQCG6DGEkUwuzkQnElrMZC
	cpS++ZFELbzorBzb0J085cw25rOBXyejUBnbeRjlJnMXAMRSCfZgAg7LbPn2nMVjanskG3
	a+BLte2WxI8w+RszzA933t1RjOXb7zlFAmbKdreK+zrXvUvZu4Hg6JgYyHL9FWtS57rKEj
	Yd4yP0zv+XH1dzA2wb0myTUcswAQg7Tz7xOU1WeRBMIKndT3aQ+v1mD8McvWePoYIDTzZ+
	PG1eDykT94b8yVmxt6VrlyzsffJf7dCvs7okzo9UvcAusXqn0rWEpc+doOILYg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Conor Dooley <conor+dt@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sari Khoury <sari.khoury@mobileye.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 00/10] Add clock and reset support for Mobileye EyeQ7H
Date: Wed, 25 Mar 2026 13:48:28 +0100
Message-ID: <2786053.vuYhMxLoTh@benoit.monin>
In-Reply-To: <177431268711.5403.12519723172593766522@lazor>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
 <177431268711.5403.12519723172593766522@lazor>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_054841_870915_CA0FAB6D 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVHVlc2RheSwgMjQgTWFyY2ggMjAyNiBhdCAwMTozODowNyBDRVQsIFN0ZXBoZW4gQm95ZCB3
cm90ZToKPiBRdW90aW5nIEJlbm/DrnQgTW9uaW4gKDIwMjYtMDMtMTcgMDY6MzM6MDIpCj4gPiBU
aGlzIHBhdGNoc2V0IGJyaW5ncyB0aGUgc3VwcG9ydCBvZiB0aGUgT3RoZXIgTG9naWMgQmxvY2tz
IChPTEIpCj4gPiBmb3VuZCBpbiB0aGUgZmlyc3QgTW9iaWxleWUgU29DIGJhc2VkIG9uIHRoZSBS
SVNDLVYgYXJjaGl0ZWN0dXJlLCB0aGUKPiA+IEV5ZVE3SC4gRGVzcGl0ZSB0aGUgY2hhbmdlIGZy
b20gTUlQUyB0byBSSVNDLVYsIHRoZSBPdGhlciBMb2dpYyBCbG9ja3MKPiA+IHByb3ZpZGUgc2lt
aWxhciBjbG9jayBhbmQgcmVzZXQgZnVuY3Rpb25zIHRvIHRoZSBjb250cm9sbGVycyBvZiB0aGUK
PiA+IGNoaXAuIFRoaXMgc2VyaWVzIGludHJvZHVjZXMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdz
IG9mIHRoZSBTb0MgYW5kCj4gPiB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMgdG8gdGhlIGNsb2NrIGFu
ZCByZXNldCBleWVxIGRyaXZlcnMuCj4gPgo+IFsuLi5dCj4gPiAKPiA+IFRoaXMgc2VyaWVzIGRl
cGVuZHMgb24gdGhlIEV5ZVE2THBsdXMgc3VwcG9ydCBwYXRjaHNldCBwb3N0ZWQKPiA+IHByZXZp
b3VzbHlbMV0sIHdoaWNoIGluIHR1cm4gZGVwZW5kcyBvbiBUaMOpbydzIHNlcmllc1syXS4gSW4g
cGFydGljdWxhciwKPiA+IHRoZSBjaGFuZ2VzIG1hZGUgdG8gdGhlIGNsay1leWVxIGRyaXZlciBp
biB0aGlzIHBhdGNoc2V0IGRlcGVuZCBvbiB0aGUKPiA+IGNoYW5nZXMgZG9uZSBpbiB0aGVzZSB0
d28gc2VyaWVzLgo+IAo+IElzIGl0IGEgYnVpbGQgdGltZSBkZXBlbmRlbmN5IG9yIGEgcnVuIHRp
bWUgZGVwZW5kZW5jeT8gQXJlIHlvdQo+IGV4cGVjdGluZyBtZSB0byBhcHBseSBhbGwgdGhyZWUg
c2VyaWVzIHRvIHRoZSBjbGsgdHJlZT8KPiAKSXQgaXMgYSBidWlsZCBkZXBlbmRlbmN5IGZvciB0
aGUgY2hhbmdlcyB0byB0aGUgY2xrLWV5ZXEgZHJpdmVyLiBJIGFtCnRyeWluZyB0byBmaWd1cmUg
b3V0IHRoZSBiZXN0IG1lcmdlIHN0cmF0ZWd5LiBJIHByb3Bvc2UgdG8gc3BsaXQgdGhlCnBhdGNo
ZXMgYmV0d2VlbiB0aGUgbWlwcyB0cmVlIGFuZCB0aGUgY2xvY2sgdHJlZS4gVGhlIGNoYW5nZXMg
dG8gdGhlCmNsay1leWVxIGRyaXZlciBhbmQgdGhlIGF1eGlsaWFyeSBwaW5jdHJsLWV5ZXE1IGFu
ZCByZXNldC1leWVxIGRyaXZlcnMKY291bGQgZ28gdGhyb3VnaCB0aGUgY2xrIHRyZWUuIEluIGRl
dGFpbCwgdGhlIGZvbGxvd2luZyBwYXRjaGVzIGNhbgpiZSBhcHBsaWVkIGluIG9yZGVyIHRvIGF2
b2lkIG1lcmdlIGNvbmZsaWN0cyBhbmQgdGhlIHNlcmllcyBpcyBmdWxseQpiaXNlY3RhYmxlOgoK
QWxsIHRoZSBwYXRjaGVzIGZyb20gVGjDqW8ncyBzZXJpZXNbMV06CiAgICAgICAgW1BBVENIIHY3
IDEvM10gY2xrOiBleWVxOiB1c2UgdGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVy
CiAgICAgICAgW1BBVENIIHY3IDIvM10gY2xrOiBleWVxOiBhZGQgRXllUTUgY2hpbGRyZW4gYXV4
aWxpYXJ5IGRldmljZSBmb3IgZ2VuZXJpYyBQSFlzCiAgICAgICAgW1BBVENIIHY3IDMvM10gcmVz
ZXQ6IGV5ZXE6IGRyb3AgZGV2aWNlX3NldF9vZl9ub2RlX2Zyb21fZGV2KCkgZG9uZSBieSBwYXJl
bnQKClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBmcm9tIHRoZSBleWVxNmxwbHVzIHNlcmllc1syXToK
ICAgICAgICBbUEFUQ0ggdjQgMDIvMTNdIGR0LWJpbmRpbmdzOiBzb2M6IG1vYmlsZXllOiBBZGQg
RXllUTZMcGx1cyBPTEIKICAgICAgICBbUEFUQ0ggdjQgMDQvMTNdIHJlc2V0OiBleWVxOiBBZGQg
TW9iaWxleWUgRXllUTZMcGx1cyBPTEIKICAgICAgICBbUEFUQ0ggdjQgMDUvMTNdIHBpbmN0cmw6
IGV5ZXE1OiBVc2UgbWF0Y2ggZGF0YQogICAgICAgIFtQQVRDSCB2NCAwNi8xM10gcGluY3RybDog
ZXllcTU6IEFkZCBNb2JpbGV5ZSBFeWVRNkxwbHVzIE9MQgogICAgICAgIFtQQVRDSCB2NCAwNy8x
M10gY2xrOiBleWVxOiBTa2lwIHBvc3QtZGl2aXNvciB3aGVuIGNvbXB1dGluZyBQTEwgZnJlcXVl
bmN5CiAgICAgICAgW1BBVENIIHY0IDA4LzEzXSBjbGs6IGV5ZXE6IEFkanVzdCBQTEwgYWNjdXJh
Y3kgY29tcHV0YXRpb24KICAgICAgICBbUEFUQ0ggdjQgMDkvMTNdIGNsazogZXllcTogQWRkIE1v
YmlsZXllIEV5ZVE2THBsdXMgT0xCCgpBbmQgdGhlIHBhdGNoZXMgZnJvbSB0aGlzIHNlcmllczoK
ICAgICAgICBbUEFUQ0ggdjUgMDEvMTBdIGR0LWJpbmRpbmdzOiBzb2M6IG1vYmlsZXllOiBBZGQg
RXllUTdIIE9MQgogICAgICAgIFtQQVRDSCB2NSAwMi8xMF0gcmVzZXQ6IGV5ZXE6IEFkZCBFeWVR
N0ggY29tcGF0aWJsZXMKICAgICAgICBbUEFUQ0ggdjUgMDMvMTBdIGNsazogZml4ZWQtZmFjdG9y
OiBSZXdvcmsgaW5pdGlhbGl6YXRpb24gd2l0aCBwYXJlbnQgY2xvY2tzCiAgICAgICAgW1BBVENI
IHY1IDA0LzEwXSBjbGs6IGZpeGVkLWZhY3RvcjogRXhwb3J0IF9fY2xrX2h3X3JlZ2lzdGVyX2Zp
eGVkX2ZhY3RvcigpCiAgICAgICAgW1BBVENIIHY1IDA1LzEwXSBjbGs6IGV5ZXE6IFByZWZpeCB0
aGUgUExMIHJlZ2lzdGVycyB3aXRoIHRoZSBQTEwgdHlwZQogICAgICAgIFtQQVRDSCB2NSAwNi8x
MF0gY2xrOiBleWVxOiBJbnRyb2R1Y2UgYSBnZW5lcmljIGNsb2NrIHR5cGUKICAgICAgICBbUEFU
Q0ggdjUgMDcvMTBdIGNsazogZXllcTogQ29udmVydCBjbG9ja3MgZGVjbGFyYXRpb24gdG8gZXFj
X2Nsb2NrCiAgICAgICAgW1BBVENIIHY1IDA4LzEwXSBjbGs6IGV5ZXE6IERyb3AgUExMLCBkaXZp
ZGVycywgYW5kIGZpeGVkIGZhY3RvcnMgc3RydWN0cwogICAgICAgIFtQQVRDSCB2NSAwOS8xMF0g
Y2xrOiBleWVxOiBBZGQgRXllUTdIIGNvbXBhdGlibGVzCgpUaGUgbGFzdCBwYXRjaCB0byB0aGUg
TUFJTlRBSU5FUlMgZmlsZSBjYW4gYmUgbGVmdCBhc2lkZSBmb3Igbm93LCBJIGNhbgppbmNsdWRl
IGl0IGluIHRoZSBzZXJpZXMgaW50cm9kdWNpbmcgdGhlIEV5ZVE3SCBTb0MgKG5vdCB5ZXQgcG9z
dGVkKS4KCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjAyMjUtbWFjYi1w
aHktdjctMC02NjViZDg2MTlkNTFAYm9vdGxpbi5jb20vIApbMl06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDMxNi1leWVxNmxwbHVzLXY0LTAtYmY0NGRmYzdhMjYxQGJvb3RsaW4u
Y29tLwoKCkJlc3QgcmVnYXJkcywKLS0gCkJlbm/DrnQgTW9uaW4sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
