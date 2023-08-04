Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A98DC001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QTtVJYFFl57DmLZD7fBXJdsHnGMIjqk3WKsFquz7S4=; b=HIiTr5Z3bp4yg3
	Z/FLCuDH2geT1rmAiGpDwDhNClbNf2tX+FQ4M69pbdOfJbQt3HUw5RuC/8uyHSHyIi+ssYNi9BIXz
	JcD9G65wDIXQ7+6ykYlbCkdm2+wLKIbqQUl6NESxMu3e+thzHAwuO3gnin7n/9IGJqgHOPmVE/TxS
	4CdebUt45IAflSPdprreBae7RLH9vbysS8BVb1XdzQRl9166P2+tfqhHrUK3srgaJdu65K6R83d3r
	HzK97cQhMhjKbRvEKpQcK44LqUH5Q4tAVDUmifb3nkPs1d2ZCh21Hx5dcpqftvCkktOVuIJisOSwM
	k2fNxwpysmQkd/MS3krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqDj-00BtRM-2z;
	Fri, 04 Aug 2023 08:31:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqDh-00BtQu-1S
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E90A61F60
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 08:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B57C433CC
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691137895;
	bh=PMg5/i5K6XzQCEgkCjUpkRAzmh6AZZ34kkvt76wThO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FVn33WJgCOhX/L/aX9CJo9m9KHr7oGPIwOtTaIpJW8jvpEcfdsY5eVpiqB5YO+aDZ
	 nvP1uETCAOpaN/LJcmwHO7kNJcK2blZ1vvtuZ3S+zXS9RSdY8seY6FzLLCAaiAefkk
	 654XZRJan4tiO8dnOw3unchH4AMv8o9RXHGLbmkG59t0f0/sWtHTreSzpneWDCDRwr
	 RoXiY6TZcTQrAz87KJK668zhFFap36DB/I+fkX74Dbdq8aPMEhwnnjWVLVxBUOSyhq
	 N6V0xj1J8ocj5QHDtWtydrnH1MDx772cV3RP/CwM5VFWSyobY4wV79Gi4OGPtUs6dH
	 IRHR7xbZXvvIQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso3106746e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:31:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw6VBO0prickQyNwWtFrZIkLT+dz1r0aZTLdHmjjambelFV1fYn
	tcR0GqxHt1OM+MOO6fJf5E4DU5/ILgAVUlEKVzs=
X-Google-Smtp-Source: AGHT+IGsLEy22eau6dwanYbYK0CBYu/tLY4uxzo4SIr7505bHyyDhLiP3kxQdWQ+gmjVGSEjmDnEfOJPxSGDDrhY67w=
X-Received: by 2002:a05:6512:1cd:b0:4fb:8f79:631 with SMTP id
 f13-20020a05651201cd00b004fb8f790631mr690035lfp.46.1691137893509; Fri, 04 Aug
 2023 01:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230726172958.1215472-1-ardb@kernel.org> <ZMy1DkYRBc1PxC8e@gondor.apana.org.au>
In-Reply-To: <ZMy1DkYRBc1PxC8e@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Aug 2023 10:31:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHCt6DJEZKYVYBXN0QhZ0w2ByCPUK2S2y2T5U06Ztrx9A@mail.gmail.com>
Message-ID: <CAMj1kXHCt6DJEZKYVYBXN0QhZ0w2ByCPUK2S2y2T5U06Ztrx9A@mail.gmail.com>
Subject: Re: [PATCH] crypto: riscv/aes - Implement scalar Zkn version for RV32
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, ebiggers@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_013137_575272_C344E9B2 
X-CRM114-Status: GOOD (  23.79  )
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

T24gRnJpLCA0IEF1ZyAyMDIzIGF0IDEwOjIxLCBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5h
cGFuYS5vcmcuYXU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMDc6Mjk6NThQ
TSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPiBUaGUgZ2VuZXJpYyBBRVMgaW1wbGVt
ZW50YXRpb24gd2UgcmVseSBvbiBpZiBubyBhcmNoaXRlY3R1cmUgc3BlY2lmaWMKPiA+IG9uZSBp
cyBhdmFpbGFibGUgcmVsaWVzIG9uIGxvb2t1cCB0YWJsZXMgdGhhdCBhcmUgcmVsYXRpdmVseSBs
YXJnZSB3aXRoCj4gPiByZXNwZWN0IHRvIHRoZSB0eXBpY2FsIEwxIEQtY2FjaGUgc2l6ZSwgd2hp
Y2ggbm90IG9ubHkgYWZmZWN0cwo+ID4gcGVyZm9ybWFuY2UsIGl0IG1heSBhbHNvIHJlc3VsdCBp
biB0aW1pbmcgdmFyaWFuY2VzIHRoYXQgY29ycmVsYXRlIHdpdGgKPiA+IHRoZSBlbmNyeXB0aW9u
IGtleXMuCj4gPgo+ID4gU28gd2UgdGVuZCB0byBhdm9pZCB0aGUgZ2VuZXJpYyBjb2RlIGlmIHdl
IGNhbiwgdXN1YWxseSBieSB1c2luZyBhCj4gPiBkcml2ZXIgdGhhdCBtYWtlcyB1c2Ugb2Ygc3Bl
Y2lhbCBBRVMgaW5zdHJ1Y3Rpb25zIHdoaWNoIHN1cHBsYW50IG1vc3Qgb2YKPiA+IHRoZSBsb2dp
YyBvZiB0aGUgdGFibGUgYmFzZWQgaW1wbGVtZW50YXRpb24gdGhlIEFFUyBhbGdvcml0aG0uCj4g
Pgo+ID4gVGhlIFprbiBSSVNDLVYgZXh0ZW5zaW9uIHByb3ZpZGVzIGFub3RoZXIgaW50ZXJlc3Rp
bmcgdGFrZSBvbiB0aGlzOiBpdAo+ID4gZGVmaW5lcyBpbnN0cnVjdGlvbnMgb3BlcmF0aW5nIG9u
IHNjYWxhciByZWdpc3RlcnMgdGhhdCBpbXBsZW1lbnQgdGhlCj4gPiB0YWJsZSBsb29rdXBzIHdp
dGhvdXQgcmVseWluZyBvbiB0YWJsZXMgaW4gbWVtb3J5LiBUaG9zZSB0YWJsZXMgY2FycnkKPiA+
IDMyLWJpdCBxdWFudGl0aWVzLCBtYWtpbmcgdGhlbSBhIG5hdHVyYWwgZml0IGZvciBhIDMyLWJp
dCBhcmNoaXRlY3R1cmUuCj4gPiBBbmQgZ2l2ZW4gdGhlIHVzZSBvZiBzY2FsYXJzLCB3ZSBkb24n
dCBoYXZlIHRvIHJlbHkgaW4gaW4ta2VybmVsIFNJTUQsCj4gPiB3aGljaCBpcyBhIGJvbnVzLgo+
ID4KPiA+IFNvIGxldCdzIHVzZSB0aGUgaW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVudCB0aGUgY29y
ZSBBRVMgY2lwaGVyIGZvciBSVjMyLgo+ID4KPiA+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndh
bG1zbGV5QHNpZml2ZS5jb20+Cj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KPiA+IENjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiA+IENjOiBD
aHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KPiA+IENjOiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNj
di9jcnlwdG8vS2NvbmZpZyAgICAgICAgICAgICB8ICAxMiArKwo+ID4gIGFyY2gvcmlzY3YvY3J5
cHRvL01ha2VmaWxlICAgICAgICAgICAgfCAgIDMgKwo+ID4gIGFyY2gvcmlzY3YvY3J5cHRvL2Fl
cy1yaXNjdjMyLWdsdWUuYyAgfCAgNzUgKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9jcnlw
dG8vYWVzLXJpc2N2MzItemtuZWQuUyB8IDExOSArKysrKysrKysrKysrKysrKysrKwo+ID4gIDQg
ZmlsZXMgY2hhbmdlZCwgMjA5IGluc2VydGlvbnMoKykKPgo+IEhpIEFyZDoKPgo+IEFueSBjaGFu
Y2UgeW91IGNvdWxkIHBvc3Rwb25lIHRoaXMgdGlsIGFmdGVyIEkndmUgZmluaXNoZWQgcmVtb3Zp
bmcKPiBjcnlwdG9fY2lwaGVyPwo+CgpUaGF0J3MgZmluZSB3aXRoIG1lLiBEbyB5b3UgaGF2ZSBh
biBFVEEgb24gdGhhdD8gTmVlZCBhbnkgaGVscD8KCkkgaGF2ZSBpbXBsZW1lbnRlZCB0aGUgc2Nh
bGFyIDY0LWJpdCBjb3VudGVycGFydCBhcyB3ZWxsIGluIHRoZSBtZWFuIHRpbWUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
