Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42390C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VBDR3nr4EsJzW9XsR9whOkDYHOLn1CQXy7EKVqSm84=; b=tSiJuaqkE/YO9q
	X7rXvSW5fxiqOQ59mgPLmXXQOH7rRY2LdroIaej4Xl3Z+rdngG2UVOgtzW+Z77aF5MdnGs4ruvQ3o
	ZYk8PFMIE3s1d18bYHE1pLiGwNT7ljW2dUd4YI6qPftTT5kKJlF1IcBeLVNIhsp/N67IutmZvX0M+
	VIgXAJwZdvy5xASl90i1ScpGocmsUjcLZ2BYYg+EBQ0L5zeAeiyLO5wHXSJxx/UlU1+bXw4akYuqi
	SlOyJLq6lrHff7tR1lwme/MdshsdJM/InTSB5A5RxtwLlAzKKYJrsk6GyvY8b3oa7kdkxaCDv6iUf
	yNrhGFDsZ5Q7hTpzSJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuGi-00HOXl-1Q;
	Mon, 08 May 2023 06:22:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuGf-00HOX4-1L
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:22:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7A1661F0C
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178CFC4339B
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683526960;
	bh=RRAYVfzWI2CIN+ZmTd/bzNs5d6ZXJ0prYFtjqrq3z2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W4YgewhFTRgROcxCyKuBM88Ro5dZcDfEdqGb2E2BWYtJsRXK80FvMuA7UGFy65kux
	 bAD8oHDIXaIfKFPPtGxUjrkK7huabRA9/6kIkF1a3OlYDam6HMf91YLHBoKvw7YFR4
	 Au+xRTY1OgmQO8DrNfVhmaYZrkkbxbtfwYA9PbK/aAzNL3BiPoC5dMlz6RBCOaq9xh
	 RivPf/taKaKqXy9eBIOXA1/e71am5j/Hmfi+rzqVuvCYr9YXfJ7kje7kGzvGEyq+oz
	 EQP2zvPn1HTq+3z8rsdzuU9Q5l3EUiM1c8Yutb/hkHFVYCk+S4HgrFHUEYoy/YL+uM
	 rRP+4zBcgZGjA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9619095f479so650648966b.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:22:40 -0700 (PDT)
X-Gm-Message-State: AC+VfDyuN1Mq3nPD+bWE3d5zfasFljNwPTYWGnWI2XoAJ/i3jrJjJXJI
	flzmzsLNpkyigNA5fGUgrs1w0YPzDwSEtcOLL2E=
X-Google-Smtp-Source: ACHHUZ55KUUiXjfH7U+W0+3/jL7jTooOxMmTkX1XEA+KeGqCKoJTXMo5o9ehY/VtsJLfH0v1UixisOeQfdwZzRiJWqE=
X-Received: by 2002:a17:907:1c05:b0:930:f953:9608 with SMTP id
 nc5-20020a1709071c0500b00930f9539608mr9710495ejc.0.1683526958366; Sun, 07 May
 2023 23:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-6-jszhang@kernel.org>
In-Reply-To: <20230507182304.2934-6-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:22:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSWgiQOidm5S-XqzfXff1HS+p=V4zUFD0mMBvUa-b0OFw@mail.gmail.com>
Message-ID: <CAJF2gTSWgiQOidm5S-XqzfXff1HS+p=V4zUFD0mMBvUa-b0OFw@mail.gmail.com>
Subject: Re: [PATCH 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
To: Jisheng Zhang <jszhang@kernel.org>, Wei Fu <wefu@redhat.com>, 
	Wei Fu <tekkamanninja@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_232241_516693_45B04449 
X-CRM114-Status: GOOD (  16.29  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAyOjM04oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEkgd291bGQgbGlrZSB0byB0ZW1wb3JhcmlseSBtYWludGFp
biB0aGUgVC1IRUFEIFJJU0MtViBTb0Mgc3VwcG9ydC4KV2VpIEZ1IGlzIHdvcmtpbmcgb24gVEgx
NTIwLCBhbmQgbWF5YmUgeW91IGNvdWxkIGhhdmUgYSBkaXNjdXNzaW9uCndpdGggaGltPyBUaHgu
CgpGLlkuSQoKV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDYg
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggN2UwYjg3ZDVhYTJlLi5lMWU1MWFj
Y2VjNGYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBA
IC0xODE1NSw2ICsxODE1NSwxMiBAQCBUOiAgICAgZ2l0IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdC8KPiAgRjogICAgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi8KPiAgRjogICAgIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvCj4KPiArUklTQy1WIFRIRUFEIFNvQyBTVVBQT1JUCj4gK006ICAgICBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gK0w6ICAgICBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gK1M6ICAgICBNYWludGFpbmVkCj4gK0Y6ICAgICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3RoZWFkLwo+ICsKPiAgUk5CRCBCTE9DSyBEUklWRVJTCj4gIE06ICAgICBNZC4gSGFy
aXMgSXFiYWwgPGhhcmlzLmlxYmFsQGlvbm9zLmNvbT4KPiAgTTogICAgIEphY2sgV2FuZyA8amlu
cHUud2FuZ0Bpb25vcy5jb20+Cj4gLS0KPiAyLjQwLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
