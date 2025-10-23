Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD94ACCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dO4AioIN2o5jCvyyQ857tSaw+dsA4p7Zv1Tmyfxfhk=; b=UVlhzX+9WjWbRt
	fr+zAPPw6cJMvELU66k5Nc3GonE892KceH+YehFlF1pVJylKpzcY7RppQhOEM0wAMvcfbKwMZF7hx
	TgCykDTsLJynQWiZuy4Hv3JDmCNmZy8bTFgcVe/YUIafMYUmym7TUVnhv9SPuWHpEJsMGwIi3hhtD
	4m1G/w/9Futmd4vqOqTFBcYxnLPs4MMZGa5XKc5iOHezp5osgfJzXn43viEqRfe9xGqjyBmWAa+tL
	qEzOJf7lwByuNzTrsqJrjCfRruHp9Q98z4lyFIjzFfQkZGmWyIBzHVI7llxzu7qLozv3ogcBPd+FA
	zJkVwSo8GEVGYNTK+qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqGj-00000005SMJ-2SJA;
	Thu, 23 Oct 2025 08:01:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqGi-00000005SLy-002q
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 08:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E993605BC
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 08:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D63EC116B1
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761206515;
	bh=m7tbJmNH1DXNfTU+Xp3xL+FoPO8IvUCQ4iTCgB6ek3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RA7j75QVc5ILMBKj/72NMEFdIwS9ZPlfJ+fJQRtKqD0/4aaYhy4lPNds6GfmVwrWu
	 UtqfHK9gl7XEDWTigFsMA54w2QInEqrGnLNBO8Aoy4v0NL7WQgdFnFs6NjZ/b1UaFn
	 sj6UOzmRYkylU87ieA6GjjFup20n57aQmQlUE95CA4nZlsGZcyaBLpdcrrRelcysdk
	 Em77VyHtM7uo7W3ghXZdiwRzsLEmGVrZdCt2U+zEx39jChNcRsO27jUp4vDgH2uXkR
	 YOFNQtkGMCvaNrU7GcXZnQkojb4cm+kctXgFic+peHScM083oEo4zScim4Er6s6jvg
	 nfpXjd6z7zk7Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso781812a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 01:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLWakYsi7ZVNrxiDdDbysYqVnp83PVNuZUikm+S1PK1t2IC9rhlb0os7CIeRd3dp776FS3UGskCM3unw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEqsqYERy1P85rFcjH542CnbEj8w0UUPSHJ/gFDhDGE89OVAf/
	frVoQHV9MraLx1AApnoJ0lZ0MxJWq1KGx4E8ubBYOp+RFcGEOSBCA+weQuLnmKydyQK2byVLZsk
	dnP6yV11749mIkrxtbJ2Ry807Mf7zc8Q=
X-Google-Smtp-Source: AGHT+IHfBLH/GBfgXrqchxfxu9l1VaoEMJ8tUkoEMadPUjtpN04Dne7DQiXnlqVZI5khk1s5nO6HkYPeLlaWwbhf/8k=
X-Received: by 2002:a05:6402:1e8f:b0:636:9129:882f with SMTP id
 4fb4d7f45d1cf-63c1f6e1e4dmr22674073a12.30.1761206513683; Thu, 23 Oct 2025
 01:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
In-Reply-To: <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 23 Oct 2025 16:01:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
X-Gm-Features: AS18NWATDqwQc-mvgyc-6ppP82QmD732g4zxHKYB9A2rEPJ5_4tzPE-f0_vNffE
Message-ID: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjo1NeKAr1BNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IEhpIEpvc2ggYW5kIEFyZCwKPgo+IE9uIDIwMjUvMTAv
MjAg5LiL5Y2IMjo1NSwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gPiBPbiBNb24sIE9jdCAyMCwgMjAy
NSBhdCA5OjI04oCvQU0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3Rl
Ogo+ID4+Cj4gPj4gSGkgSm9zaCwgQXJkIGFuZCBIdWFjYWksCj4gPj4KPiA+PiBPbiAyMDI1LzEw
LzE4IOS4iuWNiDE6MDUsIEpvc2ggUG9pbWJvZXVmIHdyb3RlOgo+ID4+Cj4gPj4gLi4uCj4gPj4K
PiA+Pj4gQnV0IElJVUMsIHRoZSBsaWJzdHViIGNvZGUgcnVucyAqdmVyeSogZWFybHksIGFuZCB3
b3VsZG4ndCBzaG93IHVwIGluIGEKPiA+Pj4gc3RhY2sgdHJhY2UgYW55d2F5LCBiZWNhdXNlIHRo
ZXJlIGFyZSBubyB0cmFjZXMgb2YgaXQgb24gdGhlIHN0YWNrIG9uY2UKPiA+Pj4gaXQgYnJhbmNo
ZXMgdG8gaGVhZC5TIGNvZGUgKHdoaWNoIGRvZXNuJ3Qgc2F2ZSB0aGUgbGluayByZWdpc3Rlciku
Cj4gPj4KPiA+PiBUaGFua3MgZm9yIHlvdXIgZGlzY3Vzc2lvbnMuCj4gPj4KPiA+PiBBcmUgeW91
IE9LIHdpdGggdGhpcyBjdXJyZW50IHBhdGNoPwo+ID4gRm9yIG1lIHRoZSBjdXJyZW50IHBhdGNo
IGlzIGp1c3QgT0suCj4KPiBXZSBoYXZlIGRpc2N1c3NlZCB0aGlzIGEgZmV3IHRpbWVzIGJ1dCB0
aGVyZSBpcyBhbG1vc3Qgbm8gY29uc2Vuc3VzCj4gb2Ygd2hhdCBzaG91bGQgaGFwcGVuIG5leHQg
YW5kIG5vdGhpbmcgY2hhbmdlcy4KPgo+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGNsZWFy
IHJlcGx5PyBUaGVuIEkgY2FuIG1ha2UgcHJvZ3Jlc3MgZm9yCj4gdGhlIGZvbGxvd2luZyBzZXJp
ZXM6Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvMjAyNTA5MTcxMTI3MTYu
MjQ0MTUtMS15YW5ndGllemh1QGxvb25nc29uLmNuLwpGb3IgbWUsIHRoaXMgcGF0Y2ggaXMgT0ss
IGlnbm9yZSBfX2VmaXN0dWJfIHByZWZpeCBpbiBvYmp0b29sIGlzIGFsc28KT0sgWzFdLiBCdXQg
SSBjYW5ub3QgYWNjZXB0IHRoZSB3YXkgdGhhdCBtb2RpZnlpbmcgdGhlIGVmaXN0dWIgcGFydApv
bmx5IGZvciBMb29uZ0FyY2guCgpDbGVhciBlbm91Z2g/CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbG9vbmdhcmNoLzIwMjUwOTE3MTEyNzE2LjI0NDE1LTEteWFuZ3RpZXpodUBsb29uZ3Nv
bi5jbi9ULyNtZWVmNzQxMWFiZDE0ZjRjMjhjODVlNjg2NjE0YWE5MjExZmNjZGNhMAoKSHVhY2Fp
Cgo+Cj4gVGhhbmtzLAo+IFRpZXpodQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
