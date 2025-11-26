Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73C4D1037B
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mThT9Qi+qVwBqNmbhDuHYbXE7q9c5yw4uiq1GGcLNFU=; b=WCaOiPiui3l0SA
	uLAMwiN5T9BRWOiCsAn3e6JGx+MsT4pcasm/CjeJyRIL6zUu7a8y14ARLM92cMDXQORWP8c0mQfrT
	OETJuaee8iqB/p6Tth76+SGCjudol53CKdbDvveC3W2Pah79CK04Pt0mFnKbM9RnYgDwSuLuk3Pqa
	VnPk8FCMS8TtWSPEeqIOGzEsWpDgxiZa58SCQZ5O5uRzryQgXaZDTqIimQUzAKZ5YJJNEYMMnrZHZ
	jTuHqYcj8yrEhEt56TzAj7tG1cbFr+FB/wdixduQm1RZJoB1RUPOWY0lKUbEyVXXeJj1iQSVoljIJ
	2pyiDdc1zMM+RyYvVKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCnL-0000000EncL-1I0N;
	Wed, 26 Nov 2025 10:30:43 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCnJ-0000000Enbj-0gNX
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764153018; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OYYleQ1k8FWw+W+ZYN7Th12qLWrGuaSfrt9ASCg2UMQTVfqeBdioQZoI2qDwBv/RfTay3fB2D6omNnrRARnDPBlPxMvr8ADfBodhUYabJT4hTey0+DXELcVG7a14ZkcvTlJ6bvIG6UDfozNrHTDb0CHweLiU9bAQAiWpP/qeaGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764153018; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OZ1kY2bT7sS9us9BszB6jmltZJNEl+rlI8OBwV7dowU=; 
	b=TrOhDWPOFBihGFp8aZqsy7aBs/igik26WLcVtKykIK8bbsKhLrVgljs8a3pXy4ht3sKwZoLjpHkIlIoHJwk39H0XGIYQmefTTM2cYNOGe9luZR5S0D3aQdBGIwoLxbxI5zOVmEfsG1a59f4R+p8on+jUuArx6MqltcvJ4A1tGyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764153018;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=OZ1kY2bT7sS9us9BszB6jmltZJNEl+rlI8OBwV7dowU=;
	b=gQJLVGM5K4IVz/UDpuaE6WmPBJlgEEqRIjQ7cMXJ738wErZ8cxxDJeTB69MXDktu
	GPQadH4E1Q2Li/JMhlagAnZlTglbkX3PDMGTSBj4+mnNMR8K2Y5BipNKZd1hty8Brjz
	MyixYz8YTwBeeMWnsYwkGImD9tIqzLArzre1bISkNVScNNQP8FxjGkgU14xlvWEX9ic
	nfUEHCfM08cE8+indN0yvXhmJNDdKh76DEkCBZRCcks9+3X8dW1PboK+87+0GnttS/h
	9q99gLSFjti7fTgvWe6h2KBVJ3eLriD/gHeDCb5hv0ZBLeu9flcsgtTqySGoV2YfjVF
	WuYUZvsWHQ==
Received: by mx.zohomail.com with SMTPS id 1764153015474257.540340363018;
	Wed, 26 Nov 2025 02:30:15 -0800 (PST)
Message-ID: <cc033a17a099c18451b0716e3ceb44229280068f.camel@icenowy.me>
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 26 Nov 2025 18:30:05 +0800
In-Reply-To: <86c4b848-a94a-4ccb-80a1-59a5c91e8cce@kernel.org>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
	 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
	 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
	 <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
	 <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
	 <001154b743b9f8364e96b3ebf791ef9920bbfa03.camel@icenowy.me>
	 <86c4b848-a94a-4ccb-80a1-59a5c91e8cce@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023041_255938_F1B8FD14 
X-CRM114-Status: GOOD (  23.74  )
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

5ZyoIDIwMjUtMTEtMjbmmJ/mnJ/kuInnmoQgMTE6MjggKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjYvMTEvMjAyNSAxMDo0MSwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTExLTI25pif5pyf5LiJ55qEIDEwOjM3ICswMTAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiAyNi8xMS8yMDI1IDA5OjU3LCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gPiA+IOWcqCAyMDI1LTExLTI25pif5pyf5LiJ55qEIDA5OjUxICswMTAw77yM
S3J6eXN6dG9mIEtvemxvd3NraeWGmemBk++8mgo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjYsIDIw
MjUgYXQgMTI6NTI6MjZQTSArMDgwMCwgSWNlbm93eSBaaGVuZwo+ID4gPiA+ID4gd3JvdGU6Cj4g
PiA+ID4gPiA+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gVmVyaXNpbGljb24gaGFzIGEgc2VyaWVzIG9mIGRpc3BsYXkgY29udHJv
bGxlcnMgcHJlZml4ZWQKPiA+ID4gPiA+ID4gd2l0aAo+ID4gPiA+ID4gPiBEQwo+ID4gPiA+ID4g
PiBhbmQKPiA+ID4gPiA+ID4gd2l0aCBzZWxmLWlkZW50aWZpY2F0aW9uIGZhY2lsaXR5IGxpa2Ug
dGhlaXIgR0Mgc2VyaWVzCj4gPiA+ID4gPiA+IEdQVXMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBBZGQgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciBpdC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1vZGVsLCBpdCBjYW4gaGF2ZSBlaXRoZXIg
b25lIG9yCj4gPiA+ID4gPiA+IHR3bwo+ID4gPiA+ID4gPiBkaXNwbGF5Cj4gPiA+ID4gPiA+IG91
dHB1dHMsIGFuZCBlYWNoIGRpc3BsYXkgb3V0cHV0IGNvdWxkIGJlIHNldCB0byBEUEkgc2lnbmFs
Cj4gPiA+ID4gPiA+IG9yCj4gPiA+ID4gPiA+ICJEUCIKPiA+ID4gPiA+ID4gc2lnbmFsICh3aGlj
aCBzZWVtcyB0byBiZSBzb21lIHBsYWluIHBhcmFsbGVsIGJ1cyB0byBIRE1JCj4gPiA+ID4gPiA+
IGNvbnRyb2xsZXJzKS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJ
Y2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+ID4gPiA+ID4gLS0tCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IFlvdSBhbHJlYWR5IHJlY2VpdmVkIHJldmlldyBvbiB0aGlzLiBE
b24ndCBzZW5kIHRoZSBzYW1lLgo+ID4gPiA+ID4gUmVhZAo+ID4gPiA+ID4gdGhlCj4gPiA+ID4g
PiByZXZpZXcuCj4gPiA+ID4gCj4gPiA+ID4gUGxlYXNlIHNlZSB0aGUgc2VuZGVyIChtYWlsIGhl
YWRlciBGcm9tKSBvZiB0aGlzIHRpbWUuCj4gPiA+IAo+ID4gPiBUaGlzIGltcHJvdmVkLiBJIGFt
IHNwZWFraW5nIGFib3V0IHRoZSByZXN0IG9mIHJldmlldy4KPiA+IAo+ID4gV2VsbCB0aGlzIGlz
IHdoeSB0aGlzIGlzIGEgdjMgcmVzZW5kLCBub3QgdjQuCj4gPiAKPiA+IEkgd2lsbCBhZGRyZXNz
IHRoZXNlIGlzc3VlcyBpbiB2NC4KPiAKPiBZb3UgcmVjZWl2ZWQgcmV2aWV3LiBEbyBub3QgZXZl
ciBtYWtlIGEgcmVzZW5kIGlnbm9yaW5nIHRoZSByZXZpZXcsCj4gZXZlbgo+IGlmIG9ubHkgcGFy
dHMuIE1ha2UgYSBwb3N0aW5nIGFmdGVyIGFkZHJlc3NpbmcgQ09NUExFVEUgcmV2aWV3Lgo+IAo+
IE90aGVyd2lzZSB0aGlzIGhpZGVzIHRoZSBvcmlnaW5hbCByZXZpZXcgYW5kIG5vIG9uZSB3aWxs
IGV2ZXIgZmluZAo+IGl0Lgo+IEl0IGFsc28gaXMgcXVpdGUgZGlzcmVzcGVjdGZ1bCB0byBteSB0
aW1lIHNwZW50IG9uIHRoYXQgcmV2aWV3LgoKV2VsbCBva2F5LCBzb3JyeSBiZWNhdXNlIEkgZGlk
bid0IG5vdGljZSB0aGUgcmV2aWV3IGJlZm9yZS4uLgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6
eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
