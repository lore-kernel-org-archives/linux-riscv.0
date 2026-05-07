Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C3CD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuY9dLS4HbIU/F1EW4lVnH021EylrLNz2jJRHKT6G8M=; b=gcAhRsHi1yQ6VA
	T8MiprDmEnnjzhUD4T9RIeXDGWCC00u6B930Wts4tpFxHFd4GZX80qyy/Ibyl3X/b9XiR7qUN756p
	vOdOSzg5mlds2jHDvF1q6iPPGMqxxx/J09GD9ikd5ihPpcNBwVdHhlAIhLtMG20F85LnW0Bz4Hw0l
	IxTzHu539FfuroQc8YRHfS5tgJQusXYJyvSrNWPcGauechDSJLhYQKlSPYBaktJig5EfxxCqK5c2l
	I8cOzH3LuUqIOxj+RZ1b3CmnG7J3QPFo4BpidtdqQLNcAfVbY2S4IQ0C1yOcExJzBkXRwSnIsmeu2
	mvIjZglo8cNU7WZYV/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuTJ-00000003FY9-2Ss2;
	Thu, 07 May 2026 08:52:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuTH-00000003FXS-2lrQ
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 08:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A548D6024D;
	Thu,  7 May 2026 08:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D18C2BCB2;
	Thu,  7 May 2026 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778143958;
	bh=e2KUBzxwA3gtOemcz+CllnnM9kBcLQ+NeToRBmvqxJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyfjQvl0OFDtLsJMtcOX4gRAOKpz3gYKE1lcWfQuti3f0wwiRd+58C4XXmi4yKJYY
	 8xySrStcmoAWhSiITh0Nc8J8JHW+KK98c5c+1rbZHLu3TpLwjIwvuPDXRThNBg8lbU
	 tKo75ABwT0P8No3ghKUFJ8WzyTUhwc2uSX1W76n2krgEfyLpvCdupG1G9Nmg6Q9EX4
	 F7PYiM8qW+lzXIVlsN6WIjICPsbxmvbICo6Lakhzoz/WP0USd6MsWdx/1YSVmOOwdZ
	 C8Dz67PhQ4UGsG6jGyI9xtGSMVCHi2lo3sLlpHYKDv8Wc/1pZl5r7sgdfrUb9cNx2n
	 o/Sfi306SjVEw==
Date: Thu, 7 May 2026 14:22:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>, 
	Bjorn Helgaas <bhelgaas@google.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <wy4voivjmaekmevp6upwo2roooskfd7kughnxir7opzv3px4jx@h42kmtsjsoex>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
 <afZUxYhkCQ0wG0Uu@wunner.de>
 <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
 <afcMtlBJYeuxSqZr@wunner.de>
 <afveQQI-CsQ2L1-N@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afveQQI-CsQ2L1-N@inochi.infowork>
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

T24gVGh1LCBNYXkgMDcsIDIwMjYgYXQgMDg6NDE6MjNBTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBPbiBTdW4sIE1heSAwMywgMjAyNiBhdCAxMDo1MjowNkFNICswMjAwLCBMdWthcyBX
dW5uZXIgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAwMywgMjAyNiBhdCAwMzoxMDo1OFBNICswODAw
LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiBJdCdzIHVzZWQgaW4gbXVsdGlwbGUgcHJvZHVj
dHMsIGJ1dCBvbmx5IG9uZSBvZiB0aGVtIChFVkJ2MSwgd2hpY2ggaXMKPiA+ID4ganVzdCBhbiBl
YXJseSBFVkIgYXZhaWxhYmxlIGZvciBhIGZldyBwZW9wbGUgaW5jbHVkaW5nIG1lKSBsYWNrcyBh
bgo+ID4gPiBvbmJvYXJkIHN3aXRjaCwgYmVjYXVzZSBTRzIwNDIgaXMgc2hvcnQgb24gb24tY2hp
cCBwZXJpcGhlcmFscy4gQWxsCj4gPiA+IG90aGVyIGRldmljZXMgKGluY2x1ZGluZyB0d28gbWFp
bmxpbmVkIG9uZXMsIEVWQnYyIGFuZCBNaWxrLVYgUGlvbmVlciwKPiA+ID4gYW5kIHVubWFpbmxp
bmVkIGR1YWwgc29ja2V0IHJhY2sgc2VydmVyczsgTWlsay1WIFBpb25lZXIgc2hvdWxkIGJlIHRo
ZQo+ID4gPiBtb3N0IHBvcHVsYXIgZGV2aWNlIGJlY2F1c2UgaXQgd2FzIG9uIHNoZWxmKSBoYXZl
IGFuIG9uYm9hcmQgc3dpdGNoIHRvCj4gPiA+IG1pdGlnYXRlIHRoZSBsYWNrIG9mIG9uLWNoaXAg
cGVyaXBoZXJhbHMgaW4gU0cyMDQyLgo+ID4gCj4gPiBXaG8ga25vd3MsIG1heWJlIHNvbWVvbmUg
d2lsbCBkZXNpZ24gYSBwcm9kdWN0IHdoaWNoIGRvZXNuJ3QgYXR0YWNoCj4gPiBhIFBDSWUgc3dp
dGNoIHRvIHRoZSBTb0MsIG1heWJlIHRoZSBsYWNrIG9mIHBlcmlwaGVyYWxzIGlzbid0IGEKPiA+
IHByb2JsZW0gZm9yIHRoZW0uCj4gPiAKPiA+IEl0IHNlZW1zIHJlYXNvbmFibGUgdG8gYWNjb21t
b2RhdGUgc3VjaCBub24tc3dpdGNoIHVzZSBjYXNlcyBhcyB3ZWxsLAo+ID4gc28gSSB0aGluayB5
b3UgZGVmaW5pdGVseSBkbyBub3Qgd2FudCB0byBxdWlyayBhbGwgcHJvZHVjdHMgdXNpbmcgdGhh
dAo+ID4gU29DIGJ1dCBvbmx5IHRob3NlIHRoYXQgbmVlZCBpdCwgcmVnYXJkbGVzcyB3aGV0aGVy
IGl0J3MgdGhlIG1ham9yaXR5Lgo+ID4gCj4gCj4gSSB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBx
dWlyayBhbGwgdGhlIFNHMjA0MiBwcm9kdWN0cywgYmVjYXVzZSB0aGUKPiB0eXBpY2FsIHVzYWdl
IGFscmVhZHkgc2hvd3MgTVNJIHNob3J0YWdlIChBbmQgdGhpcyBpcyB3aHkgU0cyMDQ0IGhhcwo+
IDUxMiBNU0lzKS4gQWx0aG91Z2ggaXQgbWF5IGxlZnQgc29tZSBNU0lzIGluIHRoZSB0ZXN0IGNh
c2UsIE1TSSBzaG9ydGFnZQo+IGlzIGEgY29tbW9uIGlzc3VlIGluIGEgcmVhbCBzY2VuYXJpby4g
QW5kIHRoZSBTb3BoZ28gYWxyZWFkeSBtYWludGFpbnMKPiBhIHdoaXRlbGlzdCB0byBsaW1pdCB0
aGUgTVNJIHVzYWdlIG9mIG1vc3QgZGV2aWNlcyBpbiB0aGVpciB2ZW5kb3IKPiBrZXJuZWwuIFNv
IEkgdGhpbmsgaXQgaXMgZmluZSB0byBxdWlyayBhbGwgdGhlIHByb2R1Y3RzIHRoYXQgdXNlIFNH
MjA0Mi4KPiAKCkknbSBub3QgdG9vIHN1cmUgYWJvdXQgcXVpcmsuIFdlIHVzdWFsbHkgYWRkIHF1
aXJrcyB0byB3b3JrYXJvdW5kIHRoZSBoYXJkd2FyZQppc3N1ZXMuIEJ1dCB3aGF0IHlvdSBhcmUg
c2VlaW5nIGlzIGEgcGxhdGZvcm0gbGltaXRhdGlvbiwgd2hpY2ggaXMgYSBjb21tb24Kc2NlbmFy
aW8uIFNvIGFkZGluZyBhIGNtZGxpbmUgcGFyYW0gd291bGQgaGVscCBvdGhlciBwbGF0Zm9ybXMg
YXMgd2VsbCAod2l0aG91dAphbnkgbW9yZSBjb2RlIGNoYW5nZXMpLgoKLSBNYW5pCgotLSAK4K6u
4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
