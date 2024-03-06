Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40CBC54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lFJG+jzyY18sHN4PYQGnfSCrxxI7UmGJ9AwHcFTdX0=; b=iOvBAygKC9IFfg
	eQ9az7tmnVbsBT8id1zj0W3BvRnusbo9PAnwTU9Ur2dw91j8AQ5mHpIExBko+SgRCeWtHjM8VqVtt
	/qHVLAb+y7jFm6eLKunDWdoxEAxp+6kCEXc6xfaG3mgBXQVItCFmfflWMz8imxnUP4Y9i69k4TvBw
	ZrJCu7mcOM+7EWj24fCo/RV5PQq8HzcrcSbmURGsZ+lEGJQdGexBbgJlDcBBRLmB/UByNbxD2WDXo
	MjJs5sLztGfMTj/0hkf7fafR1FOtyWfdwzmt5OW4KqTY5dABTYdLuccPox6LORq++e1LveDe9Md5F
	Cxz1oDcfvJFAEgrwlYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr3a-00000000Krr-00oD;
	Wed, 06 Mar 2024 13:11:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr3W-00000000KqZ-3Roi
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13C456182E
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF52DC4160E
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709730693;
	bh=56f2HhQhxeS1dJOLBZNhXaT2SUwuIV0zVPH+7uTCfMo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IUJIv8VvEfYLvwT+YDnqccZcw1yCt7fXEs+bWvMVLPgIkVdEhgbkMhBOJuGgsAQzm
	 VxJ7Lbq+OgPkntwvH05FmbHw8TKJK0dv669vqaO/SBBNd7AADf6d22fVhurg0ZmH2X
	 39o1H5UG9I9l9xSYNCAHq36Uy4W0QD1q25VyYqrGkYQg4wZPwEaZSob15o4REp73Cq
	 CtjyIZDfEGb5L7jg42VaCs6uDR6G73c1dWWejnTRRtsmg3VJHRK5/Q0P5PKOJoIfhD
	 WZAbnOuk5eexqwbMeXqzukcPjt4Amza3nqlJufXhDFemROvbdlh06F/YvTx7gjmU/M
	 y7JFSUhKp/uZQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512f892500cso5114062e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:11:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSN3Ye2QCMz1x+xu24yztzoZ8bm0937i01XGAuji6LUxasfmAyxo9L25dcSfhXg7G3hO6YDe2kqCqFGF2WY23TQflb0OTmXyVyjLtUujde
X-Gm-Message-State: AOJu0YzYxZoQrxFQJtdpQ4Cy5FidhK+o5hYQou3JBjkfur+6flzUhmc1
	LEJe4fjNy6+P0CXMvV+UVGW3KU85aNH4mYWud1T3aXNahlg3nYJgRzJjDDmPm4YIk4p+6aCahAk
	RAhKhbJ3KQDaCbWsMTM8OSWp/vJg=
X-Google-Smtp-Source: AGHT+IGwsRyIuiauoWfKtSLXpu4UtpzpI5hTliB/89gQ4tkgzBQId4Wcr1DRFw8Ntkd6cNvqo95hi/5Je9wNAgYhyCU=
X-Received: by 2002:ac2:5193:0:b0:513:5e2f:7bc9 with SMTP id
 u19-20020ac25193000000b005135e2f7bc9mr1093188lfi.9.1709730691762; Wed, 06 Mar
 2024 05:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <26f3e99c-8f57-4779-a679-2085e469d9cd@siemens.com> <CAEEQ3wnDKdhCH4yz+MY+Xks21jLnuFiyx-xxa7CFczokG2shvQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wnDKdhCH4yz+MY+Xks21jLnuFiyx-xxa7CFczokG2shvQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 14:11:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFxzFRQz0BUVw27xdOj+xAVtX9jPjwaLHsEOYDUSqXMOw@mail.gmail.com>
Message-ID: <CAMj1kXFxzFRQz0BUVw27xdOj+xAVtX9jPjwaLHsEOYDUSqXMOw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] Revert "riscv/efistub: Ensure
 GP-relative addressing is not used"
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_051134_932540_2F12796E 
X-CRM114-Status: GOOD (  12.91  )
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

T24gV2VkLCA2IE1hciAyMDI0IGF0IDE0OjA4LCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW4sCj4KPiBPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDg6
NTLigK9QTSBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiAwNi4wMy4yNCAwOTo1NiwgWXVuaHVpIEN1aSB3cm90ZToKPiA+ID4gVGhpcyByZXZlcnRz
IGNvbW1pdCBhZmIyYTRmYjg0NTU1ZWY5ZTYxMDYxZjZlYTYzZWQ3MDg3YjI5NWQ1Lgo+ID4gPgo+
ID4KPiA+IFRoaXMgY29tZXMgd2l0aG91dCBhIHJlYXNvbiAtIHdoaWNoIGlzIGxpa2VseSBzb21l
dGhpbmcgYXJvdW5kICJ3aWxsIGZpeAo+ID4gdGhpcyBwcm9wZXJseSBsYXRlciIuIEJ1dCB0aGVu
IHlvdSByZWdyZXNzIGZpcnN0IGFuZCBvbmx5IGZpeAo+ID4gYWZ0ZXJ3YXJkcy4gQ2FuJ3QgdGhh
dCBiZSBkb25lIHRoZSBvdGhlciB3YXkgYXJvdW5kPwo+Cj4gU29ycnksIEkgZG9uJ3QgcXVpdGUg
dW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLiBDYW4geW91IGhlbHAgZXhwbGFpbiBpdAo+IG1vcmUg
Y2xlYXJseT8gRG8geW91IG1lYW4gImRlbGV0ZSBtbm8tcmVsYXggaW5zdGVhZCBvZiByZXZlcnQK
PiBkaXJlY3RseT8iCj4KCllvdSBzaG91bGQgb3JkZXIgeW91ciBwYXRjaGVzIGluIGEgd2F5IHRo
YXQgZG9lcyBub3QgY3JlYXRlCmludGVybWVkaWF0ZSBzdGF0ZXMgKGJldHdlZW4gMS0yIG9yIGJl
dHdlZW4gMi0zKSB3aGVyZSB0aGUgb3JpZ2luYWwKcHJvYmxlbSBpcyBiZWluZyByZWNyZWF0ZWQu
CgpTbyBpbiB0aGlzIGNhc2UsIHlvdSBzaG91bGQKYSkgZml4IHRoZSBpc3N1ZQpiKSByZXZlcnQg
dGhlIGV4aXN0aW5nIHBhdGNoZXMgaW4gKm9wcG9zaXRlKiBvcmRlcgoKSG93ZXZlciwgSSBkb24n
dCB0aGluayB0aGUgRUZJIHN0dWIgY2FuIHVzZSBHUCAtIHBsZWFzZSByZWZlciB0byBteSBvdGhl
ciByZXBseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
