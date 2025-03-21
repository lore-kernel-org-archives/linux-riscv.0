Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC2FC36008
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXjhsVcEEQ9XwUvzPmHkbluIHv0BoGHk/ZTlbZvTl9s=; b=WFwDPqJuoNHoSk
	srniIstaxgqI9QUyxkfEzFc6EtYQSd3d0YWNWmzqazxDqswA0oW2vW3FKG/aji4q/ANNA/MWnSuBH
	ayA0ffgVQy/jZXVqornjsMWC+LmmhAZCkckm0dbQ0LPG4LINwyPZnDcF00nXnXfFVfMYWqvtu1YG6
	fFauXczDR+QFBkttlsjJpbsKttuWl5E0uEQ33AGUW297o2Q4FpFneSikyfo7JozlhPKIAV80A41rN
	TRvs6yfSJ+pDjbN18L4VIpOYTX7LON5i3K1G9gRKW331TMAVkjq1QE1G2makTJCG3KgDhrkiFRy2t
	ENK8/9On4kS187AXOO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp7-0000000FzQx-0NNj;
	Fri, 21 Mar 2025 19:14:29 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhog-0000000FzJZ-04QS
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 638C344554;
	Fri, 21 Mar 2025 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiE8yWDmE5ieiLpljw/I6k+OSUnyDXBb+4UjDl98ElI=;
	b=GS6MXkY6slLO1NYad/F3dRS5uGTcOWIsvM7KAeZGx2Q79KrquRP+h2Lf2mK+90f3m7E/tA
	LYHAqsmTiGKqFqdmGzeNEXvZEyKdCBSHGVeVVg8c+pQ9VAXPYGTb3J1aGKn+fotUkt9NZR
	2JwLdJNVwnl/ql/PDAA2tzRoHtby9+hWs+SmQ7ObjTc1knwNrhIQscLT9kckSPX42vxo4V
	DPdvTwG0jc91E3MyW1ujDj5lmhTk/0M8f37rwF/gJH+dARqTLkp2tiixlIwRBvJEuWHul7
	LlhQcWQa4ddw9e81Pbbz5RaGcqN+wogroUWcvoaLybeHVLqt8Bs/QXBP6ejI9w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:33 +0100
Subject: [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow tsu_clk
 without tx_clk
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-2-537b7e37971d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_121402_181282_A432C58B 
X-CRM114-Status: UNSURE (   7.69  )
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

QWxsb3cgcHJvdmlkaW5nIHRzdV9jbGsgd2l0aG91dCBhIHR4X2NsayBhcyBib3RoIGFyZSBvcHRp
b25hbC4KClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5j
b20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2Iu
eWFtbCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2Ru
cyxtYWNiLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMs
bWFjYi55YW1sCmluZGV4IDMwNmQxNDk1ODc3OGRmMWE4MGExNWUyNGQ4ZWQ1NDA5NzA0NjEzYmUu
LjM2ZmNhZTFiMjBkNzU3YjNlYmU2MTVhOWZjNjYwNjgwMDBkZWQ1NmQgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbApAQCAt
ODUsNyArODUsNyBAQCBwcm9wZXJ0aWVzOgogICAgIGl0ZW1zOgogICAgICAgLSBlbnVtOiBbIGV0
aGVyX2NsaywgaGNsaywgcGNsayBdCiAgICAgICAtIGVudW06IFsgaGNsaywgcGNsayBdCi0gICAg
ICAtIGNvbnN0OiB0eF9jbGsKKyAgICAgIC0gZW51bTogWyB0eF9jbGssIHRzdV9jbGsgXQogICAg
ICAgLSBlbnVtOiBbIHJ4X2NsaywgdHN1X2NsayBdCiAgICAgICAtIGNvbnN0OiB0c3VfY2xrCiAK
Ci0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
