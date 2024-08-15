Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F84C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 05:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv2YIulDt9a26icFlaav1Rkd6I4Dsub+vDNBpukYLTU=; b=1PSw1o2xrOjoHF
	Slg3cRnHmy8Tkyi5Y4rzgPt0u9E5yYDP1g6rmoa/xJeF35gnGyGQuKeDkRVGmq3X1+aKRmFw85ZY6
	v3OHe9BRzIvlMqzYk8rymY2V98AVsBdWWtUXKBUCYOaBV+XRpyv0AelOM/ZzRx2IzPeHFRxCuzMfg
	EI3LZUg5z70djSm0bsFwJAAMccPio8H9LBs+AYZN2yEw7coNuv1KhOuUcc42sVw2dez5KgwpCsiM7
	NUS2AAxtBya2i5avuzn5BDjWU/EUBlN0YY/XH0SkBxYpIq5O/VAM69jdoYfEwJT6AmyNwLLxFN6AA
	2P5kliAj9SUa4Ydh7Iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seSxz-000000094Mn-26Ki;
	Thu, 15 Aug 2024 05:24:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seSxw-000000094M4-12TF
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 05:24:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a80eab3945eso73105566b.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723699442; x=1724304242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKxp3UNSfUbMW/P7GF+qPbZQfJT1dV8M0arWtDTJAUs=;
        b=2HGkrZU5qY/6XychcgFv73TmBTGrhzI3AhoUAq9AZVxtGHE/srrtFyUkzouEWe4TZV
         rKlfLO9w2gDLRBvZeNq/9Hi61P91nWGFNR42W0u89kAgT+VA/ru26ZkEkwvx+1hreDgL
         JmabNB7PtNvxEXhCUp9CrpEI2XZedSJXgPbo4lFYeXJcPCEoFQuxRmPwh/CJUZwsZDop
         TjvUbBQ6DcNdEilikEetABSeBWhpXp4eO0P/KqpCVQqEp0XsTufW8h6WCehH3Z8hiQsv
         ipOf4KnEFofR2bDJK6rn+GFMbC4u6dS4yG+tMG4A8bO4+jMoLWfD0mS+h84yKkA6eOXj
         TphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723699442; x=1724304242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKxp3UNSfUbMW/P7GF+qPbZQfJT1dV8M0arWtDTJAUs=;
        b=wpDhQYjUXa0a5+VYtvPVT4IAn+fHmJAjKrb3jbYPbKZCFcOdtghT6QhRpsSmEU8co1
         tLZjSNTIg3QMuX43unXtW3OWBjpzgyBxFNMch/qFFJlTYV1uzkuLruIWy+nkD6wLC8qR
         T0tYMmUjLQWa2xhkM6CquQ1nl53xitQim5d/4i1yCsqh2m9SonT90H4ER5YaVBD6ddab
         zl8HAubxIbSIMmZZBI1Mnj6pcTBcBtivOJHVshoM5oNYKlE7stpEzJ3mmlaL0+xuMwmQ
         kw47jkkaWOTivqqPiHxVJTm7qJSQmquPFVAsKkEAEZaNNShd/6bVg1WwjpKOkGsXD/VJ
         UhPA==
X-Forwarded-Encrypted: i=1; AJvYcCVIIR379kC1o++xe23GotGpL36v19CJSBb6I9g/gZBOkyzNVxGkb73XuUVamYQA5HPy6ui3E/0CyVAUL60MaKCMBiqP6CMgC30j2/FkVmKX
X-Gm-Message-State: AOJu0YyQU10/Zx1jfJphEFgpXvVeaRiXjZzm/pUZwBQzzqEXNAA7a60/
	TpsREBAjNuCdBFWOfbafQl8NxjmHwmW/IaRSzQsxmZDFEXj8ulhdvYcenqXiV1jPIgZkevI6Yq0
	NvvDKEZe1tnX7rJBhb9iQRAH6VlLFzzo2WILejQ==
X-Google-Smtp-Source: AGHT+IHDME2M4oRRU1tPkqrKQKVieU27NVCFCstk8M6tOb4plumxgASPhmUSJGc9E9Et+SL7sPhom9XcSZZ+b5pJONk=
X-Received: by 2002:a17:906:6a17:b0:a7d:2c91:fb1b with SMTP id
 a640c23a62f3a-a83671101f1mr279976066b.68.1723699441761; Wed, 14 Aug 2024
 22:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240814192619.276794-1-alexghiti@rivosinc.com> <20240814-overexert-baffling-1abf9a80c7b0@spud>
In-Reply-To: <20240814-overexert-baffling-1abf9a80c7b0@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 15 Aug 2024 07:23:49 +0200
Message-ID: <CAHVXubhMDS5s=_VSoJ8nXKg4o9hAE-bb+1V4xuSxFvgPBUCBqQ@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] riscv: Fix out-of-bounds when accessing Andes
 per hart vendor extension array
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_222404_569010_300B0A38 
X-CRM114-Status: GOOD (  17.19  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMTI6MjbigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMDk6MjY6MTlQTSAr
MDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gVGhlIG91dC1vZi1ib3VuZHMgYWNjZXNz
IGlzIHJlcG9ydGVkIGJ5IFVCU0FOOgo+ID4KPiA+IFsgICAgMC4wMDAwMDBdIFVCU0FOOiBhcnJh
eS1pbmRleC1vdXQtb2YtYm91bmRzIGluIC4uL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRl
bnNpb25zLmM6NDE6NjYKPiA+IFsgICAgMC4wMDAwMDBdIGluZGV4IC0xIGlzIG91dCBvZiByYW5n
ZSBmb3IgdHlwZSAncmlzY3ZfaXNhdmVuZG9yaW5mbyBbMzJdJwo+ID4gWyAgICAwLjAwMDAwMF0g
Q1BVOiAwIFVJRDogMCBQSUQ6IDAgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZCA2LjExLjAtcmMy
dWJ1bnR1LWRlZmNvbmZpZyAjMgo+ID4gWyAgICAwLjAwMDAwMF0gSGFyZHdhcmUgbmFtZTogcmlz
Y3YtdmlydGlvLHFlbXUgKERUKQo+ID4gWyAgICAwLjAwMDAwMF0gQ2FsbCBUcmFjZToKPiA+IFsg
ICAgMC4wMDAwMDBdIFs8ZmZmZmZmZmY5NGUwNzhiYT5dIGR1bXBfYmFja3RyYWNlKzB4MzIvMHg0
MAo+ID4gWyAgICAwLjAwMDAwMF0gWzxmZmZmZmZmZjk1YzgzYzFhPl0gc2hvd19zdGFjaysweDM4
LzB4NDQKPiA+IFsgICAgMC4wMDAwMDBdIFs8ZmZmZmZmZmY5NWM5NDYxND5dIGR1bXBfc3RhY2tf
bHZsKzB4NzAvMHg5Ywo+ID4gWyAgICAwLjAwMDAwMF0gWzxmZmZmZmZmZjk1Yzk0NjU4Pl0gZHVt
cF9zdGFjaysweDE4LzB4MjAKPiA+IFsgICAgMC4wMDAwMDBdIFs8ZmZmZmZmZmY5NWM4YmJiMj5d
IHVic2FuX2VwaWxvZ3VlKzB4MTAvMHg0Ngo+ID4gWyAgICAwLjAwMDAwMF0gWzxmZmZmZmZmZjk1
NDg1YTgyPl0gX191YnNhbl9oYW5kbGVfb3V0X29mX2JvdW5kcysweDk0LzB4OWMKPiA+IFsgICAg
MC4wMDAwMDBdIFs8ZmZmZmZmZmY5NGUwOTQ0Mj5dIF9fcmlzY3ZfaXNhX3ZlbmRvcl9leHRlbnNp
b25fYXZhaWxhYmxlKzB4OTAvMHg5Mgo+ID4gWyAgICAwLjAwMDAwMF0gWzxmZmZmZmZmZjk0ZTA0
M2I2Pl0gcmlzY3ZfY3B1ZmVhdHVyZV9wYXRjaF9mdW5jKzB4YzQvMHgxNDgKPiA+IFsgICAgMC4w
MDAwMDBdIFs8ZmZmZmZmZmY5NGUwMzVmOD5dIF9hcHBseV9hbHRlcm5hdGl2ZXMrMHg0Mi8weDUw
Cj4gPiBbICAgIDAuMDAwMDAwXSBbPGZmZmZmZmZmOTVlMDQxOTY+XSBhcHBseV9ib290X2FsdGVy
bmF0aXZlcysweDNjLzB4MTAwCj4gPiBbICAgIDAuMDAwMDAwXSBbPGZmZmZmZmZmOTVlMDViNTI+
XSBzZXR1cF9hcmNoKzB4ODVhLzB4OGJjCj4gPiBbICAgIDAuMDAwMDAwXSBbPGZmZmZmZmZmOTVl
MDBjYTA+XSBzdGFydF9rZXJuZWwrMHhhNC8weGZiNgo+ID4KPiA+IFRoZSBkZXJlZmVyZW5jaW5n
IHVzaW5nIGNwdSBzaG91bGQgYWN0dWFsbHkgbm90IGhhcHBlbiwgc28gcmVtb3ZlIGl0Lgo+ID4K
PiA+IEZpeGVzOiAyM2M5OTZmYzJiYzEgKCJyaXNjdjogRXh0ZW5kIGNwdWZlYXR1cmUuYyB0byBk
ZXRlY3QgdmVuZG9yIGV4dGVuc2lvbnMiKQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4KPiBZb3UncmUgbWlzc2luZyBh
IGNoYW5nZWxvZyBoZXJlLCB3aGljaCBpcyBkb3VibHkgaW1wb3J0YW50IHdoZW4geW91IGRyb3AK
PiB0YWdzIHByb3ZpZGVkIHRvIHlvdSBvbiBhbiBlYXJsaWVyIHZlcnNpb24uCgpZZXMsIHlvdSdy
ZSByaWdodC4KCj4KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy5jIHwg
MiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMuYwo+ID4gaW5kZXggYjZjMWU3
YjVkMzRiLi5hODEyNmQxMTgzNDEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZW5kb3JfZXh0ZW5zaW9ucy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0
ZW5zaW9ucy5jCj4gPiBAQCAtMzgsNyArMzgsNyBAQCBib29sIF9fcmlzY3ZfaXNhX3ZlbmRvcl9l
eHRlbnNpb25fYXZhaWxhYmxlKGludCBjcHUsIHVuc2lnbmVkIGxvbmcgdmVuZG9yLCB1bnNpZwo+
ID4gICAgICAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVkVORE9SX0VYVF9BTkRFUwo+ID4gICAg
ICAgY2FzZSBBTkRFU19WRU5ET1JfSUQ6Cj4gPiAgICAgICAgICAgICAgIGJtYXAgPSAmcmlzY3Zf
aXNhX3ZlbmRvcl9leHRfbGlzdF9hbmRlcy5hbGxfaGFydHNfaXNhX2JpdG1hcDsKPiA+IC0gICAg
ICAgICAgICAgY3B1X2JtYXAgPSAmcmlzY3ZfaXNhX3ZlbmRvcl9leHRfbGlzdF9hbmRlcy5wZXJf
aGFydF9pc2FfYml0bWFwW2NwdV07Cj4gPiArICAgICAgICAgICAgIGNwdV9ibWFwID0gcmlzY3Zf
aXNhX3ZlbmRvcl9leHRfbGlzdF9hbmRlcy5wZXJfaGFydF9pc2FfYml0bWFwOwo+ID4gICAgICAg
ICAgICAgICBicmVhazsKPiA+ICAgICAgICNlbmRpZgo+ID4gICAgICAgZGVmYXVsdDoKPiA+IC0t
Cj4gPiAyLjM5LjIKPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
