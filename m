Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6951ACA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+lryeS2sKT1NyjFNH25b4Pqtcg6XmVCuylLE70qlxM=; b=igCqluf8bngDbH
	HwkPCD9HFXcfZZrI2/dTqXTA1PReAK8sdZiUX8BX2NPaGVBHtU3IlYfQ+GoCZWYjWJfwvoCtDy7/S
	Ye/+t3z/RGAjihY/61t5ibsqFZTd3g11HJ9xurs4N1VSEH+4gU2tsPNPZ1bsXYPb6+yTpULmwZ/82
	SokYdQwtoQCuuc6KCaNJRDoXjzDRf7tC7mnTCqlrcbZTts9WO5dPGb9neN48SoC+zhyv4G43nMS5S
	9/NZSh6/+T2B7ptzfper5e4pN2o9XH0wFStFUG8ypaPrVWuRhbLN+OKHFhu0rvQECuko2M3cErdio
	RVdcwii6UMPTDOHNxDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGC-00000002Y5o-42QJ;
	Fri, 15 Aug 2025 13:14:20 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umr87-000000027aG-2EwS
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 09:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755251602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=koHlOkAgBWsUbUj+b24o/ctUd2mqOBqSeG4hv5l5rm+kkMCxaBfgD8KyfJGwIblmsj8SbL5UP6lbO/cyGtSNFmvJYwfXiO5zcDsRP4GTvaJ3HPAkNqdpPadOuNDiioSPAnQrI0l8iPOmqfc3wqiuhgFNu43E0tBase2P0TwBilE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755251602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4R7tfCuYW4ZartBCW5YVMr9XfWVj465U64fgiTEkXis=; 
	b=ZiJTO94CyuhBtoV18GI/qII0uRZ5oGao6SZwUEzQQbC0mN4oapdpdlNxUQ2tNzD3w4JIu1wQtM0QnyM7CY8Qjv9b5rtXKF07FDb/8LIpZx3WjSfN3jXF4z4hJ0cADjAyM9kiVCKVdYfTFUYnwDNVwsJ7YYYaNUmwwpE0udlCI3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755251602;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=4R7tfCuYW4ZartBCW5YVMr9XfWVj465U64fgiTEkXis=;
	b=dGiTHQlJXwDfK3pjDKBjJBKsOC68jlD1/jjKV8gxOixvhk8FxYn2D1xZeR8o56xq
	DR9yBVRnAQkFWf+oFZ7eh7+qjNnfpXlly8RlnClnL3viSri4Hnd1HEiDhOjcu9K5rMO
	lWFbQwWEFWUAoPhmKzH8MCtMy+p40PtYnv31E6mI56V1oPaxsc37t0hRyDa9eqWSkpp
	IGzja9J56MTPWH2+Rbctn7WEC0ldB2Za/6Z6WPkNWmCiG8yUFhGci9u1y7zD9fQZimY
	2XbTcVLeSLL9NJkpCyc/bqQ+WKJajubKPav4XqNU0JV1+FmxHh6xhzN5UD6XRqDZIr6
	ovEjMhg0Pg==
Received: by mx.zohomail.com with SMTPS id 1755251600358465.4611508627105;
	Fri, 15 Aug 2025 02:53:20 -0700 (PDT)
Message-ID: <4655d43b17c732947246f0e0deac14265fa07ca1.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Fri, 15 Aug 2025 17:53:10 +0800
In-Reply-To: <5af90b60-d65b-4e80-9a27-44938bbd450b@kernel.org>
References: <20250814164048.2336043-1-uwu@icenowy.me>
	 <20250814164048.2336043-3-uwu@icenowy.me>
	 <20250814220444.GA3988176-robh@kernel.org>
	 <5af90b60-d65b-4e80-9a27-44938bbd450b@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_025347_628351_9347B8B3 
X-CRM114-Status: GOOD (  11.68  )
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

5ZyoIDIwMjUtMDgtMTXmmJ/mnJ/kupTnmoQgMTE6MDkgKzAyMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMTUvMDgvMjAyNSAwMDowNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4g
PiA+ICsKPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiArwqAgLSBJY2Vub3d5IFpoZW5nIDx1d3VA
aWNlbm93eS5tZT4KPiA+ID4gKwo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gK8KgICRub2RlbmFt
ZToKPiA+ID4gK8KgwqDCoCBwYXR0ZXJuOiAiXmRpc3BsYXlAWzAtOWEtZl0rJCIKPiA+ID4gKwo+
ID4gPiArwqAgY29tcGF0aWJsZToKPiA+ID4gK8KgwqDCoCBjb25zdDogdmVyaXNpbGljb24sZGMK
PiA+IAo+ID4gSWYgdGhlIGNsb2NrcyBvciByZXNldHMgdmFyaWVzIGJ5IHBsYXRmb3JtLCB0aGVu
IHlvdSBuZWVkIGFuIFNvQyAKPiA+IHNwZWNpZmljIGNvbXBhdGlibGUgc3RpbGwuIElmIHRoZXNl
IGNsb2Nrcy9yZXNldHMgYXJlIHN0cmFpZ2h0IGZyb20KPiA+IHRoZSAKPiA+IFJUTCBhbmQgYW55
IG90aGVyIG51bWJlciBvZiBjbG9ja3MvcmVzZXRzIGlzIHdyb25nLCB0aGVuIHdlIGNhbgo+ID4g
c3RpY2sgCj4gPiB3aXRoIGp1c3QgdGhpcyBjb21wYXRpYmxlLgo+IAo+IFNob3VsZG4ndCB3ZSBo
YXZlIGhlcmUgYWx3YXlzIFNvQyBjb21wYXRpYmxlPyBDYW4gaXQgYmUgZXZlciB1c2VkCj4gYWxv
bmUsCj4gb3V0c2lkZSBvZiBnaXZlbiBTb0M/Cj4gCj4gSSBjb3VsZCBpbWFnaW5lIG5vdzoKPiAK
PiBpdGVtczoKPiDCoCAtIHt9Cj4gwqAgLSBjb25zdDogdmVyaXNpbGljb24sZGMKCkkgZm9sbG93
ZWQgdGhlIGB2aXZhbnRlLGdjYCBzaXR1YXRpb24gaGVyZSwgYmVjYXVzZSB0aGUgcmVnaXN0ZXJz
CmJlZm9yZSAweDE0MDAgKHdoZXJlIHJlYWwgZGlzcGxheS1yZWxhdGVkIHRoaW5ncyBzdGFydCkg
c2VlbXMgdG8gZm9sbG93CnRoZSBzYW1lIHNjaGVtZSB3aXRoIEdDLXNlcmllcyBHUFVzLCBpbmNs
dWRpbmcgdGhlIGlkZW50aWZpY2F0aW9uCnJlZ2lzdGVycy4KCj4gCj4gCj4gQmVzdCByZWdhcmRz
LAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
