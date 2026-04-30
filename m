Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F3FCD13DE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/sLRBfs0JyUaPnQJLrHRGm8RwiGZthm9FwsuC7gIoU=; b=uWzRJDpSr5W+1Z
	0FujICm1Sri923PeZMCIn0+dHb3PCUC2pzpWBc5dzByT8o8o41R25C4V1+oUMzM3rbmv840tGxrJr
	/wlZiggavauw3yBJfjuyuPKU5NebD6xZxFbezc6DsFrkzrpvGVKXDEefCuqXG8RI31U/s38KBvn+p
	KQU7msrUbqdaVvYuC73wuWk4LCejvBGDcQCAdSIjmoBQAPgcEkJ876waFNPifNNG8gVyWIBaV8mFP
	l0GSUdMlyucXHQfkcOBxTL6lexmI637P6gdikVTQfBZBcBXKpaRNKJuIPTLcRsYavxprrcDarFYRA
	dTNRZDrReHPFvRlUmhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIavG-000000067ai-2D2A;
	Thu, 30 Apr 2026 23:35:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIavD-000000067a9-0omC;
	Thu, 30 Apr 2026 23:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C51942B72;
	Thu, 30 Apr 2026 23:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA394C2BCB3;
	Thu, 30 Apr 2026 23:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777592154;
	bh=UOaPDNLQb+DWXRX86NYkdWJLMQr/Dt6uSVxCr2qRPOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZaefObiUhiS06GyO2ZPam7v+xKSz/xj6dDyzgiFyYF5vwMapPmxw1tjLpeku4NLqC
	 MNemy1d3JrJcOG0Jk6NNf+6YhMUlpqGil4LcSSlKqyMAfYs1D2uso3FiUdlp+smO/v
	 XDZtnFLVXIgjhIMQGDxFxXhJa93t5Z12b7KOm5uOpZaFN/3PlwFZQty9JQr//W2vqL
	 Vq054sIidcx3nsS2/NxotU3HYGyHQmcfz2fSk/UXIx19WufrApEtG037RRolFUxlTG
	 mayqczXLjYDszlo6fCq5NDr1S/jjjhfzeFH0Q2VuF9eMDultmmSXbQg3mPEEmemBHz
	 lDzLMIcnrmfEg==
Date: Thu, 30 Apr 2026 16:35:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: andrew+netdev@lunn.ch, devicetree@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 horms@kernel.org
Subject: Re: [PATCH net-next v7 2/4] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <20260430163551.7491407a@kernel.org>
In-Reply-To: <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
	<20260427072508.1151-1-lizhi2@eswincomputing.com>
	<20260428180625.738223cf@kernel.org>
	<2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_163555_257890_97933D46 
X-CRM114-Status: GOOD (  12.92  )
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

T24gVGh1LCAzMCBBcHIgMjAyNiAxNDo0Mzo1MCArMDgwMCAoR01UKzA4OjAwKSDmnY7lv5cgd3Jv
dGU6Cj4gPiBXaHkgRml4ZXM/IElmIGV0aDEgbmV2ZXIgd29ya2VkIHRoaXMgaXMgbm90IGEgZml4
IGJ1dCBuZXcgZnVuY3Rpb25hbGl0eQo+ID4gSWYgeW91IHdhbnQgdG8gbWFrZSB0aGlzIGEgZml4
IHRvIHByZXZlbnQgaW5jb21wYXRpYmlsaXR5IC0gY3V0IGl0IGRvd24KPiA+IGp1c3QgdG8gdGhl
IGV0aDAgY2hhbmdlcy4KPiA+ICAgCj4gVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KPiAK
PiBZb3UncmUgcmlnaHQgdGhhdCBldGgxIG5ldmVyIHdvcmtlZCBhdCBHaWdhYml0IHNwZWVkLCBz
byB0aGlzIHNob3VsZAo+IG5vdCBiZSB0cmVhdGVkIGFzIGEgZml4Lgo+IAo+IEluIHY4LCBJIHdp
bGwgc3BsaXQgdGhlIGNoYW5nZXMgaW50byB0d28gcGF0Y2hlcyB3aXRoaW4gdGhlIHNhbWUgc2Vy
aWVzOgo+IC0gUGF0Y2ggMSB3aWxsIGNvbnRhaW4gb25seSB0aGUgZml4ZXMgYWZmZWN0aW5nIHRo
ZSBleGlzdGluZyBldGgwCj4gZnVuY3Rpb25hbGl0eSwgYW5kIHdpbGwga2VlcCB0aGUgRml4ZXMg
dGFnLgo+IC0gUGF0Y2ggMiB3aWxsIGFkZCB0aGUgZXRoMSBzdXBwb3J0IChSWCBjbG9jayBpbnZl
cnNpb24gd29ya2Fyb3VuZCkKPiBhcyBuZXcgZnVuY3Rpb25hbGl0eSwgd2l0aG91dCBhIEZpeGVz
IHRhZy4KPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkIHByZWZlciBhIGRpZmZl
cmVudCBzcGxpdCBvciBvcmRlcmluZy4KCklmIHlvdSB3YW50IHRvIGNvbnNpZGVyIHNvbWUgcGFy
dCBvZiB0aGlzIGNvbW1pdCBhIGZpeCBpdCBoYXMgdG8gYmUKcG9zdGVkIHNlcGFyYXRlbHkgdG8g
dGhlIG5ldCB0cmVlIChyYXRoZXIgdGhhbiBuZXQtbmV4dCkuCk9uY2UgaXQncyBtZXJnZWQgYW5k
IG1ha2VzIGl0IHdheSBvdmVyIHRvIHRoZSBuZXQtbmV4dCB0cmVlIChlYWNoClRodXJzZGF5KSB5
b3UgY2FuIHBvc3QgdGhlIG5ldC1uZXh0IGNobmFnZXMgZm9yIGV0aDEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
