Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB9C8300F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6o2OpIvNp7Lj7BftnF59z8V0+rYZpG0i2CBPyeG1Zk=; b=4MIEyhgvj3Hq7G
	z2+7Y11JwGQapTUoWdpQCf/GdUCFr1vdUWbdewbAwoM1JxY6uurNzi4wqtODYvxA01s+qTEcqhnfc
	F3JYjeBRq0hFnGQuBMAuzvfGVLEgT8xqbhifqckK9f+KLOODQLZp8zFMwDDJYEJxSZVKpOAviaQfL
	S52/b+LoDru3qhcAtIuNegrsNCNBmEzHq8k/+Hk3zZYEIaUhMb7ibUW6mNItr67HHgptr03iNDZBW
	iS4P2gkWZPl36zHNqQaD84M544h36zIyGS7ZRMXFjyXAqtnlvtzl6+QAjI+58zJWmdz/SY5aMCkkC
	O3mQwJU+oLLkF6MV733A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU32-00000009T2B-3U8g;
	Wed, 25 Jun 2025 17:36:36 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPVI-00000008fJc-0h9w
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:45:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250625124523euoutp0278fdc748ab736f3afe42a199914508da~MSdJjY2yw2691126911euoutp02G
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 12:45:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250625124523euoutp0278fdc748ab736f3afe42a199914508da~MSdJjY2yw2691126911euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750855523;
	bh=li13uomVIBNy/2kXVMydN0UNjlz7j3CE3FoJs7BtxsE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WnPJvUamiquioaZ6cdfiTIA1RJPVBBRed/gTb61NfY9zxn5QZUq41j7BxlqjoxICP
	 g5YLmDLenLnke7L2prZ0ylrCyngQjzdulyKDaPEIRBx6Hg+izjfspun1deuO7OjtQY
	 SSBEqreBHxqjhIIsv2vv68gIXUwAFqZXmpQwiQ1k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625124522eucas1p20e5ac7f9f29dd397d16647c341b886ce~MSdIqCv4c2367423674eucas1p2m;
	Wed, 25 Jun 2025 12:45:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625124521eusmtip23e10383c21022da7c38afee3b97fd9aa~MSdHo9v8m1900619006eusmtip2m;
	Wed, 25 Jun 2025 12:45:21 +0000 (GMT)
Message-ID: <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
Date: Wed, 25 Jun 2025 14:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Matt Coster <Matt.Coster@imgtec.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
	Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
X-CMS-MailID: 20250625124522eucas1p20e5ac7f9f29dd397d16647c341b886ce
X-Msg-Generator: CA
X-RootMTR: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
X-EPHeader: CA
X-CMS-RootMailID: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
	<20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
	<9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054528_462769_D05D6863 
X-CRM114-Status: GOOD (  23.28  )
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

CgpPbiA2LzI0LzI1IDE1OjUzLCBNYXR0IENvc3RlciB3cm90ZToKPiBPbiAyMy8wNi8yMDI1IDEy
OjQyLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gVXBkYXRlIHRoZSBpbWcscG93ZXJ2ci1y
b2d1ZS55YW1sIHRvIGluY2x1ZGUgdGhlIFQtSEVBRCBUSDE1MjAgU29DJ3MKPj4gc3BlY2lmaWMg
R1BVIGNvbXBhdGlibGUgc3RyaW5nLgo+Pgo+PiBUaGUgdGhlYWQsdGgxNTIwLWdwdSBjb21wYXRp
YmxlLCBhbG9uZyB3aXRoIGl0cyBmdWxsIGNoYWluCj4+IGltZyxpbWctYnhtLTQtNjQsIGFuZCBp
bWcsaW1nLXJvZ3VlLCBpcyBhZGRlZCB0byB0aGUKPj4gbGlzdCBvZiByZWNvZ25pemVkIEdQVSB0
eXBlcy4KPj4KPj4gVGhlIHBvd2VyLWRvbWFpbnMgcHJvcGVydHkgcmVxdWlyZW1lbnQgZm9yIGlt
ZyxpbWctYnhtLTQtNjQgaXMgYWxzbwo+PiBlbnN1cmVkIGJ5IGFkZGluZyBpdCB0byB0aGUgcmVs
ZXZhbnQgYWxsT2YgY29uZGl0aW9uLgo+Pgo+PiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiBSZXZpZXdlZC1ieTogVWxmIEhh
bnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4+IFJldmlld2VkLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+IC0tLQo+
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1
ZS55YW1sIHwgOSArKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbAo+PiBpbmRleCA0NDUw
ZTJlNzNiM2NjZjc0ZDI5ZjBlMzFlMmU2Njg3ZDdjYmU1ZDY1Li45YjI0MWEwYzFmNTk0MWRjNThh
MWUyMzk3MGY2ZDM3NzNkNDI3YzIyIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwKPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sCj4+
IEBAIC0yMSw2ICsyMSwxMSBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAgICAgICMgd29yayB3aXRo
IG5ld2VyIGR0cy4KPj4gICAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLWF4ZQo+PiAgICAgICAg
ICAgIC0gY29uc3Q6IGltZyxpbWctcm9ndWUKPj4gKyAgICAgIC0gaXRlbXM6Cj4+ICsgICAgICAg
ICAgLSBlbnVtOgo+PiArICAgICAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1ncHUKPj4gKyAgICAg
ICAgICAtIGNvbnN0OiBpbWcsaW1nLWJ4bS00LTY0Cj4+ICsgICAgICAgICAgLSBjb25zdDogaW1n
LGltZy1yb2d1ZQo+PiAgICAgICAgLSBpdGVtczoKPj4gICAgICAgICAgICAtIGVudW06Cj4+ICAg
ICAgICAgICAgICAgIC0gdGksajcyMXMyLWdwdQo+PiBAQCAtOTMsNyArOTgsOSBAQCBhbGxPZjoK
Pj4gICAgICAgIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgIGNvbXBhdGlibGU6Cj4+ICAgICAgICAg
ICAgY29udGFpbnM6Cj4+IC0gICAgICAgICAgICBjb25zdDogaW1nLGltZy1heGUtMS0xNm0KPj4g
KyAgICAgICAgICAgIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gaW1nLGltZy1heGUtMS0xNm0K
Pj4gKyAgICAgICAgICAgICAgLSBpbWcsaW1nLWJ4bS00LTY0Cj4gCj4gVGhpcyBpc24ndCByaWdo
dCDigJMgQlhNLTQtNjQgaGFzIHR3byBwb3dlciBkb21haW5zIGxpa2UgQlhTLTQtNjQuIEkgZG9u
J3QKPiByZWFsbHkga25vdyB3aGF0IHRoZSByaWdodCB3YXkgdG8gaGFuZGxlIHRoYXQgaW4gZGV2
aWNldHJlZSBpcyBnaXZlbiB0aGUKPiBUSDE1MjAgYXBwZWFycyB0byBleHBvc2Ugb25seSBhIHRv
cC1sZXZlbCBkb21haW4gZm9yIHRoZSBlbnRpcmUgR1BVLCBidXQKPiB0aGVyZSBhcmUgZGVmaW5p
dGVseSB0d28gc2VwYXJhdGUgZG9tYWlucyB1bmRlcm5lYXRoIHRoYXQgYXMgZmFyIGFzIHRoZQo+
IEdQVSBpcyBjb25jZXJuZWQgKHNlZSB0aGUgYXR0YWNoZWQgc25pcHBldCBmcm9tIGludGVncmF0
aW9uIGd1aWRlKS4KPiAKPiBTaW5jZSBwb3dlciBub2RlcyBhcmUgcmVmLWNvdW50ZWQgYW55d2F5
LCBkbyB3ZSBqdXN0IHVzZSB0aGUgc2FtZSBub2RlCj4gZm9yIGJvdGggZG9tYWlucyBhbmQgbGV0
IHRoZSBkcml2ZXIgdXAvZG93bi1jb3VudCBpdCB0d2ljZT8KCkhpIE1hdHQsCgpUaGFua3MgZm9y
IHRoZSB2ZXJ5IGhlbHBmdWwgaW5zaWdodC4gVGhhdCdzIGEgZ3JlYXQgcG9pbnQsIGl0IHNlZW1z
IHRoZQpTb0MncyBkZXNpZ24gcHJlc2VudHMgYSB0cmlja3kgY2FzZSBmb3IgdGhlIGJpbmRpbmdz
LgoKSSBzZWUgd2hhdCB5b3UgbWVhbiBhYm91dCBwb3RlbnRpYWxseSB1c2luZyB0aGUgc2FtZSBw
b3dlciBkb21haW4gbm9kZQp0d2ljZS4gTXkgb25seSBoZXNpdGF0aW9uIGlzIHRoYXQgaXQgbWln
aHQgYmUgYSBiaXQgdW5jbGVhciBmb3Igc29tZW9uZQpyZWFkaW5nIHRoZSBkZXZpY2V0cmVlIGxh
dGVyLiBQZXJoYXBzIGFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIHJlbGF4CnRoZSBjb25zdHJh
aW50IGZvciB0aGlzIGNvbXBhdGlibGU/CgpLcnp5c3p0b2YsIHdlJ2QgYmUgZ3JhdGVmdWwgZm9y
IHlvdXIgdGhvdWdodHMgb24gaG93IHRvIGJlc3QgbW9kZWwgdGhpcwpzaXR1YXRpb24uCgo+IAo+
IENoZWVycywKPiBNYXR0Cj4gCj4+ICAgICAgdGhlbjoKPj4gICAgICAgIHByb3BlcnRpZXM6Cj4+
ICAgICAgICAgIHBvd2VyLWRvbWFpbnM6Cj4+Cj4gCj4gCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNo
YWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
