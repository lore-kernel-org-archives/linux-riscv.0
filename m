Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91CC982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDJDG5kGGH6GQ2ZISderLFAH3uP/lq86eL9h+YEdjzo=; b=b6/t/B5p2WiJuj
	G+LCLl4nUWC0Mib7iUut5qG5/dowJ9pGKGqgreyEFObU+X0y1IMomPEjLpXHEiJXyfhv57sMS01cf
	HqY6H+C1Mbezz153ItOFxT9zNc50cnOJ+6RNzvi/Pneu0rCVqtnsXVqUQh+q24PDDrae7wO+/3ESF
	6cwFDwTRAWV9t3Xg6MMKXuJDIda4EXruLHqhga2wP0WU9+fqrP/PYVb5jprlI92gn7xD64O6rRAS9
	eB/tfxnS5RmYIus8xqqlzaP5MIR2j2kcLNnMGPUcwHsUDGiWBiI785DD50VEwKL5WArLw+teIBZoI
	/9QkYOWJki7XD3GlyC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dNE-000000027WS-0TwJ;
	Mon, 21 Sep 2026 12:43:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dNC-000000027Vp-34jf
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 12:43:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCD78600C8;
	Mon, 21 Sep 2026 12:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006FB1F000FF;
	Mon, 21 Sep 2026 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994633;
	bh=iaLayvDfapV0bJvw+3FKi2a+/cU7femQxfBRaV3D/sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Onl0CDvHcWinsA4KtPqRh3IMJ/cbIh0uQdwPYmEYr1RuYxxJtmM5dgIBP40LDEYMs
	 qyOoff9BaQge/ouzkqn3+wXEf5ZVcPD6AZmEpFW69caCozlqOij/EuYUM2Z2MbVtoJ
	 C+ClQjFYoH0qFCL5w5tW0pbRhJHRVTPvMZruJnTPbp7D/ra0ILXdwsPsK9ygBWqP/6
	 5S13CXcL1dbsrP+Xw1yv0R0nu+QdHHveSMiU0mQcIAKqJihWbSiO/9huYb1GOuO4HH
	 vxMRaXZwrfWjcjgqQGME0aiuoohjx5Cxj47faqc+oNLn7/rjnDms/ZMH/3+TRp0XVI
	 kObU3rJaIM6Uw==
Date: Mon, 21 Sep 2026 12:43:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20260921124351-GKJ297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <56e5f32102c67575ded8af9e81a06dc9f1dcf0ee.camel@icenowy.me>
 <20260921033540-GKG297024@kernel.org>
 <8ac3815961bebc5065ecabbbaed3e9920d5cbba7.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ac3815961bebc5065ecabbbaed3e9920d5cbba7.camel@icenowy.me>
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

SGkgSWNlbm93eSwgCgpPbiAxMTozOSBNb24gMjEgU2VwICAgICAsIEljZW5vd3kgWmhlbmcgd3Jv
dGU6Cj4g5ZyoIDIwMjYtMDktMjHkuIDnmoQgMDM6MzUgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPv
vJoKLi4KPiAKPiBTaG91bGQgdGhlIEdFTlBEX0ZMQUdfQUxXQVlTX09OIGZsYWcgYmUgYXBwbGll
ZCBvbnRvIHRoaXMgcG93ZXIgZG9tYWluCj4gaWYgaXQncyBub3QgbWVhbnQgdG8gYmUgc2h1dCBk
b3duPwo+IApZZXMsIEkgdGhpbmsgdGhpcyBpcyBiZXR0ZXIgYXBwcm9hY2gsIHRoYW5rcwoKLS0g
CllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
