Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D45EC83010
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0AZgIZ+J+6zk6gdn6AThV87koog6jZU5K40r8GZrXY=; b=SKFh2bNAL8fwm4
	6R5bI76haKbZmgka6ChqdMV8D24wjKzqtynKT9i0P+aW5uca1mz/sOiwh9rpMZ34naYd9MOYDRKp5
	RIGcboKobk8gJ7a35N4E6khAJbMN5MUBFRmHz+1ItDEfE+lkKBrWyy3D6WS+nKwVp2MxtkrrKt5sB
	5XTq/hZFftUNtlxwJ8GO0E/uSGRkVxuej//Varu9MVPiht7QWlCY+76nnhIlwWRPOkXUCOOAqg8+0
	2LLdVaqtn5uBGwb4dvebl0WtijtU5cZuvss4giMMZWRxvViscmbuuVNwhXKTNtN6CpA+H6qwE4oDO
	XXEQ+FzKkiwWe5WZp1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Ff-0000000EFr8-3PeW;
	Fri, 27 Jun 2025 10:24:11 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55q-0000000E3KJ-07KX
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:10:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C556E4391D;
	Fri, 27 Jun 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASRiFVp5ZFhKvwm/2Lsajqh0Hrof/9pCxPbZ+iqYjHE=;
	b=kQ/Jcgki2tmSJyior01LIrOt1jFieJEVoPTJGuWxJMaOYnYQF79onv+z57Z5HP6Fe3Rp+3
	AupmOzJ1ICFrv77bDPt4adn7E9/JduZ3ul6qNrDSgxT+vtoR0GilVi9BTjcNGTJrJsTk5o
	yUI+myeztHe9jCyl3c980ZIY5eNV4AFFcjoKwLY5DAY2/2AQflVPHZ+kuVQTFqEfAVbYtg
	ZQlrgTxA36+jLKzMhFLD4GPrUZqntgRj7bIeuYEx/PzKhAwGvvdfOjmY65ROi9KZQxiYQL
	akWLuyPrNB5x245ewRC9Qspfthp+LegJ5CxADwkwbnk2M6Ge4Aj7N92VUszk2w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:04 +0200
Subject: [PATCH net-next v2 18/18] MIPS: mobileye: eyeq5-epm: add two
 Cadence GEM Ethernet PHYs
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-18-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020958_227716_15F2BEDD 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

VGhlIE1vYmlsZXllIEV5ZVE1IGV2YWwgYm9hcmQgKEVQTSkgZW1iZWRzIHR3byBNRElPIFBIWXMu
CgpSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgpTaWduZWQtb2ZmLWJ5
OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGFyY2gvbWlwcy9i
b290L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cyBiL2FyY2gvbWlwcy9ib290
L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cwppbmRleCA2ODk4YjJkODI2N2RmYWRlZWE1MTFh
ODRkMWRmM2Y3MDc0NGYxN2JiLi4zZDhhZjViNDY3NWIyNGMyZmEyODRhNTJlNTM3YTQzNjYyMjZh
Y2MyIDEwMDY0NAotLS0gYS9hcmNoL21pcHMvYm9vdC9kdHMvbW9iaWxleWUvZXllcTUtZXBtNS5k
dHMKKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1LWVwbTUuZHRzCkBAIC0y
MSwzICsyMSwyOSBAQCBtZW1vcnlAMCB7CiAJCSAgICAgIDwweDggMHgwMjAwMDAwMCAweDAgMHg3
RTAwMDAwMD47CiAJfTsKIH07CisKKyZtYWNiMCB7CisJcGh5LW1vZGUgPSAic2dtaWkiOworCXBo
eS1oYW5kbGUgPSA8Jm1hY2IwX3BoeT47CisKKwltZGlvIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCQltYWNiMF9waHk6IGV0aGVybmV0LXBoeUBlIHsK
KwkJCXJlZyA9IDwweGU+OworCQl9OworCX07Cit9OworCismbWFjYjEgeworCXBoeS1tb2RlID0g
InJnbWlpLWlkIjsKKwlwaHktaGFuZGxlID0gPCZtYWNiMV9waHk+OworCisJbWRpbyB7CisJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJbWFjYjFfcGh5OiBl
dGhlcm5ldC1waHlAZSB7CisJCQlyZWcgPSA8MHhlPjsKKwkJfTsKKwl9OworfTsKCi0tIAoyLjUw
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
