Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBA3CCD1BB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9LhBBeRYozm320YGk3k/G0nSRVWhtHGSogBoA3Hvs0=; b=W4xobqxHEPhk/aETRimewI8J9u
	CqpxJWBGNlNJrbc9Bw3EiJDG850HAzzvbEFmwHwuhZWQGPUXlPvRqAIoZh6VPxxCNnnVUYM5u0Ihf
	l+pBeAYrGyLdjSxTArcWAJC8eeyBk7NVMWaMwoLakOH9o08KaiR+5AIGBwChGRTsF/l8VyztocxnO
	bK+BHiw/VNQ0yYDSR7s4FaTqGy9OG9Qq/7etDnphsiIfjBkVL5yHhHNEymrhTeIGW9wkmQZ8oeVw0
	bw5BgkWnlYtKLH8gfHcY9orD9SUNvL9/UEl4syOSgGCRrOjIZXW8eOcFFEUFx/g+Afwu8n09iuYMb
	X50aiUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdyi-000000043eS-1cNH;
	Wed, 22 Oct 2025 18:54:32 +0000
Received: from fly.ash.relay.mailchannels.net ([23.83.222.61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdye-000000043e4-1kc1
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 18:54:30 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 22C32103691;
	Wed, 22 Oct 2025 18:54:24 +0000 (UTC)
Received: from fr-int-smtpout29.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.121.87.108])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3BB36103494;
	Wed, 22 Oct 2025 18:54:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761159259; a=rsa-sha256;
	cv=none;
	b=GzFl2yaxjy9MxWzicd19ci4u+1NnGnrWZ5bdTBkLc7P1t8GbI8p2zvZGVitccDrJqBFywv
	Mw3Is2+VlbgAteAFLkbr5H9vkZSKgrNpZl1ucfPyXtadjmswlGeNBQPBQXA05w/OSA3LXW
	4veF0E4IJuEBZIobQ+3Y792nGV0ibAo/elt3+OZp/1IAnVx2xaDswkOjxNrXiKEGVHliZl
	VEYOYVxbj86JluPF8EWU3Evt9ftlnZYdKTlvvhUuEdK1QIQVPdyklXoF+QbTsdCk2tF9rQ
	hMuYKCRWhsy9roofZZXwRoQP6CekXjk1cStuf0RTmBLc9ooggfOFFp5RdkscmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761159259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=run8585B0ZdBJhpgD2/vSbhEQ6c1X3Id7wa2MwUm3kE=;
	b=b1+7zaYu3wDmoDQaR7MHCUnlyAjMxt03TAP/OvHlbQU/JjSApRkHuppArRAECjbzdgkusQ
	yRoTkoZhBHBaPs5Pn8z4UfVy+6pk1LMquK/OOfQypHWEb9sEcJ146lcmnnQMgp1U6vpk6g
	Y7+V/ZKQ3RiFBuPywHQWp7SBnYVddz1d8tm5Ce8SaYDurMJhSq1/r1gAIn+Y9BMJpvnO1h
	4e//afvga0p7sWECtgG66H6xDPBKhJORTfdml5utjx/QyuMSF3hwV/Hb7bpgpnmr6DU2TY
	x7IUzMHgfgjsJrA3MaRauhTOKMikW9+78H9iPUKLMJVBrfbQ/Lejza06DJC3xA==
ARC-Authentication-Results: i=1;
	rspamd-5b5956c7c7-6m7zr;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abortive-Stretch: 28872bb229118efc_1761159263913_3055418994
X-MC-Loop-Signature: 1761159263913:2795527620
X-MC-Ingress-Time: 1761159263913
Received: from fr-int-smtpout29.hostinger.io (fr-int-smtpout29.hostinger.io
 [148.222.54.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.87.108 (trex/7.1.3);
	Wed, 22 Oct 2025 18:54:23 +0000
Received: from [IPV6:2001:861:4450:d360:df8b:aa61:9538:1b7a] (unknown [IPv6:2001:861:4450:d360:df8b:aa61:9538:1b7a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4csJHB226tz2xwK;
	Wed, 22 Oct 2025 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761159255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=run8585B0ZdBJhpgD2/vSbhEQ6c1X3Id7wa2MwUm3kE=;
	b=ARd1dIo662Hv62WYZUQuQersJEZeHBprRD1cAC8gfCOTHyjys/frF6pyzhxVUC4DshZNdt
	ByAAPEtJ8dR0mg0WxlWIFnMb2e1yn38NdVz1xou+LIQVnT0FF3K26t41bX4nMtKJEA756R
	XauhiSpr/cB3Xk7YAvCDhWaHNCD0i+Z0V9fVkvtVsKdYbRJ+XSbqr0JPfaKo4HNmT3vnG9
	aPDwu845z3N9tWgIvkvAhxocQZs4gWHmcxfM2dErDrpWzqcWU3WkGe79Q0kablI3N4QqgU
	W0K8aAciPuCv8M0jKzqzawBhgy+n/EuVFzzErBI7TgFWJuDu1JNaK1huopPwAw==
Message-ID: <da4748ed-01f9-48a6-9939-320e83aa9eb0@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: Vivian Wang <wangruikang@iscas.ac.cn>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
 <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Date: Wed, 22 Oct 2025 18:54:13 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=fpGOZ04f c=1 sm=1 tr=0 ts=68f92857 a=XzW6OEp4kASjoDH3AA+DzQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=lNCKr4LvwL6Du062nSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hc5yV98H2ep6aNAGOANv:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfLWRuLxrpFpBnj8c4GNDeyMskPRz/xu/oVbY1JLfaK1xSywhsC8umc/oLYGQMH0J+8A/28MVYcgsBx3vvfK64zxyuWWPQMZvWFQg1jBIeGmUuRWhIwS+ EC6qYBi4HlrcQZOzqxL0odTvXwHDxkRy2BPl6GIOiTcrpuvurek6t93KjadTmvwELinbNBCOAShyHN2q7q8EdB1DdeetuUbNu/F9A+wOn8W+Yr2e/z5pKhGx KkPioBBD5zas8PjSXAs+14V0UZqMmUJN52dAUWxHVj0AT3o4ZzEs3n5GF6QZO7jzP313qoDRw809dzAacZr9ZC0loJa5a9guirpAr4PSMWX1pvXLGTuZ5DdO +93ZnVrXnQUxNLALBoi/4ga/nUhq3MOnTL+uoULvYIqd5pbhDyrSibZWlDTMwhohmWgWxZLxtEJR8ROy96afT5r0st1K8fMGlpzT6RgCXtpUm1yKXzF/71sA 2f0rvvWZRRIns3SUdZIeEGredTS2j7J9yQ4pPJzfI0+G8zrtGV6WpjWax5UN+UsUc5XH6wDtMjhhpQ8fajLsI0NdIV/4CBTIAYQAE3iJ34r9J7IJGIvnvgVI aKFqAtNpS9Z2+XkxnOrg14PMQ/p9+BRRkr2bQ/tGOgvX6pIGUOaFw7GxHJ7QgtoRu4PlwV4FGvqAaX+odw5GhT5dVRbHYAy8hY3QV+fewRuPOvmv7BYR96xG /vmYjyY5wdy1/Ce7fuwBO+zO5+uFEVwlCHcZUvFjcmEs6RYCNs2fxw==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_115429_100340_9609FEE7 
X-CRM114-Status: GOOD (  17.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVml2aWFuCgpUaGFua3MgZm9yIHRoZSBndWlkYW5jZSBhbmQgaGVscCEKCk9uIDEwLzIwLzI1
IDExOjA3LCBWaXZpYW4gV2FuZyB3cm90ZToKPiBIaSBNaWNoYWVsLAo+Cj4gVGhhbmsgeW91LiBJ
IGhhZCBtZWFudCB0byBkbyB0aGlzIGFmdGVyIHY2LjE4LXJjMSAod2hpY2ggaXMgbm93KSwgYnV0
IEkKPiBkaWRuJ3QgaGF2ZSB0aGlzIGhhcmR3YXJlIHRvIHRlc3QuCkhhcHB5IHRvIGhlbHAgdGVz
dGluZywgaWYgeW91IGhhdmUgY29kZSB0byBzaGFyZSA6KQo+Cj4gT24gMTAvMTcvMjUgMTg6MDIs
IG1pY2hhZWwub3BkZW5hY2tlckByb290Y29tbWl0LmNvbSB3cm90ZToKPj4gRnJvbTogTWljaGFl
bCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+Cj4+Cj4+IEFs
aWduaW5nIHdpdGggazEtYmFuYW5hcGktZjMuZHRzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPgo+PiAtLS0K
Pj4gICAuLi4vYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyAgICAgfCA1MCAr
KysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3Jhbmdl
cGktcnYyLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYy
LmR0cwo+PiBpbmRleCAzMzcyNDBlYmI3YjcuLjJhNzVjYTkzYjQ5OSAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4+ICsrKyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwo+PiBAQCAt
MzMsNiArMzMsNTYgQEAgbGVkMSB7Cj4+ICAgCX07Cj4+ICAgfTsKPj4gICAKPj4gKyZldGgwIHsK
PiBQbGVhc2UgYWRkIGV0aDAgYW5kIGV0aDEgdG8gL2FsaWFzZXMgc28gdGhhdCBVLUJvb3QsIHVk
ZXYsIC4uLiBjYW4KPiByZWNvZ25pemUgdGhlbS4gVGhpcyBpcyB1c2VkIGJ5IFUtQm9vdCB0byBz
ZXQgdGhlIG1hYy1hZGRyZXNzIHRvIHRoZQo+IHNhbWUgdmFsdWUgdXNlZCBpbiBib290aW5nLCBh
bmQgYnkgKHN5c3RlbWQpIHVkZXYgdG8gc2V0IHRoZSBpbnRlcmZhY2UgbmFtZS4KRG9uZS4gSSds
bCBzdWJtaXQgYSBWMiBzb29uLgo+Cj4+ICsJcGh5LWhhbmRsZSA9IDwmcmdtaWkwPjsKPj4gKwlw
aHktbW9kZSA9ICJyZ21paS1pZCI7Cj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4g
KwlwaW5jdHJsLTAgPSA8JmdtYWMwX2NmZz47Cj4+ICsJcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8
MD47Cj4+ICsJdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MD47Cj4gVGhlIGhhcmR3YXJlIGRlc2ln
biBvZiBPUEktUlYyIGlzIG5vdCB0aGUgc2FtZSBhcyBCUEktRjMsIHNvIHRoZQo+IHBhcmFtZXRl
cnMgaGVyZSBkZXNlcnZlcyBzb21lIHNjcnVpdGlueS4gU2FtZSBmb3IgZXRoMSBiZWxvdy4KPgo+
IEkgd291bGQgYXBwcmVjaWF0ZSBhdCBsZWFzdCBpcGVyZiBUQ1AgdGVzdHMgaW4gYm90aCBkaXJl
Y3Rpb25zIG9uIGJvdGgKPiBldGhlcm5ldCBwb3J0cy4gVGhlIGV4cGVjdGVkIHNwZWVkIHNob3Vs
ZCBiZSBhdCBsZWFzdCA5NDAgTWJpdC9zZWMgLSBpZgo+IGl0J3MgbXVjaCBsb3dlciB0aGFuIHRo
YXQgc29tZXRoaW5nIGlzIHdyb25nLgoKCkZvcnR1bmF0ZWx5LCB0aGUgcmVzdWx0cyBhcmUgZ29v
ZC4gVGhleSBhcmUgZXZlbiBiZXR0ZXIgdGhhbiB0aGUgb25lcyAKZnJvbSB0aGUgdmVuZG9yIGtl
cm5lbCBpbiBPcmFuZ2VQaSBPU8Kg8J+Ygi4KSSdsbCBzaGFyZSB0aGUgcmVzdWx0cyBpbiBteSBW
MiBjb3ZlciBsZXR0ZXIuClRoYW5rcyBhZ2FpbgpNaWNoYWVsLgoKLS0gCk1pY2hhZWwgT3BkZW5h
Y2tlcgpSb290IENvbW1pdApZb2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcg
Y291cnNlIC0gTGVhcm4gYnkgZG9pbmc6Cmh0dHBzOi8vcm9vdGNvbW1pdC5jb20vdHJhaW5pbmcv
eW9jdG8vCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
