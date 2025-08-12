Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8E1CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcJhx1aI240LvQ8qmzG3abuKF3T+f9PFIWZ6vs99Akk=; b=GG58T+R7YNofZA
	mA+JEBguncfmvJwCGjTb36jBtD5kvbFHOAJUoo7EPY4mN3fSm00v2vICfOREH8uWuhy4+0fxx3U3L
	MfB2Mse7u9eFGmdd2ev9zqruSRQt5A6DGCjA+LBnb47TWCTrsnsZY1gBV77IprCtf2+XVi7cdFLxf
	btQ3UZl83bdKgMctLz3oddby8d1xydqzTnQ1+rqoeCb3kGqWNdgNkf5IHGFUgl2BxvWXeUp/OLQvH
	AZ6gTswG4AUAzJpRXs56AK6OVCbndotq0faz5a6YmjpueJxukSVfM/rwUBwqflz0cqGx5HV3HGLeV
	FRpxf1mBr1VKsPz03TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIr-0000000AnLz-24YK;
	Tue, 12 Aug 2025 12:40:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull8u-0000000AM4G-1BiR
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:18:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754990274; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VGoHwuknbXdy2ikBZ1vGU0AWjSXzzg0mbeI+XAGjv3lI6bjWhYJe+W6PZpzvf8HkjK3FEkG0hbzKbj9V3ywie1c1s9+mF/rWWDDltZbfjZJIUwCWE+bS8HX80iAfnyPcTBj6Xx104uWUbmV+Oa3ioxqF0K7pS3vibr9TIfMQdq8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754990274; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1+hInyaCbxnzsVD/At0u5EtgvJbYvgUqxLbC8ItIg3Y=; 
	b=iROwg3CKcXXrofcmrd3Pz9aX8GMpSIOt+9JzonuH/ivzcEkUiZeTrHVWLhHOhh6ptgtWQc9DD+5D6dnEQCIKh32AZIYC4RI/zLvfmvFRFXEBgR1Pkd2lpOcBsGt1pX+Vn/TsJAiPd8JgpTzVH2WUmMAAo/FR/21H+8uYHOofBkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754990274;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1+hInyaCbxnzsVD/At0u5EtgvJbYvgUqxLbC8ItIg3Y=;
	b=AOHW2uepCwbOHaGmfXrIOS7xN5xZ7vXbAwjyRc/gFEbvSb0cBIkHga3zU+BlcgKz
	3BvH+dgbFSBKdx7pivNHiOOdj2vL57zp2EjeRssbmNuOWeT14zFq6PzBkLGjmT27dsH
	N2vailR+WOvTebM2bc0/ovf0YYJF4pKgh5PKfr2aVhP9/p31pZhjtpJw7utukub7JaO
	owUadTOQY0NQwwKH/F8eQM3sujQxBj1euXhd7A+7RkKjYuPbx0xiYfunfRa9qkkf3Ap
	xMKkSAgQ6bbvHvxwCrIK5dMfxFeP7rFq8PZYmXiIPDEx6mtPV5UWSr90dbaV97z+rZK
	e1i/ZXUZ9A==
Received: by mx.zohomail.com with SMTPS id 1754990271194111.10728242341895;
	Tue, 12 Aug 2025 02:17:51 -0700 (PDT)
Message-ID: <6d21521067409c483a8d7af39e43a6d579c98dc4.camel@icenowy.me>
Subject: Re: [PATCH 4/4 FIXED] clk: thead: th1520-ap: fix parent of padctrl0
 clock
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 17:17:45 +0800
In-Reply-To: <20250812060433.1979587-1-uwu@icenowy.me>
References: <20250812054258.1968351-5-uwu@icenowy.me>
	 <20250812060433.1979587-1-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021804_409597_C1518170 
X-CRM114-Status: GOOD (  13.98  )
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

5ZyoIDIwMjUtMDgtMTLmmJ/mnJ/kuoznmoQgMTQ6MDQgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVGhlIHBhZGN0cmwwIGNsb2NrIHNlZW1zIHRvIGJlIGEgY2hpbGQgb2YgdGhlIHBl
cmlzeXNfYXBiNF9oY2xrCj4gY2xvY2ssCj4gZ2F0aW5nIHRoZSBsYXRlciBtYWtlcyBwYWRjdHJs
MCByZWdpc3RlcnMgc3R1Y2suCj4gCj4gRml4IHRoaXMgcmVsYXRpb25zaGlwLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+IC0tLQo+IFRoaXMgaXMg
dGhlIGNvbnNlcXVlbmNlIG9mIGZpeGluZyAzLzQsIGJlY2F1c2UgdGhlc2UgdHdvIHBhdGNoZXMg
YXJlCj4gYXQKPiBuZWFybHkgdGhlIHNhbWUgcG9zaXRpb24sIGFuZCB1bmZvcnR1bmF0ZWx5IGdl
dCBkZXBlbmRlbnQgYnkgdGhlCj4gYWxnb3JpdGhtIG9mIGRpZmYuCj4gCj4gSWdub3JlIHRoZSBv
cmlnaW5hbCA0LzQgYW5kIGxvb2sgYXQgdGhpcyB0b28uCj4gCj4gwqBkcml2ZXJzL2Nsay90aGVh
ZC9jbGstdGgxNTIwLWFwLmMgfCA3ICsrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvdGhl
YWQvY2xrLXRoMTUyMC1hcC5jCj4gYi9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMK
PiBpbmRleCA3NWVhMTcwNWNjMDhmLi4wZWNlZGFjNTBkNmNiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3RoZWFkL2Ns
ay10aDE1MjAtYXAuYwo+IEBAIC05MTcsMTMgKzkxNywxOCBAQCBzdGF0aWMgQ0NVX0dBVEUoQ0xL
X1BFUklTWVNfQVBCM19IQ0xLLAo+IHBlcmlzeXNfYXBiM19oY2xrLCAicGVyaXN5cy1hcGIzLWhj
bGsiLCBwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDE1MCwgQklUKDExKSwg
Q0xLX0lTX0NSSVRJQ0FMKTsKPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfUEVSSVNZU19BUEI0X0hD
TEssIHBlcmlzeXNfYXBiNF9oY2xrLCAicGVyaXN5cy0KPiBhcGI0LWhjbGsiLCBwZXJpc3lzX2Fo
Yl9oY2xrX3BkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgxNTAsIEJJVCgx
MiksIDApOwo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGVyaXN5
c19hcGI0X2hjbGtfcGRbXSA9IHsKPiArwqDCoMKgwqDCoMKgwqB7IC5odyA9ICZwZXJpc3lzX2Fw
YjRfaGNsay5jb21tb24uaHcgfSwKPiArfTsKPiArCj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX05Q
VV9BWEksIG5wdV9heGlfY2xrLCAibnB1LWF4aSIsIGF4aV9hY2xrX3BkLAo+IDB4MWM4LCBCSVQo
NSksIENMS19JU19DUklUSUNBTCk7Cj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0NQVTJWUCwgY3B1
MnZwX2NsaywgImNwdTJ2cCIsIGF4aV9hY2xrX3BkLAo+IDB4MWUwLCBCSVQoMTMpLCBDTEtfSVNf
Q1JJVElDQUwpOwo+IMKgc3RhdGljIENDVV9HQVRFKENMS19FTU1DX1NESU8sIGVtbWNfc2Rpb19j
bGssICJlbW1jLXNkaW8iLAo+IGVtbWNfc2Rpb19yZWZfY2xrX3BkLCAweDIwNCwgQklUKDMwKSwg
MCk7Cj4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0dNQUMxLCBnbWFjMV9jbGssICJnbWFjMSIsIGdt
YWNfcGxsX2Nsa19wZCwKPiAweDIwNCwgQklUKDI2KSwgMCk7Cj4gwqBzdGF0aWMgQ0NVX0dBVEUo
Q0xLX1BBRENUUkwxLCBwYWRjdHJsMV9jbGssICJwYWRjdHJsMSIsCj4gcGVyaXN5c19hcGJfcGNs
a19wZCwgMHgyMDQsIEJJVCgyNCksIDApOwo+IMKgc3RhdGljIENDVV9HQVRFKENMS19EU01BUlQs
IGRzbWFydF9jbGssICJkc21hcnQiLAo+IHBlcmlzeXNfYXBiX3BjbGtfcGQsIDB4MjA0LCBCSVQo
MjMpLCAwKTsKPiAtc3RhdGljIENDVV9HQVRFKENMS19QQURDVFJMMCwgcGFkY3RybDBfY2xrLCAi
cGFkY3RybDAiLAo+IHBlcmlzeXNfYXBiX3BjbGtfcGQsIDB4MjA0LCBCSVQoMjIpLCAwKTsKPiAr
c3RhdGljIENDVV9HQVRFKENMS19QQURDVFJMMCwgcGFkY3RybDBfY2xrLCAicGFkY3RybDAiLAo+
IHBlcmlzeXNfYXBiNF9oY2xrX3BkLCAweDIwNCwgQklUKDIyKSwgMCk7CgpPb3BzIGxvb2tzIGxp
a2UgdGhpcyBkb2VzIG5vdCB3b3JrIGFuZCBvcnBoYW5zIHRoZSBjbG9jay4uLgoKPiDCoHN0YXRp
YyBDQ1VfR0FURShDTEtfR01BQ19BWEksIGdtYWNfYXhpX2NsaywgImdtYWMtYXhpIiwKPiBheGk0
X2NwdXN5czJfYWNsa19wZCwgMHgyMDQsIEJJVCgyMSksIDApOwo+IMKgc3RhdGljIENDVV9HQVRF
KENMS19HUElPMywgZ3BpbzNfY2xrLCAiZ3BpbzMtY2xrIiwKPiBwZXJpMnN5c19hcGJfcGNsa19w
ZCwgMHgyMDQsIEJJVCgyMCksIDApOwo+IMKgc3RhdGljIENDVV9HQVRFKENMS19HTUFDMCwgZ21h
YzBfY2xrLCAiZ21hYzAiLCBnbWFjX3BsbF9jbGtfcGQsCj4gMHgyMDQsIEJJVCgxOSksIDApOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
