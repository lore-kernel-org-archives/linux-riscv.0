Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F53FC71151
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 05:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsYFUvV/tGTLI/fvS+yr3hr4o9WRyCrb6F8Jq7MVj0g=; b=rODdBVFgoI4qv/
	01MVGVxGlVqU2GjClQl3qMxZnjRlwzep6YD1N7xAvocDQRxO07W0MJWKMNoHOHhffirMyok3xLNTN
	c+lQm+Z6rOfFqNB/0i8uYtx1obRwnFihF7rx7lQ700Y2JeagZ/7Nai44Rvgdt5/IaJ2fhDixIGgLu
	twvii7OkutodyJ/6czWMb+Qso3LWpte3/NP1uVWuU714x0jHJg0j8vExVOsrbhheBfJbD7wOD0z7G
	sTOnlD9mKD6WRFWtPEYqvz70lGh+FjP++zsVNu8ShjSQNWSRFLlTErrxP1LvQxnGFjakQpjsU7uva
	ZRTzINx7Ysm/yz4tyZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXY9-00000000ZYR-2l3D;
	Thu, 29 Aug 2024 05:18:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXY6-00000000ZXU-2kaV
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 05:18:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so266968e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 22:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724908700; x=1725513500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3IB0lNCEhV9enuNzk+VnTluaGKoDtr4uKJKrcnidUw=;
        b=Pw57M6cc97wAEkLE1MqD5HoCHsflWMVOBr1fvz+djgMNVxBtutKR+TjwDTLAQFPGdO
         17qWbZdKdmIoTpegTY4ZkLJ+SBNM1f+VNy4Ee5Nixovt80QcbjZOfIrxHmBk+sKDy/pY
         BmSyqu57gwDUrZ6RcERqcwwCCtFB9FIcQISGwZuy6gcdCAQiy4lvxNK412NSmB0GeEKK
         lTm5Ino8lgmQJL0Ef5nB2zf+4ykkwHNwXIektkHboWXsqZMUI2qQ2XWefm6JmWMHVX7u
         acBhFnNGq7S3Cz6czzxBt65D0WsQcsErb1UtXrayXMp2VRaLLAmVycqPLr2NpZytbdxj
         3SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724908700; x=1725513500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3IB0lNCEhV9enuNzk+VnTluaGKoDtr4uKJKrcnidUw=;
        b=IYF9AR/XDHPzvp1bDLSDD+8WKQUO5AvlibNXcLpyAvSrW5gWK6PQOv+o7iqdK2qkIL
         JuYK7rfYX96LCzuO00wPQ09tBVfVwZyi2z2E6HP009RzwLgtXfIKSj45NfS+jr6y2CAX
         G/iM3fY+GyYarnQ5wbzAXZFqxewrzp6nZHXOVtkaDjMuO4xCC9jY0h3XT3fs4tmqc358
         dS4TgfPLuoVsKNoDM1eabhAB5fU7egwoPb397nfqa22MStE6TQnc8Yl6F5JeY0S34f4T
         B5wQtgXOFArJrgJpHUJz1k/XCcNCrsZza+QG+/riQH/aIAkuWQbyT2NGvmEGJ0n1C2a1
         dBmg==
X-Forwarded-Encrypted: i=1; AJvYcCVcZezfDb62NBOvQswjxnXuKM1EIuIb9t0SP4LAN79RZ325+dj2raHi4Weyqr9zPpj7pZ758pTih+RnYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDZMkFyruN2m2xyrJAhpbZYkg/GwG7aWbVRnic2wOmh473tzmS
	sP3mYJn5T27yy3nTNf1HiUHBkP6MzHm7mamRAGPJntvaZptGdyiNRqe9NQA9Vv+RcEzooH7Y0Bv
	FW61WaKybBwmpTJJPG31gXQRHrgIFOG/e2pa1+g==
X-Google-Smtp-Source: AGHT+IF5qM5Tv33jrhTxPQuB7QcGegW/B0kYwW+2dXW1R9ibKz60sWm56wn4RINz3pCrSIub6yb7ue9n11Ee4xuIvkE=
X-Received: by 2002:a05:6512:2245:b0:52b:8ef7:bf1f with SMTP id
 2adb3069b0e04-5353e56680fmr723799e87.17.1724908699186; Wed, 28 Aug 2024
 22:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-2-nick.hu@sifive.com>
In-Reply-To: <20240829033904.477200-2-nick.hu@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 29 Aug 2024 10:48:07 +0530
Message-ID: <CAK9=C2XSrxXGB-PKKi0sLQq7L1Ovucb73Bc9tOnxwWTxux_D7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Add stimecmp save and restore
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_221822_726629_60C3128F 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgOTowOeKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBJZiB0aGUgSFcgc3VwcG9ydCB0aGUgU1NUQyBleHRlbnNpb24sIHdl
IHNob3VsZCBzYXZlIGFuZCByZXN0b3JlIHRoZQo+IHN0aW1lY21wIHJlZ2lzdGVyIHdoaWxlIGNw
dSBub24gcmV0ZW50aW9uIHN1c3BlbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNr
Lmh1QHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5o
IHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgICAgICB8IDEzICsrKysr
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdXNwZW5kLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N1c3BlbmQuaAo+IGluZGV4IDRmZmIwMjJiMDk3Zi4uZmZhYWMyZWZhYmI1IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zdXNwZW5kLmgKPiBAQCAtMTYsNiArMTYsMTAgQEAgc3RydWN0IHN1
c3BlbmRfY29udGV4dCB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGVudmNmZzsKPiAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdHZlYzsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgaWU7Cj4gKyNpZiBf
X3Jpc2N2X3hsZW4gPCA2NAo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdGltZWNtcGg7Cj4gKyNl
bmRpZgo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdGltZWNtcDsKPiAgI2lmZGVmIENPTkZJR19N
TVUKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2F0cDsKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQu
Ywo+IGluZGV4IGM4Y2VjMGNjNTgzMy4uM2FmZDg2ZTFhYmY3IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQu
Ywo+IEBAIC0xOSw2ICsxOSwxMiBAQCB2b2lkIHN1c3BlbmRfc2F2ZV9jc3JzKHN0cnVjdCBzdXNw
ZW5kX2NvbnRleHQgKmNvbnRleHQpCj4gICAgICAgICBjb250ZXh0LT50dmVjID0gY3NyX3JlYWQo
Q1NSX1RWRUMpOwo+ICAgICAgICAgY29udGV4dC0+aWUgPSBjc3JfcmVhZChDU1JfSUUpOwo+Cj4g
KyAgICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NT
VEMpKSB7Cj4gKyAgICAgICAgICAgICAgIGNvbnRleHQtPnN0aW1lY21wID0gY3NyX3JlYWQoQ1NS
X1NUSU1FQ01QKTsKPiArI2lmIF9fcmlzY3ZfeGxlbiA8IDY0Cj4gKyAgICAgICAgICAgICAgIGNv
bnRleHQtPnN0aW1lY21waCA9IGNzcl9yZWFkKENTUl9TVElNRUNNUEgpOwo+ICsjZW5kaWYKPiAr
ICAgICAgIH0KClRoZSBzdXNwZW5kIHNhdmUvcmVzdG9yZSBpcyBlbmFibGVkIGZvciB0aGUgTm9N
TVUga2VybmVsIGFzIHdlbGwKKHdoaWNoIHJ1bnMgaW4gTS1tb2RlKSBzbyBpdCBpcyBiZXR0ZXIg
dG8gc2F2ZS9yZXN0b3JlIHN0aW1lY21wIENTUgpvbmx5IGZvciBNTVUgZW5hYmxlZCBrZXJuZWxz
IChqdXN0IGxpa2Ugc2F0cCBDU1IpLgoKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBObyBuZWVk
IHRvIHNhdmUvcmVzdG9yZSBJUCBDU1IgKGkuZS4gTUlQIG9yIFNJUCkgYmVjYXVzZToKPiAgICAg
ICAgICAqCj4gQEAgLTQyLDYgKzQ4LDEzIEBAIHZvaWQgc3VzcGVuZF9yZXN0b3JlX2NzcnMoc3Ry
dWN0IHN1c3BlbmRfY29udGV4dCAqY29udGV4dCkKPiAgICAgICAgIGNzcl93cml0ZShDU1JfVFZF
QywgY29udGV4dC0+dHZlYyk7Cj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0lFLCBjb250ZXh0LT5p
ZSk7Cj4KPiArICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lT
QV9FWFRfU1NUQykpIHsKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwg
Y29udGV4dC0+c3RpbWVjbXApOwo+ICsjaWYgX19yaXNjdl94bGVuIDwgNjQKPiArICAgICAgICAg
ICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIGNvbnRleHQtPnN0aW1lY21waCk7Cj4gKyNl
bmRpZgo+ICsgICAgICAgfQo+ICsKPiAgI2lmZGVmIENPTkZJR19NTVUKPiAgICAgICAgIGNzcl93
cml0ZShDU1JfU0FUUCwgY29udGV4dC0+c2F0cCk7Cj4gICNlbmRpZgo+IC0tCj4gMi4zNC4xCj4K
PgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
