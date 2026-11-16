Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531FF606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=leo3B1om;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvfGFuDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mMas2gMpuN6R5XPazFfGAR15Sj4X6+QwRjsBTqaJS0M=; b=leo3B1omSNBZIZxaULYOGKFiZC
	WV8MsMJqvE2G3Wu3EFCPiZAcfawaoVuiobxkXYJcrlXEjeaVLIz2MYPhJk7Fm9mNYqOtRABLgGKys
	AbTuD+2AriicfJYQuFTReOj5aQr+aR81LIPFSRhjBvGCRu2XvaUt57Y5ery9RT/lg0/zJkuDm/FHV
	u0p2OtkarSq04tQYi5qlc1X83EWB9CZ59VnPRECeT7RSqTqBnaH685US/q8yXbX4B4LdlHkUHSlku
	H6YjoqMesemQ6MXWBinvA5o6m+H3E86Gwqms/ycYDC0oZAZniumiHX2b5gcVqwIBy1lFF8QDQvV5P
	lNEEZjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr56-00000001OyE-2qHe;
	Mon, 16 Nov 2026 07:24:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr55-00000001OxL-3G1B
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:24:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 615FB61C70;
	Mon, 16 Nov 2026 07:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEC41F000C4;
	Mon, 16 Nov 2026 07:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794813886;
	bh=rExq5lVgGWK4apmzgUlwWDmXwLy4VEHNZ1es8dXhvVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvfGFuDsbEoyV//bYp/TgAXOj4AbmwFqmsUi1kOGSCEXv6FGrB1f5YDBrhyNbot36
	 doepZFbmmt+bXjfCy8Nrn9wDJypNVn9KTGQj0PBQcyNBaOOYjFu1ecTKS3dMvipA67
	 P3cF1K+fzMypnqSvZCTkr39hJ/x+U7mPUDrKMRc0ZnBmu46jcbOgULWB4M1YBet9dt
	 QWbXz0hx5sfvcTCrjiJBfBNCfu0y0p4I6RiYCVov5kvyt0bW/qpS2mj2Kx6lb8UmWI
	 npv27uacIOu3oL2FjqmFRHfzc5Vzk/Hf++p7Oi1phgXGUM99I/oAbPP2z0CPd3+nsZ
	 Y7Wr0dPVr01kA==
Date: Mon, 16 Nov 2026 07:24:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via
 device link
Message-ID: <20261116072442-GKA100890@kernel.org>
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
 <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVWxmLAoKT24gMTI6MzMgU2F0IDE0IE5vdiAgICAgLCBVbGYgSGFuc3NvbiB3cm90ZToKPiBP
biBUaHUsIE5vdiAxMiwgMjAyNiBhdCA4OjQ14oCvQU0gWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4KPiA+IENvbm5lY3QgZG93bnN0cmVhbSBQb3dlciBEb21haW4gY29uc3Vt
ZXIgd2l0aCB0aGUgc3VwcGxpZXIgdGhyb3VnaAo+ID4gdGhlIGRldmljZSBsaW5rIEFQSSwgU28g
d2hlbiB0aGUgcG1kb21haW4gZHJpdmVyIGlzIHVubG9hZGVkIG9yIHVuYmluZGVkLAo+ID4gdGhl
IGNvbnN1bWVyIGNhbiBiZSBhdXRvbWF0aWNhbGx5IG5vdGlmaWVkIGFuZCBwdXJnZWQgZ3JhY2Vm
dWxseS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4K
PiAKPiBDYW4geW91IGNoZWNrIGlmIHRoZSBiZWxvdyBjb21taXQgdGhhdCBzaXRzIG9uIG15IGZp
eGVzIGJyYW5jaCBzb2x2ZXMKPiB0aGlzIHByb2JsZW0gZm9yIHlvdT8KPiAKTm8sIEkndmUgY2hl
cnJ5LXBpY2tlZCBiZWxvdyBjb21taXQgYW5kIGl0IGRvZXMgbm90IHNvbHZlIG15IGlzc3VlLAog
aXQncyBhIGRpZmZlcmVudCBwcm9ibGVtLgoKUHJvYmxlbSBoZXJlIGlzIHRoZSBwbSBjb25zdW1l
ciBzaWRlIGlzbid0IGF3YXJlIHBtIGRyaXZlciBpcyByZW1vdmVkLiAKCj4gZTI3OTgzM2E1MzYy
IHBtZG9tYWluOiBjb3JlOiBXYWl0IGZvciBkZXZpY2UgbGluayByZW1vdmFscyBiZWZvcmUKPiBk
cm9wcGluZyBnZW5wZC0+ZGV2Cj4gCj4gS2luZCByZWdhcmRzCj4gVWZmZQo+IAoKLS0gCllpeHVu
IExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
