Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C408C9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ei85dKgaixehehv3V/LMrIIMKtmZKVw02/N5CwuSu6w=; b=Li18cRGvZNtj9T
	QOURp+UswTeNCpxvXZwGFfsFhbFdqKe9bB4etksXc3e4am1aZYek8a6K5DUBkFCv0XLG6aJB44vg/
	bBzI3U9SXaAIK7LBVxAJDdhUBKIb+Li9n5ztKB3HuFqpiRoXXHyekDKid0U1rIxEQhfIfKyOmQZk6
	fR1QqK2GOla0kow+7DUjgpBzNNGY62qmko5SZE2mkSLOptqDctam+BvZtN8FWSPD10KA2Rx1D7way
	oDVSqg0y7oZyHVXht7vRuMKHrj6Z5DagsNKb+8z7xpQPd9Y65HBwEsxRGY6GDRBRdRmRsGRfz9F8m
	GsZzvGqGyc3l+1WhjXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1k9-0000000CxSY-3Z16;
	Fri, 25 Sep 2026 08:57:21 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1k4-0000000CxRU-26Sf;
	Fri, 25 Sep 2026 08:57:20 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260925085711euoutp023034b78e8628550a3ae5d7840b37570c~YhJYCLvL92670226702euoutp022;
	Fri, 25 Sep 2026 08:57:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260925085711euoutp023034b78e8628550a3ae5d7840b37570c~YhJYCLvL92670226702euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790326631;
	bh=fRkS/AwRvXfqS9hACKPrCrxlhkEVLAdRbTDbRYWa8VU=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=vanVKrSk5T6FjDTn74/1SUO/LMXVqJxekusjmh+babZgiVJMQp94HjScOSgxnGlOR
	 5d4koPLRi1e6pSrU0IEHhOTj75hlbtCMapcYoGSA9uiDQv+BCXn4dZic+bQLLvKziH
	 LU69fdmLb9XCyuTFLtUEuYD6O202XJ3H6/pu8JBg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260925085711eucas1p1485ce5a6153e8db654ed3cd6ed2fb70c~YhJX0T9dK1519715197eucas1p1s;
	Fri, 25 Sep 2026 08:57:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260925085707eusmtip2203bb57f8f737ff31c8cf3ba1f2b8a50~YhJULSaYY1254612546eusmtip2q;
	Fri, 25 Sep 2026 08:57:07 +0000 (GMT)
Message-ID: <40d8c179-f240-486d-b446-c76549d72772@samsung.com>
Date: Fri, 25 Sep 2026 10:57:07 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v6 0/8] dma: swiotlb: Centralize default pool policy and
 sizing
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Mark
	Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
	Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
	Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Petr Tesarik
	<ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, Madhavan
	Srinivasan <maddy@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, Albert Ou
	<aou@eecs.berkeley.edu>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Content-Language: en-US
In-Reply-To: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
X-CMS-MailID: 20260925085711eucas1p1485ce5a6153e8db654ed3cd6ed2fb70c
X-Msg-Generator: CA
X-RootMTR: 20260924060823eucas1p1d27fbf57221c9b4c0e9831a9b0cdd7d3
X-EPHeader: CA
X-CMS-RootMailID: 20260924060823eucas1p1d27fbf57221c9b4c0e9831a9b0cdd7d3
References: <CGME20260924060823eucas1p1d27fbf57221c9b4c0e9831a9b0cdd7d3@eucas1p1.samsung.com>
	<20260924060756.1325156-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015717_928946_1C60B465 
X-CRM114-Status: GOOD (  20.69  )
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

T24gMjQuMDkuMjAyNiAwODowNywgQW5lZXNoIEt1bWFyIEsuViAoQXJtKSB3cm90ZToKPiBUaGlz
IHNlcmllcyBjZW50cmFsaXplcyBzd2lvdGxiIGRlZmF1bHQtcG9vbCBzZWxlY3Rpb24gYW5kIHNp
emluZywgYW5kCj4gc2ltcGxpZmllcyB0aGUgaW5pdGlhbGl6YXRpb24gZmxhZ3MgdXNlZCB0byBk
ZXNjcmliZSBwb29sIHBsYWNlbWVudC4KPgo+IFRoZSBmaXJzdCBwYXRjaCByZXBsYWNlcyB0aGUg
YWRkcmVzc2luZy1saW1pdCBhcmd1bWVudCB3aXRoIGluaXRpYWxpemF0aW9uCj4gZmxhZ3MgYW5k
IGludHJvZHVjZXMgZXhwbGljaXQgcG9saWNpZXMgZm9yIHRoZSBkaWZmZXJlbnQgcmVhc29ucyBh
IGRlZmF1bHQKPiBwb29sIG1heSBiZSBuZWVkZWQuIEFyY2hpdGVjdHVyZXMgbm93IHJlcG9ydCBE
TUEgYWRkcmVzc2luZyBjb25zdHJhaW50cyB3aXRoCj4gU1dJT1RMQl9JTklUX0FERFJFU1NJTkdf
TElNSVQsIHdoaWxlIHRoZSBjb3JlIHNlbGVjdHMgdGhlIGNvcnJlc3BvbmRpbmcgcG9vbAo+IHBv
bGljeS4KPgo+IFRoZSBzZWNvbmQgcGF0Y2ggbW92ZXMgdGhlIHJlZHVjZWQgc2l6aW5nIHVzZWQg
d2hlbiB0aGUgcG9vbCBpcyBuZWVkZWQgb25seQo+IGZvciB1bmFsaWduZWQga21hbGxvYyBib3Vu
Y2luZyBmcm9tIGFybTY0IGFuZCBSSVNDLVYgaW50byB0aGUgc3dpb3RsYiBjb3JlLgo+Cj4gVGhl
IHRoaXJkIHBhdGNoIGNlbnRyYWxpemVzIHN3aW90bGIgc2l6aW5nIGZvciBtZW1vcnktZW5jcnlw
dGVkIHN5c3RlbXMuIEl0Cj4gbW92ZXMgdGhlIGV4aXN0aW5nIHg4NiBndWVzdC1zaXppbmcgcG9s
aWN5IGludG8gdGhlIGNvcmUuIEhvc3QgbWVtb3J5Cj4gZW5jcnlwdGlvbiByZXRhaW5zIHRoZSBu
b3JtYWwgcG9vbCBzaXplLCBhbmQgYSBzaGFyZWQgZGVmYXVsdCBwb29sIGlzIG5vdAo+IHNlbGVj
dGVkIHNvbGVseSBmb3IgZ3Vlc3QgbWVtb3J5IGVuY3J5cHRpb24gd2hlbiBhIHJlc3RyaWN0ZWQg
RE1BIHBvb2wgaXMKPiBwcmVzZW50Lgo+Cj4gVGhlIGZvdXJ0aCBwYXRjaCByZW1vdmVzIFNXSU9U
TEJfQU5ZLiBQb29sIHBsYWNlbWVudCBpcyBkZXJpdmVkIGRpcmVjdGx5IGZyb20KPiBTV0lPVExC
X0lOSVRfQUREUkVTU0lOR19MSU1JVDogcG9vbHMgcmVxdWlyZWQgZm9yIGxpbWl0ZWQgRE1BIGFk
ZHJlc3NpbmcgYXJlCj4gYWxsb2NhdGVkIGJlbG93IHRoZSBhcmNoaXRlY3R1cmUncyBsb3cgYWRk
cmVzcyBsaW1pdCwgd2hpbGUgb3RoZXIgcG9vbHMgbWF5Cj4gYmUgYWxsb2NhdGVkIGFueXdoZXJl
IGluIGRpcmVjdGx5IG1hcHBlZCBtZW1vcnkuIFhlbiBjb250aW51ZXMgdG8gcmVxdWVzdCBhCj4g
cG9vbCBleHBsaWNpdGx5IHdpdGggU1dJT1RMQl9JTklUX1JFTUFQIHdpdGhvdXQgaW1wb3Npbmcg
YSBsb3ctYWRkcmVzcwo+IGNvbnN0cmFpbnQuCgoKSSB3b3VsZCBsaWtlIHRvwqBnaXZlIHRoaXMg
cGF0Y2hzZXQgc29tZSB0ZXN0cyBpbiBsaW51eC1uZXh0IGFuZMKgbWVyZ2UgdGhpcyB0bwp2Ny40
LXJjMSwgYXMgdGhpcyBpcyBpbXBvcnRhbnTCoGNvbnRpbnVhdGlvbiBvZiB0aGUgY29kZSBhbHJl
YWR5IG1lcmdlZCB0byB2Ny4zLgoKCkFueSBjaGFuY2UgdG8gZ2V0IHNvbWUgbW9yZSBhY2tzIGZy
b20gYXJjaCBtYWludGFpbmVycyAoZXNwZWNpYWxsecKgeDg2KT8KVW5mb3J0dW5hdGVsecKgSSBo
YWQgdG8gcmVkdWNlIHRoZSBDQyBsaXN0IGR1ZSB0byBteSBzbXRwIGxpbWl0cy4uLgoKPiAuLi4K
Pgo+ICBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3N3aW90bGIucnN0ICAgfCAgIDggKy0KPiAgYXJj
aC9hcm0vbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4gIGFyY2gvYXJtL3hl
bi9tbS5jICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL2FybTY0L21tL2luaXQu
YyAgICAgICAgICAgICAgICAgfCAgMTQgKy0KPiAgYXJjaC9sb29uZ2FyY2gva2VybmVsL3NldHVw
LmMgICAgICAgIHwgICAyICstCj4gIGFyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rlb24u
YyB8ICAgMiArLQo+ICBhcmNoL21pcHMvbG9vbmdzb242NC9kbWEuYyAgICAgICAgICAgfCAgIDIg
Ky0KPiAgYXJjaC9taXBzL3NpYnl0ZS9jb21tb24vZG1hLmMgICAgICAgIHwgICAyICstCj4gIGFy
Y2gvcG93ZXJwYy9rZXJuZWwvZG1hLXN3aW90bGIuYyAgICB8ICAgNCArLQo+ICBhcmNoL3Bvd2Vy
cGMvbW0vbWVtLmMgICAgICAgICAgICAgICAgfCAgMTcgKystCj4gIGFyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvcHNlcmllcy9zdm0uYyB8ICAxMCAtLQo+ICBhcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9w
Y2kuYyAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAg
ICAgfCAgMjQgKy0tLQo+ICBhcmNoL3MzOTAvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vY3Jhc2hfcmVzZXJ2ZS5oIHwgICA0ICstCj4g
IGFyY2gveDg2L2tlcm5lbC9wY2ktZG1hLmMgICAgICAgICAgICB8ICAyMyArKystCj4gIGFyY2gv
eDg2L21tL21lbV9lbmNyeXB0LmMgICAgICAgICAgICB8ICAyNCAtLS0tCj4gIGluY2x1ZGUvbGlu
dXgvc3dpb3RsYi5oICAgICAgICAgICAgICB8ICAxNyArKy0KPiAga2VybmVsL2RtYS9zd2lvdGxi
LmMgICAgICAgICAgICAgICAgIHwgMTkzICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAx
OSBmaWxlcyBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9ucygrKSwgMTQ3IGRlbGV0aW9ucygtKQoKQmVz
dCByZWdhcmRzCgotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
