Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973BAC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg7bIuHXwYTy/ALg09bzpHceZcysUHdC/NZCub2R3bg=; b=zUqQPIT2iE6LqR
	tYWIYykedO1wZqA6Elw6Rc2bHcMi0CSNilp3joOhAlKNnavSr3rgPoli0gCGQDxB9wOmTij7E1mGT
	KrvVFXY7iNWOqgs4/4jjMj8an6q5XPfpb1/3z0bF1yyFoEP7EeG4/NLxozoZhDl0KqlhhdzeaCjsE
	+04W2n/mnpEvQ13DEjluWS9yjlwV1NZvlA5CyxrvEX1e/20kj1MmseVpkI/5NRq0TFaiE3vXJmNGC
	Nrr/q5zZe3IDp715XkAmE8RazfKL75wGH/jHdzw1qkz3CPUWSPVt6SAvI+vPslpkweHyY0qBXtonN
	EoCg6dSHeUEYDWKnqJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdYe-00401Y-1L;
	Fri, 24 Mar 2023 09:18:00 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdYa-00400G-0n
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:17:58 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D91FE5C00D0;
	Fri, 24 Mar 2023 05:17:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 24 Mar 2023 05:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1679649472; x=1679735872; bh=TXn9bh8NNQiaq9RCNIuEb1mA2gEV5NsgDpg
	JpUdv/CY=; b=UgsRLR9CZYS9v7HxbOhO1Ht7dpegLxuTjK3G0tMgwmMzlAbJw/y
	U9HlpavWJLBaeTE4VEdafvz57R0rK7HQLUol36Qnwp60zAakk00EMhB65LEt84tA
	U43B1xJQJ7knz5Sz95Cl8pSrmjn2ISQYeYCskrbZEnIAxZKESLkyGsl7e2amr03c
	jqQz/0DTEVpdG7TUR7w9wfNYuUPIxYq9WIDjY2oVuhG9XqCjr4gSL/qP2E5hLXw6
	7KrL0Z8EQs2SxUyR1RRalFNhqwMXACbkDO8YWr3cfceVYglRMukqd0oyCRSdMKFd
	rERfEvUu+7bBOo7kH347K8JHKDdAAH86rQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679649472; x=1679735872; bh=TXn9bh8NNQiaq9RCNIuEb1mA2gEV5NsgDpg
	JpUdv/CY=; b=bOkAriQ7SnMVdc9qlRXrg5zjYuHLUnhkL6Unzsl8BtPHLmS3GXe
	J6cE/oQ9wv8dIarPz0lMPZ5XmKxcd8+GI1QK7tguZGdNGzM2+DEE4xnVTQFTXYFo
	y8lK+wmchkkV6NOzQngQq9SLF4fxFrFESKJvgSJd2GLXjX86jlAhQs9VC65mX3HW
	5sTD9UaWye41qO4s5Q8HZOJOmcqA/qumqDU0Mh9SqhrxsG9M57fKYu5nwH6BxOen
	BvlBpRQPlK+whAqHIzJXDYbZwwmdRDvo8ledWUeo1oXZMDtjw4z1rwfDrHR9IZAX
	6ABMlrnc+AjRMD4Kz0Sj27qYvKPA00lTNeQ==
X-ME-Sender: <xms:v2odZP0DKBmYhJwawl6AQqFJbRYwbeSdSF6WdW1t_xW_kf6YDCA1ZA>
    <xme:v2odZOEc0QRgUxZYSV48BYhgnDEkQtvTB3g3UCU3TrW7CzFs7D0iyHpcD0VJnkx-c
    kIWyrRPumnVUWbgVOc>
X-ME-Received: <xmr:v2odZP7Jx6EtWVylFcEP02YbQr1V9F0NqX4lUk6bZIUs6RuqAHlihHcQnV_dwQVA7-uH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegiedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:wGodZE2hliBxevB73UB7FDxctXUd7Mw7JuXZPD87jbsd4EFvk9gKCA>
    <xmx:wGodZCGgTeqiAZ5Lm-8-REfVc_xlmMESyx8WazmcKLOxI3WVQvdjcA>
    <xmx:wGodZF9wPT7NC7kNhDO8E_rpjgU5KuY5looZwimGRHo1r153OEF9dw>
    <xmx:wGodZK98UJgeF9dxp_Q9540JaqZEFReCb9Xx_acBTbK_3ql_xaXMLw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 05:17:50 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230323213930.GA7730@lst.de>
Date: Fri, 24 Mar 2023 09:17:38 +0000
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-riscv@lists.infradead.org
Message-Id: <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
 <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
 <20230323213930.GA7730@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_021757_085847_ED2ECC13 
X-CRM114-Status: UNSURE (   5.81  )
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

Cgo+IDIwMjPlubQz5pyIMjPml6UgMjE6MznvvIxDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4g5YaZ6YGT77yaCj4gCj4gT24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMDk6MDc6MzFQTSArMDAw
MCwgSmlheHVuIFlhbmcgd3JvdGU6Cj4+IAo+PiAKPj4+IDIwMjPlubQz5pyIMjPml6UgMDc6Mjnv
vIxDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4g5YaZ6YGT77yaCj4+PiAKPj4+IFRoZSBz
ZXJpZXMgbG9va3MgZmluZSB0byBtZS4gIEhvdyBzaG91bGQgd2UgbWVyZ2UgaXQ/Cj4+IAo+PiBQ
ZXJoYXBzIGdvIHRocm91Z2ggZG1hLW1hcHBpbmcgdHJlZT8KPiAKPiBJcyBwYXRjaCBhIDYuMyBj
YW5kaWRhdGUgb3Igc2hvdWxkIGFsbCBvZiBpdCBnbyBpbnRvIDYuND8KClBsZWFzZSBsZWF2ZSBp
dCBmb3IgNi40LCBhcyBjb3JyZXNwb25kaW5nIE1JUFMgYXJjaCBwYXJ0IHdpbGwgYmUgYSBwYXJ0
IG9mIDYuNC4KClRoYW5rcwpKaWF4dW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
