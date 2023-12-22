Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A4C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4CcjNhi5hWCII3VmjZ0eo0tbHfu1N1WTQCtnG/RUJ4=; b=WNWbMAwNM2+lID
	Mq8a1qQfA7vPDIrsgO9o8IaEWnkx4bB4UB/EHmwGmJj8wTd/y47V66MvbsbjuMHn43HrfkT3g07k5
	9aG4XouKGqkcirqJlNkWGiwd6+LWEE1myIIrO98L61cB5K0BV7r/2jVdzET2AgJeb4aDDEI8PXI5r
	+Q0u7W5q5F1f/ZxVGPHD/kx9xWSfLVBW9MsEXcxj/P/so1j/uaGokvC/pndudN4pGARoUjgcsXmAY
	68NjMu+x/seXYVOcnucefnNbk1wFDUq6lyB3zAuy2NSYhQ3OoOZHYiCkAGjW0nrUFoDNWxjCVTmPh
	q/n5/yyQPSJeMLvq0fPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhie-006HQx-0q;
	Fri, 22 Dec 2023 15:45:48 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhib-006HOb-0E
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 15:45:46 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id B8A963200A28;
	Fri, 22 Dec 2023 10:45:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 22 Dec 2023 10:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1703259939;
	 x=1703346339; bh=6zFESOLYOJ1DDdmVNp/WKfFuDXzWx4mPHU++2AdAS2g=; b=
	CE0wOMBNfNkM5XslHkcIoMwIII73hgIWhectOKaBavXEURdejv5SkIt/AmUEIOB2
	VtmlXetJnVsIHm3YBTV9/tIHkVigfANDBoYL3zy2lQv3PyH1+106swdLJ6ehpYwV
	p2ilAP65ViFjfUgwsG2xxUZ9pIY4K3nHxEEIpIvGGDsa4coB7E+So2RrUnCxLiRu
	n9r4yRdJV8XJCmFK5TAnRLWxdIWJ0ttpO/NNcNlg6xec8M5KuDwhQyHXNpXP40Rb
	q9EKE8Io399D5T2sWn6g0dUIOpNCHJAzUTkyTP0BrWxa5obBkbo3smNJZsCVCxZm
	wATeiKpkEee0ifRPtnuv6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703259939; x=
	1703346339; bh=6zFESOLYOJ1DDdmVNp/WKfFuDXzWx4mPHU++2AdAS2g=; b=d
	NC8d1TPuieHSHEmdIbIcvr2O+PE//rfojR7jBxJ/WYHaXsWaS4tL3k6Cdc+bRTmb
	O3CkS+Ks11zxOYFYN0Fcu6DfswY1MvhB2aWCpfT5Hp+mdvNW6bkoAFxq2Nvnj57f
	eJBNsf7hKi7wVuirD/ylgYjQ2n0PQkGIx+pBwB6ntyDudwUwz/+UdhQKd1QfTtBY
	MMQF+UdI+L+Vcn1KddVtPQxUmGR2pkHdZQf3Mne+kyxLKdQfWLCVzSI5nqP7aOAF
	pG6XaUZpwy20qEUCx3Z/Xf9FH9ymSb9jE4fCdjzyiOIgoPh7dc9ToQ08x55/E4mq
	oFBkEhE51zpAeEFd2P1tQ==
X-ME-Sender: <xms:Iq-FZURllPKgBOomqiMAhfu9aKti6eNbtYgqTEE1xWN8b0cnlwoIDg>
    <xme:Iq-FZRxS0DZee4IrEVYusWN3Dd8p0EEVOkCFewyNR9po8l9ARfRv31pAFXCRQC0Qj
    RpknJXnNAGZV0n-p_8>
X-ME-Received: <xmr:Iq-FZR12qHFDu8wKjatdfM79IYLK5SEX9P-Br2Z7qXY-ebzZD_R9V1WNzlQ38ifFV6Pt-GezQ6jua9TOcIc-s4SpMWfPgXbmeYaXQuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddujedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Iq-FZYDEdwwZguPqfbjO7AIZgBDlLphTFnLyoBLXVOGZ5mrWXR7GdQ>
    <xmx:Iq-FZdhuzUtWFCr-PMFMNvq_4x-01mLZlUYqjlUPSXBXUof7xBFQXA>
    <xmx:Iq-FZUreFNisdHnuDNDZwlfppZQQkWSB6qoA8_pcYBDKbRXdYD0W9g>
    <xmx:I6-FZeUfhclh-2Ufph8NW4PbJuI8Yal-6qyE6rxEJV7nTKj8ML54uw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Dec 2023 10:45:37 -0500 (EST)
Message-ID: <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com>
Date: Fri, 22 Dec 2023 15:45:34 +0000
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
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_074545_575970_6931890E 
X-CRM114-Status: GOOD (  10.16  )
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

CgrlnKggMjAyMy8xMi8yMiAxNTozOCwgTWF4aW0gS29jaGV0a292IOWGmemBkzoKPgo+Cj4gT24g
MjIuMTIuMjAyMyAxNzo1NCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Cj4+PiBldGMuLikgZG8gbm90
IGhhdmUgdGhpcyBmZWF0dXJlLiBUaGVzZSBkZXZpY2VzIHdpbGwgdXNlIHZhbHVlIGZyb20KPj4+
IGRldmljZV9pbml0aWFsaXplKCkuIEFuZCB3ZSBoYXZlIG5vIHBvc3NpYmlsaXR5IHRvIGNoYW5n
ZQo+Pj4gZG1hX2RlZmF1bHRfY29oZXJlbnQgdmFsdWUgYnkgZGlzYWJsaW5nIEFSQ0hfRE1BX0RF
RkFVTFRfQ09IRVJFTlQuCj4+PiBNb3Jlb3ZlciwgY2hhbmdpbmcgZG1hX2RlZmF1bHRfY29oZXJl
bnQgZnJvbSBmYWxzZSB0byB0cnVlIG1heSBjYXVzZQo+Pj4gcmVncmVzc2lvbiBmb3Igb3RoZXIg
ZGV2aWNlcy4KPj4KPj4gSG93IGNhbiB0aGVyZSBiZSBhIHJlZ3Jlc3Npb24gd2hlbiBkbWEgaGFz
IGJlZW4gY29oZXJlbnQgYnkgZGVmYXVsdCBmb3IKPj4gdGhlIFJJU0MtViBrZXJuZWwgZnJvbSBk
YXkgMT8KPgo+IEJlZm9yZSBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UIHBhdGNoIGRtYV9kZWZh
dWx0X2NvaGVyZW50IHdhcyB1c2VkIAo+IHVuYXNzaWduZWQgYXMgImZhbHNlIiBpbiBkZXZpY2Vf
aW5pdGlhbGl6ZSgpOgo+IC4uLi4uLi4uLi4KPiAjaWYgZGVmaW5lZChDT05GSUdfQVJDSF9IQVNf
U1lOQ19ETUFfRk9SX0RFVklDRSkgfHwgXAo+IMKgwqDCoCBkZWZpbmVkKENPTkZJR19BUkNIX0hB
U19TWU5DX0RNQV9GT1JfQ1BVKSB8fCBcCj4gwqDCoMKgIGRlZmluZWQoQ09ORklHX0FSQ0hfSEFT
X1NZTkNfRE1BX0ZPUl9DUFVfQUxMKQo+IMKgwqDCoMKgZGV2LT5kbWFfY29oZXJlbnQgPSBkbWFf
ZGVmYXVsdF9jb2hlcmVudDsKPiAjZW5kaWYKPiAuLi4uLi4uLi4uCj4gQW5kIG5vdyBpdCBiZWNv
bWVzICJ0cnVlIi4gSXQgbWF5IGNoYW5nZSBiZWhhdmlvciBvZiBvdGhlciBub24tRFQgCj4gZHJp
dmVycy4KSSBkb24ndCBzZWUgYW55IHByb2JsZW0gaGVyZSwgZGVmYXVsdCBpcyBkZWZhdWx0LgpB
Y3R1YWxseSBsZWF2aW5nIHRob3NlIGRldmljZSB3aXRowqAgZGV2LT5kbWFfY29oZXJlbnQgPSBm
YWxzZSBpcyByaXNreSwgCmJlY2F1c2UKd2UgY2FuJ3QgZ3VhcmFudGVlIHVuZGVybHlpbmcgY2Fj
aGUgZmx1c2ggZnVuY3Rpb25zIGFyZSBoZXJlLgoKSWYgYSBub24tZHQgZGV2aWNlIGRvIG5lZWQg
dG8gb3ZlcnJpZGUgaXQsIGl0IHNob3VsZCBiZSBkb25lIGluIAphcmNoX3NldHVwX2RtYV9vcHMu
CgpUaGFua3MKLSBKaWF4dW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
