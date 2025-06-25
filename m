Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024ECC7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxrQSFxvbpMZ8exVHefwdNInIG8S1D0LxyquTvdaEVQ=; b=mA47qFcvI5KCJC
	WA/iomg0OtZx8ZJ7puxXdd6VLGgmwFsQf7FIZDGRCN7oUANqbzH9GFzOISjSPTZMTN2J9qodCFpMl
	raLBh57WZEQZbP7D+TyN0yOyDiZgVKrHKfAM0Dk/qULBHp830PN9SQNfSOLoWSHVf3Vo+jkiHT53L
	KDXZlWvpemkm56KlHcXTUc1wxgqJ9dvXMVgxWjh7AADlhHP8+CYnx69S6hi8WehUXeroVpoXusUt8
	OIQaLNg17/gAosMMi6XWvrteB+wlSXVYGIOVee+w46UwxWRYxXKZAG2YeI0BW5wffF98D3vuFsaBV
	ptwHy+cOsd9mYs4sQ6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU5J-00000009V39-2Rni;
	Wed, 25 Jun 2025 17:38:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQbJ-00000008sKw-1ar8
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 13:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C3FE60053;
	Wed, 25 Jun 2025 13:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54526C4CEEA;
	Wed, 25 Jun 2025 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750859744;
	bh=XxWOWWhxw8xigKxwJ1qU+4s3SQ5ALV8rKLToNX1dAcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k03tbyXmTIogvpaMs361UqibAIE6LyeuX4i9GNUJxlvmYSiyPmO8XhPCSgvQdicZl
	 Vi+cgqnqrXJk2u2vk3hlJQiGCOkNYeMSZJgEk4B31fXBcyUi+v+mReIH/g/p7YmHrw
	 vWGl06QUqj7xV+5uCms6Rpg4S0UmAI7wa8ubR1GLq9L1ijkWof4hbflUAc0CMZoo5C
	 lSHTtwxM9XAoSj0fRpmr2yrWGbDrTKJBVSizHwdnET0D0g7KSa1Bj6puGK784Cok0i
	 kyg3tkq2PZrBZcOV17yCp/GEj9Ugiq7v57jSRQUu+dKOUR6UL+7eOMTQnX1PVOW9Rp
	 RGRNPT819kauA==
Message-ID: <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
Date: Wed, 25 Jun 2025 15:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Matt Coster <Matt.Coster@imgtec.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
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

T24gMjUvMDYvMjAyNSAxNDo0NSwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
Ni8yNC8yNSAxNTo1MywgTWF0dCBDb3N0ZXIgd3JvdGU6Cj4+IE9uIDIzLzA2LzIwMjUgMTI6NDIs
IE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+Pj4gVXBkYXRlIHRoZSBpbWcscG93ZXJ2ci1yb2d1
ZS55YW1sIHRvIGluY2x1ZGUgdGhlIFQtSEVBRCBUSDE1MjAgU29DJ3MKPj4+IHNwZWNpZmljIEdQ
VSBjb21wYXRpYmxlIHN0cmluZy4KPj4+Cj4+PiBUaGUgdGhlYWQsdGgxNTIwLWdwdSBjb21wYXRp
YmxlLCBhbG9uZyB3aXRoIGl0cyBmdWxsIGNoYWluCj4+PiBpbWcsaW1nLWJ4bS00LTY0LCBhbmQg
aW1nLGltZy1yb2d1ZSwgaXMgYWRkZWQgdG8gdGhlCj4+PiBsaXN0IG9mIHJlY29nbml6ZWQgR1BV
IHR5cGVzLgo+Pj4KPj4+IFRoZSBwb3dlci1kb21haW5zIHByb3BlcnR5IHJlcXVpcmVtZW50IGZv
ciBpbWcsaW1nLWJ4bS00LTY0IGlzIGFsc28KPj4+IGVuc3VyZWQgYnkgYWRkaW5nIGl0IHRvIHRo
ZSByZWxldmFudCBhbGxPZiBjb25kaXRpb24uCj4+Pgo+Pj4gQWNrZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4+IFJldmlld2VkLWJ5
OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29t
Pgo+Pj4gLS0tCj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcs
cG93ZXJ2ci1yb2d1ZS55YW1sIHwgOSArKysrKysrKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFt
bAo+Pj4gaW5kZXggNDQ1MGUyZTczYjNjY2Y3NGQyOWYwZTMxZTJlNjY4N2Q3Y2JlNWQ2NS4uOWIy
NDFhMGMxZjU5NDFkYzU4YTFlMjM5NzBmNmQzNzczZDQyN2MyMiAxMDA2NDQKPj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFt
bAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93
ZXJ2ci1yb2d1ZS55YW1sCj4+PiBAQCAtMjEsNiArMjEsMTEgQEAgcHJvcGVydGllczoKPj4+ICAg
ICAgICAgICAgIyB3b3JrIHdpdGggbmV3ZXIgZHRzLgo+Pj4gICAgICAgICAgICAtIGNvbnN0OiBp
bWcsaW1nLWF4ZQo+Pj4gICAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLXJvZ3VlCj4+PiArICAg
ICAgLSBpdGVtczoKPj4+ICsgICAgICAgICAgLSBlbnVtOgo+Pj4gKyAgICAgICAgICAgICAgLSB0
aGVhZCx0aDE1MjAtZ3B1Cj4+PiArICAgICAgICAgIC0gY29uc3Q6IGltZyxpbWctYnhtLTQtNjQK
Pj4+ICsgICAgICAgICAgLSBjb25zdDogaW1nLGltZy1yb2d1ZQo+Pj4gICAgICAgIC0gaXRlbXM6
Cj4+PiAgICAgICAgICAgIC0gZW51bToKPj4+ICAgICAgICAgICAgICAgIC0gdGksajcyMXMyLWdw
dQo+Pj4gQEAgLTkzLDcgKzk4LDkgQEAgYWxsT2Y6Cj4+PiAgICAgICAgcHJvcGVydGllczoKPj4+
ICAgICAgICAgIGNvbXBhdGlibGU6Cj4+PiAgICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gLSAgICAg
ICAgICAgIGNvbnN0OiBpbWcsaW1nLWF4ZS0xLTE2bQo+Pj4gKyAgICAgICAgICAgIGVudW06Cj4+
PiArICAgICAgICAgICAgICAtIGltZyxpbWctYXhlLTEtMTZtCj4+PiArICAgICAgICAgICAgICAt
IGltZyxpbWctYnhtLTQtNjQKPj4KPj4gVGhpcyBpc24ndCByaWdodCDigJMgQlhNLTQtNjQgaGFz
IHR3byBwb3dlciBkb21haW5zIGxpa2UgQlhTLTQtNjQuIEkgZG9uJ3QKPj4gcmVhbGx5IGtub3cg
d2hhdCB0aGUgcmlnaHQgd2F5IHRvIGhhbmRsZSB0aGF0IGluIGRldmljZXRyZWUgaXMgZ2l2ZW4g
dGhlCj4+IFRIMTUyMCBhcHBlYXJzIHRvIGV4cG9zZSBvbmx5IGEgdG9wLWxldmVsIGRvbWFpbiBm
b3IgdGhlIGVudGlyZSBHUFUsIGJ1dAo+PiB0aGVyZSBhcmUgZGVmaW5pdGVseSB0d28gc2VwYXJh
dGUgZG9tYWlucyB1bmRlcm5lYXRoIHRoYXQgYXMgZmFyIGFzIHRoZQo+PiBHUFUgaXMgY29uY2Vy
bmVkIChzZWUgdGhlIGF0dGFjaGVkIHNuaXBwZXQgZnJvbSBpbnRlZ3JhdGlvbiBndWlkZSkuCj4+
Cj4+IFNpbmNlIHBvd2VyIG5vZGVzIGFyZSByZWYtY291bnRlZCBhbnl3YXksIGRvIHdlIGp1c3Qg
dXNlIHRoZSBzYW1lIG5vZGUKPj4gZm9yIGJvdGggZG9tYWlucyBhbmQgbGV0IHRoZSBkcml2ZXIg
dXAvZG93bi1jb3VudCBpdCB0d2ljZT8KPiAKPiBIaSBNYXR0LAo+IAo+IFRoYW5rcyBmb3IgdGhl
IHZlcnkgaGVscGZ1bCBpbnNpZ2h0LiBUaGF0J3MgYSBncmVhdCBwb2ludCwgaXQgc2VlbXMgdGhl
Cj4gU29DJ3MgZGVzaWduIHByZXNlbnRzIGEgdHJpY2t5IGNhc2UgZm9yIHRoZSBiaW5kaW5ncy4K
PiAKPiBJIHNlZSB3aGF0IHlvdSBtZWFuIGFib3V0IHBvdGVudGlhbGx5IHVzaW5nIHRoZSBzYW1l
IHBvd2VyIGRvbWFpbiBub2RlCj4gdHdpY2UuIE15IG9ubHkgaGVzaXRhdGlvbiBpcyB0aGF0IGl0
IG1pZ2h0IGJlIGEgYml0IHVuY2xlYXIgZm9yIHNvbWVvbmUKPiByZWFkaW5nIHRoZSBkZXZpY2V0
cmVlIGxhdGVyLiBQZXJoYXBzIGFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIHJlbGF4Cj4gdGhl
IGNvbnN0cmFpbnQgZm9yIHRoaXMgY29tcGF0aWJsZT8KPiAKPiBLcnp5c3p0b2YsIHdlJ2QgYmUg
Z3JhdGVmdWwgZm9yIHlvdXIgdGhvdWdodHMgb24gaG93IHRvIGJlc3QgbW9kZWwgdGhpcwo+IHNp
dHVhdGlvbi4KCgpJdCdzIHlvdXIgaGFyZHdhcmUsIHlvdSBzaG91bGQgdGVsbCB1cywgbm90IG1l
LiBJIGRvbid0IGtub3cgaG93IG1hbnkKcG93ZXIgZG9tYWlucyB5b3UgaGF2ZSB0aGVyZSwgYnV0
IGZvciBzdXJlIGl0IGlzIG5vdCBvbmUgQU5EIHR3byBkb21haW5zCnRoZSBzYW1lIHRpbWUuIEl0
IGlzIGVpdGhlciBvbmUgb3IgdHdvLCBiZWNhdXNlIHBvd2VyIGRvbWFpbnMgYXJlIG5vdAp0aGUg
c2FtZSBhcyByZWd1bGF0b3Igc3VwcGxpZXMuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
