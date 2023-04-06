Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B859C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XTRObqlYJwc10G6jo/BEL3ygyh7knkHQGCgL1wcx7U=; b=XNQ3mF2/dB8i7z
	NH8NzjVsJLZUTpKHXPd3yeka/bzCMbQtZ4DuK351tCQ8WMtRZp5MJymjcX28OTWT6qAvl6Tc1kHPy
	5Z1RLha10bF+2MN0Q5PxCOYEWEJKwbTVfQ3KF9ro0MIdw8U/VOfZe4BtEZsyocTE63NScwvKfb/Hf
	PeYqW7cXUoU9o3Ei7b5QWSx88aSwWsNtQDHWB7XP2z5j4mR8+C/RSt6uL9WxbWL0nhf7bVRLHCSDv
	rWyrfpDR2zKakGwgNITuL8/MG3Q+zxuJsQOKdsf6Rs09LlXgSA9StiaxaY+uhB3lHNVw1LGPLCCON
	N+OAWnd7akqAAMjgiSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJnE-006b6o-2n;
	Thu, 06 Apr 2023 07:12:25 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJnA-006b5v-1C
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 07:12:22 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 91E2E5C0096;
	Thu,  6 Apr 2023 03:12:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 06 Apr 2023 03:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680765135; x=1680851535; bh=IHLCbFaBZU/91yw5kszxiEKx+gZnH+tjq4Y
	W7whSqlQ=; b=ifCm37L0/5FfP5o7BgNK08W2hQLkUugFk1CNrH3YB9Qa6L7/L4X
	g6pIx1Z9yAidTl69rRsEsNMy8d2/pEeFVMVCr3WghzwjNR/ClH6yfDTrru3E25DQ
	pRjr8B0AS0qDQrc+O7GDIzTTCkXSSwQP3cjoDYC77Tcjrgfas1Unib7YLmt0ILus
	iUu1lpBuvYe0EMezQVOxxFx/lBKpDavRJ4EL7Ypctsh68Ko3ylE8WbPc4n7xpVx9
	0qcfat0eB9qEP9HQglrE+hybwzdai2BU2oOzykF4RuYggsR62gbOihMjNzF9p1vA
	5kY9RcRS+LedvSCpG3VX/qFzJD9X3uWLWtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680765135; x=1680851535; bh=IHLCbFaBZU/91yw5kszxiEKx+gZnH+tjq4Y
	W7whSqlQ=; b=WrvZiGgVOFnTKDCWxuJFTBHt8N/AeSE5z3FRbhBIa7sN46gsa5N
	guiWdekavibjbMhYD1J3z4mqe8+OtvaLq0I4KiFPNzNuk/a/GJsyExdBCr4ETZyO
	h/76CjDCUtepGCA86Xfy7coofV1iqBTKal4UkoaeplXzLluztRmQC20KS4Ndeaus
	VNZUeaNeCV8VHZYMONsv9jNbUuSTG1oFHFHdfVTo1URiPJ8L8kkqiyp9pRQjDipH
	fAevElt/AGzYSiYS5lGiFPJBc+uR17hpVFYjujC499lc7XOoxhSHufXwWm7piVIy
	AV9iOfC8ebqMLfubzHlxUqo70Sh3qfreO7g==
X-ME-Sender: <xms:znAuZO4U5IbX8CQzQqzzH_4PxcAql6S_zxhG7DR2fYxYQbMYEHnj7g>
    <xme:znAuZH7ZSFFZXLJW3NRRvdTkvQoTHUYqVJQ2QDw14IsMqR0muqtIabdIqJQVIwLV1
    wGRMEdcd3oLJ1n94-M>
X-ME-Received: <xmr:znAuZNcm9MphzTrenf1JAx56T4hGpEet7gX00Tr-fFJxMBHfEBcXl0Ca1-Ar8NjGwcPW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:znAuZLIf8Um38yCDigq3NfEJ8zMCVUE-_iqVAEccn6EMqyDtMVCRfQ>
    <xmx:znAuZCIvgO4l_vb9ZM7nTIEB6wDOu7Jaf3njnDJE-cYwcxY6RKt33w>
    <xmx:znAuZMw5KydGXL3bON8w0ZszqoT6wuVIMWtHI2lo3lRgw0kJ9IE7Cg>
    <xmx:z3AuZECSnkJC1VPcrhvgTd2MszZ3G7EGxLvYt7fE0Ft0qDADXH4VQw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Apr 2023 03:12:12 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v4 0/3] Use dma_default_coherent for devicetree default
 coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
Date: Thu, 6 Apr 2023 08:12:01 +0100
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 iommu@lists.linux.dev
Message-Id: <C51B954E-FA96-450D-BB4F-D8D9D1FFC525@flygoat.com>
References: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_001220_769185_34B4867A 
X-CRM114-Status: GOOD (  17.47  )
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

Cgo+IDIwMjPlubQ05pyIMeaXpSAxMDoxNe+8jEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHln
b2F0LmNvbT4g5YaZ6YGT77yaCj4gCj4gSGkgYWxsLAo+IAo+IFRoaXMgc2VyaWVzIHNwbGl0IG91
dCBzZWNvbmQgaGFsZiBvZiBteSBwcmV2aW91cyBzZXJpZXMKPiAiW1BBVENIIDAvNF0gTUlQUyBE
TUEgY29oZXJlbmNlIGZpeGVzIi4KPiAKPiBJdCBpbnRlbmRzIHRvIHVzZSBkbWFfZGVmYXVsdF9j
b2hlcmVudCB0byBkZXRlcm1pbmUgdGhlIGRlZmF1bHQgY29oZXJlbmN5IG9mCj4gZGV2aWNldHJl
ZSBwcm9iZWQgZGV2aWNlcyBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgaXQgd2l0aCBLY29uZmlnIG9w
dGlvbnMuCj4gCj4gRm9yIHNvbWUgTUlQUyBzeXN0ZW1zLCBkbWFfZGVmYXVsdF9jb2hlcmVudCBp
cyBkZXRlcm1pbmVkIHdpdGggZWl0aGVyCj4gYm9vdGxvYWRlciBvciBoYXJkd2FyZSByZWdpc3Rl
cnMgaW4gcGxhdGZvcm0gaW5pdGlsaXphdGlvbiBjb2RlLCBhbmQgZGV2aWNldHJlZQo+IGRvZXMg
bm90IGV4cGxpY2lsaXR5IHNwZWNpZnkgdGhlIGNvaGVyZW5jeSBvZiB0aGUgZGV2aWNlLCBzbyB3
ZSBuZWVkIHRoZSBhYmlsaXR5Cj4gdG8gY2hhbmdlIHRoZSBkZWZhdWx0IGNvaGVyZW5jeSBvZiBk
ZXZpY2V0cmVlIHByb2JlZCBkZXZpY2VzLgo+IAo+IEZvciBvdGhlciBwbGF0Zm9ybXMgdGhhdCBz
dXBwb3J0cyBub25jb2hlcmVudCwgZG1hX2RlZmF1bHRfY29oZXJlbnQgaXMgYSBmaXhlZAo+IHZh
bHVlIHNldCBieSBhcmNoIGNvZGUuIEl0J3MgZGVmYXVsdGVkIHRvIGZhbHNlIGZvciBtb3N0IGFy
Y2hzIGV4Y2VwdCBSSVNDLVYKPiBhbmQgcG93ZXJwYyBpbiBzb21lIGNhc2VzLgoKUGluZy4KCklz
IHRoZXJlIGFueSBpc3N1ZSByZW1haW4gaW4gdGhpcyBzZXJpZXM/CgpUaGFua3MKSmlheHVuCgo+
IAo+IFRoYW5rcwo+IC0gSmlheHVuCj4gLS0tCj4gdjI6Cj4gIC0gQWRkIFBBVENIIDEgdG8gaGVs
cCB3aXRoIGJhY2twb3J0aW5nCj4gIC0gVXNlIEtjb25maWcgb3B0aW9uIHRvIHNldCBkbWFfZGVm
YXVsdF9jb2hlcmVudCAKPiAKPiB2MzoKPiAgLSBTdHlsZSBmaXhlcwo+ICAtIFNxdWFzaCBzZXR0
aW5nIEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQgaW50byBQQVRDSCA0Cj4gIC0gU2V0dGluZyBB
UkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UIGZvciBQb3dlclBDCj4gCj4gdjQ6Cj4gIC0gRHJvcCBm
aXJzdCBwYXRjaAo+IAo+IEppYXh1biBZYW5nICgzKToKPiAgZG1hLW1hcHBpbmc6IFByb3ZpZGUg
YSBmYWxsYmFjayBkbWFfZGVmYXVsdF9jb2hlcmVudAo+ICBkbWEtbWFwcGluZzogUHJvdmlkZSBD
T05GSUdfQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVAo+ICBvZjogYWRkcmVzczogQWx3YXlzIHVz
ZSBkbWFfZGVmYXVsdF9jb2hlcmVudCBmb3IgZGVmYXVsdCBjb2hlcmVuY3kKPiAKPiBhcmNoL3Bv
d2VycGMvS2NvbmZpZyAgICAgICAgfCAyICstCj4gYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
IHwgMiArLQo+IGRyaXZlcnMvb2YvS2NvbmZpZyAgICAgICAgICB8IDQgLS0tLQo+IGRyaXZlcnMv
b2YvYWRkcmVzcy5jICAgICAgICB8IDIgKy0KPiBpbmNsdWRlL2xpbnV4L2RtYS1tYXAtb3BzLmgg
fCAyICsrCj4ga2VybmVsL2RtYS9LY29uZmlnICAgICAgICAgIHwgNyArKysrKysrCj4ga2VybmVs
L2RtYS9tYXBwaW5nLmMgICAgICAgIHwgNiArKysrKy0KPiA3IGZpbGVzIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4zOS4yIChBcHBsZSBHaXQt
MTQzKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
