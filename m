Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3456FC7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWaNtPQDQ+RWmSCZ91lRFlIrxLg7YutZzk12R7KuYcU=; b=KQR9zkSZJqx7wv
	2tUnlEvhGV5BTam8VQgCS9bO/r0InoQ7UEnbnjuw31l8nTfp/DZ1bvsfglkBzV39NF6OqOvmdb3z4
	NmyfyEIVGsr5+q/bBBPcfzgvCKQbB9eweiwSrzFqm9gAjxpzD9N5T/GntgDWiMvpFGAz1uawBRdT3
	GTR75/kYoA3YLbNMgeeAEVBqXlBiTzjMa1Q9A9G0ITkWIf1V/Eq/QZPbwjv9iiTQpzxMYtvC8ETGi
	vgiawPa+moPzkmr1K7XQkJRQjGZSFfRNx++ZMBKd7KuNp75g5rI4CfHo6f389rXCjBvlzVaFIIp0y
	D8M/HBmrI8lPiVNg2K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Fb-0000000EFny-2BxU;
	Fri, 27 Jun 2025 10:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55f-0000000E396-3jbh
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Jun 2025 09:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xV7K0ZdGbiaBZuLteWgpn/RILuyXMQnyjLW6HWmhQmg=; b=HlLfA41rsX8c+9dDRD4GJMXAmV
	5CXa1D7r5vjBv+WaIe/uolWvmdORzSM6h6BZzviylkRW4m29YV7/101Q0ljIOJ8LLVgcA2KF1ckRR
	vtg7+Pd47wfRm99jYoSOIN8I8M/Vq/TwvbkeVi/+6WHR+RvqBceeqV5jwrikkjmPD2zdVS3UVsa2K
	5a00yiiZ8GEdueiENYsLT7SVv5eFKWewEuzc3MUsFXqb+56YjS+7vkpfPs+6xk7bI1DTdu69ixnzu
	JZYn3bETYaA1Vo4u3QMnUdCG8lCOr4b7IHOhW8uym1z5rM8cz/IWw9nUZbTLN91k+oBu5eh73A/1C
	Ti3u195A==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55c-00000006HQ3-2Dxf
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81845438F0;
	Fri, 27 Jun 2025 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV7K0ZdGbiaBZuLteWgpn/RILuyXMQnyjLW6HWmhQmg=;
	b=W4CfjmgSoJM+Upzz2zRqknrcszFKcSpACX7Iw9QnLs0j4IOS4G9zzLn5Fvf7iTHbgseDNm
	+bB8xHRQE/XDxJwHGj+e/lesSOkDoXxlXg7K9tyLqOxqANwV8AcRl+RiH9rmhhERqgpiD4
	fI6pOW0uIPwO+dJBv4zs99VEQMaIOQ82hkHhb9uUBDTy5zHWe2XeOnaDyv2/ouSMl1yalY
	u1j9eeZehL7d13KCwrgHg3MZImDO1Jpebwmp0cbe6HzdGpSoJ1yLFfZw4F2EKCQ70NwBCQ
	b7dtZpcdh6g8Bewpt/x5+1/OULa4vsOUnLHiUGYJwHI733jwEkeXZfcniBTGUA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:55 +0200
Subject: [PATCH net-next v2 09/18] net: macb: sort #includes
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-9-ff8207d0bb77@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeefpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_100945_077492_1ADA2DF8 
X-CRM114-Status: UNSURE (   7.41  )
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

U29ydCAjaW5jbHVkZSBwcmVwcm9jZXNzb3IgZGlyZWN0aXZlcy4KClJldmlld2VkLWJ5OiBBbmRy
ZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+ClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9t
YWNiX21haW4uYyB8IDM2ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKaW5kZXggYmU2NjdjYjVhY2NlODVhOWQxMWFhZWEx
ZjUwODFhMzM4MGI2MGVmMi4uYTY2MzNlMDc2NjQ0MDg5Yzc5NjQ1M2Y4NTZhNzY2Mjk5YmFlMmVj
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwor
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCkBAIC02LDM2ICs2
LDM2IEBACiAgKi8KIAogI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZt
dAotI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgorI2luY2x1ZGUgPGxpbnV4L2NpcmNfYnVmLmg+CiAj
aW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+CisjaW5jbHVkZSA8bGludXgvY2xrLmg+CiAj
aW5jbHVkZSA8bGludXgvY3JjMzIuaD4KKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgor
I2luY2x1ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvZmlybXdhcmUv
eGxueC16eW5xbXAuaD4KKyNpbmNsdWRlIDxsaW51eC9pbmV0ZGV2aWNlLmg+CisjaW5jbHVkZSA8
bGludXgvaW5pdC5oPgorI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgorI2luY2x1ZGUgPGxp
bnV4L2lvLmg+CisjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+CisjaW5jbHVkZSA8bGludXgvaXAu
aD4KKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgotI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
PgotI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Ci0jaW5jbHVkZSA8bGludXgvY2lyY19idWYuaD4K
LSNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Ci0jaW5jbHVkZSA8bGludXgvaW5pdC5oPgotI2luY2x1
ZGUgPGxpbnV4L2lvLmg+Ci0jaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8
bGludXgvbmV0ZGV2aWNlLmg+Ci0jaW5jbHVkZSA8bGludXgvZXRoZXJkZXZpY2UuaD4KLSNpbmNs
dWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgotI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgotI2luY2x1ZGUgPGxpbnV4L3BoeWxpbmsuaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgog
I2luY2x1ZGUgPGxpbnV4L29mX21kaW8uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9uZXQuaD4KLSNp
bmNsdWRlIDxsaW51eC9pcC5oPgotI2luY2x1ZGUgPGxpbnV4L3VkcC5oPgotI2luY2x1ZGUgPGxp
bnV4L3RjcC5oPgotI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgogI2luY2x1ZGUgPGxpbnV4L3Bo
eS9waHkuaD4KKyNpbmNsdWRlIDxsaW51eC9waHlsaW5rLmg+CisjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUg
PGxpbnV4L3B0cF9jbGFzc2lmeS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Ci0jaW5jbHVk
ZSA8bGludXgvZmlybXdhcmUveGxueC16eW5xbXAuaD4KLSNpbmNsdWRlIDxsaW51eC9pbmV0ZGV2
aWNlLmg+CisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorI2luY2x1ZGUgPGxpbnV4L3RjcC5oPgor
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisjaW5jbHVkZSA8bGludXgvdWRwLmg+CiAjaW5jbHVk
ZSAibWFjYi5oIgogCiAvKiBUaGlzIHN0cnVjdHVyZSBpcyBvbmx5IHVzZWQgZm9yIE1BQ0Igb24g
U2lGaXZlIEZVNTQwIGRldmljZXMgKi8KCi0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
