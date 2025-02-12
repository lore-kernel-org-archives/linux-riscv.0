Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE7C02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d+u687Adv+DYhhJP4k70Up53UzXltdCzLyJDRVuKro=; b=iMRgp/HNhL2dy6
	0YwBHIwXAUrMoNyM+vTu5WcBsAUSyzThwtWeWaXPFgZnGA4EfKngKOp0IdwfJab3VW1B6x8MSPmsq
	NCQuxSPVsVKqhIkK5jvLEyOrTFg6Npk+xhdsVsYHsDqv2/mZrpUiZMtqpDgRHcm1OWeZOFDRiQtaW
	qnjkl4vAAkDulVgfzcKt6aJSAChIXwANUznUFhXefw02KjNBlE5umgRkaGVDGQrDslt4J1qRNpLQK
	HwBAh2OtHOxfuqWl4SSYhiiP0yTWJUs7wE+Hs7dkUbt8N/No2RMtC+Wh1OkLtkeGP/+HPSPpNUaO9
	OgI1l5qV7D7ApiyPchBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDxS-00000007j1f-01dC;
	Wed, 12 Feb 2025 14:43:22 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDvz-00000007ijR-3ak8;
	Wed, 12 Feb 2025 14:41:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDCF204A5;
	Wed, 12 Feb 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739371303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV58UJrNiafKUEEBYyT5622rc4906GKqOPPegyEjpJc=;
	b=GvBu9t563kxnFl8vpKqJnl1NlFNwRhwgqpgwrV/WKHt+P/P2VyItdyvSR8e7YpylVkrJFh
	ZambmdwrU19UQNsfxlqJs00qmG1mJgRSWTe8ObzqtbHpk8slTgRKlELpQzT2avGKq6lyJb
	LL8HprxNBtH1BHLc61viq/yj9L1DFSAe2WWN2RQe9dFql+ICrfKfp8CUe3mO2pCCPgX8tS
	TP6aR8s3Mrn/9Z42s8BUVceDzlUrOyyDuDl6gLHzqZEXHOkCL7Q/nrgv8UdwGzqRqtay8e
	1kA/qjLYuimHcatcpaPr75L+A1gxNamRx4P/B6fzdeCUHAvX/o80W0TZ2LG1gg==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: jbrunet@baylibre.com
Cc: Laurent.pinchart@ideasonboard.com,
	abelvesa@kernel.org,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	bryan.odonoghue@linaro.org,
	conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	dakr@kernel.org,
	david.m.ertman@intel.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	gregory.clement@bootlin.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	ira.weiny@intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	martin.blumenstingl@googlemail.com,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	peng.fan@nxp.com,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	rfoss@kernel.org,
	s.hauer@pengutronix.de,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	simona@ffwll.ch,
	theo.lebrun@bootlin.com,
	tzimmermann@suse.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH] reset: eyeq: drop device_set_of_node_from_dev() done by parent
Date: Wed, 12 Feb 2025 15:41:26 +0100
Message-ID: <20250212144126.120231-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfejhfdviefftedvieetfedugeefvedtfedujefhhedvhefggfduhfefueektdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghlohepthhlvggsqdgsohhothhlihhnqdhffidqtddvrddrpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeejpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrsggvlhhvvghsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmr
 ghilhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_064152_374191_1AF996B0 
X-CRM114-Status: GOOD (  11.03  )
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

T3VyIHBhcmVudCBkcml2ZXIgKGNsay1leWVxKSBub3cgZG9lcyB0aGUKCWRldmljZV9zZXRfb2Zf
bm9kZV9mcm9tX2RldihkZXYsIGRldi0+cGFyZW50KQpjYWxsIHRocm91Z2ggdGhlIG5ld2x5IGlu
dHJvZHVjZWQgZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZSgpIGhlbHBlci4KCkRvaW5nIGl0
IGFnYWluIGluIHRoZSByZXNldC1leWVxIHByb2JlIHdvdWxkIGJlIHJlZHVuZGFudC4KRHJvcCBi
b3RoIHRoZSBXQVJOX09OKCkgYW5kIHRoZSBkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYoKSBj
YWxsLgpBbHNvIGZpeCB0aGUgZm9sbG93aW5nIGNvbW1lbnQgdGhhdCB0YWxrcyBhYm91dCAib3Vy
IG5ld2ZvdW5kIE9GIG5vZGUiLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LWV5ZXEuYyB8IDEzICsr
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jIGIvZHJpdmVycy9y
ZXNldC9yZXNldC1leWVxLmMKaW5kZXggMDJkNTAwNDEwNDhiLi44MDE4ZmE4OTU0MjcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jCisrKyBiL2RyaXZlcnMvcmVzZXQvcmVz
ZXQtZXllcS5jCkBAIC00MjAsMTcgKzQyMCw4IEBAIHN0YXRpYyBpbnQgZXFyX3Byb2JlKHN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphZGV2LAogCWludCByZXQ7CiAKIAkvKgotCSAqIFdlIGFyZSBh
biBhdXhpbGlhcnkgZGV2aWNlIG9mIGNsay1leWVxLiBXZSBkbyBub3QgaGF2ZSBhbiBPRiBub2Rl
IGJ5Ci0JICogZGVmYXVsdDsgbGV0J3MgcmV1c2Ugb3VyIHBhcmVudCdzIE9GIG5vZGUuCi0JICov
Ci0JV0FSTl9PTihkZXYtPm9mX25vZGUpOwotCWRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2Rldihk
ZXYsIGRldi0+cGFyZW50KTsKLQlpZiAoIWRldi0+b2Zfbm9kZSkKLQkJcmV0dXJuIC1FTk9ERVY7
Ci0KLQkvKgotCSAqIFVzaW5nIG91ciBuZXdmb3VuZCBPRiBub2RlLCB3ZSBjYW4gZ2V0IG1hdGNo
IGRhdGEuIFdlIGNhbm5vdCB1c2UKLQkgKiBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBiZWNhdXNl
IGl0IGRvZXMgbm90IG1hdGNoIHJldXNlZCBPRiBub2Rlcy4KKwkgKiBHZXQgbWF0Y2ggZGF0YS4g
V2UgY2Fubm90IHVzZSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBiZWNhdXNlIGl0IGRvZXMKKwkg
KiBub3QgYWNjZXB0IHJldXNlZCBPRiBub2Rlczsgc2VlIGRldmljZV9zZXRfb2Zfbm9kZV9mcm9t
X2RldigpLgogCSAqLwogCW1hdGNoID0gb2ZfbWF0Y2hfbm9kZShkZXYtPmRyaXZlci0+b2ZfbWF0
Y2hfdGFibGUsIGRldi0+b2Zfbm9kZSk7CiAJaWYgKCFtYXRjaCB8fCAhbWF0Y2gtPmRhdGEpCi0t
IAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
