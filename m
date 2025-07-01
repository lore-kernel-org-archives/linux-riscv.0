Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CECC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/6NuIbSai0+TduuI0Zsj8f9sOBdoNWLXBWGOEIyXHc=; b=CyGhvaKHNN7vQI
	VKprKP1VdqfL9KzKLxC85evNw2rhfDgywegAbiFptCFw6EXQsPITL8DHziV49fH4ykYgeodsz3ZKh
	g3BphvKpjsRtjx51dm1amfKIibr+JGoGtVEm1ElQDDkxzCrkKyguMIiqtYrvcsMEKCmSrQoWnK4dN
	aqt4gOw2uVF92VCsVUaznPCzvGtOUuWS03MnYhxw9HrUzRumJM5rdH/dYrEOaXRScIR26odEcLJj3
	QPXhAso6E5gzRA3ovR+mV1V3LNUfl4FtvJRWLEttGUpoDAU8nYoDp3oOdu9H3Dd2CeU0u5h5+h+eW
	J8Ui14O+48Tf+zz7oq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXs9-00000004ghF-1Bw3;
	Tue, 01 Jul 2025 10:05:53 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjB-00000004TaF-37oP
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:52:36 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250701085225euoutp01ff65366aed2879dac21bb30e2ea3c97e~OFJdorMW40089600896euoutp01K
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 08:52:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250701085225euoutp01ff65366aed2879dac21bb30e2ea3c97e~OFJdorMW40089600896euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751359945;
	bh=jiMSvhTO3EuRijPHPyzHEcK75GqOsBl3jGoGvHtO4dI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WypqO/7xv2nYZLsiGJH8BavQ4NJdGsvs1gBin449bTfoI3/D/riZ4tdaL1LmVCelv
	 MQRrGSri6TEYSs2Dw0U3Vt87LLLvD8t+tf97Csp7yNfa2beJS4IDoUSKwqaEh06DYa
	 prdQ5MEet3kM3WhtWTerMV5Q3nq0jehFZFa+cVb8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701085224eucas1p2d74efed39332d4ddb82e9881a6f586a3~OFJdDOVz31375613756eucas1p2O;
	Tue,  1 Jul 2025 08:52:24 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250701085223eusmtip207386da0b4d9ddd9eea052e444116d0c~OFJb4_9xu1783617836eusmtip2a;
	Tue,  1 Jul 2025 08:52:23 +0000 (GMT)
Message-ID: <425fe73f-8cb2-4238-9e15-55403ed9daf6@samsung.com>
Date: Tue, 1 Jul 2025 10:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ayp32pdwvpko3zuatgt2jgtfxgcmrmc5aujkx6twjchmyazpz7@yeo3kxgxnpda>
X-CMS-MailID: 20250701085224eucas1p2d74efed39332d4ddb82e9881a6f586a3
X-Msg-Generator: CA
X-RootMTR: 20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5
X-EPHeader: CA
X-CMS-RootMailID: 20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
	<CGME20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5@eucas1p1.samsung.com>
	<20250623-rust-next-pwm-working-fan-for-sending-v5-1-0ca23747c23e@samsung.com>
	<q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
	<c127e368-8c1f-4299-b222-a105940ac34e@samsung.com>
	<ayp32pdwvpko3zuatgt2jgtfxgcmrmc5aujkx6twjchmyazpz7@yeo3kxgxnpda>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015235_236734_CC6FFF04 
X-CRM114-Status: GOOD (  28.94  )
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

CgpPbiA2LzI5LzI1IDExOjIzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWwsCj4gCj4gT24gU2F0LCBKdW4gMjgsIDIwMjUgYXQgMDQ6Mzg6MTVQTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IE9uIDYvMjcvMjUgMTc6MTAsIFV3ZSBLbGVpbmUtS8O2bmln
IHdyb3RlOgo+Pj4gT24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMDg6MDg6NDlQTSArMDIwMCwgTWlj
aGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+Pj4gKy8vLyBGcm9tIEM6IGAjZGVmaW5lIFdGSFdTSVpF
IDIwYAo+Pj4+ICtwdWIgY29uc3QgV0ZIV19NQVhfU0laRTogdXNpemUgPSAyMDsKPj4+Cj4+PiBD
YW4gd2Ugc29tZWhvdyBlbmZvcmNlIHRoYXQgdGhpcyBkb2Vzbid0IGRpdmVyZ2UgaWYgdGhlIEMg
ZGVmaW5lIGlzCj4+PiBpbmNyZWFzZWQ/Cj4+Cj4+IFlvdSBhcmUgYWJzb2x1dGVseSByaWdodC4g
VGhlIGhhcmRjb2RlZCB2YWx1ZSBpcyBhIG1haW50ZW5hbmNlIHJpc2suIFRoZQo+PiAjZGVmaW5l
IGlzIGluIGNvcmUuYywgc28gYmluZGdlbiBjYW5ub3Qgc2VlIGl0Lgo+Pgo+PiBJIGNhbiBhZGRy
ZXNzIHRoaXMgYnkgc3VibWl0dGluZyBhIHBhdGNoIHRvIG1vdmUgdGhlICNkZWZpbmUgV0ZIV1NJ
WkUgdG8KPj4gaW5jbHVkZS9saW51eC9wd20uaC4gVGhpcyB3aWxsIG1ha2UgaXQgcGFydCBvZiB0
aGUgcHVibGljIEFQSSwgYWxsb3cKPj4gYmluZGdlbiB0byBnZW5lcmF0ZSBhIGJpbmRpbmcgZm9y
IGl0LCBhbmQgZW5zdXJlIHRoZSBSdXN0IGNvZGUgY2FuIG5ldmVyCj4+IGRpdmVyZ2UuIElzIHRo
aXMgZmluZSA/Cj4gCj4gSSB3b25kZXIgaWYgdGhhdCBpcyB0aGUgb3Bwb3J0dW5pdHkgdG8gY3Jl
YXRlIGEgZmlsZQo+IGluY2x1ZGUvbGludXgvcHdtLXByb3ZpZGVyLmguIEluIHRoYXQgZmlsZSB3
ZSBjb3VsZCBjb2xsZWN0IGFsbCB0aGUgYml0cwo+IHRoYXQgYXJlIG9ubHkgcmVsZXZhbnQgZm9y
IGRyaXZlcnMgKHB3bV9vcHMsIHB3bV9jaGlwLCBwd21jaGlwX3BhcmVudCwKPiBwd21jaGlwX2Fs
bG9jIC4uLikuIChTb21lIGlubGluZSBmdW5jdGlvbnMgZGVwZW5kIG9uIHNvbWUgb2YgdGhlc2Us
IHNvCj4gc29tZSBtaWdodCBoYXZlIHRvIHN0YXkgaW4gcHdtLmgpCj4gCj4gSSBjYW4gYWRkcmVz
cyB0aGF0IGluIHBhcmFsbGVsLCBkb24ndCBhZGQgdGhpcyBxdWVzdCB0byB5b3VyIHNlcmllcy4g
U28KPiB5ZXMsIG1vdmUgV0ZIV1NJWkUgdG8gaW5jbHVkZS9saW51eC9wd20uaCAoYW5kIHJlbmFt
ZSBpdCB0byBQV01fV0ZIV1NJWkUKPiB0byBub3QgcG9sbHV0ZSB0aGUgZ2xvYmFsIG5hbWVzcGFj
ZSkuCj4gIAo+Pj4gUGxlYXNlIGRvbid0IGV4cG9zZSB0aGVzZSBub24tYXRvbWljIGNhbGxiYWNr
cy4gcHdtX2Rpc2FibGUoKSB3b3VsZCBiZQo+Pj4gZmluZS4KPj4+Cj4+PiBPdGhlcndpc2UgSSdk
IHByZWZlciBpZiBwd21fc2V0X3dhdmVmb3JtX21pZ2h0X3NsZWVwKCkgaXMgdGhlIEFQSQo+Pj4g
ZXhwb3NlZCB0by9ieSBSdXN0Lgo+Pgo+Pgo+PiBPSywgSSdsbCByZW1vdmUgYWxsIHRoZSBzZXR0
ZXJzIGZyb20gdGhlIFN0YXRlLCB3aGlsZSB3aWxsIGtlZXAgdGhlCj4+IGdldHRlcnMsIGFzIHRo
ZXkgd291bGQgYmUgdXNlZnVsIGluIGFwcGx5IGNhbGxiYWNrcy4KPiAKPiBIb3cgc28/IFRoZXkg
bWlnaHQgYmUgdXNlZnVsIGZvciBjb25zdW1lcnMsIGJ1dCBteSBwcmVmZXJyZWQgaWRpb20gZm9y
Cj4gdGhlbSBpcyB0aGF0IHRoZXkga25vdyBhdCBlYWNoIHBvaW50IGluIHRpbWUgd2hhdCB0aGV5
IHdhbnQgY29tcGxldGVseQo+IGFuZCBkb24ndCBtYWtlIHRoYXQgZGVwZW5kYW50IG9uIHRoZSBw
cmV2aW91IHNldHRpbmcuCgpPaCwgdGhpcyBpcyBub3QganVzdCB0byBjaGVjayB0aGUgcHJldmlv
dXMgc3RhdGUsIGxldCBtZSBicmluZyBteQppbXBsZW1lbnRhdGlvbiBvZiBhcHBseSBmcm9tIHRo
ZSB2MSBvZiB0aGUgc2VyaWVzOgoKaW1wbCBwd206OlB3bU9wcyBmb3IgVGgxNTIwUHdtQ2hpcERh
dGEgewogICAgLy8gVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBnZXRfc3RhdGUKICAgZm4gYXBwbHko
CiAgICAgICAgcHdtX2NoaXBfcmVmOiAmbXV0IHB3bTo6Q2hpcCwKICAgICAgICBwd21fZGV2OiAm
bXV0IHB3bTo6RGV2aWNlLAogICAgICAgIHRhcmdldF9zdGF0ZTogJnB3bTo6U3RhdGUsCiAgICAp
IC0+IFJlc3VsdCB7CiAgICAgICAgbGV0IGRhdGE6ICZUaDE1MjBQd21DaGlwRGF0YSA9IHB3bV9j
aGlwX3JlZi5nZXRfZHJ2ZGF0YSgpLm9rX29yKEVJTlZBTCk/OwogICAgICAgIGxldCBod3B3bSA9
IHB3bV9kZXYuaHdwd20oKTsKCiAgICAgICAgaWYgIXRhcmdldF9zdGF0ZS5lbmFibGVkKCkgewog
ICAgICAgICAgICBpZiBwd21fZGV2LnN0YXRlKCkuZW5hYmxlZCgpIHsKICAgICAgICAgICAgICAg
IGRhdGEuX2Rpc2FibGUoaHdwd20pPzsKICAgICAgICAgICAgfQoKICAgICAgICAgICAgcmV0dXJu
IE9rKCgpKTsKICAgICAgICB9CgogICAgICAgIC8vIENvbmZpZ3VyZSBwZXJpb2QsIGR1dHksIGFu
ZCBwb2xhcml0eS4KICAgICAgICAvLyBUaGlzIGZ1bmN0aW9uIGFsc28gbGF0Y2hlcyBwZXJpb2Qv
ZHV0eSB3aXRoIENGR19VUERBVEUuCiAgICAgICAgLy8gSXQgcmV0dXJucyB0aGUgY29udHJvbCB2
YWx1ZSB0aGF0IHdhcyB3cml0dGVuIHdpdGggQ0ZHX1VQREFURSBzZXQuCiAgICAgICAgbGV0IGN0
cmxfdmFsX2FmdGVyX2NvbmZpZyA9IGRhdGEuX2NvbmZpZygKICAgICAgICAgICAgaHdwd20sCiAg
ICAgICAgICAgIHRhcmdldF9zdGF0ZS5kdXR5X2N5Y2xlKCksCiAgICAgICAgICAgIHRhcmdldF9z
dGF0ZS5wZXJpb2QoKSwKICAgICAgICAgICAgdGFyZ2V0X3N0YXRlLnBvbGFyaXR5KCksCiAgICAg
ICAgKT87CgogICAgICAgIC8vIEVuYWJsZSBieSBzZXR0aW5nIFNUQVJUIGJpdCBpZiBpdCB3YXNu
J3QgZW5hYmxlZCBiZWZvcmUgdGhpcyBhcHBseSBjYWxsCiAgICAgICAgaWYgIXB3bV9kZXYuc3Rh
dGUoKS5lbmFibGVkKCkgewogICAgICAgICAgICBkYXRhLl9lbmFibGUoaHdwd20sIGN0cmxfdmFs
X2FmdGVyX2NvbmZpZyk/OwogICAgICAgIH0KCiAgICAgICAgT2soKCkpCiAgICB9Cn0KClNvIHRo
ZSB0YXJnZXQgc3RhdGUgdmFsdWVzIGFyZSBhbHNvIGFjY2Vzc2VkIGJ5IHRob3NlIGdldHRlcnMs
IG5vdCBqdXN0CnByZXZpb3VzIHN0YXRlLgoKPiAKPj4gV2lsbCBpbXBsZW1lbnQgYWRkaXRpb25h
bCBmdW5jdGlvbnMgZm9yIERldmljZSBpLmUgc2V0X3dhdmVmb3JtLAo+PiByb3VuZF93YXZlZm9y
bSBhbmQgZ2V0X3dhdmVmb3JtLCBhbmQgdGhlIG5ldyBlbnVtIHRvIGV4cG9zZSB0aGUgcmVzdWx0
Cj4+IG9mIHRoZSByb3VuZF93YXZlZm9ybSBtb3JlIGlkaW9tYXRpY2FsbHkuCj4+Cj4+IC8vLyBE
ZXNjcmliZXMgdGhlIG91dGNvbWUgb2YgYSBgcm91bmRfd2F2ZWZvcm1gIG9wZXJhdGlvbi4KPj4g
I1tkZXJpdmUoRGVidWcsIENsb25lLCBDb3B5LCBQYXJ0aWFsRXEsIEVxKV0KPj4gcHViIGVudW0g
Um91bmRpbmdPdXRjb21lIHsKPj4gICAgIC8vLyBUaGUgcmVxdWVzdGVkIHdhdmVmb3JtIHdhcyBh
Y2hpZXZhYmxlIGV4YWN0bHkgb3IgYnkgcm91bmRpbmcgdmFsdWVzIGRvd24uCj4+ICAgICBFeGFj
dE9yUm91bmRlZERvd24sCj4+Cj4+ICAgICAvLy8gVGhlIHJlcXVlc3RlZCB3YXZlZm9ybSBjb3Vs
ZCBvbmx5IGJlIGFjaGlldmVkIGJ5IHJvdW5kaW5nIHVwLgo+PiAgICAgUm91bmRlZFVwLAo+PiB9
Cj4gCj4gU291bmRzIGdvb2QuIEhvZXZlciBJIGhhdmUgc29tZSBkb3VidHMgYWJvdXQgdGhlIEMg
c2VtYW50aWMgaGVyZSwgdG9vLgo+IElzIGl0IHJlYWxseSBoZWxwZnVsIHRvIHByb3ZpZGUgdGhh
dCBpbmZvPyBBIHVzZXIgb2YgdGhhdCByZXR1cm4gdmFsdWUKPiBoYXMgdG8gY2hlY2sgYW55aG93
IHdoaWNoIHBhcmFtZXRlciBnb3Qgcm91bmRlZCB1cC4gSWYgeW91IGhhdmUgYW4KPiBvcGluaW9u
IGhlcmUsIHBsZWFzZSBzaGFyZS4KCkZXSVc7IEluIG15IG9waW5pb24sIGl0IGlzIGhlbHBmdWwu
CgpUaGUgMSAocm91bmRlZCB1cCkgdnMuIDAgKHJvdW5kZWQgZG93bi9leGFjdCkgcmV0dXJuIHZh
bHVlIHByb3ZpZGVzIGEKc2ltcGxlIHN1bW1hcnkgZmxhZyBmb3IgdGhlIG1vc3QgY29tbW9uIHZh
bGlkYXRpb24gY2FzZTogZW5zdXJpbmcgYQpzdHJpY3QgcmVxdWlyZW1lbnQsIGxpa2UgYSBtaW5p
bXVtIGZyZXF1ZW5jeSwgaXMgbm90IHZpb2xhdGVkIGJ5CnJvdW5kaW5nLgoKPiAgCj4gQmVzdCBy
ZWdhcmRzCj4gVXdlCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxj
enluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
