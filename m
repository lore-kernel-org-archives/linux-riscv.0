Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2C3C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yM2ux0OS+exXKx5jVfWqV0EDJIDKhsoHL0smbI86hTg=; b=U+5u5PT/rUvko0
	VlsJPYQMSUMoR4kaS3sw5W72uzCzpt1WrxiSi2fmZWxDN0L0QLzBg8hmyyNETCVyGrMaJLZvVvKYL
	cGJ73KqVEmDwWPGboAko8vmnIvmWOLxe7yaRHyCiuf49adMYBLXKk/Vu4gRCKdEjkFSp/WnPo7uIj
	bL1xci6fWA3c1zc8zAg1uUcFueUTHMGFMa6SHsUwQiGOMUt1XF0WwRVKOn2UMQY61vsPYnVdsuNdh
	sDT9PJz8TxcZ9kEmoXhFaQoC1yMh/b4UFluuUmsKC8hlIwRt2giPsezDMuJZRCQIyY5lm8dPjiSHt
	Mw4DpocNqtb6OvEoRr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Fa-0000000EFnq-3Wct;
	Fri, 27 Jun 2025 10:24:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55f-0000000E38z-3LA1
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Jun 2025 09:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wKYFy0pfzd9hGPcTEMajXYTgp0sLoe7km15C1SLzTy8=; b=dEiFEJne3alikZvMVzR4RC/38t
	fBIt5O6OpR62yD77jWoHjSjzaRob/n0rmjqlMVNGc80ajvVkEBxbwOxNV+OAROq9hD5ixC6PGqDoo
	cCQkYTPSyE5qdg+lZrJyAZRZvjklFxVFxfkCsOmBSv5H47bJytgqpaOJZSxsPWimjSoAhVkAU1hzm
	YAm8cln5QegREPFtUzXDphZ4YeOjp51wFKe8PKj9QhvVkvp4RJlCbVEG8mMm1nSLAqjNS9LwTDm1J
	rxVpkk9J3FJJGCMSt/wuVvID+WoGEeunLwoRfr3z5TVKHIh/iEGXGMCzM2u9KiXCWDmsr42od+H4/
	UTMRs+BA==;
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55b-00000006HPk-46UP
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A17904321F;
	Fri, 27 Jun 2025 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKYFy0pfzd9hGPcTEMajXYTgp0sLoe7km15C1SLzTy8=;
	b=E8MXV4vszKoLfOAFYSy/hYbQFrr9PYCAT4MX+YJlklLDkPC0mz9hqJHxeWlh23MIs+OpcD
	8Ddz6tCO9WTwzP700QHmAg/vdND5BCIA8694RXe1LLXp8+3PyYfVvWI7RdMwpVYmJ0AZWS
	3bd3aRxukiR+1+dzLZ52xEfrBj/s538gXuCDnsqTt+qcXtCGa83OzCLsHE2vQgvo+9krG3
	xyTbYTaKzr7E9kVymRkLkmzBYS42OUAiVYCIyJbGgivIneUJUqk5pwXK51QRrUvWPLSjS8
	uBLadPsaWmPmu7rnDvytZ7YHrJQGSd5DCT51GIyM1Or2QyDXa+adlqykWMtt+Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:53 +0200
Subject: [PATCH net-next v2 07/18] net: macb: drop macb_config NULL
 checking
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-7-ff8207d0bb77@bootlin.com>
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
X-CRM114-CacheID: sfid-20250627_100944_320171_15EEC884 
X-CRM114-Status: UNSURE (   9.45  )
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

UmVtb3ZlIE5VTEwgY2hlY2tzIG9uIG1hY2JfY29uZmlnIGFzIGl0IGlzIGFsd2F5cyB2YWxpZDoK
IC0gZWl0aGVyIGl0IGlzIGl0cyBkZWZhdWx0IHZhbHVlICZkZWZhdWx0X2dlbV9jb25maWcsCiAt
IG9yIGl0IGdvdCBvdmVycmlkZGVuIHVzaW5nIG1hdGNoIGRhdGEuCgpTaWduZWQtb2ZmLWJ5OiBU
aMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0
aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiX21haW4uYwppbmRleCA2YzhhMzRlNDBiNzdlYTM3ZWQyNWMyYjA0MTQ0NDBjZDNmNjk2
MmMzLi42OTI2ZWExMWQ3MWFkYWU3YTI1ZDVlZTMyOWMxNDhmNTg4MmQ0MTg0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCisrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKQEAgLTUyMjcsMTUgKzUyMjcsMTMgQEAg
c3RhdGljIGludCBtYWNiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQog
CWJwLT5udW1fcXVldWVzID0gbnVtX3F1ZXVlczsKIAlicC0+cXVldWVfbWFzayA9IHF1ZXVlX21h
c2s7Ci0JaWYgKG1hY2JfY29uZmlnKQotCQlicC0+ZG1hX2J1cnN0X2xlbmd0aCA9IG1hY2JfY29u
ZmlnLT5kbWFfYnVyc3RfbGVuZ3RoOworCWJwLT5kbWFfYnVyc3RfbGVuZ3RoID0gbWFjYl9jb25m
aWctPmRtYV9idXJzdF9sZW5ndGg7CiAJYnAtPnBjbGsgPSBwY2xrOwogCWJwLT5oY2xrID0gaGNs
azsKIAlicC0+dHhfY2xrID0gdHhfY2xrOwogCWJwLT5yeF9jbGsgPSByeF9jbGs7CiAJYnAtPnRz
dV9jbGsgPSB0c3VfY2xrOwotCWlmIChtYWNiX2NvbmZpZykKLQkJYnAtPmp1bWJvX21heF9sZW4g
PSBtYWNiX2NvbmZpZy0+anVtYm9fbWF4X2xlbjsKKwlicC0+anVtYm9fbWF4X2xlbiA9IG1hY2Jf
Y29uZmlnLT5qdW1ib19tYXhfbGVuOwogCiAJaWYgKCFod19pc19nZW0oYnAtPnJlZ3MsIGJwLT5u
YXRpdmVfaW8pKQogCQlicC0+bWF4X3R4X2xlbmd0aCA9IE1BQ0JfTUFYX1RYX0xFTjsKCi0tIAoy
LjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
