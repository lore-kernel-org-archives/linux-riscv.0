Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B6EC54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73zuteA0Il2c+AuLYf4Oc7l3d0ZpUyHLdBTSjbpaxT0=; b=djUv3XCZZNJ0pf
	E7Nc1LNtFJiLsnMeHSffgRTrPfbCsUjdROnPdKy5GPjchysDmVhCskPOelgFckgoZwMLsWLszb3K3
	DO4DUPc/ui5vcziE7MraxlpnX+iz7IRwJUtk9ZkQD2LcpOcKtKjzr6jlevZFxuTClNlSCpFCd/QqK
	0XsXMUsbNTdJia9Y3eeGezm5hH06RzEw5pKy8jWB7tW7+niWao7BUIN3Efq3EabbIvpmIV+QAWUp7
	ads+1sILXalSowgLzuhTciWmG94UMSdgYmz6GAf3sDEuqR+nE6g0FKUH3R12QLvRlAj4Db8PJf4PG
	Nmb4yppW2UKIbiRxS+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfg4P-0000000DadA-3zwz;
	Thu, 29 Feb 2024 13:03:29 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfg4N-0000000Dac2-1xOk
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 13:03:28 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso895397276.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 05:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709211806; x=1709816606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7BfAiS0dMbweRAkXE/17W2K80r1DmpgC/baihcoMn4=;
        b=k0NmaFx8Y4XEK58Vgmy2110hWy1AElpaC/qY3lbCUmoZmG+vlKFlT9EDN8TfW/zr9Z
         ylNNWAE9LbN5q7dtNEwuP2UmwJZCa2LMOZvis26znltv8ujSEKFmEOWyROmrAReBgcT+
         e1bxWe7EpkyQ8ccpPWFmtk+ExQLA+BKQ9PUUY3AvKIwnjtxmnlkl43slhWeohTqJZEtM
         9PegZ8/BCiAu4On5BGV5TPetK61hBj0DS2+cKXxB07ARvD35oicD5XoO9vv7gyTNlVCz
         pvrqboLQKAT4TBzVyvyn5dHS3wHoh8gCbvSCfcayxf2wONrN/J5v726Cwa3pzm8x+EGT
         M2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709211806; x=1709816606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7BfAiS0dMbweRAkXE/17W2K80r1DmpgC/baihcoMn4=;
        b=VnxmYIIhlqU/qlkJSa07H0PXkNr2I+8zzXC327BJ3Z0Ex0PsANmxT37AlvWQZmqczk
         3nm7tm31j8Ir/0DtuhAdXJbbW7XdFirjS5YMYlL5XXfyII35pC0B3V/du5yJcsk5ycTS
         Lq6Xdd48SM7nCULFqSDS50l4O30pM4EXuyhVbag8+ORRGwaq8DTS8K5T2jxhliUVycoB
         fZq5lQ5iWOfLGcn+3EzKyk0p0jlUvJW4hynPxz4FU3Lq4LeqBL1RhnJ7l5kpVkTolijE
         z45FtZgF7slU4Xz7gAT4CuNFCvGCK/2BQIbGiM7EZVN/zoZpXiFCP8ME5DgNn6zZp3/M
         /AXA==
X-Forwarded-Encrypted: i=1; AJvYcCW6bIWObL/RvUWkhIqiAe6eLKQKAtp0JTcDqPVq4y72Yya6nTZJpaqZ0dQOK2IIk7n6c4ewPg2poRXW33Y++2mmypjbR+Gy67tK8icLhXcN
X-Gm-Message-State: AOJu0Yyrs1V+SYwo9V1Z/2Y0Hlyb2wSFZ8bQmyALU+dJZ0FPj/Wx62Q7
	ncR96xFWv6kkbNz0ZtCZpOLinfnYsJVexctJKi54lUqRvUn15Xcy2cd+cUd0xzwmLxvBTu4P0rb
	mvUhFY690vdCrCowBTxIUG3PcDbLDgyblk1DQ1g==
X-Google-Smtp-Source: AGHT+IHQz42wX2mAaaw9ho5RQMq4VSD4ZFqcEz4aryLKKrd9HwtJCvam+GQvCM1L9WJW5tUmbAJLU5/+2pI5vohfiqc=
X-Received: by 2002:a25:ce02:0:b0:dcf:9019:a2fe with SMTP id
 x2-20020a25ce02000000b00dcf9019a2femr1786280ybe.64.1709211806087; Thu, 29 Feb
 2024 05:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com> <20240220064246.467216-3-yuklin.soo@starfivetech.com>
In-Reply-To: <20240220064246.467216-3-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:03:14 +0100
Message-ID: <CACRpkdZd9WuLmvBEjEOF5R+R8Yrva_KiEPRCOXU98yLDkS=+ZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] pinctrl: starfive: jh8100: add main and
 sys_east driver
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
X-CRM114-CacheID: sfid-20240229_050327_611434_3E75315D 
X-CRM114-Status: GOOD (  18.72  )
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

VGhhbmtzIEFsZXgsCgp0aGlzIG5ldyB2ZXJzaW9uIGlzIG11Y2ggaW1wcm92ZWQhCgpPbiBUdWUs
IEZlYiAyMCwgMjAyNCBhdCA3OjQz4oCvQU0gQWxleCBTb28gPHl1a2xpbi5zb29Ac3RhcmZpdmV0
ZWNoLmNvbT4gd3JvdGU6Cgo+IEFkZCBKSDgxMDAgcGluY3RybCBtYWluIGFuZCBzeXNfZWFzdCBk
b21haW4gZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBTb28gPHl1a2xpbi5zb29Ac3Rh
cmZpdmV0ZWNoLmNvbT4KClRoaXMgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGF0IGxlYXN0IGV4cGxh
aW4gd2hhdCB3ZSBhcmUgYWRkaW5nIGhlcmUsCnRoYXQgaXQncyBhIGNvcmUgZHJpdmVyIHRoYXQg
d2lsbCBiZSB1c2VkIGJ5IGFsbCB0aGUgZG9tYWlucywgd2hhdCB0aGUKU29DIGlzIGV0YyBldGMu
Cgo+ICsgICAgICAgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUAooLi4uKQo+ICsjaW5jbHVkZSAiLi4v
Y29yZS5oIgo+ICsjaW5jbHVkZSAiLi4vcGlubXV4LmgiCj4gKyNpbmNsdWRlICIuLi9waW5jb25m
LmgiCgpEbyB5b3UgcmVhbGx5IG5lZWQgdG8gcG9rZSBhcm91bmQgaW4gdGhlIGludGVybmFscyBs
aWtlIHRoaXM/CgpQbGVhc2UgZXhwbGFpbiBmb3IgZWFjaCBjcm9zcy1pbmNsdWRlICp3aHkqIHlv
dSBuZWVkIHRvIGRvIHRoaXMuCgo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdGFyZml2ZS9waW5j
dHJsLXN0YXJmaXZlLWpoODEwMC5jCiguLi4pCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+
CgpOZXZlciB1c2UgdGhpcyBpbmNsdWRlLiBJdCBpcyBsZWdhY3kgYW5kIHlvdSBzaG91bGQgbm90
IGJlIHVzaW5nCml0LiBVc2UgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4gc29sZWx5LiBTZWUgY29t
bWVudHMgYmVsb3cuCgo+ICsjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgoKV2h5
PwoKPiArI2luY2x1ZGUgIi4uL2NvcmUuaCIKPiArI2luY2x1ZGUgIi4uL3BpbmN0cmwtdXRpbHMu
aCIKPiArI2luY2x1ZGUgIi4uL3Bpbm11eC5oIgo+ICsjaW5jbHVkZSAiLi4vcGluY29uZi5oIgoK
QWdhaW4gYWxsIHRoaXMuIEV4cGxhaW4gZm9yIGVhY2ggb25lIGV4YWN0bHkgd2h5IHlvdSBuZWVk
IHRoaXMuCgo+ICtzdGF0aWMgaW50IGpoODEwMF9ncGlvX2lycV9zZXR1cChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBqaDgxMDBfcGluY3RybCAqc2ZwKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+ICsgICAgICAgc3RydWN0IGdwaW9faXJx
X2NoaXAgKmdpcnEgPSAmc2ZwLT5nYy5pcnE7Cj4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19kZXNjICpn
cGlvZDsKPiArICAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYzsKPiArICAgICAgIGlycV9od19u
dW1iZXJfdCBod2lycTsKPiArICAgICAgIGludCBpLCByZXQ7Cj4gKyAgICAgICBpbnQgZGlyOwo+
ICsKPiArICAgICAgIGlmICghZ2lycS0+ZG9tYWluKSB7Cj4gKyAgICAgICAgICAgICAgIHNmcC0+
aXJxX2RvbWFpbiA9IGlycV9kb21haW5fYWRkX2xpbmVhcihucCwgc2ZwLT5nYy5uZ3BpbywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZp
cnFfZG9tYWluX3NpbXBsZV9vcHMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzZnApOwoKV2hlbiB3b3VsZCB0aGlzIGhhcHBlbj8gSSBk
b24ndCBxdWl0ZSBnZXQgaXQuCgpJdCBsb29rcyBsaWtlIGEgcHJvYmUgb3JkZXIgaXNzdWUgb3Ig
c29tZXRoaW5nLgoKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHNmcC0+aXJx
X2RvbWFpbiA9IGdpcnEtPmRvbWFpbjsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIXNm
cC0+aXJxX2RvbWFpbikgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkNvdWxkbid0
IGFsbG9jYXRlIElSUSBkb21haW5cbiIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOWElP
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBzZnAtPmdjLm5ncGlv
OyBpKyspIHsKPiArICAgICAgICAgICAgICAgaW50IHZpcnEgPSBpcnFfY3JlYXRlX21hcHBpbmco
c2ZwLT5pcnFfZG9tYWluLCBpKTsKPiArCj4gKyAgICAgICAgICAgICAgIGlycV9zZXRfY2hpcF9h
bmRfaGFuZGxlcih2aXJxLCAmamg4MTAwX2lycV9jaGlwLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaGFuZGxlX2VkZ2VfaXJxKTsKPiArICAgICAgICAgICAgICAg
aXJxX3NldF9jaGlwX2RhdGEodmlycSwgJnNmcC0+Z2MpOwo+ICsgICAgICAgfQoKVGhpcyBkdXBs
aWNhdGVzIGNvcmUgZ3Bpb2xpYiBpcnFjaGlwIGhhbmRsaW5nLCB3aGljaCB5b3Ugc2VsZWN0IHVz
aW5nCnNlbGVjdCBHUElPTElCX0lSUUNISVAuCgpDYW4geW91IHBsZWFzZSBsb29rIGludG8ganVz
dCB1c2luZyB0aGUgZ3Bpb2xpYiBpcnFjaGlwIGhhbmRsaW5nPwoKPiArICAgICAgIHNmcC0+d2Fr
ZXVwX2dwaW8gPSBvZl9nZXRfbmFtZWRfZ3BpbyhucCwgIndha2V1cC1ncGlvcyIsIDApOwoKTm8g
dXNpbmcgPGxpbnV4L29mX2dwaW8uaD4gcGxlYXNlLgoKVXNlIGp1c3QgPGxpbnV4L2dwaW8vY29u
c3VtZXIuaD4gYW5kIHNvbWV0aGluZyBsaWtlOgoKc3RydWN0IGdwaW9fZGVzYyAqd2FrZXVwOwp3
YWtldXAgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJ3YWtldXAiLCBHUElPRF9JTik7
Cgo+ICsgICAgICAgaWYgKGdwaW9faXNfdmFsaWQoc2ZwLT53YWtldXBfZ3BpbykpIHsKPiArICAg
ICAgICAgICAgICAgaHdpcnEgPSBwaW5fdG9faHdpcnEoc2ZwKTsKPiArICAgICAgICAgICAgICAg
c2ZwLT53YWtldXBfaXJxID0gaXJxX2ZpbmRfbWFwcGluZyhzZnAtPmlycV9kb21haW4sIGh3aXJx
KTsKPiArICAgICAgICAgICAgICAgZGVzYyA9IGlycV90b19kZXNjKHNmcC0+d2FrZXVwX2lycSk7
CgppZiAod2FrZXVwKSB7CiAgICAgaXJxID0gZ3Bpb2RfdG9faXJxKHdha2V1cCk7CiAgICAgLi4g
Y29udmVydCB0byBpcnEgZGVzY3JpcHRvciBldGMuLi4KCkFjdHVhbGx5OiBpcyB0aGlzIHdha2V1
cCBoYW5kbGluZyBzb21ldGhpbmcgd2Ugd291bGQgbGlrZSB0byBhZGQKdG8gdGhlIGdwaW9saWIg
aXJxY2hpcCBzbyBldmVyeW9uZSBjYW4gcmV1c2UgaXQ/CkluIGdwaW9jaGlwX2FkZF9pcnFjaGlw
KCk/CkF0IGxlYXN0IGdpdmUgaXQgYSB0aG91Z2h0LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
