Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F68D10399
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OttP/n3n+/dd45SfM5wHZg8vqS5MLu4oEzd8MwO8oQw=; b=eN4cHS0JlAOl9C
	6KUd/ya1OdVjO7EHts4YcgD2uAjh1LSvhhpx9q/nle8HiN+zg6w2Y0t/ggwylWcgycUKov+7FnnAu
	jUKz7oiatIZgS4xmaM/lNA2kM6J22zf4M9L5rUXRdoXo/Ej0d/j6GcjYxYyoxTtFJF9OJszouxyL0
	ofsuY24qOqsn5/1jfm+Ueoo43o4n5s9wTgNK2kH/beWQS6j/obxu7KA/EPNdmd+J1WVZQJDjG5p0h
	XCxACM6giLP7dQ+xWDKfWG5usJcR5VA2ZGuk5rFmaKNq5xe0RnXX+R793mkDHUhoESDSMWJro5OVR
	/l0R8tBBVoEG2e2ea7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCB4-0000000Ek6Z-43z2;
	Wed, 26 Nov 2025 09:51:10 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCB2-0000000Ek6A-0uMx
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 09:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764150649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vq6V27VOi3pqmFR3nYPN+F28Ob3QjjvrTFNqOJPrCwsPzfq6fgzT8IDbNriOTaksKk5q8g3vRcoMwYKrSDhD5IdRJfOaLWo7d2bvnn6QG01dj1LQtZ7Mlg8lI3rOnRDmolONekN6sdQZUbgLEhaQfAzwFuKNjqetk4cf7hEZC2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764150649; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cGcQhwRu7CBTzlhQkSvbP/GEOTbwssNmYI3Qff2lHHE=; 
	b=AFfo/Lj7B+cG+kEr8acGty6ck9Rk2PekB57kbt81WaFZRX5IL5bTbD1bN6zMew/wlYY8hkIuTwiGAp65xiG+QWIg8D/ijtMmmnq7+UwaUN7wj8KyhL8+Wj74i/yBbELAgMxXTg3BK0YHSun46R29mKdjISkaicHfK4INBM2vNQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764150648;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=cGcQhwRu7CBTzlhQkSvbP/GEOTbwssNmYI3Qff2lHHE=;
	b=O8XkSE8kw1i4BbMEGqGCFcj2RawPC0MhLnVYFr+RHNIex9ME+g1f2Ufv0PK7FOJ8
	GXP+/Szy2gGEZkVFMPXRBqdmSI3OjCNXlB3EHAT3OMEVjge+mESSuU0B81YQvCXP1j/
	uleB4fwMAyuTW8iSC/tp6zRvZrrnRllfiB6dDP6uhBz8ILTnvvbOnA04EyZgZYeOsUK
	ViTOehL4ta5XDrYbQWl7JfdPvUZzweKrjgA+i1WqlyDhLGq4B/pXTGmpHwWknS8q8Y4
	JQkieFmpdPVlbjbNPUD8K/QZ9TZh5oLpNnw+FQMMuPL4MCWtiwHVotPppGWgYlei9Sp
	mDFrVkM5IA==
Received: by mx.zohomail.com with SMTPS id 1764150647026294.37960967272056;
	Wed, 26 Nov 2025 01:50:47 -0800 (PST)
Message-ID: <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
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
Date: Wed, 26 Nov 2025 17:50:36 +0800
In-Reply-To: <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <20251124105226.2860845-3-uwu@icenowy.me>
	 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_015108_335765_BD997E76 
X-CRM114-Status: GOOD (  27.27  )
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
aGVyZS4KPiAKPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gQWRkZWQgU29DLXNwZWNp
ZmljIGNvbXBhdGlibGUgc3RyaW5nLCBhbmQgYXJtIHRoZSBiaW5kaW5nIHdpdGgKPiA+IGNsb2Nr
IC8KPiA+IMKgIHBvcnQgY2hlY2tpbmcgZm9yIHRoZSBzcGVjaWZpYyBTb0MgKHdpdGggYSAyLW91
dHB1dCBEQykuCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIEZpeGVkIG1pc3NwZWx0ICJ2
ZXJzaWxpY29uIiBpbiB0aXRsZS4KPiA+IC0gTW92ZWQgbWluSXRlbXMgaW4gY2xvY2sgcHJvcGVy
dGllcyB0byBiZSBlYXJsaWVyIHRoYW4gaXRlbXMuCj4gPiAtIFJlLWFsaWduZWQgbXVsdGktbGlu
ZSBjbG9ja3MgYW5kIHJlc2V0cyBpbiBleGFtcGxlLgo+ID4gCj4gPiDCoC4uLi9iaW5kaW5ncy9k
aXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWzCoMKgwqDCoMKgIHwgMTQ2Cj4gPiArKysrKysrKysr
KysrKysrKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0Cj4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwK
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGlj
b24sZGMueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLjUyMmE1NDQ0OThiZWEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwKPiA+IEBA
IC0wLDAgKzEsMTQ2IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAg
T1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sIwo+ID4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ID4gKwo+ID4gK3RpdGxlOiBWZXJpc2lsaWNvbiBEQy1zZXJpZXMgZGlzcGxheSBjb250cm9sbGVy
cwo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gK8KgIC0gSWNlbm93eSBaaGVuZyA8dXd1QGlj
ZW5vd3kubWU+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICvCoCAkbm9kZW5hbWU6Cj4gPiAr
wqDCoMKgIHBhdHRlcm46ICJeZGlzcGxheUBbMC05YS1mXSskIgo+ID4gKwo+ID4gK8KgIGNvbXBh
dGlibGU6Cj4gPiArwqDCoMKgIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqAgLSBlbnVtOgo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIHRoZWFkLHRoMTUyMC1kYzgyMDAKPiA+ICvCoMKgwqDCoMKgIC0g
Y29uc3Q6IHZlcmlzaWxpY29uLGRjCj4gCj4gSSBkbyBub3Qgc2VlIGFueSBleHBsYW5hdGlvbiBv
ZiBleGNlcHRpb24gZm9yIGdlbmVyaWMgY29tcGF0aWJsZXMsCj4gbWF5YmUKPiBleGNlcHQgInNl
bGYtaWRlbnRpZmljYXRpb24iIHJlbWFyay4gUm9iIGFscmVhZHkgcG9pbnRlZCB0aGlzIG91dCwg
c28KPiBiZQo+IGV4cGxpY2l0IGluIGNvbW1pdCBtc2cgd2h5IHlvdSBhcmUgdXNpbmcgYSBnZW5l
cmljIGNvbXBhdGlibGUuCgpXZWxsIEkgb25seSBnZXQgdGhlIG1lYW5pbmcgb2YgImEgU29DIHNw
ZWNpZmljIGNvbXBhdGlibGUgaXMgcmVxdWlyZWQiCmluIGhpcyByZXZpZXcgbWVzc2FnZS4KCkkg
dGhpbmsgbXkgYmluZGluZyBub3cgcmVxdWlyZXMgYm90aCBhIFNvQy1zcGVjaWZpYyBjb21wYXRp
YmxlIGFuZCBhCmdlbmVyaWMgY29tcGF0aWJsZSwgd2hpY2ggc2hvdWxkIGJlIG9rYXkgdG8gc2F0
aXNmeSBSb2IncyBvcmlnaW5hbApyZXZpZXcuCgo+IAo+ID4gKwo+ID4gK8KgIHJlZzoKPiA+ICvC
oMKgwqAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICvCoCBpbnRlcnJ1cHRzOgo+ID4gK8KgwqDCoCBt
YXhJdGVtczogMQo+ID4gKwo+ID4gK8KgIGNsb2NrczoKPiA+ICvCoMKgwqAgbWluSXRlbXM6IDQK
PiAKPiBUaGlzIGlzIG5vdCBmbGV4aWJsZS4gRGV2aWNlIGVpdGhlciBoYXMgb3IgaGFzIG5vdCB0
aGVzZSBjbG9ja3MuCgpUaGUgZXhpc3RlbmNlIG9mIGFsbCB0aGVzZSBjbG9ja3MgYXJlIHZlcmlm
aWVkIGJ5IGRpYWdyYW1zIGluIG1hbnVhbHMKb2YgdHdvIGRpZmZlcmVudCBTb0NzIHdpdGggREM4
MjAwIChULUhlYWQgVEgxNTIwIGFuZCBTdGFyRml2ZSBKSDcxMTApLgoKTWF5YmUgYSBleHBsaWNp
dCBgbWF4SXRlbXM6IDVgIGlzIG5lZWRlZCBoZXJlLCBidXQgYXMgbXkgRFQgcGFzc2VzCmR0YnNf
Y2hlY2ssIEkgZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3Nhcnk/CgpPciBtYXliZSBJIHNob3VsZCBk
cm9wIHRoZSBmbGV4aWJpbGl0eSBub3cgYW5kIHVzZSBhIGBtaW5JdGVtczogNWAgaGVyZQooYW5k
IGxlYXZlIERDODAwMCBzdXBwb3J0IGFzIGFub3RoZXIgc3RvcnkpPyAoVGhlIEVzd2luIEVJQzc3
MDAgbWFudWFsCmRvZXMgbm90IGhhdmUgYSBkaWFncmFtIHNob3dpbmcgZXh0ZXJuYWwgY29ubmVj
dGlvbnMgb2YgdGhlIERDLCBsaWtlCnRoZSB0d28gU29DcyBJIG1lbnRpb25lZCBhYm92ZSkuCgo+
IAo+ID4gK8KgwqDCoCBpdGVtczoKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IERDIENv
cmUgY2xvY2sKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IERNQSBBWEkgYnVzIGNsb2Nr
Cj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBDb25maWd1cmF0aW9uIEFIQiBidXMgY2xv
Y2sKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IFBpeGVsIGNsb2NrIG9mIG91dHB1dCAw
Cj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQaXhlbCBjbG9jayBvZiBvdXRwdXQgMQo+
ID4gKwo+IAo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
