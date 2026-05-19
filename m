Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59429CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioIEUYl6lJ2dpvBePv4F6pbQUDJ04h5gxD3xHpUQT4w=; b=uVz5UEZ7EwYZBf
	gvwiM6+EvAfd1uKH1rcOZ04tzUHtq1R2y+E4jeRyIaZACU0jeMRF0frHWNpcQ9sSM1+Jq2IRoU2zp
	PrxGbsttv/6nJtpAuvhO7bpF4hjCOGiEc+vU/e/daQfzrTBb2gqDPs4cjw/mjLBmN0wqSX9C7FW5s
	fC8wxgFw6YWkPNn9mGxzTCaPIsccOa1y0eOzKRjEe2kO3SoAqoRMp+TuPw60bIzArcu+bSC6Gbnwp
	SJ5S8sfPvN1zrAkscAuy5dPSYOEH9AUPrR7IexpxoRT324dnTxNzMToqfX0lyg/ja1pMBdhQddTOq
	1sES60ETmD7fV88OdMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPN6y-00000002CBV-1RUp;
	Tue, 19 May 2026 16:16:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPN6v-00000002CAw-41cX;
	Tue, 19 May 2026 16:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1015960210;
	Tue, 19 May 2026 16:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E7BC2BCB3;
	Tue, 19 May 2026 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207360;
	bh=ZvyXX+KsWZ2Bty8hNC/PaNKLRJHR5CsnAEO1Bw4UQRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxLDXn/wxfxAUg+pVuo7jKn4NkGyioS5jTl2YNmfyEmCsXy5xxDdVtK06YpAswKZq
	 ks7jNsn7Es1zSEJjDfqeg9j6M8qewHMXnjFLxdxUmxGsbY0Uu9E0e5GXeex4QfUCPU
	 GMlCNqWktMub0bBKsVOFNbTOwP2V4BPNw8NleP6fInu0rOSsNv2DcXxoLtSKbrn6cY
	 uV+t38OFIB6jqiz4Lu+fdOd7cHBSU7ekzV/JaZWvxr+HyqG31OvTL0ICP9vnUQBCrK
	 xOsOlW+zW7oYXGb9DiHVb9Zfh25J3E6ZiG5RudqGahGfHIbxSjaCEDCrQXewTuOyug
	 tgK7WlPMFlhkQ==
Date: Tue, 19 May 2026 21:45:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
Message-ID: <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMTI6MDk6MjhBTSArMDgwMCwgSGFucyBaaGFuZyB3cm90
ZToKPiAKPiAKPiBPbiA1LzE5LzI2IDIxOjU3LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6
Cj4gPiBPbiBTYXQsIE1heSAwOSwgMjAyNiBhdCAwOTo1MTo0OVBNICswODAwLCBIYW5zIFpoYW5n
IHdyb3RlOgo+ID4gPiBUaGUgRFdDIFBDSWUgY29yZSBhbmQgaXRzIG1hbnkgcGxhdGZvcm0gZHJp
dmVycyByZXBlYXRlZGx5IGNhbGwKPiA+ID4gZHdfcGNpZV9maW5kX2NhcGFiaWxpdHkocGNpLCBQ
Q0lfQ0FQX0lEX0VYUCkgdG8gb2J0YWluIHRoZSBvZmZzZXQgb2YgdGhlCj4gPiA+IFBDSSBFeHBy
ZXNzIENhcGFiaWxpdHkgc3RydWN0dXJlLiBUaGlzIGlzIHdhc3RlZnVsIGFuZCBtYWtlcyB0aGUg
Y29kZQo+ID4gPiB2ZXJib3NlLiBBbmQgc29tZSBldmVuIHNlYXJjaCBmb3IgdGhlIFBDSV9DQVBf
SURfRVhQIG9mZnNldCB2YWx1ZSB3aXRoaW4KPiA+ID4gdGhlIHN1c3BlbmQvcmVzdW1lIGZ1bmN0
aW9ucy4KPiA+ID4gCj4gPiAKPiA+IFNhc2hpa28gaGFzIGZsYWdnZWQgc29tZSByZWFsIGlzc3Vl
cyB3aXRoIHRoaXMgc2VyaWVzIGluIGFjY2Vzc2luZyBEQkkgc3BhY2UKPiA+IHZlcnkgZWFybHkg
YW5kICdwY2ktPnBjaWVfY2FwJyBiZWluZyAwLgo+IAo+IAo+IEhpIE1hbmksCj4gCj4gV2UgaGF2
ZSBkaXNjdXNzZWQgdGhpcyBpc3N1ZSBpbiB0aGUgQ2FkZW5jZSBkcml2ZXIuIEkgdGhpbmsgaXQg
d29uJ3QgY2F1c2UKPiBhbnkgcHJvYmxlbXMuIFNwZWNpZmljYWxseSBhcyBmb2xsb3dzOgo+IAo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS81ODIzZmFlYy1kOTcyLTRjNzctOTBl
Yy1hMjE1YzY4NmUwYThAMTYzLmNvbS8KPiAiIiIKPiBBcyBwZXIgUENJZSByNy4wLCBzZWMgNy41
LjEuMS4xMSwgU2luY2UgYWxsIFBDSSBFeHByZXNzIEZ1bmN0aW9ucyBhcmUKPiByZXF1aXJlZCB0
byBpbXBsZW1lbnQgdGhlIFBDSSBFeHByZXNzIENhcGFiaWxpdHkgc3RydWN0dXJlLCB3aGljaAo+
IG11c3QgYmUgaW5jbHVkZWQgc29tZXdoZXJlIGluIHRoaXMgbGlua2VkIGxpc3QuCj4gIiIiCj4g
Cj4gCj4gCj4gQmpvcm4gYWxzbyByZXNwb25kZWQgYXMgZm9sbG93czoKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1wY2kvMjAyNjA1MDUyMTIzMDYuR0E3NDQxNThAYmhlbGdhYXMvCj4g
IiIiCj4gSXQncyB0cnVlIHRoYXQgYWxsIFJvb3QgUG9ydHMgbXVzdCBoYXZlIGEgUENJZSBDYXBh
YmlsaXR5Lgo+ICIiIgo+IAoKT2ssIHdoYXQgYWJvdXQgcmVhZGluZyB0aGUgREJJIHJlZ2lzdGVy
cyB2ZXJ5IGVhcmx5PwoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCu
muCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
