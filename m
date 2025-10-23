Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC927CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvaHLGB0fX9M522Wh9UnN4Ay7YVHZFSwLEGJw4+dXrQ=; b=Zc68DcHkWOAxMy
	JAxj3gOlzo7+hrCeLm7nugFDrCdzT7vRg0rPKURvJLexawHbg8qbSchhs2F1pRxRmp8in6o7mQmsF
	DNlW63oHjljUn2FKiShtrvHgEkg36SDmv3/fMuADTNehROBucVwng7icm04J9wPIXzZwAf1cTzFvT
	1YrgBaIaHjtTgdSRnrUq2195mgKs1XxxSgYzYfzLzWuOyaIqOF5kuaD1i8MrCbOSS6U3kwLSEKEGX
	NmrHSTdRNJI1de0N6l0q4J0VAhx8kNbH3GuJh25PUZVf/D1+RKU/awYrkzw7TbmyEkHYLRDa7qo01
	BAVUAawLjq7ZjTSm2wfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqLo-00000005TFX-3OIW;
	Thu, 23 Oct 2025 08:07:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqLn-00000005TEj-0C2A
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 08:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 446826049F
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 08:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E0AC19421
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761206829;
	bh=VysN6EHYkdOUpoEuRAyXlfItg/cHXm73ASmOEB5VMaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fpCxyfcxWolccjVuj+7ltJnTVlv9CldLMHV7ZNavYsxW82P1lUZ7eu5RIQMU1r+0z
	 Q3xnepx2lNUunvzZwfJFUOJxd0kx9eQBXPIwycYoC4rzTpRt4bwwhKpiQgAWDn8XEF
	 2r6OTz3xOYCAvs/iJOSTNcC3xU0yXsUPUwQCv8BtFXd9qBVT25rO1LjKq8+/3y173E
	 8XXuZL2HWIFV0I9aE2zabqYfwMVfljAoRdly3c3X/Qg8thLDjNDORjENu973pfSO34
	 2D7+P7SyQyXJoNBUHy4sAQuwQKVAJktid2w0h072k+rwxGw3hvZu1SDWuFKoYQLvzE
	 kBX1tiFV19OTA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592f22b1e49so474318e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 01:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQTl2vjWeG4E/tFURG/h6N+gIml/B807wZADaGAdDWCwPhIFt9oX03+oe/6egtZNdp8OIXq0g0eWakaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1zT4BTnjXZT1oK8ca48dZz1c9WI+G39DjDhGXG0PhSSn5uXBr
	0fKoQWaQxW/gdPMJYBZOopvv7g/vdWjiI/h8sopKaYk5yOyyKD6pzkBDWHJxXIJyVF7zDhTX8tM
	fdEKd9g3js4rR8EsHom5ha+NwfbwS5dc=
X-Google-Smtp-Source: AGHT+IH2k0BakTqpQ5lQqnKMRD6Z7aVcR5hL4BYeIHS6Ze64OfFlym0sW70AuM9NoMi3ufQme1oL95mzMLwh7Wx0wW8=
X-Received: by 2002:a05:6512:b1e:b0:58a:92cc:5819 with SMTP id
 2adb3069b0e04-591d853543dmr8192834e87.36.1761206828188; Thu, 23 Oct 2025
 01:07:08 -0700 (PDT)
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
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
In-Reply-To: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Oct 2025 10:06:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
X-Gm-Features: AS18NWDF5CVCCcvajdSpES8CkYD2Jn1SbZ6xM-qrHn3BdntYv4P4IHkWBRJpQ1c
Message-ID: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gVGh1LCAyMyBPY3QgMjAyNSBhdCAxMDowMSwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAyOjU14oCvUE0gVGll
emh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4KPiA+IEhpIEpvc2gg
YW5kIEFyZCwKPiA+Cj4gPiBPbiAyMDI1LzEwLzIwIOS4i+WNiDI6NTUsIEh1YWNhaSBDaGVuIHdy
b3RlOgo+ID4gPiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCA5OjI04oCvQU0gVGllemh1IFlhbmcg
PHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEhpIEpvc2gsIEFy
ZCBhbmQgSHVhY2FpLAo+ID4gPj4KPiA+ID4+IE9uIDIwMjUvMTAvMTgg5LiK5Y2IMTowNSwgSm9z
aCBQb2ltYm9ldWYgd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gLi4uCj4gPiA+Pgo+ID4gPj4+IEJ1dCBJ
SVVDLCB0aGUgbGlic3R1YiBjb2RlIHJ1bnMgKnZlcnkqIGVhcmx5LCBhbmQgd291bGRuJ3Qgc2hv
dyB1cCBpbiBhCj4gPiA+Pj4gc3RhY2sgdHJhY2UgYW55d2F5LCBiZWNhdXNlIHRoZXJlIGFyZSBu
byB0cmFjZXMgb2YgaXQgb24gdGhlIHN0YWNrIG9uY2UKPiA+ID4+PiBpdCBicmFuY2hlcyB0byBo
ZWFkLlMgY29kZSAod2hpY2ggZG9lc24ndCBzYXZlIHRoZSBsaW5rIHJlZ2lzdGVyKS4KPiA+ID4+
Cj4gPiA+PiBUaGFua3MgZm9yIHlvdXIgZGlzY3Vzc2lvbnMuCj4gPiA+Pgo+ID4gPj4gQXJlIHlv
dSBPSyB3aXRoIHRoaXMgY3VycmVudCBwYXRjaD8KPiA+ID4gRm9yIG1lIHRoZSBjdXJyZW50IHBh
dGNoIGlzIGp1c3QgT0suCj4gPgo+ID4gV2UgaGF2ZSBkaXNjdXNzZWQgdGhpcyBhIGZldyB0aW1l
cyBidXQgdGhlcmUgaXMgYWxtb3N0IG5vIGNvbnNlbnN1cwo+ID4gb2Ygd2hhdCBzaG91bGQgaGFw
cGVuIG5leHQgYW5kIG5vdGhpbmcgY2hhbmdlcy4KPiA+Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIGdp
dmUgbWUgYSBjbGVhciByZXBseT8gVGhlbiBJIGNhbiBtYWtlIHByb2dyZXNzIGZvcgo+ID4gdGhl
IGZvbGxvd2luZyBzZXJpZXM6Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbG9vbmdh
cmNoLzIwMjUwOTE3MTEyNzE2LjI0NDE1LTEteWFuZ3RpZXpodUBsb29uZ3Nvbi5jbi8KPiBGb3Ig
bWUsIHRoaXMgcGF0Y2ggaXMgT0ssIGlnbm9yZSBfX2VmaXN0dWJfIHByZWZpeCBpbiBvYmp0b29s
IGlzIGFsc28KPiBPSyBbMV0uIEJ1dCBJIGNhbm5vdCBhY2NlcHQgdGhlIHdheSB0aGF0IG1vZGlm
eWluZyB0aGUgZWZpc3R1YiBwYXJ0Cj4gb25seSBmb3IgTG9vbmdBcmNoLgo+Cj4gQ2xlYXIgZW5v
dWdoPwo+CgpMb29uZ0FyY2ggaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdoaWNoIGhhcyB0aGUg
cHJvYmxlbSwgc28gSSBkb24ndApzZWUgYSByZWFzb24gdG8gbW9kaWZ5IG90aGVyIGFyY2hpdGVj
dHVyZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
