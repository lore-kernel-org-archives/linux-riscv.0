Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C8BEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhdO96pHfnNPqIQkjlLbsY6ms/K28EPZrf/rDn0CYRU=; b=UBZB2nqks4Od0m
	XLvtLj9KEqiPLoApqGEXH7ACq1oKpfxMsAEjrove2g2BWObvswVmjMi7f9NPRt9uY1opL4fMQZW3z
	7kg31yC4K++tvgVuVnhMr7CBTQzC+Gl9l+ZUTSFt56CQ15zZtEYDMHM+97Vlz3rL32z3o6oBtViUF
	yWk5y7Go7XcSV8HJ43zGM2SLr7/LNGYLLmhUtRQqfOjXKB0mLJsioyhPO6Ar9tZZ/uIw62hacXM3d
	tbjyP5HLY6RJmZ/VrYE0mKTf7NIeO2udElMxhE5t1cm0Kv5Lt7JxG2C7S/aCQ8S/s8zQxDwxJHwCz
	jWa3Ppdi9xJ68rtncS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyYF-0027tv-0l;
	Thu, 29 Jun 2023 20:47:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyYC-0027si-06;
	Thu, 29 Jun 2023 20:47:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59C6E61602;
	Thu, 29 Jun 2023 20:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705A3C433C8;
	Thu, 29 Jun 2023 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688071654;
	bh=8kMGzaIdFkbNUxR3494GfsN7h1xgVubbw97KWSPe1eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwg9tHuf2fGcwsPfY3uK6f/Oal6N5wBfgc1MbAb9QdhvkBxmZm4cLYK3spC8zyzY7
	 jQBQJyPFzcDscw/loXhrH0CIIf42hV3UoC+hxP6+/CKCaXXtj7EFYqF30ZGqDHQfz8
	 gIdXcnb0ONho5nvqv6eTRFUL7UQktBswSsyANhHAo4k4aG38YburtzuD+V99zWjd0X
	 ZLtgIF1CMF64hF0GJTRxdD4+1y99TQYbDiejaYikPlNZdmc0YIkfpcT37SoWNM+FGZ
	 nBz2UUzufYureR6iXVQE2LyY7jjGclIE3KaUz6kWOch0Oaxoa7CzVm6gMpC5r70r8B
	 RDTQ4TdpYEo1Q==
Date: Fri, 30 Jun 2023 05:47:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: microchip: Remove cast between incompatible
 function type
Message-ID: <20230629204732.GA83442@rocinante>
References: <20230629165956.237832-1-kwilczynski@kernel.org>
 <20230629165956.237832-3-kwilczynski@kernel.org>
 <20230629-smirk-resample-6741dcf9eac5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629-smirk-resample-6741dcf9eac5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_134736_140156_2B2F6F71 
X-CRM114-Status: GOOD (  10.83  )
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

SGVsbG8sCgpbLi4uXQo+ID4gRml4ZXM6IDZmMTVhOWM5Zjk0MSAoIlBDSTogbWljcm9jaGlwOiBB
ZGQgTWljcm9jaGlwIFBvbGFyRmlyZSBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIikKPiA+IENvLWRl
dmVsb3BlZC1ieTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9j
aGlwLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwu
b3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPgo+
ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd2lsY3p5bnNraUBrZXJu
ZWwub3JnPgo+IAo+IFRoaXMgbG9va3MgdG8gYmUgdGhlIHNhbWUgY29udGVudCB3aXNlIGFzIHRo
ZSBwYXRjaCBJIHByZXZpb3VzbHkgYWNrZWQgJgo+IGVmZmVjdGl2ZWx5IHRoZSBzYW1lIGFzIHRo
ZSBvbmUgSSBwcmV2aW91c2x5IHJldmlld2VkIC0geW91IGNvdWxkIGhhdmUKPiBwaWNrZWQgdXAg
ZWl0aGVyIG9mIHRob3NlIHRhZ3MgZnJvbSB0aGUgb3RoZXIgc3VibWlzc2lvbnMgdGJoLgoKSSBo
YWQgdGhvdWdodCBhYm91dCBpdCBidXQgZGVjaWRlZCBhZ2FpbnN0IGl0LCBhcyBJIHdhc24ndCBz
dXJlIGlmIHRoYXQKd291bGQgYmUgT0ssIGdpdmVuIGEgbmV3IHNlcmllcyBhbmQgbmV3IGF1dGhv
ciwgZXRjLiwgZXZlbiB0aG91Z2ggdGhlIGNvZGUKaXMgYWxtb3N0IGlkZW50aWNhbC4gSSBoYXZl
IHNlZW4geW91IG9mZmVyZWQgUmV2aWV3ZWQtYnkgYW5kIEFja2VkLWJ5IG9uY2UKYmVmb3JlLCBh
bmQgSSBhcHByZWNpYXRlIHRoYXQuCgo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgoKVGhhbmsgeW91IQoKCUtyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
