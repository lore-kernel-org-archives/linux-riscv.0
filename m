Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD51EC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kflUpnahF4hS4fMmdlb1BgIW4cUSCMGLmKXVO0meC6o=; b=MQWc55ojHfivl6
	WAAgiThOmDddXXOPFf5IYKDrNiaUlPSjcdanLyYOH3fLoXiKS5dA6piluvcmDTeAARJYigpxVeEyj
	P1uJ9CPD+z6fVl6yC7/KDZE+Q8o+VwjlRzWjkWR9Bs+0fujyTc0LRAb68rXEcARJgGFmmCWCmK0T4
	6ADOnBA2k0N+y3tEwJH+m0wCVJSRqHIO3k4nluxbKlbu2IKvM3c8O7loGOkXsaUfLw2ask/xegZ+Q
	AAdvXHyjVJEUvKvi8FhzSXA0nDw9spZoyvRiCWMEl8vHK6qCUzWIGw7EYb5UX1WY+ADMFTmU1hmds
	0DJT6+6lF3jjqtMgJ+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Gg3-00000002H8l-3V2K;
	Sat, 04 May 2024 14:47:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Gg1-00000002H8M-2f8J
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 14:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F9A760B9C
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 14:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9BFC072AA
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714834067;
	bh=fw2E+aY9WkraiCEWaDZyCMF9dC7UfMVHORj8CW/uR0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mzXGSyGm1g4KLboYOZnYqdxlBtaTnrjBvVldARnANDvgEcIGSnrxbQ8Wq0QxWmt8p
	 E60iFwtjyOkpclc9NAENAewTkcG5u1tLrVgPZH4pkw/EQdbuhgtmJB2M9tNPWxmm1p
	 Uror41pvgooMZ4jw6F6DMGWALxvcxCWpzjMcV97aWgy8XJbtES2r6DRCLiZDHZC1hj
	 1NnIO6L5UV0PLGOTJnuULOAp38kKPB/eNktUZJydJinhYRqXKFHlXmeTpmVKYs5APV
	 /u1Gaqj+oIRlZZev2X+2AS7WYbreFZ9YLLJR2AnzpwNQ0g5CVu6IrvwJVMZqF4wEwM
	 cHG15d3MApuMg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52006fbae67so515859e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 07:47:46 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw1dJQIqjfcjiFE4VcJ/f7AJTcQf22u54tWeai+YPu6QYxJEKex
	sNzvQCPC6Lyp1BecHPPoozwVgjqpegGYlE3ULdvGKfINe35ywSDsI5AEkmpKjXzMRlEjJrFhA5/
	M5jhi3hwHVm4PlhNYjnvV6NsIhIg=
X-Google-Smtp-Source: AGHT+IFOSGq47HKKFcUKJSh06Ja/FFHjVignPWbD0QM9nuebLoEw2ENPLsO5p+OTXJ9vN64CQGMNZCUS+asovex4G3Y=
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id
 y20-20020ac24214000000b005191e339d85mr3467284lfh.36.1714834065760; Sat, 04
 May 2024 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
 <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com> <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
In-Reply-To: <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 23:47:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDtxZMajHJOU=pD+18gsOHg1QMEeHAY=eHQqQvzgsf4w@mail.gmail.com>
Message-ID: <CAK7LNAQDtxZMajHJOU=pD+18gsOHg1QMEeHAY=eHQqQvzgsf4w@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_074749_784137_77DBE8EB 
X-CRM114-Status: GOOD (  19.78  )
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

T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAxMTowMuKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE1hc2FoaXJvIFlh
bWFkYSB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDIsIDIwMjQgYXQgODoxNuKAr1BNIEVtaWwgUmVu
bmVyIEJlcnRoaW5nCj4gPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IFVzZSB0aGUgS0JVSUxEX0lNQUdFIHZhcmlhYmxlIHRvIGRldGVybWlu
ZSB0aGUgcmlnaHQga2VybmVsIGltYWdlIHRvCj4gPiA+IGluc3RhbGwgYW5kIGluc3RhbGwgY29t
cHJlc3NlZCBpbWFnZXMgdG8gL2Jvb3Qvdm1saW51ei0kdmVyc2lvbiBsaWtlIHRoZQo+ID4gPiAn
bWFrZSBpbnN0YWxsJyB0YXJnZXQgYWxyZWFkeSBkb2VzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2Fs
LmNvbT4KPiA+ID4gLS0tCj4gPiA+IFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBNYXNhaGlybydzIHBh
dGNoIGF0Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MTQxNzQxMzkuMzAw
MTE3NS0xLW1hc2FoaXJveUBrZXJuZWwub3JnCj4gPgo+ID4gVGhhbmsgeW91IGZvciBmaXhpbmcg
dGhlIGlzc3VlIGZvciByaXNjdi4KPiA+IE9ubHkgdGhlIHF1ZXN0aW9uIEkgaGF2ZSBpcyBob3cg
dGhpcyBwYXRjaCBzZXJpZXMgZ2V0cyBpbi4KPiA+IElmIGl0IHdhaXRzIGZvciB0aGUgbmV4dCBk
ZXZlbG9wbWVudCBjeWNsZSwgaXQgd2lsbCBiZQo+ID4gY2xlYW5seSBhcHBsaWNhYmxlLgo+Cj4g
SSdtIG9rIHdpdGggd2FpdGluZywgYnV0IG90aGVyd2lzZSBQYWxtZXIgY291bGQgdGFrZSBwYXRj
aCAxIGFuZCAyIGFuZCB5b3UKPiBjb3VsZCB0YWtlIHBhdGNoIDMuIFRoZSB3b3JzdCB0aGF0IGNh
biBoYXBwZW4gaXMgdGhhdCBhIGJpc2VjdCBsYW5kcyBvbiB5b3VyCj4gYnJhbmNoIHRoYXQgd2ls
bCBvbmx5IHBhY2thZ2UgdGhlIHVuY29tcHJlc3NlZCBJbWFnZSBpbiB0aGUgdGFyYmFsbHMgZXZl
biBpZgo+IEltYWdlLmd6IG9yIEltYWdlLmJ6MiBleGlzdC4gQ09ORklHX0VGSV9aQk9PVD15IGFu
ZCBDT05GSUdfWElQX0tFUk5FTD15X2tlcm5lbHMKPiB3aWxsIGFsc28gYmUgZmluZSB3aXRoIG9u
bHkgcGF0Y2ggMyBhcHBsaWVkLgoKCkFoLCBPSy4gMy8zIGlzIGluZGVwZW5kZW50bHkgYXBwbGlj
YWJsZS4KCkkgYXBwbGllZCB0aGlzIHRvIGxpbnV4LWtidWlsZCBub3cuIFRoYW5rcy4KKEkgYWRk
ZWQgYnJhY2VzIGFyb3VuZCBLQlVJTERfSU1BR0UgdG8ga2VlcCBjb25zaXN0ZW5jeSkKCgpJIGxl
YXZlIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyB0byBQYWxtZXIuCgoKCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
