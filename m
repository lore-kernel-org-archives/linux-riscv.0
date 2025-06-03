Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC3C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVCPbCX4DYJhpX1pdQfL9q40VLgpkADfH/ZeoBsm4dQ=; b=b5QV+XyvZSni2m
	U4McnElbSqF+8MtxLB3dNBXcbwQ25ZP3hMOIxauL9YtxrD4UWBDP4J3Re+Ildbxm5KWhgPGgzvI+C
	+IAVPRlP8R/yLoX2eW24rJbH2nn04S5XKBTy2yJ1uFDVZOzB64d7RigYKvLL//bXppqr2wHKDdfQ6
	dT9wGgf4mQ8a7hD9B8nZyjuxNh6yqvcJKqTSazgQjV8kFxlbn/zBESzfwpjjS2xOWtPlkhgcvF5G4
	YVqe0IQyu4peAxZ2QP0voq+lAnFzYZui1uF4YK2bKKvuqjgycl0KVR1jRZEDgaMjleRTjDdOx4QJJ
	k74fqvZwqOf7L35s+uDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWJO-0000000BaMS-1JHd;
	Tue, 03 Jun 2025 18:24:34 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWJL-0000000BaLp-2Dti
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 18:24:33 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250603182423euoutp02206ca4547e2ec1adafe5ba76a7a53d7d~Fm42vhBba2247522475euoutp02E
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jun 2025 18:24:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250603182423euoutp02206ca4547e2ec1adafe5ba76a7a53d7d~Fm42vhBba2247522475euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748975063;
	bh=I9e3KbPtuQdRh0VtmLF9WESqN+R+XWureDH0vUnXmdY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=iA4GzKnxiptjW+b/gwD83/vaXDnS0BlmGhU25+HOeOiLKCxrlX8d1BxK9WER4GC3B
	 6DPsPN2nPW5R2O9C1+1So29mPkgm22F51lh8gYNCuyiWZwsSapVdKPBvYcHHaSOmCz
	 dwBmZEzawEh4QASOWQCko4G60TRSRYP5wZOiGLcg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250603182421eucas1p2351055ed90656b28b876b1c4a6dc94cb~Fm41kpyHs1113611136eucas1p2N;
	Tue,  3 Jun 2025 18:24:21 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250603182420eusmtip20472ecd551d9e7a1c5da71b8f1a864c1~Fm40lvNhj2610326103eusmtip2W;
	Tue,  3 Jun 2025 18:24:20 +0000 (GMT)
Message-ID: <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
Date: Tue, 3 Jun 2025 20:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
	<krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
X-CMS-MailID: 20250603182421eucas1p2351055ed90656b28b876b1c4a6dc94cb
X-Msg-Generator: CA
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
	<CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
	<4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
	<20250603-cuddly-certain-mussel-4fbe96@kuoka>
	<CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_112432_159898_443B9CBF 
X-CRM114-Status: GOOD (  22.95  )
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

CgpPbiA2LzMvMjUgMTU6MzUsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gT24gVHVlLCBK
dW4gMywgMjAyNSBhdCAzOjE54oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPiB3cm90ZToKPj4KPj4gT24gTW9uLCBKdW4gMDIsIDIwMjUgYXQgMTA6Mjk6MTNQTSBHTVQs
IE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+Pj4+PiArZGVzY3JpcHRpb246IHwKPj4+Pj4gKyAg
VGhpcyBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgcG93ZXIgc2VxdWVuY2VyIGZvciB0aGUgVC1IRUFE
IFRIMTUyMCBHUFUuCj4+Pj4+ICsgIFRoaXMgc2VxdWVuY2VyIGhhbmRsZXMgdGhlIHNwZWNpZmlj
IHBvd2VyLXVwIGFuZCBwb3dlci1kb3duIHNlcXVlbmNlcwo+Pj4+PiArICByZXF1aXJlZCBieSB0
aGUgR1BVLCBpbmNsdWRpbmcgbWFuYWdpbmcgY2xvY2tzIGFuZCByZXNldHMgZnJvbSBib3RoIHRo
ZQo+Pj4+PiArICBzZXF1ZW5jZXIgYW5kIHRoZSBHUFUgZGV2aWNlIGl0c2VsZi4KPj4+Pj4gKwo+
Pj4+PiArcHJvcGVydGllczoKPj4+Pj4gKyAgY29tcGF0aWJsZToKPj4+Pj4gKyAgICBjb25zdDog
dGhlYWQsdGgxNTIwLWdwdS1wd3JzZXEKPj4+Pj4gKwo+Pj4+Cj4+Pj4gQmVmb3JlIEkgcmV2aWV3
IHRoZSByZXN0OiBpcyB0aGlzIGFjdHVhbGx5IGEgcGh5c2ljYWwgZGV2aWNlIHRoYXQKPj4+PiB0
YWtlcyBjYXJlIG9mIHRoZSBwb3dlciBzZXF1ZW5jaW5nPyBTb21lIGtpbmQgb2YgYSBwb3dlciBt
YW5hZ2VtZW50Cj4+Pj4gdW5pdCBmb3IgdGhlIEdQVT8gSWYgc28sIEkgYmV0IGl0J3Mgbm90IGNh
bGxlZCAicG93ZXIgc2VxdWVuY2VyIiBzbwo+Pj4+IGxldCdzIHVzZSBpdHMgYWN0dWFsIG5hbWUg
YXMgcGVyIHRoZSBkYXRhc2hlZXQ/Cj4+Pgo+Pj4gSGkgQmFydCwKPj4+IFRoYW5rcyBmb3IgeW91
ciBmZWVkYmFjay4KPj4+Cj4+PiBUaGUgaGFyZHdhcmUgYmxvY2sgcmVzcG9uc2libGUgZm9yIHBv
d2VyaW5nIHVwIHRoZSBjb21wb25lbnRzIGluIHRoZQo+Pj4gVEgxNTIwIFNvQyBkYXRhc2hlZXQg
aXMgY2FsbGVkIEFPTiAoQWx3YXlzIE9uKS4gSG93ZXZlciwgd2UgYWxyZWFkeSBoYXZlCj4+PiBh
IERUIG5vZGUgbmFtZWQgYW9uIHRoYXQgc2VydmVzIGFzIGEgcG93ZXIgZG9tYWluIHByb3ZpZGVy
Cj4+PiAoRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRo
MTUyMC1hb24ueWFtbCkuCj4+Cj4+IFNvIG5vLiBPbmUgZGV2aWNlLCBvbmUgZGV2aWNlIG5vZGUg
KHNvbWV0aW1lcyB3aXRoIGNpbGRyZW4gbm9kZXMpLiBZb3UKPj4gZG8gbm90IGdldCBhbm90aGVy
IGRldmljZSBub2RlIGp1c3QgYmVjYXVzZSBzb21lb25lIHdyb3RlIGluY29tcGxldGUKPj4gYmlu
ZGluZyBvciBiZWNhdXNlIGRyaXZlciBsb29rcyBkaWZmZXJlbnRseS4KClRoZSBjaGlsZCBvcHRp
b24gY291bGQgcG90ZW50aWFsbHkgYmUgYW4gb3B0aW9uIGhlcmUsIGFzIGl0IHdvdWxkIG1ha2UK
c29tZSBzZW5zZSwgYXQgbGVhc3QgZm9yIG1lIC0gc2luY2UgdGhlIGNoaWxkIHB3cnNlcSBEVCBu
b2RlIHdvdWxkCmRlc2NyaWJlIHBhcnQgb2YgdGhlIEFPTiBibG9jay4KCj4+Cj4+Pgo+Pj4gRm9s
bG93aW5nIHRoZSBkaXNjdXNzaW9uIFsxXSBhYm91dCBuZWVkaW5nIGEgc2VwYXJhdGUgRFQgbm9k
ZSBmb3IgdGhlCj4+PiBwb3dlciBzZXF1ZW5jaW5nIGNhcGFiaWxpdGllcyBvZiB0aGlzIEFPTiBi
bG9jaywgYW5kIHRoaW5raW5nIGZ1cnRoZXIKPj4+IGFib3V0IGl0LCBJIHRoaW5rIHRoZSBiaW5k
aW5nIHNob3VsZCBiZSBtb3JlIGdlbmVyaWMuIFRoZSBBT04gYmxvY2sgY2FuCj4+PiBtYW5hZ2Ug
cG93ZXIgc2VxdWVuY2VzIGZvciBtb3JlIHRoYW4ganVzdCB0aGUgR1BVIChlLmcuIE5QVSwgQVVE
SU8sCj4+PiBEU1ApLgo+Pj4KPj4+IFRoZSBjb21wYXRpYmxlIHN0cmluZyBjb3VsZCBiZSB1cGRh
dGVkIGxpa2Ugc286Cj4+PiAidGhlYWQsdGgxNTIwLWFvbi1wd3JzZXEiCj4+Cj4+IFNob3VsZCBu
b3QgYmUgc2VwYXJhdGUgbm9kZSwgeW91IGFscmVhZHkgaGF2ZSBvbmUgZm9yIEFPTi4KPj4KPiAK
PiBBZ3JlZWQuIEFuZCBhcyBmYXIgYXMgaW1wbGVtZW50YXRpb24gZ29lcywgeW91IGNhbiBoYXZl
IHRoZSBzYW1lCj4gZHJpdmVyIGJlIGEgUE0gZG9tYWluIEFORCBwd3JzZXEgcHJvdmlkZXIuIEl0
IGp1c3QgaGFzIHRvIGJpbmQgdG8gdGhlCj4gZGV2aWNlIG5vZGUgdGhhdCByZXByZXNlbnRzIGFu
IGFjdHVhbCBjb21wb25lbnQsIG5vdCBhIG1hZGUtdXAKPiAiY29udmVuaWVuY2UiIG5vZGUuCgpT
dXJlIC0gdGhpcyBjYW4gYmUgZG9uZSB1c2luZyBleGlzdGluZyBBT04gbm9kZS4KClRvIGtlZXAg
dGhlIHB3cnNlcSBjb2RlIG9yZ2FuaXplZCBpbiBkcml2ZXJzL3Bvd2VyL3NlcXVlbmNpbmcvLCBh
CnNpbWlsYXIgYXBwcm9hY2ggdG8gb3VyIHRoMTUyMC1wZCBkcml2ZXIgaW50ZXJmYWNpbmcgd2l0
aCB0aGUgQU9OCmZpcm13YXJlIGxpYnJhcnkgKGRyaXZlcnMvZmlybXdhcmUvdGhlYWQsdGgxNTIw
LWFvbi5jKSBjb3VsZCB3b3JrLgoKVGhlIGlkZWEgd291bGQgYmUgdG8gdHJlYXQgY29kZSBsaWtl
IHB3cnNlcS10aGVhZC1hb24uYyAoY2hhbmdlZCBmcm9tIGEKY3VycmVudCBwd3JzZXEtdGhlYWQt
Z3B1LmMpIGFzIGEgbGlicmFyeS4gSXQgd291bGQgZXhwb3J0IGl0cyBuZWNlc3NhcnkKZnVuY3Rp
b25zIChlLmcuLCBmb3Igc3BlY2lmaWMgc2VxdWVuY2UgaW5pdC9kZWluaXQgc3RlcHMpIHVzaW5n
CkVYUE9SVF9TWU1CT0xfR1BMLiBUaGUgbWFpbiBBT04gZHJpdmVyIHdvdWxkIHRoZW4gY2FsbCB0
aGVzZSB0byBwcm92aWRlCnRoZSBwd3JzZXEgZnVuY3Rpb25hbGl0eS4KClRoaXMgd2lsbCBpbnRy
b2R1Y2UgYSBjb21waWxlLXRpbWUgZGVwZW5kZW5jeSwgYXMgZXhwZWN0ZWQuCgpBbiBhbHRlcm5h
dGl2ZSB3b3VsZCBiZSB0byBrZWVwIHRoZSBkcml2ZXIgaW4gZHJpdmVycy9wb3dlci9zZXF1ZW5j
aW5nLwphcyBhIHBsYXRmb3JtIGRyaXZlciBhbmQgc3RhcnQgaXQgdXAgdXNpbmcsIGZvciBleGFt
cGxlLCBhbiBhdXhpbGlhcnkKYnVzLiBUaGlzIGlzIHNpbWlsYXIgdG8gd2hhdCB0aGUgSkg3MTEw
IGNsb2NrIGRyaXZlcgooZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzExMC1z
eXMuYykgaXMgZG9pbmcgd2l0aCBhIHJlc2V0CmRyaXZlci4gVGhpcyBjb3VsZCBvZmZlciBhIGNs
ZWFuZXIgc2VwYXJhdGlvbiBvZiByb2xlcyBpZiB0aGF0J3MKcHJlZmVycmVkLgoKUGxlYXNlIGxl
dCBtZSBrbm93IHdoaWNoIHdheSB3b3VsZCBiZSBwcmVmZXJyZWQuCgo+IAo+IEJhcnRvc3oKPiAK
CkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
