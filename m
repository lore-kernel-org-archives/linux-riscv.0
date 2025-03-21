Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7ACC36008
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bD8kAJDSiul1slfcNQyDI7dfZrQHxZMwTgYElTqbMi8=; b=rHY/ftK0Jx063U
	XPMyHD8LFoRk4NDOcDAiIgjx5WVXAW9wepfv5U22wX8lsPEVQfjCRZd2NEJ+O4v2/uMJzLdLQotam
	vulNplUkycWjzVbmWs4O7xWMe6UanB79LJ6Whed3aG5o5gqdKdiPWQe3cFaeRZTt+Q9PkNlB5P66H
	QTD99bWBXCEW3xAjgRVtscaa+MZQ/oe1463VTFLsw0RSu95v7PaTi0B74IVRZ7tbMBVK3bgAfqYQs
	p8nW9iKIZYo2Nn5jxKnsMzf/qRs6NzRutlqFW0dRU7uKw3xjHpnwlINkiyoNRB/1c2jK4Vsw9H9ab
	m7CNaVo4mvXzq2WVPpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp7-0000000FzR5-2j5z;
	Fri, 21 Mar 2025 19:14:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhoi-0000000FzKo-3Wzk
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Mar 2025 19:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ktKyFV+gs0s4MsPwBDTe634NAC9awOKfQNSVwrSckjY=; b=MEL94pGcjFun+SYsuQ433RIyjP
	OYrkP5E9jVGjKEwb4VmUPS7TKF2GpdMMFLa5JZTHAry4KCXM5DVSv09h0JEcQIzmLbfTd0yVa66jy
	58cvkNwZLCJKPrx54+FjMaQyrRaarsN5w1T8o+aBTfdeEhl73CYWkkkfeuj+t4cRZDoErquAHcJNr
	BDT/DnV43rRrOfAUBd7thl1D9b34ZumFJmlF7/usUhoJqmdhDweZBR/leNsxcnovfJCu18ugJG44c
	7xQTm8+w5hLEHKPRsoHHFdyUEPOYUIaocMgBtH71QraNSduKEKaDys8SgEDKYd5BYOLZXgnKOTfMX
	6nB9fqvw==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhof-00000004VmU-33LB
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ED26443F3;
	Fri, 21 Mar 2025 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktKyFV+gs0s4MsPwBDTe634NAC9awOKfQNSVwrSckjY=;
	b=UMTQ3MdaZEqfozKPADZrbFLqp74eVp69gDzMyuPYd08rFvuieh8CzxsL6RGU06X0I6xCVp
	S1A32Z+KK/3X6KGymT2yeUqr0quNUeWy35aMyvnm/96K1ywfcNUNHEnF5Za8mWrZTi+fSN
	gz6n4qeoe4MQ1CeJWowNxACa/oOc6H2JSjPdXrClLAdu7EesRYuMVZ6hahJlVHKI2AQZSV
	lsNtJI3OIDLl+QAFUnC0PCUvoAAQ+SmPBDp2lzoR4BaqFK2iconP7IF9lfa8SV/xT2Z9ga
	2pC55bAMY1XjvmxaDUzOMk8fe3oZLnGQv/SxcuwP38jgJJvK1n/Wvl8IGk/vEQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:34 +0100
Subject: [PATCH net-next 03/13] dt-bindings: net: cdns,macb: allow
 dma-coherent
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-3-537b7e37971d@bootlin.com>
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
X-CRM114-CacheID: sfid-20250321_191401_899953_E738E6C1 
X-CRM114-Status: UNSURE (   6.97  )
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

T24gRXllUTUsIHRoZSBHRU0gRE1BIGNvbnRyb2xsZXIgaXMgY29oZXJlbnQgd2l0aCB0aGUgQ1BV
OwphbGxvdyBzcGVjaWZ5aW5nIHRoZSBpbmZvcm1hdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRow6lv
IExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbCB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbAppbmRleCAzNmZjYWUxYjIwZDc1N2IzZWJlNjE1YTlm
YzY2MDY4MDAwZGVkNTZkLi44YTNmMDgwN2ZmY2U4OWFiMTdiZjU2MTcyMjgzM2UzNTVhNGEwMjM4
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMs
bWFjYi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2Ru
cyxtYWNiLnlhbWwKQEAgLTExMiw2ICsxMTIsOCBAQCBwcm9wZXJ0aWVzOgogICBpb21tdXM6CiAg
ICAgbWF4SXRlbXM6IDEKIAorICBkbWEtY29oZXJlbnQ6IHRydWUKKwogICBwb3dlci1kb21haW5z
OgogICAgIG1heEl0ZW1zOiAxCiAKCi0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
