Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5DBC369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhCz4NbRuraJseCX5IKt4nINtBljxzCjr9YBu93NKSY=; b=R/qpMNIEyjbBpG
	M/wCr0UV8SgBLim82Iu27M/YTgjoiFOQ0ND71gBl7bkfey77Wz8ia9EkaKA4rX4iqL1RzwnErzofs
	tL4iXeg+U0m5ZZBZsaacP7maLC16H9sMPD6h+y5V2Vknr6oH1Y8CE0e5do2Er1IEMaKCqFFif8jUe
	WIK/Y15dpbpbM9j7V91WDHVw3ObZAgRH7p43o7u8ZVp4Dxj9Ii6UTjfgpm+feCpt45xhDHHyWc1uY
	PcK70jA7TjhHP8m9kDFzhcaUcrOTZAmLBM2ZqOcW65rKJIT5MIb5mXzqJ0+x4jkWGR29lA0NQRjBo
	n6fXbeEeRJ6kz4RYXg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3S5K-0000000FNcX-0IJK;
	Sat, 12 Apr 2025 04:03:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3S5H-0000000FNbn-1LR0
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 04:03:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso4158653a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430590; x=1745035390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=OMqhDB9r3RC3Y4gh4Y7UTg47ucqmtrPKBx/9lUtv5+rEntlek+HyoMN3xjqKHXn/y9
         RbepSw+IqWRTio1nUNeoI5MSleqe0z8NN0Zsmcb+fVDCX+53Bo13B5BC2OU1O0p7pU43
         rwglsYdlctVhmOwaG5GBooILGbKIwft2uYhF24VatEaJlhOh6ZVu/NHTN3b2ttg3zB07
         MBhXBLKUomNCvYD1zXvcaUoJoCpz+XIKGS6CO2YyD9eWj0lTXMXI7Cs1GXWxBDfexcH0
         FlBEJhZLvHUBBDCXdiJGNgUXJWdPOtz5QSAMqIpEL99kTLqnz8rmU+AUHVxw18eseXBx
         cgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430590; x=1745035390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=b6qLs0UhAZQJqWVeczkCWBe7yep3bFWkS3qEAaqWhzzV4AXTl4MJoGei0hAqKGDycA
         6TQhc5w+FMx96NfryUwNQKQXYKn2PBKecWtGpJZvGwuf0pwS7tPSz2VO8A0U3SkWRZjz
         3XpWEFryCj+NkeRj9O36I4bolXO/BoaozuDX61YNHkog/Do8Q5wrp/NlIBR3/bRM2Bcw
         D3YGdx/6D00vfG22UVJYFf88GuBgpDBUgDwlKi2vlvFKbDwGjeMYoxQs/anOWqdqZfui
         IN8ub5a2x0ZePHktfkJ5XDcpg4ZEoE/6H0dOEymNBXQi7znzu655NcMbv8ryDzDVJ8rl
         G7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVtaq0BOMod3Vr4YhQQeg+kil/tfDtzmrk6LI0DpFKhynm5Ag4kAbFtN3ZrV0UygAJrDtxYIT3gGOJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbPwQzNy3ySBSVSp/ulIVc75NFZ6surmqVLY222cuc8JhIgdVl
	xHPTrUJoke8Ra9xxECuiGUOZX6l6Fxfhax7DpIspPBu8jP16gpR9MPp7k1K/phM+LpWA/JGfjBq
	lV8NPupfC2hmToEWDMdy8ePnebpXeA7LETRe+Jg==
X-Gm-Gg: ASbGnctJ82j9rIu6eryAnzUKNbtcv7EGeOCzoZodWnBYWGBswmQGcXmmcl91ynTNXlq
	HWGmMDsbvu0ZkmKqufnCREIGU7yW1HgdALs4ZDuU6awWQFRDAEl3APz2pC4xUB5AjqZWi7Qp/Ua
	SWiA9fQAqXgfq6XEtFLsUDAGIBQQ==
X-Google-Smtp-Source: AGHT+IGsh1nJdWpngVYdZEjRa500viVTDTIM2UIG4kOF5wKJ53y1JA8yU/LJhMtvputUGsrQYMa3hGX2PPtSxqSmAd8=
X-Received: by 2002:a17:907:3f17:b0:ac6:f6ea:cc21 with SMTP id
 a640c23a62f3a-acad36bde74mr430450766b.55.1744430588921; Fri, 11 Apr 2025
 21:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-10-guodong@riscstar.com> <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
In-Reply-To: <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:02:56 +0800
X-Gm-Features: ATxdqUFY_6ozkYJSalNYLyr5XEWoGtVTgxstwPMi-eNqZST8o16MQumLG_Ya4qg
Message-ID: <CAH1PCMY6xKULTbekr+p6mA_gRDogeg5tyMHFuTKG5SzbVMACfQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_210311_358513_79A3BDE4 
X-CRM114-Status: GOOD (  14.34  )
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

T24gU2F0LCBBcHIgMTIsIDIwMjUgYXQgNjo1MuKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMDk6MTQ6MjNQ
TSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEVuYWJsZSBDT05GSUdfUFdNIGFuZCBDT05G
SUdfUFdNX1BYQSBpbiB0aGUgZGVmY29uZmlnCj4gPiB0byBzdXBwb3J0IHRoZSBQV00gY29udHJv
bGxlciB1c2VkIG9uIHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
R3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2NvbmZpZ3MvZGVmY29uZmlnIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBi
L2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IGluZGV4IDQ4ODg1MjlkZjFkOC4uOWJk
OTcyODY3ZTBhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+
ID4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gQEAgLTI1OSw2ICsyNTks
OCBAQCBDT05GSUdfUlBNU0dfQ1RSTD15Cj4gPiAgQ09ORklHX1JQTVNHX1ZJUlRJTz15Cj4gPiAg
Q09ORklHX1BNX0RFVkZSRVE9eQo+ID4gIENPTkZJR19JSU89eQo+ID4gK0NPTkZJR19QV009eQo+
Cj4gPiArQ09ORklHX1BXTV9QWEE9eQo+Cj4gV2h5IG5vdCBtPyBUaGlzIGNhbiByZWR1Y2UgdGhl
IEltYWdlIHNpemUuCj4KClRoYW5rcyBJbm9jaGkuIEl0J3MgYmV0dGVyIHRvIHVzZSBtLgpJIHdp
bGwgZml4IHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCi1HdW9kb25nCgo+ID4gIENPTkZJR19U
SEVBRF9DOTAwX0FDTElOVF9TU1dJPXkKPiA+ICBDT05GSUdfUEhZX1NVTjRJX1VTQj1tCj4gPiAg
Q09ORklHX1BIWV9TVEFSRklWRV9KSDcxMTBfRFBIWV9SWD1tCj4gPiAtLQo+ID4gMi40My4wCj4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
