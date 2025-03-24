Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9791CC36008
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79OHlheqx55cquB2Ik/mdGqRDXuDMcodhNjHrnvePas=; b=J8MzwKYgEQIIpt
	Dv6X7tGhzsAWivxXbTA7J9k3qQZOpIc4vgIxJxuD0FYcHehrteEVyjgd1uKK+O38M2K04VFSvfqzD
	6rL/1vzapmHcpptV/EgR6oXzLWPulhkG7KuFmXJJpyNJz4Hx3wwsKnxcaZMluqHsmGmOFj9fDujoo
	PGdTx1hoYkdGRuHP+m4IkYEB7rBK4+eERraVYq7Tt7AIMhDPX2umotD8OPGQ+rFVNahm7wcJAJHub
	ZBhMB7uATgt1CFdeds0UD6NIsmiBb7TyJFHqncxym26ANxG3GdbG/5ViyGhigbeo+DuP+do0NrON6
	7m0ggQ76BAQ3P0f3snAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdao-00000002eCA-3W7N;
	Mon, 24 Mar 2025 08:55:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdal-00000002e9j-03eZ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:55:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BDA320489;
	Mon, 24 Mar 2025 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742806525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pG9q230YV2JmwTswVwXq9HoXcRvHfMmKuKyEAi/ub7U=;
	b=hyikKVyfkgp3VtvCVq7oMLFqgKvnzKCJp7K2wdACjjNzSsQ91gySwi2Ltt9w4CBYd6RnTO
	JR2GTENx6Axhwyd5snF5bf8HXghvJGlHSs+mf3LVk/YYSpdmbXVCCt8e/lfTSKB/x5zViO
	msHBntXgYENI1S1o6FKruXpbLwgy+WrrTHuv9N6W8LWUxdL4TnTQKvNwiyw4PmV1507g1K
	KDuDJFRFMjfhl93YD6BFEF8MrVmM29CrvM0M8NkBQMxeHJV7n7JQdas4O4dp8CcD07lJEH
	1k6rHLrDYvZxr5tjbR2PeWvmE6q7PLGPmhCn0HhvCiKmSubpYL62PG8WPIImPg==
Date: Mon, 24 Mar 2025 09:55:22 +0100
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
 <gregory.clement@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 08/13] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
Message-ID: <20250324095522.2ab1c38b@fedora.home>
In-Reply-To: <20250321-macb-v1-8-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
	<20250321-macb-v1-8-537b7e37971d@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhft
 hdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_015531_795619_65477615 
X-CRM114-Status: GOOD (  11.11  )
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

SGVsbG8gVGjDqW8sCgpPbiBGcmksIDIxIE1hciAyMDI1IDIwOjA5OjM5ICswMTAwClRow6lvIExl
YnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBJbnRyb2R1Y2UgbWFjYl9k
bWFfaXNfNjRiKCkgYW5kIG1hY2JfZG1hX2lzX3B0cCgpIGhlbHBlciBmdW5jdGlvbnMuCj4gTWFu
eSBjb2RlcGF0aHMgYXJlIG1hZGUgc2ltcGxlciBieSBkcm9wcGluZyBjb25kaXRpb25hbCBjb21w
aWxhdGlvbi4KPiAKPiBUaGlzIGltcGxpZXMgdGhyZWUgY2hhbmdlczoKPiAgLSBBbHdheXMgY29t
cGlsZSByZWxhdGVkIHN0cnVjdHVyZSBkZWZpbml0aW9ucyBpbnNpZGUgPG1hY2IuaD4uCj4gIC0g
TWFrZSB0aGUgZmllbGQgaHdfZG1hX2NhcCBpbiBzdHJ1Y3QgbWFjYiBhbHdheXMgcHJlc2VudC4K
PiAgLSBNQUNCX0VYVF9ERVNDIGNhbiBiZSBkcm9wcGVkIGFzIGl0IGlzIHVzZWxlc3Mgbm93Lgo+
IAo+IFRoZSBjb21tb24gY2FzZSBpczoKPiAKPiAJI2lmZGVmIENPTkZJR19BUkNIX0RNQV9BRERS
X1RfNjRCSVQKPiAJCXN0cnVjdCBtYWNiX2RtYV9kZXNjXzY0ICpkZXNjXzY0Owo+IAkJaWYgKGJw
LT5od19kbWFfY2FwICYgSFdfRE1BX0NBUF82NEIpIHsKPiAJCQlkZXNjXzY0ID0gbWFjYl82NGJf
ZGVzYyhicCwgZGVzYyk7Cj4gCQkJLy8gLi4uCj4gCQl9Cj4gCSNlbmRpZgo+IAo+IEFuZCByZXBs
YWNlZCBieToKPiAKPiAJc3RydWN0IG1hY2JfZG1hX2Rlc2NfNjQgKmRlc2NfNjQ7Cj4gCWlmICht
YWNiX2RtYV9pc182NGIoYnApKSB7Cj4gCQlkZXNjXzY0ID0gbWFjYl82NGJfZGVzYyhicCwgZGVz
Yyk7Cj4gCQkvLyAuLi4KPiAJfQoKSnVzdCBhIHRob3VnaHQsIGJ1dCB0aGlzIGlzIGFkZGluZyBz
b21lIG1vcmUgYnJhbmNoZXMgaW4gdGhlIGhvdHBhdGggb24KMzIgYml0cyBETUEgc2V0dXBzLiBE
aWQgeW91IG1lYXN1cmUgYW55IHBlcmZvcm1hbmNlIGNoYW5nZXMgb24KdGhlc2UgcGxhdGZvcm1z
IChpZiB5b3UgaGF2ZSBhY2Nlc3MgdG8gb25lIDopICkKCkFzIHRoZSBjYXBzIGNhbid0IGJlIGNo
YW5nZWQgZHluYW1pY2FsbHksIG1heWJlIHRoZXNlIGhlbHBlcnMgY291bGQgYmUKcmVwbGFjZWQg
bW9yZSBlZmZpY2llbnRseSB3aXRoIHNvbWUgc3RhdGljX2tleSA/IFRoaXMgd291bGQgYmVuZWZp
dApib3RoIDMyIGFuZCA2NCBiaXRzIHN5c3RlbXMgYXMgdGhlIGZvbGxvd2luZyB3b3VsZCBiZSBt
b3JlIGVmZmljaWVudAoKCWlmIChicC0+aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfNjRCKSB7CgkJ
Ly8gIC4uLgoJfQoKSnVzdCBhIHRob3VnaHQgb2YgY291cnNlLCBtYXliZSB0aGlzIHBhdGNoIGRv
ZXNuJ3QgcmVhbGx5IGh1cnQgcGVyZnMgOikKCk1heGltZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
