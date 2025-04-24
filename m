Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F115EC369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilYlaTvJy0gXPAE+iVaLgggFbVyT5jBu7MhWmX1IIJE=; b=lJXiXF20WRrIPR
	La4l5yq6WrDP6zK0VM2BKY35+yIWzStTXNWV02oG3i1aDAYsqcJri+Hc/MF2vrS4vwc7zxFZCa0vs
	Q38EeeniiM3gNEpY1chPPg+tMBdUsRxemKCGxCDv7JEGc4JNDgeejawLterYvWyexDF/YBlGhOOZo
	oh/qZ6PG7tpu+5RkBIz++BlhxNrqxdpy2zfMyyYuCzrZLQCGxh6ndlf/UccmMLGYKkWkjs4Yc4RLQ
	FX6xdGZAXvpzANGayP77zmEXNTSTNuJ1s/YdsjSaw2giCRBoesxzJDsjpcQUFO2vnAB7Q8ymkNWrz
	V8INOsU/LQI6/Yer/zpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wwl-0000000EFFd-3laZ;
	Thu, 24 Apr 2025 13:48:59 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7veQ-0000000E1xw-0OSE
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745497551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H8BlMqnIHjw4CtLH/Yn0TapHjcjGiO1ZCjZbGA7DHDc5kXkiVgRN85TRuiASG8O26w67Wiffvf9Y0X6WFhJHEc0Mx929foyfqBMwa26g/mhXOy2fFcAxGI8mXzpa5Guf2iG+/Hjjk95YJlrXGZZtxIStEvWYRpGHA0zEuyQX+9U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745497551; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sbs1+npj6WAlGfBRhvWrInsT1B/Gk04REktMxgJiGtU=; 
	b=PHTFa9PXZFTd4ld+pYXc02qHV3/BfobtI0PxJlLOFW7yvUBdOBZ4NKlvGBw+Rne8DzQG8rA6gAe8S9+Jl5jfVTJiS5n+xo86zyyyJVxcwrNRct064dRRP1EgD/v1IrVaaWV9e+AcQFnG89D1bsLL6Z6E0hTV8e9pBVTZkLeNc/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745497551;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Sbs1+npj6WAlGfBRhvWrInsT1B/Gk04REktMxgJiGtU=;
	b=mXhODf+uc65g+sni/MC1Kpan87oFKEGupVO5z5YJnuEpzrnEjRied3ILx9FCBewQ
	FIkNm/WKYbvLpLiwtKqNQer4y5EEIQ8sq+dSxAGOIQIKTcS9NIwr2H1YPp0yDLL58nx
	y3VPQ/hCnmXXS0KUxWnmf5wTyD5Y02gBpF2PDxDRjLew8ro/LtFG0RFVWWFgUraJDNp
	UlhAvoIiODexWA/3YF0UsdbD7duRpXsLxl4y+6oWbwbXYuxl4q06jZuxaVYagtne6gr
	RW3d0NA64yDkbV511walU0Gu0sV4SMqjrI0OAt/cqkjiDH2GSlZf+iSoqx/D/ZEZNDH
	pqgb9wS7OA==
Received: by mx.zohomail.com with SMTPS id 174549754871497.68482437052171;
	Thu, 24 Apr 2025 05:25:48 -0700 (PDT)
Message-ID: <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 24 Apr 2025 20:25:35 +0800
In-Reply-To: <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
	 <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
	 <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_052558_263141_6A118600 
X-CRM114-Status: GOOD (  34.56  )
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

5ZyoIDIwMjUtMDQtMjTmmJ/mnJ/lm5vnmoQgMTI6MzAgKzAyMDDvvIxMaW51cyBXYWxsZWlq5YaZ
6YGT77yaCj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTE6MzjigK9BTSBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPiB3cm90ZToKPiA+IOWcqCAyMDI1LTA0LTI05pif5pyf5Zub55qE
IDEwOjUxICswMjAw77yMTGludXMgV2FsbGVpauWGmemBk++8mgo+ID4gPiBPbiBUaHUsIEFwciAy
NCwgMjAyNSBhdCA4OjIw4oCvQU0gSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+
IHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBUaGUgSkg3MTEwIFNvQyBjb3VsZCBzdXBwb3J0IGludGVy
bmFsIEdQSSBzaWduYWxzIHRvIGJlIHJvdXRlZAo+ID4gPiA+IHRvCj4gPiA+ID4gbm90Cj4gPiA+
ID4gZXh0ZXJuYWwgR1BJTyBidXQgaW50ZXJuYWwgbG93L2hpZ2ggbGV2ZWxzLgo+ID4gPiA+IAo+
ID4gPiA+IEFkZCB0d28gbWFjcm9zLCBQQURfSU5URVJOQUxfTE9XIGFuZCBQQURfSU5URVJOQUxf
SElHSCwgYXMgdHdvCj4gPiA+ID4gdmlydHVhbAo+ID4gPiA+ICJwYWRzIiB0byByZXByZXNlbnQg
aW50ZXJuYWwgR1BJIHNvdXJjZXMgd2l0aCBmaXhlZCBsb3cvaGlnaAo+ID4gPiA+IGxldmVscy4K
PiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPiA+ID4gCj4gPiA+IEFzIHBlciBteSBvdGhlciByZXBseSBpbiB0aGUgcHJldmlvdXMg
cG9zdCwgSSB0aGluayB0aGlzIHNob3VsZAo+ID4gPiBiZQo+ID4gPiBoYW5kbGVkIGludGVybmFs
IGluIHRoZSBrZXJuZWwgaW5zdGVhZCB1c2luZyBhIHRpZ2h0ZXIKPiA+ID4gaW50ZWdyYXRpb24K
PiA+ID4gYmV0d2Vlbgo+ID4gPiB0aGUgR1BJTyBhbmQgcGluIGNvbnRyb2wgcGFydHMgb2YgdGhl
IGRyaXZlciBhbmQgdXRpbGl6aW5nIHRoZQo+ID4gPiBncGlvLXNwZWNpZmljIHN0cnVjdCBwaW5t
dXhfb3BzIGNhbGxiYWNrcy4KPiA+IAo+ID4gV2VsbCBJIGNhbm5vdCB1bmRlcnN0YW5kIHRoaXMg
LS0gdGhlc2Ugc2lnbmFscyBhcmUgbm90IEdQSU9zLAo+ID4gdG90YWxseQo+ID4gbm90IHJlbGF0
ZWQgdG8gdGhlIEdQSU8gc3Vic3lzdGVtIChiZWNhdXNlIHRoZXkncmUgb25seSBwaW5tdXgsIG5v
dAo+ID4gcmVsYXRlZCB0byBHUElPcykuIFRoaXMgaXMgZGVzY3JpYmVkIGluIG15IHByZXZpb3Vz
IG1haWwuCj4gCj4gT0sgc29ycnkgaWYgSSdtIGEgYml0IGR1bWIgYXQgdGltZXMgOigKPiAKPiBJ
IGd1ZXNzIEkgd2FzIGZhbGxpbmcgaW50byB0aGUgY29tbW9uIGNvbmZ1c2lvbiBvZiAic29tZXRo
aW5nIG5hbWVkCj4gZ2VuZXJhbCBwdXJwb3NlIiBzdWNoIGFzIHlvdXIgR1BJIGFuZCBHUE8gcmVn
aXN0ZXJzLCBpcyBhbHNvCj4gcmVsYXRlZCB0byBHUElPIHdoaWNoIGl0IGlzIG5vdCwgYXQgbGVh
c3Qgbm90IGFsd2F5cy4KCkFoLCBzb3JyeSwgdGhlc2UgR1BJL0dQTyBuYW1lcyBhcmUgZGlyZWN0
bHkgdGFrZW4gZnJvbSB0aGUgU3RhckZpdmUgVFJNCmZyb20gdGhlIHJlZ2lzdGVyIGZpZWxkIG5h
bWVzLiBUaGV5IENBTiBiZSByb3V0ZWQgdG8gdGhlIGV4dGVybmFsCkdQSU9zLCBidXQgaXMgbm90
IHJlcXVpcmVkIHNvLgoKPiAKPiA+IFRoZSBwaW4gbXV4IG9mIEpINzExMCBzdHJpY3RseSByb3V0
ZSBpdHMgaW5wdXRzIHRvIGl0cyBvdXRwdXRzLiBGb3IKPiA+IHNpZ25hbHMgZnJvbSBvdGhlciBT
b0MgYmxvY2tzICh0byBleHRlcm5hbCBwaW5zKSwgdGhlIHJlZ2lzdGVycwo+ID4gZGVmaW5lCj4g
PiBob3cgT1VUL09FbiBvZiBJTyBidWZmZXJzICphcmUgZHJpdmVuIGJ5KiB0aGUgc2lnbmFsczsg
aG93ZXZlciBmb3IKPiA+IHNpZ25hbHMgdG8gb3RoZXIgU29DIGJsb2NrcyAoZnJvbSBleHRlcm5h
bCBwaW5zKSwgdGhlIHJlZ2lzdGVycwo+ID4gZGVmaW5lCj4gPiBob3cgSU4gb2YgSU8gYnVmZmVy
cyAqZHJpdmUqIHRoZSBzaWduYWxzLiAoVGhpcyBmb2xsb3dzIHRoZSBnZW5lcmljCj4gPiBzaWdu
YWwtZHJpdmluZyBydWxlIHRoYXQgb25lIHNpZ25hbCBjYW4gZHJpdmUgbXVsdGlwbGUgc2lnbmFs
cyBidXQKPiA+IGNhbm5vdCBiZSBtdWx0aS1kcml2ZW4pLgo+ID4gCj4gPiBJbiBhZGRpdGlvbiB0
aGUgc2l0dWF0aW9uIEkgYW0gdHJ5aW5nIHRvIGhhbmRsZSBoZXJlIGlzIGFuIGFkZGl0aW9uCj4g
PiB0bwo+ID4gdGhlIGxhdHRlciBwYXJ0IG9mIHRoZSBwcmV2aW91cyBwYXJhZ3JhcGggLS0gaW4g
YWRkaXRpb24gdG8gNjQKPiA+IGlucHV0cwo+ID4gY29ycmVzcG9uZGluZyB0byA2NCBHUElPcywg
dHdvIGV4dHJhIGlucHV0cywgb25lIGFsd2F5cyAwIGFuZAo+ID4gYW5vdGhlcgo+ID4gYWx3YXlz
IDEgYXJlIGF2YWlsYWJsZSB0byB0aGUgcGluIGNvbnRyb2xsZXIgZm9yIGRyaXZpbmcgb3RoZXIg
U29DCj4gPiBibG9ja3MnIGlucHV0IChhcyBvdXRwdXQgb2YgcGluIGNvbnRyb2xsZXIpLgo+IAo+
IE9LIC4uLiBtYXliZSBJIGdldCBpdCBub3cuCj4gCj4gPiA+IFRoaXMgc29sdXRpb24gbG9va3Mg
bGlrZSBzb2Z0d2FyZSBjb25maWd1cmF0aW9uIGRpc2d1aXNlZCBhcwo+ID4gPiBoYXJkd2FyZQo+
ID4gPiBjb25maWd1cmF0aW9uLgo+ID4gCj4gPiBXZWxsIHRoaXMgc29sdXRpb24gaGFuZGxlcyB0
aGVzZSBpbnRlcm5hbCB3aXJlcyBpbiB0aGUgc2FtZSB3YXkgYXMKPiA+IHNpZ25hbHMgZnJvbSBl
eHRlcm5hbCBHUElPcywgZXhjZXB0aW5nIHNwZWNpZnlpbmcgc3BlY2lhbCBHUElPCj4gPiBudW1i
ZXJzLgo+ID4gSWYgeW91IGFyZSBhZ2FpbnN0IHRoZSBwcmluY2lwbGUsIG1heWJlIHRoZSBjdXJy
ZW50IGFscmVhZHktCj4gPiBpbmNsdWRlZAo+ID4gR1BJT01VWCBzeXN0ZW0gb2YgdGhlIFN0YXJG
aXZlIHBpbmN0cmwgaXMgdG8gYmUgYmxhbWVkIGluc3RlYWQgb2YKPiA+IG15Cj4gPiBzbWFsbCBl
eHRlbnNpb24gdG8gaXQuCj4gPiAKPiA+IEkgbXVzdCBhZG1pdCB0aGF0IHRoZSBjdXJyZW50IEdQ
SU9NVVggc3lzdGVtIGlzbid0IGEgZmFpdGhmdWwKPiA+IHJlcHJlc2VudGF0aW9uIG9mIHRoZSBo
YXJkd2FyZSBiZWNhdXNlIGl0J3MgYSBwYWQtY2VudHJpYyBzZXR1cAo+ID4gaW5zdGVhZAo+ID4g
b2YgYSByZWdpc3Rlci1maWVsZC1jZW50cmljIG9uZSwgd2hpY2ggaXNuJ3QgdmVyeSBuYXR1cmFs
IGZvciBpbnB1dAo+ID4gc2lnbmFscy4gSG93ZXZlciBjb25maWd1cmF0aW5nIHRoZSBtdXggaW4g
c3VjaCBhIHdheSBpcyBhZ2FpbnN0Cj4gPiBwZW9wbGUKPiA+IHJlYWRpbmcsIGFuZCB3ZSdyZSBu
b3QgYWJsZSB0byBicmVhayB0aGUgc3lzdGVtIGJlY2F1c2UgaXQncwo+ID4gYWxyZWFkeQo+ID4g
dGhlcmUuCj4gPiAKPiA+IFdlbGwgaW4gdGhlIHNpdHVhdGlvbiB0aGF0IG9uZSBHUElPIHVzZWQg
YXMgaW5wdXQgZHJpdmVzIG11bHRpcGxlCj4gPiBpbnRlcm5hbCBzaWduYWxzIHRoZSBwaW5tdXgg
bG9va3MgYSBsaXR0bGUgY29uZnVzaW5nIHRvbywgZS5nLiB0aGUKPiA+IEkyUwo+ID4gY2xvY2sg
c2l0dWF0aW9uIEkgbWVudGlvbmVkIGluIG15IHJlcGx5IGluIHRoZSBwcmV2aW91cyByZXZpc2lv
biBvZgo+ID4gdGhlCj4gPiBwYXRjaHNldC4KPiAKPiBJIGd1ZXNzIHdoYXQgcnVicyBtZSB0aGUg
d3Jvbmcgd2F5IGlzIHdoeSB0aGUgZXh0ZXJuYWwgdXNlcnMKPiAoZGV2aWNlcywgZGV2aWNlIGRy
aXZlcnMgb3IgZXZlbiBwaW4gaG9ncykgY2Fubm90IHRyaWdnZXIgdGhlIGNoYWluCj4gb2YKPiBl
dmVudHMgbGVhZGluZyB0byB0aGlzIGNvbmZpZ3VyYXRpb24sIGluc3RlYWQgb2YgZGlmZmVyZW50
ICJtYWdpYyIKPiBjb25maWd1cmF0aW9ucyB0aGF0IGFyZSBqdXN0IHNldCB1cCBpbiB0aGUgcGlu
IGNvbnRyb2xsZXIgaXRzZWxmLgoKV2VsbCBJIGFtIGp1c3QgZXh0ZW5kaW5nIHdoYXQncyBhbHJl
YWR5IGluIHVzZS4uLgoKQ3VycmVudGx5IGl0J3MgYWxyZWFkeSBzdXBwb3J0ZWQgdG8gcm91dGUg
R1BJT3MgdG8gR1BJIHNpZ25hbHMsIEkgYWRkZWQKdGhlIHN1cHBvcnQgdG8gcm91dGUgZml4ZWQg
bGV2ZWwgc291cmNlcyB0byB0aGVtLCBpbiBhIHNpbWlsYXIgd2F5LgoKSWYgYW55IGV4dGVybmFs
IHVzZXJzIGV2ZXIgaGF2ZSB0aGUgbmVlZCBvZiBiYW5naW5nIHRoZSBpbnRlcm5hbApzaWduYWxz
IGluc3RlYWQgb2YgdHlpbmcgaXQgZml4ZWRseSwgbWF5YmUgc3dpdGNoaW5nIGJldHdlZW4gZGlm
ZmVyZW50CnBpbmN0cmwgY29uZmlndXJhdGlvbiBzZXRzIGlzIGVub3VnaD8gKEJlY2F1c2UgdGhp
cyBraW5kIG9mIG9wZXJhdGlvbgpjb3VsZCBuZXZlciBiZSBhcyBoaWdoIHNwZWVkIGVub3VnaCBh
cyByZWFsIGhhcmR3YXJlIHBpbnMpCgo+IAo+IEJ1dCBpZiB5b3UgYXJlIHBvc2l0aXZlbHkgY29u
dmluY2VkIHRoYXQgdGhlcmUgaXMgbm8gb3RoZXIgd2F5LAo+IEkgZ3Vlc3MgSSBoYXZlIHRvIGxp
dmUgd2l0aCBpdC4KPiAKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
