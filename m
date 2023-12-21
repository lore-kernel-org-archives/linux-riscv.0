Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6E3C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWPM/2WFyR6g2MskuLbQpbW5waZBS+k+znvDbstZ96s=; b=v9qQAzGYUBxHQg
	feYht5lASNkef6UIYx9yoDahdS96zB5t9/6rXghFO5DrOZUCgeJuuBLXsoRmFdIzPocIThMpO8PcK
	N84M90ea63+s9iZlSKtgLMeIPNCeuRZDURzk4TmCy12R/aZvFij0GMilMQo1Af9youLWk3hbSwtuO
	BxV73QQRS+Ugj0U4BCw2Dvg/RQNDRj46m0q8g2mgETcgl+wpVSTksDynax2GmwFTS/A7PlLO8NtSt
	BDJ22GCnW0bLPK6tWFqXoQBdYK3ju3jSlxK72AeGzT/8TF19ASBSYPICZn1da6hrSMWi08DNX75bx
	RlcC6oWpkyVMjpxzTPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJYI-0036T0-0b;
	Thu, 21 Dec 2023 13:57:30 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJYF-0036SH-00
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:57:28 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5e7d306ee27so8308667b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703167045; x=1703771845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVLL5bW0YfWBSEGexgyYtg+trVF7bli3OEKILg9N7tk=;
        b=JxkwlUM77663+k+a9Fr1c58am4oJSrvpFJiANyDSVKt1hEQ6vkkXIVfRycCHl6DKny
         IhB3rI/87ddeh/io9XOWxRAxpln8VZwO77/k/+kcrl0bmGBZj2+qpyYNWZXZZkBkNYgE
         dSGsErNGmSPJot9F97WLcF8O2ghtkuvEvI7OKxlBBXo+eKCarKG9VkUDoj2gn3OaIoU4
         S5dkYRZHTl2mbEie6pjcar1bi4o2F0+Vb0zg2ZtD/gJaKqse//PpFAXu6nRz0cJgZYiT
         DSW0UXN5wxtF/HWvauAlSopq0qeJ7nxtVLkiF2oCJy8UCS+Ag0I2DrQsOx+3X+VMqtEr
         y7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167046; x=1703771846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVLL5bW0YfWBSEGexgyYtg+trVF7bli3OEKILg9N7tk=;
        b=ZxNkOYFOLLKJ+xdeQVqRLk59pQXMJvBrkD81C1CQ5CrCOHdVW94rlaiPDys36K7scd
         rhzrQqMpKr6SuyFY/OkhqxAgAA+M8227dYtqE7t3lJsC+b/i+ox5ArpdmV2YSDppdqcN
         2sQFyz6ltJ8Nc3c0+E5Y15hDYcJ+zfQQaXAHFGNtqDrnXOYEtqWamN5hjsw0lkU4xX+C
         6XNclHRXJV+sRZaw1jZXByrxk2nw6VXLXRbDUWWytVA+j0WrK+sjYG4p7b9gcBRBD1L9
         oSL6LkzneDuj0Id1YvwG7ntM35L947puNBe5LddmNQKk+5pxm+KRMqtLFQocJLVpM/+V
         kQUQ==
X-Gm-Message-State: AOJu0Yzcg93piPLeAIRG6QXMzoY2om+/pJw4qCacf6iZWQwyk6ax2hXs
	C0fOsXztyMNHsHWLZ8mGZzA/Y/tvhR1Db0zQewad5w==
X-Google-Smtp-Source: AGHT+IFZ1qcBfCLgb/cLThThc+4qRwsmiFwVndI+yAxTHyzBnGORoB5NRPxyw4AHtrKddus3UTta0WhtQOhSqN6hFts=
X-Received: by 2002:a81:52c8:0:b0:5e7:5a66:9a9 with SMTP id
 g191-20020a8152c8000000b005e75a6609a9mr1202944ywb.90.1703167045735; Thu, 21
 Dec 2023 05:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com> <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
In-Reply-To: <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Dec 2023 14:57:14 +0100
Message-ID: <CACRpkdYL8wK2vX7P7p4QvU9VV2CPjRv_aXiLqO+07MMCCKKk4Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: pinctrl: starfive: add JH8100
 pinctrl bindings
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_055727_038754_392A723D 
X-CRM114-Status: GOOD (  13.59  )
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

SGkgQWxleCwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFRodSwgRGVjIDIxLCAyMDIzIGF0
IDk6MzbigK9BTSBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToK
Cj4gQWRkIGR0LWJpbmRpbmcgZG9jdW1lbnRhdGlvbiBhbmQgaGVhZGVyIGZpbGUgZm9yIEpIODEw
MCBwaW5jdHJsCj4gZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBTb28gPHl1a2xpbi5z
b29Ac3RhcmZpdmV0ZWNoLmNvbT4KPiBSZXZpZXdlZC1ieTogTGV5IEZvb24gVGFuIDxsZXlmb29u
LnRhbkBzdGFyZml2ZXRlY2guY29tPgooLi4uKQo+ICt0aXRsZTogU3RhckZpdmUgSkg4MTAwIEFP
TiBQaW4gQ29udHJvbGxlcgoKSWYgQU9OIG1lYW5zICJhbHdheXMtb24iIHRoZW4gc3BlbGwgdGhh
dCBvdXQgaW4gdGhlIHRpdGxlLCB0aGUgd29ybGQgaGFzCnRvbyBtYW55IG9wYXF1ZSBUTEFzLgoK
dGl0bGU6IFN0YXJGaXZlIEpIODEwMCBBT04gKGFsd2F5cy1vbikgUGluIENvbnRyb2xsZXIKCigu
Li4pCj4gKyAgICAgICAgcHJvcGVydGllczoKPiArICAgICAgICAgIHBpbm11eDoKPiArICAgICAg
ICAgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgICAgICAgICBUaGUgbGlzdCBvZiBHUElPcyBh
bmQgdGhlaXIgbXV4IHNldHRpbmdzIG9yIGZ1bmN0aW9uIHNlbGVjdC4KPiArICAgICAgICAgICAg
ICBUaGUgR1BJT01VWCBhbmQgUElOTVVYIG1hY3JvcyBhcmUgdXNlZCB0byBjb25maWd1cmUgdGhl
Cj4gKyAgICAgICAgICAgICAgSS9PIG11bHRpcGxleGluZyBhbmQgZnVuY3Rpb24gc2VsZWN0aW9u
IHJlc3BlY3RpdmVseS4KPiArCj4gKyAgICAgICAgICBiaWFzLWRpc2FibGU6IHRydWUKPiArCj4g
KyAgICAgICAgICBiaWFzLXB1bGwtdXA6Cj4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4KPiAr
Cj4gKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoKPiArICAgICAgICAgICAgdHlwZTogYm9vbGVh
bgo+ICsKPiArICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoOgo+ICsgICAgICAgICAgICBlbnVtOiBb
IDIsIDQsIDgsIDEyIF0KCk1pbGxpYW1wZXJlcz8gVGhlbiBzcGVsbCB0aGF0IG91dCBpbiBhIGRl
c2NyaXB0aW9uOgoKPiArICBWb2x0YWdlIHJlZ3VsYXRvciBzdXBwbHkgdGhlIGFjdHVhbCB2b2x0
YWdlIHRvIHRoZSBHUElPIGJhbmsgd2hpbGUgdGhlIHN5c2NvbiByZWdpc3Rlcgo+ICsgIGNvbmZp
Z3VyYXRpb24gaW4gYml0IFsxOjBdIGluZGljYXRlcyB0aGUgY3VycmVudCB2b2x0YWdlIHNldHRp
bmcuCj4gKwo+ICsgICstLS0tLS0rLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gKyAgfCBC
aXQxIHwgQml0MCB8IFJlZmVyZW5jZSBWb2x0YWdlIHwKPiArICArLS0tLS0tKy0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tKwo+ICsgIHwgIDAgICB8ICAwICAgfCAgICAgMy4zIFYgICAgICAgICB8
Cj4gKyAgKy0tLS0tLSstLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiArICB8ICAxICAgfCAg
eCAgIHwgICAgIDEuOCBWICAgICAgICAgfAo+ICsgICstLS0tLS0rLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLS0tLS0rCj4gKwo+ICsgIFRvIGluY3JlYXNlIHRoZSBkZXZpY2Ugdm9sdGFnZSwgc2V0IGJp
dCBbMTowXSB0byB0aGUgbmV3IG9wZXJhdGluZyBzdGF0ZSBmaXJzdCBiZWZvcmUKPiArICByYWlz
aW5nIHRoZSBhY3R1YWwgdm9sdGFnZSB0byB0aGUgaGlnaGVyIG9wZXJhdGluZyBwb2ludC4KPiAr
Cj4gKyAgVG8gZGVjcmVhc2UgdGhlIGRldmljZSB2b2x0YWdlLCBob2xkIGJpdCBbMTowXSB0byB0
aGUgY3VycmVudCBvcGVyYXRpbmcgc3RhdGUgdW50aWwKPiArICB0aGUgYWN0dWFsIHZvbHRhZ2Ug
aGFzIHN0YWJpbGl6ZWQgYXQgdGhlIGxvd2VyIG9wZXJhdGluZyBwb2ludCBiZWZvcmUgY2hhbmdp
bmcgdGhlCj4gKyAgc2V0dGluZy4KPiArCj4gKyAgQWx0ZXJuYXRpdmVseSwgYSBkZXZpY2Ugdm9s
dGFnZSBjaGFuZ2UgY2FuIGFsd2F5cyBiZSBpbml0aWF0ZWQgYnkgZmlyc3Qgc2V0dGluZyBzeXNj
b24KPiArICByZWdpc3RlciBiaXQgWzE6MF0gPSAwLCB0aGUgc2FmZSAzLjNWIHN0YXJ0dXAgY29u
ZGl0aW9uLCBiZWZvcmUgY2hhbmdpbmcgdGhlIGRldmljZQo+ICsgIHZvbHRhZ2UuIFRoZW4gb25j
ZSB0aGUgYWN0dWFsIHZvbHRhZ2UgaXMgY2hhbmdlZCBhbmQgaGFzIHN0YWJpbGl6ZWQgYXQgdGhl
IG5ldyBvcGVyYXRpbmcKPiArICBwb2ludCwgYml0IFsxOjBdIGNhbiBiZSByZXNldCBhcyBhcHBy
b3ByaWF0ZS4KCkFjdHVhbGx5OiB3aGVyZSBpcyB0aGlzIGluZm9ybWF0aW9uIGV2ZW4gdXNlZD8K
Cj4gKyAgICAgICAgICBzbGV3LXJhdGU6Cj4gKyAgICAgICAgICAgIG1heGltdW06IDEKCk1pbGxp
c2Vjb25kcz8gV3JpdGUgdW5pdCBpbiBkZXNjcmlwdGlvbiBwbGVhc2UuCgpZb3VycywKTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
