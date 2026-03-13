Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6205C105F7AE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYS3N+XaIPCqLykCRl7DHUEXnqfn9SrBfg1fQMtw/JA=; b=Ncb9UytoFZ/5y5
	VZ7StB4zkmsljoPLipl7vhKJsUNX7S9ilx//hnVXVhIWkqkwzfZAkxJqDSBp1LJFp2qWh+4Owgc0f
	jsNdyr8L2Rv4Xob3y03OgovmtEZzkNVhIK76ypEE0SIQBMKnysQFszBzwyNrP0vRTrrHAzDyPiaAT
	dPOhVbTOq+kxTFOgwlXG5gqA0xwIhiyU/urkiAU1WKz+5bsVbvWU2vzurI/qmC4M8f7A76/Yj8VUb
	Yk2Qq4K/MrEXj889g7uy8BZDA+I3AxvhjFvDPJgkcm2jRPsdvggL4zypO2BVEDupZfUmu1V5llff2
	KAsN7RgfJmjh7lWmnfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w139K-00000000Kr1-2DFN;
	Fri, 13 Mar 2026 14:05:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w139I-00000000Kqh-2gD2
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 044BE43F21
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A44C2BCAF
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410755;
	bh=BqKrd9MGPnv+gQCWHNNUS2UMAZc7FKqpV0JE5XjCDw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qYIitWVQe5Q8nbcwDKbjNsZkXGT+7nCsErw4C849brpLvV8NNnIi4iGTcwMejdUiU
	 g5LfhhBULDlg4EJyTt5OdIqMouWPDK0aX5fbWY4sSMVw54yQzc7UzmGns1WWLGeP0Z
	 lALgqlmr8D2p2UCll8qLKnAZpBIfvyaEI79vKdG8Vn5quqdkj2M38V5Ge0u1SQmk67
	 WEvWzHg5etGWAyURjSkeQIOppO7nEKZeN1i/BaeCiEBp1JHjSpNPHO4sHO+TcJkqyh
	 c8fwycoVPMMPgL/p/pgX34J1p2EE+xKyY909/Zz4h8OFvIm8BLFfO3pibLGD1JXx8y
	 xtoar1IqmGAZg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a3c62d7d2so16935491fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYz5Q5NWiHtWezDjfPqxVUDjUnt1mnDnEnyew7gSVCueLfs/HaVBrwzgi6SEltZTrQmI4EL7ScoQQLDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm8l5/vhGYNBaV6aGXc7BJJK/qHX/DGAWUbEB2ZY2Hb/mrHmls
	G0hWxcs3HWIm6ITN600zjWkcOug8x8C+WwcFugzjgkj6flcSe9dsG5DSK7DKD7dTxZx65J318Ny
	P9OtWQcHg7l8CmUVmGMcK9MmUmbWuFCYLDkuP3yQ/bQ==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr11202931fa.6.1773410754347; Fri, 13 Mar 2026
 07:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:05:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
X-Gm-Features: AaiRm51DxUd0y3wL7awnbPV8W9Fol2pS5cjKcnSSZQnGox51VBH0_3jXriBoQSI
Message-ID: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070556_719237_2835FB9D 
X-CRM114-Status: GOOD (  12.90  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgOTo0M+KAr0FNIEp1bmh1aSBMaXUgPGp1bmh1aS5saXVA
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBBc3NpZ24gZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWco
KSB0byB0aGUgc2V0X2NvbmZpZygpIGNhbGxiYWNrIHRvIHN1cHBvcnQKPiBwaW4gY29uZmlndXJh
dGlvbiB0aHJvdWdoIHRoZSBHUElPIHN1YnN5c3RlbS4gVGhpcyBhbGxvd3MgdXNlcnMgdG8KPiBj
b25maWd1cmUgR1BJTyBwaW4gYXR0cmlidXRlcyBsaWtlIHB1bGwtdXAvZG93biB3aGVuIHNwZWNp
ZnlpbmcgYSBHUElPCj4gbGluZSBpbiB0aGUgRGV2aWNlIFRyZWUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEuYyBi
L2RyaXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMKPiBpbmRleCBkYmQyZTgxMDk0YjkuLjVm
ZTgxM2I3ZjliYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1zcGFjZW1pdC1rMS5j
Cj4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEuYwo+IEBAIC0yMjgsNiArMjI4
LDcgQEAgc3RhdGljIGludCBzcGFjZW1pdF9ncGlvX2FkZF9iYW5rKHN0cnVjdCBzcGFjZW1pdF9n
cGlvICpzZywKPiAgICAgICAgIGdjLT5sYWJlbCAgICAgICAgICAgICAgID0gZGV2X25hbWUoZGV2
KTsKPiAgICAgICAgIGdjLT5yZXF1ZXN0ICAgICAgICAgICAgID0gZ3Bpb2NoaXBfZ2VuZXJpY19y
ZXF1ZXN0Owo+ICAgICAgICAgZ2MtPmZyZWUgICAgICAgICAgICAgICAgPSBncGlvY2hpcF9nZW5l
cmljX2ZyZWU7Cj4gKyAgICAgICBnYy0+c2V0X2NvbmZpZyAgICAgICAgICA9IGdwaW9jaGlwX2dl
bmVyaWNfY29uZmlnOwo+ICAgICAgICAgZ2MtPm5ncGlvICAgICAgICAgICAgICAgPSBTUEFDRU1J
VF9OUl9HUElPU19QRVJfQkFOSzsKPiAgICAgICAgIGdjLT5iYXNlICAgICAgICAgICAgICAgID0g
LTE7Cj4gICAgICAgICBnYy0+b2ZfZ3Bpb19uX2NlbGxzICAgICA9IDM7Cj4KPiAtLQo+IDIuNTMu
MAo+CgpBY2tlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBv
c3MucXVhbGNvbW0uY29tPgoKTGludXMsIHBsZWFzZSB0YWtlIGl0IHRocm91Z2ggdGhlIHBpbmN0
cmwgdHJlZS4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
