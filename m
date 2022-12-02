Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C44EC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tCC3Xq15n9kJxQdgCbmCB3hIjP9Jny1tKllv7C5kQI=; b=3ncHsLS2jnqMel
	yFn6gUae4CjTnJJhHJUX2D/bmzR3XR37Vpgq81HwA5SSMLpDPuHGkcLedsD9HWzaf06WefPNVrQB4
	+cJwsqyJxocPqbsxow8twAsYN8v4c8ZRbC6DorFMTmo0IGFHjacs3jEgV8BEH2MFyJeApDI8yip03
	AAI6fbhGcP6t5QitBZT6eW1Z9f7B3rprqE9u/snJ8rWvzyOYQP+Vghrkp6REpHEQaSIeAKmy8Rk62
	k8qEGcDKwUax2hHXc2m8h1F/hLMmiZ0TwSHv6NXbQuKS4rTLgIGQco0UXhaT14x2ECCUiMFIC7bo4
	aUn3746t56Y80okYwr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1712-00GncT-Mx; Fri, 02 Dec 2022 14:27:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1710-00Gnc6-0i
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 14:27:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6924622CD;
	Fri,  2 Dec 2022 14:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41ECC433D6;
	Fri,  2 Dec 2022 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669991264;
	bh=Kj9mulxfZWHpf3TDTo3FkCE5JqR+xzCNTiYeK0Su5ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kgIadwBxAeuwldTwEDihUrqzJ4aNXwLHlm99BTuekfeEIcAJMRucGGZZIOUwId/pl
	 GHcAKN305qBmAOe52wB2EoKqZWGJRlA50Xv9rn8O9dXQB9ElyKbW3IPqtA/2fuKbZP
	 sPWa0w8fKrfO3HElIk7VE4djAjWeWuElCzTDsEgkF0krPUFAQE5CnBZfC2v1tc2e4W
	 ZG3Hf9qfTBZFzzt5MgcWbiTC7/09buca65eYAr0U9rRFLRTfRq8XGc21NchqrDZ+dd
	 T+7nTE297/C/VwkReoIPOa34Oc1QoqWJFxMI6ffvKISwpTpn91QrTqHNK0D7OSIGvh
	 2B6xB7QrTwO+g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: re-order Kconfig selects alphanumerically
In-Reply-To: <20221202131034.66674-1-conor@kernel.org>
References: <20221202131034.66674-1-conor@kernel.org>
Date: Fri, 02 Dec 2022 15:27:41 +0100
Message-ID: <87pmd1swwy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_062746_152905_5DBB48F6 
X-CRM114-Status: UNSURE (   5.77  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEZyb206IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBTZWxlY3RzIHNob3VsZCBiZSBz
b3J0ZWQgYWxwaGFudW1lcmljYWxseSwgYW5kIHdlcmUgdGlkaWVkIHVwIG9yaWdpbmFsbHkKPiBi
eSBQYWxtZXIgaW4gY29tbWl0IGU4YzdlZjdkNTgxOSAoIlJJU0MtVjogU29ydCBzZWxlY3Qgc3Rh
dGVtZW50cwo+IGFscGhhbnVtZXJpY2FsbHkiKSBzaW5jZSB0aGVuLCB0aGluZ3MgaGF2ZSBnb3R0
ZW4gb3V0IG9mIG9yZGVyIGFnYWluLgo+IEZpc2ggUk1LJ3Mgb3JpZ2luYWwgc2NyaXB0IG91dCBv
ZiBjb21taXQgYjFiM2Y0OWNlNDYwICgiQVJNOiBjb25maWc6Cj4gc29ydCBzZWxlY3Qgc3RhdGVt
ZW50cyBhbHBoYW51bWVyaWNhbGx5IikgYW5kIGRvIHNvbWUgc3ByaW5nIGNsZWFuaW5nLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
CkxHVE0hCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
