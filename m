Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15831EE49A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgGsUgzH1987EreRuzBXM7GTp5eBmsVKGW5Ex/rXqg8=; b=AX9Grqwf3pZi6v
	hoErSKM6LPCEpVNtGygpgHbx/qIsewrBhgt7HcL6tm5asT1sCOMQejldYnfo3ZgXTkKMTRhTIpbIc
	TXbZ1M0LwG6kj/GbuP+vaxOz5BMbm9nEkVlfKGxvBIEd2S5Ie0sXXUhTn42mQgNk5po6WZqn99X4G
	QqXnE9fy1IqqrpfYf8EEfu5awuCuWHKKLCZMuG67GLqnLqUFeIqKOaaWxEB+6wcRC0nr72SnJ1dpL
	xxfLmQiSEILxbyN0GkiTo8xC1LRA3io4AltsPukPwOAMjaXL43t/be8VMLDskT/vIUh2eNC+yBUU0
	bhJpT2lh2+UdviaE6UYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhq6-00HQSJ-2K;
	Wed, 23 Aug 2023 06:59:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhq4-00HQRR-06
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 06:59:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53C8C649DD;
	Wed, 23 Aug 2023 06:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F75C433C8;
	Wed, 23 Aug 2023 06:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692773973;
	bh=Nb5NOLMCbzrJX2FpremlVeT/Pn2TmlTfjHH3zhMBlVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=baXqW9D/x7mqIxT04bR8D7YS/EpFiAeSSufKKGHltxhzDeJl5YbiiE3qQcMR6iWDL
	 BfC+0brQB7Mtu5zt4/lYbHTOEB3MGg0q1fgygt6V/NalvylqlaBK99iFlBv9PTOZF5
	 wXDud0DVZhpo4GcafBXOo02+Njp77A4/2HCc4jz3iavegL1XCWkyCvJO9qXM6NiNKE
	 XNCTUZbyPczjPTpSZ6xdokmH0Y03WgWtHcsVvskeXq58tOv2KDWK/IhLXA8x6pJY48
	 omjBXXqgmSF5hAg1q8aZYb5Ge8aZ60OmVl5hLwlK6u44BjZ2PBCrq9B55MUJn/DFN3
	 DKrg0+tNM97ew==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Aug 21 (riscv-64 asm)
In-Reply-To: <0111b49a-8cdf-2c1a-bab3-d1fd647aafa6@infradead.org>
References: <20230821164605.7bac05f1@canb.auug.org.au>
 <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
 <87ttsr33a8.fsf@all.your.base.are.belong.to.us>
 <0111b49a-8cdf-2c1a-bab3-d1fd647aafa6@infradead.org>
Date: Wed, 23 Aug 2023 08:59:30 +0200
Message-ID: <87bkeyxmzx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_235936_109096_F69D56D6 
X-CRM114-Status: GOOD (  12.19  )
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

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyaXRlczoKCj4gSGksCj4KPiBP
biA4LzIyLzIzIDAxOjExLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JpdGVzOgo+PiAKPj4+IE9uIDgvMjAvMjMgMjM6NDYsIFN0
ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4+Pj4gSGkgYWxsLAo+Pj4+Cj4+Pj4gQ2hhbmdlcyBzaW5j
ZSAyMDIzMDgxODoKPj4+Pgo+Pj4KPj4+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6IElu
IGZ1bmN0aW9uICdkb19pcnEnOgo+Pj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzozODQ6
MTogZXJyb3I6IHMwIGNhbm5vdCBiZSB1c2VkIGluICdhc20nIGhlcmUKPj4+ICAgMzg0IHwgfQo+
Pj4gICAgICAgfCBeCj4+PiAuLi9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYzogSW4gZnVuY3Rpb24g
J2RvX3NvZnRpcnFfb3duX3N0YWNrJzoKPj4+IC4uL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jOjk0
OjE6IGVycm9yOiBzMCBjYW5ub3QgYmUgdXNlZCBpbiAnYXNtJyBoZXJlCj4+PiAgICA5NCB8IH0K
Pj4+ICAgICAgIHwgXgo+Pj4KPj4+Cj4+PiAyIG91dCBvZiAxMCByaXNjLXYgNjQtYml0IGJ1aWxk
cyBmYWlsZWQgd2l0aCB0aGVzZSBlcnJvcnMuCj4+Pgo+Pj4gSXMgdGhpcyBhIHRvb2xjaGFpbiBw
cm9ibGVtIG9yIHNvbWV0aGluZyBlbHNlPwo+PiAKPj4gSG1tLCBkbyB5b3UgaGF2ZSBhIGxpbmsg
dG8gY29uZmlnL3Rvb2xjaGFpbi9sb2csIG9yIHNpbWlsYXI/Cj4KPiBUaGUgZnVsbCByYW5kY29u
ZmlnIGZpbGUgaXMgYXR0YWNoZWQuCj4KPiBUaGUgdG9vbGNoYWluIGlzIEFybmQncyBidWlsZCBv
ZiBnY2MgMTMuMS4wIGZyb206Cj4gICBodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1
Yi90b29scy9jcm9zc3Rvb2wvCj4gKHg4Nl82NCBob3N0KQo+Cj4gSG0sIEkgc2VlIHRoYXQgdGhl
IGxhdGVzdC9jdXJyZW50IHRoZXJlIGlzIGdjYyAxMy4yLjAuCj4gSSdsbCB1cGdyYWRlIGxhdGVy
IHRvZGF5LgoKVGhhbmtzIFJhbmR5ISBJIGNhbiByZXByb2R1Y2Ugd2l0aCBHQ0MgMTIgb24gbXkg
bWFjaGluZS4KClRoZSBjb25maWcgaGFzCiB8ICMgQ09ORklHX0ZSQU1FX1BPSU5URVIgaXMgbm90
IHNldApidXQgZm9yIHNvbWUgcmVhc29uICItZm5vLW9taXQtZnJhbWUtcG9pbnRlciIgaXMgcGFz
c2VkIHRvIEdDQyBhbnl3YXksCndoaWNoIGlzIHdoeSBHQ0MgY29tcGxhaW5zIGFib3V0IHMwIChG
UCBvbiBSSVNDLVYpIGluIGFzbS4KCgpJJ2xsIGRpZyBhIGJpdCBtb3JlLgpCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
