Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD1DC07CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLgaJ6k0HTS+TByCxHweHma4/VlKG6LhAbYZjJbr23M=; b=AL1EwLHF8gbNXH
	Q6RhL0wrWWpnLKhMm2Ce2Qbb2PBXdQ2oCZizf87/CIYVXwOOZ6MdRZBlClpVRa4SDjp8UaxcmQ27i
	eKB5wJaWLB4kWehjSOKVljPilS/BKcrXQkPGgmVvaxLsBtYrq9r2oS7t5eLvzL4RV3zrR4nASiKbt
	Kwr1K1jKVtFTh05eKvwOveqRQ4NaWjlirqZd6mqyEvKamEIMhkdau7mh8wOUPLADjzWqkYC7PImcw
	PS9EjScnEDQk+8X2mGWd1+3Hp/MaMJVBl8bCTAFIt+U1vtRpZQqJExm+FPvdGmhagzqWMzqtcNqTC
	eaAB1bsWi85BpbP9J5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7syB-004TAq-0Q;
	Tue, 28 Nov 2023 07:57:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7sy7-004T9Y-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 07:57:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50aa8c0af41so6180644e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 23:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1701158236; x=1701763036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFL2mcWcdAVs6BZTrdM5FwmZN6clmYE/rKpAVrYnpAo=;
        b=uQ88GM9xcQd6m/gC20ZLdYaX4hMhhg+1qftuRdLMiLg46j6cxiNN4fwUfBwX2FdbTF
         kWr2DaFDRzoqsJm3ssNRuYht4lp3DsM9y/n8faR30k7zEFhoR5tZ/KfSRAv98BrjY2GF
         nGdvlzQXnPrJAGBBdYZoUPxc59qzEWVMSmKkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158236; x=1701763036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFL2mcWcdAVs6BZTrdM5FwmZN6clmYE/rKpAVrYnpAo=;
        b=mmeHwfIh4da8p0AXAXukz9twwd7HsRDkbmQFSXDl0+o2L4xcK7qQ5R7M71/RCp43TI
         pKYE+ZoTVFfBjNV9wWyjC35prFxdRqjh6KH0c1vD4KTnpApjFqe2OIq4FHveNKxlIlqU
         2rc1Ml6sfPJf7YrNcRksFERIYx32jL43JosVbwygM3v8drjw1+MjmPLYw08TN8j+RJcf
         y8Tj05nYTY50fcb9uGf8GWbWuujNXZcUfnm5MuobvsaMCcuWMYTU2sxGgyU5MQYzxwdz
         oc6splrtDsqBGsFQOVea5vm8HSEd5phUuoP2v9CsXCUUiJ8OxVr8aSgqtRxNQFmaWhvf
         rNsQ==
X-Gm-Message-State: AOJu0YyaNvcX/cBCEYgpdurH7Hxf7TmiDNDO74AhVRRgn6okJZ733/A9
	CfUI00ar2KvwzjulTHtECsClcy6YI2Ll2u4MSNZyFadAMg1W2Agmjw==
X-Google-Smtp-Source: AGHT+IF0YE9iFAZnfnriN3ge4xn3oGGu5vb7Hm91JHy0EeU977WhV2dstXisf+BZATo1haW3DuOREq3VqihD6IYpXcg=
X-Received: by 2002:a05:6512:1251:b0:50a:aa64:a6a9 with SMTP id
 fb17-20020a056512125100b0050aaa64a6a9mr3901542lfb.16.1701158236161; Mon, 27
 Nov 2023 23:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20231127095403.272424-1-vadim.shakirov@syntacore.com>
In-Reply-To: <20231127095403.272424-1-vadim.shakirov@syntacore.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 27 Nov 2023 23:57:04 -0800
Message-ID: <CAOnJCUKjruQRbZXCHx+fNS34dvfNXDozWEm=Yr_KnLKOYc3OgQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: perf: ctr_get_width function for legacy is not defined
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_235719_514316_83270849 
X-CRM114-Status: GOOD (  21.64  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTo1NOKAr0FNIFZhZGltIFNoYWtpcm92Cjx2YWRpbS5z
aGFraXJvdkBzeW50YWNvcmUuY29tPiB3cm90ZToKPgo+IFdpdGggcGFyYW1ldGVycyBDT05GSUdf
UklTQ1ZfUE1VX0xFR0FDWT15IGFuZCBDT05GSUdfUklTQ1ZfUE1VX1NCST1uCj4gbGludXgga2Vy
bmVsIGNyYXNoZXMgd2hlbiB5b3UgdHJ5IHBlcmYgcmVjb3JkOgo+Cj4gJCBwZXJmIHJlY29yZCBs
cwo+IFsgICA0Ni43NDkyODZdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMAo+IFsgICA0Ni43
NTAxOTldIE9vcHMgWyMxXQo+IFsgICA0Ni43NTAzNDJdIE1vZHVsZXMgbGlua2VkIGluOgo+IFsg
ICA0Ni43NTA2MDhdIENQVTogMCBQSUQ6IDEwNyBDb21tOiBwZXJmLWV4ZWMgTm90IHRhaW50ZWQg
Ni42LjAgIzIKPiBbICAgNDYuNzUwOTA2XSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVt
dSAoRFQpCj4gWyAgIDQ2Ljc1MTE4NF0gZXBjIDogMHgwCj4gWyAgIDQ2Ljc1MTQzMF0gIHJhIDog
YXJjaF9wZXJmX3VwZGF0ZV91c2VycGFnZSsweDU0LzB4MTNlCj4gWyAgIDQ2Ljc1MTY4MF0gZXBj
IDogMDAwMDAwMDAwMDAwMDAwMCByYSA6IGZmZmZmZmZmODA3MmVlNTIgc3AgOiBmZjIwMDAwMDAw
MjJiOGYwCj4gWyAgIDQ2Ljc1MTk1OF0gIGdwIDogZmZmZmZmZmY4MTUwNTk4OCB0cCA6IGZmNjAw
MDAwMDI5MGQ0MDAgdDAgOiBmZjIwMDAwMDAwMjJiOWMwCj4gWyAgIDQ2Ljc1MjIyOV0gIHQxIDog
MDAwMDAwMDAwMDAwMDAwMSB0MiA6IDAwMDAwMDAwMDAwMDAwMDMgczAgOiBmZjIwMDAwMDAwMjJi
OTMwCj4gWyAgIDQ2Ljc1MjQ1MV0gIHMxIDogZmY2MDAwMDAwMjhmYjAwMCBhMCA6IDAwMDAwMDAw
MDAwMDAwMDAgYTEgOiBmZjYwMDAwMDAyOGZiMDAwCj4gWyAgIDQ2Ljc1MjY3M10gIGEyIDogMDAw
MDAwMGFlMjc1MTI2OCBhMyA6IDAwMDAwMDAwMDA0ZmI3MDggYTQgOiAwMDAwMDAwMDAwMDAwMDA0
Cj4gWyAgIDQ2Ljc1Mjg5NV0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAwMDAx
N2ZmZTMgYTcgOiAwMDAwMDAwMDAwMDAwMGQyCj4gWyAgIDQ2Ljc1MzExN10gIHMyIDogZmY2MDAw
MDAwMjhmYjAwMCBzMyA6IDAwMDAwMDBhZTI3NTEyNjggczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4g
WyAgIDQ2Ljc1MzMzOF0gIHM1IDogZmZmZmZmZmY4MTUzZTI5MCBzNiA6IGZmNjAwMDAwODYzYjkw
MDAgczcgOiBmZjYwMDAwMDAyOTYxMDc4Cj4gWyAgIDQ2Ljc1MzU2Ml0gIHM4IDogZmY2MDAwMDAw
Mjk2MTA0OCBzOSA6IGZmNjAwMDAwMDI5NjEwNTggczEwOiAwMDAwMDAwMDAwMDAwMDAxCj4gWyAg
IDQ2Ljc1Mzc4M10gIHMxMTogMDAwMDAwMDAwMDAwMDAxOCB0MyA6IGZmZmZmZmZmZmZmZmZmZmYg
dDQgOiBmZmZmZmZmZmZmZmZmZmZmCj4gWyAgIDQ2Ljc1NDAwNV0gIHQ1IDogZmY2MDAwMDAwMjky
MjcwYyB0NiA6IGZmMjAwMDAwMDAyMmJiMzAKPiBbICAgNDYuNzU0MTc5XSBzdGF0dXM6IDAwMDAw
MDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAw
MDAwYwo+IFsgICA0Ni43NTQ2NTNdIENvZGU6IFVuYWJsZSB0byBhY2Nlc3MgaW5zdHJ1Y3Rpb24g
YXQgMHhmZmZmZmZmZmZmZmZmZmVjLgo+IFsgICA0Ni43NTQ5MzldIC0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQo+IFsgICA0Ni43NTUxMzFdIG5vdGU6IHBlcmYtZXhlY1sxMDdd
IGV4aXRlZCB3aXRoIGlycXMgZGlzYWJsZWQKPiBbICAgNDYuNzU1NTQ2XSBub3RlOiBwZXJmLWV4
ZWNbMTA3XSBleGl0ZWQgd2l0aCBwcmVlbXB0X2NvdW50IDQKPgo+IFRoaXMgaGFwcGVucyBiZWNh
dXNlIGluIHRoZSBsZWdhY3kgY2FzZSB0aGUgY3RyX2dldF93aWR0aCBmdW5jdGlvbiB3YXMgbm90
Cj4gZGVmaW5lZCwgYnV0IGl0IGlzIHVzZWQgaW4gYXJjaF9wZXJmX3VwZGF0ZV91c2VycGFnZS4K
Pgo+IEZpeGVzOiBjYzRjMDdjODlhYWQgKCJkcml2ZXJzOiBwZXJmOiBJbXBsZW1lbnQgcGVyZiBl
dmVudCBtbWFwIHN1cHBvcnQgaW4gdGhlIFNCSSBiYWNrZW5kIikKPiBTaWduZWQtb2ZmLWJ5OiBW
YWRpbSBTaGFraXJvdiA8dmFkaW0uc2hha2lyb3ZAc3ludGFjb3JlLmNvbT4KCkxlZ2FjeSBQTVUg
c2hvdWxkbid0IGVuYWJsZSBwZXJmIHNhbXBsaW5nIGluIHRoZSBmaXJzdCBwbGFjZS4gV2UgbmVl
ZAp0byBzZXQgdGhlIGNhcGFiaWxpdGllcyBhY2NvcmRpbmdseS4KCkBAIC0xMTEsMTQgKzExNiwx
NyBAQCBzdGF0aWMgdm9pZCBwbXVfbGVnYWN5X2luaXQoc3RydWN0IHJpc2N2X3BtdSAqcG11KQog
ICAgICAgIHBtdS0+Y3RyX3N0b3AgPSBOVUxMOwogICAgICAgIHBtdS0+ZXZlbnRfbWFwID0gcG11
X2xlZ2FjeV9ldmVudF9tYXA7CiAgICAgICAgcG11LT5jdHJfZ2V0X2lkeCA9IHBtdV9sZWdhY3lf
Y3RyX2dldF9pZHg7CiAgICAgICAgcG11LT5jdHJfZ2V0X3dpZHRoID0gTlVMTDsKICAgICAgICBw
bXUtPmN0cl9jbGVhcl9pZHggPSBOVUxMOwogICAgICAgIHBtdS0+Y3RyX3JlYWQgPSBwbXVfbGVn
YWN5X3JlYWRfY3RyOwogICAgICAgIHBtdS0+ZXZlbnRfbWFwcGVkID0gcG11X2xlZ2FjeV9ldmVu
dF9tYXBwZWQ7CiAgICAgICAgcG11LT5ldmVudF91bm1hcHBlZCA9IHBtdV9sZWdhY3lfZXZlbnRf
dW5tYXBwZWQ7CiAgICAgICAgcG11LT5jc3JfaW5kZXggPSBwbXVfbGVnYWN5X2Nzcl9pbmRleDsK
ICsgICAgIHBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BNVV9DQVBfTk9fSU5URVJSVVBU
OworICAgICAgcG11LT5wbXUuY2FwYWJpbGl0aWVzIHw9IFBFUkZfUE1VX0NBUF9OT19FWENMVURF
OwogICAgICAgIHBlcmZfcG11X3JlZ2lzdGVyKCZwbXUtPnBtdSwgImNwdSIsIFBFUkZfVFlQRV9S
QVcpOwogfQoKCgo+IC0tLQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jIHwgOCAr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMKPiBpbmRleCA3OWZkZDY2NzkyMmUuLmExNzllZDZh
Yzk4MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gKysr
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYwo+IEBAIC0zNyw2ICszNywxMiBAQCBz
dGF0aWMgaW50IHBtdV9sZWdhY3lfZXZlbnRfbWFwKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwg
dTY0ICpjb25maWcpCj4gICAgICAgICByZXR1cm4gcG11X2xlZ2FjeV9jdHJfZ2V0X2lkeChldmVu
dCk7Cj4gIH0KPgo+ICsvKiBjeWNsZSAmIGluc3RyZXQgYXJlIGFsd2F5cyA2NCBiaXQsIG9uZSBi
aXQgbGVzcyBhY2NvcmRpbmcgdG8gU0JJIHNwZWMgKi8KPiArc3RhdGljIGludCBwbXVfbGVnYWN5
X2N0cl9nZXRfd2lkdGgoaW50IGlkeCkKPiArewo+ICsgICAgICAgcmV0dXJuIDYzOwo+ICt9Cj4g
KwoKSGF2aW5nIHNhaWQgdGhhdCwgdGhlcmUgaXMgbm8gaGFybSBpbiBkZWZpbmluZyB0aGUgd2lk
dGggZnVuY3Rpb24gZm9yCmxlZ2FjeSBQTVUuClRoZSBjb21tb24gcmlzY3ZfcG11LmMgZml4ZXMg
dGhlIGNvdW50ZXIgd2lkdGggdG8gNjMgaWYgY3RyX2dldF93aWR0aAppcyBub3QgZGVmaW5lZC4g
V2UgbWF5IGJlIHRvIGdldCByaWQgb2YgdGhhdAphcyBib3RoIGRyaXZlcnMgd2lsbCBoYXZlIGEg
dmFsaWQgZnVuY3Rpb24gcG9pbnRlci4KCj4gIHN0YXRpYyB1NjQgcG11X2xlZ2FjeV9yZWFkX2N0
cihzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBod19wZXJm
X2V2ZW50ICpod2MgPSAmZXZlbnQtPmh3Owo+IEBAIC0xMTEsNyArMTE3LDcgQEAgc3RhdGljIHZv
aWQgcG11X2xlZ2FjeV9pbml0KHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiAgICAgICAgIHBtdS0+
Y3RyX3N0b3AgPSBOVUxMOwo+ICAgICAgICAgcG11LT5ldmVudF9tYXAgPSBwbXVfbGVnYWN5X2V2
ZW50X21hcDsKPiAgICAgICAgIHBtdS0+Y3RyX2dldF9pZHggPSBwbXVfbGVnYWN5X2N0cl9nZXRf
aWR4Owo+IC0gICAgICAgcG11LT5jdHJfZ2V0X3dpZHRoID0gTlVMTDsKPiArICAgICAgIHBtdS0+
Y3RyX2dldF93aWR0aCA9IHBtdV9sZWdhY3lfY3RyX2dldF93aWR0aDsKPiAgICAgICAgIHBtdS0+
Y3RyX2NsZWFyX2lkeCA9IE5VTEw7Cj4gICAgICAgICBwbXUtPmN0cl9yZWFkID0gcG11X2xlZ2Fj
eV9yZWFkX2N0cjsKPiAgICAgICAgIHBtdS0+ZXZlbnRfbWFwcGVkID0gcG11X2xlZ2FjeV9ldmVu
dF9tYXBwZWQ7Cj4gLS0KPiAyLjM0LjEKPgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
