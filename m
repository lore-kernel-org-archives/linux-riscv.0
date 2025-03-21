Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB9C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cu3TT+2mEmBeHQg5jfiZGi+DFLPhCOvhiD5R6OUas4=; b=Z4PbiH0enwiard
	Va+dGxCo3Vjo6vUOhiUJpYHxVzI+YOzEUq8R6F0lSguZvWnGVIprVYbKIV4rQ+mjSdF5/WyyeptEH
	J7/CP9ZSoGGVTe1kCMSzhOUHknbeGVb+vcLIAARlTprFTDS1A33XRJfPs8ae36teB1Yp4c2+as3UY
	l2mPPjP3pvGr9uf29ZRiLj3qmxoPVmMHCht1WTix94hNSFhZ05iYd+qtsqFswx662Vr1GZgky4q3d
	X813n9lPWVCfMZV+uUdqiGr7bGCI28HjutCXaHAxYPxIFwhRAVEfx9ptt+MtDgPhRKGkz+293iC8A
	Uvm/BDb85KARtXDDGzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp8-0000000FzRg-3MKz;
	Fri, 21 Mar 2025 19:14:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhoj-0000000FzKn-2l2W
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B84A44558;
	Fri, 21 Mar 2025 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3cXgGc4bn0Gbvqr0NtDmMZgufHdfFhvshdl+bFHAKw=;
	b=WsPdoAHBBA4KnQD1BRUJF7V/Ssx0s2JVoZoFjRsTpnAdDSQgCw7J0lMugTITl/Wekvn11Z
	JIiB6GX+Xi1Nr68Gbr7VvnyU2XEb8/esxhvxIzvFVAzB8V6ugJCRJmwXLoOtnbo8OhWT2k
	D+A5lZs8Aeuf4TbWFZciYedp/vomad66JpXXnAp/AwVTO28o0BdCZ719fm6nl0PQvXw364
	PlKJkHS3nCQUsn2iCfEGNN8IkIM5aTF4bzIn8vibU58XqJPlxpv/xlBcIuBSWylEfgkFB6
	uBMTrPKKzIYSZB/RHyGzJH5sNy7+Fj08vMkXRgc+cSm84hMjaL2yoObGfj1bQg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:36 +0100
Subject: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-5-537b7e37971d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_121405_846588_B7A7F81F 
X-CRM114-Status: GOOD (  11.50  )
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

TFNPIGlzIHJ1bnRpbWUtZGV0ZWN0ZWQgdXNpbmcgdGhlIFBCVUZfTFNPIGZpZWxkIGluc2lkZSBy
ZWdpc3RlcgpkZXNpZ25jZmdfZGVidWc2L0dFTV9EQ0ZHNi4gQWxsb3cgZGlzYWJsaW5nIHRoYXQg
ZmVhdHVyZSBpZiBpdCBpcwpicm9rZW4gYnkgdXNpbmcgc3RydWN0IG1hY2JfY29uZmlnLT5jYXBz
LgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4K
LS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgIHwgMSArCiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgNSArKystLQogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
YWRlbmNlL21hY2IuaAppbmRleCAzYjQzY2I5NDY4ZTM2MTg3NTRmZjJiYzZjNWYzNjA0NDdiZGVl
ZWQwLi5lOWRhNmUzYjg2OWZjNzcyNjEzYTBkNmI4NjMwODkxN2M5YmZmN2ZlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAorKysgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2IuaApAQCAtNzM5LDYgKzczOSw3IEBACiAjZGVmaW5lIE1BQ0Jf
Q0FQU19NSUlPTlJHTUlJCQkJQklUKDkpCiAjZGVmaW5lIE1BQ0JfQ0FQU19ORUVEX1RTVUNMSwkJ
CUJJVCgxMCkKICNkZWZpbmUgTUFDQl9DQVBTX1FVRVVFX0RJU0FCTEUJCQlCSVQoMTEpCisjZGVm
aW5lIE1BQ0JfQ0FQU19OT19MU08JCQlCSVQoMTIpCiAjZGVmaW5lIE1BQ0JfQ0FQU19QQ1MJCQkJ
QklUKDI0KQogI2RlZmluZSBNQUNCX0NBUFNfSElHSF9TUEVFRAkJCUJJVCgyNSkKICNkZWZpbmUg
TUFDQl9DQVBTX0NMS19IV19DSEcJCQlCSVQoMjYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiX21haW4uYwppbmRleCBiNTc5N2MxYWMwYTQxZTk0NzI4ODNiMDEzYzFlNDRhMDEwOTJm
MjU3Li44MDdmN2FiYmQ5OTQxYmY2MjRmMTRhNWRkZWFkNjhkYWQxYzhkZWIyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTQzNzMsOCArNDM3Myw5IEBAIHN0
YXRpYyBpbnQgbWFjYl9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogU2V0
IGZlYXR1cmVzICovCiAJZGV2LT5od19mZWF0dXJlcyA9IE5FVElGX0ZfU0c7CiAKLQkvKiBDaGVj
ayBMU08gY2FwYWJpbGl0eSAqLwotCWlmIChHRU1fQkZFWFQoUEJVRl9MU08sIGdlbV9yZWFkbChi
cCwgRENGRzYpKSkKKwkvKiBDaGVjayBMU08gY2FwYWJpbGl0eTsgY2FwYWJpbGl0eSBpcyBmb3Ig
YnVnZ3kgSFcgKi8KKwlpZiAoIShicC0+Y2FwcyAmIE1BQ0JfQ0FQU19OT19MU08pICYmCisJICAg
IEdFTV9CRkVYVChQQlVGX0xTTywgZ2VtX3JlYWRsKGJwLCBEQ0ZHNikpKQogCQlkZXYtPmh3X2Zl
YXR1cmVzIHw9IE1BQ0JfTkVUSUZfTFNPOwogCiAJLyogQ2hlY2tzdW0gb2ZmbG9hZCBpcyBvbmx5
IGF2YWlsYWJsZSBvbiBnZW0gd2l0aCBwYWNrZXQgYnVmZmVyICovCgotLSAKMi40OC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
