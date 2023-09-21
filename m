Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E123E7070C
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sV3vzcxhjiTzTzMcs6WVMbCjwE8mGq7wSFV97Yw4uUo=; b=VBYGa5srpWl8XE
	4RkNnl8pW3GorWmoPTBoGNOh+oTFQ/W2YHGV3zfHNBdCCARV3ZGYo5AOMW88VlxCBC1FMLp9S8SN/
	lTONFcp33Np+8i8Kb5p5vD7d5wfCOPDOwRMmPsUyaYPlBSDnMZ4rA+LlFWssDDXxi3jsihY2ETAca
	zqJXxnYOS3U+PKOwSNZJEAQNlBbkB7MF2xeixPImU2F2+fwiWoewNWawDPpn2FUx6VFmYHT5FkAF8
	OukPiT7rfQKoYG/O35yuqopFT8aIuQ+hbjM5euzJNLiSHGs+Su3HA1eDX2WxjfMvC5mfgoArQCA9K
	lXhVDvmsR9eSv6W4G1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGu5-005ims-0L;
	Thu, 21 Sep 2023 10:27:25 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGu2-005ilt-0y
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 10:27:23 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-773b18cf900so88764585a.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695292040; x=1695896840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/X14ygd2DyigNPr5gXFYwES7vAO5XEO9/UTVxik7ixw=;
        b=E67eFy9sb53RYuBI88uNAsZXF3ke42YwKzgvu/SCQdRY7LU7L18pYwEn5QGn7AAH6d
         Pd7s5NTyxINdJqKTJxiM9RGZ8M4qceTt6hYZ8uLmw2rNmIMYe8v0LL6cvc5kyxW5dO8f
         HvsBHiXhLnS5nLAgFK8Od+uHf0cXGldZCMkHvwmSpPMLlC6aEt5cpBOzLNJDgoOhcZfV
         CcKOgytmV5JlrwGdYHV09FqAcYWNSYADnTdaucFEk3sYsabbyzN38nOze+jspBHZaWG4
         QxzUeN8j60P3qEwvDkZoCmWXVSRpmGr53kUIKJgZpoBoGbVVzS/p3Kn9sTDOY0GPXTs+
         Em6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695292040; x=1695896840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/X14ygd2DyigNPr5gXFYwES7vAO5XEO9/UTVxik7ixw=;
        b=Hp5edQMoU3v4G7Y3rj/aL6dTooZGe4/WIivFMzjKua9zhsZWEKExmxq9/ZxvP5vn7d
         k0TV5dsniJLtFAuxEa91Wvkqbz5pbCGi0FOEQbl6d3ZEgCQIwHwYWsU/AaVZyqY4foMP
         kJ0mo1wQVqJ5ssTqG6z3UFrdKoD1MIokAl/36acGurAnvmo/AU6e28RTksDVmCdPUZiv
         VoZvtpoBQORvukDMmV5IcLiNP6v7p/UJB/xr65/ZEaozViqVkIYM1uLGbKhy7bHkFpc1
         13Kz61pghaBKSYhqJxmxZiZAFG6nQxP+XtY72klfpOGcjG5z4pMIeWEpmJpWJVZLU05I
         AWDQ==
X-Gm-Message-State: AOJu0YzgcOYdhvE5YoVzfd9hqAZTViH8zABvGDBZSEq9hi+DJM8jcZSq
	7/9djwd+oiS9ecdkOIuAS4XJ/WvOqJOkrsyz1vo=
X-Google-Smtp-Source: AGHT+IHh3qmOzWnmp0zXXvht5I8zHcuB0zskAlj/FSMvRk0fQ0l9Z4ClZH0P3n7NRc86aZ//Uy1Mb2grg1yrxvD7Rvw=
X-Received: by 2002:a0c:e9c2:0:b0:659:abb2:7ebd with SMTP id
 q2-20020a0ce9c2000000b00659abb27ebdmr751432qvo.19.1695292039735; Thu, 21 Sep
 2023 03:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-financial-declared-7b4b4baae517@wendy> <CAHAQgRBmUtyz-U+1Fu9qdvyhMuSzg+o4MMbTV9duUXsoSoPqUQ@mail.gmail.com>
 <20230921-d2db829b289c937081dc8a72@fedora>
In-Reply-To: <20230921-d2db829b289c937081dc8a72@fedora>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 21 Sep 2023 18:27:09 +0800
Message-ID: <CAHAQgRDLmKJQ1sp76q4s7P4E_=nYuw199ceGCR0LYeq3331tLQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC device tree
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_032722_343220_46511259 
X-CRM114-Status: GOOD (  19.14  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IOS6jjIw
MjPlubQ55pyIMjHml6Xlkajlm5sgMTg6MTXlhpnpgZPvvJoKPgo+IE9uIFRodSwgU2VwIDIxLCAy
MDIzIGF0IDA1OjU2OjI4UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPiA+IFJlZ2FyZHMsCj4g
Pgo+ID4gdW5pY29ybngKPiA+Ci4uLi4uLgo+ID4gPiA+ICsKPiA+ID4gPiArLyB7Cj4gPiA+ID4g
KyAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyIjsKPiA+ID4gPiArICAgICAjYWRkcmVz
cy1jZWxscyA9IDwyPjsKPiA+ID4gPiArICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiA+ID4gPiAr
ICAgICBkbWEtbm9uY29oZXJlbnQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGFsaWFzZXMgewo+
ID4gPiA+ICsgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0MDsKPiA+ID4gPiArICAgICB9Owo+
ID4gPiA+ICsKPiA+ID4gPiArICAgICAvKiB0aGUgbWVtIG5vZGUgd2lsbCBiZSB1cGRhdGVkIGJ5
IFpTQkwuICovCj4gPiA+Cj4gPiA+IGh1aD8gU28gdGhlc2UgYXJlIHJhbmRvbSBudW1iZXJzIGJl
bG93PyBFaXRoZXIgcHV0IHNvbWV0aGluZyB1c2VmdWwgaGVyZQo+ID4gPiBvciBkZWxldGUgaXQg
cGxlYXNlLgo+ID4KPiA+IFRoZSBtZW1vcnkgZm9yIFNHMjA0MiBpcyBub3QgZml4ZWQsIHRoZSBi
b290bG9hZGVyIHdpbGwgZGV0ZWN0IG1lbW9yeQo+ID4gaW5zdGFsbGVkIG9uIGJvYXJkIGR1cmlu
ZyBib290aW5nIGFuZCBmaWxsIHRoZSBhY3R1YWwgYWRkcmVzcyBhbmQgc2l6ZQo+ID4gaW4gdGhl
IG1lbW9yeSBub2RlLiBUaGUgY29tbWVudCAiIC8qIHRoZSBtZW0gbm9kZSB3aWxsIGJlIHVwZGF0
ZWQgYnkKPiA+IFpTQkwuICovIiBpcyB0ZWxsaW5nIHRoaXMuCj4KPiBZZXMsIEkgcmVhZCB0aGUg
Y29tbWVudCEKPgo+ID4gV2Ugd3JpdGUgbWVtb3J5IG5vZGVzIGxpa2UgdGhpcyB0byBtYWtlIHRo
ZW0gYWN0IGp1c3QgYXMgcGxhY2Vob2xkZXJzCj4gPiBhbmQgdGhlIHZhbHVlIGlzIGJ5IGRlZmF1
bHQgd3JpdHRlbiBhcyB6ZXJvLgo+Cj4gV2h5IGtub3dpbmdseSBhZGQgc29tZXRoaW5nIHRoYXQg
aXMgd3JvbmcsIHJhdGhlciB0aGFuIG9taXR0aW5nIHRoZW0KPiBlbnRpcmVseT8KPgo+IFRoYW5r
cywKPiBDb25vci4KPgoKV2UgbGVhcm4gdGhpcyBmcm9tIGFyY2gvYXJtNjQvYm9vdC9kdHMvaGlz
aWxpY29uL2hpMzY2MC1oaWtleTk2MC5kdHMsCml0IHdyaXRlcyBEVFMgYXMgZm9sbG93aW5nOgoK
YGBgCiAgICAgICAgbWVtb3J5QDAgewogICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVt
b3J5IjsKICAgICAgICAgICAgICAgIC8qIHJld3JpdGUgdGhpcyBhdCBib290bG9hZGVyICovCiAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MCAweDAgMHgwPjsKICAgICAgICB9OwpgYGAKU28g
eW91IG1lYW4gd2UgY2FuIHRvdGFsbHkgcmVtb3ZlIHRoZSBtZW1vcnkgbm9kZXMgaW4gRFRTIGFu
ZCBtYWtlCmJvb3Rsb2FkZXIgYWRkIGl0IGJ5IGl0c2VsZj8gVGhhdCBzb3VuZHMgYSBnb29kIGlk
ZWEsIEkgd2lsbCBoYXZlIGEKdHJ5LiBJIHVzZWQgdG8gdGhpbmsgbWVtb3J5IG5vZGVzIGFyZSBt
dXN0LWhhdmUgaW4gRFRTLgoKCj4gPgo+ID4KPiA+ID4KPiA+ID4gPiArICAgICBtZW1vcnlAMCB7
Cj4gPiA+ID4gKyAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ID4gPiA+ICsg
ICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAw
MDAwMDA+Owo+ID4gPiA+ICsgICAgIH07Cj4gPiA+ID4gKwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
