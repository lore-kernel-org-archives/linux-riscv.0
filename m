Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14790C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqzSAgLOMkRZ6RbAF71rwvoycjO3dYxThETXlchCgFg=; b=lvRxf2TbiBSl50
	dMivT4lhLsnEKKOf3dfJ4pqtKyhWgSaAGGKPVqqWnOCPmvR01sXoIM3Czd4h58o2J6z8FfKbZjwgz
	KZs8k0yxIgqf2zJs3+mhSPBYgk7HmL1/nI7Qz/H30VEglXhO1b/fPJF98u/WcC2Gri0ahwNgrA3ap
	HPXmGCy3hXKI78kHLDSuP5X+M3gYUjPVknwkRvbbOqh6hMzCVYeZ76qUoAaxd6eylZIllGS60E4uh
	ppVgpuNQSV+DIfSH23l5uJqBZo0x+21B8+31o7zrv2CmVcnBS31RI4teACvl+Bf7xyUUQhkFfE9Nk
	stGMkZ7TVTr8kKx6xA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsBC-00000008OsK-3XSV;
	Sat, 27 Jan 2024 23:33:42 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsB9-00000008Orq-3GUy
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 23:33:41 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dc22ae44595so1807846276.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398417; x=1707003217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjk5TjN3e4CujJkcyDdIuVVrZ16DzmScuHfifhjJf3w=;
        b=NF5CubFtlIW23+pAWT8Lyvk4Y8qVxfpWW2g/CFJB20N77jeFXxtFC3UEFo/HFkzU78
         GA9qmcwncF2l+mYLRvv3qT9Jg+E2Yp/o/+/kPJbYwPaIwqjx+3ZAxdvpeW45cAiP9yLu
         5Lz9IjZLw+a/Dw5dlGc5WkC9wuh7j2iLkENxHcKKk0TVFqfEXXNlvliSyPc3La5gBloT
         CvxnHiHSMNEL2A65VKns0xwAJOBTCQ6IWGJOBq4PsEs/aDzvtBcMC5igcolI7Pp+Go0K
         z9ubu2jrZhAnNIGtY5+w7KfeLjqLySoiTpwNP6Uadbpe7DoW0Q6KlfHqM1fj97iQd88n
         7C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398417; x=1707003217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjk5TjN3e4CujJkcyDdIuVVrZ16DzmScuHfifhjJf3w=;
        b=UCRWqnpLl7ATPKmhd0XVDnHOFVr1r8T79UdWJGXfXF0gJH3oIsFeGaBWnv2gRj2srI
         8gWXZma7sq8V25G/nkflsbtH5ZmdDMlHCyTODpCob6bIIqlpOJuDGcLEKr5TSehDXk/Y
         dXNKQYe5m4URE417VLhI55sGp0rhb1TeePiFF6y33RDuEnYBsTIOO7dBbwQoA/kjaeqD
         cvURJzOyQ/ibFWS57WqzZtQzp5uj+cyUvyurUvc4uRwB51PpLcB+vaimtTEKW2KluJOf
         7F/xbHgnWyHvWYVVf9SRFKQ+qypimgj8mmP2kqixPxbWdx5v17/i2OIVMOL8f6dSTWac
         2e8g==
X-Gm-Message-State: AOJu0Yw2kN7hEVRwEGdLvw9UAGyQDxmBxwqEhiwaWuEBNeT+o9agzcxv
	kfVoqOo3IZC36fl9CEd5yL1PmqVQttjsRq+Ar/M+33gVBSM9FyzYQ6hCVDP1yqzRDzwk/LYk//r
	H5GEl4yggN1jiEFhjJy+DaKFRIKpKuWB24FyGuQ==
X-Google-Smtp-Source: AGHT+IE4dcccCEbQeihI3WL932A84/O0oOrLVoFknlXg47wcDttREAsCbLva8RomwckZu+AizukRocf64P6phpkxwtk=
X-Received: by 2002:a81:b666:0:b0:603:414b:d357 with SMTP id
 h38-20020a81b666000000b00603414bd357mr1755803ywk.52.1706398417533; Sat, 27
 Jan 2024 15:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com> <20231221083622.3445726-3-yuklin.soo@starfivetech.com>
In-Reply-To: <20231221083622.3445726-3-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:33:26 +0100
Message-ID: <CACRpkdagPYfSq91dXOTJ9d8VjCMMG2AN3L9-Qxdw3C8tki09EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] pinctrl: starfive: jh8100: add pinctrl driver for
 sys_east domain
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
X-CRM114-CacheID: sfid-20240127_153339_878686_632FABAF 
X-CRM114-Status: GOOD (  18.17  )
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
Cj4gQWRkIHBpbmN0cmwgZHJpdmVyIGZvciBzeXNfZWFzdCBkb21haW4uCgpUaGlzIGNvbW1pdCBt
ZXNzYWdlIGlzIHdyb25nLCBpdCBhbHNvIGNvbnRhaW5zIHRoZSBtYWluIGRyaXZlciBmb3Igamg4
MTAwLgpQbGVhc2UgYWRkIHNvbWUgcHJvcGVyIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlLgoK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRlY2guY29tPgo+
IFJldmlld2VkLWJ5OiBMZXkgRm9vbiBUYW4gPGxleWZvb24udGFuQHN0YXJmaXZldGVjaC5jb20+
CiguLi4pCj4gKyNkZWZpbmUgcGluX3RvX2h3aXJxKHNmcCkgKCgoc2ZwKS0+d2FrZXVwX2dwaW8p
IC0gKChzZnApLT5nYy5iYXNlKSkKClBsZWFzZSBkbyBub3QgcmVmZXJlbmNlIGdjLmJhc2UgbGlr
ZSB0aGlzLCBpdCBpcyBhIGdwaW8gaW50ZXJuYWwgZGV0YWlsLgoKQWxzbywgdHVybiB0aGlzIGlu
dG8gYSBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uLCB0aGUgbWFjcm8gaXMgaGFyZCB0byByZWFkLgoK
PiArLyogcGFkIGNvbnRyb2wgYml0cyAqLwo+ICsjZGVmaW5lIEpIODEwMF9QQURDRkdfUE9TICAg
ICAgQklUKDcpCj4gKyNkZWZpbmUgSkg4MTAwX1BBRENGR19TTVQgICAgICBCSVQoNikKPiArI2Rl
ZmluZSBKSDgxMDBfUEFEQ0ZHX1NMRVcgICAgIEJJVCg1KQo+ICsjZGVmaW5lIEpIODEwMF9QQURD
RkdfUEQgICAgICAgQklUKDQpCj4gKyNkZWZpbmUgSkg4MTAwX1BBRENGR19QVSAgICAgICBCSVQo
MykKPiArI2RlZmluZSBKSDgxMDBfUEFEQ0ZHX0JJQVMgICAgIChKSDgxMDBfUEFEQ0ZHX1BEIHwg
Skg4MTAwX1BBRENGR19QVSkKCkpIODEwMF9QQURDRkdfQklBU19NQVNLCgo+ICsjZGVmaW5lIEpI
ODEwMF9QQURDRkdfRFNfTUFTSyAgR0VOTUFTSygyLCAxKQo+ICsjZGVmaW5lIEpIODEwMF9QQURD
RkdfRFNfMk1BICAgKDBVIDw8IDEpCj4gKyNkZWZpbmUgSkg4MTAwX1BBRENGR19EU180TUEgICBC
SVQoMSkKPiArI2RlZmluZSBKSDgxMDBfUEFEQ0ZHX0RTXzhNQSAgICgyVSA8PCAxKQo+ICsjZGVm
aW5lIEpIODEwMF9QQURDRkdfRFNfMTJNQSAgKDNVIDw8IDEpCgpQbGVhc2UgdXNlICgxVSA8PCAx
KSBmb3IgNE1BLCB0aGlzIGxvb2tzIHdlaXJkIG90aGVyd2lzZS4KCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgcGluY29uZl9vcHMgamg4MTAwX3BpbmNvbmZfb3BzID0gewo+ICsgICAgICAgLnBpbl9j
b25maWdfZ2V0ICAgICAgICAgPSBqaDgxMDBfcGluY29uZl9nZXQsCj4gKyAgICAgICAucGluX2Nv
bmZpZ19ncm91cF9nZXQgICA9IGpoODEwMF9waW5jb25mX2dyb3VwX2dldCwKPiArICAgICAgIC5w
aW5fY29uZmlnX2dyb3VwX3NldCAgID0gamg4MTAwX3BpbmNvbmZfZ3JvdXBfc2V0LAo+ICsgICAg
ICAgLnBpbl9jb25maWdfZGJnX3Nob3cgICAgPSBqaDgxMDBfcGluY29uZl9kYmdfc2hvdywKPiAr
ICAgICAgIC5pc19nZW5lcmljICAgICAgICAgICAgID0gdHJ1ZSwKPiArfTsKPiArCj4gK3N0YXRp
YyBpbnQgamg4MTAwX2dwaW9fcmVxdWVzdChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQg
aW50IGdwaW8pCj4gK3sKPiArICAgICAgIHJldHVybiBwaW5jdHJsX2dwaW9fcmVxdWVzdChnYywg
Z3Bpbyk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGpoODEwMF9ncGlvX2ZyZWUoc3RydWN0IGdw
aW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvKQo+ICt7Cj4gKyAgICAgICBwaW5jdHJsX2dw
aW9fZnJlZShnYywgZ3Bpbyk7Cj4gK30KClNraXAgb25lIGxldmVsIG9mIGluZGlyZWN0aW9uLCBq
dXN0IGFkZCBwaW5jdHJsX2dwaW9fcmVxdWVzdC9mcmVlIGRpcmVjdGx5CmludG8gdGhlIHZ0YWJs
ZS4KCj4gK3N0YXRpYyBpbnQgamg4MTAwX2dwaW9fc2V0X2NvbmZpZyhzdHJ1Y3QgZ3Bpb19jaGlw
ICpnYywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGdw
aW8sIHVuc2lnbmVkIGxvbmcgY29uZmlnKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgamg4MTAwX3Bp
bmN0cmwgKnNmcCA9IGNvbnRhaW5lcl9vZihnYywKPiArICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgamg4MTAwX3BpbmN0cmwsIGdjKTsKPiArICAgICAgIHUzMiBhcmcgPSBwaW5jb25mX3Rv
X2NvbmZpZ19hcmd1bWVudChjb25maWcpOwoKUGxlYXNlIGRvbid0IHJlaW1wbGVtZW50IC5zZXRf
Y29uZmlnLCBqdXN0IGNhbGwgaW50byB0aGUgcGluY3RybApiYWNrZW5kIHVzaW5nCgouc2V0X2Nv
bmZpZyA9IGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnCgo+ICtzdGF0aWMgaW50IGpoODEwMF9ncGlv
X2FkZF9waW5fcmFuZ2VzKHN0cnVjdCBncGlvX2NoaXAgKmdjKQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qgamg4MTAwX3BpbmN0cmwgKnNmcCA9IGNvbnRhaW5lcl9vZihnYywKPiArICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgamg4MTAwX3BpbmN0cmwsIGdjKTsKPiArCj4gKyAgICAgICBzZnAt
PmdwaW9zLm5hbWUgPSBzZnAtPmdjLmxhYmVsOwo+ICsgICAgICAgc2ZwLT5ncGlvcy5iYXNlID0g
c2ZwLT5nYy5iYXNlOwo+ICsgICAgICAgc2ZwLT5ncGlvcy5waW5fYmFzZSA9IDA7Cj4gKyAgICAg
ICBzZnAtPmdwaW9zLm5waW5zID0gc2ZwLT5nYy5uZ3BpbzsKPiArICAgICAgIHNmcC0+Z3Bpb3Mu
Z2MgPSAmc2ZwLT5nYzsKPiArICAgICAgIHBpbmN0cmxfYWRkX2dwaW9fcmFuZ2Uoc2ZwLT5wY3Rs
LCAmc2ZwLT5ncGlvcyk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQoKV2h5IGFyZSB5b3Ugbm90
IHB1dHRpbmcgdGhlIHJhbmdlcyBpbnRvIHRoZSBkZXZpY2UgdHJlZSB3aGVyZSB0aGUKR1BJTyBj
b3JlIHdpbGwgYWRkIHRoZW0gZm9yIHlvdT8KCj4gKyAgICAgICBpZiAoaW5mby0+aXJxX3JlZykg
ewo+ICsgICAgICAgICAgICAgICBqaDgxMDBfaXJxX2NoaXAubmFtZSA9IHNmcC0+Z2MubGFiZWw7
CgpUaGF0J3Mgbm90IGltbXV0YWJsZS4gVGhlIHN0cnVjdCBzaG91bGQgYmUgY29uc3QuCllvdSBo
YXZlIHRvIHVzZSAuaXJxX3ByaW50X2NoaXAgaW4gdGhlIGlycV9jaGlwLgoKPiArICAgICAgICAg
ICAgICAgZ3Bpb19pcnFfY2hpcF9zZXRfY2hpcCgmc2ZwLT5nYy5pcnEsICZqaDgxMDBfaXJxX2No
aXApOwoKVXNlIHRoZSBjb252ZW50aW9uOgoKc3RydWN0IGdwaW9faXJxX2NoaXAgKmdpcnE7Cgpn
aXJxID0gJmNoaXAtPmlycTsKZ3Bpb19pcnFfY2hpcF9zZXRfY2hpcChnaXJxLCAmbm1rX2lycV9j
aGlwKTsKCi4uLiBhbmQgdXNlIGdpcnEtPiBpbiB0aGUgcmVzdCBvZiB0aGUgYXNzaWdubWVudHMu
Cgo+ICsgICAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsICJTdGFyRml2ZSBHUElPIGNoaXAgcmVn
aXN0ZXJlZCAlZCBHUElPc1xuIiwgc2ZwLT5nYy5uZ3Bpbyk7CgpTdGFyRml2ZSBKSDgxMDAgKGJl
IHByZWNpc2UpCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
