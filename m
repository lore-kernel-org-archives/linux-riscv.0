Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D9FC624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTbqGJHXfroUNZLD7Mo00L7PzNo0BwQDVW7WdUIHo4k=; b=AhaYvhviPhOupt
	Gd61EHvUtAmuHpYog7FoohgNKAESaoIoCII/2fVdGB7wT+4qE23mvPrFBBGfddI9uwqtZP8AilfiH
	zCWjDqP/E6pnd1mlDhL37xLd12x2t2vwddR55ZcCmgUpaRYC7Ai1dRA+rIKR5ZvRVbjeMzfT8Kd9G
	BIFZNiYwIb8G42KF+VMwoEH/DK1eaD1Ajcpc/aWH6u3gMGQ9lKas4BeQvH4PjFarMXjAyqB30H6qW
	KntzAaADhlT+VVpI9NSD8Rwcz+YpvpFI3332zgGQo7LmJfIdTQS2jEoiiOpfLgX12xPa0i31qY1MC
	eICrkAWtP7JC9QWoNGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sni-00000004FKT-0wjX;
	Sat, 05 Sep 2026 15:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sng-00000004FKN-2FxP
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 15:59:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E451341B67;
	Sat,  5 Sep 2026 15:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FB51F00A3A;
	Sat,  5 Sep 2026 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788623967;
	bh=l341z0u1/Ya391BvitsbeCx2UnhGCDtNvK9lgfbpZdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SX7oPQdy5JYTnhtND74ojX5DxnoGzClVbgBusTUCVBLHDKBUBsxajdXm9fYiPkw48
	 0CLo18VnKt2oRRUTRmQK9Kca2L3BgIct32u1mfIdQnwgapk82kyyZpWooh/BIokLQ8
	 plUK7SdXib4SbhTVhItcJY36IDoZmOCWobSPIO5lPriT9HLU6PeP3Jd+ehEIO3ebm5
	 52dRWKpQ9zY8lihKaIYXkYMV8+0/myv1DQU8+VsBXcw0DAcLUSrI1rBGOxpoZBWL57
	 9ti8HKXko+DkBTAgTLylLILkfVA98muarV/SrsMtCKGpHbtay3tVazLg2ZjKJ2saWx
	 wulhl90vZFiZw==
Date: Sat, 5 Sep 2026 17:59:19 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "hpp.iscas" <hppiscas@163.com>
Cc: Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yu Ning <ningyu@eswincomputing.com>, Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Message-ID: <a22ps7dgbiwkieqlckooflugm44w2zoimlsrofmeypsqfgb5xd@bwne6m26esmu>
References: <20260905134251.67210-1-hppiscas@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905134251.67210-1-hppiscas@163.com>
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

T24gU2F0LCBTZXAgMDUsIDIwMjYgYXQgMDk6NDI6NTFQTSArMDgwMCwgaHBwLmlzY2FzIHdyb3Rl
Ogo+IFRoZSBFU1dJTiBQQ0llIGhvc3QgY29udHJvbGxlciBpcyBhIHBsYXRmb3JtIGRyaXZlciBt
YXRjaGVkIHRocm91Z2gKPiBlc3dpbl9wY2llX29mX21hdGNoLiBQQ0lFX0VTV0lOIGlzIHRyaXN0
YXRlLCBidXQgdGhlIHRhYmxlIGlzIG5vdAo+IHB1Ymxpc2hlZCBmb3IgT0YgbW9kdWxlIGF1dG9s
b2FkaW5nLgo+IAo+IFB1Ymxpc2ggdGhpcyBwbGF0Zm9ybS1kZXZpY2UgdGFibGUuIERvIG5vdCBj
aGFuZ2UgdGhlIFJJU0MtViBob3N0Cj4gaW5pdGlhbGl6YXRpb24gc2VxdWVuY2Ugb3IgUENJIGRl
dmljZSBtYXRjaGluZy4KPiAKPiBGaXhlczogYjU5M2MyNmQwODFhICgiUENJOiBlc3dpbjogQWRk
IEVTV0lOIFBDSWUgUm9vdCBDb21wbGV4IGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogaHBwLmlz
Y2FzIDxocHBpc2Nhc0AxNjMuY29tPgoKQXMgcGVyIExpbnV4IEtlcm5lbCBEQ08sIGEgcmVhbCBu
YW1lIGlzIHJlcXVpcmVkIGZvciB0aGUgc3VibWl0dGVyL2F1dGhvci4KUGxlYXNlIHJlZmVyOiBE
b2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdAoKJ2hwcC5pc2Nhcycg
ZG9lc24ndCBhcHBlYXIgdG8gYmUgYSByZWFsIG5hbWUuCgotIE1hbmkKCi0tIArgrq7grqPgrr/g
rrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
