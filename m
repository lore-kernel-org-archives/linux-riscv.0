Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5BAD10F21
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wSsls7q0YHpsylicznG74+WcosDU2QwL6T7kXs4P2Y=; b=n5wBOCwXO0sMRR
	lNDznRFRgBfoD402QxtRpkmvz//yZw35XgMH3jdzSyiQh1ZltorrolpBtHZohr06d6ajuMptEP3oj
	9+LGN+5FIYCcuy6VtCP4iRrk1H7PUY6NxqVB0/CNqjl5WtlL5c/zC5uUgPl1ggQoZiEl0PEUpIXbO
	R6pd9TsYRrtaiwXrJS4cyRM0SE5P6gpvGZfZTvD1U837Tksw7FkWwnWk9+lEjPtEcDzs6zzkvMDTR
	3lu715E9j8WhRrAif7DHHPalTjsvsZEJPfw511+21rulvIODPeMpAk1L4JEszh3wbbBWmmqi41mnZ
	Hk6/sf5q7U352NWnQasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOClm-0000000EnNA-3jKE;
	Wed, 26 Nov 2025 10:29:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCll-0000000EnMx-2Jjj
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B226C6016D;
	Wed, 26 Nov 2025 10:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56DAC116D0;
	Wed, 26 Nov 2025 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764152944;
	bh=o4xoOR3FYDcnfcSB/1tq22yzXJeODAX9bkdlETyAHEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BkgK468rzrfZlNiOSrreq1w6DnQplV4+t6t7/BA2XqweG84izVeTMvMy/T3emezfN
	 T/JXctASsoWjI7YCiawD+RcXB4pB3L+mYhL0kl+SmqVBMvASoM1M4vKl0Y/FSuDZuq
	 aE1EBQXzXPOyXXuUn2iG1IUqJQJ8pjMmwRSlps3ZhsX72k5cDptFjRu374t4bpw49X
	 cGV4w05ETwMTo0m7M9AsefeupsKL+tInlSuW6yQuznKT+mSNdLG3f05u2KvFsgUBSx
	 HTjbyleQa3P5LMeWNtYlj5672aAaQOUk+7IzWhTv1k4oT3wxT9+g23Y6TTJwKC1GoM
	 r+O5Zny9zTW2Q==
Message-ID: <86c4b848-a94a-4ccb-80a1-59a5c91e8cce@kernel.org>
Date: Wed, 26 Nov 2025 11:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
 <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
 <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
 <001154b743b9f8364e96b3ebf791ef9920bbfa03.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <001154b743b9f8364e96b3ebf791ef9920bbfa03.camel@icenowy.me>
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

T24gMjYvMTEvMjAyNSAxMDo0MSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NuaYn+acn+S4ieeahCAxMDozNyArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjYvMTEvMjAyNSAwOTo1NywgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI1
LTExLTI25pif5pyf5LiJ55qEIDA5OjUxICswMTAw77yMS3J6eXN6dG9mIEtvemxvd3NraeWGmemB
k++8mgo+Pj4+IE9uIFdlZCwgTm92IDI2LCAyMDI1IGF0IDEyOjUyOjI2UE0gKzA4MDAsIEljZW5v
d3kgWmhlbmcgd3JvdGU6Cj4+Pj4+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+Pj4+Pgo+Pj4+PiBWZXJpc2lsaWNvbiBoYXMgYSBzZXJpZXMgb2YgZGlzcGxheSBjb250cm9s
bGVycyBwcmVmaXhlZCB3aXRoCj4+Pj4+IERDCj4+Pj4+IGFuZAo+Pj4+PiB3aXRoIHNlbGYtaWRl
bnRpZmljYXRpb24gZmFjaWxpdHkgbGlrZSB0aGVpciBHQyBzZXJpZXMgR1BVcy4KPj4+Pj4KPj4+
Pj4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgaXQuCj4+Pj4+Cj4+Pj4+IERlcGVuZHMg
b24gdGhlIHNwZWNpZmljIERDIG1vZGVsLCBpdCBjYW4gaGF2ZSBlaXRoZXIgb25lIG9yIHR3bwo+
Pj4+PiBkaXNwbGF5Cj4+Pj4+IG91dHB1dHMsIGFuZCBlYWNoIGRpc3BsYXkgb3V0cHV0IGNvdWxk
IGJlIHNldCB0byBEUEkgc2lnbmFsIG9yCj4+Pj4+ICJEUCIKPj4+Pj4gc2lnbmFsICh3aGljaCBz
ZWVtcyB0byBiZSBzb21lIHBsYWluIHBhcmFsbGVsIGJ1cyB0byBIRE1JCj4+Pj4+IGNvbnRyb2xs
ZXJzKS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5v
d3kubWU+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlz
Y2FzLmFjLmNuPgo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IFlvdSBhbHJlYWR5IHJlY2VpdmVkIHJldmll
dyBvbiB0aGlzLiBEb24ndCBzZW5kIHRoZSBzYW1lLiBSZWFkCj4+Pj4gdGhlCj4+Pj4gcmV2aWV3
Lgo+Pj4KPj4+IFBsZWFzZSBzZWUgdGhlIHNlbmRlciAobWFpbCBoZWFkZXIgRnJvbSkgb2YgdGhp
cyB0aW1lLgo+Pgo+PiBUaGlzIGltcHJvdmVkLiBJIGFtIHNwZWFraW5nIGFib3V0IHRoZSByZXN0
IG9mIHJldmlldy4KPiAKPiBXZWxsIHRoaXMgaXMgd2h5IHRoaXMgaXMgYSB2MyByZXNlbmQsIG5v
dCB2NC4KPiAKPiBJIHdpbGwgYWRkcmVzcyB0aGVzZSBpc3N1ZXMgaW4gdjQuCgpZb3UgcmVjZWl2
ZWQgcmV2aWV3LiBEbyBub3QgZXZlciBtYWtlIGEgcmVzZW5kIGlnbm9yaW5nIHRoZSByZXZpZXcs
IGV2ZW4KaWYgb25seSBwYXJ0cy4gTWFrZSBhIHBvc3RpbmcgYWZ0ZXIgYWRkcmVzc2luZyBDT01Q
TEVURSByZXZpZXcuCgpPdGhlcndpc2UgdGhpcyBoaWRlcyB0aGUgb3JpZ2luYWwgcmV2aWV3IGFu
ZCBubyBvbmUgd2lsbCBldmVyIGZpbmQgaXQuCkl0IGFsc28gaXMgcXVpdGUgZGlzcmVzcGVjdGZ1
bCB0byBteSB0aW1lIHNwZW50IG9uIHRoYXQgcmV2aWV3LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
