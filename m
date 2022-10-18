Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC7DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIMz27ArQQhCmIwO+QOidEucNB12sZ5COandGqgra+s=; b=qIcgEtF5IDEiMC
	DRAzWWsLwXc2zy7FmpwEN8dPg3uvHxr6aWNmpl0I0urfiggv20fixkzJ8QvaPIXqqpUi4YV5UQXYM
	h5fCRs7wn34O2/WIf0n7c0gjsy7uW6XP5abGZfhGdD/rBzYqrVMaPKlE9TWPP8L0Y3OEDZpggnDT9
	xwlkmDzNdnxrCe3gLs3cOdbpZq0KXT4+vxXHUcZWuN9SL4uD++PSbUZbiTMqKVvLIcCrSsw+G/AWY
	zEA2PS1RPZXgKpfWB+CgFujxaR0CatJwdm3LmDUyEVhafICgAxeuHxld0oITbt6dIszJMSabGNOep
	PXlChTZEGx1NJGdYs4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko1q-007PEL-0G; Tue, 18 Oct 2022 14:57:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko1l-007PBx-Lt
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 14:57:11 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 802FF3F488
	for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1666105024;
	bh=BafWgVTs1Qs33lQ5vYE0lEluRGQS0XS1I2Mm/0y61yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OZUEAoVQEBNpasj8uBxRqaPTgMjpgC+BL8NLcndDFANai2tsbRSQnZu882Y82xw6X
	 p6Nm79SR+FqYpAGyWjeC3zqDygFIGvgs6vxMvKchU3aYnPkzIgvD/OSYQW9vyjmha5
	 RZ/6Ol21et/sRFfw9cDmBDAZoOnRT1amdKE6hAcTe8f0GIShMmwrxfkDEfsdto8keC
	 KUkrx/lHwRap7W3h/xJ3lWTEuUiOB76aFUqkLHuF/XgWpjIMJkWHziATvlD53D/TFq
	 gYL4xqbCJGFszZWJupGlCE0K4B0iFKJZddBzFWepjlGFN47y1Nfkkde+3D/wFxeJam
	 cdWuBQ5TKZuuw==
Received: by mail-qk1-f199.google.com with SMTP id j13-20020a05620a288d00b006be7b2a758fso12344817qkp.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 07:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BafWgVTs1Qs33lQ5vYE0lEluRGQS0XS1I2Mm/0y61yc=;
        b=WuAmdXKHKenGl3EVqzsyD1YC8Sd4AVRytsqEssx9KdUyzOt1LcH9rzZIghj1Y+29lX
         wHLlK6lrSYl95QJh8zBf34d0XyiKK1QchXNXXwwresItN8TA3KLKPReDHxgC4Dj/qPYw
         CHPtOUEEREsP7hCdWFxuvGYP03k3rn21YJLlqNKORAab9eRGXaTN8FHXQ3j26oEM00xd
         RygkXloVCW9Q8/jMN51GGDsGt5CDEUNcNUvXAQSyy+dLoMhD14qNtfI4GrYSkVXsWnwE
         EjXoNUW0PBuZelbS0dCbpHE+JXHm9cDG2AohWt4JRRo0XF9U83CsEJ4nKAK9a2K731mP
         9ReQ==
X-Gm-Message-State: ACrzQf3gFQanF1ac4vLbS/514RdJuLeaCwuaf4FKFkFWTIEavV26SLZN
	SW4H2lGfXmAxJUZjFnVfs1mvdIJ2kj7M9DvEG/DNoZWiA9Rp0TaCSgGhUMqbtxyit6hEp1Jv0Is
	wAjXYMT731m6LPNRdHJm4GrOKybnb6tVjpz+YuoVxw2n/oAc7VqJfXglopaeolg==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr2400042qvb.5.1666105022667;
        Tue, 18 Oct 2022 07:57:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VLAiOfs5ypDxb9bi0mpLfwMnKLT/JanF3CcvFCQOgy+yFhQZHARVCsQs1Lrgtks+5teBsR2NSVjwnI8zDS7I=
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id
 gc1-20020a056214230100b004989f6f028dmr2400025qvb.5.1666105022393; Tue, 18 Oct
 2022 07:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221018091316.415685-1-emil.renner.berthing@canonical.com> <20221018132921.5fsbiz254npk2fci@pengutronix.de>
In-Reply-To: <20221018132921.5fsbiz254npk2fci@pengutronix.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 18 Oct 2022 16:56:46 +0200
Message-ID: <CAJM55Z_v069EJmnr_nLFx9CQV9HfAOc2vCFv95VSip59zLFvjA@mail.gmail.com>
Subject: Re: [PATCH v1] pwm: sifive: Always let the first pwm_apply_state succeed
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_075710_075917_D1AA6662 
X-CRM114-Status: GOOD (  34.31  )
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

T24gVHVlLCAxOCBPY3QgMjAyMiBhdCAxNToyOSwgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFR1ZSwgT2N0
IDE4LCAyMDIyIGF0IDExOjEzOjE2QU0gKzAyMDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3Rl
Ogo+ID4gQ29tbWl0IDJjZmU5YmJlYzU2ZWE1NzkxMzVjZGQ5MjQwOWZmZjM3MTg0MTkwNGYgYWRk
ZWQgc3VwcG9ydCBmb3IgdGhlCj4gPiBSR0IgYW5kIGdyZWVuIFBXTSBjb250cm9sbGVkIExFRHMg
b24gdGhlIEhpRml2ZSBVbm1hdGNoZWQgYm9hcmQKPiA+IG1hbmFnZWQgYnkgdGhlIGxlZHMtcHdt
LW11bHRpY29sb3IgYW5kIGxlZHMtcHdtIGRyaXZlcnMgcmVzcGVjdGl2ZWx5Lgo+ID4gQWxsIHRo
cmVlIGNvbG91cnMgb2YgdGhlIFJHQiBMRUQgYW5kIHRoZSBncmVlbiBMRUQgcnVuIGZyb20gZGlm
ZmVyZW50Cj4gPiBsaW5lcyBvZiB0aGUgc2FtZSBQV00sIGJ1dCB3aXRoIHRoZSBzYW1lIHBlcmlv
ZCBzbyB0aGlzIHdvcmtzIGZpbmUgd2hlbgo+ID4gdGhlIExFRCBkcml2ZXJzIGFyZSBsb2FkZWQg
b25lIGFmdGVyIHRoZSBvdGhlci4KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5IGl0IGRvZXMgZXhwb3Nl
IGEgcmFjZSBpbiB0aGUgUFdNIGRyaXZlciB3aGVuIGJvdGggTEVECj4gPiBkcml2ZXJzIGFyZSBs
b2FkZWQgYXQgcm91Z2hseSB0aGUgc2FtZSB0aW1lLiBIZXJlIGlzIGFuIGV4YW1wbGU6Cj4gPgo+
ID4gICB8ICAgICAgICAgIFRocmVhZCBBICAgICAgICAgICB8ICAgICAgICAgIFRocmVhZCBCICAg
ICAgICAgICB8Cj4gPiAgIHwgIGxlZF9wd21fbWNfcHJvYmUgICAgICAgICAgIHwgIGxlZF9wd21f
cHJvYmUgICAgICAgICAgICAgIHwKPiA+ICAgfCAgICBkZXZtX2Z3bm9kZV9wd21fZ2V0ICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ID4gICB8ICAgICAgcHdtX3NpZml2ZV9y
ZXF1ZXN0ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiAgIHwgICAgICAg
IGRkYXRhLT51c2VyX2NvdW50KysgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiA+
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICBkZXZtX2Z3bm9kZV9wd21fZ2V0
ICAgICAgfAo+ID4gICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgcHdtX3Np
Zml2ZV9yZXF1ZXN0ICAgICB8Cj4gPiAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgIGRkYXRhLT51c2VyX2NvdW50KysgIHwKPiA+ICAgfCAgICAgICAgIC4uLiAgICAgICAg
ICAgICAgICAgfCAgICAgICAgICAuLi4gICAgICAgICAgICAgICAgfAo+ID4gICB8ICAgIHB3bV9z
dGF0ZV9hcHBseSAgICAgICAgICB8ICAgIHB3bV9zdGF0ZV9hcHBseSAgICAgICAgICB8Cj4gPiAg
IHwgICAgICBwd21fc2lmaXZlX2FwcGx5ICAgICAgIHwgICAgICBwd21fc2lmaXZlX2FwcGx5ICAg
ICAgIHwKPiA+Cj4gPiBOb3cgYm90aCBjYWxscyB0byBwd21fc2lmaXZlX2FwcGx5IHdpbGwgc2Vl
IHRoYXQgZGRhdGEtPmFwcHJveF9wZXJpb2QsCj4gPiBpbml0aWFsbHkgMCwgaXMgZGlmZmVyZW50
IGZyb20gdGhlIHJlcXVlc3RlZCBwZXJpb2QgYW5kIHRoZSBjbG9jayBuZWVkcwo+ID4gdG8gYmUg
dXBkYXRlZC4gQnV0IHNpbmNlIGRkYXRhLT51c2VyX2NvdW50ID49IDIgYm90aCBjYWxscyB3aWxs
IGZhaWwKPiA+IHdpdGggLUVCVVNZLCB3aGljaCB3aWxsIHRoZW4gY2F1c2UgYm90aCBMRUQgZHJp
dmVycyB0byBmYWlsIHRvIHByb2JlLgo+ID4KPiA+IEZpeCBpdCBieSBsZXR0aW5nIHRoZSBmaXJz
dCBjYWxsIHRvIHB3bV9zaWZpdmVfYXBwbHkgdXBkYXRlIHRoZSBjbG9jawo+ID4gZXZlbiB3aGVu
IGRkYXRhLT51c2VyX2NvdW50ICE9IDEuCj4gPgo+ID4gRml4ZXM6IDllMzdhNTNlYjA1MSAoInB3
bTogc2lmaXZlOiBBZGQgYSBkcml2ZXIgZm9yIFNpRml2ZSBTb0MgUFdNIikKPiA+IFNpZ25lZC1v
ZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmlj
YWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMiArLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMKPiA+IGluZGV4IDJkNGZhNWU1ZmRkNC4uY2NkZjkyMDQ1ZjM0IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMKPiA+IEBAIC0xNTksNyArMTU5LDcgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+Cj4gPiAg
ICAgICBtdXRleF9sb2NrKCZkZGF0YS0+bG9jayk7Cj4gPiAgICAgICBpZiAoc3RhdGUtPnBlcmlv
ZCAhPSBkZGF0YS0+YXBwcm94X3BlcmlvZCkgewo+ID4gLSAgICAgICAgICAgICBpZiAoZGRhdGEt
PnVzZXJfY291bnQgIT0gMSkgewo+ID4gKyAgICAgICAgICAgICBpZiAoZGRhdGEtPnVzZXJfY291
bnQgIT0gMSAmJiBkZGF0YS0+YXBwcm94X3BlcmlvZCkgewo+Cj4gSU1ITyB0aGlzIG5lZWRzIGEg
Y29kZSBjb21tZW50LiBJdCBzaG91bGQgYW1vbmcgb3RoZXJzIG1lbnRpb24gdGhhdAo+IGFwcHJv
eF9wZXJpb2QgaXMgb25seSB6ZXJvIGlmIC5hcHBseSgpIHdhc24ndCBjYWxsZWQgYmVmb3JlLgoK
QWdyZWVkLiBJJ2xsIGFkZCBpbiB2Mi4KCj4gTGV0IG1lIG5vdGUgdGhpcyBpcyBpbmNvbnNpc3Rl
bnQuIEkgZGlkbid0IGNoZWNrIHRoZSBkZXRhaWxzLCBidXQgbGV0J3MKPiBhc3N1bWUgdGhlIFBX
TSBjYW4gaW1wbGVtZW50IC5wZXJpb2QgPSA1MDAgYW5kIC5wZXJpb2QgPSA1MTQgYW5kIG5vdGhp
bmcKPiBpbiBiZXR3ZWVuLiBTbyBpZiB0aGUgdGhlIGZpcnN0IFBXTSByZXF1ZXN0cyA1MTIgbnMg
aXQgZ2V0cyAoSSBob3BlKSA1MDAKPiBucy4gVGhlbiB3aGVuIHRoZSBzZWNvbmQgcmVxdWVzdHMg
Y29tZXMgaW4gcmVxdWVzdGluZyA1MTEgaXQgZmFpbHMgYW5kCj4gaWYgaXQgcmVxdWVzdHMgNTEy
IGlzIHN1Y2NlZWRzIGFsc28gZ2V0dGluZyA1MDAgbnMuIEhtbS4KClllcywgaWYgdHdvIGRpZmZl
cmVudCBjb25zdW1lcnMgd2FudHMgZGlmZmVyZW50IHBlcmlvZHMgdGhlbiB3aG9ldmVyCmdldHMg
dG8gdGFrZSB0aGUgbXV0ZXggaW4gcHdtX3NpZml2ZV9hcHBseSBmaXJzdCBnZXRzIHRvIHNldCB0
aGUgY2xvY2sKZm9yIGl0cyByZXF1ZXN0ZWQgcGVyaW9kIGFuZCB0aGUgb3RoZXIgY29uc3VtZXIg
d2lsbCBnZXQgLUVCVVNZLiBJCmRvbid0IHNlZSBob3cgdGhpcyBsZXRzIG9uZSBjb25zdW1lciBj
YWxsIHB3bV9zdGF0ZV9hcHBseSBzdWNjZXNzZnVsbHkKYnV0IHN0aWxsIGdldCBhIGRpZmZlcmVu
dCBwZXJpb2QgdGhvdWdoLgoKL0VtaWwKCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4KPiAtLQo+IFBl
bmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2
bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAg
ICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
