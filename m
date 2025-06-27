Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D99C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shhoh10gJDHeJcFI3qQxVCZw6/vJEAP5ErGjGj993Dc=; b=M9/qFHF7GVxvmU
	U5Nr2vXtYgKJUbSpvgDr43L5USKBUDUu9WUBuSsSxmhMCpvFbrPptfhWgj8M2khxzzZhhMeSE3l4x
	UmocudzQpjgkzg6wisx4iq8U5IFbaeSRR75uagQiMLTRApqA5U61GeN2Argy3DtlyL+xGAKiJKfKu
	pFZ7KRE9/83oH1YL36coJi/Ar+Dg6U9eD3+bo+k3D+RPQKcoMB19HFAL5/6Mq8eBNsmnH/PNy9/cM
	Il2RF1xAzfshp48gnZ3GDiujT4V843nHUd3y+Biuah4xhinRYnJgBbGuK+hDO9+9s3cGvvtLdBvIz
	NLP86AUgPVPQW57Stbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55W-0000000E30f-3OFd;
	Fri, 27 Jun 2025 09:09:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55T-0000000E2xg-2xUQ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94B3641C06;
	Fri, 27 Jun 2025 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUw5vgRxhW9ITO00vFNl9DuIwVT6B/Zlrr3n05HnTZc=;
	b=Iq0zxIlKl00iTnNScyr9l8lKcVyKx5qQemSoHSY9UtK7/TFW2BGXP0+eNnvxDyvUJc/lCQ
	40hxxuBXIGYVNw+4IBjKIaWhaJJvmKtyiKH6VCARwX2/0ODhp1+kHDKN1IqVfSuF2srmS5
	ijWjOxNmduDapD3QjS6M9B/Fck+G7AS6A8ttADLnBZ1U9xQtx+cnYSd4fGFLrgHsp5PXEY
	4pQH6Lb9G14Gim6zsMWe9w/zw4HzEOaGkUOsnFmtrAesjj3gtFzwQGZLC8J6KUvuajfAj6
	WGlXPV4u/AanZssV+N75LvHsFPWWjL5K5Vi4TyDh1Lur6S0pZSjA/xJKNOIxwA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:49 +0200
Subject: [PATCH net-next v2 03/18] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-3-ff8207d0bb77@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020935_885641_0BC3E93E 
X-CRM114-Status: UNSURE (   9.09  )
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
b25hbC4KClRoaXMgaXMgYWJvdXQgcmVsYXhpbmcgdW5uZWVkZWQgY29uc3RyYWludHMuIEl0IHNv
IGhhcHBlbmVkIHRoYXQgaW4gdGhlCnBhc3QgSFcgdGhhdCBuZWVkZWQgYSB0c3VfY2xrIGFsd2F5
cyBuZWVkZWQgYSB0eF9jbGsuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVi
cnVuQGJvb3RsaW4uY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvY2RucyxtYWNiLnlhbWwgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9jZG5zLG1hY2IueWFtbAppbmRleCA2Y2Y0M2NjNTAzNzdmMjNkNjBlZjQwYmYxYzhl
ZmEyMmNlMWFlMGJiLi4wMTEyZGM2YWVlZDY4YTE4NmYwZWUwMDM4ZjQ5NWIwMjM0NTcwNDI3IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFj
Yi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2Rucyxt
YWNiLnlhbWwKQEAgLTg2LDcgKzg2LDcgQEAgcHJvcGVydGllczoKICAgICBpdGVtczoKICAgICAg
IC0gZW51bTogWyBldGhlcl9jbGssIGhjbGssIHBjbGsgXQogICAgICAgLSBlbnVtOiBbIGhjbGss
IHBjbGsgXQotICAgICAgLSBjb25zdDogdHhfY2xrCisgICAgICAtIGVudW06IFsgdHhfY2xrLCB0
c3VfY2xrIF0KICAgICAgIC0gZW51bTogWyByeF9jbGssIHRzdV9jbGsgXQogICAgICAgLSBjb25z
dDogdHN1X2NsawogCgotLSAKMi41MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
