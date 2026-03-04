Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7022CEDEBFC
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7Ojwi0i3GPYKLi54a88SbZyFRCmRBR5vZHeh9g3wZo=; b=h9qDTXGO/eIK+e
	fbwRLh5L6dfG5nJUExzOrhnmAWEQY9xNBgueMbp9/JwHlLbcEzFpDXYE1IPwgsJD9N1I9WDG+naOq
	mi4N5+ZD2/TlfTRf4BAPaGWzY2jSp/Wm6Xm/F4JtmOEVuLz58x+R9DKMI8fgENduGUi1M+GQU3pqd
	t10aPYGxzcUuvPe/IY63wcnQDBj32y7NRfDRv1hA1mi08o77iMjnXwuxFFUMZxtPixu4uS94Iz0OZ
	pwudvfsLQoxgI3J62kDIlVRZKyqfkekBNHLk5jwUUDfCotpyg56w7mt6ycqHf9ss8ywyznp5QDspj
	xMxCUMcNCwFgBiPpBK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGe-0000000GAYI-1key;
	Wed, 04 Mar 2026 00:39:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGb-0000000GAXF-1aGe;
	Wed, 04 Mar 2026 00:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0171243AA8;
	Wed,  4 Mar 2026 00:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46106C2BC9E;
	Wed,  4 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772584748;
	bh=XfEFP0ePAMl9RzwdsncvUUKsnGIj/z2blRaooWlL5Bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eiNKQDh0fZuPPjKMDEPIuS+QqGtWQgilLKQuAg75AM6L5IAQdrKv+e1v5OSDMiS4V
	 NjFXdg18P/JfxObT4XLpKOC+eq9uXsLq+X00iASe0P9aXIRKGY5wQ9cHFXAKSyhn9J
	 q4LU5cBLdUrCEsfPD7VOUKlVDz7qTX4vpDZuJI0bxvIwc3rJFsN7KgEx1GA8RjNTcU
	 MICIu13V5phbG0+fx/tDxJNXIIa1AKchlj8SKp5GZgY07BfNCLA3B7BCtKmpCLSy/p
	 Q7sM5stjqY41kVanYgSyZQnNiX6Scq4tGR4NTv+fdcInFHFVvpcgOLlqtpJw9zxzph
	 bekkRLrZY7Xgg==
Date: Tue, 3 Mar 2026 16:39:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <20260303163906.187d57a4@kernel.org>
In-Reply-To: <20260303061711.895-1-lizhi2@eswincomputing.com>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
	<20260303061711.895-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163909_441180_DC65FA56 
X-CRM114-Status: UNSURE (   5.86  )
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

T24gVHVlLCAgMyBNYXIgMjAyNiAxNDoxNzowOCArMDgwMCBsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tIHdyb3RlOgo+ICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5j
ICAgfCAxODAgKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzcgaW5zZXJ0
aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgouLi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1laWM3NzAwLmM6MjkwOjMzOiBlcnJvcjogYXNzaWdubWVudCB0byDigJh2
b2lkICgqKSh2b2lkICosIHBoeV9pbnRlcmZhY2VfdCwgIGludCwgIHVuc2lnbmVkIGludCnigJkg
ZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKAmHZvaWQgKCopKHZvaWQgKiwgaW50LCAg
dW5zaWduZWQgaW50KeKAmSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICAyOTAgfCAg
ICAgICAgIHBsYXRfZGF0LT5maXhfbWFjX3NwZWVkID0gZWljNzcwMF9kd21hY19maXhfc3BlZWQ7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4uL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYzoxMjk6MTM6IG5vdGU6IOKA
mGVpYzc3MDBfZHdtYWNfZml4X3NwZWVk4oCZIGRlY2xhcmVkIGhlcmUKICAxMjkgfCBzdGF0aWMg
dm9pZCBlaWM3NzAwX2R3bWFjX2ZpeF9zcGVlZCh2b2lkICpwcml2LCBpbnQgc3BlZWQsIHVuc2ln
bmVkIGludCBtb2RlKQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Ci0tIApwdy1ib3Q6IGNyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
