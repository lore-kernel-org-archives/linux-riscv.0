Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C699AC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uD3t19QQqQ5TdXSNnv6GjBmp9Q3rQZmXY3B0MDEb5WU=; b=dRJZ3qt/etLbkU
	/T9cwoaCRH4U0lXiKZSj3oyynTFg+ETsGJ72ZGB1Cp+p5C6RnN2Ih3xeIXrgmdsLKnbuUKDv0xDNX
	aF3SBAYz6nO5bhzlntaBmSYfY+U0T5eRBU7Z1Kiu1mltGcJiPcj+xdQuAjwwhfodE1lUUWnteHk9/
	CESJI07kAoKeDB34nd0lBiJfOpZ309VC+vhvHP1iS1u/zsZJLapWHmygA+Ap7tzQ+QhYQ9gWU4i0t
	9gzOvS1THem4CxDKoNzHME5ZFCFCr5FP5nK4jHPtfpQNVy9SQgR16KrhZQIkZIe3MqI3eqbxO6/q6
	RJEledymIRm3BtsSdlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoki-0000000BIg3-2fGn;
	Thu, 27 Mar 2025 15:02:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoeF-0000000BH28-3UpR
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 14:56:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA2A8442C2;
	Thu, 27 Mar 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743087355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/grcYqbyYZQ5Vwrz2k3XVB96o14jNKChWN67TCZobuU=;
	b=CEW2RmAJ0ZDIzcNCEGfqG12mMeklqkwNJKpzCSlg6383UsHweJQM18ErERVBaRnbRDiGie
	Y7Ozeul3aVRs7XMAaBZTsKjhxCP9iXsJUJgx4cjfPqP4iGavMfaB2qDnQXDRSv0EDtV8Fm
	16EdXjq/0Nj/GW2ZB2OLb0tSumrEwK+EEi4ZL5Vel9p/PmA0ItmJ5cfcX2LYoUPb04vcJr
	kNqCv/yd/62DMcUWBXv9yv9ghC9WKt6sYUcWSkYTid/Lgzgnudv36zCZpXt+LObqISONbG
	ZGSDXoVYRhfSjNaETztUFouCkasuhDQIjuoCcjBBiMoBjwfqES17kC9jtLA5uA==
Mime-Version: 1.0
Date: Thu, 27 Mar 2025 15:55:52 +0100
Message-Id: <D8R4WB208RUL.14XIUFIVV416O@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-2-537b7e37971d@bootlin.com>
 <20250324163001.GA272324-robh@kernel.org>
In-Reply-To: <20250324163001.GA272324-robh@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffuvefvofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeluefgiefgtdegfeehjeetteevveejkefgiedtkeefteejgfdvkeffgeejhfduieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhto
 hepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_075600_157290_04F9FB76 
X-CRM114-Status: UNSURE (   7.55  )
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

T24gTW9uIE1hciAyNCwgMjAyNSBhdCA1OjMwIFBNIENFVCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4g
T24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDg6MDk6MzNQTSArMDEwMCwgVGjDqW8gTGVicnVuIHdy
b3RlOgo+PiBBbGxvdyBwcm92aWRpbmcgdHN1X2NsayB3aXRob3V0IGEgdHhfY2xrIGFzIGJvdGgg
YXJlIG9wdGlvbmFsLgo+Cj4gV2h5PyBJcyB0aGVyZSBzb21lIG5ldyBoL3c/IFdoZXJlJ3MgdGhl
IGNvbXBhdGlibGUgZm9yIGl0LiBPciB0aGlzIGZpeGVzIAo+IHNvbWUgZXhpc3RpbmcgdXNlcj8g
V2hpY2ggb25lPwoKSSBlbmNvdW50ZXJlZCB0aGlzIHdoaWxlIHN1cHBvcnRpbmcgYSBuZXcgY29t
cGF0aWJsZSB5ZXM6Cm1vYmlsZXllLGV5ZXE1LWdlbS4KCkJ1dCB0aGlzIGlzIG1vcmUgYWJvdXQg
cmVsYXhpbmcgdW5uZWVkZWQgcmVxdWlyZW1lbnRzOiB0aGUgcHJldmlvdXMKYmluZGluZ3Mgc2Fp
ZCAiaWYgeW91IHByb3ZpZGUgYSB0c3VfY2xrLCBwbGVhc2UgcHJvdmlkZSBhIHR4X2NsayIuIFRo
YXQKY29uc3RyYWludCBjYW4gYmUgcmVtb3ZlZCBhcyB0aGVyZSBpcyBubyByZWxhdGlvbiBpbmJl
dHdlZW4gdHhfY2xrIGFuZAp0c3VfY2xrLgoKU28gSSdkIGRlc2NyaWJlIHRoYXQgYXMgYSBzZW1h
bnRpYyBmaXggb2YgdGhlIGR0LWJpbmRpbmdzLCB0aGF0IGhhcHBlbnMKdG8gYmUgdXNlZnVsIGZv
ciBvdXIgbmV3bHkgaW50cm9kdWNlZCBjb21wYXRpYmxlLgoKT3IgYW0gSSBtaXN0YWtlbj8gSW4g
YW55IGNhc2UsIEkgc2hvdWxkIGV4cGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UuCgpUaGFua3MsCgot
LQpUaMOpbyBMZWJydW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
