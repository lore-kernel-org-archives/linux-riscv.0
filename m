Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6029E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUyhcQybpoA/hYxI1kIP3NwBRw4fymu1XLYbcKCw4vI=; b=c9E5PszsTWTXKX
	QQcNCx+r7trHQFnBKq2qdJWZYNDkpYRRFZA8PZguaKiSngcI/oWZRy9Xu9tDkcZ/VzhtJRcp1HtQb
	Yyg6qY3CUiNOYzFYHKRXo79rbQ/TT671ERzHyWxkgsJWjk201iQpAKmKxQ0YxcaSvOTv9VqbaOFDm
	2NBlgATAHb4dnpqJQ6NgxqIHmCYuibfYuLnTmpeqRGk8tdMYa73XZlLw1QXOIJenk0wPuDr4tEz8a
	vdcmMr35JZ69rwiMITNcdKWA8WhAnUTU/hL7ZmlboksYJqhs1h1I3dPKmN8zMPuiHqhSdY4k9Pps2
	A97na04wXb4oLs0S++YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPrQ-00000007J4y-3836;
	Wed, 08 Jan 2025 06:48:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPrN-00000007J4L-2ko2
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 06:48:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9472EA4014B
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jan 2025 06:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB06C4CEE6
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jan 2025 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736318887;
	bh=DqehjEbYBNgsSdfrk7Gp0J2UOco4jKErh154ZjgkyFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mVuhmCBlVSMDypBYVXzkPh5zxvsUPX506H/t+0/zI2IqaFLmYqwt/q+hkOArn3hMk
	 KY1pWZ7XGkEHmk+4q5ZUaTPUM8ojmlwwjCPRNUN2UWT2TYeIXRiRlKe6mIK+r2/d2Y
	 gaNLeTl86U5H2fFRIzMp65qcwaNE2EHNrVYKQfwMRoEYS9jJkI7UccQZlTJb9irMxH
	 IToYgR1dXYOmWO2/NYyCs2J3yQTvm7Gv4ljgikZeIl/wpxZfydlkGyi/sLnkFq4F3t
	 Kru+nlL85tp6MutlxlYyL1zFmAeoBANwKevKIilO42OXrDcEm6CZ6zAx/6Ftefp5du
	 +gAdxwXiXuEIg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso2148713a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 22:48:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaD+vUevXc3U02EMiyChcvczC7uV8GUVmZm7ORJxEGqD+B14Xjp81t6HPtSctNZrd3E7TPfuOBSrHQZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5tdkJHAQfvaFJvHTfzOMgiOZAB71YUWeYV9k4nVW3G/g/mzd
	VuEOjCulXkleq6R31Z0tWI5DYwPKz7Rw1FlgmvHXP08xto+2ofgZTJhOFZYq1Y36jjy8/s7ERD5
	OgL1AKI6uhy/alNlpH1OU3c9ZtqA=
X-Google-Smtp-Source: AGHT+IFQiLj+EqRoItgWkCcqPZHA1BZTCXfkF+nlbvuakdYpnzXgPFNNKhWroWBS2mGtleDRYJs6J5MiQ26cTGoR+pk=
X-Received: by 2002:a05:6402:354b:b0:5d0:f830:ef5b with SMTP id
 4fb4d7f45d1cf-5d972e6e0famr1053043a12.29.1736318886007; Tue, 07 Jan 2025
 22:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20250103024616.3359159-1-guoren@kernel.org> <a110be11-923e-4943-8741-43b5513c9691@ghiti.fr>
 <92eb2691-3b40-4549-83cf-fbdd0e98bf63@sifive.com>
In-Reply-To: <92eb2691-3b40-4549-83cf-fbdd0e98bf63@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 Jan 2025 14:47:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQomhrkYZORgG4ufRfQW3LhD4tG21GhX0v2Q=mR77mOKg@mail.gmail.com>
X-Gm-Features: AbW1kvY6SS07dX-cAoOyeK1Th0fzy9g2yBA-bYSqL-ERKUCMjhKHt54-h393Lsk
Message-ID: <CAJF2gTQomhrkYZORgG4ufRfQW3LhD4tG21GhX0v2Q=mR77mOKg@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	baolu.lu@linux.intel.com, zong.li@sifive.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_224809_941494_FA2C02AB 
X-CRM114-Status: GOOD (  19.47  )
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

SGkgU2FtdWVsICYgQWxleGFuZHJlLAoKT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjQ34oCvQU0g
U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkg
QWxleCwKPgo+IE9uIDIwMjUtMDEtMDYgNDozMSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
ID4gT24gMDMvMDEvMjAyNSAwMzo0NiwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4gRnJv
bTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4+Cj4gPj4gV2hlbiBfX0JJ
VFNfUEVSX0xPTkcgPT0gMzIsIHNpemVfdCBpcyBkZWZpbmVkIGFzIHVuc2lnbmVkIGludCByYXRo
ZXIKPiA+Cj4gPgo+ID4gUklTQ1ZfSU9NTVUgZGVwZW5kcyBvbiA2NEJJVCBzbyBob3cgZG8geW91
IGdldCBfX0JJVFNfUEVSX0xPTkcgPT0gMzI/Cj4KPiBJIGFtIGd1ZXNzaW5nIHRoaXMgaXMgZnJv
bSBzb21lIGRvd25zdHJlYW0gZWZmb3J0IHRvIGNvbXBpbGUgYSA2NC1iaXQga2VybmVsCj4gd2l0
aCBhbiBJTFAzMiBBQkkuIEhvd2V2ZXIgdW5zdXBwb3J0ZWQgdGhhdCBtYXkgYmUsIHNpemVfdCBp
cyB0aGUgbm9taW5hbCB0eXBlCj4gdXNlZCBpbiBib3RoIHJpc2N2X2lvbW11X3B0ZV9mZXRjaCgp
IGFuZCBhYm92ZSBpbiBpb21tdV9pb3RsYl9nYXRoZXJfYWRkX3BhZ2UoKSwKPiBzbyB0aGUgY2hh
bmdlIGRvZXMgbWFrZSBzZW5zZS4KWWVzLCBJJ20gd29ya2luZyBvbiBJTFAzMiBBQkkgb24gQ09O
RklHXzY0QklUPXkuIFNvLCBJIGdvdCB0aGUgd2FybmluZwp3aGVuIF9fQklUU19QRVJfTE9ORyA9
PSAzMi4KCkluIHJpc2N2X2lvbW11X3VubWFwX3BhZ2VzKCksIHdlJ3ZlIHdyaXR0ZW4gInNpemVf
dCBwdGVfc2l6ZTsuIiBTbywgd2UKc2hvdWxkIGRvIHRoYXQgaW4gInJpc2N2X2lvbW11X2lvdmFf
dG9fcGh5cygpIi4KCj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+Cj4gPj4gdGhhbiB1bnNpZ25lZCBs
b25nLiBUaGVyZWZvcmUsIHdlIHNob3VsZCB1c2Ugc2l6ZV90IHRvIGF2b2lkCj4gPj4gdHlwZS1j
aGVja2luZyBlcnJvcnMuCj4gPj4KPiA+PiBGaXhlczogNDg4ZmZiZjE4MTcxICgiaW9tbXUvcmlz
Y3Y6IFBhZ2luZyBkb21haW4gc3VwcG9ydCIpCj4gPj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8
Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgo+ID4+IENjOiBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3Np
bmMuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgMiAr
LQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIvZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPj4gaW5kZXggOGEwNWRlZjc3NGJkLi4zOGQzODExNjQz
ODUgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPj4gKysr
IGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPj4gQEAgLTEyNzAsNyArMTI3MCw3IEBA
IHN0YXRpYyBwaHlzX2FkZHJfdCByaXNjdl9pb21tdV9pb3ZhX3RvX3BoeXMoc3RydWN0Cj4gPj4g
aW9tbXVfZG9tYWluICppb21tdV9kb21haW4sCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbWFfYWRkcl90IGlvdmEpCj4gPj4gICB7Cj4gPj4gICAgICAgc3RydWN0IHJpc2N2X2lvbW11
X2RvbWFpbiAqZG9tYWluID0gaW9tbXVfZG9tYWluX3RvX3Jpc2N2KGlvbW11X2RvbWFpbik7Cj4g
Pj4gLSAgICB1bnNpZ25lZCBsb25nIHB0ZV9zaXplOwo+ID4+ICsgICAgc2l6ZV90IHB0ZV9zaXpl
Owo+ID4+ICAgICAgIHVuc2lnbmVkIGxvbmcgKnB0cjsKPiA+PiAgICAgICAgIHB0ciA9IHJpc2N2
X2lvbW11X3B0ZV9mZXRjaChkb21haW4sIGlvdmEsICZwdGVfc2l6ZSk7Cj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
