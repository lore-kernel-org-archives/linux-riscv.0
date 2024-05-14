Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95544C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClxzN+HvYiMN2nZA6gFm8h8LFPkk7qc/Gxjxv6VvTc0=; b=H/Mtg2d+L7rgx5
	JCr/SIUg8IErId7m1o3fpEwRcu+jy+13lmOlVu7QHr8OcR9vJ9GSs5OtrXK+0P9GHC3rBs6a2rCRd
	xqwt8CWBpKGf6UKFZEToE6BZTq/E991V0DdT4ElRPBB9a4Fleys12ncOGwNrv1Nd0x38ZTWN+fJuY
	C+KswjZwP4jJvPt9yp6MWapMFNMTdcUaJBBk1ml5H59bMCgQAsVO8fHvfHg89NqqPSMlyXgL76ial
	9gR6a6zQYTEUaljxfr/WKyWV2yhnODbSfJRS06NB3Tzx9sk+kaV8KkQmzdT1GLtsiBnaZttJWXQ0b
	a6CZhboUrZgAAh+XNM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v7m-0000000GXXa-3Q3i;
	Tue, 14 May 2024 16:35:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v7j-0000000GXWy-3w0e
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 16:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B491611A8;
	Tue, 14 May 2024 16:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF94C2BD10;
	Tue, 14 May 2024 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715704531;
	bh=us5zpSDDttAqxfqYn77fWVvof2NUi1rtw7ubbf6Thog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B/YTXGVPHZ1vLFHKQw+vkoJUiOGMjCNRCfln88lY7HEX6xwIMAPazPBVv+YlJ6Tsa
	 GbNHPWL+mRdCHJjZUA6/IHQPQwtp0T2TqFtkjGHFiwOmHrwjfgvSWhwDFP1eo8fp8v
	 vgCNqi90Zlq6BhJ06M7ghf0MTY5epDXuRsZMCWbq9+OR0g+4+6A67jDnqO24U2kAle
	 dcLtQ5hILwtkKZbgZtoM9BSdL0eTUWFGDyrqIklDYhxJBSbmF4CcA7YUE30lkp1P7m
	 j+7LUW/yGYHmd/6uufWg2DzEa6Qx5FFBU+lZN51Ay1KVnheTgVzRSj0qoJVfATUXtL
	 PiIrGyn3W3/yA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Extend sv39 linear mapping max size to 128G
In-Reply-To: <20240514133614.87813-1-alexghiti@rivosinc.com>
References: <20240514133614.87813-1-alexghiti@rivosinc.com>
Date: Tue, 14 May 2024 18:35:27 +0200
Message-ID: <87msostkq8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_093532_261318_493E1F8E 
X-CRM114-Status: UNSURE (   3.85  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
aGFybW9uaXplcyBhbGwgdmlydHVhbCBhZGRyZXNzaW5nIG1vZGVzIHdoaWNoIGNhbiBub3cgYWxs
IG1hcAo+IChQR0RJUl9TSVpFICogUFRSU19QRVJfUEdEKSAvIDQgb2YgcGh5c2ljYWwgbWVtb3J5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPgoKTmljZSEKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
