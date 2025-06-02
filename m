Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2982C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gc8TAbaMRIT/n1IfD4L+lQ6tNYtLQ8VsPt6Q29BKTQw=; b=CTzKxOFv3iKVID
	2qLTmdEPn9Xz7wafprLAQt6cLU9slEPRHO5oTZ4/FQuCk50hcX2vNg1/GaJhrkLYFJbV/mnnzE2xg
	BNr1Rl1KzAzJ0nzA4FuDkpH0C4e+7M7QcWGETxxl8cq6hwPUGdRxWS13f8Q1paPb/5VOzkm9XgNan
	MeNmUe/GtdBj2OzNs71VMi/MXA9VMlhSAQoooXRatzcxvIcphU2CkG847bNS/9F7IOAc+zTwI7tSq
	H+KlyjQWAuK7zKJ9CeKER8gdDoSEVIrbp/m2loudQmKRefYTmI1xvAjAOleCbO3re8Gc7ECAN92FN
	MQqADp0RYEnrRurPcGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBmg-00000008kiX-1CuE;
	Mon, 02 Jun 2025 20:29:26 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBmb-00000008kdm-3sig
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 20:29:24 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250602202916euoutp02510878dd2d396bc6d5d3fdc9e49472a5~FU8m6yAT22034020340euoutp02A
	for <linux-riscv@lists.infradead.org>; Mon,  2 Jun 2025 20:29:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250602202916euoutp02510878dd2d396bc6d5d3fdc9e49472a5~FU8m6yAT22034020340euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748896156;
	bh=LuhVx3O/KQGQRsU4OiisGNAVlHn1IT4eSr0XOaKuRxg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dQWGK9I5Kymf2Oxbg083v5CScrK9gSjZ6LDDnbqgKc+GEtquZvl0xvNiffNHXllue
	 J9ElVWxIBMYAp1IQkKn25cNMD39Txt060JVHBkQP3HXc0bNWvfKFM5PcBcVYZo7077
	 8jSf9m0ScDbDtmphg4onBnUWGf+6HRAfxuyr6avA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250602202914eucas1p1246d0c3c93222b9f80224b994573a31b~FU8lmjGhp1197511975eucas1p1Z;
	Mon,  2 Jun 2025 20:29:14 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250602202913eusmtip29f78e7b1758034d46ee105342391380b~FU8kkyi-L0590905909eusmtip2D;
	Mon,  2 Jun 2025 20:29:13 +0000 (GMT)
Message-ID: <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
Date: Mon, 2 Jun 2025 22:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
In-Reply-To: <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
X-CMS-MailID: 20250602202914eucas1p1246d0c3c93222b9f80224b994573a31b
X-Msg-Generator: CA
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
	<CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_132922_541493_14C4C736 
X-CRM114-Status: GOOD (  22.87  )
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

CgpPbiA2LzIvMjUgMTY6NDYsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gT24gRnJpLCBN
YXkgMzAsIDIwMjUgYXQgMTI6MjTigK9BTSBNaWNoYWwgV2lsY3p5bnNraQo+IDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+PiBJbnRyb2R1Y2UgZGV2aWNlIHRyZWUgYmluZGlu
Z3MgZm9yIGEgbmV3IHBvd2VyIHNlcXVlbmNlciBwcm92aWRlcgo+PiBkZWRpY2F0ZWQgdG8gdGhl
IFQtSEVBRCBUSDE1MjAgU29DJ3MgR1BVLgo+Pgo+PiBUaGUgdGhlYWQsdGgxNTIwLWdwdS1wd3Jz
ZXEgY29tcGF0aWJsZSBkZXNpZ25hdGVzIGEgbm9kZSB0aGF0IHdpbGwKPj4gbWFuYWdlIHRoZSBj
b21wbGV4IHBvd2VyLXVwIGFuZCBwb3dlci1kb3duIHNlcXVlbmNlIGZvciB0aGUgR1BVLiBUaGlz
Cj4+IHNlcXVlbmNlciByZXF1aXJlcyBhIGhhbmRsZSB0byB0aGUgR1BVJ3MgY2xvY2sgZ2VuZXJh
dG9yIHJlc2V0IGxpbmUKPj4gKGdwdS1jbGtnZW4pLCB3aGljaCBpcyBzcGVjaWZpZWQgaW4gaXRz
IGRldmljZSB0cmVlIG5vZGUuCj4+Cj4+IFRoaXMgYmluZGluZyB3aWxsIGJlIHVzZWQgYnkgYSBu
ZXcgcHdyc2VxIGRyaXZlciB0byBhYnN0cmFjdCB0aGUKPj4gU29DIHNwZWNpZmljIHBvd2VyIG1h
bmFnZW1lbnQgZGV0YWlscyBmcm9tIHRoZSBnZW5lcmljIEdQVSBkcml2ZXIuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+
IC0tLQo+PiAgLi4uL2JpbmRpbmdzL3Bvd2VyL3RoZWFkLHRoMTUyMC1wd3JzZXEueWFtbCAgICAg
ICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrCj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Bvd2VyL3RoZWFkLHRoMTUyMC1wd3JzZXEueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci90aGVhZCx0aDE1MjAtcHdyc2VxLnlhbWwKPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMC4uNGMzMDJhYmZiNzZmYjllMjQzOTQ2ZjRlZWZhMzMzYzZiMDJlNTlkMwo+
PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wb3dlci90aGVhZCx0aDE1MjAtcHdyc2VxLnlhbWwKPj4gQEAgLTAsMCArMSw0MiBAQAo+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
Cj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUu
Y29tL3YxL3VybD9rPTU1Y2EzYTc3LTM0YjdkMjBmLTU1Y2JiMTM4LTc0ZmU0ODVmZmZiMS00ZGE5
OTI4NGFhZjViZGYyJnE9MSZlPTA4NWZmYzY5LTIxYWQtNGFiZC05MTQ3LTk3MGEzMDhjODgxOCZ1
PWh0dHAlM0ElMkYlMkZkZXZpY2V0cmVlLm9yZyUyRnNjaGVtYXMlMkZwb3dlciUyRnRoZWFkJTJD
dGgxNTIwLXB3cnNlcS55YW1sJTIzCj4+ICskc2NoZW1hOiBodHRwczovL3Byb3RlY3QyLmZpcmVl
eWUuY29tL3YxL3VybD9rPThlOWI5MDFjLWVmZTY3ODY0LThlOWExYjUzLTc0ZmU0ODVmZmZiMS1j
OTY0NDcxYTY2NTU3MTZlJnE9MSZlPTA4NWZmYzY5LTIxYWQtNGFiZC05MTQ3LTk3MGEzMDhjODgx
OCZ1PWh0dHAlM0ElMkYlMkZkZXZpY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFt
bCUyMwo+PiArCj4+ICt0aXRsZTogVC1IRUFEIFRIMTUyMCBHUFUgUG93ZXIgU2VxdWVuY2VyCj4+
ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOiB8Cj4+ICsgIFRoaXMgYmluZGlu
ZyBkZXNjcmliZXMgdGhlIHBvd2VyIHNlcXVlbmNlciBmb3IgdGhlIFQtSEVBRCBUSDE1MjAgR1BV
Lgo+PiArICBUaGlzIHNlcXVlbmNlciBoYW5kbGVzIHRoZSBzcGVjaWZpYyBwb3dlci11cCBhbmQg
cG93ZXItZG93biBzZXF1ZW5jZXMKPj4gKyAgcmVxdWlyZWQgYnkgdGhlIEdQVSwgaW5jbHVkaW5n
IG1hbmFnaW5nIGNsb2NrcyBhbmQgcmVzZXRzIGZyb20gYm90aCB0aGUKPj4gKyAgc2VxdWVuY2Vy
IGFuZCB0aGUgR1BVIGRldmljZSBpdHNlbGYuCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNv
bXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHRoZWFkLHRoMTUyMC1ncHUtcHdyc2VxCj4+ICsKPiAK
PiBCZWZvcmUgSSByZXZpZXcgdGhlIHJlc3Q6IGlzIHRoaXMgYWN0dWFsbHkgYSBwaHlzaWNhbCBk
ZXZpY2UgdGhhdAo+IHRha2VzIGNhcmUgb2YgdGhlIHBvd2VyIHNlcXVlbmNpbmc/IFNvbWUga2lu
ZCBvZiBhIHBvd2VyIG1hbmFnZW1lbnQKPiB1bml0IGZvciB0aGUgR1BVPyBJZiBzbywgSSBiZXQg
aXQncyBub3QgY2FsbGVkICJwb3dlciBzZXF1ZW5jZXIiIHNvCj4gbGV0J3MgdXNlIGl0cyBhY3R1
YWwgbmFtZSBhcyBwZXIgdGhlIGRhdGFzaGVldD8KCkhpIEJhcnQsClRoYW5rcyBmb3IgeW91ciBm
ZWVkYmFjay4gCgpUaGUgaGFyZHdhcmUgYmxvY2sgcmVzcG9uc2libGUgZm9yIHBvd2VyaW5nIHVw
IHRoZSBjb21wb25lbnRzIGluIHRoZQpUSDE1MjAgU29DIGRhdGFzaGVldCBpcyBjYWxsZWQgQU9O
IChBbHdheXMgT24pLiBIb3dldmVyLCB3ZSBhbHJlYWR5IGhhdmUKYSBEVCBub2RlIG5hbWVkIGFv
biB0aGF0IHNlcnZlcyBhcyBhIHBvd2VyIGRvbWFpbiBwcm92aWRlcgooRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24ueWFtbCkuCgpGb2xs
b3dpbmcgdGhlIGRpc2N1c3Npb24gWzFdIGFib3V0IG5lZWRpbmcgYSBzZXBhcmF0ZSBEVCBub2Rl
IGZvciB0aGUKcG93ZXIgc2VxdWVuY2luZyBjYXBhYmlsaXRpZXMgb2YgdGhpcyBBT04gYmxvY2ss
IGFuZCB0aGlua2luZyBmdXJ0aGVyCmFib3V0IGl0LCBJIHRoaW5rIHRoZSBiaW5kaW5nIHNob3Vs
ZCBiZSBtb3JlIGdlbmVyaWMuIFRoZSBBT04gYmxvY2sgY2FuCm1hbmFnZSBwb3dlciBzZXF1ZW5j
ZXMgZm9yIG1vcmUgdGhhbiBqdXN0IHRoZSBHUFUgKGUuZy4gTlBVLCBBVURJTywKRFNQKS4KClRo
ZSBjb21wYXRpYmxlIHN0cmluZyBjb3VsZCBiZSB1cGRhdGVkIGxpa2Ugc286CiJ0aGVhZCx0aDE1
MjAtYW9uLXB3cnNlcSIKCkFuZCB0aGUgZGVzY3JpcHRpb246CiIKICBUaGlzIGJpbmRpbmcgZGVz
Y3JpYmVzIHRoZSBoYXJkd2FyZSBjYXBhYmlsaXRpZXMgd2l0aGluIHRoZSBBbHdheXMtT24KICAo
QU9OKSBibG9jayBvZiB0aGUgVC1IRUFEIFRIMTUyMCBTb0MgcmVzcG9uc2libGUgZm9yIGNvbnRy
b2xsaW5nIGFuZAogIHNlcXVlbmNpbmcgdGhlIHBvd2VyIHN1cHBseSB0byB2YXJpb3VzIGludGVn
cmF0ZWQgcGVyaXBoZXJhbHMsIHN1Y2ggYXMKICB0aGUgR1BVLCBOUFUsIEF1ZGlvLCBhbmQgRFNQ
LgoiCgpUaGUgZXhhY3QgcG93ZXIgYXJjaGl0ZWN0dXJlIG9mIHRoZSBTb0MgaXMgZGVzY3JpYmVk
IGluIHRoZSBjaGFwdGVyCjYuMy4yIChQb3dlciBBcmNoaXRlY3R1cmUpIFsyXS4gVGhlICJWREVD
L05QVS9WRU5DL0dQVS9EU1AgUG93ZXIgVXAvClBvd2VyIERvd24iIGlzIGRlc2NyaWJlZCBpbiBj
aGFwdGVyIDYuNC4yLjMuCgpbMV0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FQRHlL
RnBpNl9DRCsrYTlzYkdCdkpDdUJTUVM2WWNwTnR0a1JRaFFNVFd5MXl5clJnQG1haWwuZ21haWwu
Y29tLwpbMl0gLSBodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xldi1haGVhZC9iZWFn
bGV2LWFoZWFkLy0vYmxvYi9tYWluL2RvY3MvVEgxNTIwJTIwU3lzdGVtJTIwVXNlciUyME1hbnVh
bC5wZGYKCj4gCj4gQmFydAo+IAoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kg
PG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
