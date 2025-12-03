Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B23D1BDD8
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxxYcBuPIJZ4bmJGPrLl8LYJkKVw4SUVAGRuhvURKXs=; b=S+NH8JrSS4ELNp
	8xVt6UswAK+DWPnDbVGbGxiWMHSoSxMOceFDFp7Njj0ELOthNanrcNb7vcPoFfMdsWtDFJthL5dtX
	PpE+x0b8sQo6rrJLeQ03KvrVtxhYUL2ge3vtsCQ78bbsXrPkLNjXLL8a1IX5F+lkP5wqs3YpoxnYG
	ycUChY8GoW0qTCX5nv+aj0nicGIIMLeCLicwpfSRuUrfwfAgD7K705Tg5Di9jTuECvt9k3lAQF2VT
	S6fHot30n7fzA3vuxwh6F0FitURfbxM+G13i2xtmsdnYX8XVpS/fKjp2TjS18aieCxJJP6gfVB/2s
	Mff0jtt96RKZTBUd19aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtjm-000000073Lv-3pM9;
	Wed, 03 Dec 2025 20:46:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtjj-000000073LM-2its
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 20:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4054401EC;
	Wed,  3 Dec 2025 20:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5166BC4CEF5;
	Wed,  3 Dec 2025 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764794766;
	bh=67TvZRH+k7C9k9ySFwvqEZOgGkKKvpNdfGsHbvBaEHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxaT1ghx1Cs5MaoUEnTc4f9jhRSUKSJAF7UgE5hUAFZb9glFdog1YhNf26FFZ+ODM
	 2XpRCjnaC780TF64mA137Fo3sG22iUlTuerwvwhgTkDv91QVatU0nRpjSUjUG67QbK
	 AmpHO8lcQ56nVINOYt+Tw5V6mBisl3R18B7ogUVC6B00EGzrbk5LiErJufV0F83+MK
	 ttreOENNQlJWRrRzpZVF5TqeQtOPbqgKN8YY/gf4/Oer9jGwg7C7mVHLK1etikxxE3
	 cy1h2INC06cWpbrglUi/YfZOn+gzJ2P1QMmzbygjOGW7OoZ2Nbepn+Y/KzDTPdPOsb
	 hRAZk6IX3D0Og==
Date: Wed, 3 Dec 2025 21:46:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <rha5zun6qxzpbi5arzsjaywgzzardvsrjyibaw42yqpom6nx47@wmusvc7bqhl5>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_124607_735788_E44A9B17 
X-CRM114-Status: GOOD (  14.36  )
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

SGkgVHJveSwKCk9uIFRodSwgTm92IDEzLCAyMDI1IGF0IDA5OjIxOjUwUE0gKzA4MDAsIFRyb3kg
TWl0Y2hlbGwgd3JvdGU6Cj4gVGhpcyBjb21taXQgYWRkcmVzc2VzIHR3byBpc3N1ZXMgY2F1c2lu
ZyBpMmMgZGV0ZWN0IHRvIGZhaWwuCj4gCj4gVGhlIGlkZW50aWZpZWQgaXNzdWVzIGFyZToKPiAK
PiAxLiBJbmNvcnJlY3QgZXJyb3IgaGFuZGxpbmcgZm9yIEJFRCAoQnVzIEVycm9yIE5vIEFDSy9O
QUspOgo+ICAgIEJlZm9yZSB0aGlzIGNvbW1pdCwgQm90aCBBTEQgKEFyYml0cmF0aW9uIExvc3Mg
RGV0ZWN0ZWQpIGFuZAo+ICAgIEJFRCByZXR1cm5lZCAtRUFHQUlOLgo+IDIuIE1pc3NpbmcgaW50
ZXJydXB0IHN0YXR1cyBjbGVhciBhZnRlciBpbml0aWFsaXphdGlvbiBpbiB4ZmVyKCk6Cj4gICAg
T24gdGhlIEsxIFNvQywgc2ltcGx5IGZpeGluZyB0aGUgZmlyc3QgaXNzdWUgY2hhbmdlZCB0aGUg
ZXJyb3IKPiAgICBmcm9tIC1FQUdBSU4gdG8gLUVUSU1FT1VULiBUaHJvdWdoIHRyYWNpbmcsIGl0
IHdhcyBkZXRlcm1pbmVkIHRoYXQKPiAgICB0aGlzIGlzIGxpa2VseSBkdWUgdG8gTVNEIChNYXN0
ZXIgU3RvcCBEZXRlY3RlZCkgbGF0ZW5jeSBpc3N1ZXMuCj4gCj4gICAgVGhhdCBtZWFucyB0aGUg
TVNEIGJpdCBpbiB0aGUgSVNSIG1heSBzdGlsbCBiZSBzZXQgb24gdGhlIG5leHQgdHJhbnNmZXIu
Cj4gICAgQXMgYSByZXN1bHQsIHRoZSBjb250cm9sbGVyIHdvbid0IHdvcmsg4oCUIHdlIGNhbiBz
ZWUgZnJvbSB0aGUgc2NvcGUgdGhhdAo+ICAgIGl0IGRvZXNuJ3QgaXNzdWUgYW55IHNpZ25hbC4K
PiAgICAoVGhpcyBvbmx5IG9jY3VycyBkdXJpbmcgcmFwaWQgY29uc2VjdXRpdmUgSTJDIHRyYW5z
ZmVycy4KPiAgICBUaGF0IGV4cGxhaW5zIHdoeSB0aGUgaXNzdWUgb25seSBzaG93cyB1cCB3aXRo
IGkyY2RldGVjdC4pCj4gCj4gV2l0aCB0aGVzZSB0d28gZml4ZXMsIGkyYyBkZXZpY2UgZGV0ZWN0
aW9uIG5vdyBmdW5jdGlvbnMgY29ycmVjdGx5IG9uIHRoZSBLMSBTb0MuCj4gCj4gRml4ZXM6IDVl
YTU1ODQ3M2ZhMzEgKCJpMmM6IHNwYWNlbWl0OiBhZGQgc3VwcG9ydCBmb3IgU3BhY2VtaVQgSzEg
U29DIikKPiBUZXN0ZWQtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4K
PiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNl
bWl0LmNvbT4KCm1lcmdlZCB0byBpMmMvaTJjLWhvc3QuCgpUaGFua3MsCkFuZGkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
