Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA07BC7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+EITGpRdPdx4+rdREAAk/D0ov3QETVTpfT4tbS10uM=; b=cPaVlZLfyI0d2B
	x05fD8PS1KCpsKS6HryxD6UnnCWB95ex9cg+oYspPK9dtFEipdKDjDnQLiXMeNAFd7mls8jVd+sLB
	qRfKR58UaFyGa0AWLzrVdjRMcFz1DW657/MulAqxBPIjFlSTbe/+e582G822vxmdZJALDvsPwtPD8
	k1JV0oDjQLkh2Sbt9i1ru6IM/0H12DHiyij8OBQuEmA+dEolkooAQioaH+QG2NY9ezyc+tnQlYrae
	31B6K+k2ExTZ3wlV6Y07UfqVM1l8G2jutMq96iXOYfQQx7rEqfFqL/5Ak65AII8d7howjZcVZOIq0
	YLWkHLSLf/zhQqH/uudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55U-0000000E2yQ-0k0T;
	Fri, 27 Jun 2025 09:09:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55S-0000000E2x3-0v0D
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A3464321D;
	Fri, 27 Jun 2025 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiqWXjQPA5TlILiPOLH/qOYErqjecACh+gfhqwwCbqw=;
	b=iqZOJCU9uhEC37vlOmQSVyqeyg/1ikQ7KYM5Deg+98p5m4rAulB3SFpQ3MzDLazHsQFPt9
	XwUkkHvmXm+hDKFOY7Nf8F+gTDVbZkd6iX0ZPDEdec/HQEfguEimV5dNHaGC7asQhI1tSO
	38OqrjVbUO8IIoEZL+xy8WmYGBzVpswMCcrKkJXGM/4bIhwE8Pl8PDWxU+nYsex6DozhGe
	+HXgt2ED6dTuJHxpDDVBkOEPAvvReEw+zICF2MXl0EB4BrUvExk8uDBfPCS7mIGPReu7kS
	M7TidbvzazjPlU4AkOE7v1y0vj6eHcyv/wXvRtDcGj1h3lrIQLdSk6Qalhwlxw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:48 +0200
Subject: [PATCH net-next v2 02/18] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-2-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
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
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020934_388197_EC19727D 
X-CRM114-Status: UNSURE (   8.38  )
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

QWRkIGNkbnMsZXllcTUtZ2VtIGFzIGNvbXBhdGlibGUgZm9yIHRoZSBpbnRlZ3JhdGVkIEdFTSBi
bG9jayBpbnNpZGUKTW9iaWxleWUgRXllUTUgU29Dcy4gQWRkIGEgcGhhbmRsZSAoYW5kIHR3byBv
ZmZzZXQgYXJndW1lbnRzKSBmb3IKYWNjZXNzaW5nIHN5c2NvbiByZWdpc3RlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbCAgICAgICAgIHwgMjQgKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFt
bAppbmRleCBkZjg4MzM1NGM3ZTYzNTA5OTg4NWRhNDJlNDYwNGUxYzMxYjA1YzcyLi42Y2Y0M2Nj
NTAzNzdmMjNkNjBlZjQwYmYxYzhlZmEyMmNlMWFlMGJiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwKQEAgLTU3LDYgKzU3
LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGNkbnMsbnA0LW1hY2IgICAgICAgICAgICAg
IyBOUDQgU29DIGRldmljZXMKICAgICAgICAgICAtIG1pY3JvY2hpcCxzYW1hN2c1LWVtYWMgICAg
IyBNaWNyb2NoaXAgU0FNQTdHNSBldGhlcm5ldCBpbnRlcmZhY2UKICAgICAgICAgICAtIG1pY3Jv
Y2hpcCxzYW1hN2c1LWdlbSAgICAgIyBNaWNyb2NoaXAgU0FNQTdHNSBnaWdhYml0IGV0aGVybmV0
IGludGVyZmFjZQorICAgICAgICAgIC0gbW9iaWxleWUsZXllcTUtZ2VtICAgICAgICAjIE1vYmls
ZXllIEV5ZVE1IFNvQ3MKICAgICAgICAgICAtIHNpZml2ZSxmdTU0MC1jMDAwLWdlbSAgICAgIyBT
aUZpdmUgRlU1NDAtQzAwMCBTb0MKIAogICAgICAgLSBpdGVtczoKQEAgLTEzNyw2ICsxMzgsMTcg
QEAgcHJvcGVydGllczoKICAgICAgIE5vZGUgY29udGFpbmluZyBQSFkgY2hpbGRyZW4uIElmIHRo
aXMgbm9kZSBpcyBub3QgcHJlc2VudCwgdGhlbiBQSFlzIHdpbGwKICAgICAgIGJlIGRpcmVjdCBj
aGlsZHJlbi4KIAorICBtb2JpbGV5ZSxvbGI6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQorICAgIGRlc2NyaXB0aW9uOgorICAgICAgSGFu
ZGxlIHRvIHRoZSBPTEIgc3lzdGVtIGNvbnRyb2xsZXIgdGhhdCBvd25zIHJlZ2lzdGVycyBjb25m
aWd1cmluZyB0aGUKKyAgICAgIE1BQ0IgaW50ZWdyYXRpb24uCisgICAgaXRlbXM6CisgICAgICAt
IGl0ZW1zOgorICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gT0xCIG5vZGUKKyAg
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBNQUMgR2VuZXJhbC1QdXJwb3NlIHJlZ2lzdGVyIG9mZnNl
dAorICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1BQyBTR01JSSByZWdpc3RlciBvZmZzZXQKKwog
cGF0dGVyblByb3BlcnRpZXM6CiAgICJeZXRoZXJuZXQtcGh5QFswLTlhLWZdJCI6CiAgICAgdHlw
ZTogb2JqZWN0CkBAIC0xNzUsNiArMTg3LDE4IEBAIGFsbE9mOgogICAgICAgICByZWc6CiAgICAg
ICAgICAgbWF4SXRlbXM6IDEKIAorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAg
Y29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBtb2Jp
bGV5ZSxleWVxNS1nZW0KKyAgICB0aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gbW9i
aWxleWUsb2xiCisgICAgZWxzZToKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIG1vYmlsZXll
LG9sYjogZmFsc2UKKwogdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQogCiBleGFtcGxlczoK
Ci0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
