Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A99EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6dpP9PN/sHXhpCbzVxR3CJMNSexsOMHMguWymoX6GQ=; b=Otjl18if0Xn1if
	BFxflL16hhb18Ko4iRXParpmN0BNlr+WbPP9TZkNOCePHrCCc5LafwpGjyGoGvE1nKXdKPuPoljYR
	Opu5PHMZ58Ijvu8g6BTBxdUE2a2m45ueZpfBj3TWURS4zj9K+XkAnU6905UWSELekC62xrM3E29SK
	TODy5NO1hTzSa9/kj8z1HF0M8I2bG9vT3SQOTeuhrxLk5ReUrrClcco50fHNHVlGgiIu1SRiAg7mh
	7pO7yOVtS/175TPkXhvAbBPctR2ktGnL4BHzVJKiCH91rZHgaNRoKC2jMhryK/QvXlHQmDG2CPIbF
	CJkHUqUZkvLsSU0RUd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD8XV-006RGB-1v;
	Sat, 24 Jun 2023 19:03:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD8XT-006RFf-0u
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 19:03:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2BB16097A;
	Sat, 24 Jun 2023 19:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E4DC433C9;
	Sat, 24 Jun 2023 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687633392;
	bh=3yLec4OQwczkQ/kmMrEsOXE+LLwxkwLipHrOBu3vMcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1VwXEPMtzIaKC1DBEtpFHOmVTY3XKNb7US8u/G0+zLGjiSNjtX511ofFvhnIodi1
	 8bAGG8hqKh4NrHmvmmHhO8uUdcisafeUnEQdBwxv3d/jk/x/sGk3UQ975TBGyre3n6
	 ch0VFTumScrumDlLc0X+o/Vr8tzYfGkjqh/unyG4MWAkxQ2TXj/TzGt/mVIdDEo6/k
	 OWfkmUIstx+cO7cFKg3AQc14CU8+MuW9oz90+STD8bEIckW/ROi33uAe/WR+rOyB8y
	 loTwl+zbOYoqghwNw0pDJIDAYZDqwS23dh0XbbIX3YW178eXwEOJKVifpmPfeV41X8
	 0blEmwhiuA5tw==
Date: Sat, 24 Jun 2023 21:03:08 +0200
From: Simon Horman <horms@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: daire.mcnamara@microchip.com, conor.dooley@microchip.com,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/8] PCI: microchip: Remove cast warning for
 devm_add_action_or_reset() arg
Message-ID: <ZJc97GdtuFSAx1nf@kernel.org>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
 <20230614155556.4095526-3-daire.mcnamara@microchip.com>
 <20230624183428.GF2636347@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624183428.GF2636347@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_120315_374871_76453341 
X-CRM114-Status: GOOD (  16.67  )
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

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMDM6MzQ6MjhBTSArMDkwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IFsrQ0MgU2ltb25dCj4gCj4gSGVsbG8sCj4gCj4gPiBUaGUga2VybmVs
IHRlc3Qgcm9ib3QgcmVwb3J0ZWQgdGhhdCB0aGUgdWdseSBjYXN0IGZyb20KPiA+IHZvaWQoKiko
c3RydWN0IGNsayAqKSB0byB2b2lkICgqKSh2b2lkICopIGNvbnZlcnRzIHRvIGluY29tcGF0aWJs
ZQo+ID4gZnVuY3Rpb24gdHlwZS4gIFRoaXMgY29tbWl0IGFkb3B0cyB0aGUgY29tbW9uIGNvbnZl
bnRpb24gb2YgY3JlYXRpbmcgYQo+ID4gdHJpdmlhbCBzdHViIGZ1bmN0aW9uIHRoYXQgdGFrZXMg
YSB2b2lkICogYW5kIHBhc3NlcyBpdCB0byB0aGUKPiA+IHVuZGVybHlpbmcgZnVuY3Rpb24gdGhh
dCBleHBlY3RzIHRoZSBtb3JlIHNwZWNpZmljIHR5cGUuCj4gCj4gVGhpcyBpcyBhIG5pY2UgY2hh
bmdlLCBidXQgaXQgc2VlbXMgaXQgaGFzIGJlZW4gY2FycmllZCBhbG9uZyBhIGZldyBvdGhlcgo+
IHNlcmllcyBhbmQgdGhyb3VnaCB0aGVpciBkaWZmZXJlbnQgcmV2aXNpb25zLiAgU2ltb24gYWxz
byBmb3VuZCB0aGUgcHJvYmxlbQo+IGFuZCBhZGRyZXNzZWQgaXQgaW5kZXBlbmRlbnRseSBwZXI6
Cj4gCj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMzA1MTEtcGNpLW1p
Y3JvY2hpcC1jbGstY2FzdC12MS0xLTc2NzRmNGQ0ZTIxOEBrZXJuZWwub3JnCj4gCj4gSG93ZXZl
ciwgd2UgaGF2ZSBhIGZldyBvdGhlciBkcml2ZXJzIHdoZXJlIHdlIGNvdWxkIHRha2UgY2FyZSBv
ZiB0aGlzLCBwZXI6Cj4gCj4gZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1o
b3N0LmMKPiA4NjQtCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+IDg2NS0KPiA4NjY6CWRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsICh2b2lkICgqKSAodm9pZCAqKSljbGtfZGlzYWJsZV91bnBy
ZXBhcmUsCj4gODY3LQkJCQkgY2xrKTsKPiA4NjgtCj4gCj4gZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1rZWVtYmF5LmMKPiAxNzAtCj4gMTcxLQlyZXQgPSBkZXZtX2FkZF9hY3Rpb25f
b3JfcmVzZXQoZGV2LAo+IDE3MjoJCQkJICAgICAgICh2b2lkKCopKHZvaWQgKikpY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlLAo+IDE3My0JCQkJICAgICAgIGNsayk7Cj4gMTc0LQlpZiAocmV0KQo+IAo+
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gMTg5LQo+IDE5MC0JZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwKPiAxOTE6CQkJCSAodm9pZCAoKikgKHZvaWQgKikp
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlLAo+IDE5Mi0JCQkJIGNsayk7Cj4gMTkzLQo+IAo+IElmIG5l
aXRoZXIgeW91IG5vciBTaW1vbiBoYXMgb2JqZWN0aW9ucywgSSBjYW4gc2VuZCBhIHNtYWxsIHNl
cmllcyB0bwo+IGFkZHJlc3MgdGhlc2UgaW4gYSBzaW5nbGUgdGFrZS4gIFlvdSBjb3VsZCB0aGVu
IGRyb3AgdGhpcyBwYXJ0aWN1bGFyIHBhdGNoCj4gZnJvbSB2MiBvZiB0aGlzIHNlcmllcywgc2hv
dWxkIHlvdSBzZW5kIGEgc2Vjb25kIHJldmlzaW9uIGF0IHNvbWUgcG9pbnQuCgpIaSBLcnp5c3p0
b2YsCgpTdXJlLCB0aGF0IGlzIGZpbmUgbXkgbWUuCgpNeSAyYyB3b3J0aCwgaXMgdGhhdCBpdCB3
b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBjb21tb24KaGVscGVyIGZvciB0aGVzZSBjYXNlcy4gQnV0
IEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBhYm91dCBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
