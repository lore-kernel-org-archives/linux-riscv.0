Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897E7C5AD49
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 01:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gpe/DmQXJKM8dnhQuUwY9r687EXnnjbcbupTceIJTg=; b=TYyha3hDTdoGRB
	wTyLjfWH3IPv952NmO0cAfMlB6sPILafIDMf/0kCBUyGUZxl4TnQv8isKz46P+yKAjQnX9pOAzW3W
	ZUY51OVXBxUSOEH2Xz05a/L1BNYDEgkUHOM0PLAKG6R7G0N8r1UTo8UB/7k8EbEOG7420TLxX2R2w
	dpvkYhD24rnt8omawRplhZ5HJTNRx7+uirFWcdxZBJnRB4Pc2ca3JGt1AmEI8wxD55B1GpuuFH+R7
	7WGmEdd5nPhGL9vgTQj86CKWuvdVvpPVDk3x+5gJan4vmC364m/S6qO7V/z6VO0Va7YIo7NYnjXg+
	vHW2g9aDNiHk2YSAhngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLB7s-00000002viN-3Z3D;
	Sat, 31 May 2025 01:35:08 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLB7p-00000002vhc-3nVN
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 01:35:07 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fab467aacdso26156566d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 18:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748655304; x=1749260104; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEpkKf/rbRGMaCZnUiCqTPwyLbk3NZOTi/tOjvkQknU=;
        b=ReClnoiXTXVsqCDLmS5xgTmGvyQMYj8D6wVTMJczCFDfon4basTOH+XxpZGZThgHl2
         AEUbw15tQ4kwJqK4/dSjFXM8LM5yWkxLCTcsnK97Cr0pVy58/EVlHqv8kdpBLV1Pbl5y
         NC4riFI/QH3x/WAyH+Z8xj27eXlShE2Md28ci3J8/Pk3TevYFV/tGOO/Am3qXFv01F9K
         xNJHKVOVh9alxCOw8+z6egRk6Qz1CTIjPkZszCXmdwQ9UBFSxPrgARoR+GuTu9x9uMO/
         pmZIv0vuddonGbFRbsbYicfAu8d4zk6LMfS6XSdxDUbpi2GS7/w0vX1dX0MCiAT40sb+
         R5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748655304; x=1749260104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEpkKf/rbRGMaCZnUiCqTPwyLbk3NZOTi/tOjvkQknU=;
        b=ZmW38pmYQyVvz+2EiL85C4ErHUX1V3R3Clxkyfvo/kXVGQwkGr2dDO9+Iqwz/EHWfA
         QOuGZdMD4aV9icD3Ls9K88Kp9WJyWAGJfD151sLAO3c/1JkSEUpVXCKThB4tS0WqhEZr
         3tGiQWcNIg6lQnNyBgUaOMcacjDGHOgd0h1VBlQJAZaYFDQ+J1AL5qB3KVlPOOI0ie8I
         vtbQ2GysvN5I4BUFaQC1BAavVQVTBQXydJXr/+5obLczKoElKw5dXeB0swYwu8EazGOc
         mLmeot1ZW+mLEW1emghFP6yzZZZoEvO3NXDFcmVi5KNlVdeYrWBhklMNED0Bd4ZFc4xX
         PezA==
X-Forwarded-Encrypted: i=1; AJvYcCVyByUk73R+8F6VcyqBU6HtSKRriIxXG89nZ4jDsLMtULLRHZJT1aX3yY9Kb15z+0A6+qPFb8YwObuSFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo6Zg6TSGPsAgTCfd20wlAvwZarNrUMZCcWcXm9JbrLgrhMCyj
	UIK/TykACZ19oQZxrHLkkaVl7ldVBS8wpKa1oOqwoZWIK3qjkZV+WHYh
X-Gm-Gg: ASbGncu/buTUzMop3I5KsRA5QfX+yUEqcDKslsjANZhE7Qt7EX6rhJB5mJ07aG2nnTn
	da9pLmkDEO8n96uscGK+IH6gjYfv01d4tx8FeDzglicfQKCegw9yP6SAXaIrwPImQd5U055ELoQ
	vIOL3bEBxHVaWFYEzE9lbsfiRdC2Dn9paJI2qNXFmcUqtPsLfuptKJpEmLLeDC3sUZAKDDcgGQp
	bjHNxce2HZd9iXr3VOz5I6G1vrZ8QPepG6qvAf6e70Ry7d/dhtArRvbHV8iQpv2B/NLCu3uMQf7
	u8BGNsi3I1rydFzp9I0RTxKgDh36bHOr2N67pg==
X-Google-Smtp-Source: AGHT+IFzbQoEp2+Ph+a2o8b88ePR2Du44O7ta02t6SISNBZax8aMd+4dqDWmuWAErYq9CBhmxc893Q==
X-Received: by 2002:a05:6214:d02:b0:6fa:c5be:dac7 with SMTP id 6a1803df08f44-6facebcf4bdmr111200496d6.18.1748655304161;
        Fri, 30 May 2025 18:35:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d09a1a793esm324888785a.111.2025.05.30.18.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 18:35:03 -0700 (PDT)
Date: Sat, 31 May 2025 09:34:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <4vuneynwhmsyokkuw3wlabxij6kobl6j7bbbcymlcmsdc2hhb7@u5mhb7je74km>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
 <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_183505_952600_46183618 
X-CRM114-Status: GOOD (  24.57  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDY6MjI6MDVQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IAo+IE9uIDIwMjUvNS8yNyAxNzozNCwgSGFuIEdhbyB3cm90ZToKPiA+IE9uIFRodSwgTWF5
IDE1LCAyMDI1IGF0IDk6MzPigK9BTSBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bT4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiAyMDI1LzUvMTQgMjM6MTUsIEhhbiBHYW8gd3JvdGU6
Cj4gPiA+ID4gc2cyMDQyIHN1cHBvcnQgWmZoIElTQSBleHRlbnNpb24gWzFdLgo+ID4gPiA+IAo+
ID4gPiA+IExpbms6IGh0dHBzOi8vb2NjLW9zcy1wcm9kLm9zcy1jbi1oYW5nemhvdS5hbGl5dW5j
cy5jb20vcmVzb3VyY2UvLzE3Mzc3MjE4Njk0NzIvJUU3JThFJTg0JUU5JTkzJTgxQzkxMCVFNCVC
OCU4RUM5MjBSMVM2JUU3JTk0JUE4JUU2JTg4JUI3JUU2JTg5JThCJUU1JTg2JThDJTI4eHJ2bSUy
OV8yMDI1MDEyNC5wZGYgWzFdCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdh
byA8cmFiZW5kYS5jbkBnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gICAgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNwdXMuZHRzaSB8IDI1NiArKysrKysrKysrLS0tLS0t
LS0tLQo+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKSwgMTI4IGRl
bGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLWNwdXMuZHRzaQo+ID4gPiA+IGluZGV4IGY0ODNmNjJhYjBjNC4uOGRkMWEzYzYwYmM0
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1j
cHVzLmR0c2kKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIt
Y3B1cy5kdHNpCj4gPiA+ID4gQEAgLTI1NiwxMSArMjU2LDExIEBAIGNvcmUzIHsKPiA+ID4gPiAg
ICAgICAgICAgICAgICBjcHUwOiBjcHVAMCB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInRoZWFkLGM5MjAiLCAicmlzY3YiOwo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByaXNjdixpc2EgPSAicnY2NGltYWZkY196ZmgiOwo+ID4gPiBOZWVkIG5vdCB0b3VjaCB0
aGlzLiAicmlzY3YsaXNhIiBpcyBkZXByZWNhdGVkIGFuZCByZXBsYWNlZCBieQo+ID4gPiAicmlz
Y3YsaXNhLWJhc2UiICYgInJpc2N2LGlzYS1leHRlbnNpb25zIi4KPiA+ID4gCj4gPiA+IEFuZCBv
bmx5IGFkZGluZyB6ZmggZm9yIHRoaXMgbG9va3MgYSBiaXQgd2VyaWQuCj4gPiA+IAo+ID4gPiBB
Y3R1YWxseSwgSSBwbGFuIHRvIHJlbW92ZSAicmlzY3YsaXNhIiBsYXRlciwgc28gcGxlYXNlIGRv
bid0IHRvdWNoIHRoaXMKPiA+ID4gZnJvbSBub3cgb24uCj4gPiBJIHRoaW5rIHRoYXQgc2luY2Ug
dGhlIGxpbnV4IGtlcm5lbCBpcyB0aGUgdXBzdHJlYW0gZm9yIGRldmljZXRyZWUsIGl0Cj4gPiBj
YW5ub3QgeWV0IHJlbW92ZSByaXNjdiwgaXNhIG5lZWRzIHRvIG1haW50YWluIGNvbXBhdGliaWxp
dHkuCj4gCj4gT0ssIG1heWJlIGl0J3Mgbm90IGdvb2QgdG8gcmVtb3ZlICJyaXNjdixpc2EiLgo+
IAo+IENhbiB0aGlzIHBhdGNoIG5vdCBtb2RpZnkgInJpc2N2LGlzYSIsIGJ1dCBvbmx5IGFkZCBz
b21ldGhpbmcgZm9yCj4gInJpc2N2LGlzYS1leHRlbnNpb25zIj8KPiAKCkkgY2FuIHJlbW92ZSB0
aGlzIHdoaWxlIG1lcmdpbmcgdGhlIHBhdGNoLCBpcyBpdCBPSyBmb3IgeW91PwoKUmVnYXJkcywK
SW5vY2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
