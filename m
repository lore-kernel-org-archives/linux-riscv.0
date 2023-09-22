Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE51CD4F5F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iUABwf7sh1pR7fpzTHwTnjUzKlMrFJu3+SA9f5xaWo=; b=P9Ctd2JCCD4eYB
	xDNsIAkbq39s/q2vRHoi98v03X3h79Lgn1Dv5ToJkjGOhq6PC0mOcUYh7bIc3Kv23m8QxH/zn9c34
	dbSnEVgvUxl7VbuRfnTMTyHZnSDIFuFpxQQHuN9QSAfPEuqbSbj/LRDFZpP7x9CF6Pv5UN0snNxpp
	UnZ3WP8ixRI8Y8QuQ+naqdjl6Cusi3QPy3xcUQMWyckIAO1dNwulAFLv5AEB7jXnWhCUAr4S43VA6
	6oz17qXcAvkF0bUBp95N+2wbEwz3vI2/UpEnHLsD6oV4Hf42VqtmqUiFl7Q4wYPmZQ44dwXqEk5Pf
	6DDW1WYU6vaaEpjv63xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeVA-008yaW-0u;
	Fri, 22 Sep 2023 11:39:16 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeV8-008yZo-0X
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 11:39:15 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-76f2843260bso124599885a.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 04:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695382751; x=1695987551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tm7XbhqrREfex0ytvkwvNzO/WSxEY4k2Px8GYpsFrQ=;
        b=Rdc5OpeG4wxl4Vo9a2NOomCYot/2DWI1mOeYrPzfkQJZ06bFnaz4fFrSSsV2z2GP1F
         6HDZB1CDHsuuTNJy3zuHxt8YEUBGEhcODnqpj9TAJILJlCWJZ3HzgZoZdCV+MrSNGk8j
         /0tOU1eX80ThHCOdYZl/guDLMLR7DLzhJFqylorNhQwxJC29AzqZbgq/w3mCxCC1s7RM
         5iLDTSCai71IZIsbOzAQI9zUToamk25OSXmt8e4ywEDDKXnQCDwnOFfxJO/Rd40XXLAA
         FQd+YaiXXE5F3x8ekJg2KOtxaQ62QUzione2nanl1TVrd+C4kULDf0GX2qejdapiAvgO
         ULHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695382751; x=1695987551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tm7XbhqrREfex0ytvkwvNzO/WSxEY4k2Px8GYpsFrQ=;
        b=pumwcfaIEClQUDzi6QvFoM3FzQCPvxife6Rw9gBC447x9neRWIKDlyB/ABPZpNoWrd
         USbDhjIWa68b8Wcmu6cp7qO47m88HOZZSy5+ipE916Rr0B4ROLUYnCCXKoax3220SsFQ
         Yb9G0jQsydiDk+FgmLQwISdz5YHCKV1oyvGGnNGcjP/tjf4ZYZN5OKlHE+hvHUFCZwoP
         HAyaReHDLrjqpUE/It7+v/zVPBD885WN9t1JxAuAGTni4SIaX226emYgGnB145xbDKC0
         wfmwbIC50/4Nu3Mi9rWLc3DP5b7n6IL/v30HPHQ76UBbueZcAB7cSMkFfKos6OzPach4
         z7Kg==
X-Gm-Message-State: AOJu0YzF+VNWrtHo3PyFpGe9WD/8yVsvFAYBnAmxP2Td/ygeV2GxZ/bI
	kExRaKjQ5ajiEnPZxn5FozMBnvgxLaTL52xoehQ=
X-Google-Smtp-Source: AGHT+IFUD+NAk7EJFLAY4i8dlt8iE7k/F5MqrBgkE1rslaS0JQAk9KmeJa4tIqMTftJPGvv5PxMYCxA/MjVi8bpCpAU=
X-Received: by 2002:a0c:cb10:0:b0:64f:3699:90cd with SMTP id
 o16-20020a0ccb10000000b0064f369990cdmr7318620qvk.42.1695382750882; Fri, 22
 Sep 2023 04:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
 <bcdc4623-a37e-455b-8f10-c539e2b04554@codethink.co.uk> <CAJM55Z_o7Z8HhaUjrSqjxy1cPjud9Q3GrdqjgFThToxxOCrkgw@mail.gmail.com>
In-Reply-To: <CAJM55Z_o7Z8HhaUjrSqjxy1cPjud9Q3GrdqjgFThToxxOCrkgw@mail.gmail.com>
From: Chen Wang <unicornxw@gmail.com>
Date: Fri, 22 Sep 2023 19:39:00 +0800
Message-ID: <CAHAQgRCiAvvowhv095cm5X4aDUhJSr7j92a84KJto40Cj4wd-w@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_043914_201566_BB3878D7 
X-CRM114-Status: GOOD (  12.16  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVy
dGhpbmdAY2Fub25pY2FsLmNvbT4g5LqOMjAyM+W5tDnmnIgyMuaXpeWRqOS6lCAxODo0MOWGmemB
k++8mgo+Cj4gQmVuIERvb2tzIHdyb3RlOgo+ID4gT24gMjAvMDkvMjAyMyAwNzo0MCwgQ2hlbiBX
YW5nIHdyb3RlOgo+ID4gPiBGcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIu
YmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiA+ID4KPiA+ID4gQWRkIHF1aXJrIHRvIHNraXAgc2V0
dGluZyB0aGUgaW5wdXQgY2xvY2sgcmF0ZSBmb3IgdGhlIHVhcnRzIG9uIHRoZQo+ID4gPiBTb3Bo
Z28gU0cyMDQyIFNvQyBzaW1pbGFyIHRvIHRoZSBTdGFyRml2ZSBKSDcxMDAuCj4gPgo+ID4gSSdk
IGxvdmUgYW4gYWN0dWFsIGV4cGxhbmF0aW9uIG9mIHdoeSB0aGlzIGlzIG5lY2Vzc2FyeSBoZXJl
Lgo+Cj4gTWFrZXMgc2Vuc2UuIEZvciB0aGUgSkg3MTAwIHRoZSBjb21taXQgbWVzc2FnZSBpczoK
Pgo+ICAgT24gdGhlIFN0YXJGaXZlIEpINzEwMCBSSVNDLVYgU29DIHRoZSBVQVJUIGNvcmUgY2xv
Y2tzIGNhbid0IGJlIHNldCB0bwo+ICAgZXhhY3RseSAxNiAqIDExNTIwMEh6IGFuZCBtYW55IG90
aGVyIGNvbW1vbiBiaXRyYXRlcy4gVHJ5aW5nIHRoaXMgd2lsbAo+ICAgb25seSByZXN1bHQgaW4g
YSBoaWdoZXIgaW5wdXQgY2xvY2ssIGJ1dCBsb3cgZW5vdWdoIHRoYXQgdGhlIFVBUlQncwo+ICAg
aW50ZXJuYWwgZGl2aXNvciBjYW4ndCBjb21lIGNsb3NlIGVub3VnaCB0byB0aGUgYmF1ZCByYXRl
IHRhcmdldC4KPiAgIFNvIHJhdGhlciB0aGFuIHRyeSB0byBzZXQgdGhlIGlucHV0IGNsb2NrIGl0
J3MgYmV0dGVyIHRvIHNraXAgdGhlCj4gICBjbGtfc2V0X3JhdGUgY2FsbCBhbmQgcmVseSBzb2xl
bHkgb24gdGhlIFVBUlQncyBpbnRlcm5hbCBkaXZpc29yLgo+Cj4gQENoZW4gV2FuZyBpcyB0aGlz
IGFsc28gdHJ1ZSBmb3IgdGhlIFNHMjA0Mj8KPgo+IC9FbWlsCgpFbWlsICYgQmVuLApJIG5lZWQg
dG8gZG91YmxlLWNvbmZpcm0gdGhpcyB3aXRoIHNvcGhnbyBlbmdpbmVlcnMuIEJlY2F1c2UgdGhl
eSBhcmUKb2ZmIHdvcmsgbm93LCBJIHdpbGwgcHJvYmFibHkgZ2V0IGJhY2sgdG8geW91IGxhdGVy
IG5leHQgd2Vlay4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
