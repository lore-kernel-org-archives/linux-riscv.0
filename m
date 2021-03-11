Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2611DC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 08:42:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422C264FA3
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 08:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422C264FA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bYm4njoMXBw61Wfo3akxfAsBRXIZ9Ql7Il9EOM8C0vE=; b=SPpzxUX/LOxQwSrI88AY/9cf4
	Iiual99Czvigv/kGP0JvbPs/yyYbD0a65aBC7JYr3mHAXCWB3CCGEa1aAUgCiBSwsbE6pjX8zEk9a
	LoapQQyM3LZLWKUdDdzbXwjPsban44cierlUHvS+3jcWYNnFJ13XxL/CJjhz6+yRAR7OMA/9Mm8GR
	oLzeDDPybBMUUpqzNxvpPeKBM1TZrOXUhwRmQnwbktp1Uhlrnve9adkPDm9xj42Y6Eykju2r8Ru6R
	83blbyzStbORuUq1QXxLHpHWp/SEYUAKL+0zl6guMkD167trSUa8yFVLe1zdfgkEAZAzpTXPJPp1Z
	latmAMPQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKGtm-008gkT-PB; Thu, 11 Mar 2021 08:42:26 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKGti-008giu-MA
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 08:42:24 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKt3r-1l1ERM21QD-00LF65 for <linux-riscv@lists.infradead.org>; Thu, 11
 Mar 2021 09:42:21 +0100
Received: by mail-oi1-f181.google.com with SMTP id y131so19460403oia.8
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 00:42:19 -0800 (PST)
X-Gm-Message-State: AOAM532Xzh/F2PijJulKWfDVcicBKiUhNPci3XVOaDSt5S2AysoyaTbw
 ci78Ei9r7NH0/HHw0RLVb6FZOLIZZ3Kczio1Pvc=
X-Google-Smtp-Source: ABdhPJw0KtsLD5mW4MfRrfYgVjcEGOdTXZu9D7NdBG3jZg8HvDppDRmR8vUGXG+YVlxNPnM5Hk4ZbDjA/u/ZDR28oc4=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr5663752oie.4.1615452138884; 
 Thu, 11 Mar 2021 00:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
 <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
 <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
 <236a9788-8093-9876-a024-b0ad0d672c72@ghiti.fr>
In-Reply-To: <236a9788-8093-9876-a024-b0ad0d672c72@ghiti.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Mar 2021 09:42:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1+vSoEBqHPzj9S07B7h-Xuwvccpsh1pnn+1xJmS3UdbA@mail.gmail.com>
Message-ID: <CAK8P3a1+vSoEBqHPzj9S07B7h-Xuwvccpsh1pnn+1xJmS3UdbA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: David Hildenbrand <david@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Provags-ID: V03:K1:3ugIKKYXnMF0FWAqPJWPg1NaqEVTRRqCqxp46Dy8iieGNPB6h3u
 krNCO9FB3ZqMcmdrFFhvlBGl9EdM8ohialdhFyi2soR2jZ7srpjRJjqeCX9v9AcwaWITIHx
 UEpTWow6nEMEjLIGjLBNwpujOAlnECkX1TnXSvUtMnSLrAJKWhscQfoMwuHwYNORSBRfKOz
 CUB4kwSDAjdeh96r9LJlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lCbf+ZlN9hk=:wQtv6sPBSM1gjtyWUy8+x6
 pQg8PbclOLc9sUn0+XZ0WWVhnXQOxFKXmF8TMudUrZTE0/RT+PYOrHb5BEwshipOFh53JJWbK
 M6Zcnro79dS1qiOFtbG17p291VWa7C1U+uaMvhoq8HuoeQDTQhuOhUlk6zRBgm5yCw8tHYvUy
 GnYD49GF+Ck07lNoe6HRrZODDXrM0d0JVi/13huBWtKE/1BqZmLN6jBOB4akdBTCUJE12anAp
 /Y9FQVym+4kHhTiKaGY8RXkGBQxG19o331s6G09PE2jnDp7Pi++IvUPUKjzvl1z5nlUbtelDj
 +GA0r1nA0d2TWCj+T17KAJrC+GW7v+ms+6mcnA2zaxdt23nHI9djiOfp/dR/pSdlD9IDivXXD
 v0+pH2kfVbthBxqI3UXcRhYlv5L0/zF1eeafWtkEMzMneXFpnt9Dp6Oqc0OqCWNbl4R7yxXwJ
 fROMbdtmHArddUXXhFDv6Un5782HSm4e5VxKNeTtdONhy7jNThJkP1QT7U2DQPkhMpMOqUlfM
 LeQiuvmxsQ6QNPYSS1AQ8GCJvXB6ye73voK6hqVs1Jn297KeRYXOBBqr0RCtt6GGQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_084222_860258_8232E091 
X-CRM114-Status: GOOD (  31.66  )
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

T24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgODoxMiBQTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPiBMZSAzLzEwLzIxIMOgIDY6NDIgQU0sIEFybmQgQmVyZ21hbm4gYSDDqWNyaXQg
Ogo+ID4gT24gVGh1LCBGZWIgMjUsIDIwMjEgYXQgMTI6NTYgUE0gQWxleCBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4gPj4KPiA+PiBMZSAyLzI1LzIxIMOgIDU6MzQgQU0sIERhdmlkIEhp
bGRlbmJyYW5kIGEgw6ljcml0IDoKPiA+Pj4gICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgfCAgICAgICAgIHw+ICsKPiA+Pj4gZmZmZmZmYzAwMDAwMDAw
MCB8IC0yNTYgICAgR0IgfCBmZmZmZmZjN2ZmZmZmZmZmIHwgICAzMiBHQiB8IGthc2FuCj4gPj4+
PiArICAgZmZmZmZmY2VmZWUwMDAwMCB8IC0xOTYgICAgR0IgfCBmZmZmZmZjZWZlZmZmZmZmIHwg
ICAgMiBNQiB8IGZpeG1hcAo+ID4+Pj4gKyAgIGZmZmZmZmNlZmYwMDAwMDAgfCAtMTk2ICAgIEdC
IHwgZmZmZmZmY2VmZmZmZmZmZiB8ICAgMTYgTUIgfCBQQ0kgaW8KPiA+Pj4+ICsgICBmZmZmZmZj
ZjAwMDAwMDAwIHwgLTE5NiAgICBHQiB8IGZmZmZmZmNmZmZmZmZmZmYgfCAgICA0IEdCIHwgdm1l
bW1hcAo+ID4+Pj4gKyAgIGZmZmZmZmQwMDAwMDAwMDAgfCAtMTkyICAgIEdCIHwgZmZmZmZmZGZm
ZmZmZmZmZiB8ICAgNjQgR0IgfAo+ID4+Pj4gdm1hbGxvYy9pb3JlbWFwIHNwYWNlCj4gPj4+PiAr
ICAgZmZmZmZmZTAwMDAwMDAwMCB8IC0xMjggICAgR0IgfCBmZmZmZmZmZjdmZmZmZmZmIHwgIDEy
NiBHQiB8Cj4gPj4+PiBkaXJlY3QgbWFwcGluZyBvZiBhbGwgcGh5c2ljYWwgbWVtb3J5Cj4gPj4+
Cj4gPj4+IF4gU28geW91IGNvdWxkIG5ldmVyIGV2ZXIgaGF2ZSBtb3JlIHRoYW4gMTI2IEdCLCBj
b3JyZWN0Pwo+ID4+Pgo+ID4+PiBJIGFzc3VtZSB0aGF0J3Mgbm90aGluZyBuZXcuCj4gPj4+Cj4g
Pj4KPiA+PiBCZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGxpbWl0IHdhcyAxMjhHQiwgc28gaW4gbXkg
c2Vuc2UsIHRoZXJlIGlzIG5vdGhpbmcKPiA+PiBuZXcuIElmIGV2ZXIgd2Ugd2FudCB0byBpbmNy
ZWFzZSB0aGF0IGxpbWl0LCB3ZSdsbCBqdXN0IGhhdmUgdG8gbG93ZXIKPiA+PiBQQUdFX09GRlNF
VCwgdGhlcmUgaXMgc3RpbGwgc29tZSB1bnVzZWQgdmlydHVhbCBhZGRyZXNzZXMgYWZ0ZXIga2Fz
YW4KPiA+PiBmb3IgZXhhbXBsZS4KPiA+Cj4gPiBMaW51cyBXYWxsZWlqIGlzIGxvb2tpbmcgaW50
byBjaGFuZ2luZyB0aGUgYXJtMzIgY29kZSB0byBoYXZlIHRoZSBrZXJuZWwKPiA+IGRpcmVjdCBt
YXAgaW5zaWRlIG9mIHRoZSB2bWFsbG9jIGFyZWEsIHdoaWNoIHdvdWxkIGJlIGFub3RoZXIgcGxh
Y2UKPiA+IHRoYXQgeW91IGNvdWxkIHVzZSBoZXJlLiBJdCB3b3VsZCBiZSBuaWNlIHRvIG5vdCBo
YXZlIHRvbyBtYW55IGRpZmZlcmVudAo+ID4gd2F5cyBvZiBkb2luZyB0aGlzLCBidXQgSSdtIG5v
dCBzdXJlIGhvdyBoYXJkIGl0IHdvdWxkIGJlIHRvIHJld29yayB5b3VyCj4gPiBjb2RlLCBvciBp
ZiB0aGVyZSBhcmUgYW55IGRvd25zaWRlcyBvZiBkb2luZyB0aGlzLgo+Cj4gVGhpcyB3YXMgd2hh
dCBteSBwcmV2aW91cyB2ZXJzaW9uIGRpZDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNi83
LzI4Lgo+Cj4gVGhpcyBhcHByb2FjaCB3YXMgbm90IHdlbGNvbWVkIHZlcnkgd2VsbCBhbmQgaXQg
Zml4ZWQgb25seSB0aGUgcHJvYmxlbQo+IG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByZWxvY2F0
YWJsZSBrZXJuZWwuIFRoZSBzZWNvbmQgaXNzdWUgSSdtIHRyeWluZwo+IHRvIHJlc29sdmUgaGVy
ZSBpcyB0byBzdXBwb3J0IGJvdGggMyBhbmQgNCBsZXZlbCBwYWdlIHRhYmxlcyB1c2luZyB0aGUK
PiBzYW1lIGtlcm5lbCB3aXRob3V0IGJlaW5nIHJlbG9jYXRhYmxlICh3aGljaCB3b3VsZCBpbnRy
b2R1Y2UgcGVyZm9ybWFuY2UKPiBwZW5hbHR5KS4gSSBjYW4ndCBkbyBpdCB3aGVuIHRoZSBrZXJu
ZWwgbWFwcGluZyBpcyBpbiB0aGUgdm1hbGxvYyByZWdpb24KPiBzaW5jZSB2bWFsbG9jIHJlZ2lv
biByZWxpZXMgb24gUEFHRV9PRkZTRVQgd2hpY2ggaXMgZGlmZmVyZW50IG9uIGJvdGggMwo+IGFu
ZCA0IGxldmVsIHBhZ2UgdGFibGUgYW5kIHRoYXQgd291bGQgdGhlbiByZXF1aXJlIHRoZSBrZXJu
ZWwgdG8gYmUKPiByZWxvY2F0YWJsZS4KCk9rLCBJIHNlZS4KCkkgc3VwcG9zZSBpdCBtaWdodCB3
b3JrIGlmIHlvdSBtb3ZlZCB0aGUgZGlyZWN0LW1hcCB0byB0aGUgbG93ZXN0CmFkZHJlc3MgYW5k
IHRoZSB2bWFsbG9jIGFyZWEgKGluY29ycG9yYXRpbmcgdGhlIGtlcm5lbCBtYXBwaW5nLAptb2R1
bGVzLCBwaW8sIGFuZCBmaXhtYXAgYXQgZml4ZWQgYWRkcmVzc2VzKSB0byB0aGUgdmVyeSB0b3Ag
b2YgdGhlCmFkZHJlc3Mgc3BhY2UsIGJ1dCB5b3UgcHJvYmFibHkgYWxyZWFkeSBjb25zaWRlcmVk
IGFuZCByZWplY3RlZAp0aGF0IGZvciBvdGhlciByZWFzb25zLgoKICAgICAgICAgQXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
