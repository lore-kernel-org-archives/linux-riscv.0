Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FB1FF8855
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6FYOnQbc1AE3X36MhXcIyBX1il/pbsRJHhslXrofqU=; b=zwqNnDrgQc2jWr
	juS9Kxl15NZZDSxhGVLA583EfXyED9D45SU12Al3HzTGu1E7PJyZvTMd/a/CcA3KbA7mBmwecKFje
	nBU99Rdm90xIwN13dAYP0C987TjIkRTvQIE1SQs9Uj6QXCIHzjp11xSwP0e8tJ+lUNvUrneLz/mGa
	gSLFq1dpFtL4ujnO4NDe9SBNMt3CtUT8M2qqF69hR30l4iIrcwivdfKrkeWisHqHd4jnAq//fGKVN
	V1/yKwES4eveJqNA0E+4HN+MzwUVuIdD5cz7yCZbWFd9xENWomhQzVAfS/7Q/ohUzrRxO5K/ZbvYz
	ULxb5RiBRUGfni/ARDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcTh-00000000vUe-379n;
	Wed, 06 May 2026 13:39:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcTg-00000000vUF-1WlW
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 13:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDBAC60103;
	Wed,  6 May 2026 13:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079BDC2BCC9;
	Wed,  6 May 2026 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074791;
	bh=2rWZALc4A+mRpJwikDDsmAMz1q1Of49TfL/SiHnwP8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jgr5BxuojY8tcD3I/mFhKPvfnuPEHV2mwffwDjUr9kznyx7Jbym6SCMDLUACp3BJZ
	 9uSQUeMDLiQ6eG9dDAAQRm7tTEOpPNgzyDzjlJ7/5pl7tEAcanCQ291+OtABCWFvRt
	 aUYVqhSLpMVzEC1ExZP+S+yhr8F9JCpu59mcv+eFpcQXc3Ox8KOrxED4M7Zq9gxeD/
	 rFfJhfOD5muj32f4HyHShb9Er2Nk3NiWwjduoVqZdb8xLrN4Ry8rpsvk4i4o33SUne
	 sBx5yC7GJC49K7RQYYGU1tc58/ldGhwsGz9vCEzXGQJuKb6AQVw9GuDxPR1y5eppSS
	 EYd0trDl6NkIg==
Date: Wed, 6 May 2026 19:09:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>, 
	Bjorn Helgaas <bhelgaas@google.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <2se24qgfmwumdpdjdcszz7l3m5rbucnp22hbidvhz6xc3p6j4i@fkb4u4hg6ha2>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
 <afZUxYhkCQ0wG0Uu@wunner.de>
 <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
 <afcMtlBJYeuxSqZr@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afcMtlBJYeuxSqZr@wunner.de>
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

T24gU3VuLCBNYXkgMDMsIDIwMjYgYXQgMTA6NTI6MDZBTSArMDIwMCwgTHVrYXMgV3VubmVyIHdy
b3RlOgo+IE9uIFN1biwgTWF5IDAzLCAyMDI2IGF0IDAzOjEwOjU4UE0gKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4gPiBJdCdzIHVzZWQgaW4gbXVsdGlwbGUgcHJvZHVjdHMsIGJ1dCBvbmx5
IG9uZSBvZiB0aGVtIChFVkJ2MSwgd2hpY2ggaXMKPiA+IGp1c3QgYW4gZWFybHkgRVZCIGF2YWls
YWJsZSBmb3IgYSBmZXcgcGVvcGxlIGluY2x1ZGluZyBtZSkgbGFja3MgYW4KPiA+IG9uYm9hcmQg
c3dpdGNoLCBiZWNhdXNlIFNHMjA0MiBpcyBzaG9ydCBvbiBvbi1jaGlwIHBlcmlwaGVyYWxzLiBB
bGwKPiA+IG90aGVyIGRldmljZXMgKGluY2x1ZGluZyB0d28gbWFpbmxpbmVkIG9uZXMsIEVWQnYy
IGFuZCBNaWxrLVYgUGlvbmVlciwKPiA+IGFuZCB1bm1haW5saW5lZCBkdWFsIHNvY2tldCByYWNr
IHNlcnZlcnM7IE1pbGstViBQaW9uZWVyIHNob3VsZCBiZSB0aGUKPiA+IG1vc3QgcG9wdWxhciBk
ZXZpY2UgYmVjYXVzZSBpdCB3YXMgb24gc2hlbGYpIGhhdmUgYW4gb25ib2FyZCBzd2l0Y2ggdG8K
PiA+IG1pdGlnYXRlIHRoZSBsYWNrIG9mIG9uLWNoaXAgcGVyaXBoZXJhbHMgaW4gU0cyMDQyLgo+
IAo+IFdobyBrbm93cywgbWF5YmUgc29tZW9uZSB3aWxsIGRlc2lnbiBhIHByb2R1Y3Qgd2hpY2gg
ZG9lc24ndCBhdHRhY2gKPiBhIFBDSWUgc3dpdGNoIHRvIHRoZSBTb0MsIG1heWJlIHRoZSBsYWNr
IG9mIHBlcmlwaGVyYWxzIGlzbid0IGEKPiBwcm9ibGVtIGZvciB0aGVtLgo+IAo+IEl0IHNlZW1z
IHJlYXNvbmFibGUgdG8gYWNjb21tb2RhdGUgc3VjaCBub24tc3dpdGNoIHVzZSBjYXNlcyBhcyB3
ZWxsLAo+IHNvIEkgdGhpbmsgeW91IGRlZmluaXRlbHkgZG8gbm90IHdhbnQgdG8gcXVpcmsgYWxs
IHByb2R1Y3RzIHVzaW5nIHRoYXQKPiBTb0MgYnV0IG9ubHkgdGhvc2UgdGhhdCBuZWVkIGl0LCBy
ZWdhcmRsZXNzIHdoZXRoZXIgaXQncyB0aGUgbWFqb3JpdHkuCj4gCj4gPiA+IE15IHBvaW50IGlz
LCB5b3Ugd2FudCB0byBjb25zdHJhaW4gdGhpcyB0byBhIHNwZWNpZmljIHByb2R1Y3QsIG5vdCB0
bwo+ID4gPiB0aGUgU29DLiAgQ2FuIHlvdSBtYXliZSBzb2x2ZSB0aGlzIGJ5IG5vdCBzcGVjaWZ5
aW5nIGludGVycnVwdHMgaW4KPiA+ID4gdGhlIGRldmljZXRyZWUgZm9yIHRoZSBQQ0llIHN3aXRj
aD8KPiA+IAo+ID4gVGhlIFBDSWUgc3dpdGNoZXMgYXJlIG5vdCBkZXNjcmliZWQgaW4gdGhlIGRl
dmljZSB0cmVlIGF0IGFsbCwgYmVjYXVzZQo+ID4gdGhleSdyZSBhbGwganVzdCBkaXNjb3ZlcmFi
bGU7IGNhbiB3ZSBkZXNjcmliZSB0aGVtIGluIHRoZSBEVCBhbmQKPiA+IHJlZGlyZWN0IHRoZWly
IGludGVycnVwdHMgdG8gdm9pZD8KPiAKPiBZZXMsIHNvbWVib2R5IGRpZCBhIHdyaXRldXAgaG93
IHRvIHJlcHJlc2VudCBzd2l0Y2hlcyBhbmQgZW5kcG9pbnRzCj4gaW4gdGhlIGRldmljZXRyZWU6
Cj4gCj4gaHR0cHM6Ly9mYXJsZXBldC5naXRodWIuaW8vbGludXgvMjAyNC8wMi8yMC91c2luZy1s
aW51eC1kZXZpY2UtdHJlZS13aXRoLXBjaWUtZGV2aWNlcy5odG1sCj4gCgpJIHdvdWxkbid0IHJl
Y29tbWVuZCBnb2luZyB0aGlzIGZhci4uLiBXZSBkbyBoYXZlIHNvbWUgc3dpdGNoZXMgZGVzY3Jp
YmVkIGluIERULApidXQgdGhleSBoYXZlIHNvbWUgcmVzb3VyY2UgcmVxdWlyZW1lbnRzIGxpa2Ug
cmVndWxhdG9yLCBpMmMuLi4KCj4gQW5kIHRoZW4gSSB3b3VsZCB0cnkgcHJvdmlkaW5nIGFuIGVt
cHR5ICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSBmb3IKPiB0aG9zZSBzd2l0Y2ggcG9ydHMgZm9yIHdo
aWNoIHlvdSB3YW50IHRvIGF2b2lkIHBvcnQgc2VydmljZXMgYmVpbmcKPiBpbnN0YW50aWF0ZWQu
Cj4gCgpUaGVyZSBpcyBubyAnaW50ZXJydXB0cycgcHJvcGVydHkgaW4gRFQgYmluZGluZyBmb3Ig
UENJIGJyaWRnZSBub2Rlcy4gVGhlcmUgaXMKJ2ludGVycnVwdC1tYXAnLCBidXQgdGhhdCdzIHVz
ZWQgZm9yIG1hcHBpbmcgSU5UeCB3aXRoIHBsYXRmb3JtIGludGVycnVwdApjb250cm9sbGVyLgoK
TW9yZW92ZXIsIERUIHNob3VsZCBqdXN0IGRlc2NyaWJlIHRoZSBoYXJkd2FyZSB0b3BvbG9neS9y
ZXNvdXJjZSwgbm90CnBsYXRmb3JtIGNvbnN0cmFpbnRzLgoKSSdkIHJlY29tbWVuZCBpbnRyb2R1
Y2luZyBhIG5ldyBjbWRsaW5lIHBhcmFtIHRvIHRoZSBwb3J0ZHJ2IGRyaXZlciB0byBkaXNhYmxl
CnVzaW5nIE1TSXMgZm9yIHNlcnZpY2VzLiBCdXQgdGhlIHBsYXRmb3JtIGxpbWl0YXRpb24gd291
bGQgaGl0IG9uZSB3YXkgb3IgdGhlCm90aGVyIGlmIG9uZSBvZiB0aGUgZW5kcG9pbnRzIGNvbnN1
bWUgYWxsIE1TSXMuLi4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDg
rprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
