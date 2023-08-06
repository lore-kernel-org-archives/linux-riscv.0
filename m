Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4C6C001DE
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRuO7cz1ysZDkfZwQOg/xpCNtpjVaoNe/WPPQ811l2U=; b=gfA8/d2u3EG1oG
	rPSdD+UHtaiEdEPFBAqt3v34dDGhw/jdGXR9IvDVb8KtTE4hxjYwo8iMoOIWjlHWToDqwNIvGRsez
	1DWmbQcuQShoYsH9zjccqmA5sds9FUTyLwE0CNDWa7Dy1Xw674P9VAMsoQbB9P/K3vHyIHyi8fVCD
	sAjlNHBHSNFpMl4iqPKp7lXPbkMzxALIP4tbvp4cQYvVY+Ibas5kPUWJ42f3sEdvoQ9PASjRH/E5f
	ghofuU+JR2gwlSZhP32DmXSyWh0a0d7+klAY/plbAhq5EeTE393U6ZzXiTD84SB+Ux5oPOmwG76aD
	OAyebFa3CQxqVyMPTOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSXMi-00F0mU-0T;
	Sun, 06 Aug 2023 06:35:48 +0000
Received: from out-127.mta1.migadu.com ([95.215.58.127])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSXMf-00F0lq-0k
	for linux-riscv@lists.infradead.org;
	Sun, 06 Aug 2023 06:35:47 +0000
Date: Sun, 6 Aug 2023 16:33:45 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691303741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QcmFk87OSOnLQz2aC/rzCVz9SI5NqtxQgcc/xuSFnA=;
	b=LO2GkUBlLmae2f6NePMseHTBEkOx1tEX3Yh/67CHOPK6ihrmJRjULSCAwvj14677WkG0qT
	7COuiuLJW7wr4nYYQa+EzPAzxWSUxZ7vga+KLjBqeqkm0pttUvzjLNMUgzghEmohDlhhei
	YdJxam8rOiLsBK8F5Rt7wAPHwc3zQYeicMhrWYj+/04OMt+2YzWvs+v8vP1900mSbuNMUa
	F4mt7aFnA/RuP2aAi8FI26v7Havt2VjuUy73zzQrgyY6JWvsWCAT5TX9IZjc7VLorDKy3f
	/YgmTjXbgrgtHZy87OmgUAOxHnEFQZ965CsSdbYcurOl89yc4rtzvg8NPK0VIA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, edumazet@google.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de,
	netdev@vger.kernel.org, pabeni@redhat.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org, samuel@sholland.org,
	wens@csie.org, wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller
 nodes
Message-ID: <ZM8-yfRVscYjxp2p@titan>
References: <20230721221552.1973203-4-contact@jookia.org>
 <20230805164052.669184-1-bigunclemax@gmail.com>
 <ZM5-Ke-59o0R5AtY@titan>
 <2690764.mvXUDI8C0e@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2690764.mvXUDI8C0e@jernej-laptop>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_233546_012893_D5246313 
X-CRM114-Status: GOOD (  14.75  )
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

T24gU2F0LCBBdWcgMDUsIDIwMjMgYXQgMDc6NDk6NTFQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IERuZSBzb2JvdGEsIDA1LiBhdmd1c3QgMjAyMyBvYiAxODo1MTo1MyBDRVNUIGpl
IEpvaG4gV2F0dHMgbmFwaXNhbChhKToKPiA+IE9uIFNhdCwgQXVnIDA1LCAyMDIzIGF0IDA3OjQw
OjUyUE0gKzAzMDAsIE1ha3NpbSBLaXNlbGV2IHdyb3RlOgo+ID4gPiBIaSBKb2huLCBKZXJuZWoK
PiA+ID4gU2hvdWxkIHdlIGFsc28ga2VlcCBhIHBpbmN0cmwgbm9kZXMgaXRzZWxmIGluIGFscGhh
YmV0aWNhbCBvcmRlcj8KPiA+ID4gSSBtZWFuIHBsYWNpbmcgYSBDQU4gbm9kZXMgYmVmb3JlIGBj
bGtfcGcxMV9waW5gIG5vZGU/Cj4gPiA+IExvb2tzIGxpa2UgdGhlIG90aGVyIG5vZGVzIHNvcnRl
ZCBpbiB0aGlzIHdheS4uLgo+ID4gCj4gPiBHb29kIGNhdGNoLiBOb3cgdGhhdCB5b3UgbWVudGlv
biBpdCwgdGhlIGRldmljZSB0cmVlIG5vZGVzIGFyZSBzb3J0ZWQKPiA+IGJ5IG1lbW9yeSBvcmRl
ciB0b28hIFRoZXNlIHNob3VsZCBiZSBhZnRlciBpMmMzLgo+ID4gCj4gPiBJdCBsb29rcyBsaWtl
IEkgbWlnaHQgbmVlZCB0byBkbyBhIHBhdGNoIHRvIHJlLW9yZGVyIHRob3NlIHRvby4KPiAKPiBJ
dCB3b3VsZCBiZSBiZXR0ZXIgaWYgRFQgcGF0Y2hlcyBhcmUgZHJvcHBlZCBmcm9tIG5ldGRldiB0
cmVlIGFuZCB0aGVuIHBvc3QgCj4gbmV3IHZlcnNpb25zLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBK
ZXJuZWoKCkFncmVlZC4gSXMgdGhlcmUgYSB3YXkgdG8gcmVxdWVzdCB0aGF0PyBPciB3aWxsIHRo
ZSBtYWludGFpbmVyIGp1c3QgcmVhZCB0aGlzPwoKSm9obi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
