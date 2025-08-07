Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51096C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/PelvY4WXsLvMmCsUuPy74JqB5Y9SS2S3n38rOSnDQ=; b=xDcH/1ZPesimxi
	0Q6O9qiIkV7L4lWn0MhYvKVCKhE1C1U1iEJMRakswQRzAysjUYg7XP9HfS7O/f1vTmpKxpiUmtIqk
	INCGkQGXUSKpWpZu7BfEhAUGCePiLE1SAQJEz1wNKU5biY8sQrzXC6GZLrca3ybd+tLToAO2xVPku
	uHjP1Tw+JMTplUVT/gz9tSQzWy58PgyAoJehpRtT0W67pa+SDt2PVGbUUl4MAyN7F9rw6e8uORfAZ
	cgFqqTJNn5cTFpsImJA1UabB/8Mm4kyZBFEyed3GJEwp9Z/IjhiY7oxLbiZChCZfFaaA2JwevBUqq
	cnct6dMpSIYUC21WfFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1yC-00000000si5-1YrP;
	Thu, 07 Aug 2025 14:51:52 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1v2-00000000s72-24Uq
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 14:48:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B93CD43136;
	Thu,  7 Aug 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754578111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Msx94y0SDrajFtd2r5knNPPeel3I8uSUHF21B2iumHI=;
	b=dc460t1DfGOwUj8YDJJbl4IqqZwtR9DPwyVzAEZjO1BmD4IALnt9rVUR0N8M6ffKVISYec
	VLw9G2Q1DAkfQHSMoh1CUvuTR2sJTT3eGZq/HhFXqyYLXlYdfzBrhvtt5TRMvsrW+CizNX
	6A1ITZA2AANUIfe25Maz/wa82byPK0azaXkXcocxW+RBEg/+aDUYYEhtYbcoCWE1Pmy/G4
	BYA0crnBsJSgCOL+0oPas1vB9tBGT1JcIQjizCg0FeCdWtyb1ftSl9fWo/DfQleqstIVGc
	oMnxdfWFw9ofzVmfKLJo3gvW5Qi4FiMPtQv06OkfQALcxB/9TQrIvrAbpWO7zQ==
Mime-Version: 1.0
Date: Thu, 07 Aug 2025 16:48:27 +0200
Message-Id: <DBWA12ZND9TY.2SA3R9T5UJTZR@bootlin.com>
Subject: Re: [PATCH net-next v2 11/18] net: macb: single
 dma_alloc_coherent() for DMA descriptors
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Sean Anderson" <sean.anderson@linux.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Cyrille Pitchen"
 <cyrille.pitchen@atmel.com>, "Harini Katakam" <harini.katakam@xilinx.com>,
 "Rafal Ozieblo" <rafalo@cadence.com>, "Haavard Skinnemoen"
 <hskinnemoen@atmel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-11-ff8207d0bb77@bootlin.com>
 <7752e805-0a06-46ed-b4ac-a51081a73f78@linux.dev>
In-Reply-To: <7752e805-0a06-46ed-b4ac-a51081a73f78@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_074836_835754_7DEAB46B 
X-CRM114-Status: UNSURE (   9.60  )
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

SGVsbG8gU2VhbiwKClRoYW5rcyBmb3IgdGhlIHJldmlldyEgSSdsbCByZXBseSBvbmx5IHRvIHF1
ZXN0aW9ucyAob3IgY29tbWVudHMgYWJvdXQKd2hpY2ggSSBoYXZlIHF1ZXN0aW9ucykuCgpPbiBU
dWUgSnVsIDEsIDIwMjUgYXQgNjozMiBQTSBDRVNULCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+IE9u
IDYvMjcvMjUgMDU6MDgsIFRow6lvIExlYnJ1biB3cm90ZToKPj4gTW92ZSBmcm9tIHR3byAoVHgv
UngpIGRtYV9hbGxvY19jb2hlcmVudCgpIGZvciBETUEgZGVzY3JpcHRvciByaW5ncyAqcGVyCj4+
IHF1ZXVlKiB0byB0d28gZG1hX2FsbG9jX2NvaGVyZW50KCkgb3ZlcmFsbC4KPj4gCj4+IElzc3Vl
IGlzIHdpdGggaG93IGFsbCBxdWV1ZXMgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXIgZm9yIGNvbmZp
Z3VyaW5nIHRoZQo+PiB1cHBlciAzMi1iaXRzIG9mIFR4L1J4IGRlc2NyaXB0b3IgcmluZ3MuIEZv
ciBleGFtcGxlLCB3aXRoIFR4LCBub3RpY2UKPj4gaG93IFRCUVBIIGRvZXMgKm5vdCogZGVwZW5k
IG9uIHRoZSBxdWV1ZSBpbmRleDoKPj4gCj4+IAkjZGVmaW5lIEdFTV9UQlFQKGh3X3EpCQkoMHgw
NDQwICsgKChod19xKSA8PCAyKSkKPj4gCSNkZWZpbmUgR0VNX1RCUVBIKGh3X3EpCQkoMHgwNEM4
KQo+PiAKPj4gCXF1ZXVlX3dyaXRlbChxdWV1ZSwgVEJRUCwgbG93ZXJfMzJfYml0cyhxdWV1ZS0+
dHhfcmluZ19kbWEpKTsKPj4gCSNpZmRlZiBDT05GSUdfQVJDSF9ETUFfQUREUl9UXzY0QklUCj4+
IAlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0QikKPj4gCQlxdWV1ZV93cml0ZWwo
cXVldWUsIFRCUVBILCB1cHBlcl8zMl9iaXRzKHF1ZXVlLT50eF9yaW5nX2RtYSkpOwo+PiAJI2Vu
ZGlmCj4+IAo+PiBUbyBtYXhpbWUgb3VyIGNoYW5jZXMgb2YgZ2V0dGluZyB2YWxpZCBETUEgYWRk
cmVzc2VzLCB3ZSBkbyBhIHNpbmdsZQo+Cj4gbWF4aW1pemUKPgo+PiBkbWFfYWxsb2NfY29oZXJl
bnQoKSBhY3Jvc3MgcXVldWVzLgo+Cj4gSXMgdGhlcmUgcmVhbGx5IGFueSBjaGFuY2UgaW52b2x2
ZWQgKG90aGVyIHRoYW4gYXZvaWRpbmcgRU5PTUVNKT8KCklmIHdlIGxhbmQgaW4gdGhlIHRoZSBw
YWdlIGFsbG9jYXRvciBjb2RlcGF0aCBvZiBkbWFfYWxsb2NfY29oZXJlbnQoKSwKdGhlbiB3ZSBn
ZXQgbmF0dXJhbCBhbGlnbm1lbnQgZ3VhcmFudGVlcywgc2VlIGFsbG9jX3BhZ2VzKCkgY29tbWVu
dCBbMF0uCgpbMF06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2L3NvdXJj
ZS9tbS9tZW1wb2xpY3kuYyNMMjQ5OS1MMjUwMgoKSG93ZXZlciwgd2UgY2Fubm90IGJlIGNlcnRh
aW4gd2UgbGFuZCBpbiB0aGF0IHBhdGguIElmIHdlIGhhdmUgYW4KSU9NTVUsIHRoZW4gSSBkb24n
dCB0aGluayB0aGUgQVBJIHByb3ZpZGVzIHN0cm9uZyBlbm91Z2ggZ3VhcmFudGVlcy4KClNhbWUg
Zm9yIGN1c3RvbSBgc3RydWN0IGRtYV9tYXBfb3BzYCwgYmUgaXQgcGVyLWRldmljZSBvciBhcmNo
LXNwZWNpZmljLgpJIGFtIG5vdCBhd2FyZSAoaXMgYW55dGhpbmcgZG9jdW1lbnRlZCBvbiB0aGF0
Pykgb2YgYW55IGFsaWdubWVudApndWFyYW50ZWVzLgoKRXZlbiBpZiB0aG9zZSBnaXZlIHVzIHBh
Z2UtYWxpZ25lZCBhbGxvY2F0aW9ucywgdGhhdCBpc24ndCBlbm91Z2guIEZvcgpleGFtcGxlIGxl
dCdzIHNheSB3ZSB3YW50IDI1NktpQi4gV2UgZ2V0IDB4RkZGRjAwMDAgZnJvbSBhbiBhbGxvY2F0
b3IuClRoYXQgaXMgcGFnZSBhbGlnbmVkLCBidXQ6CgogICB1cHBlcl8zMl9iaXRzKFNUQVJUKSAg
ICAgICE9IHVwcGVyXzMyX2JpdHMoU1RBUlQgKyBTSVpFIC0gMSkKICAgdXBwZXJfMzJfYml0cygw
eEZGRkYwMDAwKSAhPSB1cHBlcl8zMl9iaXRzKDB4RkZGRjAwMDAgKyAweDQwMDAwIC0gMSkKICAg
MHgwICAgICAgICAgICAgICAgICAgICAgICAhPSAweDEKClRoYW5rcyEKCi0tClRow6lvIExlYnJ1
biwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
