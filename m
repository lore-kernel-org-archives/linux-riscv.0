Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA249C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPBsMYV1UrC1n2AE9mQjuK/eyMJTGwwyPNcomWyx+NE=; b=JVTBjE8wWCruv/
	mMBmmaHM7iPQKUYW+A9MPDXJY8lDXqMLhGdA70BVAPWJ6ociTnGdLLNnjV6gzWYt+i/vh+TVY+uOt
	g6uKz3APcrtnhEMYVVINWCmueLntsmbmJ3IZ7jucDaXfsAssFYfqmVswg0sqX12qVIPgQGvz1jqCO
	lWc3OySF3E5jd8He19rH8IyFu1IeuSCJIxL/6+gW+y/Jubs/Qngv6UlPl7XxlZwLnygIQQDDPa3dH
	Z+dymkHrqzBP4LegtJnULgzpXi5hkegs3qV7plqn/w04D5Ny0D8tbC3i2Nmvfc0fx3GlRJFh4YuoN
	xDWfsrDv5b2ZuZy1FWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whora-00000002ZFh-43nh;
	Thu, 09 Jul 2026 13:32:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whorZ-00000002ZET-06Dr
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 13:32:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 098D76137C
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 13:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79381F00AC4
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783603943;
	bh=2tewPeVsAxKBBt/hHzLYO7y76PO1MYevgazh3aupzok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g283wSg4xREH65kKxISY22wUVdxl54rWeKsiKW2RXCvPyegxW2ONGX7hhCLFYdJB5
	 WVgLRkH6a07mp/jtKrDnS68YtSwIhRktV10UFYiiB+xxprgqItF53QbtCZxsxbMkDS
	 JN3E8m04+5O6cGShbbswRsC1Ygrx5joUh3+SK17xr2RJLBDr+I7dnnSidqFxktJKTq
	 6XWPCUD9zTB0RwlWe0RFr9HHkRABXAQnPxPjfI6QH7HkehkPmkn4W5uJSvJTR/xfDR
	 SiHSgpl21xpnSVLy/TblRrj6vW0W/3JcePp5IfUyn5OVZOAWtcTaYX3On5/I0VuioN
	 YK/dOBWElbPVQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b018fe8318so494331e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 06:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrz5W1mujh9gvUkh/EKccQykzSLE3n1mcZIFZkePz/CYiKGTl4KrkfkwM1yfHkIy5XiPnZnAYSiGCElfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPjC+JOGkmenNhctQAErVqYZZKDUcU3gnhf3WETEpzjGBbIbYn
	78sTQQuTQy4iW+HP5Qu5SR5yppPN3snoC+d398Ubxe2NUS2WLgEfbjD4+wDVM2cUkvm5DG5FoHT
	Xy19zZXHoHhjjeW3FFJAGoSZTx+R0ktU=
X-Received: by 2002:a05:6512:64a8:b0:5b0:12cf:ae3f with SMTP id
 2adb3069b0e04-5b012cfb1e8mr1407950e87.31.1783603942165; Thu, 09 Jul 2026
 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
In-Reply-To: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 15:32:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hDK+C+ZJ4YKd0xbyHW+vEot9z-YrivWSrg1ag7Ebx4cA@mail.gmail.com>
X-Gm-Features: AUfX_my3RabqhVkiaUs2JZU-hHXS-RHiCuP5fgE1pk66iBa2OI-yzz3XlXSUIdk
Message-ID: <CAJZ5v0hDK+C+ZJ4YKd0xbyHW+vEot9z-YrivWSrg1ag7Ebx4cA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] irqchip/ACPI: Arm GICv5 IWB ACPI IRQ probe deferral
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Cc: Sunil V L <sunilvl@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCAxMDo0MeKAr0FNIExvcmVuem8gUGllcmFsaXNpIDxscGll
cmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gQXJtIEdJQ3Y1IHN5c3RlbXMsIHRoZSBJ
V0IgKEludGVycnVwdCBXaXJlIEJyaWRnZSkgaGFuZGxlcyB3aXJlZCBpbnRlcnJ1cHRzCj4gYW5k
IGl0IGlzIGluIGNoYXJnZSBvZiB0cmFuc2xhdGluZyBpbnRlcnJ1cHQgd2lyZXMgdG8gR0lDdjUg
SVRTIG1lc3NhZ2VzLgo+Cj4gSW4gQUNQSSBzeXN0ZW1zLCBhbiBJV0IgaXMgYmFja2VkIGJ5IGEg
cGxhdGZvcm0gZGV2aWNlLiBEZXZpY2UgZHJpdmVycyBmb3IKPiBkZXZpY2VzIHdob3NlIElSUXMg
YXJlIHJvdXRlZCB0byBhbiBJV0IgbWlnaHQgcHJvYmUgZWFybGllciB0aGFuIHRoZSBJV0IgZGV2
aWNlCj4gZHJpdmVyLCB3aGljaCBjYW4gcmVzdWx0IGluIGZhaWx1cmVzIGluIHRoYXQgdW50aWwg
dGhlIElXQiBkcml2ZXIgaXMgcHJvYmVkIGFuZAo+IGl0cyBJUlEgZG9tYWluIGlzIGR1bHkgcmVn
aXN0ZXJlZCwgSVJRcyByb3V0ZWQgdG8gaXQgY2Fubm90IGJlIHJlc29sdmVkLgo+Cj4gU29tZSBp
bnRlcnJ1cHQgY29udHJvbGxlcnMgZm9yIHRoZSBSSVNDLVYgYXJjaGl0ZWN0dXJlIHN1ZmZlciBm
cm9tIHRoZSBzYW1lCj4gaXNzdWU7IFJJU0MtViwgaW4gaXRzIEFDUEkgSVJRIGxheWVyIHNvbHZl
ZCB0aGUgcHJvYmxlbSBieSBhdXRvbWF0aWNhbGx5Cj4gY3JlYXRpbmcgZGV2aWNlIGRlcGVuZGVu
Y2llcyB0aGF0IHJlc3VsdCBpbiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXJzIGRyaXZlcnMKPiBi
ZWluZyBwcm9iZWQgYmVmb3JlIGFueSBkZXZpY2UgZHJpdmVyIHdob3NlIGRldmljZXMgSVJRcyBh
cmUgcm91dGVkIHRvIHRoZW0gaXMKPiBwcm9iZWQuCj4KPiBJbnN0ZWFkIG9mIHJlaW52ZW50aW5n
IHRoZSB3aGVlbCwgdGhpcyBzZXJpZXMgbW92ZSB0aGUgYWZvcmVtZW50aW9uZWQgUklTQy1WCj4g
Y29kZSB0byBnZW5lcmljIEFDUEkgSVJRIGhhbmRsaW5nIGNvZGUgKHdoaWxlIGZpeGluZyBzb21l
IGJpdHMgYW5kIHBpZWNlcykgYW5kCj4gaW1wbGVtZW50IEdJQ3Y1IElXQiBBQ1BJIHByb2JlIGRl
ZmVycmFsIG9uIHRvcCBvZiBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNp
IDxscGllcmFsaXNpQGtlcm5lbC5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIEFwcGxp
ZWQgdjMgcmV2aWV3IGNvbW1lbnRzIGFuZCB0YWdzCj4gLSBMaW5rIHRvIHYzOiBodHRwczovL3Bh
dGNoLm1zZ2lkLmxpbmsvMjAyNjA3MDEtZ2ljLXY1LWFjcGktaXdiLXByb2JlLWRlZmVycmFsLXYz
LTAtYzU1NjJjZjBmZTI5QGtlcm5lbC5vcmcKPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBBZGRlZCBz
dHViIHRvIGNsZWFyIEFDUEkgZGV2aWNlIGRlcGVuZGVuY2llcwo+IC0gQWRkZWQgcmV2aWV3IHRh
Z3MKPiAtIFJlYmFzZWQgYWdhaW5zdCB2Ny4yLXJjMQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9w
YXRjaC5tc2dpZC5saW5rLzIwMjYwNjAzLWdpYy12NS1hY3BpLWl3Yi1wcm9iZS1kZWZlcnJhbC12
Mi0wLTIzZmZhMTZiNmViYkBrZXJuZWwub3JnCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gU3BsaXQg
dGhlIHBhdGNoc2V0IGluIHNldmVyYWwgbG9naWMgdW5pdHMgYWNjb3JkaW5nIHRvIHJldmlldwo+
IC0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTA1LWdpYy12NS1h
Y3BpLWl3Yi1wcm9iZS1kZWZlcnJhbC12MS0wLWIzN2I4NTk5ODM2MkBrZXJuZWwub3JnCj4KPiBU
bzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gVG86IExlbiBCcm93
biA8bGVuYkBrZXJuZWwub3JnPgo+IFRvOiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4KPiBUbzogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiBUbzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gVG86IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFs
aXNpQGtlcm5lbC5vcmc+Cj4gVG86IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+
Cj4gVG86IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gVG86IEhhbmp1biBHdW8g
PGd1b2hhbmp1bkBodWF3ZWkuY29tPgo+IFRvOiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBr
ZXJuZWwub3JnPgo+IFRvOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pgo+IFRvOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+IENjOiBsaW51eC1hY3BpQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6ICJS
YWZhZWwgSi4gV3lzb2NraSIgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+IENjOiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsb29uZ2FyY2hAbGlzdHMubGludXguZGV2Cj4KPiAtLS0KPiBM
b3JlbnpvIFBpZXJhbGlzaSAoNyk6Cj4gICAgICAgQUNQSTogQWRkIGFjcGlfZGV2aWNlX2NsZWFy
X2RlcHMoKSBoZWxwZXIgZnVuY3Rpb24KPiAgICAgICBBQ1BJOiBSSVNDLVY6IEZpeCByaXNjdl9h
Y3BpX2lycV9nZXRfZGVwKCkgbG9vcCB0ZXJtaW5hdGlvbgo+ICAgICAgIEFDUEk6IFJJU0MtVjog
Q2hlY2sgYWNwaV9nZXRfaGFuZGxlKCkgc3RhdHVzIGluIHJpc2N2X2FjcGlfYWRkX3BydF9kZXAo
KQo+ICAgICAgIEFDUEk6IFJJU0MtVjogRml4IHJpc2N2X2FjcGlfYWRkX3BydF9kZXAoKSBsb29w
IGhhbmRsaW5nCj4gICAgICAgQUNQSTogaXJxOiBNb3ZlIFJJU0MtViBpbnRlcnJ1cHQgY29udHJv
bGxlcnMgYXV0b2RlcCB0byBBQ1BJIElSUSBjb2RlCj4gICAgICAgQUNQSS9JT1JUOiBJbXBsZW1l
bnQgQUNQSSBpbmZyYXN0cnVjdHVyZSB0byBlbmFibGUgR0lDdjUgSVdCIHByb2JlIGRlZmVycmFs
Cj4gICAgICAgaXJxY2hpcC9naWMtdjU6IEVuYWJsZSBHSUN2NSBJV0IgQUNQSSBwcm9iZSBvcmRl
cmluZyBkZXRlY3Rpb24KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCAgICAgICB8
ICAgMSArCj4gIGRyaXZlcnMvYWNwaS9hcm02NC9pb3J0LmMgICAgICAgICAgIHwgIDIyICsrKyst
Cj4gIGRyaXZlcnMvYWNwaS9pcnEuYyAgICAgICAgICAgICAgICAgIHwgMTcyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMgICAg
ICAgICAgICB8IDE0MSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2Fj
cGkvc2Nhbi5jICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEt
Z2ljLXYzLmMgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl3
Yi5jICAgIHwgICAyICsKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUuYyAgICAgICAgfCAg
MTMgKystCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLmMgICAgICAgICAgIHwgICAyICstCj4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtbG9vbmdhcmNoLWNwdS5jIHwgICAyICstCj4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jICAgIHwgICAzICstCj4gIGluY2x1ZGUvbGludXgvYWNw
aS5oICAgICAgICAgICAgICAgIHwgIDEzICsrLQo+ICBpbmNsdWRlL2xpbnV4L2FjcGlfaW9ydC5o
ICAgICAgICAgICB8ICAgMyArLQo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAyMjMgaW5zZXJ0aW9ucygr
KSwgMTU0IGRlbGV0aW9ucygtKQo+IC0tLQoKQWxsIGFwcGxpZWQgYXMgNy4zIG1hdGVyaWFsLCB0
aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
