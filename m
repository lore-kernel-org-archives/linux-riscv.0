Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC99E9A03E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcEqG/wV9/XPwzbio2+ZHolkcP4TvqZtkPawIT55zNI=; b=4bUgNf89HC8sZK
	1NiqsMRU9WDAJcV80nkMsEBm8fbxMWZk+wFA7mRVvmNej3XQavSYrgNigPXSskpji2Cv6eAtG+A4s
	YrKafdY7npycLoKQ8Uvvk7Xz3Z8kTjJjINUsK8KIZ1R+mOQ4Q+VTbYE7cC3uEtQh8MyffTQo57zbG
	9J+eZFb2ZF9jTVHjVyK/0dW7sCk4aZ55gnc+LznZe74/epKSuYMujeCBqpNFytWW+Ms7SvbwzFhZ1
	VQfpN80rejm/967KXVjWmTJY9emIsOIZ7WO/Hs4uIm4N4q++cZ7TmYVwbx5L2n5vb0njHf8yF3FPi
	p8WSmO1AElufeEyjRSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdKQ-00000009V1R-1QFf;
	Wed, 18 Feb 2026 08:54:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdKM-00000009V11-3aDS
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 08:54:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKI-0007hc-GA; Wed, 18 Feb 2026 09:54:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKG-001NLe-0Q;
	Wed, 18 Feb 2026 09:54:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKH-000000001Hj-1f9a;
	Wed, 18 Feb 2026 09:54:29 +0100
Message-ID: <d5c50646f309f82009e2fcac0607d0a485ed1174.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley	
 <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, joel@jms.id.au, 	fustini@kernel.org,
 mpe@kernel.org, mpe@oss.tenstorrent.com, 	npiggin@oss.tenstorrent.com,
 agross@kernel.org, agross@oss.tenstorrent.com, 	bmasney@redhat.com
Date: Wed, 18 Feb 2026 09:54:29 +0100
In-Reply-To: <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
	 <20260216-atlantis-clocks-v6-2-cb46d6a59c73@oss.tenstorrent.com>
	 <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
	 <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_005434_915416_B0E15923 
X-CRM114-Status: GOOD (  14.10  )
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

T24gRGksIDIwMjYtMDItMTcgYXQgMTY6NDkgLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90
ZToKPiBIZWxvIFBoaWxpcHAsCj4gCj4gT24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgNTo1OeKAr0FN
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gCj4gPiBP
biBNbywgMjAyNi0wMi0xNiBhdCAxNjoxNiAtMDYwMCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3Rl
Ogo+ID4gPiBBZGRzIEF0bGFudGlzIFJlc2V0IENvbnRyb2xsZXIgZHJpdmVyLCB3aGljaCBzaGFy
ZXMgdGhlIHNhbWUgcmVnbWFwIGFzCj4gPiA+IHByY20gKCBjbG9jayBjb250cm9sbGVyKS4KPiA+
ID4gCj4gPiA+IFRoaXMgdmVyc2lvbiBvZiB0aGUgcmVzZXQgY29udHJvbGxlciBkcml2ZXIgY292
ZXJzIHJlc2V0cyBmcm9tIHRoZSBSQ1BVCj4gPiA+IHByY20uCj4gPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBBbmlydWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5j
b20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgo+ID4gCj4gPiBhbmQKPiA+IAo+ID4gQWNrZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gWW91IHNlZW0gdG8gaGF2ZSBhZGRlZCBhIFJiIGFu
ZCBhbiBBY2tlZC1CeS4gRGlkIHlvdSBpbnRlbmQgdG8gYWRkCj4gYm90aCBvciBqdXN0IGEgUmI/
CgpCb3RoLiBSLWIgZm9yIHRoZSBjb250ZW50LCBBLWIgZm9yIHRoZSBwYXRjaCBnb2luZyB0aHJv
dWdoIGFub3RoZXIgdHJlZQp0aGFuIHJlc2V0LgoKPiA+IHRvIGJlIG1lcmdlZCB2aWEgdGhlIGNs
b2NrIHRyZWUsIHNpbmNlIHRoaXMgZGVwZW5kcyBvbiBwYXRjaCAxLgo+IAo+IFdlIGhhdmUgYSB0
ZW5zdG9ycmVudCBzb2MgdHJlZSBub3cgYW5kIHdlcmUgdGhpbmtpbmcgb2YgdGFraW5nIHRoaXMK
PiBzZXJpZXMgZm9yIDcuMSB2aWEgdGhhdC4KCkknZCBiZSBmaW5lIHdpdGggdGhhdCBhcyB3ZWxs
LgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
