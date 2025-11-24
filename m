Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1E0CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlq9WRbMekAVcfohb9GWvGVTIAP1D+EEaZNJHWdlASo=; b=4XHHenOs1BaFlm
	X1Z2+yEKt+iCiooI/jvbv0KMwWqdt05vIFwKeNX+lJBZIE6yI5xYQ4l68Rnv22TmjqyBcOlYNcn0m
	Uf3cxdrhx8Xxv3gOTOKTLAIyEzVXhciHdfGOnVyBSQ8vC/kAX5arF5TwRZnjdJXFYOJ2/JdXeGh2p
	2QOZ8uqcqqERn8yuwJguEokhSlIbSEdarF06gmN4Ai/+YTyCn/Pru3DPVOgE/WIuYJQhT5UhKhqJn
	7x/M0oBOc5ZPpZWSJDF/7n268MPus//WycX7yv8F/J0FRc70UotgrtvbhMA6PTn02+Zf/bj/wWI1I
	ZmGJZGCxomwowmVGtIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUNB-0000000BUlJ-06Of;
	Mon, 24 Nov 2025 11:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUN9-0000000BUl9-2cdo
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Nov 2025 11:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3cbMdsMrEtpzsehF8ze+0hLRetx0a/gTi/Q4jo1cyA=; b=ik3FuGcKSuOhGZCjPKXIYgKDGh
	gX/I8I4c4/44aqc4XDXdn8rBgXb/UiOeU9Nd/MQu6GJoxGmjayYyHpfP76lE6x1lIe4oXwGJP1SFS
	m6SgoyQkfyUSYjL3gURwzgmyBZB1E4Q09GCXvvhwZLkAGAwWJBc9GPwxNv0Ne4Uyk+ZMxXhFpss2m
	6wJAqe5kTDysjxbr97qZ1Z8s8WKN3KRr5jHYvgqqIoOrSfayHljevB54HXbPp8i4TyTN3QWaQodad
	IMYkkncPB81W2hJ0rVhDO1CgiPjoBXuooTkKvYysR3x8vmoSFZpPwON3usUJKPja8IE7txl1J0pxP
	kvAKN0fw==;
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTVU-00000003Tj2-3rQu
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 10:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982257; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dQ80TF4tnXqxyvQz39otZp1qJFKuYSQsWVGKlt4OQaRq0jhfKO4RFcSD8yYwl+hE8iWK7kebriRX6AN+f8jXhFqrDErLCnxkwJSAf18Tn0TGtpGrA1/cQyqfuRDqlihaYRZWcH3qWYgchRPbXLMbhZQhcnOlU5q8gtAQLHJBx74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982257; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D3cbMdsMrEtpzsehF8ze+0hLRetx0a/gTi/Q4jo1cyA=; 
	b=QR23I/6yedKkXsnYfEAntLVmtHhSTmqmKvLUh+OrXQSYkAD5PIAH73bC4UMKU4o67eM+BsyZJZ0/Q/Stzfc49Vdr/7AX9FD0KttxJaPs1tccW2R+dk+XWxmXcNjG+SeKopz9kO7TsFLx+TELaD4+VbmANRPIzs2yA+573ZKpI9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982257;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=D3cbMdsMrEtpzsehF8ze+0hLRetx0a/gTi/Q4jo1cyA=;
	b=AzYCxT9vItXc5CVXKohJmJoK9lPWVDhV7Dc3/CSdHRDMA5AHrj9CgxmEjQ5x+AvB
	2aFH+oP3nW0kF031f2F+LQ+hUftlW0TvANSaXZ9AZupM4jS82B254zku8bssR+nqorG
	TGwdJDhAcqSNGe7wjko3GtcLCM4A2M+lSmiEBwK3xYGGDtXdyTvFfamvcemo0RzHJTt
	1DGsDNCfQIZzdHPwNnokGwbdGrX/YAXxq044iHKBwNTopRGHOroLRKbbPKO/IArHEqY
	H9rnOr3iHNMRAUn20NJiGaji9FkczjSI2UwiC40ILLgtYuQeVKS/vBEXEjyX3MJf6n1
	GvvjSXUX2w==
Received: by mx.zohomail.com with SMTPS id 1763982256270972.0326901834951;
	Mon, 24 Nov 2025 03:04:16 -0800 (PST)
Message-ID: <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 24 Nov 2025 19:04:07 +0800
In-Reply-To: <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <20251124105226.2860845-3-uwu@icenowy.me>
	 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100917_340496_0C02D0CB 
X-CRM114-Status: GOOD (  26.08  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTI6MDEgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAxMTo1MiwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IFZlcmlzaWxpY29uIGhhcyBhIHNlcmllcyBvZiBkaXNwbGF5IGNvbnRyb2xsZXJzIHByZWZp
eGVkIHdpdGggREMKPiA+IGFuZAo+ID4gd2l0aCBzZWxmLWlkZW50aWZpY2F0aW9uIGZhY2lsaXR5
IGxpa2UgdGhlaXIgR0Mgc2VyaWVzIEdQVXMuCj4gPiAKPiA+IEFkZCBhIGRldmljZSB0cmVlIGJp
bmRpbmcgZm9yIGl0Lgo+ID4gCj4gPiBEZXBlbmRzIG9uIHRoZSBzcGVjaWZpYyBEQyBtb2RlbCwg
aXQgY2FuIGhhdmUgZWl0aGVyIG9uZSBvciB0d28KPiA+IGRpc3BsYXkKPiA+IG91dHB1dHMsIGFu
ZCBlYWNoIGRpc3BsYXkgb3V0cHV0IGNvdWxkIGJlIHNldCB0byBEUEkgc2lnbmFsIG9yICJEUCIK
PiA+IHNpZ25hbCAod2hpY2ggc2VlbXMgdG8gYmUgc29tZSBwbGFpbiBwYXJhbGxlbCBidXMgdG8g
SERNSQo+ID4gY29udHJvbGxlcnMpLgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5n
eGluZ2RhQGlzY2FzLmFjLmNuPgo+IAo+IFdyb25nIERDTyBjaGFpbiBvcmRlci4gWW91IHNlbmQg
aXQgYXMgaWNlbm93eS5tZSwgc28gdGhpcyBtdXN0IGJlCj4gbGFzdAo+IFNvQi4gVGhpcyBpZGVu
dGl0eSBpcyB0aGUgbGFzdCBvbmUgY2VydGlmeWluZyBEQ08uIFBsZWFzZSBraW5kbHkgcmVhZAo+
IHN1Ym1pdHRpbmcgcGF0Y2hlcywgc28geW91IGtub3cgd2hhdCB5b3UgYXJlIGNlcnRpZnlpbmcg
aGVyZS4KCldlbGwgSSBtYXBwZWQgdGhlIEBpc2Nhcy5hYy5jbiBtYWlsIHRvIHRoZSBAaWNlbm93
eS5tZSBvbmUgaW4gdGhlIGxhc3QKcGF0Y2guCgpPciBtYXliZSBJIHNob3VsZCBtYWtlIGl0IHRo
ZSBmaXJzdCBwYXRjaD8KCj4gCj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIEFkZGVk
IFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZywgYW5kIGFybSB0aGUgYmluZGluZyB3aXRo
Cj4gPiBjbG9jayAvCj4gPiDCoCBwb3J0IGNoZWNraW5nIGZvciB0aGUgc3BlY2lmaWMgU29DICh3
aXRoIGEgMi1vdXRwdXQgREMpLgo+ID4gCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBGaXhlZCBt
aXNzcGVsdCAidmVyc2lsaWNvbiIgaW4gdGl0bGUuCj4gPiAtIE1vdmVkIG1pbkl0ZW1zIGluIGNs
b2NrIHByb3BlcnRpZXMgdG8gYmUgZWFybGllciB0aGFuIGl0ZW1zLgo+ID4gLSBSZS1hbGlnbmVk
IG11bHRpLWxpbmUgY2xvY2tzIGFuZCByZXNldHMgaW4gZXhhbXBsZS4KPiA+IAo+ID4gwqAuLi4v
YmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1swqDCoMKgwqDCoCB8IDE0Ngo+ID4g
KysrKysrKysrKysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygr
KQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwKPiA+IAo+ID4gZGlmZiAtLWdpdAo+
ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNv
bixkYy55YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3ZlcmlzaWxpY29uLGRjLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAwLi41MjJhNTQ0NDk4YmVhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55
YW1sCj4gPiBAQCAtMCwwICsxLDE0NiBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMu
eWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogVmVyaXNpbGljb24gREMtc2VyaWVzIGRpc3BsYXkg
Y29udHJvbGxlcnMKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICvCoCAtIEljZW5vd3kgWmhl
bmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArwqAgJG5vZGVu
YW1lOgo+ID4gK8KgwqDCoCBwYXR0ZXJuOiAiXmRpc3BsYXlAWzAtOWEtZl0rJCIKPiA+ICsKPiA+
ICvCoCBjb21wYXRpYmxlOgo+ID4gK8KgwqDCoCBpdGVtczoKPiA+ICvCoMKgwqDCoMKgIC0gZW51
bToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSB0aGVhZCx0aDE1MjAtZGM4MjAwCj4gPiArwqDC
oMKgwqDCoCAtIGNvbnN0OiB2ZXJpc2lsaWNvbixkYwo+IAo+IEkgZG8gbm90IHNlZSBhbnkgZXhw
bGFuYXRpb24gb2YgZXhjZXB0aW9uIGZvciBnZW5lcmljIGNvbXBhdGlibGVzLAo+IG1heWJlCj4g
ZXhjZXB0ICJzZWxmLWlkZW50aWZpY2F0aW9uIiByZW1hcmsuIFJvYiBhbHJlYWR5IHBvaW50ZWQg
dGhpcyBvdXQsIHNvCj4gYmUKPiBleHBsaWNpdCBpbiBjb21taXQgbXNnIHdoeSB5b3UgYXJlIHVz
aW5nIGEgZ2VuZXJpYyBjb21wYXRpYmxlLgo+IAo+ID4gKwo+ID4gK8KgIHJlZzoKPiA+ICvCoMKg
wqAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICvCoCBpbnRlcnJ1cHRzOgo+ID4gK8KgwqDCoCBtYXhJ
dGVtczogMQo+ID4gKwo+ID4gK8KgIGNsb2NrczoKPiA+ICvCoMKgwqAgbWluSXRlbXM6IDQKPiAK
PiBUaGlzIGlzIG5vdCBmbGV4aWJsZS4gRGV2aWNlIGVpdGhlciBoYXMgb3IgaGFzIG5vdCB0aGVz
ZSBjbG9ja3MuCj4gCj4gPiArwqDCoMKgIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlw
dGlvbjogREMgQ29yZSBjbG9jawo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogRE1BIEFY
SSBidXMgY2xvY2sKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IENvbmZpZ3VyYXRpb24g
QUhCIGJ1cyBjbG9jawo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUGl4ZWwgY2xvY2sg
b2Ygb3V0cHV0IDAKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IFBpeGVsIGNsb2NrIG9m
IG91dHB1dCAxCj4gPiArCj4gCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
