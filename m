Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83821C6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 08:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4202B61283
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 08:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4202B61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B+Pb06SwSoUOAMXEiimKkcO2z2PDtEo9Ti2OgOoKbQ8=; b=q3m5uGr4I9f12Xuir83r41YPov
	aqAVyp16DyIC3jhpXBZ4EhF9taukXytG5YCxZFIMN3gwp6Yk/p8E6X+zqeOXBr/TF0/egbiq0BjCc
	XPK4A0yPre5eFpLpA9iVxyyTv5m5yCivhMIkn9xXWjcb6eisTIhZ5xZF0RRLjYcuwc8g6UWCGHpbj
	z5tLT5PnGCEJFDWOAMxRZE4utYv2nNdWdFTF3Mblf+CxIoTPSDX9s/a7KSQAA6fA3q1f4lGSjEXuo
	hX+cFi6A1FxaDPWCGNJAA4ozI0nT9VNcW1bCgKTUsrYMTBgvOX316NH+4Z2qiGjH7CFmtKoh7jgyJ
	bb7fhX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Tzr-000gJf-FL; Thu, 22 Jul 2021 08:23:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Tzo-000gI8-2o
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 08:23:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso3219350pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 22 Jul 2021 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ZRZd7mnuBLNO3WOYOopO7fTCuLmQea3GsZq8O27f1yg=;
 b=FaBRnXeyP1aZ1Te+qsO7wId61Lc9u+HDaIR42QK4du+/7ex2R0vL6/yUf7CGH8jx4m
 fDQYGfSxsyWc0xujP4D/B8Uc5/7797HchKEMbG8OENwkzBLO4ymgNftRnO1o+4JIekJJ
 9b2BBrbkdr4ptSuQFMqQsCAZcNWoNwrzUafDsrHOCEDhCvpXcgrhOwHeolIgDCupZS8w
 2vrBtZ69ywpaYBzw44RT7allSAKmn76mz9bSaxmEGyQmWLdSHGul9aYdVt/FarA8oqdk
 wD0Z3dG7/qWZ4Xslpn3Nx7Br6t2BNU9yCO+6p+S57iXg9vYxmcPgas0AUOHZfppV3FNQ
 /SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=ZRZd7mnuBLNO3WOYOopO7fTCuLmQea3GsZq8O27f1yg=;
 b=bk9KNAdFSBF7y0eyJaJ1sYTC2UIA+Td+FF56QhMgB8jg8uGZJP8vaoyzr07FRuO//T
 I67IQQb9y7zy3Qd6CNjNFapLjAQEDzZ1NkmdNVmCyov8//40I7PXaUz6pHCaCPKK4lz2
 Jtmuo/WWk6GkTYpQDV02UlPhporVE3h6K2Gep6xWTYy1w0GBUOTDQrT0m+p/oGUmQUc/
 pqysTsSunWo3B85tdAnWaN/ZE0mRS84wUqvpN3htHk9BVm+2kHCFaQJLWf1tu/k/7wwl
 jUwnZSKBzPQlfiSGK3kejsFnTseiOlH6s95qmRJ8VjJ5wpQOgLweJLDtfj/qsnVS3haf
 CuSg==
X-Gm-Message-State: AOAM531MjiYwtDka50NF/utSnuFSsEDYs2i/1THqjeOyXC6oTozoIne2
 srWIo+aaioLRfVKAiGkcZKM=
X-Google-Smtp-Source: ABdhPJy3M/5yAeMPHob8Odfo9KWpA/ikvzAOOXqVO/VsCQHQQl+x3s5N6osPm/7cF70tbXSJiX+GIg==
X-Received: by 2002:a17:902:e882:b029:12b:1a47:1687 with SMTP id
 w2-20020a170902e882b029012b1a471687mr31443031plg.2.1626942234561; 
 Thu, 22 Jul 2021 01:23:54 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
 by smtp.gmail.com with ESMTPSA id y2sm12017759pfe.146.2021.07.22.01.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:23:53 -0700 (PDT)
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>
References: <20210719205247.1023289-1-twd2.me@gmail.com>
 <CAKwvOdmNji0AbYUiOSfb5cLD+g7YCpXk4oDupa8gTfgzYmxvBg@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
Message-ID: <8a21bac5-2445-2d4f-3639-8660285a626b@gmail.com>
Date: Thu, 22 Jul 2021 16:23:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmNji0AbYUiOSfb5cLD+g7YCpXk4oDupa8gTfgzYmxvBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_012356_180058_BEEC6C99 
X-CRM114-Status: GOOD (  15.89  )
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

VGhhbmtzIGZvciB5b3VyIGFkdmljZS7CoCBBZnRlciBzb21lIGludmVzdGlnYXRpb25zLCBJIGZp
bmQgbWluaW1hbCBjb2RlCnRoYXQgY2FuIHJlcHJvZHVjZSB0aGUgaXNzdWUgSSBoYXZlIGhhZC7C
oCBUaGUgYnVnIGlzIGZpbGVkIGF0Cmh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9NTExNjEuCgoKVGhhbmtzLgpXZW5kZQoKCk9uIDIwMjEvNy8yMCA1OjE0LCBOaWNrIERlc2F1
bG5pZXJzIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0IDE6NTMgUE0gV2VuZGUgVGFu
IDx0d2QyLm1lQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFBhc3MgYC1tYXR0cmAgdG8gYGxsZGAgc28g
dGhhdCBpdCBjYW4gZ2VuZXJhdGUgcHJvcGVyIG1hY2hpbmUgY29kZS4KPj4gQnkgdGhlIHdheSwg
aXQgc2VlbXMgdGhhdCBgLW1hcmNoYCBkb2VzIG5vdCB3b3JrIHdlbGwgbm93Lgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXZW5kZSBUYW4gPHR3ZDIubWVAZ21haWwuY29tPgo+PiAtLS0KPj4gIGFyY2gv
cmlzY3YvTWFrZWZpbGUgfCA3ICsrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2
L01ha2VmaWxlCj4+IGluZGV4IGJjNzRhZmRiZjMxZS4uYmJjMTg2YTNhYjQ1IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4g
QEAgLTUyLDkgKzUyLDE2IEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX0FSQ0hfUlYzMkkpICAgICA6
PSBydjMyaW1hCj4+ICByaXNjdi1tYXJjaC0kKENPTkZJR19BUkNIX1JWNjRJKSAgICAgICA6PSBy
djY0aW1hCj4+ICByaXNjdi1tYXJjaC0kKENPTkZJR19GUFUpICAgICAgICAgICAgICA6PSAkKHJp
c2N2LW1hcmNoLXkpZmQKPj4gIHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKSAgICAg
IDo9ICQocmlzY3YtbWFyY2gteSljCj4+ICtyaXNjdi1tYXR0ci15ICAgICAgICAgICAgICAgICAg
ICAgICAgICA6PSArbSwrYQo+PiArcmlzY3YtbWF0dHItJChDT05GSUdfRlBVKSAgICAgICAgICAg
ICAgOj0gJChyaXNjdi1tYXR0ci15KSwrZiwrZAo+PiArcmlzY3YtbWF0dHItJChDT05GSUdfUklT
Q1ZfSVNBX0MpICAgICAgOj0gJChyaXNjdi1tYXR0ci15KSwrYwo+PiAgS0JVSUxEX0NGTEFHUyAr
PSAtbWFyY2g9JChzdWJzdCBmZCwsJChyaXNjdi1tYXJjaC15KSkKPj4gIEtCVUlMRF9BRkxBR1Mg
Kz0gLW1hcmNoPSQocmlzY3YtbWFyY2gteSkKPj4KPj4gK2lmZXEgKCQoQ09ORklHX0xEX0lTX0xM
RCkseSkKPj4gKyAgICAgICBLQlVJTERfTERGTEFHUyArPSAtbWxsdm0gLW1hdHRyPSQocmlzY3Yt
bWF0dHIteSkKPiBXZSBzaG91bGQgcHJldmVudCB0aGUgcHJvbGlmZXJhdGlvbiBvZiB0aGUgY29t
cGlsZXIgaW50ZXJuYWwgYC1tbGx2bWAKPiBmbGFncyBmcm9tIEtidWlsZCBNYWtlZmlsZXM7IHRo
ZXNlIGFyZSBpbmRpY2F0aXZlIG9mIExMVk0gSVIgc3BlY2lmaWMKPiBpc3N1ZXMgd2l0aCByZWdh
cmRzIHRvIExUTy4gIENhbiB5b3UgcGxlYXNlIGZpbGUgYSBidWcgYWdhaW5zdCBMTFZNCj4gdGhh
dCBgLW1hdHRyYCBzaG91bGQgYmUgZW5jb2RlZCBpbiB0aGUgSVIgZm9yIExUTydzIHNha2U/Cj4K
PiBTZWUgYWxzbzoKPiBjb21taXQgMDIzNjUyNmQ3NmI4ICgiTWFrZWZpbGU6IGx0bzogUGFzcyAt
d2Fybi1zdGFjay1zaXplIG9ubHkgb24gTExECj4gPCAxMy4wLjAiKQo+IGNvbW1pdCAyMzk4Y2U4
MDE1MmEgKCJ4ODYsIGx0bzogUGFzcyAtc3RhY2stYWxpZ25tZW50IG9ubHkgb24gTExEIDwgMTMu
MC4wIikKPgo+PiArZW5kaWYKPj4gKwo+PiAgS0JVSUxEX0NGTEFHUyArPSAtbW5vLXNhdmUtcmVz
dG9yZQo+PiAgS0JVSUxEX0NGTEFHUyArPSAtRENPTkZJR19QQUdFX09GRlNFVD0kKENPTkZJR19Q
QUdFX09GRlNFVCkKPj4KPj4gLS0KPgo+IC0tCj4gVGhhbmtzLAo+IH5OaWNrIERlc2F1bG5pZXJz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
