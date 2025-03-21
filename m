Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C65C3600B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnTgf1mF7rLjQ5AAvmeKJdEEJGFNb7ubrkfWQDSDqjU=; b=t5nC14oyb4uGud
	CeuOMXTz4u1bdiQ8IId1TVXAmtgRfqzJFVJYtDjhnC3sVseeqJo1Pbx2pCIphtsDottjTy6mVHqvq
	BwMqovkQU+kowbDiKlxoZBHMrpBrc0bUdk/ZKNp1SkRf+iTSYTylsiBR8CEe8lXajgZXZnxQnIwex
	iOvNmTHh0mPRLS62EnfgbQ/RbTtEqUs98dTeLKiAUfhWo+yRRJ21sWrvShw6E4csxJnTfS3aPbUJ1
	zCBvYYlnnpKPJzfRfiCBgGG6X88Q/yN4R4qOKFh9mWTPyOLjql/HESwL/dajJBZ8ZNT0p7x/XM3MX
	M5rdku11OQZCMNr/kH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhpB-0000000FzUZ-41kO;
	Fri, 21 Mar 2025 19:14:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhop-0000000FzN4-2RaR
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEF8E4454F;
	Fri, 21 Mar 2025 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cj4PjePZ8L7ZRpmqoA742jyqYhMFuSfbXddrKwz88Xs=;
	b=g/jVBZv4Bcb9EF8GtX2PDQPtvxAp6N0dLKzZYBLMBhDQcpX9FeORODffuHbf9+TvFf5/Lw
	t4MiTUK7HLpotqowgZSrVqRSyLnaceic+J5hg+eqjL9kAG+OWoj6icCI9PmDjtL9uKUeIa
	UmiDlRqV/Esa8a+Z65bz4+RI8tmj3B0LnkLdyzmIHyrMZtyLZDuqg7UVQh8OdM+979w1tn
	gVxCVek+z4vauMGK8cxSpD0hpQD6rXh4PZFuorZsZNFdx/a8iQTKICizTsswfp0/n514Qf
	toR///MQZ42Bj8ZMOluyQ8Ijb00Y7vA+K85tcYT39L268B0+ufp1XoKD7TLPlA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:40 +0100
Subject: [PATCH net-next 09/13] net: macb: sort #includes
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-9-537b7e37971d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_121411_749449_1E864C6E 
X-CRM114-Status: UNSURE (   6.64  )
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

U29ydCAjaW5jbHVkZSBwcmVwcm9jZXNzb3IgZGlyZWN0aXZlcy4KClNpZ25lZC1vZmYtYnk6IFRo
w6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyB8IDQwICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKaW5kZXggYWQxNTRjZmUy
OTEwNmY2NDJiMzI5MjJmZDRhMDNjYTYzMTEyZjRhNy4uNzkxNjFkNTU5MTY2NDc4Zjg1YTZmODI5
NGQ0ODhlZDk2MWQ5YmU3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiX21haW4uYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFp
bi5jCkBAIC02LDM5ICs2LDM5IEBACiAgKi8KIAogI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERf
TU9ETkFNRSAiOiAiIGZtdAotI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgotI2luY2x1ZGUgPGxpbnV4
L2Nsay1wcm92aWRlci5oPgotI2luY2x1ZGUgPGxpbnV4L2NyYzMyLmg+Ci0jaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+Ci0jaW5jbHVkZSA8bGludXgvbW9kdWxlcGFyYW0uaD4KLSNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4KLSNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4
L2NpcmNfYnVmLmg+Ci0jaW5jbHVkZSA8bGludXgvc2xhYi5oPgotI2luY2x1ZGUgPGxpbnV4L2lu
aXQuaD4KLSNpbmNsdWRlIDxsaW51eC9pby5oPgorI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRl
ci5oPgorI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgorI2luY2x1ZGUgPGxpbnV4L2NyYzMyLmg+Cisj
aW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KKyNpbmNsdWRlIDxsaW51eC9ldGhlcmRldmlj
ZS5oPgorI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlL3hsbngtenlucW1wLmg+CiAjaW5jbHVkZSA8
bGludXgvZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KKyNpbmNsdWRl
IDxsaW51eC9pbmV0ZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvaW5pdC5oPgogI2luY2x1ZGUg
PGxpbnV4L2ludGVycnVwdC5oPgorI2luY2x1ZGUgPGxpbnV4L2lvLmg+CisjaW5jbHVkZSA8bGlu
dXgvaW9wb2xsLmg+CisjaW5jbHVkZSA8bGludXgvaXAuaD4KKyNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVw
YXJhbS5oPgogI2luY2x1ZGUgPGxpbnV4L25ldGRldmljZS5oPgotI2luY2x1ZGUgPGxpbnV4L2V0
aGVyZGV2aWNlLmg+Ci0jaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KLSNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KLSNpbmNsdWRlIDxsaW51eC9waHlsaW5rLmg+CiAjaW5j
bHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8
bGludXgvb2ZfbWRpby5oPgogI2luY2x1ZGUgPGxpbnV4L29mX25ldC5oPgotI2luY2x1ZGUgPGxp
bnV4L2lwLmg+Ci0jaW5jbHVkZSA8bGludXgvdWRwLmg+Ci0jaW5jbHVkZSA8bGludXgvdGNwLmg+
Ci0jaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgor
I2luY2x1ZGUgPGxpbnV4L3BoeWxpbmsuaD4KKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcHRw
X2NsYXNzaWZ5Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KLSNpbmNsdWRlIDxsaW51eC9m
aXJtd2FyZS94bG54LXp5bnFtcC5oPgotI2luY2x1ZGUgPGxpbnV4L2luZXRkZXZpY2UuaD4KKyNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5jbHVkZSA8bGludXgvdGNwLmg+CisjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KKyNpbmNsdWRlIDxsaW51eC91ZHAuaD4KICNpbmNsdWRlICJtYWNiLmgi
CiAKIC8qIFRoaXMgc3RydWN0dXJlIGlzIG9ubHkgdXNlZCBmb3IgTUFDQiBvbiBTaUZpdmUgRlU1
NDAgZGV2aWNlcyAqLwoKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
