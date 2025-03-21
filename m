Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE86FC36007
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tmj9wxSHlYWZM1iPOtwh57xhlo9/n9Ju1FXDDJ7ioFA=; b=30hP392QmKDFNy
	N9R39Cbpo/k2znm/xQojA0uDZS3SN0ju8pFjNx1FSrVMWvJ0Xt/L8/m23dOuTvqF16u07VR0+6Nxg
	bW8Kqhd5BoWyQR0FhtlT016AtCD0VRXNgpELz27gxiNkcvRR37Auk1hVxb1we6u4kt+vgkR0wu2Mk
	IamvTrca8/HqrIGycY3ZKqX0QoKcBQDREwIrbBzyuzo27/JtwofTK2Vrl9RMik8wYo+KTA0/5B8jm
	SNqGBgB4rYq9ZM/6bGlPjtK+BTu75EfCvlNIoAeuuNGeBHSeJr63LMqEWnKpk0ZaD6nnVPfk4eaum
	Ulbi7uVx6cviTWEkmDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhpE-0000000FzWT-2mCO;
	Fri, 21 Mar 2025 19:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhoy-0000000FzPH-3ONp
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Mar 2025 19:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qV/BzZ4NMUb9fMiduuWLEtJE4+30wNUTrCBlJGz+oF0=; b=ismLQzruNa9WN/eXMnZalrYAZs
	TICcbPKHiOPV22obQun9PbsZ7IWRx/dWKOq5ly+pJXxOIhTGf29acu/jUpZMIrtB4qweHjgzMA8sD
	/P608ZaZZCyOspHcwE3qTueYtPzbdA7yhLz7X4hevo9HVw9meVdfANDQNDuqFhzR8MPpmhucL7m1m
	MjQMZtUX1QXFKfCFdwxka32qHh2jWsTS7qt8OEHk68PsAoGTjXcyuOW+aKe6ozBXltOgJZFKPCIDf
	d5LTObhDhmeRHqWEiKcYaGfp08c0LzoRqm93eRFY08wBmtO1BInrXZEZuAT3KkVMfF1CkH0NAj8GR
	q8sv/ybQ==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhov-00000004Vnx-3L1y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C67D443F3;
	Fri, 21 Mar 2025 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV/BzZ4NMUb9fMiduuWLEtJE4+30wNUTrCBlJGz+oF0=;
	b=WuxxUnICXSYDWDNEhubsFgp0e4HvOPccnGNoiLnGr9kRIoIxhvfPzMd6Azpwa6bktYkRzd
	6eyoGfu7aSmQ5iBAGsbNacbfC4kaRlQ+0H1s6himQcuxwhh82b0VNA+UELdV54HFLpeRYa
	oO2BSLtDm9wy6ochWMu60mspuWef+eN4MDMNNYQLuGAs/NrJlfoluAW11IqYZLWUmkLYNH
	a7Oj+RDrg6VA/OPl1lyKijheOEhPA3J2m/ESfV5H1kbPlFHshcoN3X7qUshuiQfGHa4AtV
	9Klm+Y1fzIvdZ4IjXSNnGwGnEYSRwOqGAdxXDECOQHz4cF5NH1pfwpKLaWsJhQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:44 +0100
Subject: [PATCH net-next 13/13] MIPS: mobileye: eyeq5-epm: add two Cadence
 GEM Ethernet PHYs
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-13-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
In-Reply-To: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
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
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepihhnvghtpeejjedrudefhedrkedurdeihedphhgvlhhopegludelvddrudeikedruddrfedtngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepkhhusggrs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_191417_908459_4EDD67B0 
X-CRM114-Status: UNSURE (   6.41  )
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
CgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgot
LS0KIGFyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cyB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cyBi
L2FyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS1lcG01LmR0cwppbmRleCA2ODk4YjJk
ODI2N2RmYWRlZWE1MTFhODRkMWRmM2Y3MDc0NGYxN2JiLi4yMGRmYzg1NjgxYmIwMzMzMDk4MWNh
MGYxMWIyZWRmZmYzZmE1N2JjIDEwMDY0NAotLS0gYS9hcmNoL21pcHMvYm9vdC9kdHMvbW9iaWxl
eWUvZXllcTUtZXBtNS5kdHMKKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL21vYmlsZXllL2V5ZXE1
LWVwbTUuZHRzCkBAIC0yMSwzICsyMSwyOSBAQCBtZW1vcnlAMCB7CiAJCSAgICAgIDwweDggMHgw
MjAwMDAwMCAweDAgMHg3RTAwMDAwMD47CiAJfTsKIH07CisKKyZtYWNiMCB7CisJcGh5LW1vZGUg
PSAic2dtaWkiOworCXBoeS1oYW5kbGUgPSA8Jm1hY2IwX3BoeT47CisKKwltZGlvIHsKKwkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCQltYWNiMF9waHk6IGV0
aGVybmV0LXBoeUBlIHsKKwkJCXJlZyA9IDwweEU+OworCQl9OworCX07Cit9OworCismbWFjYjEg
eworCXBoeS1tb2RlID0gInJnbWlpLWlkIjsKKwlwaHktaGFuZGxlID0gPCZtYWNiMV9waHk+Owor
CisJbWRpbyB7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KwkJbWFjYjFfcGh5OiBldGhlcm5ldC1waHlAZSB7CisJCQlyZWcgPSA8MHhFPjsKKwkJfTsKKwl9
OworfTsKCi0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
