Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7233C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iJZO7hb8ITOeTZPBKR3dsG08GiE0FVy+rBr0bZxHw4=; b=TYBHhW6Q8IocUf
	OIvUa4Nbe55iNovThy03m2ssY4z5LvipQ346JBIeiWNQ3GnV9jgJgBFe+PzjRrcKq3im5R4PW4p/o
	Tb+5j9n7vzGxuw52q+GuqKtSy+YJnW8MWw8W/8p4qLn9KxPG8YdY+kuBzRn9FNnYoHDmE/oLtvA9N
	ujuXISbbPNeodfwEimb2etw2sS4Eo669PK1iP684XpYoatnYr2DzUqfyNhopzUAjAzxQQO2VH966u
	WwIskarw7HVRUEHYJRbZLbGrTmY/HnrAWQ0V/Ay02mSV8Ul1rtralTEgREW2+yOCadwCMSXDYayBa
	I0qEMS9D1dO5IdZaO9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflN-00000006KpS-29dC;
	Tue, 01 Jul 2025 18:31:25 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd36-00000005ueK-36rE
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:37:34 +0000
Message-ID: <62111125-c1f5-41ff-ba32-75ec41508906@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E82KrJwgWkOW+NmsBbXPBqs/aYg5/5kQ8qZzeEJKY/I=;
	b=ENigJ1dn2PFqbh4WbpieVYCLw8kAqUSRORgmHFVwvcLzQUCmm37tmyM9RCqNIwY3042XND
	lRqt4HEbDBXfxS0seaC8MGUTWpORbZ8HArRvGGuENOgfaMmJHs9hx9XFlaHZIAXJFXEMqQ
	mcU+JKqCuk7RbxuM6eF/9c9xBvWQikM=
Date: Tue, 1 Jul 2025 11:37:21 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 07/18] net: macb: drop macb_config NULL
 checking
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-7-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-7-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083732_927677_58B032AC 
X-CRM114-Status: GOOD (  13.51  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IFJlbW92ZSBOVUxMIGNoZWNr
cyBvbiBtYWNiX2NvbmZpZyBhcyBpdCBpcyBhbHdheXMgdmFsaWQ6Cj4gIC0gZWl0aGVyIGl0IGlz
IGl0cyBkZWZhdWx0IHZhbHVlICZkZWZhdWx0X2dlbV9jb25maWcsCj4gIC0gb3IgaXQgZ290IG92
ZXJyaWRkZW4gdXNpbmcgbWF0Y2ggZGF0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJy
dW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVu
Y2UvbWFjYl9tYWluLmMKPiBpbmRleCA2YzhhMzRlNDBiNzdlYTM3ZWQyNWMyYjA0MTQ0NDBjZDNm
Njk2MmMzLi42OTI2ZWExMWQ3MWFkYWU3YTI1ZDVlZTMyOWMxNDhmNTg4MmQ0MTg0IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gQEAgLTUyMjcsMTUgKzUy
MjcsMTMgQEAgc3RhdGljIGludCBtYWNiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIAl9Cj4gIAlicC0+bnVtX3F1ZXVlcyA9IG51bV9xdWV1ZXM7Cj4gIAlicC0+cXVldWVf
bWFzayA9IHF1ZXVlX21hc2s7Cj4gLQlpZiAobWFjYl9jb25maWcpCj4gLQkJYnAtPmRtYV9idXJz
dF9sZW5ndGggPSBtYWNiX2NvbmZpZy0+ZG1hX2J1cnN0X2xlbmd0aDsKPiArCWJwLT5kbWFfYnVy
c3RfbGVuZ3RoID0gbWFjYl9jb25maWctPmRtYV9idXJzdF9sZW5ndGg7Cj4gIAlicC0+cGNsayA9
IHBjbGs7Cj4gIAlicC0+aGNsayA9IGhjbGs7Cj4gIAlicC0+dHhfY2xrID0gdHhfY2xrOwo+ICAJ
YnAtPnJ4X2NsayA9IHJ4X2NsazsKPiAgCWJwLT50c3VfY2xrID0gdHN1X2NsazsKPiAtCWlmICht
YWNiX2NvbmZpZykKPiAtCQlicC0+anVtYm9fbWF4X2xlbiA9IG1hY2JfY29uZmlnLT5qdW1ib19t
YXhfbGVuOwo+ICsJYnAtPmp1bWJvX21heF9sZW4gPSBtYWNiX2NvbmZpZy0+anVtYm9fbWF4X2xl
bjsKPiAgCj4gIAlpZiAoIWh3X2lzX2dlbShicC0+cmVncywgYnAtPm5hdGl2ZV9pbykpCj4gIAkJ
YnAtPm1heF90eF9sZW5ndGggPSBNQUNCX01BWF9UWF9MRU47Cj4gCgpSZXZpZXdlZC1ieTogU2Vh
biBBbmRlcnNvbiA8c2Vhbi5hbmRlcnNvbkBsaW51eC5kZXY+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
