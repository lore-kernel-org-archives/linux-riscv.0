Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52EEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XpXsa5Rg3qr5V9OhLtZd5z+mgrxdTSQAWcQh8zWdBQQ=; b=gcaVZnUsW1kdZVZpUKZOCVJqap
	ytJ1VBy4Wo0r/NSygHfOi8MqxUbTuRfKzG8kFcyUVrDPDJMv1lgAu8DeTFSUvWUaGDsHlJFJSJtQI
	oormsyM8v8OAS53sbkQ74NrVe8BeFcqyDawqcIPYqHVGu0K5RczZVNdyvl34KQyS8re/SKdLmh+Nw
	OwtZ38kff8+1bBozLXIg0H7MDrrUVTOWXGi95PSc2fdSOW9tBto38SjzwR9MIc6BeODEumYojBROx
	MBAM4xqvtXrsAaV6Z0laHkEqjENhwU+AriOA2aJlk2qOfpFqqDAaq7AbutroUvt7qds1aPfS+2FAi
	A5OwznKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiaj-00CMRy-09;
	Tue, 20 Jun 2023 21:08:45 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiaf-00CMQf-1J
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 21:08:42 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1a98a7fde3fso4915816fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687295314; x=1689887314;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmQQrNKBdrthlpawxC6xSdaVyb+Lurpl8t3TyJczrHw=;
        b=eu8qAVzcVZ8viHWEn7DJKQysOyHmyN3H358TpGlWOUq5rxusTRo5WvKJvwfkIAiC7e
         y8+IjksmtlSZE+llEeSTVW1JGeFoshOOW2tRaT17CmyyZw/HhqK5fvMGi2zQYoGhxnBz
         8qr/i9D+fjBbGnjTbB/WayODTELNKjEtRust9SgKeAryQdSeLh+RqIMFBZyeUgQmi28E
         P4Gf7tpI/jEUkm8uH4sGRiTycLmKS5QTRkMBK7NCFmvnRYkK/41BvGkKyv/CBAFAc7dY
         VU7klFXImiTY9qwJChlkdax0uD5zErezTXP3Ub7lCADlqhIDW3DVw8PFtZi3igb4B3sH
         kXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687295314; x=1689887314;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmQQrNKBdrthlpawxC6xSdaVyb+Lurpl8t3TyJczrHw=;
        b=CBs5LXTvwREsdjaYr4041cfsIOPGBRZBuUBGPj/L1jZzvGjw27uAEeuGp8q/9sD9Ld
         T7u6oj/vKUp5D0Tg+NCAHkJyekr52zYcQw6vG8WtgRaK/q3E0ugIdBkSasF34tZqb9S5
         Xm8GlO4x9OlsS+WywHkLxEVFGGESNKs1R9TxTuTJNKnqhHMBSczmPbAluRumwSealVrE
         ydV++cmqMEo/YhXIaWEGXmIXLG/E3ff0Rad49JIJkh7HsgP5nRDhgJZEp6g+lFf8cIZ9
         TE4iYdcryLKnzD2i4WeJnbPpUj7F6ZBSLOvwqxG9+8iAqiZ28vvgIkvU6IFYkVG/EP7z
         a/eA==
X-Gm-Message-State: AC+VfDz18rP8Zw3Aw+K9FV/ZTjgpbSp5y24hF+WCnR3jZN1G9Vaqf4G0
	+E+Fzn1DpUDu2UF90kiw4TtBsg==
X-Google-Smtp-Source: ACHHUZ4q7GAPvNl9PhSyjVJz8XZjp4tybptAmSud0iv4ZRcmwfCg4iYtk4YoFllY6NDuIZ/YAfkmsg==
X-Received: by 2002:a05:6870:2206:b0:1ad:f52:81c7 with SMTP id i6-20020a056870220600b001ad0f5281c7mr109198oaf.17.1687295314287;
        Tue, 20 Jun 2023 14:08:34 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090ad50c00b0025e2b703adesm1863846pju.41.2023.06.20.14.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 14:08:33 -0700 (PDT)
Date: Tue, 20 Jun 2023 14:08:33 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 14:07:54 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <CAKwvOdm4FLSq41WTzmPqCeNh-WBX1_rtKpT3zwyGez7bZ-jE7w@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-3ceb19b1-0af6-451e-816d-8ab5c68b5fea@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_140841_448792_85DB8803 
X-CRM114-Status: GOOD (  31.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBKdW4gMjAyMyAxMzo0NzowNyBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDo0MeKAr1BNIFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIDIwIEp1
biAyMDIzIDEzOjMyOjMyIFBEVCAoLTA3MDApLCBuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbSB3cm90
ZToKPj4gPiBPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCA0OjEz4oCvUE0gQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4gPj4KPj4gPj4gT24gVHVlLCBKdW4gMjAsIDIwMjMg
YXQgMDQ6MDU6NTVQTSAtMDQwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4gPj4gPiBPbiBN
b24sIEp1biAxOSwgMjAyMyBhdCA2OjA24oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJi
ZWx0LmNvbT4gd3JvdGU6Cj4+ID4+ID4gPiBPbiBUaHUsIDE1IEp1biAyMDIzIDA2OjU0OjMzIFBE
VCAoLTA3MDApLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4gPj4gPiA+ID4gT24gV2VkLCAxNCBK
dW4gMjAyMyAwOToyNTo0OSBQRFQgKC0wNzAwKSwganN6aGFuZ0BrZXJuZWwub3JnIHdyb3RlOgo+
PiA+PiA+ID4gPj4gT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMDc6NDk6MTdBTSAtMDcwMCwgUGFs
bWVyIERhYmJlbHQgd3JvdGU6Cj4+ID4+ID4gPiA+Pj4gT24gVHVlLCAyMyBNYXkgMjAyMyAwOTo1
NDo1OCBQRFQgKC0wNzAwKSwganN6aGFuZ0BrZXJuZWwub3JnIHdyb3RlOgo+PiA+Pgo+PiA+PiA+
ID4gPj4gQ29tbWl0IDNiOTBiMDlhZjViZSAoInJpc2N2OiBGaXggb3JwaGFuIHNlY3Rpb24gd2Fy
bmluZ3MgY2F1c2VkIGJ5Cj4+ID4+ID4gPiA+PiBrZXJuZWwvcGkiKSB0b3VjaGVzIHZtbGludXgu
bGRzLlMsIHNvIHRvIG1ha2UgdGhlIG1lcmdlIGVhc3ksIHRoaXMKPj4gPj4gPiA+ID4+IHNlcmll
cyBpcyBiYXNlZCBvbiA2LjQtcmMyLgo+PiA+PiA+ID4gPgo+PiA+PiA+ID4gPiBUaGFua3MuCj4+
ID4+ID4gPgo+PiA+PiA+ID4gU29ycnkgdG8gYmUgc28gc2xvdyBoZXJlLCBidXQgSSB0aGluayB0
aGlzIGlzIGNhdXNpbmcgTExEIHRvIGhhbmcgb24KPj4gPj4gPiA+IGFsbG1vZGNvbmZpZy4gIEkn
bSBzdGlsbCBnZXR0aW5nIHRvIHRoZSBib3R0b20gb2YgaXQsIHRoZXJlJ3MgYSBmZXcKPj4gPj4g
PiA+IG90aGVyIHRoaW5ncyBJIGhhdmUgaW4gZmxpZ2h0IHN0aWxsLgo+PiA+PiA+Cj4+ID4+ID4g
Q29uZmlybWVkIHdpdGggdjMgb24gbWFpbmxpbmUgKGxpbnV4LW5leHQgaXMgcHJldHR5IHJlZCBh
dCB0aGUgbW9tZW50KS4KPj4gPj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di8yMDIzMDUxNzA4MjkzNi4zNzU2My0xLWZhbGNvbkB0aW55bGFiLm9yZy8KPj4gPj4KPj4gPj4g
SnVzdCBGWUkgTmljaywgdGhlcmUncyBiZWVuIHNvbWUgY29uY3VycmVudCB3b3JrIGhlcmUgZnJv
bSBkaWZmZXJlbnQKPj4gPj4gcGVvcGxlIHdvcmtpbmcgb24gdGhlIHNhbWUgdGhpbmcgJiB0aGUg
djMgeW91IGxpbmtlZCAoZnJvbSBaaGFuZ2ppbikgd2FzCj4+ID4+IHN1cGVyc2VkZWQgYnkgdGhp
cyB2MiAoZnJvbSBKaXNoZW5nKS4KPj4gPgo+PiA+IEFoISBJJ3ZlIGJlZW4gdGVzdGluZyB0aGUg
ZGVwcmVjYXRlZCBwYXRjaCBzZXQsIHNvcnJ5IEkganVzdCBsb29rZWQgb24KPj4gPiBsb3JlIGZv
ciAiZGVhZCBjb2RlIiBvbiByaXNjdi1saW51eCBhbmQgZ3JhYmJlZCB0aGUgZmlyc3QgdGhyZWFk
LAo+PiA+IHdpdGhvdXQgbm90aWNpbmcgdGhlIGRpZmZlcmVuY2UgaW4gYXV0aG9ycyBvciBuZXcg
dmVyc2lvbiBudW1iZXJzIGZvcgo+PiA+IGRpc3RpbmN0IHNlcmllcy4gb2ssIG5ldmVybWluZCBt
eSBub2lzZS4gIEknbGwgZm9sbG93IHVwIHdpdGggdGhlCj4+ID4gY29ycmVjdCBwYXRjaCBzZXQs
IHNvcnJ5IQo+Pgo+PiBZYSwgSSBoYWRuJ3QgZXZlbiBub3RpY2VkIHRoZSB2MyBiZWNhdXNlIEkg
cHJldHR5IG11Y2ggb25seSBsb29rIGF0Cj4+IHBhdGNod29yayB0aGVzZSBkYXlzLiAgTGlrZSB3
ZSB0YWxrZWQgYWJvdXQgaW4gSVJDLCBJJ20gZ29pbmcgdG8gZ28gdGVzdAo+PiB0aGUgbWVyZ2Ug
b2YgdGhpcyBvbmUgYW5kIHNlZSB3aGF0J3MgdXAgLS0gSSd2ZSBnb3QgaXQgc3RhZ2VkIGF0Cj4+
IDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wYWxtZXIv
bGludXguZ2l0L2NvbW1pdC8/aD1mb3ItbmV4dCZpZD0xYmQyOTYzYjIxNzU4YTc3MzIwNmExY2I2
N2M5M2U3YThhZThhMTk1PiwKPj4gdGhvdWdoIHRoYXQgd29uJ3QgYmUgYSBzdGFibGUgaGFzaCBp
ZiBpdCdzIGFjdHVhbGx5IGJyb2tlbi4uLgo+Cj4gT2ssIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjMwNTIzMTY1NTAyLjI1OTItMS1qc3poYW5nQGtlcm5lbC5vcmcvCj4g
YnVpbHQgZm9yIG1lLiAgSWYgeW91J3JlIHNlZWluZyBhIGhhbmcsIHBsZWFzZSBsZXQgbWUga25v
dyB3aGF0Cj4gdmVyc2lvbiBvZiBMTEQgeW91J3JlIHVzaW5nIGFuZCBJJ2xsIGJ1aWxkIHRoYXQg
dGFnIGZyb20gc291cmNlIHRvIHNlZQo+IGlmIEkgY2FuIHJlcHJvZHVjZSwgdGhlbiBiaXNlY3Qg
aWYgc28uCj4KPiAkIEFSQ0g9cmlzY3YgTExWTT0xIC91c3IvYmluL3RpbWUgLXYgbWFrZSAtajEy
OCBhbGxtb2Rjb25maWcgdm1saW51eAo+IC4uLgo+ICAgICAgICAgRWxhcHNlZCAod2FsbCBjbG9j
aykgdGltZSAoaDptbTpzcyBvciBtOnNzKTogMjozNS42OAo+IC4uLgo+Cj4gVGVzdGVkLWJ5OiBO
aWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4gIyBidWlsZAoKT0ssIGl0
IHRyaWdnZXJlZCBlbm91Z2ggb2YgYSByZWJ1aWxkIHRoYXQgaXQgbWlnaHQgdGFrZSBhIGJpdCBm
b3IgCmFueXRoaW5nIHRvIGZpbHRlciBvdXQuCgpUaGFua3MhCgo+Cj4+Cj4+ID4KPj4gPj4KPj4g
Pj4gQ2hlZXJzLAo+PiA+PiBDb25vci4KPj4gPgo+PiA+Cj4+ID4KPj4gPiAtLQo+PiA+IFRoYW5r
cywKPj4gPiB+TmljayBEZXNhdWxuaWVycwo+Cj4KPgo+IC0tIAo+IFRoYW5rcywKPiB+TmljayBE
ZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
