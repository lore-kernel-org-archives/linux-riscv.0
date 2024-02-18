Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F650C4829E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcK4BNQbfxPv8oZlfHGEzzhfqFlUaioQp6RtreNXtSo=; b=xIpg0k4lysa1nB
	xpMMwEPoUd0fln9sVwx9NrO5bcj3y0XQwAftTcdkfomJmvQRWtMacfkmbuumk9gZiVeTaoNnF4T+s
	RgyZtTZ3Aq59nX9J7aNa6TVnwZo6oXiLTRF9kaOFUwstHZKtKsjopgu+T7IHzz2fmFciUEYSwoYxr
	3KTAfjmEXz/hj6/7ibg/xsfAMCDVhckB3CIAB6Do+43UNRp5zCAr7th4clVoidV/Ysw/88TNB+XKc
	3VLfMn293gijMmK2Z/ahX/nUDRzq3elqZtx2QdGUlr1nUvzzZ5Dkz6tZMDbMn/qvRCAxCkxQNIqbE
	be/ddZgKRKdSyokRRmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbbRx-00000007Cfb-3xvb;
	Sun, 18 Feb 2024 07:18:57 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbbRu-00000007Cf6-0IFO
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 07:18:55 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d10ad265d5so29536691fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 23:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708240732; x=1708845532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoMtWxcRWAYRMgAR64TH67exXWHzzjC76RrscHy/AZU=;
        b=SoPUAanOeCXJ0BtYtfOw2W+6LsI/EtKVQE8lNOJhyzmeWobT7wZtWeg1OcH4a251SU
         1mzQueYgzWut3BGvGUQ+JtgXlqMyLpCy2OdYLcweRUa49hAynnoK3/CYf/UniGQ3n63H
         OFXHWyskb3vFrQtbfmqj+Ny/u+NszNKQdruvjSN1dsqypRi/XiY1Vt38BUt37ic/Zcr/
         fd2NrzNHU94o7s40aoxPPcCC9GgwQ6GzVe95flmPKid1pYSzI4JGRMZHOYPOYr8+aLaH
         iIsP8D1aAOZbmr2UP7Oji956dr3cNajusz6rMKRElpKmP7hAHNPxTlN5wXyzGdOPAuh5
         s3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708240732; x=1708845532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoMtWxcRWAYRMgAR64TH67exXWHzzjC76RrscHy/AZU=;
        b=UEt2fN5Sax3hffIf+1NBgd5ZGDM4BCiG3uL/M5p3jyuq61poccLtvHtiGv8WUk5voW
         hN6hHtfmG+DevfQ9G6ogIWCK4oZTp9BN6y6tOKnPkZ7x3R+1bC3IkaQ874MuysFoI7Dd
         5/kgu/8ZVLSk+hzUxjRS4muBqVKOYH56YM56mrfIfL9obV81MTxRyztTHct8Mrm3oa/T
         j1yO75VM6fjROn5XGUPV6jcV+ckNdyW5Wha9YFoxtaUU0acQdwFjNsZvry/LtcD7XCFa
         SZI6oAvNm8rOzx2tkrs2VPsTd+D9ntppo7dh8CssSVzMTPEEAFyILtuUcPwHyXZhmNut
         57eA==
X-Forwarded-Encrypted: i=1; AJvYcCWQUcIJaWKq4ke4SVcW/05BcA9c6rGAMd9Woqncz6wH0d+kz1gxZbgVI9HSVDG6P7m1ueD/zddiWsTcXDLweZhRRESwpPPLBK9clBTB7DBN
X-Gm-Message-State: AOJu0Yx/Bt1IJ3+CoZb6QI0aq5m7d0TWvu1ecGQDucSODihdTddvhWB1
	fhx9F6gK7coW7xb8rK3jdG6GwV5AK8Ft+zHYISYkg9D5YuDiiQa8Rc3J9gwWFKojpdY4CJU/IDp
	bOM0L5O2OH6hhoPNnC44KTgbUpoQ=
X-Google-Smtp-Source: AGHT+IHXsKbUAnLaswlubkUVSjxcVITALdr6/5cxflDhuJ4pVB97a4rXUaqRixc+Hik3Kiz0Skp1uw1ULPxi43uK5xw=
X-Received: by 2002:a2e:a686:0:b0:2d0:9324:aab3 with SMTP id
 q6-20020a2ea686000000b002d09324aab3mr5869682lje.30.1708240731756; Sat, 17 Feb
 2024 23:18:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <6473e0bb42524e4f29112290a92539d1a800eb69.1706603678.git.haibo1.xu@intel.com>
 <CAJZ5v0hC7gxoJK0kszw9GgRjxjrKgh7q0sC1L1FdVfOb-TCSRw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hC7gxoJK0kszw9GgRjxjrKgh7q0sC1L1FdVfOb-TCSRw@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 18 Feb 2024 15:18:40 +0800
Message-ID: <CAJve8omH2NvqnTu2a2V=wwrQCiQrP=uzu3ttO1VkjJN0ZyRjMA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ACPICA: SRAT: Add RISC-V RINTC affinity structure
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_231854_136269_23B2734C 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgOTozMeKAr1BNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAzMSwgMjAyNCBhdCAzOjE44oCv
QU0gSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEFDUElDQSBj
b21taXQgOTNjYWRkYmYyZjYyMDc2OTA1MmM1OWVjNDcxZjAxODI4MWRjM2EyNAo+Cj4gTm90IHJl
YWxseS4KPgo+ID4gQWRkIGRlZmluaXRpb24gb2YgUklTQy1WIEludGVycnVwdCBDb250cm9sbGVy
KFJJTlRDKQo+ID4gYWZmaW5pdHkgc3RydWN0dXJlIHdoaWNoIHdhcyBhcHByb3ZlZCBieSBVRUZJ
IGZvcnVtCj4gPiBhbmQgd2lsbCBiZSBwYXJ0IG9mIG5leHQgQUNQSSBzcGVjIHZlcnNpb24oNi42
KS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vYWNwaWNhL2FjcGljYS9jb21taXQv
OTNjYWRkYmYKPgo+IEFuZCB0aGlzIGRvZXNuJ3QgcG9pbnQgdG8gYW4gdXBzdHJlYW0gQUNQSUNB
IFBSLgo+CgpIaSBSYWZhZWwsCgpUaGlzIHBhdGNoIHdhcyBnZW5lcmF0ZWQgYnkgdGhlIGFjcGlj
YS9nZW5lcmF0ZS9saW51eC9nZW4tcGF0Y2guc2ggYW5kCnNob3VsZCBiZSBtZXJnZWQKdGhyb3Vn
aCB0aGUgQUNQSUNBIHByb2plY3QuIFRvIGluY2x1ZGUgaXQgaW4gdGhpcyBzZXJpZXMgaXMganVz
dCB0bwpzZXJ2ZSBhcyBhIHJlZmVyZW5jZS4KCkJUVywgdGhlIGNvcnJlc3BvbmRpbmcgQUNQSUNB
IHBhdGNoIGlzIHN0aWxsIHVuZGVyIHJldmlldyBhbmQgcGxlYXNlCnJlZmVyIHRvIHRoZSBmb2xs
b3dpbmcKbGluayBmb3IgdGhlIHN0YXR1cy4KCmh0dHBzOi8vZ2l0aHViLmNvbS9hY3BpY2EvYWNw
aWNhL3B1bGwvOTI2CgpSZWdhcmRzLApIYWlibwoKPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1
IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9hY3BpL2FjdGJsMy5o
IHwgMTggKysrKysrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2Fj
dGJsMy5oIGIvaW5jbHVkZS9hY3BpL2FjdGJsMy5oCj4gPiBpbmRleCBjMDgwZDU3OWE1NDYuLjUy
MDJlM2ZjOWI0MSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvYWNwaS9hY3RibDMuaAo+ID4gKysr
IGIvaW5jbHVkZS9hY3BpL2FjdGJsMy5oCj4gPiBAQCAtMTkyLDcgKzE5Miw4IEBAIGVudW0gYWNw
aV9zcmF0X3R5cGUgewo+ID4gICAgICAgICBBQ1BJX1NSQVRfVFlQRV9HSUNfSVRTX0FGRklOSVRZ
ID0gNCwgICAgLyogQUNQSSA2LjIgKi8KPiA+ICAgICAgICAgQUNQSV9TUkFUX1RZUEVfR0VORVJJ
Q19BRkZJTklUWSA9IDUsICAgIC8qIEFDUEkgNi4zICovCj4gPiAgICAgICAgIEFDUElfU1JBVF9U
WVBFX0dFTkVSSUNfUE9SVF9BRkZJTklUWSA9IDYsICAgICAgIC8qIEFDUEkgNi40ICovCj4gPiAt
ICAgICAgIEFDUElfU1JBVF9UWVBFX1JFU0VSVkVEID0gNyAgICAgLyogNyBhbmQgZ3JlYXRlciBh
cmUgcmVzZXJ2ZWQgKi8KPiA+ICsgICAgICAgQUNQSV9TUkFUX1RZUEVfUklOVENfQUZGSU5JVFkg
PSA3LCAgICAgIC8qIEFDUEkgNi42ICovCj4gPiArICAgICAgIEFDUElfU1JBVF9UWVBFX1JFU0VS
VkVEID0gOCAgICAgLyogOCBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiA+ICB9Owo+ID4K
PiA+ICAvKgo+ID4gQEAgLTI5Niw2ICsyOTcsMjEgQEAgc3RydWN0IGFjcGlfc3JhdF9nZW5lcmlj
X2FmZmluaXR5IHsKPiA+ICAjZGVmaW5lIEFDUElfU1JBVF9HRU5FUklDX0FGRklOSVRZX0VOQUJM
RUQgICAgICgxKSAgICAgLyogMDA6IFVzZSBhZmZpbml0eSBzdHJ1Y3R1cmUgKi8KPiA+ICAjZGVm
aW5lIEFDUElfU1JBVF9BUkNISVRFQ1RVUkFMX1RSQU5TQUNUSU9OUyAgICgxPDwxKSAgLyogQUNQ
SSA2LjQgKi8KPiA+Cj4gPiArLyogNzogUklOVEMgQWZmaW5pdHkgKEFDUEkgNi42KSAqLwo+ID4g
Kwo+ID4gK3N0cnVjdCBhY3BpX3NyYXRfcmludGNfYWZmaW5pdHkgewo+ID4gKyAgICAgICBzdHJ1
Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIgaGVhZGVyOwo+ID4gKyAgICAgICB1MTYgcmVzZXJ2ZWQ7
ICAgICAgICAgICAvKiBSZXNlcnZlZCwgbXVzdCBiZSB6ZXJvICovCj4gPiArICAgICAgIHUzMiBw
cm94aW1pdHlfZG9tYWluOwo+ID4gKyAgICAgICB1MzIgYWNwaV9wcm9jZXNzb3JfdWlkOwo+ID4g
KyAgICAgICB1MzIgZmxhZ3M7Cj4gPiArICAgICAgIHUzMiBjbG9ja19kb21haW47Cj4gPiArfTsK
PiA+ICsKPiA+ICsvKiBGbGFncyBmb3Igc3RydWN0IGFjcGlfc3JhdF9yaW50Y19hZmZpbml0eSAq
Lwo+ID4gKwo+ID4gKyNkZWZpbmUgQUNQSV9TUkFUX1JJTlRDX0VOQUJMRUQgICAgICgxKSAgICAg
ICAgLyogMDA6IFVzZSBhZmZpbml0eSBzdHJ1Y3R1cmUgKi8KPiA+ICsKPiA+ICAvKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgo+ID4gICAqCj4gPiAgICogU1RBTyAtIFN0YXR1cyBPdmVycmlkZSBUYWJs
ZSAoX1NUQSBvdmVycmlkZSkgLSBBQ1BJIDYuMAo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
