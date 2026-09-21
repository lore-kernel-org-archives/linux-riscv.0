Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3448C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SurX+I+ME9BFsgk6sQC+4sxatRZmPrQHUV8FH4pThi4=; b=fk6HB1Sf10LNk2
	0QcbzEza4g7GQCVSdMdQCqagzHeoreaaM41qvqcMxqWLXaBuOTnRfcNZ5H/Z9P9gfqnSasxMQL628
	unXTeJV8zw4dY6onnXBnX1bHUdenvTSgVQY/MMGd3x3wQ54ki5ml2ONYT2r/VcU10D810GgMLKTfr
	igg1QWhB4Q7v/X/K9F3F/l4RBmxV9Z8Hoa1yAyWirEWpUXzNHxLdMW+kMOnSHKmh/N/fwcA9fMXck
	3qbn0AJnol1zBXDbOQDKtTzMDJM6K49RU9HlPRla2jGCnUEppcOHs5gduUK3VAcjbImwij+EQ1z+e
	aFlknHdiiEMxxP+d1xdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dOD-000000027rB-1XxW;
	Mon, 21 Sep 2026 12:44:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dOB-000000027qN-33S4
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 12:44:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A49A600C8;
	Mon, 21 Sep 2026 12:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0091F000FF;
	Mon, 21 Sep 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994694;
	bh=cfyGQvaB9SBuErp0Qx497sUvEDScukDCHbeDeVfMuYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BStBRHypPZ/YYbx0kPtXDsf5PXmSvGrqW0923VmAOXlmiG8qxsic8ZQkU+GkEnLgG
	 IhBIB2Ub5M4414tpHlEWs3N4yMtLHL+jqGFszxYWtmFhVsKc0T073zLj8ZCSNLohhX
	 76PUUndqlQIc0xfG5c13gye/097PvosVt6rByogZdJkreBN1iT8cKK90K1aVGhnFp3
	 nqcQhpXVJb1F6XuvJIda71CCjNiNCiiG5XUoJ81nNglsjSzN5662uGltTVEdBdZy7c
	 RqFGjL2axKNCh7GnTJhZnE9o7DR9aaZceK86SeXlE4c7pkHPCAB/Y+Lf1oCWThP5Wg
	 TTa2iLbTR9hUg==
Date: Mon, 21 Sep 2026 12:44:52 +0000
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
Message-ID: <20260921124452-GKK297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <56e5f32102c67575ded8af9e81a06dc9f1dcf0ee.camel@icenowy.me>
 <20260921033540-GKG297024@kernel.org>
 <e96ddd73ca83f0d8b6f08ff63a14b5f0d1bcee57.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e96ddd73ca83f0d8b6f08ff63a14b5f0d1bcee57.camel@icenowy.me>
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

SGkgSWNlbm93eSwKCk9uIDExOjQxIE1vbiAyMSBTZXAgICAgICwgSWNlbm93eSBaaGVuZyB3cm90
ZToKPiDlnKggMjAyNi0wOS0yMeS4gOeahCAwMzozNSArMDAwMO+8jFlpeHVuIExhbuWGmemBk++8
mgouLgo+ID4gPiAoQlRXIEkgYnVpbHQgaXQgYXMgYSBtb2R1bGUgdG8gcHJldmVudCB3aG9sZSBr
ZXJuZWwgYmVpbmcgcmVidWlsdCkKPiA+ID4gCj4gPiB0aGF0J3MgZmluZQo+IAo+IEluIHRoaXMg
Y2FzZSwgZG8geW91IGNvbnNpZGVyIHRvIG1ha2UgdGhlIEtjb25maWcgb3B0aW9uIGluIHlvdXIg
cGF0Y2gKPiB0cmlzdGF0ZSBpbnN0ZWFkIG9mIGJvb2w/Cj4gClN1cmUsIHdpbGwgZG8KIAoKLS0g
CllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
