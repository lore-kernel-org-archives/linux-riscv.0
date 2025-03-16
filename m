Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0D5C282DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3t/JaG3Z4yUqBVLdWM9VQmM2pQIHjv9tKq9sVGoM1A=; b=e8ZGm5Sae+9ZXn
	daH26KZFNfGKSniLG81aF49BDouJ7zGXKyHimUKX3DHx5PXuddOohbSmJWM5mGIXFuA1o11EWunI3
	MsvXdXxu7rOMNJkCdSgSdRM5VXTYgyeISDSxBOWNWAugo54cQ99aQBRQVhEOHxXth7sePMdRSJr6W
	rzNxqULSzlrx6qWKYNL0xxNVrSRkJKeUJtF0xzsLCF249N8TCFuYUpkeA5f/LE/HBzcTIJXLBMqtK
	KMoUw9HLU5mqIizpvP2DEHUd9VMIgYY4JrHmuP3bt+bPQ4ofi6xM3khDyMSBq6oKdqzRziyLLybvP
	ETqg8KXctl8omvmHsIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttmbh-000000008qU-15nW;
	Sun, 16 Mar 2025 11:56:41 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttmbe-000000008oT-30Pv
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 11:56:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F112442C3;
	Sun, 16 Mar 2025 11:56:30 +0000 (UTC)
Message-ID: <8dea1327-747c-4fb5-b6f1-926c6811365d@ghiti.fr>
Date: Sun, 16 Mar 2025 12:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: migrate to the generic rule for built-in DTB
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241222000836.2578171-1-masahiroy@kernel.org>
 <CAK7LNAQMo0R09OcVw77=dyVnUbMv7gxxejHbr=dy4S-SgPT4-g@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAK7LNAQMo0R09OcVw77=dyVnUbMv7gxxejHbr=dy4S-SgPT4-g@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeiheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeektdgsfhemhegvleefmeehfegvudemkeekjedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeektdgsfhemhegvleefmeehfegvudemkeekjedtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeektdgsfhemhegvleefmeehfegvudemkeekjedtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghom
 hdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_045638_898077_D033FADD 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpPbiAxNi8wMy8yMDI1IDExOjM5LCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
Cj4gT24gU3VuLCBEZWMgMjIsIDIwMjQgYXQgOTowOOKAr0FNIE1hc2FoaXJvIFlhbWFkYSA8bWFz
YWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBDb21taXQgNjU0MTAyZGYyYWMyICgia2J1aWxk
OiBhZGQgZ2VuZXJpYyBzdXBwb3J0IGZvciBidWlsdC1pbiBib290Cj4+IERUQnMiKSBpbnRyb2R1
Y2VkIGdlbmVyaWMgc3VwcG9ydCBmb3IgYnVpbHQtaW4gRFRCcy4KPj4KPj4gU2VsZWN0IEdFTkVS
SUNfQlVJTFRJTl9EVEIgd2hlbiBidWlsdC1pbiBEVEIgc3VwcG9ydCBpcyBlbmFibGVkLgo+Pgo+
PiBUbyBrZWVwIGNvbnNpc3RlbmN5IGFjcm9zcyBhcmNoaXRlY3R1cmVzLCB0aGlzIGNvbW1pdCBh
bHNvIHJlbmFtZXMKPj4gQ09ORklHX0JVSUxUSU5fRFRCX1NPVVJDRSB0byBDT05GSUdfQlVJTFRJ
Tl9EVEJfTkFNRS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGly
b3lAa2VybmVsLm9yZz4KPj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+Cj4+IC0tLQo+IFBpbmc/CgoKSXQgaXMgb24gbXkgbGlzdCBmb3IgNi4xNSBh
bmQgKnNob3VsZCogYmUgbWVyZ2VkLgoKVGhhbmtzLAoKQWxleAoKCj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
