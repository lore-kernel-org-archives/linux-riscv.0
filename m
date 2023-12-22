Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B3C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qunPHrdo5fPLGESSZqXsoBCNg9kfh01EuruFc6Cycfc=; b=ZVFRuxqAdvmEnP
	XnigIsKFKFqZN3Sp8x9qZjY9LbFmfBBT4rVUs+sjRjlE3GU6uuhdUZdXAQC+Hyr1ozVsa8fuUHw6s
	RyXzEWOXyJ9eAePLh/E/k4yNpYN1isiC6m7wbu9rnp7mAEGyiCCjAnn97BwWqsnqBodr8AYK5OT8a
	JUz5aMXQhZo7CEdjzNB5wBJbsdtDBjKzXB4QqQvBkJqJpO1rwPakw+sP4NHMZl4PQ8RKRH805BbYq
	IHl0pJAaYSnTXirbP/6vQVLnIR9hddjOaGWTBz7XC4Lks4dJK+HJzvAK8QVSpvUKGQ3WdVAz0B2sb
	LulGpyMq7WmRw8k3kYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhyB-006Jk4-1E;
	Fri, 22 Dec 2023 16:01:51 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhy8-006Jis-1H
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 16:01:49 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C5D733200A04;
	Fri, 22 Dec 2023 11:01:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 22 Dec 2023 11:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1703260906;
	 x=1703347306; bh=M1tjCvjXqFax0LN2CzOpX/zS+U5B5Gyb2YsaY1tLXjg=; b=
	L+wsFcMcWp8klqBnr9ffs7VxUkRRQCKTQ8vgsURTa4JMmkhBqoq9d/jU0abuWdCC
	weY8e1lPb3SAO6YGvsyHecxgtIpLv1RDJD+IA+b1nCyUQ2YRYO2NAMFU6t1d/gJH
	NpXsFVlqWVMfJ//kw6Bp1L2HONJ6qMpuuTJSyVqPPabx2ZDGKTi2u/cwIkU5Q0/Q
	dyZxJ9JD86iRQNTI+dWtKIaFGeViw6AbrFVjWRUj+6gfowcG64rSKWmEiHCfLtzu
	R9ek6kC46xjoa4DCG4ez+RjkNkEC1HVPrVoPMj9IcSpJ864txYHqrgIT2ij1LRzL
	Pb4oBTuF5yvWXOXhJ31v1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703260906; x=
	1703347306; bh=M1tjCvjXqFax0LN2CzOpX/zS+U5B5Gyb2YsaY1tLXjg=; b=k
	mCx2J0mdUsPR3XI8sF9I0GQVzVjKofWu4PcoGChB7wbsfZGwBdEPhzHtZEGpb6xN
	FcYy9aViZwekcEfZjaqiM8rxYlStkxd24Y17a0FlYjJGdynDZ8j55NXhHx+s1N4A
	FdH/XohUyLeOo05GqC6Q51Nye/WZGvKYVEw4QMLZxVdQ/ErfddcW1sbKfXyrFTla
	43dnPTTzJIDRgXX1XkLGdoioWiT3dRQ9TyXaQynBak8AvcAARt65hQEbOgm2mDb0
	W07baEtc2i4T7jWfn1tMTIrsZtvq9dwilUYUqjjbK86tB3jEUh3qJM6pA5Vk9YLw
	AWgXpgaI3Aw7Q/7au7FiQ==
X-ME-Sender: <xms:6bKFZeKos-zuKrZAdOJJckG7k3CLlKvQFb5D8VEXKIyGS81ziojlLg>
    <xme:6bKFZWIQiCYLvC9360hTiYgIzEy1wr2uq_MBAlNU6Nx6Bpp_aixsJI3bg5tFDH6kr
    ipm2U-GpY-8PEmDPbo>
X-ME-Received: <xmr:6bKFZetdX7TTKKtV26cRvV3kVfLBdJ_tR7B6FDHkVoxMZ85WVFIIDjERrUkQDy-gwD-YoH3tZcx7BUAAVx05WfnEldrFf8pAFkYsxzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddujedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:6bKFZTaLgx4DG9vmg3NHFHShNH4O7KEl1mPuyiq8p7qMF92TxJdnFg>
    <xmx:6bKFZVaOIJMPzFRop3ZBknCWwo-OWLUP5O_NNSdGfU-zzgmp59ugZQ>
    <xmx:6bKFZfB67DCDSJFsNsWAXaqz7qgpdIxur9_Agxe5ZT0rRTeTPZ-pRw>
    <xmx:6rKFZTOXHXHXWIAqDvOwC1WzySlmzsCNVjTDdqrSxjcJgXtD1-cFEQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Dec 2023 11:01:43 -0500 (EST)
Message-ID: <a25d3736-f6ca-478d-8e58-69a7c0e529f7@flygoat.com>
Date: Fri, 22 Dec 2023 16:01:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, Conor Dooley <conor@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, mpe@ellerman.id.au,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
 <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
 <20231222041428.GA2803@lst.de>
 <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru>
 <20231222-outburst-spoiling-75082a7826dd@spud>
 <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru>
 <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com>
 <6fe34090-656d-491f-8173-217d20144166@inbox.ru>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <6fe34090-656d-491f-8173-217d20144166@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_080148_483128_96E85FD8 
X-CRM114-Status: GOOD (  11.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy8xMi8yMiAxNTo1MywgTWF4aW0gS29jaGV0a292IOWGmemBkzoKPiAKPiAKPiBP
biAyMi4xMi4yMDIzIDE4OjQ1LCBKaWF4dW4gWWFuZyB3cm90ZToKPj4KPj4KPj4g5ZyoIDIwMjMv
MTIvMjIgMTU6MzgsIE1heGltIEtvY2hldGtvdiDlhpnpgZM6Cj4+Pgo+Pj4KPj4+IE9uIDIyLjEy
LjIwMjMgMTc6NTQsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Cj4+Pj4+IGV0Yy4uKSBkbyBub3Qg
aGF2ZSB0aGlzIGZlYXR1cmUuIFRoZXNlIGRldmljZXMgd2lsbCB1c2UgdmFsdWUgZnJvbQo+Pj4+
PiBkZXZpY2VfaW5pdGlhbGl6ZSgpLiBBbmQgd2UgaGF2ZSBubyBwb3NzaWJpbGl0eSB0byBjaGFu
Z2UKPj4+Pj4gZG1hX2RlZmF1bHRfY29oZXJlbnQgdmFsdWUgYnkgZGlzYWJsaW5nIEFSQ0hfRE1B
X0RFRkFVTFRfQ09IRVJFTlQuCj4+Pj4+IE1vcmVvdmVyLCBjaGFuZ2luZyBkbWFfZGVmYXVsdF9j
b2hlcmVudCBmcm9tIGZhbHNlIHRvIHRydWUgbWF5IGNhdXNlCj4+Pj4+IHJlZ3Jlc3Npb24gZm9y
IG90aGVyIGRldmljZXMuCj4+Pj4KPj4+PiBIb3cgY2FuIHRoZXJlIGJlIGEgcmVncmVzc2lvbiB3
aGVuIGRtYSBoYXMgYmVlbiBjb2hlcmVudCBieSBkZWZhdWx0IGZvcgo+Pj4+IHRoZSBSSVNDLVYg
a2VybmVsIGZyb20gZGF5IDE/Cj4+Pgo+Pj4gQmVmb3JlIEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJF
TlQgcGF0Y2ggZG1hX2RlZmF1bHRfY29oZXJlbnQgd2FzIHVzZWQgCj4+PiB1bmFzc2lnbmVkIGFz
ICJmYWxzZSIgaW4gZGV2aWNlX2luaXRpYWxpemUoKToKPj4+IC4uLi4uLi4uLi4KPj4+ICNpZiBk
ZWZpbmVkKENPTkZJR19BUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFKSB8fCBcCj4+PiDCoMKg
wqAgZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVSkgfHwgXAo+Pj4gwqDC
oMKgIGRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFVfQUxMKQo+Pj4gwqDC
oMKgwqBkZXYtPmRtYV9jb2hlcmVudCA9IGRtYV9kZWZhdWx0X2NvaGVyZW50Owo+Pj4gI2VuZGlm
Cj4+PiAuLi4uLi4uLi4uCj4+PiBBbmQgbm93IGl0IGJlY29tZXMgInRydWUiLiBJdCBtYXkgY2hh
bmdlIGJlaGF2aW9yIG9mIG90aGVyIG5vbi1EVCAKPj4+IGRyaXZlcnMuCj4+IEkgZG9uJ3Qgc2Vl
IGFueSBwcm9ibGVtIGhlcmUsIGRlZmF1bHQgaXMgZGVmYXVsdC4KPj4gQWN0dWFsbHkgbGVhdmlu
ZyB0aG9zZSBkZXZpY2Ugd2l0aMKgIGRldi0+ZG1hX2NvaGVyZW50ID0gZmFsc2UgaXMgCj4+IHJp
c2t5LCBiZWNhdXNlCj4+IHdlIGNhbid0IGd1YXJhbnRlZSB1bmRlcmx5aW5nIGNhY2hlIGZsdXNo
IGZ1bmN0aW9ucyBhcmUgaGVyZS4KPj4KPj4gSWYgYSBub24tZHQgZGV2aWNlIGRvIG5lZWQgdG8g
b3ZlcnJpZGUgaXQsIGl0IHNob3VsZCBiZSBkb25lIGluIAo+PiBhcmNoX3NldHVwX2RtYV9vcHMu
Cj4gCj4gQnV0IGFyY2hfc2V0dXBfZG1hX29wcygpIGlzIGNhbGxlZCBvbmx5IGZyb20gb2ZfZG1h
X2NvbmZpZ3VyZV9pZCgpIGFuZCAKPiBhY3BpX2RtYV9jb25maWd1cmVfaWQoKS4gU28gaXQgd29y
a3Mgb25seSBmb3IgRFQgYW5kIEFDUEkgZGV2aWNlcy4gV2hhdCAKPiBhYm91dCBwbGF0Zm9ybV9k
ZXZpY2U/CgpBaCBJIHNlZSwgdGhhdCdzIHRoZSBwcm9ibGVtLCBpbiBNSVBTJ3MgdXNlIGNhc2Ug
YWxsIERNQSBjYXBhYmxlIGRldmljZXMKYXJlIGZvbGxvd2luZyBwbGF0Zm9ybSdzIGRlZmF1bHQg
Y29oZXJlbmN5LiBGb3IgUklTQy1WIHdlIGFzc3VtZSBhbGwgCmRldmljZSBhcmUgZW5hYmxlZCBi
eSBBQ1BJIG9yIERULgoKUGVyaGFwcyB5b3UgY2FuIG92ZXJyaWRlIGl0IGluIGRyaXZlciwgYnV0
IHRoYXQgd2lsbCBtYWtlIGRyaXZlcnMgCnBsYXRmb3JtIGRlcGVuZGVudC4KCkknbGwgbGVhdmUg
dGhpcyBxdWVzdGlvbiB0byBDaHJpc3RvcGguCgpUaGFua3MKLSBKaWF4dW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
