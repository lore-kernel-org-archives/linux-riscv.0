Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8560C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DrHFXadWrOu2a3DfqEsUTgIiB+vnrHjoBVfsDlGUt4=; b=3jyUEU/WH4Hj5j
	Q9o7BIFEu8XQZ26D30si2yl9ABl4BTHkxXMgq/p+1+zSKIUUm80HrNMK6CD2XTJceFWzyOGcrT/cl
	bMl3FlQSpFzu6gHsa3shftOELDGPoJLiHNeCgWjQn00q4rtP1INs2ooDHBk84tXMO2rJMQb9Op5WS
	iV0dsCrLIdxEic8Yj0UqkPwSdYkO0R3nscLGyg64RJqNLujwgwBqDJUnbwBhIdCv8wOj+FpPtvXQO
	9olC5q/+bhxZWVdsPXPhFWBgrqDGbmbVS7eafT6zwm7eCWv2NXTvdQYV/fJkd8X9Y911061j5PSW3
	OrOg8UUOtYbc5ucrwd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUs0-00000009ZiA-2H3t;
	Wed, 25 Jun 2025 18:29:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURJi-0000000902z-2DFR
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C989760010;
	Wed, 25 Jun 2025 14:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CAC4CEEA;
	Wed, 25 Jun 2025 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862497;
	bh=G6puNagQFSMyUjbE+LIXearsZJYWlEPDrvFoYitM1po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RPTkFSpGXwsznlbnK1kUH0xY734FEMB9huWys+Ev9Cd+4RJT8ipohTvGXg1+rNrW2
	 xZXfCYR8VgiqpycgDQJU81jj7xQmtcM7lUCtaXdTKEsFK07SBk0DaA58xdjAtQT/0f
	 ErLdmRUotPrLCgcHkamQUiCRjkBx+tzhoSM6XbZ0szoBmgSrosAW8TAg6NPWKtKGyR
	 7BtssmQmLb903HrvtT6vIoSUszrN5gfh8b46F9KOoPTmVlI1Rg8AbfNLeSEmq4iE5o
	 wyhdS1BfCk4M1YjE+no4eesqtrBibQTlgAk4QmmTo/CGP2ZO4DNpPZontcAgGNLi4O
	 gq/YUuVWNzbWQ==
Message-ID: <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
Date: Wed, 25 Jun 2025 16:41:28 +0200
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
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
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

T24gMjUvMDYvMjAyNSAxNjoxOCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
Ni8yNS8yNSAxNTo1NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjUvMDYvMjAy
NSAxNDo0NSwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDYvMjQvMjUg
MTU6NTMsIE1hdHQgQ29zdGVyIHdyb3RlOgo+Pj4+IE9uIDIzLzA2LzIwMjUgMTI6NDIsIE1pY2hh
bCBXaWxjenluc2tpIHdyb3RlOgo+Pj4+PiBVcGRhdGUgdGhlIGltZyxwb3dlcnZyLXJvZ3VlLnlh
bWwgdG8gaW5jbHVkZSB0aGUgVC1IRUFEIFRIMTUyMCBTb0Mncwo+Pj4+PiBzcGVjaWZpYyBHUFUg
Y29tcGF0aWJsZSBzdHJpbmcuCj4+Pj4+Cj4+Pj4+IFRoZSB0aGVhZCx0aDE1MjAtZ3B1IGNvbXBh
dGlibGUsIGFsb25nIHdpdGggaXRzIGZ1bGwgY2hhaW4KPj4+Pj4gaW1nLGltZy1ieG0tNC02NCwg
YW5kIGltZyxpbWctcm9ndWUsIGlzIGFkZGVkIHRvIHRoZQo+Pj4+PiBsaXN0IG9mIHJlY29nbml6
ZWQgR1BVIHR5cGVzLgo+Pj4+Pgo+Pj4+PiBUaGUgcG93ZXItZG9tYWlucyBwcm9wZXJ0eSByZXF1
aXJlbWVudCBmb3IgaW1nLGltZy1ieG0tNC02NCBpcyBhbHNvCj4+Pj4+IGVuc3VyZWQgYnkgYWRk
aW5nIGl0IHRvIHRoZSByZWxldmFudCBhbGxPZiBjb25kaXRpb24uCj4+Pj4+Cj4+Pj4+IEFja2Vk
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Cj4+Pj4+IFJldmlld2VkLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4K
Pj4+Pj4gUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0u
d2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwgfCA5ICsrKysrKysr
LQo+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sCj4+Pj4+IGluZGV4IDQ0NTBlMmU3M2Iz
Y2NmNzRkMjlmMGUzMWUyZTY2ODdkN2NiZTVkNjUuLjliMjQxYTBjMWY1OTQxZGM1OGExZTIzOTcw
ZjZkMzc3M2Q0MjdjMjIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbAo+Pj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwKPj4+
Pj4gQEAgLTIxLDYgKzIxLDExIEBAIHByb3BlcnRpZXM6Cj4+Pj4+ICAgICAgICAgICAgIyB3b3Jr
IHdpdGggbmV3ZXIgZHRzLgo+Pj4+PiAgICAgICAgICAgIC0gY29uc3Q6IGltZyxpbWctYXhlCj4+
Pj4+ICAgICAgICAgICAgLSBjb25zdDogaW1nLGltZy1yb2d1ZQo+Pj4+PiArICAgICAgLSBpdGVt
czoKPj4+Pj4gKyAgICAgICAgICAtIGVudW06Cj4+Pj4+ICsgICAgICAgICAgICAgIC0gdGhlYWQs
dGgxNTIwLWdwdQo+Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IGltZyxpbWctYnhtLTQtNjQKPj4+
Pj4gKyAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLXJvZ3VlCj4+Pj4+ICAgICAgICAtIGl0ZW1z
Ogo+Pj4+PiAgICAgICAgICAgIC0gZW51bToKPj4+Pj4gICAgICAgICAgICAgICAgLSB0aSxqNzIx
czItZ3B1Cj4+Pj4+IEBAIC05Myw3ICs5OCw5IEBAIGFsbE9mOgo+Pj4+PiAgICAgICAgcHJvcGVy
dGllczoKPj4+Pj4gICAgICAgICAgY29tcGF0aWJsZToKPj4+Pj4gICAgICAgICAgICBjb250YWlu
czoKPj4+Pj4gLSAgICAgICAgICAgIGNvbnN0OiBpbWcsaW1nLWF4ZS0xLTE2bQo+Pj4+PiArICAg
ICAgICAgICAgZW51bToKPj4+Pj4gKyAgICAgICAgICAgICAgLSBpbWcsaW1nLWF4ZS0xLTE2bQo+
Pj4+PiArICAgICAgICAgICAgICAtIGltZyxpbWctYnhtLTQtNjQKPj4+Pgo+Pj4+IFRoaXMgaXNu
J3QgcmlnaHQg4oCTIEJYTS00LTY0IGhhcyB0d28gcG93ZXIgZG9tYWlucyBsaWtlIEJYUy00LTY0
LiBJIGRvbid0Cj4+Pj4gcmVhbGx5IGtub3cgd2hhdCB0aGUgcmlnaHQgd2F5IHRvIGhhbmRsZSB0
aGF0IGluIGRldmljZXRyZWUgaXMgZ2l2ZW4gdGhlCj4+Pj4gVEgxNTIwIGFwcGVhcnMgdG8gZXhw
b3NlIG9ubHkgYSB0b3AtbGV2ZWwgZG9tYWluIGZvciB0aGUgZW50aXJlIEdQVSwgYnV0Cj4+Pj4g
dGhlcmUgYXJlIGRlZmluaXRlbHkgdHdvIHNlcGFyYXRlIGRvbWFpbnMgdW5kZXJuZWF0aCB0aGF0
IGFzIGZhciBhcyB0aGUKPj4+PiBHUFUgaXMgY29uY2VybmVkIChzZWUgdGhlIGF0dGFjaGVkIHNu
aXBwZXQgZnJvbSBpbnRlZ3JhdGlvbiBndWlkZSkuCj4+Pj4KPj4+PiBTaW5jZSBwb3dlciBub2Rl
cyBhcmUgcmVmLWNvdW50ZWQgYW55d2F5LCBkbyB3ZSBqdXN0IHVzZSB0aGUgc2FtZSBub2RlCj4+
Pj4gZm9yIGJvdGggZG9tYWlucyBhbmQgbGV0IHRoZSBkcml2ZXIgdXAvZG93bi1jb3VudCBpdCB0
d2ljZT8KPj4+Cj4+PiBIaSBNYXR0LAo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIHZlcnkgaGVscGZ1
bCBpbnNpZ2h0LiBUaGF0J3MgYSBncmVhdCBwb2ludCwgaXQgc2VlbXMgdGhlCj4+PiBTb0MncyBk
ZXNpZ24gcHJlc2VudHMgYSB0cmlja3kgY2FzZSBmb3IgdGhlIGJpbmRpbmdzLgo+Pj4KPj4+IEkg
c2VlIHdoYXQgeW91IG1lYW4gYWJvdXQgcG90ZW50aWFsbHkgdXNpbmcgdGhlIHNhbWUgcG93ZXIg
ZG9tYWluIG5vZGUKPj4+IHR3aWNlLiBNeSBvbmx5IGhlc2l0YXRpb24gaXMgdGhhdCBpdCBtaWdo
dCBiZSBhIGJpdCB1bmNsZWFyIGZvciBzb21lb25lCj4+PiByZWFkaW5nIHRoZSBkZXZpY2V0cmVl
IGxhdGVyLiBQZXJoYXBzIGFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIHJlbGF4Cj4+PiB0aGUg
Y29uc3RyYWludCBmb3IgdGhpcyBjb21wYXRpYmxlPwo+Pj4KPj4+IEtyenlzenRvZiwgd2UnZCBi
ZSBncmF0ZWZ1bCBmb3IgeW91ciB0aG91Z2h0cyBvbiBob3cgdG8gYmVzdCBtb2RlbCB0aGlzCj4+
PiBzaXR1YXRpb24uCj4+Cj4+Cj4+IEl0J3MgeW91ciBoYXJkd2FyZSwgeW91IHNob3VsZCB0ZWxs
IHVzLCBub3QgbWUuIEkgZG9uJ3Qga25vdyBob3cgbWFueQo+PiBwb3dlciBkb21haW5zIHlvdSBo
YXZlIHRoZXJlLCBidXQgZm9yIHN1cmUgaXQgaXMgbm90IG9uZSBBTkQgdHdvIGRvbWFpbnMKPj4g
dGhlIHNhbWUgdGltZS4gSXQgaXMgZWl0aGVyIG9uZSBvciB0d28sIGJlY2F1c2UgcG93ZXIgZG9t
YWlucyBhcmUgbm90Cj4+IHRoZSBzYW1lIGFzIHJlZ3VsYXRvciBzdXBwbGllcy4KPiAKPiBIaSBL
cnp5c3p0b2YsIE1hdHQsCj4gCj4gVGhlIGltZyxieG0tNC02NCBHUFUgSVAgaXRzZWxmIGlzIGRl
c2lnbmVkIHdpdGggdHdvIHNlcGFyYXRlIHBvd2VyCj4gZG9tYWlucy4gVGhlIFRIMTUyMCBTb0Ms
IHdoaWNoIGludGVncmF0ZXMgdGhpcyBHUFUsIHdpcmVzIGJvdGggb2YgdGhlc2UKPiB0byBhIHNp
bmdsZSBPUyBjb250cm9sbGFibGUgcG93ZXIgZ2F0ZSAoY29udHJvbGxlZCB2aWEgbWFpbGJveCBh
bmQgRTkwMgo+IGNvLXByb2Nlc3NvcikuCgpUaGlzIGhlbHBzLi4uIGFuZCBhbHNvIHNvdW5kcyBh
IGxvdCBsaWtlIHJlZ3VsYXRvciBzdXBwbGllcywgbm90IHBvd2VyCmRvbWFpbnMuIDovCgo+IAo+
IFRoaXMgbWVhbnMgYSBkZXZpY2V0cmVlIGZvciB0aGUgVEgxNTIwIGNhbiBvbmx5IGV2ZXIgcHJv
dmlkZSBvbmUgcG93ZXIKPiBkb21haW4gZm9yIHRoZSBHUFUuIEhvd2V2ZXIsIGEgZ2VuZXJpYyBi
aW5kaW5nIGZvciBpbWcsYnhtLTQtNjQgc2hvdWxkCgpJZiB0aGlzIHdhcyBhIHN1cHBseSwgeW91
IHdvdWxkIGhhdmUgdHdvIHN1cHBsaWVzLiBBbnl3YXkgaW50ZXJuYWwKd2lyaW5ncyBvZiBHUFUg
ZG8gbm90IG1hdHRlciBpbiBzdWNoIGNhc2UgYW5kIG1vcmUgaW1wb3J0YW50IHdoYXQgdGhlClNv
QyBoYXMgd2lyZWQuIEFuZCBpdCBoYXMgb25lIHBvd2VyIGRvbWFpbi4KCgo+IGFjY291bnQgZm9y
IGEgZnV0dXJlIFNvQyB0aGF0IG1pZ2h0IGltcGxlbWVudCBib3RoIHBvd2VyIGRvbWFpbnMuCj4g
Cj4gVGhhdCdzIHdoeSBJIHByb3Bvc2VkIHRvIHJlbGF4IHRoZSBjb25zdHJhaW50cyBvbiB0aGUg
aW1nLGJteC00LTY0IEdQVS4KClRoaXMgc2hvdWxkIGJlIGNvbnN0cmFpbmVkIHBlciBlYWNoIGRl
dmljZSwgc28gMSBmb3IgeW91IGFuZCAyIGZvcgpldmVyeW9uZSBlbHNlLgoKQmVzdCByZWdhcmRz
LApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
