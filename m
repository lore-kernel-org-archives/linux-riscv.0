Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F3C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5d/ZMkBAJv5So98olc7v6v8a/LiSpAL+cKOMTts1FD4=; b=nI+KQJBpb5i+rP
	QSv9velKKd5RIZH+uje7RLzYXgpTw5AnZ78kM7aHd8HnKNNtzH2km7uhelFK3UKVhARTUzVW7pfPt
	x78khfp/RVR55/kqbDJ/7ELKgIr2eeF34FX3td/Fa6EAfQH/b3/jn+pO4G9SZD4xoFwL6vM3VJnh0
	fm9Oao7u76ZT2qRONETySldAxz7dcaUbsFKykbJLTM6wDe9WN6zwb7/q+6SsuEdzH4R8WF6i1aHtL
	cNPoXpHVQ/rF0kosQQajEeGdmTxJ78zoJWZGs/dqC3B/vgiVqRZzVtKeN6sJS4mwxYPQH1kMaP7vW
	fHiXZgTkaJ7NBtWTlVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtNV-00DKDv-EM; Wed, 22 Feb 2023 17:58:05 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtNR-00DKCX-RO
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 17:58:03 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 774765C0179;
	Wed, 22 Feb 2023 12:57:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 22 Feb 2023 12:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677088678; x=
	1677175078; bh=nwLpEjWmPs3D70+3STrydy7bvzs4kmjkM2HWhBxwqA4=; b=j
	ikmgFtpuxcvGFE3qLG9zGDa67/AhicEIaxG3nROOylRG77UraKUHrKHE4w0DkqCN
	juLgoFbkmxEUvlgTPLkhRcIfocLwQ6rYblkMYvB767KjwC2R72bJ/mntoP7Mu06U
	01SVQ7azBcy8yh8Usc3r4O9rM+5y8iSk4FjpTjK9OUET8LAT2jgNVFhkVNd2bFpG
	WtAHzyW3z+GpKcPVxYEwL6fKI3djbcCtCB+1407xPzdsqdCqpqo4JjTvWKTYZovZ
	D/ynxL5ek8xImyl1sMZv1P4tydrJoM9BGbMP6AQ+90SlNhjqGx3nkxYVSvtRJaSX
	a09azk2gcGDSrgt4qacaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677088678; x=
	1677175078; bh=nwLpEjWmPs3D70+3STrydy7bvzs4kmjkM2HWhBxwqA4=; b=F
	1WqK9/ULyFs4gxOGhyvCmiJIQB3mGUP18D7cWzo1zWxHL1pWVzaBXJQBpP2/pYVw
	mmt2W9b6KHDtXmOC7SmwehKJO4vQKLiA8J33wetjZme0BDi6w8GTTFW6YnLp8jOv
	Z5bvi7H8rtZDtMsGxQurQZMQzpbD6ysgyuJgbt5nRJKkmAPByAlbi249wFnGjk1e
	st0tyo6nbYf5TAkZXd59fuvxuOUasD7yQJyMkPlI4wyvKnu/DLCt7VFJU1b15rmE
	yzi0lZA00myG3rVP44ujENo9lFlCJMLct6pPu3EgEU84xGSdrZRPIXeeA+xnCwVC
	WRD4q2Egwg2PXv4La+Ewg==
X-ME-Sender: <xms:pVf2Yzx8OrQqCZ0sOnDXREkTOheOAE0JcfVq1ZutGu1XPMZnuzSGWw>
    <xme:pVf2Y7Tpyh8Ajut76gG4bVgfgl2kyimD5FMoTAJchnC78gsU6Avt3cN9Gy62Vsu07
    vLH7onUHnxeqj30AGo>
X-ME-Received: <xmr:pVf2Y9WRrVgvM0qGmbtV2Tdkf6Z_FgWSLNhnBkLRdSo_LxZidN0vUJQ7fb9fGL4lF-3_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:pVf2Y9jhKx6uMWMcE7nOTDP86zbRG4nuGBKhwOTVk-hAypdTn0-d7A>
    <xmx:pVf2Y1D9-gQ2sodvvOhtRVec4qTLdZ-EYxDa1iDfW1muxI-TTh9E5w>
    <xmx:pVf2Y2JXGgWxYdnIBo1a9TApluAVvgnGtcOCiKd4dMOrAK0SEp3lZg>
    <xmx:plf2Y56DW5KT5B5mFPh4C-TOYY2smqCXhc4nxf8Om2SRBXv__88Xxg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 12:57:55 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 3/3] of: address: Use dma_default_coherent to determine
 default coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <e9d882f4-d57d-f6b4-7ae0-bbfea0f5aa59@arm.com>
Date: Wed, 22 Feb 2023 17:57:44 +0000
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
 linux-riscv@lists.infradead.org
Message-Id: <3E55E1F7-7A34-4165-9BF4-C2AAF6A6CFC1@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-4-jiaxun.yang@flygoat.com>
 <e9d882f4-d57d-f6b4-7ae0-bbfea0f5aa59@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_095802_328809_E7D47682 
X-CRM114-Status: GOOD (  11.56  )
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

Cgo+IDIwMjPlubQy5pyIMjLml6UgMTc6MjTvvIxSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBh
cm0uY29tPiDlhpnpgZPvvJoKClsuLi5dCgo+IAo+IEFGQUlDUywgYWxsIHlvdSBzaG91bGQgYWN0
dWFsbHkgbmVlZCBpcyBhIHNpbmdsZSBzZWxmLWNvbnRhaW5lZCBhZGRpdGlvbiBoZXJlLCBzb21l
dGhpbmcgbGlrZToKPiAKPiArIC8qCj4gKyAgKiBEVC1iYXNlZCBNSVBTIGRvZXNuJ3QgdXNlIE9G
X0RNQV9ERUZBVUxUX0NPSEVSRU5ULCBidXQKPiArICAqIG1pZ2h0IG92ZXJyaWRlIHRoZSBzeXN0
ZW0td2lkZSBkZWZhdWx0IGF0IHJ1bnRpbWUuCj4gKyAgKi8KPiArI2lmIGRlZmluZWQoQ09ORklH
X0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UpIHx8IFwKPiArIGRlZmluZWQoQ09ORklHX0FS
Q0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUpIHx8IFwKPiArIGRlZmluZWQoQ09ORklHX0FSQ0hfSEFT
X1NZTkNfRE1BX0ZPUl9DUFVfQUxMKQo+ICsgaXNfY29oZXJlbnQgPSBkbWFfZGVmYXVsdF9jb2hl
cmVudDsKPiArI2VuZGlmCgpUaGF0IG1ha2VzIG1vcmUgc2Vuc2UsIHRoYW5rcy4KSeKAmWxsIGFw
cGVuZCBDT05GSUdfTUlQUyBhcyBhIGNvbmRpdGlvbiBoZXJlIGFzIHdlbGwgYmVjYXVzZSBpdCBt
YXkgYnJlYWsgUklTQy1WIHdob3NlIGRtYV9kZWZhdWx0X2NvaGVyZW50CmlzIG5vdCBzZXQgdG8g
dHJ1ZSBmcm9tIHZlcnkgYmVnaW5uaW5nLgoKPiAKPj4gICAgIG5vZGUgPSBvZl9ub2RlX2dldChu
cCk7Cj4+ICAKPiAKPiBUaGVuICphZnRlciogdGhhdCdzIGZpeGVkLCB3ZSBjYW4gZG8gYSBtb3Jl
IGNvbXByZWhlbnNpdmUgcmVmYWN0b3JpbmcgdG8gbWVyZ2UgdGhlIHR3byBtZWNoYW5pc21zIHBy
b3Blcmx5LiBGV0lXIEkgdGhpbmsgSSdkIHByZWZlciBhbiBhcHByb2FjaCBjbG9zZXIgdG8gdGhl
IGZpcnN0IG9uZSwgd2hlcmUgY29uZmlnIG9wdGlvbnMgY29udHJvbCB0aGUgaW5pdGlhbCB2YWx1
ZSBvZiBkbWFfZGVmYXVsdF9jb2hlcmVudCByYXRoZXIgdGhhbiBhcmNoaXRlY3R1cmVzIGhhdmlu
ZyB0byBvdmVycmlkZSBpdCB1bmNvbmRpdGlvbmFsbHkgKGFuZCBUQkggSSdkIGFsc28gbGlrZSB0
byBoYXZlIGEgZ2VuZXJpYyBjb25maWcgc3ltYm9sIGZvciB3aGV0aGVyIGFuIGFyY2ggc3VwcG9y
dHMgcGVyLWRldmljZSBjb2hlcmVuY3kgb3Igbm90KS4KCk9rIEnigJlsbCB0cnkgdG8gcmV2ZXJ0
IHRvIHRoZSBpbml0aWFsIHdheS4KSXMgdGhlcmUgYW55IHJlYXNvbiB0aGF0IGFuIGFyY2ggY2Fu
4oCZdCBzdXBwb3J0IHBlci1kZXZpY2UgY29oZXJlbmN5PwoKVGhhbmtzCi0gSmlheHVuCgoKPiAK
PiBUaGFua3MsCj4gUm9iaW4uCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
