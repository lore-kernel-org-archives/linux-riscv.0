Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF096C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsUuJipLEeOJF4HEtQY0suLA+WGjimS8myerEor5Ceg=; b=GWtV6mozLuJ8dq
	ttW1xva6ORtMSTMGIT8luEGmMDb2PgAZjoOi9dIotR7ZwgxnnEXHN3y9TG7P2r+xhcDunmp0Us7nY
	5DHvOA18UtWJm2SR3N4PtMetvPoEiemC92keAQocmp6kqYG3E61L+TSAx0EcAit2PZpUIPA4D2lOT
	nZzDdTY1YWnqDArMTlfz5VEfCkooQRbL5ix8PYdj79HCEtxHmpgvt5LZXdRi0fVeTeQX4av/U7Qe2
	jn0VZ3UiVE1+YAJXjuSofDMcwgTlfym3y1RWZj1bPH6t2Y5ODWaNBstIiENROr3yVaixy4+AwDyLc
	iO6N10hhDF0ZiCkQc2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNGQ-00E1a4-0q;
	Thu, 04 Jan 2024 12:55:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNGN-00E1ZD-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:55:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so607771e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704372950; x=1704977750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjQDiWQhmYwu06q+jnykGxK4oKv3uADualUi+Y7oThw=;
        b=PwvTh7t9//KPbfNpU4W3YvD9qAXFNCE1MJqbhL56pg4gOPbqdvjGC54LIKS2SDL+pU
         lZCWzaoq3X6COt8JYrs8tLF5MrSeiTS9PE3F006MvxyuWOSIOnjksZbGO8V/pQ4H+z3j
         lYTgIU3IfpJ9pYpTULTHaMvH0zQL2EfmrGW0D6aBJyVL9VYVqLKsVs7VTFmaW0e+iDxi
         b1gNKILjFMVD95WNXmCoqmGZw3SjKkI0YD7I8J6exHYpyIZN4lRCT1L8zrCOQaZyHO6a
         /jeoUpQgS+EBQqfyCT2aFG6f4FoBRYu9NMtcAxRfX6I0/7cMoKpmwObdgdLb/DKlh1us
         8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704372950; x=1704977750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjQDiWQhmYwu06q+jnykGxK4oKv3uADualUi+Y7oThw=;
        b=s6Sv3d0QBEyCz/elpqNmZPla0k4Zfx6EzcwlWbZ/8dmMF0m0yJKowXCmKheUZgs80m
         QalkoXo3DgjSjk9XmAHIklWaXyWmYpcwZkuXfHVYbwZrwKRy96pHEwV/9mxSfdSWmFIM
         WTW5+pER5+aM0Sh6cIpN8lhAR25Q94sq3MuiyzuMWOhxPi3QBwZLR/Mu6Wd+Z5c5bjHx
         CS41+ZSZvKZYisc/AWQW4RNIiHbx8Tj1msJXt9IQdH6vd8BJKICbGdTvHdQV4ZEP1nG9
         WoFXeJOvxx137pp6SIJBLwS0SIIzXlvLR/euuo0ieaT3hW6KWEjllcaSKWCacfYrAf0w
         tYIw==
X-Gm-Message-State: AOJu0YwM9qtNNlObzexMJ/l7sqk2dW2kZGQF7Vdd2ISbbxgihzrqIOoF
	IzOw8bHvpDetWILmUcxZhXTK8xfj8fJapkkIrD/wUyeGMGReDg==
X-Google-Smtp-Source: AGHT+IHNx4kxzc88ls5DeUmZEq3LCdQ7T5LlcjxcR56/jWxl2zztQ6IRlN2xiwuKaa1gM1Qx2n2k1SQVWMFXB48tpgc=
X-Received: by 2002:a05:6512:3b07:b0:50e:378b:5187 with SMTP id
 f7-20020a0565123b0700b0050e378b5187mr480099lfv.41.1704372950594; Thu, 04 Jan
 2024 04:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-12-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-12-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:55:40 +0100
Message-ID: <CAHVXubg35imiKb+daAaMXwkWvM06x4+JCczZAGHbb-pSuffLPg@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] riscv: mm: Preserve global TLB entries when
 switching contexts
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_045555_528559_1D9638E9 
X-CRM114-Status: GOOD (  23.85  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IElmIHRoZSBDUFUgZG9lcyBub3Qgc3VwcG9y
dCBtdWx0aXBsZSBBU0lEcywgYWxsIE1NIGNvbnRleHRzIHVzZSBBU0lEIDAuCj4gSW4gdGhpcyBj
YXNlLCBpdCBpcyBzdGlsbCBiZW5lZmljaWFsIHRvIGZsdXNoIHRoZSBUTEIgYnkgQVNJRCwgYXMg
dGhlCj4gc2luZ2xlLUFTSUQgdmFyaWFudCBvZiB0aGUgc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBw
cmVzZXJ2ZXMgVExCIGVudHJpZXMKPiBmb3IgZ2xvYmFsIChrZXJuZWwpIHBhZ2VzLgo+Cj4gVGhp
cyBvcHRpbWl6YXRpb24gaXMgcmVjb21tZW5kZWQgYnkgdGhlIFJJU0MtViBwcml2aWxlZ2VkIHNw
ZWNpZmljYXRpb246Cj4KPiAgIElmIHRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBwcm92aWRl
IEFTSURzLCBvciBzb2Z0d2FyZSBjaG9vc2VzCj4gICB0byBhbHdheXMgdXNlIEFTSUQgMCwgdGhl
biBhZnRlciBldmVyeSBzYXRwIHdyaXRlLCBzb2Z0d2FyZSBzaG91bGQKPiAgIGV4ZWN1dGUgU0ZF
TkNFLlZNQSB3aXRoIHJzMT14MC4gSW4gdGhlIGNvbW1vbiBjYXNlIHRoYXQgbm8gZ2xvYmFsCj4g
ICB0cmFuc2xhdGlvbnMgaGF2ZSBiZWVuIG1vZGlmaWVkLCByczIgc2hvdWxkIGJlIHNldCB0byBh
IHJlZ2lzdGVyCj4gICBvdGhlciB0aGFuIHgwIGJ1dCB3aGljaCBjb250YWlucyB0aGUgdmFsdWUg
emVybywgc28gdGhhdCBnbG9iYWwKPiAgIHRyYW5zbGF0aW9ucyBhcmUgbm90IGZsdXNoZWQuCj4K
PiBJdCBpcyBub3QgcG9zc2libGUgdG8gYXBwbHkgdGhpcyBvcHRpbWl6YXRpb24gd2hlbiB1c2lu
ZyB0aGUgQVNJRAo+IGFsbG9jYXRvciwgYmVjYXVzZSB0aGF0IGNvZGUgbXVzdCBmbHVzaCB0aGUg
VExCIGZvciBhbGwgQVNJRHMgYXQgb25jZQo+IHdoZW4gaW5jcmVtZW50aW5nIHRoZSB2ZXJzaW9u
IG51bWJlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgYXJjaC9y
aXNjdi9tbS9jb250ZXh0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY29udGV4dC5j
IGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiBpbmRleCA0M2E4YmMyZDVhZjQuLjNjYTliNjUz
ZGY3ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vY29udGV4dC5jCj4gQEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0aWMgdm9pZCBzZXRf
bW1fbm9hc2lkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICB7Cj4gICAgICAgICAvKiBTd2l0Y2gg
dGhlIHBhZ2UgdGFibGUgYW5kIGJsaW5kbHkgbnVrZSBlbnRpcmUgbG9jYWwgVExCICovCj4gICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NBVFAsIHZpcnRfdG9fcGZuKG1tLT5wZ2QpIHwgc2F0cF9tb2Rl
KTsKPiAtICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiArICAgICAgIGxvY2FsX2ZsdXNo
X3RsYl9hbGxfYXNpZCgwKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfbW0oc3Ry
dWN0IG1tX3N0cnVjdCAqcHJldiwKPiAtLQo+IDIuNDIuMAo+CgpZb3UgY2FuIGFkZDoKClJldmll
d2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3Ms
CgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
