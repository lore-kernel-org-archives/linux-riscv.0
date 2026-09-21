Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1476C982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 03:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfXaO/MdD1zGcT6KVyO+Md+RxrdMgnwI0cn09j69P5c=; b=BeVz4+7lvptIGH
	jn+O8YSxY4dzRfxVWpgSJNYsbQZRGr3T2VB8pQOivm7DDRsjt7QwCC5rXcpeT7Pq6rh57e2uPJBCV
	Y5s5tCff0rh9E/CWvvUJX7t5Dc8WpPA7/Par7JX9wToP30Nqa+5LbtOOpZK8cdKHcSh/8mjNpyD0X
	tasuucANGiBhj7JArws+oId/51QzitIaCzZE+90xB3HAXe+aKbFwdIQmZkw9tD7bcbiRwjPnFOPf5
	X7sBYDFFoJQh3RoTuCPo/r4DgBY84op3MnqvX4akRNOocimonbTyeGgtBEcR/ZjBS7jVHJXr39Tcd
	oiD7wZVq7RIZZi9uZZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Uoj-00000000lrh-0WQe;
	Mon, 21 Sep 2026 03:35:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Uoi-00000000lrb-3XzY
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 03:35:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B54EB60258;
	Mon, 21 Sep 2026 03:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9131F00893;
	Mon, 21 Sep 2026 03:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789961743;
	bh=/uc/dy3X3PpC2I1mymMB7hcZN+ZV0xyG3Njd3ZzgLFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LiqM7AiO2IjBtLmcuwiHc0Xis7kACHmYKH3NlI+J0E8skSi1jdzfkMwMBj3fwgFSI
	 ZUodi7bIfq1iHFdWccnIf3ZTZBJRaoxtjseyuhgd0FKbPtF/UBjECFi1B8mHnstAp2
	 lJuGWTJAGPStDQm0ydIJLIIi2ut5rRDbplt/EESN5YYu7qwgEP/Eg7mqxDOUImqvA+
	 FDBRBm7YNkrSRxSzhJ5+KCaq7yTOMKvB8emF4jRjZC6QqBNwRtRldjT+uHYu3s81jU
	 dzUmjMZiyJl7t97QEKuwdrYZmJjnGkoLl7K/b85Zom5A1FJLVfSVKecqCKgdX3GkbK
	 CAEOdFRyCjwxQ==
Date: Mon, 21 Sep 2026 03:35:40 +0000
From: Yixun Lan <dlan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20260921033540-GKG297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <56e5f32102c67575ded8af9e81a06dc9f1dcf0ee.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56e5f32102c67575ded8af9e81a06dc9f1dcf0ee.camel@icenowy.me>
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

SGkgSWNlbm93eSwKCk9uIDIwOjU2IFN1biAyMCBTZXAgICAgICwgSWNlbm93eSBaaGVuZyB3cm90
ZToKPiDlnKggMjAyNi0wOS0xOOS6lOeahCAwMjo0MCArMDAwMO+8jFlpeHVuIExhbuWGmemBk++8
mgo+ID4gwqAgU3BhY2VtaVQncyBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5pdCkgY29uc2lzdCBv
ZiBzZXZlcmFsIHBvd2VyCj4gPiBkb21haW5zCj4gPiB3aGljaCBjYW4gYmUgbWFuYWdlZCBpbmRl
cGVuZGVudGx5LCBkZXBlbmRpbmcgb24gZGlmZmVyZW50Cj4gPiBhcHBsaWNhdGlvbgo+ID4gc2Nl
bmFyaW8sIGVhY2ggZG9tYWluIGNhbiBiZSBwb3dlcmVkIG9uL29mZiBmb3Igc2F2aW5nIHBvd2Vy
Lgo+ID4gCj4gPiDCoCBUaGUgZHJpdmVyIGlzIGltcGxlbWVudGVkIGJhc2VkIG9uIExpbnV4IEdl
bmVyaWMgUE0gRG9tYWluCj4gPiBmcmFtZXdvcmsuCj4gPiBGcm9tIGEgaGFyZHdhcmUgcGVyc3Bl
Y3RpdmUsIGVpdGhlciBvZiB0d28gZGlzdGluY3QgcG93ZXItb24KPiA+IHNlcXVlbmNlcwo+ID4g
YXJlIHN1cHBvcnRlZCwgaW4gc29mdHdhcmUgbW9kZSAoU1cgbW9kZSksIHRoZSBkcml2ZXIgaXMg
cmVzcG9uc2libGUKPiA+IGZvcgo+ID4gY29udHJvbGxpbmcgdGhlIHN0YXRlcyBvZiBiaXRzIHN1
Y2ggYXMgc2xlZXAxLCBzbGVlcDIsIGlzb2xhdGlvbiBhbmQKPiA+IHB3cl9zdGF0ZSwgd2hpbGUg
aW4gaGFyZHdhcmUgbW9kZSAoSFcgbW9kZSksIHRoZSBQTVUgaGFyZHdhcmUgd2lsbAo+ID4gY29t
cGxldGUKPiA+IHRoZSBzZXF1ZW5jZSBhdXRvbWF0aWNhbGx5IHdpdGhvdXQgcmVxdWlyaW5nIHNv
ZnR3YXJlIGludGVydmVudGlvbi4KPiAKPiBUaGlzIGRyaXZlciBpcyB0ZXN0ZWQgdG8gYmUgYWJs
ZSB0byBwb3dlciB1cCB0aGUgR1BVIG9uIFNwYWNlbWlUIEszLAo+IGhvd2V2ZXIgdGhlIGZvbGxv
d2luZyB3YXJuaW5nIGFwcGVhcnMgaW4gdGhlIGtlcm5lbCBsb2c6Cj4gCj4gYGBgCj4gZ2VucGRf
cHJvdmlkZXIgYXVkaW86IEZhaWwgdG8gcG93ZXItb2ZmIGRvbWFpbjogMgo+IGBgYAo+IApUaGlz
IGlzIGtpbmQgb2YgYW4gZXhwZWN0ZWQgaXNzdWUsIGR1ZSB0byBoYXJkd2FyZSBkZXNpZ24sIHRo
ZSBhdWRpbwpwb3dlciBzd2l0Y2ggaXMgY291cGxlZCB3aXRoIHJjcHUgY29yZSwgd2hpY2ggbWVh
bnMgcG93ZXIgb2ZmIGl0IHdpbGwKYWxzbyBzaHV0IGRvd24gdGhlIHJjcHUsIHNvIHRoZSBwb3dl
ciBzd2l0Y2ggY3VycmVudGx5IGlzIGNvbmZpZ3VyZWQKYXMgYWx3YXlzIG9uIGZyb20gc29mdHdh
cmUgcGVyc3BlY3RpdmUsIGl0J3MgdW5hYmxlIHRvIHBvd2VyLW9mZiBldmVuCmluIExpbnV4IG9y
IHJjcHUgb25jZSBzeXN0ZW0gdXAuCgpJIHdpbGwgZHJvcCBhdWRpbyBwb3dlciBkb21haW4gY29u
dHJvbCBpbiBuZXh0IHZlcnNpb24KCj4gKEJUVyBJIGJ1aWx0IGl0IGFzIGEgbW9kdWxlIHRvIHBy
ZXZlbnQgd2hvbGUga2VybmVsIGJlaW5nIHJlYnVpbHQpCj4gCnRoYXQncyBmaW5lCgotLSAKWWl4
dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
