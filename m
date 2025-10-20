Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DBCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGQvsk/RUGry3UxGcokGiG3OPdjdBKvHtR6HTB7NjY4=; b=fMqB06F0x/mg83
	8kXiYRNb3iDd7nxNAAPC8B7JuqgWQYvPo2QT1c1VEwZYWGrucoyomFOXJbd7mLmISeDsK+XMChxtd
	p/riaKHm5rSDWKQ+GuL2VD8BHBlwBGo92eBCAGPmNlhnXBAMJUO56O12eTq8QBEeaOPDF4iL7ElPF
	CcZpKScl2I8FY/WjtN3YKC/2qBCXaY1bjbDT4i1kLBtOdu9bsDkmPHQxl5SgpaafsgcDWXqpXNeRs
	SVYc0ncF3DVbQxoq+fCt9FDzKH420ij1g+FWKtGDZ2Mhimj9lYl3HVJKVMseHc9Ly3qWK6GRQoS7f
	ISwDUU/uIbwnc6LnD6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfU9-0000000BhB6-2VVk;
	Mon, 20 Oct 2025 02:18:57 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAfU5-0000000BhAh-1FAj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 02:18:56 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DFB15341ED2;
	Mon, 20 Oct 2025 02:18:50 +0000 (UTC)
Date: Mon, 20 Oct 2025 10:18:46 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add MusePi Pro board device
 tree
Message-ID: <20251020021846-GYG1506524@gentoo.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-2-40b05491699f@linux.spacemit.com>
 <20251020015204-GYF1506524@gentoo.org>
 <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52A7E982E5B11F53+aPWYHMbImTxJy7pJ@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_191855_334747_DAACC7DD 
X-CRM114-Status: GOOD (  11.37  )
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

SGkgVHJveSwKT24gMTA6MDIgTW9uIDIwIE9jdCAgICAgLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+
ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW11c2VwaS1wcm8uZHRz
Cj4gPiA+IEBAIC0wLDAgKzEsNzggQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBNSVQpCj4gPiA+ICsvKgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI0
IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+ID4gLi4KPiA+ID4gKyAqIENvcHlyaWdo
dCAoQykgMjAyNSBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNv
bT4KPiA+IHRoaXMgaXNuJ3QgYSBiaWcgcHJvYmxlbSwgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUg
YmV0dGVyIHRvIHVzZSBTcGFjZW1pVAo+ID4gQ29ycCdzIENvcHlyaWdodCwgdG8gcmVmbGVjdCB5
b3UncmUgbm90IGRvaW5nIGFzIGluZGl2aWR1YWwgY29udHJpYnV0b3IuLgo+IEkgdW5kZXJzdGFu
ZC4gU2luY2UgSSBvcmlnaW5hbGx5IHdyb3RlIGFuZCBub3cgbWFpbnRhaW4gdGhpcyBEVFMsCi4u
Cj4gd291bGQgaXQgc3RpbGwgYmUgYWNjZXB0YWJsZSB0byBpbmNsdWRlIG15IG93biBjb3B5cmln
aHQgbGluZSBhbG9uZyB3aXRoIFNwYWNlbWlU4oCZcz8KSSB0aGluayB0aGlzIGlzIGdvb2QKCi0t
IApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
