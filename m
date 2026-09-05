Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A8CC624D3
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+J5FM22QlX+dCcjPpn6FrVLU3XZ1ImmppPO3cqbStI=; b=v6dGy70LrsUkYy
	D1/1+VVLaCaWQp1ouoR9i+Hnn7pGj+GTSpkUeO9WR+kU/XxGYmGKYiRF/hMe31p+nzg3jZh6IrvRU
	7JexCUxoazbn0k8zYuRwHro1Uk7w9tkpoB50DTsmU6t6pZFVHrTI36kbap1Qa1cTRITcSBR5906nM
	TcmdgCqzgwEl1gSWLvYke1cb0NmU7TBYtkrR1FzJRVVaJpHcX349murUpjw6AyMRgDI934Y4vI4oK
	nBntLnx+0fEARH0LhdxU6jFMfrrUpYOtEyfDmmT0jh1Qi1KgGZtLJwqd3VV+iKidAqRVWbP2lrC9h
	DN9c65vOLlPGMSmglnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ujK-00000004J3X-2ok1;
	Sat, 05 Sep 2026 18:03:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ujI-00000004J3G-0u81;
	Sat, 05 Sep 2026 18:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DF84601DB;
	Sat,  5 Sep 2026 18:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AF01F00A3A;
	Sat,  5 Sep 2026 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788631382;
	bh=b4i1HvmYC+QCvkWjfP58W8bQ1OnikECCoFtWUyduYoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MNEexEVGh1RTnMaHT4+kKNk2D3jGJ2LiY1adZUzswWAxj/Lu3Dvmsx4rdCHWxTeIb
	 zuj+DcHdYm9lOmbshmvWY8wukdE7NX4amMJKiPnCPU3fu0Xud6rXCByZQ/7P4Jpp1+
	 rpGCbRWRvvkHto/QMITNm7jl9x+SiWoazoyy1xEu3ttOO7CikqsuL7NA/NLR45A5SE
	 qX12DApvPD3hUQSXxojNo12Plf0eARi8xpKq7AVrgWSGV3mfvqT1UuE14VIGsSfE4J
	 +0M+jXixgPCrD+fbzxu7hi2TWdN8kHwVDi1shNJ3bAmyhz5ymAW+2oI6/1JyDByfR6
	 O79OuJAZSsB1Q==
Date: Sat, 5 Sep 2026 11:03:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <kurt@linutronix.de>, <hauke@hauke-m.de>, <chester.a.unal@arinc9.com>,
 <daniel@makrotopia.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <ansuelsmth@gmail.com>,
 <linusw@kernel.org>, <luizluca@gmail.com>, <alvin.sipraga@analog.com>,
 <clement.leger@bootlin.com>, <justin.chen@broadcom.com>, <dlan@kernel.org>,
 <rogerq@kernel.org>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <opendmb@gmail.com>,
 <andrei.botila@oss.nxp.com>, <wangruikang@iscas.ac.cn>,
 <amadeus@jmu.edu.cn>, <kees@kernel.org>, <tmshlvck@gmail.com>,
 <c-vankar@ti.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
 <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
 <v-singh1@ti.com>, <oss@vassilevski.com>, <haokexin@gmail.com>,
 <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 00/33] Remove comma after sentinel entries in
 match table
Message-ID: <20260905110300.2b4825d5@kernel.org>
In-Reply-To: <cc1f9d12-e853-4000-8236-9e7f5a9ed314@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	<20260904085811.7e2c2db6@kernel.org>
	<cc1f9d12-e853-4000-8236-9e7f5a9ed314@ti.com>
MIME-Version: 1.0
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

T24gU2F0LCA1IFNlcCAyMDI2IDExOjA5OjU0ICswNTMwIFNpZGRoYXJ0aCBWYWRhcGFsbGkgd3Jv
dGU6Cj4gPiBZb3UgZmFpbGVkIHRvIHNwZWNpZnkgd2h5IHRoaXMgImNsZWFudXAiIG1ha2VzIGEg
ZGlmZmVyZW5jZS4KPiA+IGhhdmUgeW91IGV2ZXIgc2VlbiB0aGUgc2VudGluZWwgbm90IGJlIHRo
ZSBsYXN0IGVudHJ5PyAgCj4gCj4gVGhlICdjbGVhbnVwJyBpbiBhIHdheSAnZ3VhcmFudGVlcycv
J2VuZm9yY2VzJyBzZW50aW5lbCBiZWluZyB0aGUgbGFzdCAKPiBlbnRyeSwgYnkgY2F0Y2hpbmcg
J2NvcHktcGFzdGUnIGVycm9ycyBhdCBjb21waWxlLXRpbWUgcmF0aGVyIHRoYW4gYmVpbmcgCj4g
YSBzaWxlbnQgYnVnIHRoYXQgc2hvd3MgdXAgYXQgcnVudGltZS4gSWYgYSBuZXcgZW50cnkgd2Vy
ZSB0byBiZSAKPiBhY2NpZGVudGFsbHkgYWRkZWQgYWZ0ZXIgdGhlIHNlbnRpbmVsIGVudHJ5IGlu
IHRoZSBjdXJyZW50IGRyaXZlcnMsIGl0IAo+IHdpbGwgbm90IGNhdXNlIGFueSBjb21waWxlLXRp
bWUgZXJyb3IsIGJ1dCB3aWxsIGZhaWwgc2lsZW50bHkgYXQgCj4gcnVudGltZS4gVGhpcyBzZXJp
ZXMgJ2NsZWFucyB1cCcgdGhlIGRyaXZlcnMgYnkgbWFraW5nIGl0IGEgY29tcGlsZS10aW1lIAo+
IGVycm9yIGdvaW5nIGZvcndhcmQgKGFkZGluZyBhIG5ldyBlbnRyeSBiZWxvdyBzZW50aW5lbCB3
aWxsIGNhdXNlIGEgCj4gYnVpbGQgZXJyb3Igd2l0aCB0aGUgY29tbWEgcmVtb3ZlZCBhZnRlciB0
aGUgc2VudGluZWwgZW50cnkpLiBJIGRvIG5vdCAKPiBkb3VidCB0aGUgcmV2aWV3IHByb2Nlc3Mg
b24gdGhlIG1haWxpbmcgbGlzdHMgd2hlcmUgc3VjaCBlcnJvcnMgd2lsbCAKPiBjZXJ0YWlubHkg
YmUgY2F1Z2h0LCBidXQgaXNuJ3QgaXQgYmV0dGVyIGlmIHRoZXkgYXJlIGNhdWdodCBhdCAKPiBi
dWlsZC10aW1lIGluc3RlYWQsIHRoZXJlYnkgc2F2aW5nIHJldmlld2VycyB0aGUgdHJvdWJsZSBv
ZiBwb2ludGluZyBvdXQgCj4gc3VjaCB0cml2aWFsIG1pc3Rha2VzPwoKSXMgaXQgcG9saXRlIHRv
IGFuc3dlciBhIHF1ZXN0aW9uIHdpdGggYSBxdWVzdGlvbj8g8J+nkO+4jwoKUGxlYXNlIGJlIG1p
bmRmdWwgb2YgbWFpbnRhaW5lcidzIHRpbWUgZ29pbmcgZm9yd2FyZC4KCj4gVHJhaWxpbmcgY29t
bWFzIGFyZSBhbiBpbmRpY2F0aW9uIG9mICdzY29wZS1mb3ItZXh0ZW5zaW9uJyBpbiB0aGUgCj4g
ZnV0dXJlLCB3aGljaCBob2xkcyB0cnVlIGZvciAnZW51bXMnIG9yIG90aGVyIHN0cnVjdHVyZXMg
d2hlcmUgbmV3ZXIgCj4gZW50aXJlcyBhcmUgYWRkZWQgdG93YXJkcyB0aGUgZW5kIHJhdGhlciB0
aGFuIGJlaW5nIGluc2VydGVkIGluIHRoZSAKPiBtaWRkbGUuIFNpbmNlIHRoYXQgaXNuJ3QgdGhl
IGNhc2UgaGVyZSwgdGhpcyBzZXJpZXMgbWFrZXMgaXQgY2xlYXIgYnkgCj4gcmVtb3ZpbmcgdGhl
IHRyYWlsaW5nIGNvbW1hLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
