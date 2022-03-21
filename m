Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gns7xWA/XGExk05ZNzs2wrh62OUz7j0jabVQ2F4UPRs=; b=4uGMVFTQoNV1fx
	JofzCvh79Sv+nmw78sv9hEt8mOVMJS64csP1piLHdycpbJf4UckCXcA97RzHD2ar4xvcTW6y3SI3e
	1Ee5SNliV1ryIKYjjaLtg4TUA6zuN2gtYGhD8Vene7sPrBBs6HsBOwmpKMR4B7FUjiT6ifrkghbJZ
	dF5JPjs7bAXt+lhp70RTeOmJgLhABNsJ5hWPtDo1Z2Mbz7lb+MBb3TIyTtOKaY2/++1sPmMOpEdY1
	Y3Mio8eHZCHUtn0H0ImHkP/ZNuGgHTLXAWldFnVSTg5k7W2u8FgNdjFivu2H24HBqzLsiIVbygK8h
	4Y/SDFEQQauvJQv2O3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW5oh-006Anw-Ut; Mon, 21 Mar 2022 00:22:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW5oV-006Akr-Ac; Mon, 21 Mar 2022 00:22:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A41BFB80EB5;
 Mon, 21 Mar 2022 00:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFEFC340F0;
 Mon, 21 Mar 2022 00:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647822140;
 bh=sl757+nQ+uoFAxIuw/aW760I9HoJj/9PyrFKOdrvNPc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FaiuqVxuSXdpGRvEpDxoM+RJxM/OiPTeOBHcmxMy4hOU34jzlt7y8hxP1G9mgEEME
 YSYT3z/urqe2Jix0G2SD5g2K8I7xvs5FfETynak3yu1xUVdnnydZ7NhSjGmZEPHOZi
 yn83ZWnN+anRqZEXdP7wNRAW5/RQUJx+++8CxsUhvAtPms7Xtrwe0fJZ3fXJQvbH9R
 UDgziGUYpQlnF2Crqt+yGJ5TAU+smY5s8nVPEorCmdBuD00ycNVS7ye4ugauhVzBrS
 ANHE8JNJsO3F1cVJ+4BqUTMXb90mjqNHqwPgSdg7IY7YT8t3GGikF6Qs7TY3xMQ8IT
 4jbU8GeAkYJuw==
Received: by mail-vk1-f169.google.com with SMTP id m84so7194363vke.1;
 Sun, 20 Mar 2022 17:22:20 -0700 (PDT)
X-Gm-Message-State: AOAM532kPREvlfXzdt+strT4C/Z5CoxvNiqEPyP5vvqgoS4pctFfZQEp
 vIeWCFewh2anYyhL3vPGVEWG6VXCFxEmzWSLkrg=
X-Google-Smtp-Source: ABdhPJwJRuOhAiysCoOvQHwSmmYd801IxVPP+erWrfdv5T2vb3ztD/y1NOJnWVmPMPDyYpcC1/3ppbBpVDzb6NrH1hM=
X-Received: by 2002:a1f:2d6:0:b0:33e:9b64:e07e with SMTP id
 205-20020a1f02d6000000b0033e9b64e07emr5719806vkc.28.1647822139345; Sun, 20
 Mar 2022 17:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220316070317.1864279-1-guoren@kernel.org>
 <20220316070317.1864279-11-guoren@kernel.org>
In-Reply-To: <20220316070317.1864279-11-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Mar 2022 08:22:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSqbS3cUNcxKGoMT2zE3ws+gH6a0EssVEutpypR5YoHCA@mail.gmail.com>
Message-ID: <CAJF2gTSqbS3cUNcxKGoMT2zE3ws+gH6a0EssVEutpypR5YoHCA@mail.gmail.com>
Subject: Re: [PATCH V8 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_172223_697234_6F9BAADD 
X-CRM114-Status: GOOD (  21.49  )
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

Rm9yIHRoaXMgcGF0Y2gsIHdlIG5lZWQgdG8gYWRkIGJlbG93IHRvIGZpeHVwIHRoZSBydjMyIGNh
bGwgcnY2NCBlbGYKc2VnbWVudCBmYXVsdC4KCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oCmIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApp
bmRleCAwNzQ5OTI0ZDllNTUuLjIxYzgwNzJkY2UxNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oCkBAIC0xOSw3ICsxOSwxMSBAQAogI2RlZmluZSBUQVNLX1VOTUFQUEVEX0JBU0UgICAg
IFBBR0VfQUxJR04oVEFTS19TSVpFIC8gMykKCiAjZGVmaW5lIFNUQUNLX1RPUCAgICAgICAgICAg
ICAgVEFTS19TSVpFCi0jZGVmaW5lIFNUQUNLX1RPUF9NQVggICAgICAgICAgU1RBQ0tfVE9QCisj
aWZkZWYgQ09ORklHXzY0QklUCisjZGVmaW5lIFNUQUNLX1RPUF9NQVggICAgICAgICAgVEFTS19T
SVpFXzY0CisjZWxzZQorI2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAgIFRBU0tfU0laRQor
I2VuZGlmCiAjZGVmaW5lIFNUQUNLX0FMSUdOICAgICAgICAgICAgMTYKCiAjaWZuZGVmIF9fQVNT
RU1CTFlfXwoKT24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMzowNCBQTSA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
Cj4gTWFrZSBUQVNLX1NJWkUgZnJvbSBjb25zdCB0byBkeW5hbWljIGRldGVjdCBUSUZfMzJCSVQg
ZmxhZwo+IGZ1bmN0aW9uLiBSZWZlciB0byBhcm02NCB0byBpbXBsZW1lbnQgREVGQVVMVF9NQVBf
V0lORE9XXzY0IGZvcgo+IGVmaS1zdHViLgo+Cj4gTGltaXQgMzItYml0IGNvbXBhdGlibGUgcHJv
Y2VzcyBpbiAwLTJHQiB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UKPiAod2hpY2ggaXMgZW5vdWdoIGZv
ciByZWFsIHNjZW5hcmlvcyksIGJlY2F1c2UgaXQgY291bGQgYXZvaWQKPiBhZGRyZXNzIHNpZ24g
ZXh0ZW5kIHByb2JsZW0gd2hlbiAzMi1iaXQgZW50ZXIgNjQtYml0IGFuZCBlYXNlCj4gc29mdHdh
cmUgZGVzaWduLgo+Cj4gVGhlIHN0YW5kYXJkIDMyLWJpdCBUQVNLX1NJWkUgaXMgMHg5ZGMwMDAw
MDpGSVhBRERSX1NUQVJULCBhbmQKPiBjb21wYXJlZCB0byBhIGNvbXBhdGlibGUgMzItYml0LCBp
dCBpbmNyZWFzZXMgNDc2TUIgZm9yIHRoZQo+IGFwcGxpY2F0aW9uJ3MgdmlydHVhbCBhZGRyZXNz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJu
ZXIgPGhlaWtvQHNudGVjaC5kZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggfCAxMyArKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRleCBl
MzU0OWU1MGRlOTUuLmFmZGM5ZWNlMmJhNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
Cj4gQEAgLTcwNSw4ICs3MDUsMTcgQEAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRwX2VzdGFibGlz
aChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgICogNjPigJM0OCBhbGwgZXF1YWwgdG8g
Yml0IDQ3LCBvciBlbHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbCBvY2N1ci4iCj4gICAq
Lwo+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gLSNkZWZpbmUgVEFTS19TSVpFICAgICAgKFBHRElS
X1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQo+IC0jZGVmaW5lIFRBU0tfU0laRV9NSU4gIChQR0RJ
Ul9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiArI2RlZmluZSBUQVNLX1NJWkVfNjQgICAo
UEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCj4gKyNkZWZpbmUgVEFTS19TSVpFX01JTiAg
KFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ICsKPiArI2lmZGVmIENPTkZJR19D
T01QQVQKPiArI2RlZmluZSBUQVNLX1NJWkVfMzIgICAoX0FDKDB4ODAwMDAwMDAsIFVMKSAtIFBB
R0VfU0laRSkKPiArI2RlZmluZSBUQVNLX1NJWkUgICAgICAodGVzdF90aHJlYWRfZmxhZyhUSUZf
MzJCSVQpID8gXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBUQVNLX1NJWkVfMzIgOiBUQVNL
X1NJWkVfNjQpCj4gKyNlbHNlCj4gKyNkZWZpbmUgVEFTS19TSVpFICAgICAgVEFTS19TSVpFXzY0
Cj4gKyNlbmRpZgo+ICsKPiAgI2Vsc2UKPiAgI2RlZmluZSBUQVNLX1NJWkUgICAgICBGSVhBRERS
X1NUQVJUCj4gICNkZWZpbmUgVEFTS19TSVpFX01JTiAgVEFTS19TSVpFCj4gLS0KPiAyLjI1LjEK
PgoKCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
