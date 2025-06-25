Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36CFC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tf37R4/pxYIAN0tF9JUQbBhN1+fUo8lFsyuJbXBwgtU=; b=pMcol08GsdE5qk
	nDMhynqruncWDoGJaSFxW/cmveLu0eLfp+0DrRSoP6MjwqkGRzV4rz6z2WySVnqYIhN4/0BUrRx/w
	x87yXut3WNC1Vv35n2MMBie2+Qczm4tWzzK65hTRFEUmgJ/NAmNvZ4ShaE6ycOSdD+++UmLJslXhB
	HcQivH4cSvydpWbEZh8BArIuBrwnyiEIn2rxID30TjwWRw7oXcR4078oJApCuu3y2oxeDjWlc55Cg
	MrAxoCnrN6yvPTtD1RzhtNGfnVW0RsT8JG8JIlIdAg+wSiLoSkPXfzOO5piixlSOnCdXrpiNZ8LcF
	mY9mXhWGI862gON93WKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrg-00000009ZGO-2Isf;
	Wed, 25 Jun 2025 18:28:56 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQxq-00000008w4H-1P3x
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:19:04 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250625141856euoutp0105dd6f311eb6a7efbfd1f5d144d1aa9e~MTu1eOqvu2451724517euoutp01C
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 14:18:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250625141856euoutp0105dd6f311eb6a7efbfd1f5d144d1aa9e~MTu1eOqvu2451724517euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750861136;
	bh=wR56TfR1MrnOoOQITo0mciNv5ZtTtuKRzNtl8gwqSX0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XcHRTdLbKaso4zpzre+8DiVdHGUTcpphgnhci53QhO8NFzmo6rnu3exvXs4th0k3A
	 hG4UDIWlxuHq7ZNMwBUBQYgQtby9/ZitRt1E+J1/OSBVfiEXv7uHS6r2dg7IwcL7xv
	 xydJN8aAc97HLGY2fRlTUjg0fmvScczh2GOoleQE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625141855eucas1p2d817ba3aa087d78130ac2fa293d18ba0~MTu0wMw5m0434904349eucas1p2z;
	Wed, 25 Jun 2025 14:18:55 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625141854eusmtip271ddb5cec99f21f63cc1bf8c27cf6418~MTuzjrIvR0996109961eusmtip2H;
	Wed, 25 Jun 2025 14:18:54 +0000 (GMT)
Message-ID: <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
Date: Wed, 25 Jun 2025 16:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Matt Coster
	<Matt.Coster@imgtec.com>
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
In-Reply-To: <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
X-CMS-MailID: 20250625141855eucas1p2d817ba3aa087d78130ac2fa293d18ba0
X-Msg-Generator: CA
X-RootMTR: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
X-EPHeader: CA
X-CMS-RootMailID: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
	<20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
	<9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
	<d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
	<e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_071902_631566_C3230A03 
X-CRM114-Status: GOOD (  25.82  )
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

CgpPbiA2LzI1LzI1IDE1OjU1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDI1LzA2
LzIwMjUgMTQ6NDUsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+Pgo+Pgo+PiBPbiA2LzI0LzI1
IDE1OjUzLCBNYXR0IENvc3RlciB3cm90ZToKPj4+IE9uIDIzLzA2LzIwMjUgMTI6NDIsIE1pY2hh
bCBXaWxjenluc2tpIHdyb3RlOgo+Pj4+IFVwZGF0ZSB0aGUgaW1nLHBvd2VydnItcm9ndWUueWFt
bCB0byBpbmNsdWRlIHRoZSBULUhFQUQgVEgxNTIwIFNvQydzCj4+Pj4gc3BlY2lmaWMgR1BVIGNv
bXBhdGlibGUgc3RyaW5nLgo+Pj4+Cj4+Pj4gVGhlIHRoZWFkLHRoMTUyMC1ncHUgY29tcGF0aWJs
ZSwgYWxvbmcgd2l0aCBpdHMgZnVsbCBjaGFpbgo+Pj4+IGltZyxpbWctYnhtLTQtNjQsIGFuZCBp
bWcsaW1nLXJvZ3VlLCBpcyBhZGRlZCB0byB0aGUKPj4+PiBsaXN0IG9mIHJlY29nbml6ZWQgR1BV
IHR5cGVzLgo+Pj4+Cj4+Pj4gVGhlIHBvd2VyLWRvbWFpbnMgcHJvcGVydHkgcmVxdWlyZW1lbnQg
Zm9yIGltZyxpbWctYnhtLTQtNjQgaXMgYWxzbwo+Pj4+IGVuc3VyZWQgYnkgYWRkaW5nIGl0IHRv
IHRoZSByZWxldmFudCBhbGxPZiBjb25kaXRpb24uCj4+Pj4KPj4+PiBBY2tlZC1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+Pj4+IFJldmll
d2VkLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KPj4+PiBSZXZpZXdl
ZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3Jn
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ft
c3VuZy5jb20+Cj4+Pj4gLS0tCj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCB8IDkgKysrKysrKystCj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJv
Z3VlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dl
cnZyLXJvZ3VlLnlhbWwKPj4+PiBpbmRleCA0NDUwZTJlNzNiM2NjZjc0ZDI5ZjBlMzFlMmU2Njg3
ZDdjYmU1ZDY1Li45YjI0MWEwYzFmNTk0MWRjNThhMWUyMzk3MGY2ZDM3NzNkNDI3YzIyIDEwMDY0
NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBv
d2VydnItcm9ndWUueWFtbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbAo+Pj4+IEBAIC0yMSw2ICsyMSwxMSBAQCBw
cm9wZXJ0aWVzOgo+Pj4+ICAgICAgICAgICAgIyB3b3JrIHdpdGggbmV3ZXIgZHRzLgo+Pj4+ICAg
ICAgICAgICAgLSBjb25zdDogaW1nLGltZy1heGUKPj4+PiAgICAgICAgICAgIC0gY29uc3Q6IGlt
ZyxpbWctcm9ndWUKPj4+PiArICAgICAgLSBpdGVtczoKPj4+PiArICAgICAgICAgIC0gZW51bToK
Pj4+PiArICAgICAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1ncHUKPj4+PiArICAgICAgICAgIC0g
Y29uc3Q6IGltZyxpbWctYnhtLTQtNjQKPj4+PiArICAgICAgICAgIC0gY29uc3Q6IGltZyxpbWct
cm9ndWUKPj4+PiAgICAgICAgLSBpdGVtczoKPj4+PiAgICAgICAgICAgIC0gZW51bToKPj4+PiAg
ICAgICAgICAgICAgICAtIHRpLGo3MjFzMi1ncHUKPj4+PiBAQCAtOTMsNyArOTgsOSBAQCBhbGxP
ZjoKPj4+PiAgICAgICAgcHJvcGVydGllczoKPj4+PiAgICAgICAgICBjb21wYXRpYmxlOgo+Pj4+
ICAgICAgICAgICAgY29udGFpbnM6Cj4+Pj4gLSAgICAgICAgICAgIGNvbnN0OiBpbWcsaW1nLWF4
ZS0xLTE2bQo+Pj4+ICsgICAgICAgICAgICBlbnVtOgo+Pj4+ICsgICAgICAgICAgICAgIC0gaW1n
LGltZy1heGUtMS0xNm0KPj4+PiArICAgICAgICAgICAgICAtIGltZyxpbWctYnhtLTQtNjQKPj4+
Cj4+PiBUaGlzIGlzbid0IHJpZ2h0IOKAkyBCWE0tNC02NCBoYXMgdHdvIHBvd2VyIGRvbWFpbnMg
bGlrZSBCWFMtNC02NC4gSSBkb24ndAo+Pj4gcmVhbGx5IGtub3cgd2hhdCB0aGUgcmlnaHQgd2F5
IHRvIGhhbmRsZSB0aGF0IGluIGRldmljZXRyZWUgaXMgZ2l2ZW4gdGhlCj4+PiBUSDE1MjAgYXBw
ZWFycyB0byBleHBvc2Ugb25seSBhIHRvcC1sZXZlbCBkb21haW4gZm9yIHRoZSBlbnRpcmUgR1BV
LCBidXQKPj4+IHRoZXJlIGFyZSBkZWZpbml0ZWx5IHR3byBzZXBhcmF0ZSBkb21haW5zIHVuZGVy
bmVhdGggdGhhdCBhcyBmYXIgYXMgdGhlCj4+PiBHUFUgaXMgY29uY2VybmVkIChzZWUgdGhlIGF0
dGFjaGVkIHNuaXBwZXQgZnJvbSBpbnRlZ3JhdGlvbiBndWlkZSkuCj4+Pgo+Pj4gU2luY2UgcG93
ZXIgbm9kZXMgYXJlIHJlZi1jb3VudGVkIGFueXdheSwgZG8gd2UganVzdCB1c2UgdGhlIHNhbWUg
bm9kZQo+Pj4gZm9yIGJvdGggZG9tYWlucyBhbmQgbGV0IHRoZSBkcml2ZXIgdXAvZG93bi1jb3Vu
dCBpdCB0d2ljZT8KPj4KPj4gSGkgTWF0dCwKPj4KPj4gVGhhbmtzIGZvciB0aGUgdmVyeSBoZWxw
ZnVsIGluc2lnaHQuIFRoYXQncyBhIGdyZWF0IHBvaW50LCBpdCBzZWVtcyB0aGUKPj4gU29DJ3Mg
ZGVzaWduIHByZXNlbnRzIGEgdHJpY2t5IGNhc2UgZm9yIHRoZSBiaW5kaW5ncy4KPj4KPj4gSSBz
ZWUgd2hhdCB5b3UgbWVhbiBhYm91dCBwb3RlbnRpYWxseSB1c2luZyB0aGUgc2FtZSBwb3dlciBk
b21haW4gbm9kZQo+PiB0d2ljZS4gTXkgb25seSBoZXNpdGF0aW9uIGlzIHRoYXQgaXQgbWlnaHQg
YmUgYSBiaXQgdW5jbGVhciBmb3Igc29tZW9uZQo+PiByZWFkaW5nIHRoZSBkZXZpY2V0cmVlIGxh
dGVyLiBQZXJoYXBzIGFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIHJlbGF4Cj4+IHRoZSBjb25z
dHJhaW50IGZvciB0aGlzIGNvbXBhdGlibGU/Cj4+Cj4+IEtyenlzenRvZiwgd2UnZCBiZSBncmF0
ZWZ1bCBmb3IgeW91ciB0aG91Z2h0cyBvbiBob3cgdG8gYmVzdCBtb2RlbCB0aGlzCj4+IHNpdHVh
dGlvbi4KPiAKPiAKPiBJdCdzIHlvdXIgaGFyZHdhcmUsIHlvdSBzaG91bGQgdGVsbCB1cywgbm90
IG1lLiBJIGRvbid0IGtub3cgaG93IG1hbnkKPiBwb3dlciBkb21haW5zIHlvdSBoYXZlIHRoZXJl
LCBidXQgZm9yIHN1cmUgaXQgaXMgbm90IG9uZSBBTkQgdHdvIGRvbWFpbnMKPiB0aGUgc2FtZSB0
aW1lLiBJdCBpcyBlaXRoZXIgb25lIG9yIHR3bywgYmVjYXVzZSBwb3dlciBkb21haW5zIGFyZSBu
b3QKPiB0aGUgc2FtZSBhcyByZWd1bGF0b3Igc3VwcGxpZXMuCgpIaSBLcnp5c3p0b2YsIE1hdHQs
CgpUaGUgaW1nLGJ4bS00LTY0IEdQVSBJUCBpdHNlbGYgaXMgZGVzaWduZWQgd2l0aCB0d28gc2Vw
YXJhdGUgcG93ZXIKZG9tYWlucy4gVGhlIFRIMTUyMCBTb0MsIHdoaWNoIGludGVncmF0ZXMgdGhp
cyBHUFUsIHdpcmVzIGJvdGggb2YgdGhlc2UKdG8gYSBzaW5nbGUgT1MgY29udHJvbGxhYmxlIHBv
d2VyIGdhdGUgKGNvbnRyb2xsZWQgdmlhIG1haWxib3ggYW5kIEU5MDIKY28tcHJvY2Vzc29yKS4K
ClRoaXMgbWVhbnMgYSBkZXZpY2V0cmVlIGZvciB0aGUgVEgxNTIwIGNhbiBvbmx5IGV2ZXIgcHJv
dmlkZSBvbmUgcG93ZXIKZG9tYWluIGZvciB0aGUgR1BVLiBIb3dldmVyLCBhIGdlbmVyaWMgYmlu
ZGluZyBmb3IgaW1nLGJ4bS00LTY0IHNob3VsZAphY2NvdW50IGZvciBhIGZ1dHVyZSBTb0MgdGhh
dCBtaWdodCBpbXBsZW1lbnQgYm90aCBwb3dlciBkb21haW5zLgoKVGhhdCdzIHdoeSBJIHByb3Bv
c2VkIHRvIHJlbGF4IHRoZSBjb25zdHJhaW50cyBvbiB0aGUgaW1nLGJteC00LTY0IEdQVS4KClRo
aXMgbWFrZXMgdGhlIGJpbmRpbmcgYWNjdXJhdGVseSByZXByZXNlbnQgdGhlIEdQVSdzIGZ1bGwg
Y2FwYWJpbGl0aWVzCndoaWxlIHJlbWFpbmluZyBjb21wYXRpYmxlIHdpdGggU29DcyBsaWtlIHRo
ZSBUSDE1MjAgdGhhdCBoYXZlIGEgbGltaXRlZAppbXBsZW1lbnRhdGlvbi4KCkRvZXMgdGhpcyBz
ZWVtIGxpa2UgdGhlIGNvcnJlY3QgYW5kIHJvYnVzdCBhcHByb2FjaCB0byB5b3U/Cgo+IAo+IEJl
c3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxj
enluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
