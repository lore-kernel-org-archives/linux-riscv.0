Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD118C8303D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc75xYafVDdX+2Q020Vl/WM2zGf9aE2kGRIEKEvMpcA=; b=EN+Y+dU4BawIYh
	ds7gCgzFJvQ6XLa3W0/GTzrwK+NzM2wbF3um4JiaAr41g80nMVFGT5w64/Pc7Dq7ywyKus+89xmh9
	N7gMhmwix7LaYU3nY+yReLHd1joG6YtS6Je4SL0yUgoTdah6+wQNdZPpE1cWOrrsuROC3QGIOKH/1
	uGKS3torr+aR+h+h6N90/r/KVOWhgS9TqoxG6axDdOYb1ZcxmB8QCdEwdpLjQrGbsR9qONOPEivqW
	6UOfmB0yI2VDK85UyID8r73lnlY7eD9EjHu+ntQCLbyCsziGhmUciL6JJidgiyhEYuQkFuzbv6u/M
	pX5D+3ybFMkIwbCzjbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj1-00000004TWa-1O9C;
	Tue, 01 Jul 2025 08:52:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWDT-00000004OWm-3mmT
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EA1A6143D;
	Tue,  1 Jul 2025 08:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F7DC4CEEB;
	Tue,  1 Jul 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357987;
	bh=noDPpUqNBlR3C1l21VfaQdGGoXDiw11U2/HL+tU819c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xa+mrao6L0WNrIkAf7cSiPnL+A0XZrn96x1cTOaBOzHD5akO255zfXAJYH/HCP5nW
	 4tX+mCvc/HL9m/CfiK9p0ZcqpP6wLKg/MgvLFEdZmcfxizOLmLNJK3OKM1klOZ+/11
	 p7/yYB3jnApoK8yp2NoEa2jrQ8bREGd9n/E4z+kPVH4FtIZZvCVtBbz2YqlQlmkTPq
	 R3G+UXVUUECJI/tyNQgmCBgoMa17+Esa/eZnTLS0uWQi4XuvvvlwA/JHKc2Goa/Gk8
	 Fyar7I34ltkPlyO6CjGZiVT0fvKw50OBTPq1GFIVFkPE8IuB1w7aSRWu5uo6l7oO0A
	 3YLh26PiUW5IQ==
Date: Tue, 1 Jul 2025 10:19:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, 
	Rafal Ozieblo <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 03/18] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Message-ID: <20250701-spotted-crimson-puffin-dffabd@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-3-ff8207d0bb77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-macb-v2-3-ff8207d0bb77@bootlin.com>
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMTE6MDg6NDlBTSArMDIwMCwgVGjDqW8gTGVicnVuIHdy
b3RlOgo+IEFsbG93IHByb3ZpZGluZyB0c3VfY2xrIHdpdGhvdXQgYSB0eF9jbGsgYXMgYm90aCBh
cmUgb3B0aW9uYWwuCj4gCj4gVGhpcyBpcyBhYm91dCByZWxheGluZyB1bm5lZWRlZCBjb25zdHJh
aW50cy4gSXQgc28gaGFwcGVuZWQgdGhhdCBpbiB0aGUKPiBwYXN0IEhXIHRoYXQgbmVlZGVkIGEg
dHN1X2NsayBhbHdheXMgbmVlZGVkIGEgdHhfY2xrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lv
IExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
