Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E022E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 02:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A73M7WXkK06NCX9b1zJ+2kWcteH5+A9c44BnzapkQsY=; b=zVaj4I7FHjVtzi
	rg8aBBKCLGU6Mg2atDwpc0LE0MwPVNYcNugN8wg5mE1gtnEbr22e/N0AMncGGHzKaqQ+WPd0lu8mU
	NyQ/IUXeVSB0BCdA47gkJBKnu2FjTObzCBIk9jQyN7mJ2f3l/M5PiyuMUna7uE9K6WZT9d8EUXgtc
	qsGFF9jy6PthVcsRtf/VEHiLoZ3GKgWuk9znWkUKEUqbCsoAIX5vXJArt8EGj2DMy47jJRHTv3ubN
	PPJhZbD19vyDun2Xb8YOvqIT0xpTua6qoYMUxIjqzVHboNlXStVxmanlrrU+/mUfTU4/lQpEBwr9b
	djpXx+4eeHq6t06Qc89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQql-0000000HXzV-46zK;
	Sat, 11 Jan 2025 02:03:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQqj-0000000HXz9-3oqx
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 02:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6636D5C5439
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 02:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D691EC4CEE3
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736561019;
	bh=zrMqxieUAVjEnm1/l0WnttQr7ZTV7jvQ0HQxj0ou+Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VlcCw0xh2HLF7XLNSnRdRxsmUYLAkSvdEQ/g633zZyYtMwnIEhdS+TG4lKQspT5eo
	 YpiWAr4L96TEsJYUChuwc1sAHE14ZC1dGYuVapDlo3xNq5QzjASAYeDSKa/oA+nOs1
	 ycp9g1iOrOWjZHKJRpeW4z3YoAZuHBwEwG++Da79oBanCdfJhz0LxVYRnnU40j3m16
	 7Xae6R3NBO+sVktwqTe3e1P52kYJnd1v1P/gVOlwflsfophvwiQBkkV+uL18d6pxKe
	 vMwraWoZb+hPOscifMQ0rEWtgzYp7m27NVmKWCwS02MdWN7gk1eIS8P3GesOqgAO0M
	 MmXiUoKnU0XcQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54252789365so3252228e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 18:03:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhMeKXxB4VloFQqOvnyTnY81ZIkwJuXJDezYwXlclxwHfpSa7cGvJqQ+/1SNoqchbX4mwvGyYYZ3bVJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx04Iq2K41hNjwU5zfOWxK3s1/Q74gxeTdD18UUCzmMle4xvS/b
	BjOwRGtrWKMuUPHFW5hzinjgMn1drwQJi3NGrecfk3hl83p1iMUeWoGuIph1fyvcWbatOA21wLW
	naPMD7VIAbhJ7BrNXROb2hqHLYYE=
X-Google-Smtp-Source: AGHT+IHhgYYQ+eaUG/6J1vIQ2gCVQ/X8DlPgIpyb6Fr8nk6blZECzuoppcYovwX2mQzobcO9Mv4mEt0JKOOpHJAl6TQ=
X-Received: by 2002:a05:6512:1382:b0:542:2388:3f0d with SMTP id
 2adb3069b0e04-54284815c9emr3952112e87.45.1736561018515; Fri, 10 Jan 2025
 18:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
 <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com> <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
In-Reply-To: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:03:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4RTfQ5R3VsuXeZ9i0EbR0v0tYiVmGxcX2U_pjM=TtDA@mail.gmail.com>
X-Gm-Features: AbW1kva8YJXXpo1T_EG8d0P_EqdhvniTZ_sa2T7clRl8min3uMR81XFLgv7UjPs
Message-ID: <CAK7LNAR4RTfQ5R3VsuXeZ9i0EbR0v0tYiVmGxcX2U_pjM=TtDA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_180342_041049_54082510 
X-CRM114-Status: GOOD (  21.26  )
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

T24gU2F0LCBKYW4gMTEsIDIwMjUgYXQgMTA6MTPigK9BTSBNYXNhaGlybyBZYW1hZGEgPG1hc2Fo
aXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDExLCAyMDI1IGF0IDM6MzPi
gK9BTSBMaW51cyBUb3J2YWxkcwo+IDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gT24gRnJpLCAxMCBKYW4gMjAyNSBhdCAxMDoxMSwgQXJkIEJpZXNoZXV2ZWwg
PGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEkgc3VwcG9zZSB0aGlzIGlzIGEg
Y29uc2VxdWVuY2Ugb2YgODk2MmI2YjQ3NWJkZGMgKCJrYnVpbGQ6IHByaW50Cj4gPiA+IHNob3J0
IGxvZyBpbiBhZGRpdGlvbiB0byB0aGUgd2hvbGUgY29tbWFuZCB3aXRoIFY9MSIpIHdoaWNoIGlu
dHJvZHVjZWQKPiA+ID4gYW4gJChpZiApIHdoZXJlIHRoZSBlbHNlIGJyYW5jaCBpcyBzaW1wbHkg
JzonIGFuZCBzbyBpdCBhbHdheXMKPiA+ID4gc3VjY2VlZHMuCj4gPgo+ID4gSG1tLiBPZGQuIEkg
ZG9uJ3Qgc2VlIHdoeSB0aGF0IHBhcnQgb2YgdGhlIGNvbW1pdCBleGlzdHMsIGFuZCB5b3UncmUK
PiA+IHJpZ2h0LCB0aGF0IHNlZW1zIGxpa2UgYSBiYWQgaWRlYS4KPiA+Cj4gPiBBbmQgcmVtb3Zp
bmcgdGhhdCBvZGQgJChpZi4uKSBhbmQgbWFraW5nIGl0IGp1c3QgZG8KPiA+Cj4gPiAgICBjbWQg
PSBAc2V0IC1lOyAkKCQocXVpZXQpbG9nX3ByaW50KSAkKGRlbGV0ZS1vbi1pbnRlcnJ1cHQpICQo
Y21kXyQoMSkpCj4gPgo+ID4gZG9lc24ndCBzZWVtIHRvIGhhdmUgYW55IG9idmlvdXMgbmVnYXRp
dmUgZWZmZWN0cy4KPgo+IFdoZW4gY21kX2ZvbyBpcyBub3QgZGVmaW5lZCwgJChjYWxsIGlmX2No
YW5nZWQsZm9vKSB3aWxsIGZhaWwgd2l0aCB0aGlzIGNoYW5nZSwKPiBidXQgJChjYWxsIGNtZCxm
b28pIHdpbGwgc3VjY2VlZCByZWdhcmRsZXNzLgo+Cj4gSW4gTWFrZWZpbGUsIHRoZSB2YXJpYWJs
ZSBleHBhbnNpb24gd29ya3MgbGlrZSB0aGUgbGF0dGVyLgo+IFdoZW4gWCBpcyBub3QgZGVmaW5l
ZCwgJChYKSBpcyBleHBhbmRlZCB0byBhbiBlbXB0eSBzdHJpbmcgc3VjY2Vzc2Z1bGx5Lgo+IFRo
aXMgaXMgdXNlZnVsLgo+Cj4KPiA+IEknbSBwcm9iYWJseSBtaXNzaW5nIHNvbWUgb2J2aW91cyBy
ZWFzb24gd2h5IHRoYXQgJChpZi4uKSB3YXMgYWRkZWQsCj4gPiBpdCdzIGJlZW4gdGhhdCB3YXkg
Zm9yIHR3byB5ZWFycyBub3cuCj4KPiBXZSBkbyBub3QgbmVlZCB0byBndWFyZCBib3RoIGEgZGVm
aW5pdGlvbiBhbmQgaXRzIGNhbGxzaXRlLgo+Cj4gRm9yIGV4YW1wbGUsIHRoZSBjdXJyZW50IGNv
ZGUgaW4gYXJjaC9wb3dlcnBjL01ha2VmaWxlLnBvc3RsaW5rOgo+Cj4gdm1saW51eDogRk9SQ0UK
PiAgICAgICAgIEB0cnVlCj4gaWZkZWYgQ09ORklHX1BQQzY0Cj4gICAgICAgICAkKGNhbGwgY21k
LGhlYWRfY2hlY2spCj4gZW5kaWYKPiBpZmRlZiBDT05GSUdfUkVMT0NBVEFCTEUKPiAgICAgICAg
ICQoY2FsbCBpZl9jaGFuZ2VkLHJlbG9jc19jaGVjaykKPiBlbmRpZgo+IGlmZGVmIENPTkZJR19G
VU5DVElPTl9UUkFDRVIKPiBpZm5kZWYgQ09ORklHX1BQQzY0X0VMRl9BQklfVjEKPiAgICAgICAg
ICQoY2FsbCBjbWQsZnRyYWNlX2NoZWNrKQo+IGVuZGlmCj4gZW5kaWYKPgo+Cj4gLi4uIGNhbiBi
ZSBzaW1wbGlmaWVkIGludG86Cj4KPiB2bWxpbnV4OiBGT1JDRQo+ICAgICAgICAgJChjYWxsIGNt
ZCxoZWFkX2NoZWNrKQo+ICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQscmVsb2NzX2NoZWNrKQo+
ICAgICAgICAgJChjYWxsIGNtZCxmdHJhY2VfY2hlY2spCj4KCmFyY2gvcmlzY3YvTWFrZWZpbGUu
cG9zdGxpbmsgaXMgYSBiZXR0ZXIgZXhhbXBsZS4KQ09ORklHX1JFTE9DQVRBQkxFIGZvciB0aGUg
Y2FsbHNpdGUgaXMgcmVkdW5kYW50LgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
