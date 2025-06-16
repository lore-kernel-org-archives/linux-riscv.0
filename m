Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66FC71159
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+RDyMCdH++0kQHB0BBC1SaqPpgNnzY2MjvYSN6cZXY=; b=osPsbzMjS6qKUW
	WMj0jeiI++J+PF/dzl5W9gj/sjhVtKatnP3SBAheTVfz6vaj7etv0N6gkszAEWGOMCfGnxNp2u38c
	nm1Y1/XKSXWAmWaTKNiKl+0qOse7wuW+wKbZSGUPiXcDSPoZ3Wz0mP299WZKx1GFUZSIIwAhHYpsH
	+suX1SO5eu5ApeauZuzh70sLskYsev37ivruQuWASXx5ghs3JxQ5Nq1CzJ/CWVduOe9ezWInVr7w1
	V9wp0fr2JJTVmAO4rBvqzWDMI5/CDj+ZIphgzZa0EWyvKqLpZpIUgEbfZfh6783b+3taR3lciWAMl
	r7Z/x83ORhLtResNCGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREuy-00000005Inu-3tRD;
	Mon, 16 Jun 2025 18:50:52 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREuv-00000005InA-1KHj
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 18:50:51 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250616185045euoutp01f5ae5b78ac8ed76b7e47d2364211b665~Jmolufvx01198111981euoutp01h
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 18:50:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250616185045euoutp01f5ae5b78ac8ed76b7e47d2364211b665~Jmolufvx01198111981euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750099845;
	bh=RpP2wDPoANn6hbq6/IU7H6R4ymwfkUd1lBtxRssgpxg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HXgtuKYUh8YOQyQo91vA+qT4El3cb+jVPyP21y2ZTw42FifSSk8p2Duc4xvwAuyE+
	 K1bHEQ+MjXyRTuM+mUFJt5q7AUR5lq1rzfclPDjZlNux/bNkGGmkf0bBXIsOKd0Wnv
	 pvUpmbMiiOYc9Khw/cK57CgCrGso0q81WWVlcCVE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250616185043eucas1p19d2115087823eac1a2fa36fdb6c7cfca~Jmokc0_PY2023320233eucas1p1A;
	Mon, 16 Jun 2025 18:50:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250616185042eusmtip251ec7824b4cba255d6ebe61eb60deb26~JmojYMGUT3160031600eusmtip2J;
	Mon, 16 Jun 2025 18:50:42 +0000 (GMT)
Message-ID: <6176cae6-012e-4dc7-9445-058478bfe758@samsung.com>
Date: Mon, 16 Jun 2025 20:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Bartosz Golaszewski <brgl@bgdev.pl>, Matt Coster
	<matt.coster@imgtec.com>, Frank Binns <frank.binns@imgtec.com>
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
In-Reply-To: <CAMRc=MfdBd6HBwM4F1TcjDvwbOJ03kxgRk4hJQ8HFK7Wz2XBAg@mail.gmail.com>
X-CMS-MailID: 20250616185043eucas1p19d2115087823eac1a2fa36fdb6c7cfca
X-Msg-Generator: CA
X-RootMTR: 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70
X-EPHeader: CA
X-CMS-RootMailID: 20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70
References: <CGME20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70@eucas1p1.samsung.com>
	<20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
	<20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
	<CAMRc=MfdBd6HBwM4F1TcjDvwbOJ03kxgRk4hJQ8HFK7Wz2XBAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_115049_965518_7FCEE60C 
X-CRM114-Status: GOOD (  24.31  )
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

CgpPbiA2LzE2LzI1IDExOjQwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+IE9uIFNhdCwg
SnVuIDE0LCAyMDI1IGF0IDg6MDnigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo+IDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+PiBVcGRhdGUgdGhlIEltYWdpbmF0aW9uIFBWUiBE
Uk0gZHJpdmVyIHRvIGxldmVyYWdlIHRoZSBwd3JzZXEgZnJhbWV3b3JrCj4+IGZvciBtYW5hZ2lu
ZyB0aGUgcG93ZXIgc2VxdWVuY2Ugb2YgdGhlIEdQVSBvbiB0aGUgVC1IRUFEIFRIMTUyMCBTb0Mu
Cj4+Cj4+IFRvIGNsZWFubHkgaGFuZGxlIHRoZSBUSDE1MjAncyBzcGVjaWZpYyBwb3dlciByZXF1
aXJlbWVudHMgaW4gdGhlCj4+IGdlbmVyaWMgZHJpdmVyLCB0aGlzIHBhdGNoIGltcGxlbWVudHMg
dGhlICJkcml2ZXIgbWF0Y2ggZGF0YSIgcGF0dGVybi4gQQo+PiBoYXNfcHdyc2VxIGZsYWcgaW4g
YSBuZXcgcHZyX3NvY19kYXRhIHN0cnVjdCBpcyBub3cgYXNzb2NpYXRlZCB3aXRoCj4+IHRoZWFk
LHRoMTUyMC1ncHUgY29tcGF0aWJsZSBzdHJpbmcgaW4gdGhlIG9mX2RldmljZV9pZCB0YWJsZS4K
Pj4KPj4gQXQgcHJvYmUgdGltZSwgdGhlIGRyaXZlciBjaGVja3MgdGhpcyBmbGFnLiBJZiB0cnVl
LCBpdCBjYWxscwo+PiBkZXZtX3B3cnNlcV9nZXQoImdwdS1wb3dlciIpLCByZXF1aXJpbmcgYSB2
YWxpZCBzZXF1ZW5jZXIgYW5kIGRlZmVycmluZwo+PiBwcm9iZSBvbiBmYWlsdXJlLiBJbiB0aGlz
IG1vZGUsIGFsbCBwb3dlciBhbmQgcmVzZXQgY29udHJvbCBpcyBkZWxlZ2F0ZWQKPj4gdG8gdGhl
IHB3cnNlcSBwcm92aWRlci4gSWYgdGhlIGZsYWcgaXMgZmFsc2UsIHRoZSBkcml2ZXIgc2tpcHMg
dGhpcwo+PiBsb2dpYyBhbmQgZmFsbHMgYmFjayB0byBpdHMgc3RhbmRhcmQgbWFudWFsIHBvd2Vy
IG1hbmFnZW1lbnQuIENsb2NrCj4+IGhhbmRsZXMgYXJlIHN0aWxsIGFjcXVpcmVkIGRpcmVjdGx5
IGJ5IHRoaXMgZHJpdmVyIGluIGJvdGggY2FzZXMgZm9yCj4+IG90aGVyIHB1cnBvc2VzIGxpa2Ug
ZGV2ZnJlcS4KPj4KPj4gVGhlIHJ1bnRpbWUgUE0gY2FsbGJhY2tzLCBwdnJfcG93ZXJfZGV2aWNl
X3Jlc3VtZSgpIGFuZAo+PiBwdnJfcG93ZXJfZGV2aWNlX3N1c3BlbmQoKSwgYXJlIG1vZGlmaWVk
IHRvIGNhbGwgcHdyc2VxX3Bvd2VyX29uKCkgYW5kCj4+IHB3cnNlcV9wb3dlcl9vZmYoKSByZXNw
ZWN0aXZlbHkgd2hlbiB0aGUgc2VxdWVuY2VyIGlzIHByZXNlbnQuICBBIGhlbHBlcgo+PiBmdW5j
dGlvbiwgcHZyX3Bvd2VyX29mZl9zZXF1ZW5jZV9tYW51YWwoKSwgaXMgaW50cm9kdWNlZCB0byBl
bmNhcHN1bGF0ZQo+PiB0aGUgbWFudWFsIHBvd2VyLWRvd24gbG9naWMuCj4+Cj4+IFJldmlld2Vk
LWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KPj4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4g
Cj4gW3NuaXBdCj4gCj4+Cj4+ICtzdGF0aWMgaW50IHB2cl9wb3dlcl9vZmZfc2VxdWVuY2VfbWFu
dWFsKHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQo+PiArewo+PiArICAgICAgIGludCBlcnI7
Cj4+ICsKPj4gKyAgICAgICBlcnIgPSByZXNldF9jb250cm9sX2Fzc2VydChwdnJfZGV2LT5yZXNl
dCk7Cj4+ICsKPj4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHZyX2Rldi0+bWVtX2Ns
ayk7Cj4+ICsgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHB2cl9kZXYtPnN5c19jbGspOwo+
PiArICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJfZGV2LT5jb3JlX2Nsayk7Cj4+ICsK
Pj4gKyAgICAgICByZXR1cm4gZXJyOwo+PiArfQo+PiArCj4+ICBpbnQKPj4gIHB2cl9wb3dlcl9k
ZXZpY2Vfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICB7Cj4+IEBAIC0yNTIsMTEgKzI2
NiwxMCBAQCBwdnJfcG93ZXJfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7Cj4+ICAgICAgICAg
fQo+Pgo+PiAtICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJfZGV2LT5tZW1fY2xrKTsK
Pj4gLSAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHZyX2Rldi0+c3lzX2Nsayk7Cj4+IC0g
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHB2cl9kZXYtPmNvcmVfY2xrKTsKPj4gLQo+PiAt
ICAgICAgIGVyciA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHB2cl9kZXYtPnJlc2V0KTsKPj4gKyAg
ICAgICBpZiAocHZyX2Rldi0+cHdyc2VxKQo+PiArICAgICAgICAgICAgICAgZXJyID0gcHdyc2Vx
X3Bvd2VyX29mZihwdnJfZGV2LT5wd3JzZXEpOwo+PiArICAgICAgIGVsc2UKPj4gKyAgICAgICAg
ICAgICAgIGVyciA9IHB2cl9wb3dlcl9vZmZfc2VxdWVuY2VfbWFudWFsKHB2cl9kZXYpOwo+Pgo+
PiAgZXJyX2RybV9kZXZfZXhpdDoKPj4gICAgICAgICBkcm1fZGV2X2V4aXQoaWR4KTsKPj4gQEAg
LTI3Niw0NCArMjg5LDU1IEBAIHB2cl9wb3dlcl9kZXZpY2VfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKPj4gICAgICAgICBpZiAoIWRybV9kZXZfZW50ZXIoZHJtX2RldiwgJmlkeCkpCj4+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPj4KPj4gLSAgICAgICBlcnIgPSBjbGtfcHJlcGFy
ZV9lbmFibGUocHZyX2Rldi0+Y29yZV9jbGspOwo+PiAtICAgICAgIGlmIChlcnIpCj4+IC0gICAg
ICAgICAgICAgICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7Cj4+ICsgICAgICAgaWYgKHB2cl9kZXYt
PnB3cnNlcSkgewo+PiArICAgICAgICAgICAgICAgZXJyID0gcHdyc2VxX3Bvd2VyX29uKHB2cl9k
ZXYtPnB3cnNlcSk7Cj4+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7Cj4+ICsgICAgICAgfSBlbHNlIHsKPj4g
KyAgICAgICAgICAgICAgIGVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShwdnJfZGV2LT5jb3JlX2Ns
ayk7Cj4+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7Cj4+Cj4+IC0gICAgICAgZXJyID0gY2xrX3ByZXBhcmVf
ZW5hYmxlKHB2cl9kZXYtPnN5c19jbGspOwo+PiAtICAgICAgIGlmIChlcnIpCj4+IC0gICAgICAg
ICAgICAgICBnb3RvIGVycl9jb3JlX2Nsa19kaXNhYmxlOwo+PiArICAgICAgICAgICAgICAgZXJy
ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHB2cl9kZXYtPnN5c19jbGspOwo+PiArICAgICAgICAgICAg
ICAgaWYgKGVycikKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfY29yZV9jbGtf
ZGlzYWJsZTsKPj4KPj4gLSAgICAgICBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUocHZyX2Rldi0+
bWVtX2Nsayk7Cj4+IC0gICAgICAgaWYgKGVycikKPj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJy
X3N5c19jbGtfZGlzYWJsZTsKPj4gKyAgICAgICAgICAgICAgIGVyciA9IGNsa19wcmVwYXJlX2Vu
YWJsZShwdnJfZGV2LT5tZW1fY2xrKTsKPj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3N5c19jbGtfZGlzYWJsZTsKPj4KPiAKPiBJ
biBvcmRlciB0byBkZWNyZWFzZSB0aGUgbnVtYmVyIG9mIGlmLWVsc2VzLCB3b3VsZCBpdCBtYWtl
IHNlbnNlIHRvCj4gcHV0IHRoZSAibWFudWFsIiBhbmQgInB3cnNlcSIgb3BlcmF0aW9ucyBpbnRv
IHRoZWlyIG93biBzZXBhcmF0ZQo+IGZ1bmN0aW9ucyBhbmQgdGhlbiBzdG9yZSBhZGRyZXNzZXMg
b2YgdGhlc2UgZnVuY3Rpb25zIGluIHRoZSBkZXZpY2UKPiBtYXRjaCBkYXRhIHN0cnVjdCBhcyBm
dW5jdGlvbiBwb2ludGVycyAoaW5zdGVhZCBvZiB0aGUgaGFzX3B3cnNlcQo+IGZsYWcpPyBUaGlz
IHdheSB3ZSdkIGp1c3QgY2FsbCB0aGVtIGRpcmVjdGx5LgoKSGkgQmFydG9zeiwKClRoYW5rcyBm
b3IgdGhlIHN1Z2dlc3Rpb24uIFRoYXQgc291bmRzIGdvb2QuIEkgY2FuIHJld29yayB0aGUgcGF0
Y2ggdG8KdXNlIGZ1bmN0aW9uIHBvaW50ZXJzIGluc3RlYWQgb2YgdGhlIGZsYWcuIAoKTWF0dCwg
YXMgdGhlIG1haW50YWluZXIgb2YgdGhpcyBjb2RlLCBkbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2Ug
b24gdGhpcz8KTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuCgo+IAo+IEJhcnQKPiAKCkJlc3Qg
cmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
