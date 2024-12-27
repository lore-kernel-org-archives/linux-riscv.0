Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C9E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3CRKxMesAs/lbW8ccM7o7wFa0utVZJQ8jGTRTRHs6s=; b=Gfs1mwY+7JqRnj
	ZRUIT0KZooxZTATiWTnzRtAjwyUSqKgjCVowSqxa1O1mgq+oEP6dUJcR/hPPAWJTwQvndzbiPb2ms
	Et/26+UWcpx3AE5I7jAvNNksodFPtR4ehpKonXUfmInzyMiV60eiH4BfBP2eIlobaW+A8yQwxPRqv
	+OtKwSpSnikPbWbrlNASLnmSoD+WzIYIJLrLPaacTwiL6VpR1nx5i1I7LCSh9YdujPU8AEpJXHe+D
	t26ioeSvrstWqPm6ue4QpoQPak8kt2fIJ6siLCPxR4q7srggxDmPA11K1kusMr4Lac2jzBcRmdEme
	HW1cCZl74ZxR9TyTVckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDD4-00000000cEB-04GC;
	Fri, 27 Dec 2024 16:29:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDD0-00000000cDW-14yW
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 16:29:08 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53df6322ea7so10027711e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316944; x=1735921744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oW4mN8cC86oshtjqRgjsTaW7z+n3qOyOrUeMP9CRCk=;
        b=f6+FOVQMfu3Y3/RWm1em47lvL+jti7Gw6ez53qdL83eN8LMu3/LLubOkeWLAolJIF4
         fnZYD0YMUbbYJxFGwMId37DIyTrNkLMdmQE8St4Zo4Gpdjt8wRsWBOYU2gcpnslJjMO5
         2zE59um6jnOYeZK0288J04YIqx7QSAGHydMWhdyQcmPI9y/Y3bzPGu84vykoCfcZfHx7
         WXJty0AWo6y5G2j9+R/ha2qJdyV+j7st5f4XlKaHwH58EVhN+t3vnKjU3aSVCqSbBfSx
         2a+dIHrfoh05iL1ZKsYAvSitEtarihZS0F+QOA9DHN+hL0hxKRebrfBRdXRP6ZpvHpxa
         Ck3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316944; x=1735921744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oW4mN8cC86oshtjqRgjsTaW7z+n3qOyOrUeMP9CRCk=;
        b=EMJiZf1hmdD6qEHLgXBTG1gMz15N1aVl2pjnm0+tcNzaNoPqeyRvj/Wcxy4wlyeusW
         qd4TqfOFjaGQILT9qSN6rYdBET3M54u3PazpsU6phP7sjuXw3jxn+uCkgECIRDq1rMjI
         wNf5vbGWz7FJrPLzVaz4F8B/QrwDtw0jTqj4BmBUoyXThfbbImGyQ+mOUJJchr1lM9Mz
         jdTqzPDaHJU+FBZRO5avb8Kdo8XCF0dF6oKsAw06F8gakDYE/QgWcGEM7irBuwGvd5lR
         U1BYM3quJXJvdGf7EkmPyKtDcXY3+r84YHct4/Vnt2OcgwUhVApmSO1l8q2WNLudqTzm
         ZtBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAhGp77FaFjAka/QPnkthtWi3CF/fWv310i8gnncKUcFjfgQN5EOA2Gvcs4mOAV5K+tnG71xnG2F2xPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yysmx6jSkKtHKdZKZVhZefNrqcpjcelPQXQ15+Pxes0I8VLjjvO
	qX4FtmBdm6RmitBoC/aStlpdaGoz+pHkwHQ2wTiV0JYTYqTrorgln2RH/3SJb6UO2QOgllUAdeN
	MLQakadXEdCHmLM0BZNyhWhC5gO8EIHME4jOo8Q==
X-Gm-Gg: ASbGncsGIpaLtTPbbLM7JNNyW1Lebz5RXOsQyp0PLmBmbQUr6w99AB0G6boHcs49394
	hux5ymqMXGM4O8cMQDkK/48p9Qu3kkNHATO9Z
X-Google-Smtp-Source: AGHT+IFEVrD+v3aZLF1u0UgSdbK6XoWVvLireUe/cfd58JtoLPKDCHpDJcLqQ+n8HxbzaxWY6+YsJylFW7tZ4FIBybs=
X-Received: by 2002:a05:6512:1241:b0:53f:f074:801c with SMTP id
 2adb3069b0e04-5422958eaaemr9406977e87.41.1735316944181; Fri, 27 Dec 2024
 08:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-2-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-2-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:28:53 +0100
Message-ID: <CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_082906_325305_24AAE43F 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpTb21lIGNvbW1lbnRzIGJlbG93OgoK
T24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMTozM+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gSW1wbGVtZW50IEdQSU8gZnVuY3Rpb25hbGl0eSB3aGljaCBjYXBhYmxl
IG9mIHNldHRpbmcgcGluIGFzCj4gaW5wdXQsIG91dHB1dC4gQWxzbywgZWFjaCBwaW4gY2FuIGJl
IHVzZWQgYXMgaW50ZXJydXB0IHdoaWNoCj4gc3VwcG9ydCByaXNpbmcvZmFpbGluZyBlZGdlIHR5
cGUgdHJpZ2dlciwgb3IgYm90aC4KPgo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBn
ZW50b28ub3JnPgooLi4uKQo+ICsjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9pby5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICsjaW5jbHVkZSA8bGludXgv
aXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L2Nsay5oPgo+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby5oPgoKUGxlYXNlIGRyb3AgdGhpcyBsZWdh
Y3kgaW5jbHVkZS4gSXQgc2hvdWxkIG5vdCBiZSBuZWVkZWQuCgo+ICsjaW5jbHVkZSA8bGludXgv
Z3Bpby9kcml2ZXIuaD4KClRoaXMgc2hvdWxkIGJlIGVub3VnaCBmb3IgYW55IGRyaXZlci4KCj4g
Ky8qIHJlZ2lzdGVyIG9mZnNldCAqLwo+ICsjZGVmaW5lIEdQTFIgICAgICAgICAgIDB4MDAKPiAr
I2RlZmluZSBHUERSICAgICAgICAgICAweDBjCj4gKyNkZWZpbmUgR1BTUiAgICAgICAgICAgMHgx
OAo+ICsjZGVmaW5lIEdQQ1IgICAgICAgICAgIDB4MjQKPiArI2RlZmluZSBHUkVSICAgICAgICAg
ICAweDMwCj4gKyNkZWZpbmUgR0ZFUiAgICAgICAgICAgMHgzYwo+ICsjZGVmaW5lIEdFRFIgICAg
ICAgICAgIDB4NDgKPiArI2RlZmluZSBHU0RSICAgICAgICAgICAweDU0Cj4gKyNkZWZpbmUgR0NE
UiAgICAgICAgICAgMHg2MAo+ICsjZGVmaW5lIEdTUkVSICAgICAgICAgIDB4NmMKPiArI2RlZmlu
ZSBHQ1JFUiAgICAgICAgICAweDc4Cj4gKyNkZWZpbmUgR1NGRVIgICAgICAgICAgMHg4NAo+ICsj
ZGVmaW5lIEdDRkVSICAgICAgICAgIDB4OTAKPiArI2RlZmluZSBHQVBNQVNLICAgICAgICAgICAg
ICAgIDB4OWMKPiArI2RlZmluZSBHQ1BNQVNLICAgICAgICAgICAgICAgIDB4YTgKClRoaXMgbG9v
a3MgbGlrZSB0aGUgYXJjaGV0eXBlIG9mIGEgbWVtb3J5LW1hcHBlZCBHUElPIGNoaXAuCgo+ICsj
ZGVmaW5lIHNwYWNlbWl0X2dwaW9fdG9fYmFua19pZHgoZ3BpbykgICAgICAgICAgICAgICAgKChn
cGlvKSAvIEsxX0JBTktfR1BJT19OVU1CRVIpCj4gKyNkZWZpbmUgc3BhY2VtaXRfZ3Bpb190b19i
YW5rX29mZnNldChncGlvKSAgICAgKChncGlvKSAmIEJBTktfR1BJT19NQVNLKQo+ICsjZGVmaW5l
IHNwYWNlbWl0X2JhbmtfdG9fZ3BpbyhpZHgsIG9mZnNldCkgICAgIFwKPiArICAgICAgICgoKGlk
eCkgKiBLMV9CQU5LX0dQSU9fTlVNQkVSKSB8ICgob2Zmc2V0KSAmIEJBTktfR1BJT19NQVNLKSkK
PiArCj4gK3N0YXRpYyB1MzIgazFfZ3Bpb19iYW5rX29mZnNldFtdID0geyAweDAsIDB4NCwgMHg4
LCAweDEwMCB9OwoKWWV0IHRoaXMgaXMgbm90IHJlZ2lzdGVyZWQgb24gYSBwZXItYmFuayBiYXNp
cywgaW5zdGVhZCBhbGwgZm91ciBiYW5rcwphcmUgaGFtbWVyZWQgaW50byBvbmUgc2luZ2xlIGNo
aXAuIFdoeT8KCkNhbiB5b3UgcGxlYXNlIHNwbGl0IHRoaXMgaW50byA0IGluc3RhbmNlcywgYWxz
byBpbiB0aGUgZGV2aWNlCnRyZWUuIEl0IG1ha2VzIGV2ZXJ5dGhpbmcgbXVjaCBzaW1wbGVyLgoK
PiArc3RydWN0IHNwYWNlbWl0X2dwaW9fY2hpcCB7Cj4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19jaGlw
ICAgICAgICAgICAgICAgIGNoaXA7Cj4gKyAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAgICAgICAg
ICAgICAgICpkb21haW47CgpJZiB5b3UncmUgdXNpbmcgR1BJT0xJQl9JUlFDSElQIHlvdSBzaG91
bGQgbm90CmFsc28gZGVmaW5lIHlvdWUgb3duIGlycV9kb21haW4sIHRoZSBncGlvbGliIGhhbmRs
ZXMgdGhpcy4KCj4gKyAgICAgICBzdHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rICAgICAgICpiYW5r
czsKPiArICAgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAgICAgICAgICAgKnJlZ19iYXNlOwo+
ICsgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgICAgICBuZ3BpbzsKCklzIHRoaXMg
ZXZlciB1c2VkIGFmdGVyIGluaXRpYWxpemF0aW9uPwoKPiArICAgICAgIHVuc2lnbmVkIGludCAg
ICAgICAgICAgICAgICAgICAgbmJhbms7Cj4gKyAgICAgICBpbnQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlycTsKCk9yIHRoaXM/Cgo+ICtzdGF0aWMgaW50IHNwYWNlbWl0X2dwaW9fdG9f
aXJxKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQpCj4gK3sKPiAr
ICAgICAgIHN0cnVjdCBzcGFjZW1pdF9ncGlvX2NoaXAgKnNjaGlwID0gdG9fc3BhY2VtaXRfZ3Bp
b19jaGlwKGNoaXApOwo+ICsKPiArICAgICAgIHJldHVybiBpcnFfY3JlYXRlX21hcHBpbmcoc2No
aXAtPmRvbWFpbiwgb2Zmc2V0KTsKPiArfQoKU2hvdWxkIG5vdCBiZSBuZWVkZWQgd2hlbiB1c2lu
ZyBHUElPTElCX0lSUUNISVAuCgo+ICsgICAgICAgc2NoaXAgPSB0b19zcGFjZW1pdF9ncGlvX2No
aXAoY2hpcCk7Cj4gKyAgICAgICBiYW5rID0gc3BhY2VtaXRfZ3Bpb19nZXRfYmFuayhzY2hpcCwg
b2Zmc2V0KTsKPiArICAgICAgIGJpdCA9IEJJVChzcGFjZW1pdF9ncGlvX3RvX2Jhbmtfb2Zmc2V0
KG9mZnNldCkpOwoKI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4gdG8gdXNlIHRoZSBCSVQoKSBtYWNy
by4KClRoaXMgZHJpdmVyIGJlY29tZXMgdW5uZWNlc3NhcmlseSBjb21wbGV4IGR1ZSB0byBjb2xs
ZWN0aW5nIDQgR1BJTyBjaGlwcwppbnRvIG9uZS4KClBsZWFzZSBzcGxpdCBpdCBpbnRvIDQgaW5z
dGFuY2VzIG9mIHRoZSBzYW1lIGRyaXZlciwgdGhlbiBsb29rIGF0IG90aGVyCmRyaXZlcnMgdXNp
bmcgc2VsZWN0IEdQSU9fR0VORVJJQyBzdWNoIGFzCmRyaXZlcnMvZ3Bpby9ncGlvLXBsMDYxLmMK
ZHJpdmVycy9ncGlvL2dwaW8tZnRncGlvMDEwLmMKZm9yIGV4YW1wbGVzIG9mIGhvdyB0byBjcmVh
dGUgYSB2ZXJ5IGNvbXBhY3QgYW5kIHNpbXBsZSBkcml2ZXIKcmV1c2luZyB0aGUgZ2VuZXJpYyBH
UElPIGhlbHBlcnMsIHRoaXMgd2lsbCBhbHNvIHByb3ZpZGUKZ2V0L3NldF9tdWx0aXBsZSBpbXBs
ZW1lbnRhdGlvbnMgYW5kIG90aGVyIHVzZWZ1bCB0aGluZ3MuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
