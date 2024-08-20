Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6118CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 03:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4xdZMhkYOMiDMlQsq8G9p9shCPwR5qy7A6AUT8BmAw=; b=INCRPH6BJb7WoK
	uqbGjxzRMHAUzFfiOaVXYjRF8l1duSlliqRwBcLWsWbxwGEg/hVqcZQF2wDz6tEM+EZmgsutmw8wd
	4O3FTHwfDkXJyTZ1H1PIdx2ksqvjYux+kuGMKJF47IBZNYNDb/NOD3pFY+irBrIuIAlzqYxj8lfex
	41Q90AHa8cdJbmNIEBcu0vBXibh3wxAy/NNqa6xdQlskvySLcrNFRToXU3Ov+lEtai67iguGBexsw
	Fh5Cp3x5xXsne6s6rEd/ovNNrrDdeUok1lsjsMIDtU1/XNUE/axAf8hCLgJV4Yqq2BT99wbkzkEs0
	r9oFi0SH/7jD4M5e5DMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgFzZ-00000003iGh-0rgg;
	Tue, 20 Aug 2024 03:57:09 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgFzW-00000003iFz-2xSd
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 03:57:07 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-690aabe2600so42195477b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 20:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724126225; x=1724731025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BlLp8ySwbtC/N1/BK5qckNa0L23by1DV5/7Cbxmm6A=;
        b=F52CktX7IGGSyPKYCRqyTku3cz+17HicGZ+Ob5tb3pxA5LbLL/uhOPRCcGViUlDnrA
         ExG4TdLYkOIompmLGeGnm2PCPgEE7PTbHDThhljuT/CQpiIpTtuvp4uRcWS96WmHOr3t
         HvE3w34CO7CdYlKud1FgJh72XjNSra+m+qtdL0Pufk6UDCc1WpkmgMjE8kbzuIGcE4VK
         73NKih4wgzvbn7crXCTqgCUyR5ec90ZpYlgelnlF+pgAjUkN++Wvil/Uwqi/lWTpt563
         X36BirLlFCmZR+etOdcHOobPPQnlzpj2tcsb2B1qYuRuQndCjvZA6gjqgaLM1mvlS0IQ
         n9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724126225; x=1724731025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BlLp8ySwbtC/N1/BK5qckNa0L23by1DV5/7Cbxmm6A=;
        b=UbdAGLVReT794GeS1M6U6CUhZWhCCqn3ETgKnKna13BkWQeQ2rbWJeU3opfzAcgpZW
         dt6EfjYqcjupnyM9bM5yxLauAWiTQqQDcUCW0mSs8wxWGQwhgwyQZX9mHq4tnBFKCFRf
         jQoLiBRahJejHpzbKnCucjMFe3Wwq5nqp8UEr5tsHcV7k1XeA+/gMcAZEpoJyjnonxkc
         c3owFRXBghM+qGqo7qDWbZkDS3ZvVYGIFkSr4OxihgPOyD4ThLm+8waOjrR1OWmOJPd5
         Rl6po79kDkMdVsFSd5UuwvpzwqOnOlaH4U2uBA2pfjUCPU0OCWLqkcOYw68ptii+SZhL
         8o8g==
X-Forwarded-Encrypted: i=1; AJvYcCUjPuNSYU0hf3QlMTOnwcJa+YY6fq+CFY7mvNHlA2qtyE7fmKU8iQ2Jub6jJ3u4W0okuBvVuemhBRC58g==@lists.infradead.org
X-Gm-Message-State: AOJu0YylTyP0kYhqzAcrYBtPMg9aXzS/OLwBJLkj9PYUF3TtEESEUBIt
	WWZEYn+A3eXUYRFKG+lJSEPtBXOvsb9IoFVqPi2LDpmwSEw9mkUCN44pr93WaB8UrC2ui/JlZHV
	1GxEC8qYANpUV/SF+3aFs/HeRAb1NepJyQo9MNg==
X-Google-Smtp-Source: AGHT+IEExajBlY/glKVOjfMsdYuk7N3HbpX3+R5vKAaBwb3zlj3A/SivuRq1ZnpX/obDae5kv/3Zih28gc1+g+bhAz0=
X-Received: by 2002:a05:6902:2808:b0:e13:cd13:25b7 with SMTP id
 3f1490d57ef6-e13cd132a8emr11947868276.46.1724126224896; Mon, 19 Aug 2024
 20:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240711111508.1373322-1-ruanjinjie@huawei.com> <2ee770cc-b5dc-1837-aa65-6b2519e03d70@huawei.com>
In-Reply-To: <2ee770cc-b5dc-1837-aa65-6b2519e03d70@huawei.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 20 Aug 2024 11:56:53 +0800
Message-ID: <CABgGipXpYzivDF5zyLL+2JSEE6q=SH6X2DKAERbf2WWaVAenCA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove unused _TIF_WORK_MASK
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	samitolvanen@google.com, debug@rivosinc.com, guoren@kernel.org, 
	songshuaishuai@tinylab.org, bjorn@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_205706_778144_68142F8F 
X-CRM114-Status: GOOD (  12.33  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTA6NDLigK9BTSBKaW5qaWUgUnVhbiA8cnVhbmppbmpp
ZUBodWF3ZWkuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDI0LzcvMTEgMTk6MTUsIEppbmppZSBS
dWFuIHdyb3RlOgo+ID4gU2luY2UgY29tbWl0IGYwYmRkZjUwNTg2ZCAoInJpc2N2OiBlbnRyeTog
Q29udmVydCB0byBnZW5lcmljIGVudHJ5IiksCj4gPiBfVElGX1dPUktfTUFTSyBpcyBubyBsb25n
ZXIgdXNlZCwgc28gcmVtb3ZlIGl0Lgo+ID4KPiA+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNj
djogZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
aW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hp
dSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oIHwgNCAtLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFk
X2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAo+ID4gaW5kZXgg
NWQ0NzMzNDM2MzRiLi4wZWVhZDZiN2I3OTAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGhyZWFkX2luZm8uaAo+ID4gQEAgLTExMSw4ICsxMTEsNCBAQCBpbnQgYXJjaF9kdXBfdGFza19z
dHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsK
PiA+ICAjZGVmaW5lIF9USUZfVVBST0JFICAgICAgICAgICgxIDw8IFRJRl9VUFJPQkUpCj4gPiAg
I2RlZmluZSBfVElGX1JJU0NWX1ZfREVGRVJfUkVTVE9SRSAgICgxIDw8IFRJRl9SSVNDVl9WX0RF
RkVSX1JFU1RPUkUpCj4gPgo+ID4gLSNkZWZpbmUgX1RJRl9XT1JLX01BU0sgXAo+ID4gLSAgICAg
KF9USUZfTk9USUZZX1JFU1VNRSB8IF9USUZfU0lHUEVORElORyB8IF9USUZfTkVFRF9SRVNDSEVE
IHwgXAo+ID4gLSAgICAgIF9USUZfTk9USUZZX1NJR05BTCB8IF9USUZfVVBST0JFKQo+ID4gLQo+
Cj4gUGluZy4KPgo+ID4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RIUkVBRF9JTkZPX0ggKi8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
