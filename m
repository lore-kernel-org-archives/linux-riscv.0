Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED89FC25B5F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWjzhvU1QGPtpc2nwn0liIvfubaJjx2Cyasp0Xo2FgY=; b=ormkIe5oNnEk3r
	ratPS1U66E/AYXP6Cfubt14fa6qEN8nWCimPgqQplArKyJIbqX67HPRxxNDXAJKT3Vt6ujriWQnsx
	3pitcFbeMtb9y1yP3oaUypCTMJxd2tL7LUSDH+gX4IptRCTI83ZBR9PfqWACNt3dEWpJ3sqJCEiEj
	TdKLfxIkXGs3FyCEW5Qy0Ac+6jxxxTFvfGPbFw11OwyZ+GYGZ/UtRQ33fiPgI/FxvEsBUGGPr/Hoa
	8+d+v1TVpeLvF6omwg/l687HDbjpl+lPpDMINC1IYoRDvlpiG4Wy6DhpvbP7EqqPZHWENSU3kF9pI
	lAY+Dx9EPjC5hhXlR73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40sG-00000007zOQ-3jfk;
	Mon, 06 May 2024 16:07:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40sE-00000007zME-0rww
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 16:07:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so2314710e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715011647; x=1715616447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrl9wYenAkny/KczU5T4LBnOH/HfDi64n5pKG7uxGwQ=;
        b=GeELzJDH6RrMG2k5ESd4wJoNTNimTlb2Xn6hWvntKvp9kQhq3atXbHBOC6OhJcg8ZE
         pdl26jRROolJahBGXBzVUYoOeOcL003bkT1fEVbVYjqJAmFV/+ZC50xANn/OTn2sCZyg
         0+uaiVPGMZB+CvEYt8b5axkfLFbU3624cXFa73dsHZP9kIeC4CoTvzZRHWzgTxo6xvEh
         xU88W6NpS0msM/jxelh1ka1MNDXiPppvjoq5ZU5qGjApme8bOTHTVmsf8WrRauTCEFLE
         iA8X9K4igS2sJu0/t1F/4ZFtED0uJHhMAPi9uAnnxyIGclGAKGHH1T9a9ZUfIEkVn4Cz
         Z71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011647; x=1715616447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrl9wYenAkny/KczU5T4LBnOH/HfDi64n5pKG7uxGwQ=;
        b=pTBggurdquEadEdo7BIn6p5f1n9apwaiMBst2fdHqBIDy3M5sDpwhJzdeMRVhUNWhw
         NpEzlcboqO6CikpauJafF/jaNGNMEZcbEboB+mck3njyDe9n7zXM6aWdU5ZitXi55cIj
         KKOSjbYqilAqgoSRic6rZd1Xg+JgiUFspWiNPrd3QuqpYsC5Ic7oiuwVO70txw+E4o3d
         FCOa2bfHftR5mrFbf8Nj+kRdqpv1a6MRT68QXY1sl1eCvoLHbU9Bm+WdATmMH8i0ZAen
         RyLWpwskawLrtWoiVuX4+RuMw8+sLNZ9D4kPuMgaISQj5WeIT9UrPGA0NpmAXcGpQCuy
         dqyw==
X-Forwarded-Encrypted: i=1; AJvYcCWTq2Z54qR7Rs1mQEMDtSXskR44pOQ51FAuYPzy+pv2kf1CaiMcMjC7/oTobiJQ2Ne+nKDoZ/lgmWe0vbPi8QqZF3gCwwV6JuKlGNwgQHSC
X-Gm-Message-State: AOJu0YxhIthhgVUv83wmOJYut69hOoxCQdtAgfZwi4eUIjgDfrSgkGez
	4JUTVhiMMbTWjk2ZpeOg/9HWSVoFQbFh/Kz09BKJ5NqCxhiFWV7+GIWYObAMHZpuD+okylIsWNO
	QLyjOpMQ3v0/ZzzEmvsMiasKcxDDCDFX7
X-Google-Smtp-Source: AGHT+IGgclVNVqb50qaplhEiNbTTu3K8A0EV3SULEDaW0g40sWnAdxIwfF2EEqRKcTm96OkrR4aESZGXESCCHHFlBzk=
X-Received: by 2002:ac2:562f:0:b0:516:a6ff:2467 with SMTP id
 b15-20020ac2562f000000b00516a6ff2467mr5858381lff.0.1715011646493; Mon, 06 May
 2024 09:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240506155120.83105-1-libang.li@antgroup.com> <20240506155120.83105-6-libang.li@antgroup.com>
In-Reply-To: <20240506155120.83105-6-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 7 May 2024 00:07:14 +0800
Message-ID: <CAK1f24nX6mvLXiXNJUQWSKKUQ-Avhs0_NU1k8JBhVupOr3W6Mg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_090730_323476_2D377E9C 
X-CRM114-Status: GOOD (  21.39  )
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

T24gTW9uLCBNYXkgNiwgMjAyNCBhdCAxMTo1MuKAr1BNIEJhbmcgTGkgPGxpYmFuZy5saUBhbnRn
cm91cC5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgdGhlIGNvbW1pdCAxOWVhZjQ0OTU0ZGYgKCJtbTog
dGhwOiBzdXBwb3J0IGFsbG9jYXRpb24gb2YgYW5vbnltb3VzCj4gbXVsdGktc2l6ZSBUSFAiKSwg
aXQgbWF5IG5lZWQgdG8gYmF0Y2ggdXBkYXRlIHRsYiBvZiBhbiBhZGRyZXNzIHJhbmdlCj4gdGhy
b3VnaCB0aGUgdXBkYXRlX21tdV90bGIgZnVuY3Rpb24uIFdlIGNhbiBzaW1wbGlmeSB0aGlzIG9w
ZXJhdGlvbiBieQo+IGFkZGluZyB0aGUgdXBkYXRlX21tdV90bGJfcmFuZ2UgZnVuY3Rpb24sIHdo
aWNoIG1heSBhbHNvIHJlZHVjZSB0aGUKPiBleGVjdXRpb24gb2Ygc29tZSB1bm5lY2Vzc2FyeSBj
b2RlIGluIHNvbWUgYXJjaGl0ZWN0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJhbmcgTGkgPGxp
YmFuZy5saUBhbnRncm91cC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIHwg
OCArKysrKysrKwo+ICBtbS9tZW1vcnkuYyAgICAgICAgICAgICB8IDQgKy0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4gaW5k
ZXggMTgwMTlmMDM3YmFlLi44NjliZmU2MDU0ZjEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51
eC9wZ3RhYmxlLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+IEBAIC03MzcsNiAr
NzM3LDE0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X3RsYihzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKPiAgI2RlZmluZSBfX0hBVkVfQVJDSF9VUERBVEVfTU1VX1RMQgo+ICAj
ZW5kaWYKPgo+ICsjaWZuZGVmIF9fSEFWRV9BUkNIX1VQREFURV9NTVVfVExCX1JBTkdFCgpJSVJD
LCB0aGUgY29udGVtcG9yYXJ5IHByYWN0aWNlIGlzIHRvIGRlZmluZSBhIG1hY3JvIHdpdGggdGhl
IHNhbWUgbmFtZQphcyB0aGUgZnVuY3Rpb24gaWYgaXQgaXMgYmVpbmcgb3ZlcnJpZGRlbi4KClRo
YW5rcywKTGFuY2UKCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X3RsYl9yYW5nZShz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikK
PiArewo+ICt9Cj4gKyNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEJfUkFOR0UKPiAr
I2VuZGlmCj4gKwo+ICAvKgo+ICAgKiBTb21lIGFyY2hpdGVjdHVyZXMgbWF5IGJlIGFibGUgdG8g
YXZvaWQgZXhwZW5zaXZlIHN5bmNocm9uaXphdGlvbgo+ICAgKiBwcmltaXRpdmVzIHdoZW4gbW9k
aWZpY2F0aW9ucyBhcmUgbWFkZSB0byBQVEUncyB3aGljaCBhcmUgYWxyZWFkeQo+IGRpZmYgLS1n
aXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jCj4gaW5kZXggZWVhNmU0OTg0ZWFlLi4yZDUz
ZTI5Y2Y3NmUgMTAwNjQ0Cj4gLS0tIGEvbW0vbWVtb3J5LmMKPiArKysgYi9tbS9tZW1vcnkuYwo+
IEBAIC00NDIxLDcgKzQ0MjEsNiBAQCBzdGF0aWMgdm1fZmF1bHRfdCBkb19hbm9ueW1vdXNfcGFn
ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiAgICAgICAgIHZtX2ZhdWx0X3QgcmV0ID0gMDsKPiAg
ICAgICAgIGludCBucl9wYWdlcyA9IDE7Cj4gICAgICAgICBwdGVfdCBlbnRyeTsKPiAtICAgICAg
IGludCBpOwo+Cj4gICAgICAgICAvKiBGaWxlIG1hcHBpbmcgd2l0aG91dCAtPnZtX29wcyA/ICov
Cj4gICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkKPiBAQCAtNDQ5MSw4ICs0
NDkwLDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZG9fYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2Zh
dWx0ICp2bWYpCj4gICAgICAgICAgICAgICAgIHVwZGF0ZV9tbXVfdGxiKHZtYSwgYWRkciwgdm1m
LT5wdGUpOwo+ICAgICAgICAgICAgICAgICBnb3RvIHJlbGVhc2U7Cj4gICAgICAgICB9IGVsc2Ug
aWYgKG5yX3BhZ2VzID4gMSAmJiAhcHRlX3JhbmdlX25vbmUodm1mLT5wdGUsIG5yX3BhZ2VzKSkg
ewo+IC0gICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykKPiAtICAg
ICAgICAgICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYih2bWEsIGFkZHIgKyBQQUdFX1NJWkUg
KiBpLCB2bWYtPnB0ZSArIGkpOwo+ICsgICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYl9yYW5n
ZSh2bWEsIGFkZHIsIHZtZi0+cHRlLCBucl9wYWdlcyk7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
cmVsZWFzZTsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi4xOS4xLjYuZ2I0ODU3MTBiCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
