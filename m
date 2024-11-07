Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C09D43369
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AC5RDIWl1Cg7cnx5xgCjVQ30CjGuFZazlMarmSWQeyE=; b=dR6Jkcw3FHmkx2
	UxUvsXQQNPFwvqBKQDbi4vJY14kZYDcORoWJvQmKLMKwqjdyocxxvw1TJRuiGOODMaLVNL+Y9TI0k
	9fjrUqFFW5NwZkTPRyT9+cY1rvUmRkkOjGQgIQ3GQtnfGWAc35wq6fJmmMAAWZCG5aab+sq+3dgQA
	YZr/Nriz4apWeIKd6kTN8y4+RRkogCgkOppA2HX4i5ghbcxPgGcvF4L7FKTeXwburXEs7EQuzi1Nm
	WrnQmYQZEzE4lbCEPkJmk4YLgSCoVFRbtw5XQlkKawHjjG1Ht3fa8CC0Odz9Hg9v2SMqY5PuYVXWS
	QLRegzXBgBsfKahorsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93wo-00000007M6P-37aL;
	Thu, 07 Nov 2024 14:57:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93wl-00000007M5o-33ZM
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 14:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B5D75C591B;
	Thu,  7 Nov 2024 14:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446C9C4CECC;
	Thu,  7 Nov 2024 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730991438;
	bh=C9KmSDR5KFc0giels4Al9MLQh0c4mvvugPsBEyIlPMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nUKjHHmnRqq4bsnJZ+OZuFrB9YXvC6X4M5misHrpPT1KzbLdS5E4/MVzrNxOkCJV6
	 I2rbgYr86mPtqiO0a1lrHhXuM2ewfE48sz2vOaMGawmaIK1eTa7uBoXQzs2J69gPdS
	 wCXAA/t6HurHqQpmnUvMjzytKtu4ZZn/d2/eU4nJ3nyc4aWJwPsl+0tuoshvxECg77
	 Ptqrj0ON5PC8Cc14u0bbyJeuvq3JBG8EdqeAu1I038TXCm+DGkTUtTaOVXNNsDyGXK
	 0Ua807riaRFvirBS6h+ZWu6YQvkuDwwbncZLaoAxl9nykMT3L1j8ebFBrLbWNbipgG
	 rvnAqAZbPUiHA==
Date: Thu, 7 Nov 2024 08:57:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <20241107145715.GA1613568@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107-aqueduct-petroleum-c002480ba291@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_065720_053328_B370EB4A 
X-CRM114-Status: GOOD (  18.77  )
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

T24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMTA6NTk6MzNBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
Cj4gVGhlIGN1cnJlbnQgZHJpdmVyIGFuZCBiaW5kaW5nIGZvciBQb2xhckZpcmUgU29DJ3MgUENJ
IGNvbnRyb2xsZXIgYXNzdW1lCj4gdGhhdCB0aGUgcm9vdCBwb3J0IGluc3RhbmNlIGluIHVzZSBp
cyBpbnN0YW5jZSAxLiBUaGUgc2Vjb25kIHJlZwo+IHByb3BlcnR5IGNvbnN0aXR1dGVzIHRoZSBy
ZWdpb24gZW5jb21wYXNzaW5nIGJvdGggImNvbnRyb2wiIGFuZCAiYnJpZGdlIgo+IHJlZ2lzdGVy
cyBmb3IgYm90aCBpbnN0YW5jZXMuIEluIHRoZSBkcml2ZXIsIGEgZml4ZWQgb2Zmc2V0IGlzIGFw
cGxpZWQgdG8KPiBmaW5kIHRoZSBiYXNlIGFkZHJlc3NlcyBmb3IgaW5zdGFuY2UgMSdzICJjb250
cm9sIiBhbmQgImJyaWRnZSIKPiByZWdpc3RlcnMuIFRoZSBCZWFnbGVWIEZpcmUgdXNlcyByb290
IHBvcnQgaW5zdGFuY2UgMiwgc28gc29tZXRoaW5nIG11c3QKPiBiZSBkb25lIHNvIHRoYXQgc29m
dHdhcmUgY2FuIGRpZmZlcmVudGlhdGUuIFRoaXMgc2VyaWVzIHNwbGl0cyB0aGUKPiBzZWNvbmQg
cmVnIHByb3BlcnR5IGluIHR3bywgd2l0aCBkZWRpY2F0ZWQgImNvbnRyb2wiIGFuZCAiYnJpZGdl
Igo+IGVudHJpZXMgc28gdGhhdCBlaXRoZXIgaW5zdGFuY2UgY2FuIGJlIHVzZWQuCj4gCj4gQ2hl
ZXJzLAo+IENvbm9yLgo+IAo+IHY2Ogo+IC0gcmV3b3JrIGNvbW1pdCBtZXNzYWdlcyB0byB1c2Ug
Qmpvcm4ncyBwcmVmZXJyZWQgInJvb3QgcG9ydCIgYW5kICJyb290Cj4gICBjb21wbGV4IiB3b3Jk
aW5nCj4gCj4gdjU6Cj4gLSByZWJhc2Ugb24gdG9wIG9mIDYuMTEtcmMxLCB3aGljaCBicm91Z2h0
IGFib3V0IGEgbG90IG9mIGRyaXZlciBjaGFuZ2UKPiAgIGR1ZSB0byB0aGUgcGxkYSBjb21tb24g
ZHJpdmVyIGNyZWF0aW9uIC0gYWx0aG91Z2ggbGl0dGxlIGFjdHVhbGx5Cj4gICBjaGFuZ2VkIGlu
IHRlcm1zIG9mIHRoZSBsaW5lcyBlZGl0ZWQgaW4gdGhpcyBwYXRjaC4KPiAKPiB2NDoKPiAtIGZp
eCBhIGNvY2NpIHdhcm5pbmcgcmVwb3J0ZWQgb2ZmIGxpc3QgYWJvdXQgYW4gaW5jb25zaXN0ZW50
IHZhcmlhYmxlCj4gICB1c2VkIGJldHdlZW4gSVNfRVJSKCkgYW5kIFBUUl9FUlIoKSBjYWxscy4K
PiAKPiB2MzoKPiAtIHJlbmFtZSBhIHZhcmlhYmxlIGluIHByb2JlIHMvYXhpL2FwYi8KPiAKPiB2
MjoKPiAtIHRyeSB0aGUgbmV3IHJlZyBmb3JtYXQgYmVmb3JlIHRoZSBvbGQgb25lIHRvIGF2b2lk
IHdhcm5pbmdzIGluIHRoZQo+ICAgZ29vZCBjYXNlCj4gLSByZXdvcmQgJHN1YmplY3QgZm9yIDIv
Mgo+IAo+IENDOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4K
PiBDQzogTG9yZW56byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KPiBDQzogS3J6
eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Cj4gQ0M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gQ0M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4g
Q0M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4KPiBDQzogQ29ub3Ig
RG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgo+IENDOiBsaW51eC1wY2lAdmdlci5rZXJuZWwu
b3JnCj4gQ0M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gQ0M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcKPiBDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IAo+
IENvbm9yIERvb2xleSAoMik6Cj4gICBkdC1iaW5kaW5nczogUENJOiBtaWNyb2NoaXAscGNpZS1o
b3N0OiBmaXggcmVnIHByb3BlcnRpZXMKPiAgIFBDSTogbWljcm9jaGlwOiByZXdvcmsgcmVnIHJl
Z2lvbiBoYW5kaW5nIHRvIHN1cHBvcnQgdXNpbmcgZWl0aGVyIHJvb3QKPiAgICAgcG9ydCAxIG9y
IDIKPiAKPiAgLi4uL2JpbmRpbmdzL3BjaS9taWNyb2NoaXAscGNpZS1ob3N0LnlhbWwgICAgIHwg
IDExICstCj4gIC4uLi9wY2kvcGxkYSx4cHJlc3NyaWNoMy1heGktY29tbW9uLnlhbWwgICAgICB8
ICAxNCArKy0KPiAgLi4uL2JpbmRpbmdzL3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sICAg
IHwgICA3ICsrCj4gIC4uLi9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWljcm9jaGlwLWhvc3Qu
YyB8IDExNiArKysrKysrKystLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRp
b25zKCspLCA2MSBkZWxldGlvbnMoLSkKClRoYW5rcyEgIFRoZSBwYXRjaGVzIHRoZW1zZWx2ZXMg
YXJlIHVuY2hhbmdlZCBiZXR3ZWVuIHY1IGFuZCB2Ni4gIEkKcmVwbGFjZWQgdGhlIHY1IHBhdGNo
ZXMgb24gcGNpL2NvbnRyb2xsZXIvbWljcm9jaGlwIHdpdGggdGhlc2UuCgpJIGFsc28gY2FwaXRh
bGl6ZWQgIlJvb3QgUG9ydCIgYW5kICJSb290IENvbXBsZXgiIHRvIGdpdmUgYSBoaW50IHRoYXQK
dGhleSBhcmUgcHJvcGVyIG5vdW5zIGRlZmluZWQgYnkgdGhlIFBDSWUgc3BlYy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
