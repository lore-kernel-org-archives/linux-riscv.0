Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4ADC7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyroOE1ShEFwXU7tnOhGD71Yr6Ue1/R96yJlwaHmkis=; b=mIaHC9zgr2boIB
	2tUFU46J0r9d/ErGa6OhY1mH5IhPKOfKUbBTIm8ECigr2KmrQ1Kdj0kjXwEqYaZw5x+uVFZuQH6kX
	V+dAZEfzBFZVnkrLEFwbHuWccFwNSTH7vyH7M4LWW2XzEHSJJ4BQtctOogqN23iNd1u23m3f36O7B
	MCA+NsXqS4SQnf9sv3Jt7o1hOrVzhWi92zORhkb4EP7u5AigpYZIJkZQGqeHMcVoGqs0DSIKPL81S
	iqvj4QrgwSgkIrt76WWjmlibwuaEOqK+tidp2Kpnhahv++0WHjSCJHmsu4k44H2el+HwaswcMSRNJ
	QgkHnro4WwbFsVUU9fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5cY-0000000E9In-0Iwq;
	Fri, 27 Jun 2025 09:43:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5av-0000000E99S-449t
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:42:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 081091FD35;
	Fri, 27 Jun 2025 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751017321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebkQpOy7jU/hd2ovSMuvbdUVcZ8KbjpAp3Ecuke29NM=;
	b=ANo4mvApogHPe4fMWd2QFeBCg+mWgojUEV8XaXM/25ncURaUsz9M/kEC6Nn6IVH4maVX6j
	gSeSCAUP/wlUINz90v32u/TeUsei8qUxIXQS6gDZRhsaB8zBNJmzkdZiaYtkNAavTknDsP
	dRdh+FNdH2dlKN6La4DumIswSehs0FgFn89O4Iokd0AoNO4qnLq0SpsC6O1yrdqCLW9b2k
	h9Upd+221NuY96MmaBC7ix86cApTM5GZSfo0ZV56K/KAoyKWrsuFyHBZ31W4LK69SU2LzV
	acuBc9jpT4Ril5gE8uY2KWJvi1SV/M7Wfe4OOWc+QLioRAkbvmT+bkVgu9R1Iw==
Date: Fri, 27 Jun 2025 11:41:51 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>, Rafal Ozieblo
 <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
 instances on Mobileye EyeQ5 SoCs
Message-ID: <20250627112234.1cb54133@2a02-8440-d103-6715-ef68-2a2e-b947-8885.rev.sfr.net>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgeeijeekteffhfelheetffeghfffhfeufeeifeffjeeftefhveduteduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgeegtdemugdutdefmeeijeduheemvghfieekmedvrgdvvgemsgelgeejmeekkeekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmeguuddtfeemieejudehmegvfheikeemvdgrvdgvmegsleegjeemkeekkeehpdhhvghlohepvdgrtddvqdekgeegtddqugdutdefqdeijeduhedqvghfieekqddvrgdvvgdqsgelgeejqdekkeekhedrrhgvvhdrshhfrhdrnhgvthdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_024206_489307_75980F22 
X-CRM114-Status: GOOD (  11.69  )
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

SGkgVGjDqW8sCgpPbiBGcmksIDI3IEp1biAyMDI1IDExOjA4OjQ2ICswMjAwClRow6lvIExlYnJ1
biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBNb2JpbGV5ZSBFeWVRNSBTb0Nz
IHByb3ZpZGVzIHR3byBHRU0gSVAgYmxvY2tzLiBUaGUgZW5kIHJlc3VsdCBvZiB0aGlzCj4gc2Vy
aWVzIGlzIHdvcmtpbmcgMUcgbmV0d29ya2luZyBvbiB0aGUgRXllUTUgZXZhbCBib2FyZC4gSXQg
aXNuJ3QganVzdAo+IGEgbmV3IG1hY2JfY29uZmlnICYgY29tcGF0aWJsZSwgd2UgYWxzbyBwcm92
aWRlIHNvbWUgY2xlYW51cCAmIGZpeGVzCj4gYWxvbmcgdGhlIHdheS4KPiAKPiBkdC1iaW5kaW5n
czoKPiAgIFtQQVRDSCBuZXQtbmV4dCB2MiAwMS8xOF0gZHQtYmluZGluZ3M6IG5ldDogY2Rucyxt
YWNiOiBzb3J0IGNvbXBhdGlibGVzCj4gICBbUEFUQ0ggbmV0LW5leHQgdjIgMDIvMThdIGR0LWJp
bmRpbmdzOiBuZXQ6IGNkbnMsbWFjYjogYWRkIE1vYmlsZXllIEV5ZVE1IGV0aGVybmV0IGludGVy
ZmFjZQo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDAzLzE4XSBkdC1iaW5kaW5nczogbmV0OiBjZG5z
LG1hY2I6IGFsbG93IHRzdV9jbGsgd2l0aG91dCB0eF9jbGsKPiAgIFtQQVRDSCBuZXQtbmV4dCB2
MiAwNC8xOF0gZHQtYmluZGluZ3M6IG5ldDogY2RucyxtYWNiOiBhbGxvdyBkbWEtY29oZXJlbnQK
PiAKPiBDbGVhbnVwOgo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDA1LzE4XSBuZXQ6IG1hY2I6IHVz
ZSBCSVQoKSBtYWNybyBmb3IgY2FwYWJpbGl0eSBkZWZpbml0aW9ucwo+ICAgW1BBVENIIG5ldC1u
ZXh0IHYyIDA2LzE4XSBuZXQ6IG1hY2I6IFJlbW92ZSBsb2NhbCB2YXJpYWJsZXMgY2xrX2luaXQg
YW5kIGluaXQgaW4gbWFjYl9wcm9iZSgpCj4gICBbUEFUQ0ggbmV0LW5leHQgdjIgMDcvMThdIG5l
dDogbWFjYjogZHJvcCBtYWNiX2NvbmZpZyBOVUxMIGNoZWNraW5nCj4gICBbUEFUQ0ggbmV0LW5l
eHQgdjIgMDgvMThdIG5ldDogbWFjYjogaW50cm9kdWNlIERNQSBkZXNjcmlwdG9yIGhlbHBlcnMg
KGlzIDY0Yml0PyBpcyBQVFA/KQo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDA5LzE4XSBuZXQ6IG1h
Y2I6IHNvcnQgI2luY2x1ZGVzCj4gCj4gRml4ZXM6Cj4gICBbUEFUQ0ggbmV0LW5leHQgdjIgMTAv
MThdIG5ldDogbWFjYjogcmVtb3ZlIGlsbHVzaW9uIGFib3V0IFRCUVBIL1JCUVBIIGJlaW5nIHBl
ci1xdWV1ZQo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDExLzE4XSBuZXQ6IG1hY2I6IHNpbmdsZSBk
bWFfYWxsb2NfY29oZXJlbnQoKSBmb3IgRE1BIGRlc2NyaXB0b3JzCj4gICBbUEFUQ0ggbmV0LW5l
eHQgdjIgMTIvMThdIG5ldDogbWFjYjogbWF0Y2ggc2tiX3Jlc2VydmUoc2tiLCBORVRfSVBfQUxJ
R04pIHdpdGggSFcgYWxpZ25tZW50Cj4gICBbUEFUQ0ggbmV0LW5leHQgdjIgMTMvMThdIG5ldDog
bWFjYjogYXZvaWQgZG91YmxlIGVuZGlhbm5lc3Mgc3dhcCBpbiBtYWNiX3NldF9od2FkZHIoKQoK
Rml4ZXMgZ28gdGhyb3VnaCB0aGUgbmV0IHRyZWUsIGFuZCBuZXcgZmVhdHVyZXMgdGhyb3VnaCBu
ZXQtbmV4dCA6CgpodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL21haW50YWluZXItbmV0
ZGV2Lmh0bWwjbmV0ZGV2LWZhcQoKQXMgdGhpcyBzZXJpZXMgaXMgcXVpdGUgYmlnLCBpdCBjb3Vs
ZCBiZSBuaWNlIHRvIHNlbmQgdGhlIGNsZWFudXBzIGFuZApmaXhlcyBpbiBkZWRpY2F0ZWQgc2Vy
aWVzLCBhbmQgdGhlbiB0aGUgZXllUTUgc3VwcG9ydCBpbiBpdHNlbGYgYXMgYQpzdGFuZGFsb25l
IHNlcmllcy4gVGhpcyB3b3VsZCBtYWtlIHRoZSByZXZpZXcgd29yayBlYXNpZXIuCgoKPiBFeWVR
NSBzdXBwb3J0Ogo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDE0LzE4XSBuZXQ6IG1hY2I6IGFkZCBu
byBMU08gY2FwYWJpbGl0eSAoTUFDQl9DQVBTX05PX0xTTykKPiAgIFtQQVRDSCBuZXQtbmV4dCB2
MiAxNS8xOF0gbmV0OiBtYWNiOiBBZGQgIm1vYmlsZXllLGV5ZXE1LWdlbSIgY29tcGF0aWJsZQo+
IAo+IERUUzoKPiAgIFtQQVRDSCBuZXQtbmV4dCB2MiAxNi8xOF0gTUlQUzogbW9iaWxleWU6IGFk
ZCBFeWVRNSBETUEgSU9DVSBzdXBwb3J0Cj4gICBbUEFUQ0ggbmV0LW5leHQgdjIgMTcvMThdIE1J
UFM6IG1vYmlsZXllOiBleWVxNTogYWRkIHR3byBDYWRlbmNlIEdFTSBFdGhlcm5ldCBjb250cm9s
bGVycwo+ICAgW1BBVENIIG5ldC1uZXh0IHYyIDE4LzE4XSBNSVBTOiBtb2JpbGV5ZTogZXllcTUt
ZXBtOiBhZGQgdHdvIENhZGVuY2UgR0VNIEV0aGVybmV0IFBIWXMKCk1heGltZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
