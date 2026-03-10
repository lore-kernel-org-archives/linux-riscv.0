Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F05BFD4F07
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oE6P5gGh3ec9rZrsAowwjl7sYlqT1LMZwHNvlCQdUBE=; b=dS+o5N57LHQi0c
	23q++3ggkdAxfVOjhQ5oR/PxlQvfaCnwrQT6+rs6ikk16ixgKO4j5MoC+abTDrU7i19rQGnw0hm7x
	tcm9seibFyUeuFpwp51IBNb+OLkw3+2cJWgnSOZJ6hxlOYOzXql1/NpCtbMgDSQE7Zr8OCXy8Z36D
	00pGqK74cZ33pJdC5EMn2KA+T3D6AlaigGf2HYWhiSvOms3wxpPO/LNjI1kcsn/bXxsHPDzDRm7Nw
	FISiMSAqYZ18tsE7kjqQ6iDUcoJy8xt86n0QiYnelDmq7awZSIFVVrjVx0aII3SniEbJyldLPm5Ch
	ef51yKXmWO1Ch8w4uYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jI-00000009xkp-1k6H;
	Tue, 10 Mar 2026 17:18:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jG-00000009xkR-2EbY
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 300B143EA0;
	Tue, 10 Mar 2026 17:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFADAC19423;
	Tue, 10 Mar 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163125;
	bh=ssOac3bxyWtS0tltR+pILLaG3NN0ZgI0HUcEtKF5uRg=;
	h=From:To:Cc:Subject:Date:From;
	b=uM77GE58J6M5lK2RRmBrfQA1Djxa+7Vra9kK54/+wt1K9oRFu9Qbei6KgDivjziIX
	 qotoROcjjoFYuc2MWvX7alS6iRdeYbIahjM3gx+Qgj30jvdPnnMv0rrFJMu2k3dawD
	 N6/9fOfnQtXvv06UNpEF+1zLSZ0zQRL5EH/AhHHG6pc4N05n0/khsrCkGEvAWrGoF/
	 PV+41GjX7zhFj0dkQ4YPST4FiSSuXG4aWkW5zl9eWwBA/IaxGngHHaGEveO2YE36xK
	 tJLdavbbIaup6QiJpLumkwDWJr81tZ5QybfOe7ac4QvFQ8NMLtDbFMTDIblVciBQJK
	 dEoKQfutb0Mnw==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v3 00/10] macb usrio/tsu patches
Date: Tue, 10 Mar 2026 17:17:07 +0000
Message-ID: <20260310-moneyless-dispense-7bce14b16388@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QrQ6yekBVGBayH1oG22woO0zUs3eFYGTHF3VO06A6ns=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgpRmG69Rc+n+PSe0OqY+ddVpZ7UMPpcv23TTPjdW6 BrqTNTtKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwES4Uhn+p6cyedeaFs34wviF 12L74WupLGUeXlP/P8nZf0IzgPFYA8N/D8tyxoU9LXd9VDYYbfapWX9K79oGGQV9+er1nLGO7Pf 4AA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_101846_637303_373701A7 
X-CRM114-Status: GOOD (  10.95  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkhleSBmb2xr
cywKCkF0IHRoZSB2ZXJ5IGxlYXN0LCBpdCdkIGJlIGdvb2Qgb2YgdGhlIHNvYyB2ZW5kb3IgZm9s
a3MgY291bGQgY2hlY2sKdGhlaXIgcGxhdGZvcm1zIGFuZCBzZWUgaWYgdGhlaXIgdXNyaW8gc3R1
ZmYgYWN0dWFsbHkgbGluZXMgdXAgd2l0aCB3aGF0CnRoZSBkcml2ZXIgY3VycmVudGx5IGNhbGxz
ICJtYWNiX2RlZmF1bHRfdXNyaW8iLiBPdXJzIGRpZG4ndCBhbmQgaXQgd2FzCmEgbmFzdHkgc3Vy
cHJpc2UuCgpUaGVvLCB5b3UgYWRkZWQgZXllcTUgcmVjZW50bHkuIERvZXMgaXQgZ2VudWluZWx5
IGhhdmUgdGhlIHNhbWUgdXNyaW8KYml0cyBhcyB0aGUgYXQ5MSBkZXZpY2VzPwoKUnlhbiBhbmQg
SSBmaWd1cmVkIG91dCB0aGF0IHRoZSBzYW1hN2c1IHN0dWZmIGlzIG5vdCBhY3R1YWxseSB1c2lu
ZyB0aGUKc2FtZSB1c3JpbyBiaXRzIGFzIGVhcmxpZXIgZGV2aWNlcywgc28gdGhlcmUncyBub3cg
bW9yZSBwYXRjaGVzIGluIHRoaXMKc2VyaWVzIHRvIHNwbGl0IHRoZW0gYXBhcnQuIEkndmUgbm90
IHRlc3RlZCB0aGUgc3BsaXQgb3IgdGhlIG5ldwpwcm9wZXJ0eSBkdWUgdG8gbGFjayBvZiBoYXJk
d2FyZSwgYnV0IFJ5YW4gaGFzLgoKQ2hlZXJzLApDb25vci4KCnYzOgotIHJlb3JkZXIgcGF0Y2hl
cwotIGZpeCBzbWF0Y2ggaXNzdWUgcmVwb3J0ZWQgYnkgU2ltb24KLSBhZGQgcGF0Y2hlcyByZXdv
cmtpbmcgdXNyaW8gaGFuZGxpbmcgb2YgY2xrZW4vcmVmY2xrIChhbmQgcmVtb3ZlIHRoZQogIGlz
c3VlIHRoZSBsbG0gcmVwb3J0ZWQgaW4gdGhlIHByb2Nlc3MpCi0gYWRkIGEgbmV3IGRldmljZXRy
ZWUgcHJvcGVydHkgZm9yIHJlZmNsayBzZWxlY3Rpb24sIHJlcGxhY2luZyB0aGUKICBleGlzdGlu
ZyBvbmUuCi0gZHJvcCB0aGUgZHRzIHBhdGNoCgpDQzogVmFsZW50aW5hLkZlcm5hbmRlekFsYW5p
c0BtaWNyb2NoaXAuY29tCkNDOiBBbmRyZXcgTHVubiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPgpD
QzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDQzogRXJpYyBEdW1hemV0
IDxlZHVtYXpldEBnb29nbGUuY29tPgpDQzogSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9y
Zz4KQ0M6IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4KQ0M6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+CkNDOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5v
cmc+CkNDOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNDOiBEYWlyZSBNY05h
bWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBq
d0BrZXJuZWwub3JnPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6
IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PgpDQzogQWxleGFuZHJlIEdoaXRpIDxh
bGV4QGdoaXRpLmZyPgpDQzogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAu
Y29tPgpDQzogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4KQ0M6IFJp
Y2hhcmQgQ29jaHJhbiA8cmljaGFyZGNvY2hyYW5AZ21haWwuY29tPgpDQzogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CkNDOiBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
CkNDOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogRGF2ZSBTdGV2
ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4KQ0M6IFNlYW4gQW5kZXJzb24g
PHNlYW4uYW5kZXJzb25AbGludXguZGV2PgpDQzogVmluZWV0aCBLYXJ1bWFuY2hpIDx2aW5lZXRo
LmthcnVtYW5jaGlAYW1kLmNvbT4KQ0M6IEFiaW4gSm9zZXBoIDxhYmluLmpvc2VwaEBhbWQuY29t
PgpDQzogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KQ0M6IFJ5YW4uV2Fu
bmVyQG1pY3JvY2hpcC5jb20KCkNvbm9yIERvb2xleSAoMTApOgogIG5ldDogbWFjYjogcmVuYW1l
IG1hY2JfZGVmYXVsdF91c3JpbyB0byBhdDkxX2RlZmF1bHRfdXNyaW8gYXMgbm90IGFsbAogICAg
cGxhdGZvcm1zIGhhdmUgbWlpIG1vZGUgY29udHJvbCBpbiB1c3JpbwogIG5ldDogbWFjYjogc3Bs
aXQgVVNSSU9fSEFTX0NMS0VOIGNhcGFiaWxpdHkgaW4gdHdvCiAgZHQtYmluZGluZ3M6IG5ldDog
Y2RucyxtYWNiOiByZXBsYWNlIGNkbnMscmVmY2xrLWV4dCB3aXRoCiAgICBjZG5zLHJlZmNsay1z
b3VyY2UKICBuZXQ6IG1hY2I6IHJld29yayB1c3JpbyByZWZjbGsgc2VsZWN0aW9uIGNvZGUKICBu
ZXQ6IG1hY2I6IG5wNCBkb2Vzbid0IG5lZWQgYSB1c3JpbyBwb2ludGVyCiAgbmV0OiBtYWNiOiBh
ZGQgbXBmcyBzcGVjaWZpYyB1c3JpbyBjb25maWd1cmF0aW9uCiAgbmV0OiBtYWNiOiB3YXJuIG9u
IHBjbGsgdXNlIGFzIGEgdHN1X2NsayBmYWxsYmFjawogIG5ldDogbWFjYjogY2xlYW4gdXAgdHN1
IGNsayByYXRlIGFjcXVpc2l0aW9uCiAgZHQtYmluZGluZ3M6IG5ldDogbWFjYjogYWRkIHByb3Bl
cnR5IGluZGljYXRpbmcgdGltZXIgYWRqdXN0IG1vZGUKICBuZXQ6IG1hY2I6IHRpbWVyIGFkanVz
dCBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2Ru
cyxtYWNiLnlhbWwgICAgfCAgNTQgKysrKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2Uv
bWFjYi5oICAgICAgICAgICB8ICAgNiArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21h
Y2JfbWFpbi5jICAgICAgfCAxOTcgKysrKysrKysrKysrLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDE4NiBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKCi0tIAoyLjUxLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
