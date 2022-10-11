Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBC2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnsi66eEv1AZOgySj4+viBvWudwmb7y2mGGHqOb+864=; b=I6um6nh4XyvEvN
	ZUNoOglGt8y37lM3EiMa8np2TDl3uF0rGwLR4+Q7bnsP0/O6koN3QyQvkRp3+coKWH1AxfLIlCzHT
	0OI2EMdwV1vjPb6kGrUSHycChbhQfs2VZyIPoXVTLKIFGHN6eiXb15bRPHngOIYnLjX+NvVXl14zf
	Wkhvz9B0CxZQRamuO3nCihnwEX0L/i0smocgrATCAa4GcjpcO93vWM/sfMwf0aZu12+fXit/T3zBD
	Ytx9aiGfLq+Mzgq8DYjrGKmp0BMpIW+edyqHTX8MbuVvJJ5cX5awrMB2L+JCWotKReqc4Mb78g52n
	hVD1X1Iw4OdeLvC1sHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEY5-004F5n-U1; Tue, 11 Oct 2022 12:39:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEY3-004F54-8n
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 12:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1BEBFB815A6;
	Tue, 11 Oct 2022 12:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5397AC433D6;
	Tue, 11 Oct 2022 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665491987;
	bh=kunzchOrNhxJ4TlX1sA1be9vS/JGs0Lekk2gqipkh8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jW6jtcsL5GXOGod6XfiNRBewRwunQAWa38fQIEmsdAz7o3RJ82VNKWvN+uvZqJ5bn
	 SJ7rX5AGavoVzTI/PcoW4V9Xaeacosk2vmhIgKbBIrDhewNRtxjqh1DeMLI/BXJ6kD
	 LJvgXBB7Vg5ucZevccOuIKKLm0F8hVZSCTgKIDkJoIeh/w5xxbq8s89Ck9zO30vUXC
	 Uy5ui+/BgBsaKXiLgcqCfLh3s4sxuUKtHsi7jyu4MhYH6fWtD4E57TeoyM+C6lUVhw
	 zT/7k9+a3eUPRb91/lZDYp8/Z5IF+MDqpCgWILW8SVBoYgsTgTY3C26/qzRQhCVky1
	 WbCf0qEEbwHTg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>, Conor Dooley <conor@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Liu Shixin <liushixin2@huawei.com>
Subject: Re: [PATCH v2 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and
 HAVE_ARCH_HUGE_VMALLOC
In-Reply-To: <20221008140506.1066805-1-liushixin2@huawei.com>
References: <20221008140506.1066805-1-liushixin2@huawei.com>
Date: Tue, 11 Oct 2022 14:39:44 +0200
Message-ID: <87tu4ah6un.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_053951_497917_4504468C 
X-CRM114-Status: GOOD (  12.71  )
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

TGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3ZWkuY29tPiB3cml0ZXM6Cgo+IFNpbmNlIHJpc2N2
NjQgaGFzIGFscmVhZHkgc3VwcG9ydCBTQVRQX01PREVfNTcgYnkgZGVmYXVsdCwgaXQgaXMgdGlt
ZSB0bwo+IHN1cHBvcnQgbW9yZSBodWdlcGFnZS1yZWxhdGVkIGZlYXR1cmVzLiBUaGVzZSB0d28g
cGF0Y2hlcyB3aWxsIGVuYWJsZQo+IEhBVkVfQVJDSF9IVUdFX1ZNQVAgYW5kIEhBVkVfQVJDSF9I
VUdFX1ZNQUxMT0MuCj4KCkp1c3QgYSBub3RlOyBUaGUgSFAgc3VwcG9ydCBkb2VzIG5vdCByZXF1
aXJlIHN2NTcuIFBtZC9NZWdhLSBhbmQKcHVkL2dpZ2FwYWdlcyB3b3JrIGZvciBzdjM5IGFuZCBz
djQ4IGFzIHdlbGwuCgo+IHYxLT52MjogRml4IHRoZSBidWlsZCBlcnJvciByZXBvcnRlZCBieSBr
ZXJuZWwtdGVzdC4KPgo+IExpdSBTaGl4aW4gKDIpOgo+ICAgcmlzY3Y6IEVuYWJsZSBIQVZFX0FS
Q0hfSFVHRV9WTUFQIGZvciA2NEJJVAo+ICAgcmlzY3Y6IEVuYWJsZSBIQVZFX0FSQ0hfSFVHRV9W
TUFMTE9DIGZvciA2NEJJVAo+Cj4gIC4uLi9mZWF0dXJlcy92bS9odWdlLXZtYXAvYXJjaC1zdXBw
b3J0LnR4dCAgICB8ICAyICstCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92bWFsbG9jLmggICAg
ICAgICAgICAgIHwgMTggKysrKwo+ICBhcmNoL3Jpc2N2L21tL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvbW0vcGd0YWJsZS5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAx
MDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9tbS9wZ3RhYmxlLmMKPgoKSSd2ZSB0YWtlbiB0aGlzIHNlcmllcyBmb3IgYSBzcGlu
LCBhbmQgdGVzdGVkIGh1Z2UgcHVkIHBhZ2VzIHZpYQppb3JlbWFwKCksIGFuZCBodWdlIHBtZCBw
YWdlcyB2aWEgdm1hbGxvY19odWdlKCkgb24gcWVtdSBmb3Igc3YzOSwgc3Y0OCwKYW5kIHN2NTcu
CgpQYXRjaCAyIGhhdmUgYSBzcGVsbGluZyBlcnJvciBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6ICJl
bmJhbGUiIHZzCiJlbmFibGUiLgoKRml4IHVwIHRoZSBzcGVsbGluZyBlcnJvciBpbiBwYXRjaCAy
LCBhbmQgYWZ0ZXIgdGhhdCBmZWVsIGZyZWUgdG8gYWRkCmZvciB0aGUgd2hvbGUgc2VyaWVzOgoK
UmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+ClRlc3RlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCgpOaWNlIHdvcmshCkJqw7ZybgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
