Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D34C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvdxTzHTWYvvF7scR+qFFVtJtXatqTRjEh3v9b5ZD80=; b=EjTqAZSs13TmUy
	StiRSWX939+VvDTTk2odmzJuY3IfxnkrHPrZy/6t/hKUu4lh2Y+LgeqOFTimbUc08UPYyMpCdkPa9
	o7cI/M7LOjuHeVCztgbR6zTuY8JQxHD9I6W/XaowI5oGrdt+FYx/z45uh3CueyVPAbOyCTgl1hg7Y
	HHDuruBkRY4H7wbBJEf82sNjOeEFS2vz3h1LtGnmOmBUxv8RAmO9K8yLLztjWwuG8uKEyixD85L7M
	deMed+vGG1j4ZKgT9ynUcSvriVm/qyidcMlq/AjZNCd2dZDPU9+SbI5arCAXburgtj5JYEkNnQjkV
	y6PHehZ+RLusUW7tWNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhpA-0000000FzSx-05xS;
	Fri, 21 Mar 2025 19:14:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhok-0000000FzLB-2r5x
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D230944555;
	Fri, 21 Mar 2025 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bKDOW9BooVCSfDA1lWucvGSqOaPkqITYm2kwpCGtTo=;
	b=AXkW8KAh4StYRvomeZA29gu6cPVEPX2IMOetb/EoAtDdprsz2jvzfXu7aHkLHTEB8IWReD
	Dpe/CV7iFBz21/z+3/aZJ5vjC68Nemlv053zT4jYZ5BBwkDSAKBjMrq+M2AIX3gtOrHY/t
	/eYTVWox0baVqNw3eik8W7BZ/1qAJTfBc3/GfJjYTMH8exdgnbCvU9AWHcc6IvTAU28XTl
	/xQ0nTlVbY0Okm1tePXSNMf/SN2Dot8SYT5h9Vwv1wneN61j1k5KTtK9W/uMMmjSz1dSnu
	ya+ZgACyQxcrBr13WeYzfS7E/EEWZxUrmvynNc4lK7bb5TFmg58O5cEo+8O1Xw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:37 +0100
Subject: [PATCH net-next 06/13] net: macb: simplify macb_probe() code
 touching match data
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-6-537b7e37971d@bootlin.com>
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
X-CRM114-CacheID: sfid-20250321_121406_847307_E5B5124E 
X-CRM114-Status: GOOD (  12.05  )
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

UmVtb3ZlIGxvY2FsIHZhcmlhYmxlcyBjbGtfaW5pdCBhbmQgaW5pdC4gVGhvc2UgZnVuY3Rpb24g
cG9pbnRlcnMgYXJlCmFsd2F5cyBlcXVpdmFsZW50IHRvIG1hY2JfY29uZmlnLT5jbGtfaW5pdCBh
bmQgbWFjYl9jb25maWctPmluaXQuCgpBbHNvIHJlbW92ZSBOVUxMIGNoZWNrcyBvbiBtYWNiX2Nv
bmZpZyBhcyBpdCBpcyBhbHdheXMgdmFsaWQ6CiAtIGVpdGhlciBpdCBpcyBpdHMgZGVmYXVsdCB2
YWx1ZSAmZGVmYXVsdF9nZW1fY29uZmlnLAogLSBvciBpdCBnb3Qgb3ZlcnJpZGRlbiB1c2luZyBt
YXRjaCBkYXRhLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290
bGluLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIHwg
MTkgKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMK
aW5kZXggODA3ZjdhYmJkOTk0MWJmNjI0ZjE0YTVkZGVhZDY4ZGFkMWM4ZGViMi4uYjIwNjk2NjE3
OGUzZDQ5YTA4NGM3NTQxOTFmNzcyMDVmZjZkZDQ2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
YWRlbmNlL21hY2JfbWFpbi5jCkBAIC01MTc3LDEwICs1MTc3LDYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtYWNiX2NvbmZpZyBkZWZhdWx0X2dlbV9jb25maWcgPSB7CiBzdGF0aWMgaW50IG1hY2Jf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAljb25zdCBzdHJ1Y3QgbWFj
Yl9jb25maWcgKm1hY2JfY29uZmlnID0gJmRlZmF1bHRfZ2VtX2NvbmZpZzsKLQlpbnQgKCpjbGtf
aW5pdCkoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqLCBzdHJ1Y3QgY2xrICoqLAotCQkJc3RydWN0
IGNsayAqKiwgc3RydWN0IGNsayAqKiwgIHN0cnVjdCBjbGsgKiosCi0JCQlzdHJ1Y3QgY2xrICoq
KSA9IG1hY2JfY29uZmlnLT5jbGtfaW5pdDsKLQlpbnQgKCppbml0KShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICopID0gbWFjYl9jb25maWctPmluaXQ7CiAJc3RydWN0IGRldmljZV9ub2RlICpucCA9
IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVjdCBjbGsgKnBjbGssICpoY2xrID0gTlVMTCwgKnR4
X2NsayA9IE5VTEwsICpyeF9jbGsgPSBOVUxMOwogCXN0cnVjdCBjbGsgKnRzdV9jbGsgPSBOVUxM
OwpAQCAtNTIwMiwxNCArNTE5OCwxMSBAQCBzdGF0aWMgaW50IG1hY2JfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAkJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7
CiAKIAkJbWF0Y2ggPSBvZl9tYXRjaF9ub2RlKG1hY2JfZHRfaWRzLCBucCk7Ci0JCWlmIChtYXRj
aCAmJiBtYXRjaC0+ZGF0YSkgeworCQlpZiAobWF0Y2ggJiYgbWF0Y2gtPmRhdGEpCiAJCQltYWNi
X2NvbmZpZyA9IG1hdGNoLT5kYXRhOwotCQkJY2xrX2luaXQgPSBtYWNiX2NvbmZpZy0+Y2xrX2lu
aXQ7Ci0JCQlpbml0ID0gbWFjYl9jb25maWctPmluaXQ7Ci0JCX0KIAl9CiAKLQllcnIgPSBjbGtf
aW5pdChwZGV2LCAmcGNsaywgJmhjbGssICZ0eF9jbGssICZyeF9jbGssICZ0c3VfY2xrKTsKKwll
cnIgPSBtYWNiX2NvbmZpZy0+Y2xrX2luaXQocGRldiwgJnBjbGssICZoY2xrLCAmdHhfY2xrLCAm
cnhfY2xrLCAmdHN1X2Nsayk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIApAQCAtNTI0NSwx
NSArNTIzOCwxMyBAQCBzdGF0aWMgaW50IG1hY2JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAl9CiAJYnAtPm51bV9xdWV1ZXMgPSBudW1fcXVldWVzOwogCWJwLT5xdWV1ZV9t
YXNrID0gcXVldWVfbWFzazsKLQlpZiAobWFjYl9jb25maWcpCi0JCWJwLT5kbWFfYnVyc3RfbGVu
Z3RoID0gbWFjYl9jb25maWctPmRtYV9idXJzdF9sZW5ndGg7CisJYnAtPmRtYV9idXJzdF9sZW5n
dGggPSBtYWNiX2NvbmZpZy0+ZG1hX2J1cnN0X2xlbmd0aDsKIAlicC0+cGNsayA9IHBjbGs7CiAJ
YnAtPmhjbGsgPSBoY2xrOwogCWJwLT50eF9jbGsgPSB0eF9jbGs7CiAJYnAtPnJ4X2NsayA9IHJ4
X2NsazsKIAlicC0+dHN1X2NsayA9IHRzdV9jbGs7Ci0JaWYgKG1hY2JfY29uZmlnKQotCQlicC0+
anVtYm9fbWF4X2xlbiA9IG1hY2JfY29uZmlnLT5qdW1ib19tYXhfbGVuOworCWJwLT5qdW1ib19t
YXhfbGVuID0gbWFjYl9jb25maWctPmp1bWJvX21heF9sZW47CiAKIAlpZiAoIWh3X2lzX2dlbShi
cC0+cmVncywgYnAtPm5hdGl2ZV9pbykpCiAJCWJwLT5tYXhfdHhfbGVuZ3RoID0gTUFDQl9NQVhf
VFhfTEVOOwpAQCAtNTM0Myw3ICs1MzM0LDcgQEAgc3RhdGljIGludCBtYWNiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWJwLT5waHlfaW50ZXJmYWNlID0gaW50ZXJmYWNl
OwogCiAJLyogSVAgc3BlY2lmaWMgaW5pdCAqLwotCWVyciA9IGluaXQocGRldik7CisJZXJyID0g
bWFjYl9jb25maWctPmluaXQocGRldik7CiAJaWYgKGVycikKIAkJZ290byBlcnJfb3V0X2ZyZWVf
bmV0ZGV2OwogCgotLSAKMi40OC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
