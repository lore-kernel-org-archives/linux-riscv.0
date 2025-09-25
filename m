Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60527CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ9k4e8qYNSo2RelNAkQlhNP30p60HM/lWMDduH6Dn8=; b=2UwM7arEKvSsfO
	weaJLXva7XT0263hHA8J+XuN047//LMto1EhyYek4lXzK5HqaKlDN3Uij7hKUtgTJZbsX/jzxvc6S
	enpJH65HMvkL3xDGp3Ez5e1D9T5799AkBDa3JdoPnh6w99mC5wEJfqSAXHARc5HIjYQZ6b+fGLH+4
	H+cJSUWRcmvh2jVGys0/uZq0PWdcKgGeFe9uL7rl2RBU8xL/f3k4jtIgjtk2GkeKkTzntjMN9fdSP
	TMsfqiJBSmDUAcvl9JAGeXiAGBRsIpm7NOI11meBfY8QlZJaRDT0oDDGyExFrV6KxPezSbpVAfcWr
	mev/iWxN8gI3CSCZ8/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ezN-000000063nc-1vcX;
	Thu, 25 Sep 2025 05:57:57 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ezK-000000063lk-1agU
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 05:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758779836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U6ZLX1d+9sstgdgClpCgIBei3zIQM/guRuz1GLnt26Us1/05cfAtMafYiXKQTeqRiz3CsdEyTKIgIrbxuMzMIlytouIoKrhRvR36p+6SaRqYLfH9LjsD124H28ORUA/kLe7kzl40z0RoL8gDzJlL1QK6BvGeYt/XXDQbwb+Xv2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758779836; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NKm8NkZ2qj+imDCLFws1C9XKGcGIxvlKibeXZJUbrZY=; 
	b=cLouTp1bc05SrTcsyLJShR0wI1rHodZutbJmtoL/SpZ4SMZY5hxsRfKwGa81IVNjd8zy0UjOOQWZaWZBJAZCepun0TnnshBgKETZSPGL9cAmUD5QVQBFYl5x+qSSb5/SW4DXDlAOh2+QkykpxEYqgsQWhbx08nKd99sS8lVHn7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758779836;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=NKm8NkZ2qj+imDCLFws1C9XKGcGIxvlKibeXZJUbrZY=;
	b=W+0SrnW41EjFX94PCseZsg/F2j5G7tOI/r+tl6hYk4/+sRBBXmBdYSDc6FK8yv2l
	zUA/83DzsBGAg/Yhwb3syxeEyZthkV+tWHyYSiZ4D02QWnNmE577xb41zVPk/nfql8g
	Zw7U9GePJWANowgTU5QCphN5Si9ACXN2dIPDrtLLKE/jy9XsEq4SP2sl6M4Lq90lQaJ
	OJXvQD6Nz51Jbfai9uH0J1vDZU6FKolqNPZQDuQyH2MyhyoinFS2ZBJh8kmbwZF3hFI
	7nLkJnTJhl3CdYqDcLtvbcvkFrjn9CmGBZov1FnNupA3LO8k+nuRLyAsy6OIx6+hCdp
	OB63Oji5Vw==
Received: by mx.zohomail.com with SMTPS id 1758779834319455.8321043269757;
	Wed, 24 Sep 2025 22:57:14 -0700 (PDT)
Message-ID: <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, moderated for non-subscribers
 <etnaviv@lists.freedesktop.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Thu, 25 Sep 2025 13:57:03 +0800
In-Reply-To: <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
References: <20250921083446.790374-1-uwu@icenowy.me>
	 <20250921083446.790374-3-uwu@icenowy.me>
	 <20250922204349.GA1290045-robh@kernel.org>
	 <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
	 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
	 <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_225754_446570_9AE9BE40 
X-CRM114-Status: GOOD (  32.91  )
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

5ZyoIDIwMjUtMDktMjTmmJ/mnJ/kuInnmoQgMjA6MTUgKzAyMDDvvIxDaHJpc3RpYW4gR21laW5l
cuWGmemBk++8mgo+ID4gPiA+ID4gVmVyaXNpbGljb24gaGFzIGEgc2VyaWVzIG9mIGRpc3BsYXkg
Y29udHJvbGxlcnMgcHJlZml4ZWQgd2l0aAo+ID4gPiA+ID4gREMKPiA+ID4gPiA+IGFuZAo+ID4g
PiA+ID4gd2l0aCBzZWxmLWlkZW50aWZpY2F0aW9uIGZhY2lsaXR5IGxpa2UgdGhlaXIgR0Mgc2Vy
aWVzIEdQVXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFkZCBhIGRldmljZSB0cmVlIGJpbmRpbmcg
Zm9yIGl0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBEZXBlbmRzIG9uIHRoZSBzcGVjaWZpYyBEQyBt
b2RlbCwgaXQgY2FuIGhhdmUgZWl0aGVyIG9uZSBvcgo+ID4gPiA+ID4gdHdvCj4gPiA+ID4gPiBk
aXNwbGF5Cj4gPiA+ID4gPiBvdXRwdXRzLCBhbmQgZWFjaCBkaXNwbGF5IG91dHB1dCBjb3VsZCBi
ZSBzZXQgdG8gRFBJIHNpZ25hbAo+ID4gPiA+ID4gb3IKPiA+ID4gPiA+ICJEUCIKPiA+ID4gPiA+
IHNpZ25hbCAod2hpY2ggc2VlbXMgdG8gYmUgc29tZSBwbGFpbiBwYXJhbGxlbCBidXMgdG8gSERN
SQo+ID4gPiA+ID4gY29udHJvbGxlcnMpLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+
ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+IC0gRml4ZWQgbWlzc3BlbHQgInZlcnNpbGljb24i
IGluIHRpdGxlLgo+ID4gPiA+ID4gLSBNb3ZlZCBtaW5JdGVtcyBpbiBjbG9jayBwcm9wZXJ0aWVz
IHRvIGJlIGVhcmxpZXIgdGhhbgo+ID4gPiA+ID4gaXRlbXMuCj4gPiA+ID4gPiAtIFJlLWFsaWdu
ZWQgbXVsdGktbGluZSBjbG9ja3MgYW5kIHJlc2V0cyBpbiBleGFtcGxlLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiDCoC4uLi9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWzCoMKgwqDC
oMKgIHwgMTI3Cj4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NAo+ID4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVy
aXNpbGljb24sZGMueWFtbAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0Cj4gPiA+ID4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29u
LGRjLnlhCj4gPiA+ID4gPiBtbAo+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YQo+ID4gPiA+ID4gbWwKPiA+ID4gPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4wN2Zl
ZGM0YzdjYzEzCj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiArKysKPiA+ID4gPiA+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24s
ZGMueWEKPiA+ID4gPiA+IG1sCj4gPiA+ID4gPiBAQCAtMCwwICsxLDEyNyBAQAo+ID4gPiA+ID4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+
ID4gPiA+ICslWUFNTCAxLjIKPiA+ID4gPiA+ICstLS0KPiA+ID4gPiA+ICskaWQ6Cj4gPiA+ID4g
PiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlh
bWwjCj4gPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArdGl0bGU6IFZlcmlzaWxpY29uIERD
LXNlcmllcyBkaXNwbGF5IGNvbnRyb2xsZXJzCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArbWFpbnRh
aW5lcnM6Cj4gPiA+ID4gPiArwqAgLSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gK8KgICRub2RlbmFtZToK
PiA+ID4gPiA+ICvCoMKgwqAgcGF0dGVybjogIl5kaXNwbGF5QFswLTlhLWZdKyQiCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArwqAgY29tcGF0aWJsZToKPiA+ID4gPiA+ICvCoMKgwqAgY29uc3Q6IHZl
cmlzaWxpY29uLGRjCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBuZWVkcyBhbiBTb0Mgc3BlY2lmaWMg
Y29tcGF0aWJsZS4gR2VuZXJhbGx5IGxpY2Vuc2VkIElQCj4gPiA+ID4gY29tcGF0aWJsZXMKPiA+
ID4gPiBhcmUgdXNlbGVzcyBiZWNhdXNlIHRoZSBzcGVjcyBhcmVuJ3QgcHVibGljIGFuZCB0aGVy
ZSdzIGFsd2F5cwo+ID4gPiA+IGludGVncmF0aW9uIHF1aXJrcy4KPiA+ID4gCj4gPiA+IFRoaXMg
bWltaWNzIHRoZSBHUFUgSVBzIGJ5IHRoZSBzYW1lIHZlbmRvciwgc2VlCj4gPiA+IGdwdS92aXZh
bnRlLGdjLnlhbWwgLAo+ID4gPiB3aGljaCBjb250YWluIHRoZSBleGFjdCBzYW1lIHNldCBvZiBp
ZGVudGlmaWNhdGlvbiByZWdpc3RlcnMKPiA+ID4gKGluY2x1ZGluZwo+ID4gPiBhICJjdXN0b21l
ciBpZCIgb25lIHRoYXQgY2FuIGRpZmZlcmllbmF0ZSB0aGUgc2FtZSBjb25maWd1cmVkIElQCj4g
PiA+IG9uCj4gPiA+IFN0YXJGaXZlIEpINzExMCBhbmQgVC1IZWFkIFRIMTUyMCkuCj4gPiA+IAo+
ID4gPiBJZiB3ZSBjYW4gZ2V0IHZpdmFudGUsZ2MgdG8gd29yayB3L28gU29DIHNwZWNpZmljIGNv
bXBhdGlibGUsCj4gPiA+IHRoZW4gd2UKPiA+ID4gc2hvdWxkIGJlIGFibGUgdG8gZ2V0IHZlcmlz
aWxpY29uLGRjIHRvIHdvcmsgdG9vLgo+ID4gCj4gPiBXZWxsIG1heWJlIEkgc2hvdWxkIGFkZCBl
dG5hdml2IHBlb3BsZSB0byB0aGUgcmVjaXBpZW50IGxpc3QsIHRvCj4gPiBhbGxvdwo+ID4gdGhl
bSB0byB0ZWxsIHVzIHRoZSBtYWdpYyBiZWhpbmQgdml2YW50ZSxnYyAuCj4gPiAKPiAKPiBWaXZh
bnRlIEdQVXMgYXJlIHNwZWNpYWwgYmVjYXVzZSB0aGV5IGNvbnRhaW4gcmVnaXN0ZXJzIHRoYXQg
YWxsb3cKPiB0aGVtIHRvCj4gYmUgZnVsbHkgaWRlbnRpZmllZCAtIHNlZSBldG5hdml2X2h3X2lk
ZW50aWZ5KC4uKS4KPiAKPiBXZSBjYW4gcmVhZCBvdXQgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlv
bjoKPiDCoC0gbW9kZWwKPiDCoC0gcmV2aXNpb24KPiDCoC0gcHJvZHVjdF9pZAo+IMKgLSBjdXN0
b21lcl9pZAo+IMKgLSBlY29faWQKCldlbGwgVmVyaXNpbGljb24gRENzIChzb21ldGltZXMgYWxz
byBjYWxsZWQgVml2YW50ZSBEQ3MgYmVjYXVzZSBWaXZhbnRlCmlzIG5vdyBwYXJ0IG9mIFZlcmlz
aWxpY29uKSBleGNlcHQgRENOYW5vIGhhdmUgdGhlIHNhbWUgc2V0IG9mIElECnJlZ2lzdGVycyAo
SW4gZmFjdCB0aGUgcmVnaXN0ZXJzIGJlZm9yZSAweDE1MDAgc2VlbSB0byBoYXZlIG1vc3RseSB0
aGUKc2FtZSBtZWFuaW5nIHdpdGggR1BVcywgc2VlIFsxXSwgaGVyZSB0aGUgcmVnaXN0ZXJzIGFy
ZSBldmVuIG5hbWVkCkdDeyxSRUd9X3h4eCksIHNvIGl0J3Mgd2h5IEkgYXNzdW1lICJ2ZXJpc2ls
aWNvbixkYyIgd2lsbCB3b3JrIGhlcmUuCgpBbiBleGFtcGxlIG9mIGlkZW50aWZpY2F0aW9uIHJl
Z2lzdGVycyByZWFkb3V0IG9uIFRIMTUxMCBpcyBzaG93bgpiZWxvdzogKHRoZSByZWdpc3RlciBu
YW1lcyBhcmUgZnJvbSBldG5hdml2IHN0YXRlX2hpLnhtbCkKYGBgCnJvb3RAbHBpNGE2NiBbIH4g
XSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYwMDAyMCAjIE1PREVMICAgICAgICAgICAgICAKMHgw
MDAwODIwMApyb290QGxwaTRhNjYgWyB+IF0gIyBidXN5Ym94IGRldm1lbSAweGZmZWY2MDAwMjQg
IyBSRVYKMHgwMDAwNTcyMApyb290QGxwaTRhNjYgWyB+IF0gIyBidXN5Ym94IGRldm1lbSAweGZm
ZWY2MDAwMjggIyBEQVRFCjB4MjAyMTAyMDEKcm9vdEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBk
ZXZtZW0gMHhmZmVmNjAwMDJjICMgVElNRQoweDExMTMzMDAwCnJvb3RAbHBpNGE2NiBbIH4gXSAj
IGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYwMDAzMCAjIENVU1RPTUVSX0lECjB4MDAwMDAzMEEKcm9v
dEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZtZW0gMHhmZmVmNjAwMGE4ICMgUFJPRFVDVF9J
RAoweDAyMDgyMDAwCnJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYw
MDBlOCAjIEVDT19JRAoweDAwMDAwMDAwCmBgYAoKQnV0IGFzIFJvYiBwb2ludGVkIG91dCwgbWF5
YmUgYWNxdWlyaW5nIGluZm9ybWF0aW9ucyBmcm9tIHRoZSBJRHMKY2Fubm90IHNvbHZlIGFsbCB0
aGUgcHJvYmxlbSBvZiBpbnRlZ3JhdGlvbiBxdWlya3M/IEFzIHRoZXNlIElEcyBhcmUKYWxyZWFk
eSBkZXRlcm1pbmVkIHdoZW4gVmVyaXNpbGljb24gZ2VuZXJhdGVzIHRoZSBSVEwgZm9yIHRoZSBj
dXN0b21lciwKaXQncyBwb3NzaWJsZSBmb3IgdGhlbSB0byByZXVzZSB0aGUgUlRMIHR3aWNlLCBt
ZXNzIHVwIHNvbWV0aGluZyBpbiBvbmUKc2lsaWNvbiBhbmQgaGF2ZSB0aGUgaXNzdWVzIGZpeGVk
IGluIGFub3RoZXIuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL21pbGt2LW1lZ3Jlei9yb2Nrb3Mt
dS1ib290L2Jsb2IvYzkyMjFjZjJmYTc3ZDM5YzBiMjQxYWI0YjAzMGM3MDhlN2ViZTI3OS9kcml2
ZXJzL3ZpZGVvL2Vzd2luL2Vzd2luX2RjX3JlZy5oCgo+IAo+IFRoaXMgaW5mb3JtYXRpb24sIGlu
IGNvbWJpbmF0aW9uIHdpdGggYSBoYXJkd2FyZSBkYXRhYmFzZSAoaHdkYikgaW4KPiBrZXJuZWwv
dXNlcnNwYWNlLCBpcyBlbm91Z2ggdG8gc3VwcG9ydCB0aGVzZSBHUFVzL05QVXMgYWNyb3NzCj4g
ZGlmZmVyZW50IFNvQyB2ZW5kb3JzLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
