Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C4C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gp/1IKkO/zWgxXa5sj0ZA1ANaORJFnrepKVVHIpxXeA=; b=2NZHuXydedFWhP
	yzCt+W2veZfpukAVwMige2P9IGPXs+OuXUE/kjrHaVwNtecJBpJ5aUcTZ+7V/kEfDDzbkCOswAUyz
	/VsksVaHcww7QrXjqTHcqcoohjJELd3CBAz8tLFGnmWU9nfeU2mAX5W27s/2jLkPhWVuvsbxEtaTz
	2fFa8zuxUcCzKd1zGav5JRPX/9SGlUCBsmZf2E2IfuuTZvi5RwC09j/yDl3v/yZPKj3O3tkofeZ5Z
	d298mIzgt7apRXxRlCAJhruPZhFnU7vmhmUGB7J03yb+A5KK86SOuthfg2VLlFYrE1ZiEkZgNRZEf
	jZgu8IQkvqoxJCwJPhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrT5-00Cw5W-2r; Wed, 22 Feb 2023 15:55:43 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrT1-00Cw44-Uy
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:55:41 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BF0335C01A5;
	Wed, 22 Feb 2023 10:55:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Feb 2023 10:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677081334; x=
	1677167734; bh=w67oEu2E19AZfAjVi0U6OotIuBhYGM6gAf2Nt5qYYBU=; b=B
	w3Y7oWb6zR5Hy1tIOLHDPZwtv+tzKifOSl2K7jIA6SWWH8GNw7a6SDHmwQLrdBuQ
	e/noD0F4HdYwQvk5Vk2pS/iJWAMAKVQa3omEz+Qo6kDa2hyWa/VfVyxWkDy+23zF
	89Ytetx5+OInv03VdiNvB81vUum98r3Ig7KwaE7yfUieFQF5RMKaTvBgN+sq5idY
	v+32DQZMj4Z4EHdoyn5qmxTYIBlHwkCsUBE0ZKb6B1NA/YDktW4EKwsUp8hDspQI
	d0kszAiklI0yq+AfnnF322KyI4RXoH/r/PmB/MuuSVYRtaaGduYOHR/9vtQdVqf3
	CKGtfIpym8qMcgEubu6yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677081334; x=
	1677167734; bh=w67oEu2E19AZfAjVi0U6OotIuBhYGM6gAf2Nt5qYYBU=; b=g
	3z+0c2oLRO9m2vG7FYwPiirPv2tmDR4JTPz/L696D7dTzEHPcamN9tcD0242eWRn
	VcEiGX9OXUdrHQ0tHNu0kep7ry54Km8oG2cEcoAKc6TzWldLPUH5Isg+vdLgU8OE
	RdM6FDAIPu/ix24rWP0XaVZRBJOIRtnYmfxoLOdrNwFNwQHm9Llc9L9UZ14gTQ5L
	KXE5n9YVunWkQgm0SDDcJ7Srz8D3EuXWYqtyCS4szzw+DC/Kdo56ne1AsHgZ1JAC
	FvrjFVurYPQSBFUwyW9Z+9SwscA1PX9ApgNZpaY47Gc6DqoE6NuZ+CeFd+1dI33c
	ZZpDuQXFMfP0CBsKY4k8g==
X-ME-Sender: <xms:9Tr2Y84p9rx2_U9mTVCy2jC7J-xXkMqdYPoMPhb1i5XBdeAVv75Dzw>
    <xme:9Tr2Y978PBRzrhsd43EZEzXxVfQjYqcFv30n8xp_v0iu2SW6drrlLFdp_2BAd7ZVV
    caXa4xjJ_RUXy3N1rc>
X-ME-Received: <xmr:9Tr2Y7d2LwF0HO9JahyvBZIIxVsyiyfWMKUvYHg60ZAzD3vDry8p9ORwgImmGOUh38Us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:9Tr2YxJidY20RX6wrJ4ef8Tvw837BX92FROYlm7Yp8d__tzfADpb6A>
    <xmx:9Tr2YwKy8vGbMO44sGnG5YM9rl5jTcLkWR2LVo2gOxPhSrXbL3sbpQ>
    <xmx:9Tr2YywzAmdQFIOq81iYwotob1yANO2k334rmGd-und2_KtuASxoSA>
    <xmx:9jr2Y-xoexrMS1sbQ9FyOyXs-6P7Zk_BSjXjqG6_s0lk4FJzeOuN5g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 10:55:31 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <Y/YrvDBJcYUQt4WC@spud>
Date: Wed, 22 Feb 2023 15:55:19 +0000
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 m.szyprowski@samsung.com,
 robin.murphy@arm.com,
 linux-riscv@lists.infradead.org
Message-Id: <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com> <Y/YrvDBJcYUQt4WC@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_075540_216311_EF82805A 
X-CRM114-Status: GOOD (  15.10  )
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

Cgo+IDIwMjPlubQy5pyIMjLml6UgMTQ6NTDvvIxDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+IOWGmemBk++8mgo+IAo+IE9uIFdlZCwgRmViIDIyLCAyMDIzIGF0IDAxOjM3OjExUE0gKzAw
MDAsIEppYXh1biBZYW5nIHdyb3RlOgo+PiBGb3IgcmlzY3Ygb3VyIGFzc3VtcHRpb24gaXMgdW5s
ZXNzIGEgZGV2aWNlIHN0YXRlcyBpdCBpcyBub24tY29oZXJlbnQsCj4+IHdlIHRha2UgaXQgdG8g
YmUgRE1BIGNvaGVyZW50Lgo+PiAKPj4gRm9yIGRldmljZXRyZWUgcHJvYmVkIGRldmljZXMgdGhh
dCBoYXZlIGJlZW4gdHJ1ZSBzaW5jZSB2ZXJ5IGJlZ2luaW5nCj4+IHdpdGggT0ZfRE1BX0RFRkFV
TFRfQ09IRVJFTlQgc2VsZWN0ZWQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8
amlheHVuLnlhbmdAZmx5Z29hdC5jb20+Cj4+IC0tLQo+PiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1
cC5jIHwgMyArKysKPj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jCj4+IGluZGV4IDM3NmQyODI3ZTczNi4uMzRiMzcxMTgwOTc2IDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMKPj4gQEAgLTMwMCw2ICszMDAsOSBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIg
KipjbWRsaW5lX3ApCj4+IHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUoKTsKPj4gcmlzY3ZfZmls
bF9od2NhcCgpOwo+PiBhcHBseV9ib290X2FsdGVybmF0aXZlcygpOwo+PiArI2lmZGVmIENPTkZJ
R19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPj4gKyBkbWFfZGVmYXVsdF9jb2hlcmVudCA9IHRydWU7
Cj4+ICsjZW5kaWYKPiAKPiBEbyB3ZSByZWFsbHkgbmVlZCB0byBhZGQgaWZkZWZmZXJ5IGZvciB0
aGlzIGhlcmU/Cj4gSXQncyBhbHdheXMgY29oZXJlbnQgYnkgZGVmYXVsdCwgc28gd2h5IGRvIHdl
IG5lZWQgdG8gc2F5IHNldCBpdCBpbgo+IHNldHVwX2FyY2goKSB3aGVuIHdlIGtub3cgdGhhdCwg
cmVnYXJkbGVzcyBvZiBvcHRpb25zLCBpdCBpcyB0cnVlPwoKQmVjYXVzZSB0aGlzIHN5bWJvbCBp
cyBvbmx5IGEgdmFyaWFibGUgd2hlbjoKCmRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1NZTkNfRE1B
X0ZPUl9ERVZJQ0UpIHx8IFwKZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQ
VSkgfHwgXApkZWZpbmVkKENPTkZJR19BUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVX0FMTCkKCldo
aWNoIGlzIG9ubHkgdHJ1ZSBpZiAgQ09ORklHX1JJU0NWX0RNQV9OT05DT0hFUkVOVCBpcyBzZWxl
Y3RlZC4KCk90aGVyd2lzZSB0aGlzIHN5bWJvbCBpcyBkZWZpbmVkIHRvIHRydWUgYW5kIHdlIGNh
buKAmXQgbWFrZSBhIGFzc2lnbm1lbnQgdG8gaXQuCgpUaGFua3MKLSBKaWF4dW4KCgo+IAo+IENo
ZWVycywKPiBDb25vci4KPiAKPj4gaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aSUNC
T00pICYmCj4+ICAgICByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaSUNCT00p
KQo+PiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKTsKPj4gLS0gCj4+IDIuMzcuMSAoQXBw
bGUgR2l0LTEzNy4xKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
