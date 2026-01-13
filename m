Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4175DD2D103
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOTEv7N80YKB2lL84o0qdToUPh1dQwSaPrx5TGwxDOs=; b=31o1/gWdNAcrAm
	C6bCOK1b5C+IX9OD5+8B+cqTSADOmaxHcMLPkH0ag1HKZ/QG4KCaNz4N/YDEGj0ZF9B/gaZuF2oT4
	nLW+i6Cl9e16MQjpWL6xZkeESfix8VIzxJxvzqvj4IXnaeBp5c7iEjqWFHtLcrmo3knFff+Ow8+V6
	tLCCZXa9QFgaP9IIyvgA89fakl2HCWS6JakAvffOUaaiG1gUx6BO2BS8fysPXhMS4HnTsCmGuHAsR
	7XlOaT5kXoW60PHHbBZnipHMPSHsdBkN7k+z77IeOv39aywftICCUpTGXFVc4l4KwoQJAfAAluakd
	Vo7YPYVctYQSO94Uhqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfefj-00000007AVF-28Vl;
	Tue, 13 Jan 2026 13:42:59 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfefh-00000007AUt-0xIL
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 13:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768311742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g2PjH7R8qmNDP49tCuXVrZN+SkVmuHZZs6r1O4BU1uPv0JOS+Td500xvDzzUdwccmmzgb+YjcpLS5jCYUjqxevFHnbpMH9LgDCNQCUOer2b7osBTn12ubC6XpFzccz3O/MQ79yzqfmdnqsihS/AFwmVZ7Q1J2n1qXvuQa567JyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768311742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ja6rzcL5U+W48IVxZgkBg4dYiV270NXq5gOCylNcInY=; 
	b=HNFlQVHvg0OTUHPDV2/8wbGxoLx8qcjV5dYJ+Mu5YowreGPkJuuIKYB8bHZQdfBskiHsJGqpRNWZZyu1PW0ZLD+8hrar5AxqjOKblr1FQAsFhZJF9XAMfjt5zaJHBGsCCbULhAND8DZkzaqnVvmV/onVVbzZ+ueyQJEPIZOtD28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768311742;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Ja6rzcL5U+W48IVxZgkBg4dYiV270NXq5gOCylNcInY=;
	b=fNBMci8C2AOnEYzhfrW9nYTKlSeuDWWCs/ZLm5M4MmQ8uw9D9SSTe9NwRHZiPXC/
	uqr/y4oGpn42ku4jfGyylfAcC9e+Z34IcqU6L2nUSJ4HWk6QjQZ/rdzBteCbfvH8yv4
	hQcT35s+ECKdKHPonNsbgPM3WVTjoD+eY8zYJRMtTkH6mgfD+5ikoKRcPQ7Qf8lRInY
	N3ZOugHFtIJQPfSO9udKLBwTJMpYA2zGH3Hpq1gmWuxxeu+q1X2JdY99CfrszbaQvlz
	dtTOMtpVzvajWWMMsELjmWvMuIJak86byibZkUffWJj5+CGl1MnWL2vvL96WjqepoQP
	mBDTIA8bog==
Received: by mx.zohomail.com with SMTPS id 1768311704204117.21744879657183;
	Tue, 13 Jan 2026 05:41:44 -0800 (PST)
Message-ID: <ba505a137370377e55316605827b51a2454b023e.camel@icenowy.me>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>
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
Date: Tue, 13 Jan 2026 21:41:30 +0800
In-Reply-To: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
	 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
	 <20260105154656.GA2585570-robh@kernel.org>
	 <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
	 <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_054257_324276_55802601 
X-CRM114-Status: GOOD (  10.48  )
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

5ZyoIDIwMjYtMDEtMDXmmJ/mnJ/kuIDnmoQgMTA6MjAgLTA2MDDvvIxSb2IgSGVycmluZ+WGmemB
k++8mgo9PT09PT09PT09IDg8ID09PT09PT09PT09PT09Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
IHBvcnRzOgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwb3J0QDAKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIHBvcnRAMQo+ID4gPiAKPiA+ID4gSXQgaXMgdmFsaWQgdG8gb21pdCB0aGVzZSBpZiB0
aGUgb3V0cHV0IGlzIHByZXNlbnQsIGJ1dCB1bnVzZWQuCj4gPiAKPiA+IFdlbGwgdGhpcyBzb3Vu
ZHMgcmVhc29uYWJsZSwgYWx0aG91Z2ggbXkgZHJpdmVyIGRvZXMgbm90IHBsYXkgd2VsbAo+ID4g
aWYKPiA+IG9ubHkgYSBwb3J0QDEgaXMgZGVmaW5lZCB3L28gcG9ydEAwIC4KPiAKPiBTb3VuZHMg
bGlrZSB5b3VyIGRyaXZlciBzaG91bGQgYmUgZml4ZWQuCgpBZnRlciB0aGlzIHJlcXVpcmVtZW50
IGlzIGRyb3BwZWQsIHNob3VsZCB0aGUgdW5jb25uZWN0ZWQgcG9ydEAwIGFsc28KYmUgcmVtb3Zl
ZCBmcm9tIHRoZSBEVCBleGFtcGxlPwoKPiAKPiA+IENvbnNpZGVyaW5nIHRoZSBwcmV2aW91cyB0
d28gc25pcHBldHMsIHNob3VsZCBJIGp1c3QgcmVtb3ZlIHRoaXMgaWYKPiA+IHBhcnQ/Cj4gCj4g
SSB3b3VsZCwgeWVzLgo+IAo+IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
