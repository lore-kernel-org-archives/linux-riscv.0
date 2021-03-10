Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C2BC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 11:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8B464F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 11:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8B464F1B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHjRk/aIbA6Gh7kZYK7IhO8lYrz7iQ7mPnEiKqSEz7o=; b=DVpx5E/l6DyUkPkRI9YNV4zPn
	HJmAqqJy1z9Husy5tYuJEs02/BlGNfHne4obx9U9yejBVa/HUixlT70Ro+LJ4hYVpmYRIi+AfK/i2
	+B94Z6/uLXA4aOJYrGNuK+ekYQe2rQrlKru5mzEOgJqWX8m5jShMXyY3LKikw30yVctRgif+RMiXu
	cQgM50chF8UAusidmhtP/74aUk1iaXd25WxipheDsu2O0ZWrWMPDgyuXW3ZYvFTZAU3E8E/wa7xH/
	vZD3iepKQy7Dh70xRhwDac+yGexdL8pLqVIQsXlA0dQd/KmW2MTbaGzIgOSpCKcA+C5/dFSKfY/vj
	JJAshgaJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJxFL-006kGP-4E; Wed, 10 Mar 2021 11:43:23 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJxFG-006kF7-32
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 11:43:20 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvsyF-1ldPs51kff-00szXp for <linux-riscv@lists.infradead.org>; Wed, 10 Mar
 2021 12:43:14 +0100
Received: by mail-oi1-f180.google.com with SMTP id o22so9005337oic.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 03:43:13 -0800 (PST)
X-Gm-Message-State: AOAM533nTuHJDrgw5fPe/TcgQOR4byB8xrlfOyR+MqmuiCjoKeKGK6Qb
 xKddvO9hRnS3LNCMtPD6AbMElacmVI18hWMTfqA=
X-Google-Smtp-Source: ABdhPJxlHt0uYmch4USUhyI1PmZYpWv5SFHgA7xLm+M/LTOw8bqf4Cpyeoo3gC1uj5lb01XEoAYopnrDQGHXZzFybs8=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr2139659oie.4.1615376592865; 
 Wed, 10 Mar 2021 03:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
 <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
In-Reply-To: <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 12:42:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
Message-ID: <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Alex Ghiti <alex@ghiti.fr>
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
X-Provags-ID: V03:K1:mQzIUHAZrqzrrAFI3bHsmZOam+rrTEFmqsvt3U7nI7+bbx+aiql
 JcttZo8vJVw3ccN2xjTit3JseYKjOreqzdrimP2LgDXa/sXFamL0rtSDvI92UWSNZb5MPkV
 +jgFX6QtMFRgn6svLcAMRO5+HwUZrir6MN07yCT3thw/bdmG+JTTjJxpzwgno+51kTr5lPe
 GcTH0srkR14pGVsbegZBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7vZdfyJSMc4=:X/Ew4ENTb2qI0OrpovY7MK
 AwEOiLkmxyvlZoH/AK/MOrbHDqpZvwqunJsj2QxINqDL7cUGHdI+hHkEcOPuikmvm5gdld2M1
 YIMarMdRfzo36fdgehc2hhw0IkezFDsy/TLcpaldQMaL4p/glZWqrRLUhbwcb9l7AloVExI2h
 NGIyLvdq8ao/4BWLJfcjMp1GN/LYA1bfPY6FEM/a4Ttpxcr634l+4UZMe2A9rLNGmmvP93ZWX
 bHpZ4as6hxHWn7kJFJ4kL1at8Th/m0Bc1yyrbfbYmGx7REh3iEkxV2wM69K0JvR+5sVEXBRT0
 qgjXlmZUJTTKxzuvsgwz14ZH9lBhiAb8G0pTNng+buSGGxw9bTrWy84bIJvAQurrJQvk3qeBh
 czaMXUQIo59XCxXLxM7p5JHFcalqB+nKSQTxFIVlI68WbLGq/1sJ/bHuv7s9PaCsluNvDzGa7
 m+7dT8vRQhDmmqH9z8Ik+l4IDTHfHUXMKtGysAfWAtLaNmOx3OXxV8msus5aMowUV3Ut+XA9n
 jGhYrfMl1NdxytXBpf3A5g18+WRe4sWHwxjEeqfTOUR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_114318_781391_22A13F29 
X-CRM114-Status: GOOD (  18.70  )
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

T24gVGh1LCBGZWIgMjUsIDIwMjEgYXQgMTI6NTYgUE0gQWxleCBHaGl0aSA8YWxleEBnaGl0aS5m
cj4gd3JvdGU6Cj4KPiBMZSAyLzI1LzIxIMOgIDU6MzQgQU0sIERhdmlkIEhpbGRlbmJyYW5kIGEg
w6ljcml0IDoKPiA+ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgIHw+ICsKPiA+IGZmZmZmZmMwMDAwMDAwMDAgfCAtMjU2ICAgIEdCIHwg
ZmZmZmZmYzdmZmZmZmZmZiB8ICAgMzIgR0IgfCBrYXNhbgo+ID4+ICsgICBmZmZmZmZjZWZlZTAw
MDAwIHwgLTE5NiAgICBHQiB8IGZmZmZmZmNlZmVmZmZmZmYgfCAgICAyIE1CIHwgZml4bWFwCj4g
Pj4gKyAgIGZmZmZmZmNlZmYwMDAwMDAgfCAtMTk2ICAgIEdCIHwgZmZmZmZmY2VmZmZmZmZmZiB8
ICAgMTYgTUIgfCBQQ0kgaW8KPiA+PiArICAgZmZmZmZmY2YwMDAwMDAwMCB8IC0xOTYgICAgR0Ig
fCBmZmZmZmZjZmZmZmZmZmZmIHwgICAgNCBHQiB8IHZtZW1tYXAKPiA+PiArICAgZmZmZmZmZDAw
MDAwMDAwMCB8IC0xOTIgICAgR0IgfCBmZmZmZmZkZmZmZmZmZmZmIHwgICA2NCBHQiB8Cj4gPj4g
dm1hbGxvYy9pb3JlbWFwIHNwYWNlCj4gPj4gKyAgIGZmZmZmZmUwMDAwMDAwMDAgfCAtMTI4ICAg
IEdCIHwgZmZmZmZmZmY3ZmZmZmZmZiB8ICAxMjYgR0IgfAo+ID4+IGRpcmVjdCBtYXBwaW5nIG9m
IGFsbCBwaHlzaWNhbCBtZW1vcnkKPiA+Cj4gPiBeIFNvIHlvdSBjb3VsZCBuZXZlciBldmVyIGhh
dmUgbW9yZSB0aGFuIDEyNiBHQiwgY29ycmVjdD8KPiA+Cj4gPiBJIGFzc3VtZSB0aGF0J3Mgbm90
aGluZyBuZXcuCj4gPgo+Cj4gQmVmb3JlIHRoaXMgcGF0Y2gsIHRoZSBsaW1pdCB3YXMgMTI4R0Is
IHNvIGluIG15IHNlbnNlLCB0aGVyZSBpcyBub3RoaW5nCj4gbmV3LiBJZiBldmVyIHdlIHdhbnQg
dG8gaW5jcmVhc2UgdGhhdCBsaW1pdCwgd2UnbGwganVzdCBoYXZlIHRvIGxvd2VyCj4gUEFHRV9P
RkZTRVQsIHRoZXJlIGlzIHN0aWxsIHNvbWUgdW51c2VkIHZpcnR1YWwgYWRkcmVzc2VzIGFmdGVy
IGthc2FuCj4gZm9yIGV4YW1wbGUuCgpMaW51cyBXYWxsZWlqIGlzIGxvb2tpbmcgaW50byBjaGFu
Z2luZyB0aGUgYXJtMzIgY29kZSB0byBoYXZlIHRoZSBrZXJuZWwKZGlyZWN0IG1hcCBpbnNpZGUg
b2YgdGhlIHZtYWxsb2MgYXJlYSwgd2hpY2ggd291bGQgYmUgYW5vdGhlciBwbGFjZQp0aGF0IHlv
dSBjb3VsZCB1c2UgaGVyZS4gSXQgd291bGQgYmUgbmljZSB0byBub3QgaGF2ZSB0b28gbWFueSBk
aWZmZXJlbnQKd2F5cyBvZiBkb2luZyB0aGlzLCBidXQgSSdtIG5vdCBzdXJlIGhvdyBoYXJkIGl0
IHdvdWxkIGJlIHRvIHJld29yayB5b3VyCmNvZGUsIG9yIGlmIHRoZXJlIGFyZSBhbnkgZG93bnNp
ZGVzIG9mIGRvaW5nIHRoaXMuCgogICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
