Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FC0CD5BC9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJfjxehXYxdlU2Po3t1Eg2e+PEIjJ10C1EotNP6gBsA=; b=Zi7zTL0wQ/sgqE
	sB6AypQgjwBMKW7yps+Hbg1o5AEX/Ely7lmmdVEDe/OQxbJB+4fX53XgYLBkpb9fKZokRDf6TxmgB
	eqTY3Xl3QTLRzpTvv8GcP1ruXM82R22rRgCKMMFXSoo/YaSld/S+SygVVGL2Cy45f2pZzgGIEvAyH
	/jWBlWLBk8+3pUiAapHtGBh7kYFtPdvPHbqvTXdxXcHQ71h5twStWOCebL5WRQqpkVWxzKF/1c1Tv
	4Ix5Ik1k/5G/iJT5EEPWZBPpPhO4W/LtO3yGmSGw9JZCFboXkTGOFPzQJPdgvQpX3sIPwIRwOv9Uy
	5g9VrmA1lOy/UDlfgmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVAF-0000000HHyL-2mee;
	Mon, 25 May 2026 13:16:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVAE-0000000HHy5-1dfo
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 13:16:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69137600C3;
	Mon, 25 May 2026 13:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A401F000E9;
	Mon, 25 May 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714973;
	bh=6UIuQRfv+UYVJqZIp+HBt5FvsWW0qcjFFZ8GAxI7t2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbmlAnIs/faHTIuHHvV8JMFp7Y8b+haaZfFACz0NX5xAK6EBWpj29zYMTUO0S+pod
	 L7hcxEQgwyAv76oCXL93o8572ihIT4ByXDYsuuqGDEZyJXxSIfBz6rQP7mw8J7c9cW
	 0b0yv2zLCm0gIFsVEvZYoSoNfsRhWWnhonqSC+ZVMqSMr/zXnfro0wND67FWuHCUbC
	 FOo9ezmMvGjXTPdEL4X+LRvyc2bZ2Rni6zGeZ1H+fhnp89mhH38CWIh6QUrGQD9sUf
	 R0MGaQ69wMyuDvl8La0qb+e19htvquteiXtB2BqZ2ew9VX4GQEbOraR/SIdJ/mNgpO
	 0fMrX1r08x5dg==
Date: Mon, 25 May 2026 13:16:09 +0000
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
Message-ID: <20260525131609-GKA3748271@kernel.org>
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
 <20260519232154-GKA3708537@kernel.org>
 <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpPbiAxMDo0OCBNb24gMjUgTWF5ICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMToyMeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiA+IENhbiB5b3UgdGFrZSB0aGlzIGFzIGEgZml4IGZvciB2Ny4x
IGN5Y2xlPwo+IAo+IE9ubHkgaWYgeW91IGNhbiBwcm92aWRlIHByb29mIHRoYXQgaXQgaXMgYSBy
ZWdyZXNzaW9uLCBpLmUgY3Jhc2hlcwo+IHN5c3RlbXMgdGhhdCB3ZXJlIHdvcmtpbmcgd2l0aCB2
Ny4wLgo+IApPaywgSSdtIGZpbmUgd2l0aCBpdCBhcHBsaWVkIGFzIG5vbmNyaXRpY2FsIGZpeGVz
LCBhcyB0aGUgcHJvYmxlbSBleGlzdAppbiB2Ny4wIGFuZCBjYW4ndCBzYXkgaXQncyBhIHJlZ3Jl
c3Npb24sIGl0IHNob3VsZG4ndCBjYXVzZSBjcmFzaGVzIGJ1dApvbmx5IGZhaWwgdG8gY29uZmln
dXJlIHBpbiB3aGVuIGlkIGVxdWFsIHRvIDAuCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
