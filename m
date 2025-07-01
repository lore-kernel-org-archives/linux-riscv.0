Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7108EC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI+fWN5cTRzu44+aJp5oQPeKwBBkkJyEKyO84T1BAbU=; b=EfIklFCctR9x6u
	mzS8HWTHVQMHi3D4uvNpiqTJi7yPm8Ue5YfI2W/91pxgzo/ZaJMPIQwA2tmiFsc66kBeWtyjVOd15
	Tucu5LHVFpt3XkBZYEkYwPgOathwj3I+LXWAjamjhmu8/KfTEfJYMV0OoFuX9Shl2UwIwTPOa2IR+
	q93Hdt/wbywJcl//3OC2JBryxTtafRf0Dmy2CDRnenS7yjUHtajhrTSNMvMJ4V7WWySRgAdqXXaa1
	v7ruMTAAwZdRMhsyaS7jKuXVVfAOm+xRmyePX+DzUSOu3pYFsDuQwUOZvISuUb+ki1vRRYRKS7cRG
	Dh6BpE6oyJMYp7uqLMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiz-00000004TTh-11Tj;
	Tue, 01 Jul 2025 08:52:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWC0-00000004OMi-2anS
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0687E4414D;
	Tue,  1 Jul 2025 08:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BBFC4CEEB;
	Tue,  1 Jul 2025 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357895;
	bh=JawAbuKcYWoYST8hWbMbcg8n7XTzLeaxNe5wApabh/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2ZS5y16YEMWNAlU4163CjQiZrBNWx6Zza7l5DkjrQ4AW7eYVsTzHSRr5w2TO3vkC
	 x+AzNqw8iQc1Dp0NePGjQzi0yiQODrW6hRIeEYJWOZAq8Jn1rRGuh+5sNmumc7MRPP
	 7TQZvYsYu0650q71rjAFkiUz5JqB906jTLfqSKWrqCJvRedzvbTQRgthFd/jKQ7vWm
	 3bnC7HYVeMJrnX7MvT2/ij73m1xwDjwz5w45/DcRX+Dm7X3d6xEBuHHLWc5e5sjX8o
	 nCNmqyydP90bH0p6cpBUSu87GBHc6/Ni++naIpR//Nkj/UyPzyfwxDisjjx8LDQZql
	 zAqOlPUMGrz8w==
Date: Tue, 1 Jul 2025 10:18:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, 
	Rafal Ozieblo <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 02/18] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
Message-ID: <20250701-hulking-idealistic-adder-80ae8f@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-2-ff8207d0bb77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-macb-v2-2-ff8207d0bb77@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_011816_697639_AF25D5B0 
X-CRM114-Status: GOOD (  13.54  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMTE6MDg6NDhBTSArMDIwMCwgVGjDqW8gTGVicnVuIHdy
b3RlOgo+IEFkZCBjZG5zLGV5ZXE1LWdlbSBhcyBjb21wYXRpYmxlIGZvciB0aGUgaW50ZWdyYXRl
ZCBHRU0gYmxvY2sgaW5zaWRlCj4gTW9iaWxleWUgRXllUTUgU29Dcy4gQWRkIGEgcGhhbmRsZSAo
YW5kIHR3byBvZmZzZXQgYXJndW1lbnRzKSBmb3IKPiBhY2Nlc3Npbmcgc3lzY29uIHJlZ2lzdGVy
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4u
Y29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwg
ICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwKPiBpbmRleCBkZjg4MzM1NGM3ZTYzNTA5OTg4NWRh
NDJlNDYwNGUxYzMxYjA1YzcyLi42Y2Y0M2NjNTAzNzdmMjNkNjBlZjQwYmYxYzhlZmEyMmNlMWFl
MGJiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
Y2RucyxtYWNiLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L2NkbnMsbWFjYi55YW1sCj4gQEAgLTU3LDYgKzU3LDcgQEAgcHJvcGVydGllczoKPiAgICAg
ICAgICAgIC0gY2RucyxucDQtbWFjYiAgICAgICAgICAgICAjIE5QNCBTb0MgZGV2aWNlcwo+ICAg
ICAgICAgICAgLSBtaWNyb2NoaXAsc2FtYTdnNS1lbWFjICAgICMgTWljcm9jaGlwIFNBTUE3RzUg
ZXRoZXJuZXQgaW50ZXJmYWNlCj4gICAgICAgICAgICAtIG1pY3JvY2hpcCxzYW1hN2c1LWdlbSAg
ICAgIyBNaWNyb2NoaXAgU0FNQTdHNSBnaWdhYml0IGV0aGVybmV0IGludGVyZmFjZQo+ICsgICAg
ICAgICAgLSBtb2JpbGV5ZSxleWVxNS1nZW0gICAgICAgICMgTW9iaWxleWUgRXllUTUgU29Dcwo+
ICAgICAgICAgICAgLSBzaWZpdmUsZnU1NDAtYzAwMC1nZW0gICAgICMgU2lGaXZlIEZVNTQwLUMw
MDAgU29DCj4gIAo+ICAgICAgICAtIGl0ZW1zOgo+IEBAIC0xMzcsNiArMTM4LDE3IEBAIHByb3Bl
cnRpZXM6Cj4gICAgICAgIE5vZGUgY29udGFpbmluZyBQSFkgY2hpbGRyZW4uIElmIHRoaXMgbm9k
ZSBpcyBub3QgcHJlc2VudCwgdGhlbiBQSFlzIHdpbGwKPiAgICAgICAgYmUgZGlyZWN0IGNoaWxk
cmVuLgo+ICAKPiArICBtb2JpbGV5ZSxvbGI6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAg
ICAgSGFuZGxlIHRvIHRoZSBPTEIgc3lzdGVtIGNvbnRyb2xsZXIgdGhhdCBvd25zIHJlZ2lzdGVy
cyBjb25maWd1cmluZyB0aGUKPiArICAgICAgTUFDQiBpbnRlZ3JhdGlvbi4KCi4uLiB0byBkbyB3
aGF0PwoKTWF5YmUgeW91IGp1c3QgbWlzcyBzb21lIHNvcnQgb2YgcGh5IG9yIHBvd2VyIGRvbWFp
biBwcm92aWRlci4gU3lzY29uIGlzCm5vdCBhIHJlcGxhY2VtZW50IGZvciB0aGF0LgoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
