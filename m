Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9ABCDE006
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eMWKedfrvu4DkZDgUYcfqypnKVeTjVJQEsX3KMsce4=; b=aZ9/WwavRjkAfs
	Id4ljNIhsbKidvCgOGiil0dRKbGHhybYbt36vzGmk3DknHJ+kAySCF95p7PwWl/Zq847BubAt43oH
	UogxEG+rFb02Dm4sNX/v3Se/NzZVfzdmyogS2hqkTM+YbapS7T6vmEMNWqF0W03u0RSfE1qUCxKIE
	fLjyn6qbk69qUzOzGuS+nzrtr0ysncQ6P9nzBMeBJqrpYm2IN5ywgwsfW2zdLbQJvuFYVPBUXxLwZ
	WJZJUVA19cK0IaqTdYxtCfd/BK3QxXTGQsnl5/d92e+QYILqxS5jIrBdjGo1LfFl3XfDzfpwiBwev
	b3E//kNt/r9sXTYxmcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnue-0000000BiWz-20rP;
	Fri, 14 Nov 2025 07:08:04 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnub-0000000BiWM-1BZs;
	Fri, 14 Nov 2025 07:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763104032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jk8AIvOvE/8LILOk2DAILmhafD1+Kg+0XgQZHPcvLjJXSs3Qx5wAXkzN5cm/OxTZ51kk7c6QgLrcFAGR355r+9xNXVNZGIu6GDQVIA47uKMXSlZKpaZhKMbG/skxbQxmTi+2HJww9siVp6dDOOeh9j8biyYC5chBoMAyIPdjZ6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763104032; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=; 
	b=SMLZwHprsnx3D00elMkDAh13b+oJs8sHl8Sm9UQlfTbjAYanSRGYNDvHwmvIar8Xa2ELh6OZExv8bnPxCVP/6IwacTlLs4UK7BQU36CdBlIc4xsUH0clvzNVfXIdd896rin/1aX4hZYouTbL9x13nknClax0wwN6HugVdoTvRcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763104032;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=;
	b=Yd6vZtKPbUx5vWV+zNJtZtt5NR9BWsRdyN8Gw4lNM4SwZ6FAE6/Rk7VRnLKUT/v6
	sELB7aNzp5H8Z2YbspkYpXkuvsQF0W+fkXmB0JYpIRUgf+qRhxpew29OIpCi3HhxdkX
	29DoCJAuPPZrDkrzlUJ9d7fQ4kMo5WOC+XUgfn6jPLk1o0EFKcak8CiZg4N8uL8jPRE
	K+UK2V5lb5YkC2rdGSGEOYgfgsOMvc/j8YCVjYgN7Cddi7uua0UDXan8YvpIHlX9J7w
	ctZax5B1yJ9tck3DyVIfWhhgYo9KBtNBD1JKLOTnYrE47mZreU0zMzkvSRqIkpFDLQ6
	74JW1oXADQ==
Received: by mx.zohomail.com with SMTPS id 1763104029433118.5268080863134;
	Thu, 13 Nov 2025 23:07:09 -0800 (PST)
Message-ID: <0109a90fc464e3cc63dd6c11e699db0143906256.camel@icenowy.me>
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add
 vout-subsystem IP block
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>,
  Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Maud Spierings <maudspierings@gocontroll.com>, 
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  linux-riscv@lists.infradead.org
Date: Fri, 14 Nov 2025 15:06:55 +0800
In-Reply-To: <20251113-irritable-unfold-da619d52026c@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
	 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
	 <20251111-massager-twistable-1e88f03d82f8@spud>
	 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
	 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
	 <20251112-skating-robust-81be8dee0a8b@spud>
	 <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>
	 <20251113-irritable-unfold-da619d52026c@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_230801_375605_C84A115D 
X-CRM114-Status: GOOD (  30.16  )
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

5ZyoIDIwMjUtMTEtMTPmmJ/mnJ/lm5vnmoQgMTk6NDQgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBUaHUsIE5vdiAxMywgMjAyNSBhdCAwODo0ODozM0FNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjUtMTEtMTLmmJ/mnJ/kuInnmoQgMTg6MzYgKzAwMDDv
vIxDb25vciBEb29sZXnlhpnpgZPvvJoKPiA+ID4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMDI6
MzQ6MzlQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiDlnKggMjAyNS0xMS0x
MeaYn+acn+S6jOeahCAxODozNiArMDAwMO+8jENvbm9yIERvb2xleeWGmemBk++8mgo+ID4gPiA+
ID4gT24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgMDY6MTg6MTZQTSArMDAwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBTYXQsIE5vdiAwOCwgMjAyNSBhdCAwMjowNDozNUFNICsw
MTAwLCBNaWNoYWwgV2lsY3p5bnNraQo+ID4gPiA+ID4gPiB3cm90ZToKPiA+ID4gPiA+ID4gPiBB
ZGQgdGhlIGR0LWJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFN0YXJGaXZlIEpINzExMAo+
ID4gPiA+ID4gPiA+IFZpZGVvCj4gPiA+IAo+ID4gPiA+ID4gPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoKPiA+ID4gPiA+ID4gPiArwqAgIl5kaXNwbGF5QFswLTlhLWZdKyQiOgo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gUGVyc29uYWxseSBJJ2QgbGlrZSB0byBzZWUgdGhlc2UgYmVpbmcgcmVndWxh
ciBwcm9wZXJ0aWVzLAo+ID4gPiA+ID4gPiBzaW5jZQo+ID4gPiA+ID4gPiB0aGVyZSdzCj4gPiA+
ID4gPiA+IGV4YWN0bHkgb25lIHBvc3NpYmxlIHNldHVwIGZvciB0aGlzLgo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiArwqDCoMKgIHR5cGU6IG9iamVjdAo+ID4gPiA+ID4gPiA+ICvCoMKgwqAg
ZGVzY3JpcHRpb246IFZlcmlzaWxpY29uIERDODIwMCBEaXNwbGF5IENvbnRyb2xsZXIKPiA+ID4g
PiA+ID4gPiBub2RlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQ2FuIHlvdSBhZGQgdGhlIHJl
bGV2YW50IHJlZmVyZW5jZXMgaGVyZSBpbnN0ZWFkIG9mCj4gPiA+ID4gPiA+IGFsbG93aW5nCj4g
PiA+ID4gPiA+IGFueQo+ID4gPiA+ID4gPiBvYmplY3Q/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkg
ZG9uJ3QgdGhpbmsgdGhhdCBpZiB5b3UgZGlkLCB0aGlzIHdvdWxkIHBhc3MgdGhlIGJpbmRpbmcK
PiA+ID4gPiA+IGNoZWNrcywKPiA+ID4gPiA+IGJlY2F1c2UgdGhlcmUncyBubyAidmVyaXNpbGlj
b24sZGMiIGJpbmRpbmcuIEkgdGhpbmsgSSBzYXcKPiA+ID4gPiA+IG9uZSBpbgo+ID4gPiA+ID4g
cHJvZ3Jlc3MsIGJ1dCB3aXRob3V0IHRoZSBzb2Mtc3BlY2lmaWMgY29tcGF0aWJsZSB0aGF0IEkg
YW0KPiA+ID4gPiA+IGdvaW5nCj4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gcmVxdWlyZSBoZXJlIC0g
aWYgZm9yIG5vIHJlYXNvbiBvdGhlciB0aGFuIG1ha2luZyBzdXJlIHRoYXQKPiA+ID4gPiA+IHRo
ZQo+ID4gPiA+ID4gY2xvY2tzCj4gPiA+ID4gPiBldGMgYXJlIHByb3ZpZGVkIGNvcnJlY3RseSBm
b3IgdGhpcyBkZXZpY2UuCj4gPiA+ID4gCj4gPiA+ID4gV2VsbCBJIGRpZG4ndCBzcGVjaWZ5IGFu
eSBzb2Mtc3BlY2lmaWMgY29tcGF0aWJsZSBiZWNhdXNlIHRoYXQKPiA+ID4gPiBJUAo+ID4gPiA+
IGhhcwo+ID4gPiA+IGl0cyBvd24gaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJzLgo+ID4gPiAKPiA+
ID4gSSBzdGlsbCByZXF1aXJlIG9uZSBiZWNhdXNlIEkgd2FudCB0byBtYWtlIHN1cmUgdGhhdCBj
bG9ja3MgZXRjCj4gPiA+IGFyZQo+ID4gPiBoYW5kbGVkIGNvcnJlY3RseS4gWW91IGNhbiBpZ25v
cmUgaXQgaW4gdGhlIGRyaXZlciBpZiB5b3Ugd2lzaCwKPiA+ID4gYnV0Cj4gPiA+IHdoZW4KPiA+
ID4gdGhlIG5leHQgdXNlciBjb21lcyBhbG9uZyB3aXRoIG9uZSBtb3JlIG9yIGxlc3MgY2xvY2ss
IEkgd2FudCB0aGUKPiA+ID4gamg3MTEwIG9uZSB0byBiZSBmb3JjZWQgdG8gdXNlIHRoZSBjb3Jy
ZWN0IGNvbmZpZ3VyYXRpb24uCj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgZm9yIHRob3NlIGdlbmVy
aWMgSVBzIHJlcXVpcmluZyBhIFNvQy1zcGVjaWZpYwo+ID4gY29tcGF0aWJsZQo+ID4gaXMgYSBn
b29kIGlkZWEuCj4gCj4gSSBkaXNhZ3JlZS4gSWYgdGhpbmdzIGFyZSBjb21wbGV4IGVub3VnaCB0
byBlbmQgdXAgd2l0aCBkaWZmZXJlbnQKPiBudW1iZXJzIG9mIGNsb2NrcyBvciBwb3dlci1kb21h
aW5zIGV0YyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zICh3aGljaAo+IEkKPiBiZWxpZXZlIEdQVXMg
YXJlKSB0aGVuIEkgd2FudCBvbmUgZm9yIHZhbGlkYXRpb24gcHVycG9zZXMgb24KPiBwbGF0Zm9y
bXMgSQo+IGNhcmUgYWJvdXQuIFdoYXQgeW91IGRvIGluIHRoZSBkcml2ZXIgaXMgdXAgdG8geW91
LgoKV2VsbCBJIHRoaW5rIFZpdmFudGUgR1BVcyBkbyBoYXZlIHN1Y2ggY2FzZSAtLSBhICJzaGFk
ZXIiIGNsb2NrIHRoYXQgaXMKb25seSBwcmVzZW50IHdoZW4gM0Qgc3VwcG9ydCBpcyBoZXJlLiBC
dXQgdGhhdCBiaW5kaW5nIHN0aWxsIGNvbnRhaW5zCm9ubHkgInZpdmFudGUsZ2MiIGFuZCB0aGUg
bWFpbnRhaW5lciBvZiBldG5hdml2IHJlamVjdHMgZXh0cmEKY29tcGF0aWJsZSBzdHJpbmdzLgoK
SW4gYWRkaXRpb24sIGFzIHRoZSBhZGRpdGlvbiBvZiBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBz
dHJpbmcgYW5kIHRoZQpyZWFsIERUIGFyZSB1c3VhbGx5IHdyaXR0ZW4gYnkgdGhlIHNhbWUgcGVy
c29uIGF0IHRoZSBzYW1lIHRpbWUsIEkKZG9uJ3QgdGhpbmsgdGhpcyBpbnRyb2R1Y2VzIGFueSBt
b3JlIHZhbGlkYXRpb24gKGJlY2F1c2Ugd2hlbiB0aGUKYXV0aG9yIGdldHMgdGhpbmdzIHdyb25n
IHRoZXkgd2lsbCBqdXN0IG1ha2UgaXQgd3JvbmcgYXQgdGhlIHR3bwpwbGFjZXMpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
