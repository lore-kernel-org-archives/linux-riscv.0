Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69124C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI2UE0IaeTAy+zOLbjJrNKIHzZ0LMhc1rWnoslQr8Mo=; b=F2+s958VROYVb+
	z5Qm78VtiFUrJARaNhLs3UrJeiH121xeckJDKgo9r9ey1HDpGTMELjAiSfYsTmiIvwqqzrLQ6K4VD
	LTuoOYWfRSD2C9MEPv7NH2yTPQrDlcpafz0VlKxnnIvw0C++iWMSz/hhfttUYkNFWV8pNlV/E0adm
	6DUP+kagH8BhVHzC7cgjHN9MjAjBjdEul+UwbLKoNOWHUp7uVV4jdqD9q56rwog4+xEY5WipyY6/Z
	J9KgKjuj6uNQNFnpIgy+YfzUrhHNpXWZQQy40B8Me/Ajaf04AUNSbXY9mteYSFsgboJ0IsvHVqRKK
	VmmBngV0UYHF2ohrpOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNcU-000000086qX-2UjD;
	Wed, 26 Mar 2025 10:04:22 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNcR-000000086og-1GY3
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 10:04:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 159D420483;
	Wed, 26 Mar 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742983456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6SJe1q7HnXDWNnYhZ89APQIhGwWw4epexqG70iweUg=;
	b=UnhEVOveRNaKW893lMfVvlDfa3mHmkxnR4jwgXzcsSN7fbcT78GzLuvdmauZlL98E+SY/w
	gn2nY2B5yosz8Jpi6HOz+/IYsp9tNQfKceIoojhV6xJJUFrE2i2TuG3clP1w7HwYyMXP8K
	g5IcszNCc1wdYrGeCSdyDP8Z5yc8MI17tVSv9ax4u+gi/Ifd76NQA9lpARaC+c0E1FE3xx
	uNkHhFAjlJeX+PvLp4wBhJTwujuUtCdQKHoIKKlxJZZ0WnR3FU5KwFknwtX6UP1IO2hGGr
	GsQGgAZjsIqA40iFtfASlu7vSv/TCQFfjWBzqX9d7HhjIQqfl/5DUwkDofpjEg==
Mime-Version: 1.0
Date: Wed, 26 Mar 2025 11:04:14 +0100
Message-Id: <D8Q42H2O4AC0.1HV63W6F5L45U@bootlin.com>
Subject: Re: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel
 Holland" <samuel.holland@sifive.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-5-537b7e37971d@bootlin.com>
 <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
In-Reply-To: <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_030419_956629_8DCFCA3B 
X-CRM114-Status: GOOD (  11.87  )
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

SGVsbG8gQ2xhdWRpdSwKCk9uIE1vbiBNYXIgMjQsIDIwMjUgYXQgOToxOCBBTSBDRVQsIENsYXVk
aXUgQmV6bmVhIHdyb3RlOgo+IE9uIDIxLjAzLjIwMjUgMjE6MDksIFRow6lvIExlYnJ1biB3cm90
ZToKPj4gTFNPIGlzIHJ1bnRpbWUtZGV0ZWN0ZWQgdXNpbmcgdGhlIFBCVUZfTFNPIGZpZWxkIGlu
c2lkZSByZWdpc3Rlcgo+PiBkZXNpZ25jZmdfZGVidWc2L0dFTV9EQ0ZHNi4gQWxsb3cgZGlzYWJs
aW5nIHRoYXQgZmVhdHVyZSBpZiBpdCBpcwo+PiBicm9rZW4gYnkgdXNpbmcgc3RydWN0IG1hY2Jf
Y29uZmlnLT5jYXBzLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2IuaCAgICAgIHwgMSArCj4+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jIHwgNSArKystLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2Fk
ZW5jZS9tYWNiLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAo+PiBpbmRl
eCAzYjQzY2I5NDY4ZTM2MTg3NTRmZjJiYzZjNWYzNjA0NDdiZGVlZWQwLi5lOWRhNmUzYjg2OWZj
NzcyNjEzYTBkNmI4NjMwODkxN2M5YmZmN2ZlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2IuaAo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRl
bmNlL21hY2IuaAo+PiBAQCAtNzM5LDYgKzczOSw3IEBACj4+ICAjZGVmaW5lIE1BQ0JfQ0FQU19N
SUlPTlJHTUlJCQkJQklUKDkpCj4+ICAjZGVmaW5lIE1BQ0JfQ0FQU19ORUVEX1RTVUNMSwkJCUJJ
VCgxMCkKPj4gICNkZWZpbmUgTUFDQl9DQVBTX1FVRVVFX0RJU0FCTEUJCQlCSVQoMTEpCj4+ICsj
ZGVmaW5lIE1BQ0JfQ0FQU19OT19MU08JCQlCSVQoMTIpCj4+ICAjZGVmaW5lIE1BQ0JfQ0FQU19Q
Q1MJCQkJQklUKDI0KQo+PiAgI2RlZmluZSBNQUNCX0NBUFNfSElHSF9TUEVFRAkJCUJJVCgyNSkK
Pj4gICNkZWZpbmUgTUFDQl9DQVBTX0NMS19IV19DSEcJCQlCSVQoMjYpCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+PiBpbmRleCBiNTc5N2MxYWMwYTQxZTk0NzI4
ODNiMDEzYzFlNDRhMDEwOTJmMjU3Li44MDdmN2FiYmQ5OTQxYmY2MjRmMTRhNWRkZWFkNjhkYWQx
YzhkZWIyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMK
Pj4gQEAgLTQzNzMsOCArNDM3Myw5IEBAIHN0YXRpYyBpbnQgbWFjYl9pbml0KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAJLyogU2V0IGZlYXR1cmVzICovCj4+ICAJZGV2LT5od19m
ZWF0dXJlcyA9IE5FVElGX0ZfU0c7Cj4+ICAKPj4gLQkvKiBDaGVjayBMU08gY2FwYWJpbGl0eSAq
Lwo+PiAtCWlmIChHRU1fQkZFWFQoUEJVRl9MU08sIGdlbV9yZWFkbChicCwgRENGRzYpKSkKPj4g
KwkvKiBDaGVjayBMU08gY2FwYWJpbGl0eTsgY2FwYWJpbGl0eSBpcyBmb3IgYnVnZ3kgSFcgKi8K
Pgo+IFRoZSBjb21tZW50IGhlcmUgaXMgYSBiaXQgY29uZnVzaW5nIHRvIG1lLgoKUHJvcG9zYWw6
CgorICAvKiBDaGVjayBMU08gY2FwYWJpbGl0eTsgcnVudGltZSBkZXRlY3Rpb24gY2FuIGJlIG92
ZXJyaWRkZW4gYnkgYSBjYXAKKyAgICogZmxhZyBpZiB0aGUgaGFyZHdhcmUgaXMga25vd24gdG8g
YmUgYnVnZ3kgKi8KCkknbGwgdXNlIHRoYXQgaW4gVjIsIG9yIGZlZWwgZnJlZSB0byByZXBseSBp
ZiBpdCdzIHN0aWxsIHVuY2xlYXIuCgpUaGFua3MsCgotLQpUaMOpbyBMZWJydW4sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
