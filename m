Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA56C6FA9D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR1wflg+5NGnEMgYWC8ygaFFMXkcDsqao9UChjdqaPo=; b=LYlzKNtr1n/T3Q
	7Vlq9GCFXorHx7aXKjfY3fAclB9IX57iSLdtNe9CfTXSlgg4CDIukYa64J8ZF4bDRYV7MCkTVV4g+
	GZHzKH7/Ouu3Iv6lZxyA+ZJXO5GShEM9lNnfL02cU+NE1rSM6/mXinP6o9PNEVl6OC4inBLkLtZ+/
	fwsJR2nApvfmW55yvEISuAZN9h3/1A0oJlsftPFnTMLu/1aURxqEy4drmfAjxnFA2w1ZA335tfRx5
	8UqI2Tx5gZj5q5XwtWkPjHsKC7q2AuQ4sTM7NCyrsKB+WzQ/QsssK1i44qbLqGPAdHYNIeRQGm6Rg
	ygrIPEKca05k4PjCJ0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXNHq-00GQmo-IJ; Wed, 01 Mar 2023 14:18:30 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXNHo-00GQlR-BJ
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 14:18:29 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 875B45C0163;
	Wed,  1 Mar 2023 09:18:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Mar 2023 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677680305; x=
	1677766705; bh=IU/BrE3ixZGyLbVgFOOh2R6wZHPN5yx1P6eJFhscw+U=; b=A
	yJkYHBaTE99CfV0zEVGrqCLHzthiENTPQupgFPss0vM4CUrpWrkivXAApij0gYsT
	+xPD3Rpc/++PsYBQvrW9hn/hGp5z1kJoDTKu8esHfTpzxYVj9sjk/5h3FzsALxOv
	+quyZGu6DFBwv/POff8XjUz23+OiS94YV8ZMnxMa30GHbjgA0qdpfeDWzdFegUTF
	JjgiC69It8pIoz8XTrMim7wSiJQMJF1b4cUGUEECraqzCDqEeaP20zLliPVFQSXu
	TFPADhCVuhmaN0vJCDGwg+YI7rNie7XSDZJJWMWzxl32RfaTabum+2CLoI+WuKF2
	vmkG+p5H/Nx0Wcq/maTew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677680305; x=
	1677766705; bh=IU/BrE3ixZGyLbVgFOOh2R6wZHPN5yx1P6eJFhscw+U=; b=O
	2DMRQr+RXddOPya6ZL9/CwAlS0f67jYqs3r1/Tlci3ZUhBGuFRNTySolg0fc7Thx
	Qwacb6833WSWgprw759VX997Y1jW+3qR/bkZkoKW2rIWeamlDTJeiURTx2UoPtON
	37KjaIaMAuuf+VuEQlHeQ1/zcmzg/xbOlgtcyA1S2Prbx6J+UQJM25m5oczStOf/
	DSdt8RYBPeIGDB9mZQShW0pkEPhqjglEsNSLbjsPcIa1rQSzYHphHvExC+MV1uel
	Gl7rmQYC6i2Q33m6SdZ8SQbk9LXGoK4Cda7mixuoDB6nOELcKMRoGgJ56iG6GTQT
	WCXy1cmw5jPXa4B4W3r9g==
X-ME-Sender: <xms:r17_Y-tUFo2LL8eR0fi-GokoMXitP2n_JUf-XIy5nnStsSe6FJRj2g>
    <xme:r17_YzdmZ32m1yaGJBQRp-URupP-6PBTv_L6UVtboHOI4DESaWNr17PvtrpLA_r8d
    Yf3Wwzo8la7sbRUHjs>
X-ME-Received: <xmr:r17_Y5xH8C7zLFMosNSu7Rk8dva1PbIKD44Fj8-pO12vIfF3EwUQ2C7l9wT2zjo29ZAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:r17_Y5MRWG36jqqYcsG4mbJe5qRD3FWZkO-uj5TIkFXI7jBOennvjw>
    <xmx:r17_Y-9REZjCJ_ziFlN4x3EGZMLQymJqqL1O5OR4K6IL99QYuA_3vA>
    <xmx:r17_YxU5N5rhCyqTaH1Kivq2jpad5SoUB9zVRzgaSZZg74d7WWBPiA>
    <xmx:sV7_Y_09vA_UNMGlZu7NoezTW3ovu03S-v6NaeYyYQxNqODnkQ-mww>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 09:18:22 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 5/5] of: address: Always use dma_default_coherent for
 default coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230301130613.GC467@lst.de>
Date: Wed, 1 Mar 2023 14:18:10 +0000
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com,
 robin.murphy@arm.com,
 linux-riscv@lists.infradead.org
Message-Id: <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-6-jiaxun.yang@flygoat.com>
 <20230301130613.GC467@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_061828_594760_F214DD72 
X-CRM114-Status: UNSURE (   9.34  )
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

Cgo+IDIwMjPlubQz5pyIMeaXpSAxMzowNu+8jENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PiDlhpnpgZPvvJoKPiAKPj4gLSBzZWxlY3QgT0ZfRE1BX0RFRkFVTFRfQ09IRVJFTlQgaWYgIU5P
VF9DT0hFUkVOVF9DQUNIRQo+IAo+IERvZXNuJ3QgcG93ZXJwYyBuZWVkIHRvIHNlbGVjdCBDT05G
SUdfQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVCBub3csCj4gb3IgZXZlbiBiZXR0ZXIgc2hvdWxk
IGJlIGRvaW5nIHRoYXQgaW4gdGhlIHBhdGNoIGFkZGluZyB0aGF0Cj4gc3ltYm9sPwoKSWYgSSBy
ZWFkIHRoZSBjb2RlIGNvcnJlY3RseSBmb3IgcG93ZXJwYyBPRl9ETUFfREVGQVVMVF9DT0hFUkVO
VCBpcyBvbmx5IHNlbGVjdGVkCndpdGggIU5PVF9DT0hFUkVOVF9DQUNIRSwgd2hpY2ggbWVhbnMg
bm9uLWNvaGVyZW50IGRtYSBzdXBwb3J0IGlzIGRpc2FibGVk4oCmLgoKPiAKPiBJbiBmYWN0IEkg
d29uZGVyIGlmIGFkZGluZyBDT05GSUdfQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVCBhbmQgcmVt
b3ZpbmcKPiBPRl9ETUFfREVGQVVMVF9DT0hFUkVOVCBzaG91bGQgYmUgb25lIHBhdGNoLCBhcyB0
aGF0IHNlZW1zIHRvIGJyaW5nCj4gb3ZlciB0aGUgaW50ZW50IGEgbGl0dGxlIGJldHRlciBJJ2Qg
c2F5LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
