Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF5C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVCvCsdm2QzZiL+j0g/Djl/Di8nwXi2dwGkl8GiqOBI=; b=HsnRyAiAli2HcA
	Ky08feZfEMqyePllrpeTXzrM2NEpCya/LFwsmm+XElTaY6feVI7AVk5yVNfx6y2duZFEW77RkdE2e
	Eq4cWGSQGxtnO0g+oFT/Azlvls4YvmVFxvzibtvqxzA8+zWUEwIgsbhylmpjW6Fk3IR0xhSmp4vDP
	En2NkNUZKSPVnBLknhHXdN+CCluJuBXJ76hWUFDQH/rJ6qFnFslyuIQ7cjlEun7Qawj2eZSbjyzd9
	J2g3L1cxXcudP/0YxjeuHUKxrl8bxDX2NSU28H+N1f4sAdTctciCrrZibsA5ZXQsdfs3Oam0+Ow7l
	39EQ7dnTlVzwEbvwcCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhpD-0000000FzVw-4AHe;
	Fri, 21 Mar 2025 19:14:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhou-0000000FzO9-347v
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4B7C44559;
	Fri, 21 Mar 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4TDi+sQdkyFFFV9+gkQoSurbLJHpubG1wu6RejRj0Wc=;
	b=Rz5VjWfaclIqbA3odhQ6Q0lHzRF1fnnN/dczLLLrNnYkLXzupqfBP2Mu1kbJqwNwXUJq2Q
	B5FPvKSNXsYVCsdJst1vRo+fMLWyppbncolUAzSxSTXiqox77xR499d60WW0qWkgkhAYoR
	F82n0YEFzGDXBjqq1W9WbytbeMa5EIrar4umV36glLUb3cd4gttwV6Jp4qOjzBOd9d4no2
	lJovYpKdIPPN/OcX1oUVON5H21wkO1/J81prkndIWE2fXCW2CDKMJOlykIO1k43S0ee2di
	CtwKLWn/dunLqCD07wCyKjkSgsiKki9GBourKW85xu/tpiDJA14uU2BumJK6wA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:43 +0100
Subject: [PATCH net-next 12/13] MIPS: mobileye: eyeq5: add two Cadence GEM
 Ethernet controllers
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-12-537b7e37971d@bootlin.com>
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
X-CRM114-CacheID: sfid-20250321_121416_913210_5CE78328 
X-CRM114-Status: UNSURE (   7.24  )
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

QWRkIGJvdGggTUFDQi9HRU0gaW5zdGFuY2VzIGZvdW5kIGluIHRoZSBNb2JpbGV5ZSBFeWVRNSBT
b0MuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29t
PgotLS0KIGFyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS5kdHNpIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvbW9iaWxleWUvZXllcTUuZHRz
aSBiL2FyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS5kdHNpCmluZGV4IGE4NGU2ZTcy
MDYxOWVmOTllMTQwNWFlNjI5NmQ4YmFkMWFhM2ZhMjMuLjQyMGNiMjc2MDdiZmRkOGQ1ZWE1MTBm
YjY2OGIwYTFjODVkZDdkODMgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5
ZS9leWVxNS5kdHNpCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9tb2JpbGV5ZS9leWVxNS5kdHNp
CkBAIC03Nyw2ICs3Nyw4IEBAIGFsaWFzZXMgewogCQlzZXJpYWwwID0gJnVhcnQwOwogCQlzZXJp
YWwxID0gJnVhcnQxOwogCQlzZXJpYWwyID0gJnVhcnQyOworCQlldGhlcm5ldDAgPSAmbWFjYjA7
CisJCWV0aGVybmV0MSA9ICZtYWNiMTsKIAl9OwogCiAJY3B1X2ludGM6IGludGVycnVwdC1jb250
cm9sbGVyIHsKQEAgLTE3OCw2ICsxODAsMzggQEAgdGltZXIgewogCQkJCWNsb2NrcyA9IDwmb2xi
IEVRNUNfQ1BVX0NPUkUwPjsKIAkJCX07CiAJCX07CisKKwkJbWFjYjA6IGV0aGVybmV0QDJhMDAw
MDAgeworCQkJY29tcGF0aWJsZSA9ICJtb2JpbGV5ZSxleWVxNS1nZW0iOworCQkJcmVnID0gPDB4
MCAweDAyYTAwMDAwIDB4MCAweDQwMDA+OworCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsK
KwkJCWludGVycnVwdHMgPSA8R0lDX1NIQVJFRCAyMyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwgLyog
cXVldWUwICovCisJCQkJICAgICA8R0lDX1NIQVJFRCAyMyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwg
LyogcXVldWUxICovCisJCQkJICAgICA8R0lDX1NIQVJFRCAyMyBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwgLyogcXVldWUyICovCisJCQkJICAgICA8R0lDX1NIQVJFRCAyMyBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsgLyogcXVldWUzICovCisJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgImhjbGsiLCAidHN1
X2NsayI7CisJCQljbG9ja3MgPSA8JnBjbGs+LCA8JnBjbGs+LCA8JnRzdV9jbGs+OworCQkJZG1h
LWNvaGVyZW50OworCQkJbnZtZW0tY2VsbHMgPSA8JmV0aDBfbWFjPjsKKwkJCW52bWVtLWNlbGwt
bmFtZXMgPSAibWFjLWFkZHJlc3MiOworCQkJbW9iaWxleWUsb2xiID0gPCZvbGIgMHgxMjggMHgx
MzQ+OworCQl9OworCisJCW1hY2IxOiBldGhlcm5ldEAyYjAwMDAwIHsKKwkJCWNvbXBhdGlibGUg
PSAibW9iaWxleWUsZXllcTUtZ2VtIjsKKwkJCXJlZyA9IDwweDAgMHgwMmIwMDAwMCAweDAgMHg0
MDAwPjsKKwkJCWludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47CisJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TSEFSRUQgMjQgSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIHF1ZXVlMCAqLworCQkJCSAgICAg
PEdJQ19TSEFSRUQgMjQgSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIHF1ZXVlMSAqLworCQkJCSAg
ICAgPEdJQ19TSEFSRUQgMjQgSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIHF1ZXVlMiAqLworCQkJ
CSAgICAgPEdJQ19TSEFSRUQgMjQgSVJRX1RZUEVfTEVWRUxfSElHSD47IC8qIHF1ZXVlMyAqLwor
CQkJY2xvY2stbmFtZXMgPSAicGNsayIsICJoY2xrIiwgInRzdV9jbGsiOworCQkJY2xvY2tzID0g
PCZwY2xrPiwgPCZwY2xrPiwgPCZ0c3VfY2xrPjsKKwkJCWRtYS1jb2hlcmVudDsKKwkJCW52bWVt
LWNlbGxzID0gPCZldGgxX21hYz47CisJCQludm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNz
IjsKKwkJCW1vYmlsZXllLG9sYiA9IDwmb2xiIDB4MTJjIDB4MTM4PjsKKwkJfTsKIAl9OwogfTsK
IAoKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
