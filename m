Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A9EC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nbxwifqify/FkW2h07t0Mpwan1I0Dqw+xpQk3dyWFOE=; b=sODrsGg9M4p50f
	Ta4n9JAZTMQTT9iDKL8UYgK6zjylXMWhRBQj55AHsWXLIS4LBLZyeutvm/amTaLgW3tr/RGbDWyh1
	MAQQTQW1hStdPZJlgThF0OGIu/bKkc09C2Vo2PjR4y19HShojO5U2xLX4UYNNKn2azW2oSU5l7O2g
	KKfE0rdR5vjAKbJqgH8uDGfMKT0CXS5BK+tSuOyIQpw+pWmkm0ON4emzE9m9Y9codqTvUdI0xdKML
	X9JDB2T57IGRXnWpd3BWekROCzCm/nxf88nFaIrDzgj5IlFGZ36kjQnzXMym8bl+MRooBKHbY9tQ8
	V7XXIXnhnAziFbMqvMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDStP-00GLGm-Pf; Mon, 18 Jul 2022 15:42:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDStN-00GLCd-1Q
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 15:42:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oDSsu-0003FH-Dg; Mon, 18 Jul 2022 17:42:12 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oDSsr-001k2n-PI; Mon, 18 Jul 2022 17:42:09 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oDSsq-000Byu-P3; Mon, 18 Jul 2022 17:42:08 +0200
Message-ID: <b7540ac17d28cee09f6f9cce65b696248e545ae1.camel@pengutronix.de>
Subject: Re: [PATCH v2 03/12] reset: add polarfire soc reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, Daire.McNamara@microchip.com,
 sboyd@kernel.org,  aou@eecs.berkeley.edu, robh+dt@kernel.org,
 palmer@dabbelt.com,  linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 mturquette@baylibre.com,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  krzysztof.kozlowski+dt@linaro.org
Date: Mon, 18 Jul 2022 17:42:08 +0200
In-Reply-To: <22d3a11b-a603-8406-77ec-51ec038560fc@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
	 <20220704121558.2088698-4-conor.dooley@microchip.com>
	 <22d3a11b-a603-8406-77ec-51ec038560fc@microchip.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_084241_099231_F5FC059E 
X-CRM114-Status: GOOD (  10.19  )
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

SGkgQ29ub3IsCgpPbiBNbywgMjAyMi0wNy0xOCBhdCAxMTozNCArMDAwMCwgQ29ub3IuRG9vbGV5
QG1pY3JvY2hpcC5jb20gd3JvdGU6ClsuLi5dCj4gPiArY29uZmlnIFJFU0VUX1BPTEFSRklSRV9T
T0MKPiA+ICsJYm9vbCAiTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MgKE1QRlMpIFJlc2V0IERyaXZl
ciIKPiA+ICsJZGVwZW5kcyBvbiBBVVhJTElBUllfQlVTICYmIE1DSFBfQ0xLX01QRlMKPiA+ICsJ
ZGVmYXVsdCBNQ0hQX0NMS19NUEZTCj4gPiArCWhlbHAKPiA+ICsJICBUaGlzIGRyaXZlciBzdXBw
b3J0cyBwZXJpcGhlcmFsIHJlc2V0IGZvciB0aGUgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MKPiA+
ICsKClBsZWFzZSBzb3J0IGFscGhhYmV0aWNhbGx5IGJ5IGNvbmZpZyBvcHRpb24uCgo+ID4gwqDC
oGNvbmZpZyBSRVNFVF9NRVNPTgo+ID4gwqDCoAl0cmlzdGF0ZSAiTWVzb24gUmVzZXQgRHJpdmVy
Igo+ID4gwqDCoAlkZXBlbmRzIG9uIEFSQ0hfTUVTT04gfHwgQ09NUElMRV9URVNUCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9yZXNldC9NYWtlZmlsZSBiL2RyaXZlcnMvcmVzZXQvTWFrZWZpbGUK
PiA+IGluZGV4IGE4MGE5YzQwMDhhNy4uNWZhYzNhNzUzODU4IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9yZXNldC9NYWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9NYWtlZmlsZQo+ID4g
QEAgLTE3LDYgKzE3LDcgQEAgb2JqLSQoQ09ORklHX1JFU0VUX0syMTApICs9IHJlc2V0LWsyMTAu
bwo+ID4gwqDCoG9iai0kKENPTkZJR19SRVNFVF9MQU5USVEpICs9IHJlc2V0LWxhbnRpcS5vCj4g
PiDCoMKgb2JqLSQoQ09ORklHX1JFU0VUX0xQQzE4WFgpICs9IHJlc2V0LWxwYzE4eHgubwo+ID4g
wqDCoG9iai0kKENPTkZJR19SRVNFVF9NQ0hQX1NQQVJYNSkgKz0gcmVzZXQtbWljcm9jaGlwLXNw
YXJ4NS5vCj4gPiArb2JqLSQoQ09ORklHX1JFU0VUX1BPTEFSRklSRV9TT0MpICs9IHJlc2V0LW1w
ZnMubwoKU2FtZSBoZXJlLiBPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCmFuZAoKQWNrZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+Cgp0byBtZXJnZSB0aGlzIHRvZ2V0aGVyIHdpdGggdGhlIG90
aGVyIHBhdGNoZXMuCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
