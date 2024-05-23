Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C2C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBn6YIAIXLFKtD9YJzz9UPNbYNB43utqdv//t1SKaWc=; b=ffwxHxawlvksZz
	kfsecvajvCe21BILl1lAKXQjgD+v6X7WYmcGnVyUYDnYt55yUflai2phQxBHzSXdN9V9DLCvwXK6M
	2J7BD3IhlfxXfTElQf1MqkuKDhwz0RaMTwAY4zpSPrn0aifgI6CUlsYDt60j+kWPidej5Gq9kuwfo
	Av2D4wfcbIB2zTzy+ydMACjv4t06ycloqZEDWCwoJ7n/6lGMUiDcBMNmv0xoFAZ/xeb2BYBZiI/7e
	GPuzn2qqfMH6LfUP7oWp9exyAJmNQ+NyrUsyYl8j9EcVUm8MD1flg33BPNW5xJgJSicNg185pyebS
	yrKwrhiWGAnuBTF5ixmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1QW-000000058ol-2QKn;
	Thu, 23 May 2024 05:55:44 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1QR-000000058na-3GTA
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 05:55:42 +0000
X-Envelope-To: kikuchan98@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1716443735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY3OZs3TRZ5fmpHwmF6ZDWmp14tMvpciAkxRyO1/MQo=;
	b=hytQWbFKB3vS3t96pRQn4SK+Ur5QZdeFozP0miOBgRAvWcITv47RA+H3y/L8s41jv2Jvwp
	2V3mqNq/STuUork+Ia76faXDFhZL4ZPVJp4uVFqRYa0t0qWzpkA9rgFdAB+oeV0c72NYxL
	PBbUgqJ5mADP46bcP+qBEZ1ZEOAA+KlwrEcGFSrsbgy2FCZJd+5S03xqmAqedwC1PPR2pc
	H6K1usInzBMeoeP8VMe/OUHo7JdQqZjr1RwS3T5ADMI6Z6G4iS0BOeMVvQ7846Mdwo0MU3
	rQenItiIfmJmr5/f+6MwV4ChKBt6E+oDXNL7sWK6sv2hGNZn32pWDadZJw9llw==
X-Envelope-To: privatesub2@gmail.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: bigunclemax@gmail.com
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: fusibrandon13@gmail.com
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-pwm@vger.kernel.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: mkl@pengutronix.de
X-Envelope-To: p.zabel@pengutronix.de
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: robh@kernel.org
X-Envelope-To: samuel@sholland.org
X-Envelope-To: ukleinek@kernel.org
X-Envelope-To: wens@csie.org
Date: Thu, 23 May 2024 15:54:00 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: =?utf-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Cc: privatesub2@gmail.com, aou@eecs.berkeley.edu, bigunclemax@gmail.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	fusibrandon13@gmail.com, jernej.skrabec@gmail.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	mkl@pengutronix.de, p.zabel@pengutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, samuel@sholland.org,
	ukleinek@kernel.org, wens@csie.org
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <Zk7Z-MfdF-YKWeJ6@titan>
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
 <Zk6yK3U9tgxOxcBb@titan>
 <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_225540_289555_F760E503 
X-CRM114-Status: GOOD (  15.73  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMDI6MzA6MzJQTSArMDkwMCwg44GN44GP44Gh44KD44KT
44GV44KTIHdyb3RlOgo+IEhlbGxvIEpvaG4sCgpIZWxsbywKCj4gCj4gWW91ciBtZXRob2QgaXMg
cXVpdGUgaW1wcmVzc2l2ZSBhbmQgY2hhbGxlbmdpbmcuCj4gCj4gSSB0aGluayBQV00gaXMgbm90
IG9ubHkgZm9yIExDRCBiYWNrbGlnaHRpbmcsIGJ1dCBhbHNvIGZvciBzaWduYWwgZ2VuZXJhdGlv
bi4KPiBGb3IgaW5zdGFuY2UsIGltYWdpbmUgYW4gYXBwbGljYXRpb24gc29mdHdhcmUgdGhhdCBz
ZW5kcyBhIHN0cmVhbSB0bwo+IG9uZSBQV00gY2hhbm5lbCB0byBzeW50aGVzaXplIHNvdW5kIGJ5
IGNoYW5naW5nIGl0cyBwZXJpb2QgKHBsYXlzIGEKPiBzcXVhcmUgd2F2ZSkuCj4gQnkgeW91ciBt
ZXRob2QsIGlmIHRoZSBvdGhlciBQV00gY2hhbm5lbCBpcyB1c2VkIGZvciBMQ0QgYmFja2xpZ2h0
aW5nLAo+IGl0IG1heSBmbGlja2VyIHJlcGVhdGVkbHkgb24gRElWX00gY2hhbmdlcy4KPiAoT3Ig
c2ltcGx5IGJvdGggY2hhbm5lbHMgZm9yIHN0cmVvIHNvdW5kIHN5bnRoZXNpemUsIHlvdSBtYXkg
aGVhciBsb3RzCj4gb2YgcG9wIG5vaXNlKQo+IAo+IEl0IG1lYW5zIHRoZSBzZXR0aW5nIG9mIG9u
ZSBjaGFubmVsIGNhbiBhZmZlY3QgdGhlIG90aGVyLCB3aGljaCB1c2Vycwo+IG1heSBub3QgYW50
aWNpcGF0ZS4KCkRvZXMgTGludXggZ3VhcmFudGVlIGEgZmxpY2tlci1mcmVlIGV4cGVyaWVuY2Ug
d2l0aCBzZXR0aW5nIHVwIFBXTQpjaGFubmVscywgb3IgdGhhdCBpdCBkb2Vzbid0IGFmZmVjdCBv
dGhlciBjaGFubmVscz8KSG93IGRvIG90aGVyIGRyaXZlcnMgaGFuZGxlIHRoaXMgc2l0dWF0aW9u
PwoKTWF5YmUgb3V0LXNvdXJjaW5nIHRoZSBjbG9ja2luZyB0byB0aGUgZGV2aWNlIHRyZWUgYW5k
IGxldHRpbmcgcGVvcGxlIHNldCB0aGUKY2xvY2sgYW5kIGNvbW1vbiBkaXZpc29yIGluIHRoZSBE
VCB3b3VsZCBiZSBhIGdvb2QgaWRlYSwgd2l0aCB0aGUgSE9TQyBhbmQgYQpjb21tb24gZGl2aXNv
ciBvZiAxIGJ5IGRlZmF1bHQsIHRoZW4gZXJyb3IgaWYgdGhlIHZhbHVlIGNhbid0IGJlIGZvdW5k
LgoKVGhpcyB3b3VsZCB3b3JrIGZvciBwZXJpb2RzIGZyb20gNDFucyB1cCB0byA2ODdtcyBieSBk
ZWZhdWx0LiBVc2luZyBBUEIgd291bGQKZ2l2ZSBhIGJldHRlciByZXNvbHV0aW9uIGFzIGJ5IGRl
ZmF1bHQgaXQgaGFuZ3MgYXJvdW5kIDVucyB3aGljaCBpcyBuaWNlIGFuZApkaXZpc2libGUgYnkg
MTAuCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBraWt1Y2hhbi4KCkpvaG4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
