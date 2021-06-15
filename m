Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C05C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1036109E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1036109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+D55A326rWAllErVru1N1QA4yqsjXBlepGfEt+bGeSY=; b=ko2xe6Un64dIXu
	KPiGqYS513V0WA4FOeBu2Q9Zm2tPVSUm6Q6sAzkqhzQqSAfUsuvxmRTIkSbTQLp8zWWEpsBOe6RMI
	2uXgoGOEnxMS80vWTKAqqooVLFbL04hK4GgtZUZ17nBh1DSd6Hh/TKx69Cwvhlhm4gMriVFOPZe3Y
	wGPfTVYQHcZMV7wpiNAPoW8DNdEx6Gh8vQ5iL2WZHkqnUNsQumYxJ9ZNWVSBLscNwpyjYBwC/mT+G
	pQPOAvc8AtVR5WWd19eoDGL8FrFAW5bwMR+X/91+LxhbWjBOPRJh+yxrKjYbsNF5O0WbWEvbDjvsM
	i6W7Qn4Xn7ktVNYfwtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltH4Q-003N6p-2R; Tue, 15 Jun 2021 21:58:06 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltE6j-002EO6-Bp
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:48:19 +0000
Received: by mail-vk1-f182.google.com with SMTP id n131so57996vke.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WGPi/wXiZjPo5w4DPHF3qlaSDaruBYsxDZl7JrnERyE=;
 b=QECM+zMhkaY7rd27adNKcRzQfvG5Y74cItBUfqP7zm91V/m1twiE5m3kdicjlxr9Q9
 qDnk0gc9CO5LIteeEWAKEZTaqq4lxjaRQuW5X+w4HKJ57BF206BXAXZPMTjQpZpndQSN
 jfjceLXnTBk+lc+sIGe0sEBKSDjHgFo+cmCzV10ANkzbr2F/QwWPzkb6fzT5mRJhEDuh
 tjIgPb9JEv9MdpIUArrk5JB8ALaWcv8NykyNpZGLobH5pC0a3M/kZL+TPpm9eSUONj3y
 XG+pSGtLkPeM9IpcfmxGXgJKxwWgQTPrNssi4ouDG2MjMO16vLtd+aFB8gx0WTaTSNpp
 eUeg==
X-Gm-Message-State: AOAM531fSi8MBxlBam6wB8eh6lpXfRguKCozY9S8DTihD5+aHywjZPl9
 0/lzJYlo9hwgLZNSrxIuuTZipwYoyF8vUGssnBo=
X-Google-Smtp-Source: ABdhPJyw49VknPdSZNzySmsqz3tuP81/+LXhX25/+RNCDBWNub6bhsIxOQ6G6dXG++0p/CUhpt03g4wh6B0nCOy678U=
X-Received: by 2002:a1f:ac45:: with SMTP id v66mr6243318vke.1.1623782896276;
 Tue, 15 Jun 2021 11:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
 <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
In-Reply-To: <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 20:48:05 +0200
Message-ID: <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_114817_473011_E9EE1B37 
X-CRM114-Status: GOOD (  30.96  )
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

SGkgTmljaywKCk9uIFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDg6MjkgUE0gTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4gzqPPhM65z4IgMjAyMS0wNi0xNSAxNjoxOSwg
R2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jOtToKPiA+IFRoaXMgZG9lcyBub3QgbWF0Y2gK
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYXN0
ZXIvc2NoZW1hcy9jaG9zZW4ueWFtbCNMNzc6Cj4gPgo+ID4gICAgICRyZWY6IHR5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQ2NC1hcnJheQo+ID4gICAgIG1heEl0ZW1zOiAyCj4gPiAgICAgZGVz
Y3JpcHRpb246Cj4gPiAgICAgICBUaGlzIHByb3BlcnR5IChjdXJyZW50bHkgdXNlZCBvbmx5IG9u
IGFybTY0KSBob2xkcyB0aGUgbWVtb3J5Cj4gPiByYW5nZSwKPiA+ICAgICAgIHRoZSBhZGRyZXNz
IGFuZCB0aGUgc2l6ZSwgb2YgdGhlIGVsZiBjb3JlIGhlYWRlciB3aGljaCBtYWlubHkKPiA+IGRl
c2NyaWJlcwo+ID4gICAgICAgdGhlIHBhbmlja2VkIGtlcm5lbFwncyBtZW1vcnkgbGF5b3V0IGFz
IFBUX0xPQUQgc2VnbWVudHMgb2YgZWxmCj4gPiBmb3JtYXQuCj4gPgo+ID4gSGVuY2UgImxpbnV4
LGVsZmNvcmVoZHIiIHNob3VsZCBiZSBhIHByb3BlcnR5IG9mIHRoZSAvY2hvc2VuIG5vZGUsCj4g
PiBpbnN0ZWFkIG9mIGEgbWVtb3J5IG5vZGUgd2l0aCBhIGNvbXBhdGlibGUgdmFsdWUgb2YgImxp
bnV4LGVsZmNvcmVoZHIiLgo+ID4KPgo+IFRoYXQncyBhIGJpbmRpbmcgZm9yIGEgcHJvcGVydHkg
b24gdGhlIC9jaG9zZW4gbm9kZSwgdGhhdCBhcyB0aGUgdGV4dAo+IHNheXMgaXQncyBkZWZpbmVk
IGZvciBhcm02NCBvbmx5IGFuZCB0aGUgY29kZSB0aGF0IGhhbmRsZWQgaXQgd2FzIGFsc28KClRo
YXQgZG9lc24ndCBtZWFuIGl0IG11c3Qgbm90IGJlIHVzZWQgb24gb3RoZXIgYXJjaGl0ZWN0dXJl
cyA7LSkKQXJtNjQgd2FzIGp1c3QgdGhlIGZpcnN0IG9uZSB0byB1c2UgaXQuLi4KCj4gb24gYXJt
NjQuIEluc3RlYWQgdGhlIHJlc2VydmVkLXJlZ2lvbiBiaW5kaW5nIEkgdXNlZCBpcyBhIHN0YW5k
YXJkCj4gYmluZGluZywgaWYgeW91IGRvbid0IGxpa2UgdGhlIG5hbWUgdXNlZCBmb3IgdGhlIGNv
bXBhdGlibGUgc3RyaW5nCj4gYmVjYXVzZSBpdCBvdmVybGFwcyB3aXRoIHRoYXQgcHJvcGVydHkg
d2UgY2FuIGNoYW5nZSBpdC4gSSB3YW50IHRvIHVzZSBhCj4gcmVzZXJ2ZWQtcmVnaW9uIGZvciB0
aGlzIGJlY2F1c2Ugd2UnbGwgaGF2ZSB0byByZXNlcnZlIGl0IGFueXdheSBzbwo+IHVzaW5nIGEg
cHJvcGVydHkgb24gL2Nob3NlbiBhbmQgdGhlbiB1c2luZyB0aGF0IHByb3BlcnR5IHRvIHJlc2Vy
dmUgdGhlCj4gcmVnaW9uIHNlZW1lZCBzdWJvcHRpbWFsLgo+Cj4gPj4gdjI6Cj4gPj4gICogVXNl
IGxpbnV4LHVzYWJsZS1tZW1vcnkgb24gL21lbW9yeSBpbnN0ZWFkIG9mIGEgbmV3IGJpbmRpbmcK
PiA+Cj4gPiBUaGlzIHBhcnQgc2VlbXMgdG8gaGF2ZSBiZWVuIHJlbW92ZWQgaW4gdjMgYW5kIGxh
dGVyPwo+ID4gTm90ZSB0aGF0ICJsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIiBzaG91bGQgYmUg
YSBwcm9wZXJ0eSBvZiB0aGUKPiA+IC9jaG9zZW4gbm9kZSwgdG9vLCBjZnIuCj4gPiBodHRwczov
L2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL2Jsb2IvbWFzdGVyL3NjaGVtYXMv
Y2hvc2VuLnlhbWwjTDg1Cj4gPgo+Cj4gTm8gc3BlY2lhbCBoYW5kbGluZyBpcyBuZWVkZWQgd2hl
biB1c2luZyBsaW51eCx1c2FibGUtbWVtb3J5IG9uIC9tZW1vcnksCj4gbGltaXRpbmcgdGhlIGF2
YWlsYWJsZSBtZW1vcnkgaXMgaGFuZGxlZCBieSBnZW5lcmljIGNvZGUgYXQKPiBkcml2ZXJzL29m
L2ZkdC5jCgpJdCB3YXMgbXkgdW5kZXJzdGFuZGluZyBib3RoIHByb3BlcnRpZXMgdW5kZXIgL2No
b3NlbiBhcmUgdGhlCnJlY29tbWVuZGVkIG1ldGhvZHMgZm9yIG5ldyBwbGF0Zm9ybXMuLi4gTGV0
J3Mgc2VlIHdoYXQgUm9iIGhhcwp0byBzYXkuLi4KCkFueXdheSwgSSBzZW50IGEgcGF0Y2ggc2Vy
aWVzIHRvIHN3aXRjaCB0byBnZW5lcmljICJsaW51eCxlbGZjb3JlaGRyIgpoYW5kbGluZwpodHRw
czovL2xvcmUua2VybmVsLm9yZy9yL2NvdmVyLjE2MjM3ODAwNTkuZ2l0LmdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlLwoKVGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
