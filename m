Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGvv/ke32N1hQ1B+cwDOH+JXfE33xgyGmqBKOnEIrh0=; b=eCvteVrgdM6qT3
	QLBjbkkhbPT7wg6kSo5XFEzJmDmWTbroCLAILDKKjL4ws5fF0px+ChhTwhIfJxCkbNoUZv79nPQ4x
	0PlbpfEjZM5XiGbYyumHXPqvG7F61/MCSU6sEERNnEoWKNFnAA8Xg1JHxP/TFPMSgngRbEN7gVpGS
	qyEHAsTgRFfplSRb+2Nzl1fBJ7XZun7vsEhoEgqkcuLU5LmPe+mLIAn7JMqjLAoNHQhYdewwSACyc
	5bpuvyEsuFRYzMGHhJEnpIzR1sGfUGii9+HuQvdJxwcwH7L0pBHV5pr0CS4pi+sQKJMhjNQJc1DDe
	AMmLGKNicfv2XoziXj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGWo-00000007b2F-3h70;
	Wed, 14 Aug 2024 16:07:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGTo-00000007aWK-10j5;
	Wed, 14 Aug 2024 16:04:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-367963ea053so47891f8f.2;
        Wed, 14 Aug 2024 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651446; x=1724256246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsVwGbt3gTQjJ2udr1fi33WHUjrTh7/T/FVKigzrowA=;
        b=gWdCTpSniRi+2kgsCSEtqQn6j/Z4SkmiUMadYWsE7Sx80gs7DG+TYq7ZB1iqqdYZcl
         k9j+ddH7WGRUysfsKQIfgegbGduIBBFdJxJLbDa4MXMoTuBMuSGqMine2qPmpoMSXJ4e
         Qyfvfn7kLpswtkazI/V6AWlA0vm3vcRrYEkswtmXkolu3vXEpUYdEeIsMm6NFZ7JGJJV
         D1KFElhq266MH6t85ekp9S/pITVegxm5SgeK6t+Ewaza59Uxb1dtC3A0l3oSqNujJeSl
         HaivyX8RyrBFGu8UWV+SR+dOHT2YUfDCIUq5moNnWvR6ooNf/I8IKyGOqxw3nE2i/yQO
         J3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651446; x=1724256246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsVwGbt3gTQjJ2udr1fi33WHUjrTh7/T/FVKigzrowA=;
        b=VbKMcapPuePdW7UttzdPMZzp9tEOck/VBDX2ZQvRamZAF5zfO2JaoUMUUhZGRiD01F
         V2QH/2RWS6dpS9M8oI9EACzTgUtIG8tnFxQTPCV5VlVVz1OlLIUE5pgUZ//l3adqncnI
         iUEEGteEJMs1iCjfjVwk0+P/KC0owcTaZXkA8b8FL3Pu2xxbK+22HnNv1O5CmfHYKs0/
         rmlRIYQ43Ub1eDfIk3KXFa34ickNBMS8WprG94B3bBkOr1k+tv7yPcxTVs+r/cPMBe1V
         URAco3YaQgZG3TBZX82QYTrNQyIqt4ZOMJoiF2Q/Wn12+520lL96PQPP5DcLDZQ5xisE
         rnLg==
X-Forwarded-Encrypted: i=1; AJvYcCW5gpB9F6dEqmEP0bpRE+josgvuhUfTmQ9f68qBNjfFUnSiA9TRnDrNho+1qKSNj+C2vpnxTtZrDb5Stgg=@lists.infradead.org, AJvYcCWMPJ73d3lT+WbgNLXEUieMGni+b1GuyKtNkqjvqKSApTnGTuh5WAXC54GMPwSdyaUn/BrAgZwX8qLEz0MjFEd7@lists.infradead.org
X-Gm-Message-State: AOJu0YxO8GoFV3WN3u3vKty3mUfxxrd+VvV+Bj/m0/nfsVC7OYvnLcLT
	W31imcnV+OC91BZRFa5xvbARm7FS9ClFrhkDSKmOcs2+n42wgSWtGMsbHyZvuneliuEgLfBigKU
	+fAbYVjxDI/hPyOqOvW6o9mbk/3A=
X-Google-Smtp-Source: AGHT+IH3WGBZYGGMMeBMLZ8/7pbU5/zXCItnDtUaC7+sJAFb2TCPZKtdU4opFOuQ2YIOepRuhBu4BNdTmycC72rMS98=
X-Received: by 2002:adf:cc09:0:b0:36b:d3eb:17a5 with SMTP id
 ffacd0b85a97d-3717778d7cfmr2725194f8f.36.1723651445910; Wed, 14 Aug 2024
 09:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-4-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-4-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:03:54 +0200
Message-ID: <CA+fCnZf3U9u1dHBjecT=ZMYHp0OKv00HwObDcpAFwGXF58Vedg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] kasan: sw_tags: Support tag widths less than 8 bits
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_090408_300729_27056E7B 
X-CRM114-Status: GOOD (  17.13  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMTA6NTbigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBbGxvdyBhcmNoaXRlY3R1cmVzIHRvIG92
ZXJyaWRlIEtBU0FOX1RBR19LRVJORUwgaW4gYXNtL2thc2FuLmguIFRoaXMKPiBpcyBuZWVkZWQg
b24gUklTQy1WLCB3aGljaCBzdXBwb3J0cyA1Ny1iaXQgdmlydHVhbCBhZGRyZXNzZXMgYW5kIDct
Yml0Cj4gcG9pbnRlciB0YWdzLiBGb3IgY29uc2lzdGVuY3ksIG1vdmUgdGhlIGFybTY0IE1URSBk
ZWZpbml0aW9uIG9mCj4gS0FTQU5fVEFHX01JTiB0byBhc20va2FzYW4uaCwgc2luY2UgaXQgaXMg
YWxzbyBhcmNoaXRlY3R1cmUtZGVwZW5kZW50Owo+IFJJU0MtVidzIGVxdWl2YWxlbnQgZXh0ZW5z
aW9uIGlzIGV4cGVjdGVkIHRvIHN1cHBvcnQgNy1iaXQgaGFyZHdhcmUKPiBtZW1vcnkgdGFncy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgo+IC0tLQo+Cj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20va2FzYW4uaCAgIHwgIDYgKysr
Ky0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgIDEgKwo+ICBpbmNsdWRl
L2xpbnV4L2thc2FuLXRhZ3MuaCAgICAgICB8IDEzICsrKysrKysrLS0tLS0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va2FzYW4uaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
a2FzYW4uaAo+IGluZGV4IGUxYjU3YzEzZjhhNC4uNGFiNDE5ZGY4YjkzIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va2FzYW4uaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20va2FzYW4uaAo+IEBAIC02LDggKzYsMTAgQEAKPgo+ICAjaW5jbHVkZSA8bGludXgvbGlu
a2FnZS5oPgo+ICAjaW5jbHVkZSA8YXNtL21lbW9yeS5oPgo+IC0jaW5jbHVkZSA8YXNtL210ZS1r
YXNhbi5oPgo+IC0jaW5jbHVkZSA8YXNtL3BndGFibGUtdHlwZXMuaD4KPiArCj4gKyNpZmRlZiBD
T05GSUdfS0FTQU5fSFdfVEFHUwo+ICsjZGVmaW5lIEtBU0FOX1RBR19NSU4gICAgICAgICAgICAg
ICAgICAweEYwIC8qIG1pbmltdW0gdmFsdWUgZm9yIHJhbmRvbSB0YWdzICovCj4gKyNlbmRpZgo+
Cj4gICNkZWZpbmUgYXJjaF9rYXNhbl9zZXRfdGFnKGFkZHIsIHRhZykgIF9fdGFnX3NldChhZGRy
LCB0YWcpCj4gICNkZWZpbmUgYXJjaF9rYXNhbl9yZXNldF90YWcoYWRkcikgICAgIF9fdGFnX3Jl
c2V0KGFkZHIpCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCAyOGY2NjVlMDk3NWEu
LjU2YTA5ZjQxMjI3MiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTIyLDYg
KzIyLDcgQEAKPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gICNpbmNsdWRlIDxhc20v
bW11Lmg+Cj4gICNpbmNsdWRlIDxhc20vbXRlLmg+Cj4gKyNpbmNsdWRlIDxhc20vbXRlLWthc2Fu
Lmg+Cj4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gICNpbmNsdWRlIDxhc20vbWVtb3J5Lmg+
Cj4gICNpbmNsdWRlIDxhc20vZXh0YWJsZS5oPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2thc2FuLXRhZ3MuaCBiL2luY2x1ZGUvbGludXgva2FzYW4tdGFncy5oCj4gaW5kZXggNGY4NWY1
NjI1MTJjLi5lMDdjODk2Zjk1ZDMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rYXNhbi10
YWdzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2thc2FuLXRhZ3MuaAo+IEBAIC0yLDEzICsyLDE2
IEBACj4gICNpZm5kZWYgX0xJTlVYX0tBU0FOX1RBR1NfSAo+ICAjZGVmaW5lIF9MSU5VWF9LQVNB
Tl9UQUdTX0gKPgo+ICsjaW5jbHVkZSA8YXNtL2thc2FuLmg+Cj4gKwo+ICsjaWZuZGVmIEtBU0FO
X1RBR19LRVJORUwKPiAgI2RlZmluZSBLQVNBTl9UQUdfS0VSTkVMICAgICAgIDB4RkYgLyogbmF0
aXZlIGtlcm5lbCBwb2ludGVycyB0YWcgKi8KPiAtI2RlZmluZSBLQVNBTl9UQUdfSU5WQUxJRCAg
ICAgIDB4RkUgLyogaW5hY2Nlc3NpYmxlIG1lbW9yeSB0YWcgKi8KPiAtI2RlZmluZSBLQVNBTl9U
QUdfTUFYICAgICAgICAgIDB4RkQgLyogbWF4aW11bSB2YWx1ZSBmb3IgcmFuZG9tIHRhZ3MgKi8K
PiArI2VuZGlmCj4gKwo+ICsjZGVmaW5lIEtBU0FOX1RBR19JTlZBTElEICAgICAgKEtBU0FOX1RB
R19LRVJORUwgLSAxKSAvKiBpbmFjY2Vzc2libGUgbWVtb3J5IHRhZyAqLwo+ICsjZGVmaW5lIEtB
U0FOX1RBR19NQVggICAgICAgICAgKEtBU0FOX1RBR19LRVJORUwgLSAyKSAvKiBtYXhpbXVtIHZh
bHVlIGZvciByYW5kb20gdGFncyAqLwo+Cj4gLSNpZmRlZiBDT05GSUdfS0FTQU5fSFdfVEFHUwo+
IC0jZGVmaW5lIEtBU0FOX1RBR19NSU4gICAgICAgICAgMHhGMCAvKiBtaW5pbXVtIHZhbHVlIGZv
ciByYW5kb20gdGFncyAqLwo+IC0jZWxzZQo+ICsjaWZuZGVmIEtBU0FOX1RBR19NSU4KPiAgI2Rl
ZmluZSBLQVNBTl9UQUdfTUlOICAgICAgICAgIDB4MDAgLyogbWluaW11bSB2YWx1ZSBmb3IgcmFu
ZG9tIHRhZ3MgKi8KPiAgI2VuZGlmCj4KPiAtLQo+IDIuNDUuMQo+CgpSZXZpZXdlZC1ieTogQW5k
cmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
