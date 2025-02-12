Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABBBC02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjb+9HtxLlaLJeeet/KDUcRzLQWW+nuc2CtZucMRK6M=; b=WiLbbPjTQ5nMJF
	b6yfSMVOMQl4v+8OwGNnKLcG/d9BfeJNzfoSU6jpZ6SpNqxL0RCfA4meJ5EgxxFtnCO8yBBgCEkqX
	nic4kzHOn7W2paEqdQhxSkb0A030AO0/7L+E4C1hVlylubh9gPqW0rngrHT22Qt9DvIQBfuBMZFjY
	MJk1ylqaaZA/9xf/S6a0NtWS2I0ONldx15cq5d6mye9UeHPxLtUvo8imIjYjnIwaT3CgN6V/pd3Dv
	V+CUfLT9gE2hKeUGLrzI1HgHXhfK/QOrNAwgMyX2yWpl3r70M74QvhOUrQPnkHH+5C9dVOCuujzmE
	61oSPtSx6+QNi4uYJ+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiE6v-00000007km9-30J5;
	Wed, 12 Feb 2025 14:53:09 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiE5U-00000007kY6-1b9G;
	Wed, 12 Feb 2025 14:51:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED301443C0;
	Wed, 12 Feb 2025 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739371896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/S4xKTURHeontyYyIzF3UhaW4swbeEI4cyVPn5z26I=;
	b=U6fKO9ZNbkAvP9nETMzRxyvHoJnDJ7jaL/OauAXgoJPMATOp1FY+sVOfPlMNUxnUwPF6wg
	ZlD1LL6+ruLQa/f/nipAbKXCBiyDhkoBKm2hg3F5q7eMNluI30OaarujKUXId0RW8W2poo
	L15MihjxtV2AhfLqaM/Nye/6p/7KfLRJ/D9ueWjthDftoiak+mzn6bkQ3jbOXG+earg0Lq
	WGBujDNU7bu/gcKYQ2Hxd4lTxNlnY6rDVTSn0P+pNXRyze2oUjfbPKHWCtplhtHE82U6rD
	3PmD9mHPj6cZqFOqmcE0bWszE+WUhefQydOPqfYL4e1fb+XBR9TNAukWimuPvQ==
Mime-Version: 1.0
Date: Wed, 12 Feb 2025 15:51:32 +0100
Message-Id: <D7QJVKCWO1C0.2GIZNZ9FUF96I@bootlin.com>
Subject: Re: [PATCH v3 5/7] clk: eyeq: use the auxiliary device creation
 helper
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Danilo
 Krummrich" <dakr@kernel.org>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Daire McNamara" <daire.mcnamara@microchip.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Douglas Anderson" <dianders@chromium.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Hans de
 Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Abel Vesa" <abelvesa@kernel.org>, "Peng Fan"
 <peng.fan@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefvhffofhgjsehtqhertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudetledtveejvdekleeujefhvdelieeutedvgfevffffkeeugefhhfeiudeljeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeeipdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiugdrmhdrvghrthhmrghnsehin
 hhtvghlrdgtohhmpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomhdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065140_564874_E9911BC7 
X-CRM114-Status: UNSURE (   8.22  )
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

SGVsbG8gSmVyb21lLAoKT24gVHVlIEZlYiAxMSwgMjAyNSBhdCA2OjI4IFBNIENFVCwgSmVyb21l
IEJydW5ldCB3cm90ZToKPiBUaGUgYXV4aWxpYXJ5IGRldmljZSBjcmVhdGlvbiBvZiB0aGlzIGRy
aXZlciBpcyBzaW1wbGUgZW5vdWdoIHRvCj4gdXNlIHRoZSBhdmFpbGFibGUgYXV4aWxpYXJ5IGRl
dmljZSBjcmVhdGlvbiBoZWxwZXIuCj4KPiBVc2UgaXQgYW5kIHJlbW92ZSBzb21lIGJvaWxlcnBs
YXRlIGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxp
YnJlLmNvbT4KClRlc3RlZCB0aGUgc2VyaWVzLCBpdCB3b3Jrcy4gSG93ZXZlcjoKIC0gVGhlIG5l
d2x5IGludHJvZHVjZWQgaGVscGVyIGRvZXMgYQogICBkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9k
ZXYoY2hpbGRfZGV2aWNlLCBwYXJlbnRfZGV2aWNlKSBjYWxsIHdoaWNoCiAgIHVzZWQgdG8gYmUg
ZG9uZSBieSBvdXIgcmVzZXQtZXllcSBjaGlsZC4KIC0gcmVzZXQtZXllcSBhbHNvIGRpZCBhIFdB
Uk5fT04oZGV2LT5vZl9ub2RlKSB0byB2YWxpZGF0ZSBpdCBkaWRuJ3QKICAgaGF2ZSBhbiBPRiBu
b2RlIGF0IHByb2JlIChjaGVja2luZyBpdHMgYXNzdW1wdGlvbnMpLgogLSBXZSBjYW4gcmVtb3Zl
IGJvdGguIFNlZSBwYXRjaCB0aGF0IGdvdCBzZW50IGFzIGEgcmVwbHkuCgpXaXRoIHRoYXQgYWRk
aXRpb25hbCBwYXRjaDoKClRlc3RlZC1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290
bGluLmNvbT4gICMgT24gTW9iaWxleWUgRXllUTUKCk5vdGU6IFBoaWxpcHAgWmFiZWwgaGFzIGJl
ZW4gQ0NlZCBvbiB0aGUgcGF0Y2ggYW5kIHRoaXMgZW1haWwgYXMgdGhlCnJlc2V0IG1haW50YWlu
ZXIuCgpUaGFua3MsCgotLQpUaMOpbyBMZWJydW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
