Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67CC36007
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gux99f/3EqA8MRob0B7z7uk8JBLIFqkIttGGWUwMvUQ=; b=p1QbjUJ5BjDaKG
	TwhGsOwE+xr6hyZt1k/bL6X5vxIQ2zrUm1TC1QlFK0twNXHMQs8fiw1gB/EFzNrNa03vfhONwOOnF
	lQBjT7RH9YWD9mNu3ngn0XfZ/UByvoD7up8Xlz/DEXMCJIkNJ0Y5IBNQNXjfVPExM0HRfx73ctQBv
	MATqjHmBaxv18M72yvbxJVEEUJhN7DMLYu+fQBAhv1MIQXOmLLM41XL8IOupAg35rCCPKOz4k6R4u
	X7mWT7iam58dW0V8pfD0NBq++CkTCxWR53lumIIWzgeUy4XgXKxYP0E3HXLKtqOGDPhpscu3By6n4
	BZUiSgtgvasTdfBSWUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp9-0000000FzSW-1cV6;
	Fri, 21 Mar 2025 19:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhol-0000000FzLW-0Qio
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Mar 2025 19:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iePdyYSf/+g+pm8h9F0nQI+y9CDPVqPcquQl0nemLzI=; b=lOM27e4Ve2/aF0Cp5NZzJRZFh0
	0s/QUERpVgYHHbdHv5Rl6cv00Q2sHWjtsUnjtZLZxfRJCEjkAvAoVpS+Q4volpEyJiqFKf74ZxtBW
	3njQ7BeOVRENwnLYBWacT+iwwpMF0tJOin4MgIEnlLv8Pvlmyhq47lmsWkk1JeRxaoYDYHPAuKdWp
	JMvKWW2RAsEwfTycWUZ+EpmgawU5u4L92QGxyQO+1dBHTD7Sga4V35XBVW7YIlESAFuIimWkfI/iI
	YmmgED9SuYQ3pobYbOt5mU/iUkcfWCMe9zs0wmyLd8cdMeC39RFUapBXCoEMWTpdNRIutjG90or3A
	pzk4mibw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhoi-00000004Vmz-10qK
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A850544557;
	Fri, 21 Mar 2025 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iePdyYSf/+g+pm8h9F0nQI+y9CDPVqPcquQl0nemLzI=;
	b=e3EejegiFRwW3JpWgNVSn8BAS55pjTPk5K/NuhH0F505gCF3tyQ4vgBJM8G+TirnkZXnLS
	+sO0Rc+MzLSXYJBRX7Ddq7XX3GqfURZ2r9bpAa7yfHNrYuU3/8iHsFhc8gk+BAwii0zGf7
	DLRGTk83Xtd9CstN3mRY9rnjhadjSyF++IPd9NzgILHZUq145KFxU/SECWmIYYo/TyHgNj
	CErQGGLUpiiCBypZRlp9z+mO3yAsVhOouKSIqMGN5FLPWeUC8tsdLwS4Zwpdc/L9OGG2CN
	CnpQXxiHVfP9v9HwhSxxG5opOEnS1I3VxjkXdpCAnS0sfGPC3J8xu5RaA75Ijg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:35 +0100
Subject: [PATCH net-next 04/13] net: macb: use BIT() macro for capability
 definitions
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-4-537b7e37971d@bootlin.com>
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
X-CRM114-CacheID: sfid-20250321_191404_421749_775D5622 
X-CRM114-Status: UNSURE (   6.57  )
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

UmVwbGFjZSBhbGwgY2FwYWJpbGl0aWVzIHZhbHVlcyBieSBjYWxscyB0byB0aGUgQklUKCkgbWFj
cm8uCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29t
PgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oIHwgNDAgKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYi5oIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKaW5k
ZXggYzlhNWM4YmViMmZhODE2NjE5NWQxZDgzZjE4N2QyZDBjNjI2NjhhOC4uM2I0M2NiOTQ2OGUz
NjE4NzU0ZmYyYmM2YzVmMzYwNDQ3YmRlZWVkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiLmgKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9t
YWNiLmgKQEAgLTcyNywyNiArNzI3LDI2IEBACiAjZGVmaW5lIE1BQ0JfTUFOX0M0NV9DT0RFCQkJ
MgogCiAvKiBDYXBhYmlsaXR5IG1hc2sgYml0cyAqLwotI2RlZmluZSBNQUNCX0NBUFNfSVNSX0NM
RUFSX09OX1dSSVRFCQkweDAwMDAwMDAxCi0jZGVmaW5lIE1BQ0JfQ0FQU19VU1JJT19IQVNfQ0xL
RU4JCTB4MDAwMDAwMDIKLSNkZWZpbmUgTUFDQl9DQVBTX1VTUklPX0RFRkFVTFRfSVNfTUlJX0dN
SUkJMHgwMDAwMDAwNAotI2RlZmluZSBNQUNCX0NBUFNfTk9fR0lHQUJJVF9IQUxGCQkweDAwMDAw
MDA4Ci0jZGVmaW5lIE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRAkJMHgwMDAwMDAxMAotI2RlZmlu
ZSBNQUNCX0NBUFNfSlVNQk8JCQkJMHgwMDAwMDAyMAotI2RlZmluZSBNQUNCX0NBUFNfR0VNX0hB
U19QVFAJCQkweDAwMDAwMDQwCi0jZGVmaW5lIE1BQ0JfQ0FQU19CRF9SRF9QUkVGRVRDSAkJMHgw
MDAwMDA4MAotI2RlZmluZSBNQUNCX0NBUFNfTkVFRFNfUlNUT05VQlIJCTB4MDAwMDAxMDAKLSNk
ZWZpbmUgTUFDQl9DQVBTX01JSU9OUkdNSUkJCQkweDAwMDAwMjAwCi0jZGVmaW5lIE1BQ0JfQ0FQ
U19ORUVEX1RTVUNMSwkJCTB4MDAwMDA0MDAKLSNkZWZpbmUgTUFDQl9DQVBTX1FVRVVFX0RJU0FC
TEUJCQkweDAwMDAwODAwCi0jZGVmaW5lIE1BQ0JfQ0FQU19QQ1MJCQkJMHgwMTAwMDAwMAotI2Rl
ZmluZSBNQUNCX0NBUFNfSElHSF9TUEVFRAkJCTB4MDIwMDAwMDAKLSNkZWZpbmUgTUFDQl9DQVBT
X0NMS19IV19DSEcJCQkweDA0MDAwMDAwCi0jZGVmaW5lIE1BQ0JfQ0FQU19NQUNCX0lTX0VNQUMJ
CQkweDA4MDAwMDAwCi0jZGVmaW5lIE1BQ0JfQ0FQU19GSUZPX01PREUJCQkweDEwMDAwMDAwCi0j
ZGVmaW5lIE1BQ0JfQ0FQU19HSUdBQklUX01PREVfQVZBSUxBQkxFCTB4MjAwMDAwMDAKLSNkZWZp
bmUgTUFDQl9DQVBTX1NHX0RJU0FCTEVECQkJMHg0MDAwMDAwMAotI2RlZmluZSBNQUNCX0NBUFNf
TUFDQl9JU19HRU0JCQkweDgwMDAwMDAwCisjZGVmaW5lIE1BQ0JfQ0FQU19JU1JfQ0xFQVJfT05f
V1JJVEUJCUJJVCgwKQorI2RlZmluZSBNQUNCX0NBUFNfVVNSSU9fSEFTX0NMS0VOCQlCSVQoMSkK
KyNkZWZpbmUgTUFDQl9DQVBTX1VTUklPX0RFRkFVTFRfSVNfTUlJX0dNSUkJQklUKDIpCisjZGVm
aW5lIE1BQ0JfQ0FQU19OT19HSUdBQklUX0hBTEYJCUJJVCgzKQorI2RlZmluZSBNQUNCX0NBUFNf
VVNSSU9fRElTQUJMRUQJCUJJVCg0KQorI2RlZmluZSBNQUNCX0NBUFNfSlVNQk8JCQkJQklUKDUp
CisjZGVmaW5lIE1BQ0JfQ0FQU19HRU1fSEFTX1BUUAkJCUJJVCg2KQorI2RlZmluZSBNQUNCX0NB
UFNfQkRfUkRfUFJFRkVUQ0gJCUJJVCg3KQorI2RlZmluZSBNQUNCX0NBUFNfTkVFRFNfUlNUT05V
QlIJCUJJVCg4KQorI2RlZmluZSBNQUNCX0NBUFNfTUlJT05SR01JSQkJCUJJVCg5KQorI2RlZmlu
ZSBNQUNCX0NBUFNfTkVFRF9UU1VDTEsJCQlCSVQoMTApCisjZGVmaW5lIE1BQ0JfQ0FQU19RVUVV
RV9ESVNBQkxFCQkJQklUKDExKQorI2RlZmluZSBNQUNCX0NBUFNfUENTCQkJCUJJVCgyNCkKKyNk
ZWZpbmUgTUFDQl9DQVBTX0hJR0hfU1BFRUQJCQlCSVQoMjUpCisjZGVmaW5lIE1BQ0JfQ0FQU19D
TEtfSFdfQ0hHCQkJQklUKDI2KQorI2RlZmluZSBNQUNCX0NBUFNfTUFDQl9JU19FTUFDCQkJQklU
KDI3KQorI2RlZmluZSBNQUNCX0NBUFNfRklGT19NT0RFCQkJQklUKDI4KQorI2RlZmluZSBNQUNC
X0NBUFNfR0lHQUJJVF9NT0RFX0FWQUlMQUJMRQlCSVQoMjkpCisjZGVmaW5lIE1BQ0JfQ0FQU19T
R19ESVNBQkxFRAkJCUJJVCgzMCkKKyNkZWZpbmUgTUFDQl9DQVBTX01BQ0JfSVNfR0VNCQkJQklU
KDMxKQogCiAvKiBMU08gc2V0dGluZ3MgKi8KICNkZWZpbmUgTUFDQl9MU09fVUZPX0VOQUJMRQkJ
CTB4MDEKCi0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
