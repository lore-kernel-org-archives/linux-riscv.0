Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5B3C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 00:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JVy32tcDT5VCX21x2teO625/GpWXcwS7fCtqjwJoNM=; b=m1KCdY8sZ5mda4
	XQ0NJYl3N3UeJMHpZJVHz0eJ29p2wyZRlUaP5vXLOJhXJG3nz5RPU9F53YCIMpjyEjJiWggnRDjl2
	+i8sWp5AbAXSZClEz4d1zB7+P1a5gknLRyit/70MMVUsOsKhlW0UhBBggqraMJP3yShqL4pnGGReA
	Kidme26VQhc7W4msviJqAz42/LGgvkOpw9kClwKnXT/1uI+zrpTtRveEPfVvfGD5eyqecj/OU7sPi
	lJTrv+bmFRqHf+i7U8rbQ8wAWBEjfoJG2ej0Yvky1LcKeVhxeoSGmhuzQ0YyocljNPibXaNH4lbVN
	ywrYM+9xL5o0BX7Az0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXt22-003oaZ-5Y; Fri, 03 Mar 2023 00:12:18 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXt1y-003oYe-Kp
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 00:12:16 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PST185lsbz4x1R;
	Fri,  3 Mar 2023 11:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677802320;
	bh=y8wWNYars5Wp25KTgB4IaQUGxk80vrVSQ9DCSBUaDpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nCx/NlLyhE7MIPjtBUMoILPKlGudC5d2X4jiywJrXt2G2IbBAq3FuwrzyeIV1XsQ/
	 NJhxQxGiIyBkyMp8QrPWxWlSps7uA0HF0VhGHR8xtsyc5kcZdN8wLecb13lRYyN5Hz
	 JvK4CU2orYG4IpG++/9+SS5Tnbgxt4LZ7o7S0eHrjAY8/NH1bGMEfge/UGx+342qiA
	 8n1Mfv5d3ZTVAJoN4lBQczBMy4E8yRwtygE/uOKh0UeJvdODbBM5s6hm+TCpqKu5ID
	 j22U/sK3TyINj7wezs+YeHg9OQFhmM2QorjVFKz4640ZVitj5YmZ1+DCSX/d+VPxM1
	 nK5PnlzmxfGRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Christoph Hellwig <hch@lst.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/5] of: address: Always use dma_default_coherent for
 default coherency
In-Reply-To: <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-6-jiaxun.yang@flygoat.com>
 <20230301130613.GC467@lst.de>
 <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
Date: Fri, 03 Mar 2023 11:11:56 +1100
Message-ID: <87356mlmlv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_161214_930607_8184D35D 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPiB3cml0ZXM6Cj4+IDIwMjPlubQz
5pyIMeaXpSAxMzowNu+8jENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiDlhpnpgZPvvJoK
Pj4gCj4+PiAtIHNlbGVjdCBPRl9ETUFfREVGQVVMVF9DT0hFUkVOVCBpZiAhTk9UX0NPSEVSRU5U
X0NBQ0hFCj4+IAo+PiBEb2Vzbid0IHBvd2VycGMgbmVlZCB0byBzZWxlY3QgQ09ORklHX0FSQ0hf
RE1BX0RFRkFVTFRfQ09IRVJFTlQgbm93LAo+PiBvciBldmVuIGJldHRlciBzaG91bGQgYmUgZG9p
bmcgdGhhdCBpbiB0aGUgcGF0Y2ggYWRkaW5nIHRoYXQKPj4gc3ltYm9sPwo+Cj4gSWYgSSByZWFk
IHRoZSBjb2RlIGNvcnJlY3RseSBmb3IgcG93ZXJwYyBPRl9ETUFfREVGQVVMVF9DT0hFUkVOVCBp
cyBvbmx5IHNlbGVjdGVkCj4gd2l0aCAhTk9UX0NPSEVSRU5UX0NBQ0hFLCB3aGljaCBtZWFucyBu
b24tY29oZXJlbnQgZG1hIHN1cHBvcnQgaXMgZGlzYWJsZWTigKYuCgpJIHRoaW5rIHlvdSdyZSBy
aWdodCwgYnV0IGl0J3Mgbm90IGVhc3kgdG8gdW5kZXJzdGFuZC4KCnBvd2VycGMncyBOT1RfQ09I
RVJFTlRfQ0FDSEUgc2VsZWN0czoKCiAgc2VsZWN0IEFSQ0hfSEFTX0RNQV9QUkVQX0NPSEVSRU5U
CiAgc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UKICBzZWxlY3QgQVJDSF9IQVNf
U1lOQ19ETUFfRk9SX0NQVQoKClRoZW4gaW4geW91ciBwYXRjaCAzIHlvdSBkbzoKCiAjaWYgZGVm
aW5lZChDT05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRSkgfHwgXAoJZGVmaW5lZChD
T05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVSkgfHwgXAoJZGVmaW5lZChDT05GSUdfQVJD
SF9IQVNfU1lOQ19ETUFfRk9SX0NQVV9BTEwpCi1ib29sIGRtYV9kZWZhdWx0X2NvaGVyZW50Owor
Ym9vbCBkbWFfZGVmYXVsdF9jb2hlcmVudCA9IElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfRE1BX0RF
RkFVTFRfQ09IRVJFTlQpOwogI2VuZGlmCgpTbyBmb3IgcG93ZXJwYyBpZiBOT1RfQ09IRVJFTlRf
Q0FDSEU9biwgdGhlbiBub25lIG9mIHRob3NlIEFSQ0hfSEFTCnN5bWJvbHMgYXJlIGRlZmluZWQs
IGFuZCBzbyBDT05GSUdfQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVCBpcyBuZXZlciB1c2VkLgoK
QnV0IGxpa2UgSSBzYWlkIGl0J3Mgbm90IHZlcnkgb2J2aW91cywgYW5kIGl0IGFsc28gc2VlbXMg
ZnJhZ2lsZSB0bwpmdXR1cmUgY2hhbmdlcy4KClNvIGl0IHNlZW1zIGl0IHdvdWxkIGJlIG1vcmUg
ZnV0dXJlIHByb29mLCBhbmQgc2VsZiBkb2N1bWVudGluZyBmb3IKcG93ZXJwYyB0byBqdXN0IGhh
dmU6CgogICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UIGlmICFOT1RfQ09I
RVJFTlRfQ0FDSEUKCgpjaGVlcnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
