Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31484C61DD6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iA+sHjX1mIThTI6ZRa2XBDQKw3uuFOI0ohSsicviVU=; b=W6akYbIl4Tfsvl
	GVqD28B7Bh5QRqyp1MXuVFCsfqkog2zdpSUYO6CvfXknaKuYQLaEl25TB0W80UshK7qiOJ78GDpyY
	oVRxOWOLvs6wnN1KJIEMDmHhSzd86QEDz9UDyD1t8TZt/vvHJE72cnEPKzI06eQKGCxTIeNhmL/BW
	TMqR2E3kL7//nxup4SdabmqK9tjJMBSNAZ53w4ppM10i5o3DyNay0oqONCTBG6aIzDPExSFWzlpUz
	bqpdegvSIxLtcP1CcaolxWSg0cSbAWXT8Q1iHw3BpttNs9zJMR+maW97imBmyOiqncjdfczfg6CXU
	ChKgdANfueRfSEYgdqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UOR-00000002IXc-16cS;
	Fri, 04 Sep 2026 13:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UOP-00000002IXJ-3NyK
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Sep 2026 13:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=; b=b89yyUiBJI205I5iWaFIi4vmuk
	piKyqlhs0PRDQJ2IVkC/xnpcgF5ATj9MbUVkw0l4YC9/VxjlY3UYCRgpy9IK0KzBzVFYWjERBn1de
	e6rEnu56imTT6sIabjRjGBB/KIgv0L55/5WbR7RrDq9jSJpix54OOV2+yWjdDS0HKayDH6z0s3q/B
	gzN3vaWu6F2EqFDfRZM/1q4wTl42SPWAcineNJ191l4cDAlSTxpmHqilL0SWgFTm4GyMrML3pCABM
	Y6ZsU7QiE6j0ZoGK0xnfQyNIuEvE02mUO0Chei7iCU1z2sH3uN59xSSuqxOw+JsIxT0lAQbj8sANU
	ba3NKpaQ==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2UOJ-0000000E9wU-1vnK
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 13:55:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so934904a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 06:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530134; cv=none;
        d=google.com; s=arc-20260327;
        b=GjfaaywhvwuGjIkBcPcUGB8UsGbUrLdY6KX9ZAbGaeQnhBYrV9EKkvqOCU61ehGxcA
         k/2bz08ez6uKKAZbqaC3kMQI0VK7uHwIHsOyep1EMHHbyDlaUkEwFUBQVI9Raaiykqo1
         DnRVR21qIcKRZ0H3oCBLoQcvX/+eyHmXao7kXmjYx5yKyzMwe8iq4YRSfoD9pbGGRDRw
         0R2KI9lQYK0Gf57AHVNAe53lRrtEoI/3GNVJYsXoGBjiMsKtNRVK6lVZgntfsCv0oMmZ
         sSdmjYD114P63DTkfpUmUbp2hKGlO6fizQeOQ5ttBUwrwEQpTCV0SIcwuYy4sNX+d+ll
         LB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        fh=c0FOCpUPZywr1OYUkguJJyZrAt5dfHrFtnuOiglth6M=;
        b=kBnjuj0JP7bAgq3KAeTdqU3keUC3ZIDMOjTxNMYibABT9Wmikh34H2bRpcDO8l5xqM
         eqcct026wnwa7RxnLkHlliD2X2CsiRlsqnBDY0FLSmKt5cMOWurA/dLSxULwfmcbHnrQ
         W5ztrr3TK5wcKm6n2c+h+t4zY3MUldRDZBuRe1jucAEAGUrJ7gfB2Slsssyw+CbVO0gU
         X95qcq+a1HOit3VRDQvtSMftILrrUcXq3eoHYQETgKPXpLPLQm5ibGUartWfl7Zj0k0o
         RD2lAJ8grKfHsRqkMarH87GgxwBpm6REBETjYhc7d/j4KAwuvuONeKh4W/zK6l647w66
         A2+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530134; x=1789134934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=AlEXy+FJQ/YC0ggrCCOYwjOC7k7SFksnwlMu263Zp+RDqhdxs7FNnIKGEWnwLYE/2o
         9YjU8+nGPTwLywrRZ5elfGvhnjndWkfdyzykHSAxgtYjnEtM1qb5myUMNtvQFgVLLcYa
         zkPOrDBIfGm2DcADcp81uYcObNhUbdhBcV4nrHD8qC8arZY3TARuOv41Ko6m9KA7U6SR
         5gNcGdCIDnz+zOZRvWA1PpDo5Ij08gwn737D82rxPtttIg2Rf1bdttzaLK2aTO5FT/3e
         M3FlqLhps0cE5OB9C9T2V0fnTC7MDnm4KRNlwHJ3i6m0FwezYbSsCb+1OCMZDH+catiM
         QN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530134; x=1789134934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=L8hF0ciQVa5UZctYbnOmCq50YuZ8naFgs2+E0VkypD/vwIm7XXqir9MID9GMP7dJRk
         maY3DO9fn3f2sD6qaRcslyh/vybHb3Q30yEQXqedM0DhifGsZf//sJo20KPNFu01j9dZ
         0Xqs8kWuHvufN2F7K1RMp08D80fA2vlH6QXV1PqiBf15neDyaZVschv6/A/6yPfA7eac
         K5F22j7ZVv/ZGA34bBI+168h22N2VARkHvvbB5tiS3CHKpvteseDiOOrd4qpkkAjNKck
         uBr27JsAL8yYFinVaDHqpBPlPIu3Oj+CI1QsvEGFL0PrnDut/nNXpQ21Pv4O2qrtUdan
         Ym1g==
X-Forwarded-Encrypted: i=1; AKwUvBzI7TfeuAVWYQQCj776hs6joZlYi8TQkNOpFEgHvju4K6n0W78xn7Lgo5wuqn4x/CU/XTK3oatZKV7ZjA==@lists.infradead.org
X-Gm-Message-State: AFuF++npneRhREcsIWsp9LveFvuGlPgoZbs/oVSLobBdrcjK0FjVDYqD
	igICMmPhkDyII9raz2mnPwUsn5Pr6k8plxiBHn+plWjobwVOIYx5YWeVR8KDnRPQ9B84s4SsqK5
	lZTXvlZX0t+dXTxmePU1rJycJxE4aPdY=
X-Gm-Gg: AYBFou0hX29MY18RCT2XmTo9zhfPEXqPKd3aRpOU3wYusYiYGQcKNbjINLUsybCw3zh
	zpiTkI8783BQwVP2Uw8sRdCjE61Nwx0MicrTEo8/p1fPqpnXOAJ5j/yPfa8iIt2VqpUQdhWlmQX
	I2KCyhoMExhm7ScVqfkeqRXNTa4dIqg9eB7mAz8KcJyEE0avf9pCtEh5dTCRqZAVixgQ5sstelR
	cfVXWLzfDlWdho9F/5eZPgB9bHxJ2dbVVTwhDLMNQ2TS6Bp5Ck0xzyF+mHA0cMVDeqHk8LSVS3W
	uTAgccqllLOYtRE2EHmf8JWpsydxmBwdiU4n56tK/3UJ8jIOLOhcocmLiDT4
X-Received: by 2002:a17:907:720f:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c260c8c21d3mr311924666b.8.1788530134042; Fri, 04 Sep 2026
 06:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 10:55:19 -0300
X-Gm-Features: AcwNN1WkMLBcSKjjx-549nVRZ1ZETkJHm5sDyQYa7o61EdbIDExabOintEMeFfo
Message-ID: <CAJq09z44PfcEKsoH9eP+c5rxmzQ52hQO33k8sO-e6po1bpE6rQ@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_145541_668961_CFBF1D84 
X-CRM114-Status: GOOD (  14.05  )
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

RW0gc2V4LiwgNCBkZSBzZXQuIGRlIDIwMjYgw6BzIDAxOjM5LCBTaWRkaGFydGggVmFkYXBhbGxp
CjxzLXZhZGFwYWxsaUB0aS5jb20+IGVzY3JldmV1Ogo+Cj4gU2luY2Ugc2VudGluZWwgaXMgdGhl
IGxhc3QgZW50cnkgYW5kIHdlIGRvIG5vdCBleHBlY3QgZnVydGhlciBlbnRyaWVzCj4gZm9sbG93
aW5nIGl0LCByZW1vdmUgdGhlIGNvbW1hLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2lkZGhhcnRoIFZh
ZGFwYWxsaSA8cy12YWRhcGFsbGlAdGkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9kc2EvcmVh
bHRlay9ydGw4MzY1bWJfbWFpbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9kc2EvcmVh
bHRlay9ydGw4MzY1bWJfbWFpbi5jIGIvZHJpdmVycy9uZXQvZHNhL3JlYWx0ZWsvcnRsODM2NW1i
X21haW4uYwo+IGluZGV4IDRjMzA1NzU2MTE2Yy4uZjgyMjBkODMyZTQ2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbmV0L2RzYS9yZWFsdGVrL3J0bDgzNjVtYl9tYWluLmMKPiArKysgYi9kcml2ZXJz
L25ldC9kc2EvcmVhbHRlay9ydGw4MzY1bWJfbWFpbi5jCj4gQEAgLTMzNTIsNyArMzM1Miw3IEBA
IGNvbnN0IHN0cnVjdCByZWFsdGVrX3ZhcmlhbnQgcnRsODM2NW1iX3ZhcmlhbnQgPSB7Cj4KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnRsODM2NW1iX29mX21hdGNoW10gPSB7
Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlYWx0ZWsscnRsODM2NW1iIiwgLmRhdGEgPSAm
cnRsODM2NW1iX3ZhcmlhbnQsIH0sCj4gLSAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4gKyAg
ICAgICB7IC8qIHNlbnRpbmVsICovIH0KPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
cnRsODM2NW1iX29mX21hdGNoKTsKPgo+IC0tCj4gMi41MS4xCj4KClJldmlld2VkLWJ5OiBMdWl6
IEFuZ2VsbyBEYXJvcyBkZSBMdWNhIDxsdWl6bHVjYUBnbWFpbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
