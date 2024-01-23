Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F11C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp+tF581JQ9F611W2ujJjoer8rBsrgahSCmVPbmmLIM=; b=yTO+ZtzNMmR8Td
	o5vymtid1iM1IUnF2iYtorXJ4sGK8DAoDClcR+oPVNlOxcIFNZixDepwtGaQaAj3QwHSJKCXcbj9K
	V0wJnU9UQ0LL9nGpwLMIam7YErnFNHFvG72jOd/pKtlrM2IST3JvR0h/9EnrUEh+SCnJz8wY4bPar
	1VTTApJD+z7CPXRDSsoPyL8+4vW66Y7SZRCD9CH9IM5mdbj3XOld9bsK30D0PQo2y//YxLj4N7+iY
	56GvBzuMcv5l+Id7mlROVVzMNgm8Jbp4TWAMu6SBInddFo1UJ22/Qa1tVgx6CN+0vaTqIL6QbSgR2
	1/byfrGS5+rhMiTfVymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSAXV-00FJyt-2p;
	Tue, 23 Jan 2024 06:45:41 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSAXS-00FJwj-0P
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:45:40 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5f254d1a6daso40339807b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705992336; x=1706597136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoTQEe2OLzexfh/hP6idvwNfJdYn+1MZAqnZalpJe8M=;
        b=NOVQ1pFhs2WxAU0STFJF8Eg7UO8MFkDTCC81+mnLINgqHDIo9CoC4h8pH0LqUka8TY
         OZ3uTfu6K2KPFcSWtBRolbpOsuRlbPgEIfw/CMCYm3lFZGq5zpQJVusoBIcyrBiaY/Kz
         fq7fnXNFxCx714C1+J61kY6U25qwcR8PrpkZyl6vM/Nq40b1rXaG5gv42dG6SccgWC8x
         KlkK7jL/crHU4kkkR4eJNPUWRX7iE8xy0GPl66t+6WWafC+uIL1O3IlK2MjcboDP+pRK
         EVschQY/zUonu5Ht/7MvJGzgGPs+n4acQriPfwahoiNMkScLHWSevgbVuaQKPZWHT2Va
         IBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705992336; x=1706597136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoTQEe2OLzexfh/hP6idvwNfJdYn+1MZAqnZalpJe8M=;
        b=nSIxSnRa2J9jTTf1LvV1nLR0c3Hmm1ZLWv+oJCgTTxAQ6YkvMWIL6QDauo1HuNNxGy
         Qvd+wESgVrEa+W2EG1gqd1/jV2N1y8bAi4YwHgTpgtULws36czTO5QPLOlrLYowHChmL
         6Jt/ivxzbNUBmNCpzVvfY4dLzgR3k8GlzUtZCjmjtcGqdbSn/+INH3PsJ14fJutVmo2A
         FXHLO2WlLw5Bb4N1gq2b8DtOR0bZXjoOc34YIF2WmcZBdo2kLdNMV/J/fl+UFAbjK0jT
         N4okBDlBJVe5iuNhY8czQPy9HyIy5I2C/OgjB5aR9Oowh1YhJWj+8skW616Pr6sBmZ0W
         FXXA==
X-Gm-Message-State: AOJu0Yxli+aQ/FsNYWChs8uXmtTLJlELH8PSFWDjZUweDcjOJSMlQHZU
	7FKIeFQR7d3Hp0KX/toyjYFpKi2J6kqHnQtMT7rhfA89/btw8FaIprb+VP+6wDOxRu90z35wr+x
	tRyTOdf7LHxIy9WA4VFcm2ov7tdPhbNSkctu5
X-Google-Smtp-Source: AGHT+IEBqXVQUIfO9mccqsYMSFKUq4apywgfGuA1NVIzT8EfPN/xT4990ujq0TPyyxp+o6U+5W7GppWF3JfUAOUZ4Rs=
X-Received: by 2002:a81:a090:0:b0:5ff:ae75:fe6f with SMTP id
 x138-20020a81a090000000b005ffae75fe6fmr3254872ywg.44.1705992336083; Mon, 22
 Jan 2024 22:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20231226214610.109282-1-surenb@google.com> <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
 <Zaw31DVa9q3JZASo@shell.armlinux.org.uk> <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
In-Reply-To: <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 22 Jan 2024 22:45:25 -0800
Message-ID: <CAJuCfpHVCLB0+G0amOk8tC=+--aX39n_ZRbKfhqhvJjdqjTVag@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when
 retrying under per-VMA lock
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
	akpm@linux-foundation.org, willy@infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, palmer@dabbelt.com, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_224538_167893_73365CD7 
X-CRM114-Status: GOOD (  27.14  )
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

T24gU3VuLCBKYW4gMjEsIDIwMjQgYXQgMTE6MzjigK9QTSBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1
cmVuYkBnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDIwLCAyMDI0IGF0IDE6MTXi
gK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90
ZToKPiA+Cj4gPiBPbiBTYXQsIEphbiAyMCwgMjAyNCBhdCAwOTowOTo0N1BNICswMDAwLCBwYXRj
aHdvcmstYm90K2xpbnV4LXJpc2N2QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+IEhlbGxvOgo+ID4g
Pgo+ID4gPiBUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
Cj4gPiA+IGJ5IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Ogo+ID4g
Pgo+ID4gPiBPbiBUdWUsIDI2IERlYyAyMDIzIDEzOjQ2OjEwIC0wODAwIHlvdSB3cm90ZToKPiA+
ID4gPiBBIHRlc3QgWzFdIGluIEFuZHJvaWQgdGVzdCBzdWl0ZSBzdGFydGVkIGZhaWxpbmcgYWZ0
ZXIgWzJdIHdhcyBtZXJnZWQuCj4gPiA+ID4gSXQgdHVybnMgb3V0IHRoYXQgYWZ0ZXIgaGFuZGxp
bmcgYSBtYWpvciBmYXVsdCB1bmRlciBwZXItVk1BIGxvY2ssIHRoZQo+ID4gPiA+IHByb2Nlc3Mg
bWFqb3IgZmF1bHQgY291bnRlciBkb2VzIG5vdCByZWdpc3RlciB0aGF0IGZhdWx0IGFzIG1ham9y
Lgo+ID4gPiA+IEJlZm9yZSBbMl0gcmVhZCBmYXVsdHMgd291bGQgYmUgZG9uZSB1bmRlciBtbWFw
X2xvY2ssIGluIHdoaWNoIGNhc2UKPiA+ID4gPiBGQVVMVF9GTEFHX1RSSUVEIGZsYWcgaXMgc2V0
IGJlZm9yZSByZXRyeWluZy4gVGhhdCBpbiB0dXJuIGNhdXNlcwo+ID4gPiA+IG1tX2FjY291bnRf
ZmF1bHQoKSB0byBhY2NvdW50IHRoZSBmYXVsdCBhcyBtYWpvciBvbmNlIHJldHJ5IGNvbXBsZXRl
cy4KPiA+ID4gPiBXaXRoIHBlci1WTUEgbG9ja3Mgd2Ugb2Z0ZW4gcmV0cnkgYmVjYXVzZSBhIGZh
dWx0IGNhbid0IGJlIGhhbmRsZWQKPiA+ID4gPiB3aXRob3V0IGxvY2tpbmcgdGhlIHdob2xlIG1t
IHVzaW5nIG1tYXBfbG9jay4gVGhlcmVmb3JlIHN1Y2ggcmV0cmllcwo+ID4gPiA+IGRvIG5vdCBz
ZXQgRkFVTFRfRkxBR19UUklFRCBmbGFnLiBUaGlzIGxvZ2ljIGRvZXMgbm90IHdvcmsgYWZ0ZXIg
WzJdCj4gPiA+ID4gYmVjYXVzZSB3ZSBjYW4gbm93IGhhbmRsZSByZWFkIG1ham9yIGZhdWx0cyB1
bmRlciBwZXItVk1BIGxvY2sgYW5kCj4gPiA+ID4gdXBvbiByZXRyeSB0aGUgZmFjdCB0aGVyZSB3
YXMgYSBtYWpvciBmYXVsdCBnZXRzIGxvc3QuIEZpeCB0aGlzIGJ5Cj4gPiA+ID4gc2V0dGluZyBG
QVVMVF9GTEFHX1RSSUVEIGFmdGVyIHJldHJ5aW5nIHVuZGVyIHBlci1WTUEgbG9jayBpZgo+ID4g
PiA+IFZNX0ZBVUxUX01BSk9SIHdhcyByZXR1cm5lZC4gSWRlYWxseSB3ZSB3b3VsZCB1c2UgYW4g
YWRkaXRpb25hbAo+ID4gPiA+IFZNX0ZBVUxUIGJpdCB0byBpbmRpY2F0ZSB0aGUgcmVhc29uIGZv
ciB0aGUgcmV0cnkgKGNvdWxkIG5vdCBoYW5kbGUKPiA+ID4gPiB1bmRlciBwZXItVk1BIGxvY2sg
dnMgb3RoZXIgcmVhc29uKSBidXQgdGhpcyBzaW1wbGVyIHNvbHV0aW9uIHNlZW1zCj4gPiA+ID4g
dG8gd29yaywgc28ga2VlcGluZyBpdCBzaW1wbGUuCj4gPiA+ID4KPiA+ID4gPiBbLi4uXQo+ID4g
Pgo+ID4gPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4gPiA+ICAgLSBbMS8xXSBh
cmNoL21tL2ZhdWx0OiBmaXggbWFqb3IgZmF1bHQgYWNjb3VudGluZyB3aGVuIHJldHJ5aW5nIHVu
ZGVyIHBlci1WTUEgbG9jawo+ID4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9j
LzQ2ZTcxNGM3MjljOAo+ID4gPgo+ID4gPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPiA+
Cj4gPiBOb3cgdGhhdCAzMi1iaXQgQVJNIGhhcyBzdXBwb3J0IGZvciB0aGUgcGVyLVZNQSBsb2Nr
LCBkb2VzIHRoYXQgYWxzbwo+ID4gbmVlZCB0byBiZSBwYXRjaGVkPwo+Cj4gWWVzLCBJIHRoaW5r
IHNvLiBJIG1pc3NlZCB0aGUgQVJNMzIgY2hhbmdlIHRoYXQgYWRkZWQgc3VwcG9ydCBmb3IKPiBw
ZXItVk1BIGxvY2tzLiBXaWxsIHBvc3QgYSBzaW1pbGFyIHBhdGNoIGZvciBpdCB0b21vcnJvdy4K
CkZpeCBmb3IgQVJNIHBvc3RlZCBhdApodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAx
MjMwNjQzMDUuMjgyOTI0NC0xLXN1cmVuYkBnb29nbGUuY29tLwoKPiBUaGFua3MsCj4gU3VyZW4u
Cj4KPiA+Cj4gPiAtLQo+ID4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51
eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gPiBGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3du
IDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
