Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1737CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HHa8LkOSx6Lu7BipPN+56s7bPAs9GQtoUEW7eIi8kg=; b=o8BzFcFV6njiis
	jujGZewZR723tlvCKO124FeSF6urGERW3PqPKxlcoq8caNpZIsowpXhYEYQSTBGr2YBoHUpKdji2C
	btEbuiWR4ZTM0Ts9SLDq8W8QyZ6CYWK6pol92+4km2LQbe6wjz54Cjx1V1x4bKNnS+7/t/8fyptFf
	HJzQQj3Xp+rpa7Vu9Yhjcgb3++GVnoNq2jCQ8Ni9RUQvZCuPfb+O6On5a+Sq7/5+FGGlqgmTt3B+A
	YJv07ngxsp4RQ1Gr/U10EBpSExqFvcmUWos3XoBkwVRYgB8EopCeJ5LVPh99D9aLfSVrSW1hOJyoC
	1Qe38d/cGRtt0aU9AtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRGp-00000007EkS-0HmM;
	Tue, 16 Sep 2025 08:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRGo-00000007EkC-0pYC
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 08:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D00360143;
	Tue, 16 Sep 2025 08:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA44EC4CEEB;
	Tue, 16 Sep 2025 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012157;
	bh=Bl1MY5OuaiV9uMoemCCpSfrqbhrtez3QSsqsaiBhMUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlFRX2Vcd+embOSWbj6PKxqD12prWgZVl+2xsFYl8+8r/SOni53REHSYvx6E0/6DF
	 PazYsZ3pMD9SsNDQJOfCYutZjDFvXuSYbomW/zvvLbRw1dJZI4sKBBrQbE4GA+0ouW
	 qMzvJA/h68R6upEgiC7h5SsXzAL+EPZR4wkyc8vvzkIudNi2e1ueV40E+WXKGTmqwW
	 etr0gMdFsgmCNrWlBfVPHM4fFZvHoDFA5a7Wu3h0ysxbq9+xTm/NnHpTLqwctkgHSF
	 IdLuyQFWGbcEI2K/+0ZMv71W5Xh5qOb1sTzyMgzoFp8NxtA6OTG2yqXE2WkrlJfKw+
	 5uzpWJ+jWnplg==
Date: Tue, 16 Sep 2025 09:42:29 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916084229.GG1637058@google.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
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

T24gVGh1LCAxMSBTZXAgMjAyNSwgTWFyayBCcm93biB3cm90ZToKCj4gT24gVGh1LCBTZXAgMTEs
IDIwMjUgYXQgMTE6MzY6NDFBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90ZToKPiAKPiA+IFRoYXQg
bGVhdmVzIHBhdGNoIDMsIHdoaWNoIGVuYWJsZXMgcmVndWxhdG9yIHN1cHBvcnQsIGFuZCBwYXRj
aAo+ID4gNCwgd2hpY2ggYWRkcyBSVEMgc3VwcG9ydC4KPiAKPiA+IEhvdyBzaG91bGQgdGhlc2Ug
dHdvIHBhdGNoZXMgYmUgbWVyZ2VkPyAgTWFyayBoYXMgcmV2aWV3ZWQgdGhlCj4gPiByZWd1bGF0
b3IgcGF0Y2ggMyBhbmQgQWxleGFuZHJlIGhhcyBhY2tlZCB0aGUgUlRDIHBhdGNoIDQuCj4gCj4g
V2UnZCBib3RoIGhhdmUgYmVlbiBleHBlY3RpbmcgdGhlbSB0byBnbyB2aWEgTUZELgoKV2h5PyAg
SSBkb24ndCBzZWUgYW55IGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZW0gKHVzdWFsbHkgYSBzaGFy
ZWQgTUZECmhlYWRlci1maWxlKS4gIElmIHRoZXJlIGFyZSBubyBkZXBzLCBpdCBzaG91bGQgYmUg
dGFrZW4gdGhyb3VnaCBpdHMgb3duCnJlcG8sIG5vPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
