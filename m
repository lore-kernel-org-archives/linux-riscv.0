Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD054CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaq2nYn9o1uEw4tglP9GwbRZIV1sfyEopDtBAxLRGZQ=; b=E0XPtwe1i8yoc3
	H/6kE1cQNOueYWCrYdYMW/pdTy1ZYcR4qNq1y8kB2Hfp0h/Af3qAZJxtIb3+4NMckvIT5F/HABOu5
	VSmA2gZvRQNc691n5y4y2SAAHqovmLAIeHJLJ1mIB3vXUwMBkYZUBWhcs+h2LJY55ltEENjYyjHQl
	Rt7P5h2J9hHjf7jw7Zwdorh4SEr9Oj1MUmcmG9nlpCJ2zs3p8JoHVWkE02z06GLicqv0xVjbLN6/Q
	5Beq9T3XOKxuZyy2hAUQrjcQNlsea7T7hNEBGqkcxsm1yuvpWZrbfgMeM4yajndWLOensVRA7cDTS
	hV9aCTurC+qFWKK3D/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJ2K-00Baym-1q;
	Sat, 16 Sep 2023 00:19:48 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJ2H-00BayQ-2R
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:19:47 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1a1fa977667so1571912fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694823584; x=1695428384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=335yQJsLhz9gpnjnvQNZ790fUhzVlFLLc9Gmojq1KMc=;
        b=Er1KCbSukxKW+okpPSBSP0sCTqiW2u5SluCJ3kxO39nA26yKiFkbflXulKph27WQ3Y
         eULUauEod1jKPwXMeet6I735ZIbOj7zNgbKPGXhG+/lRgZF2En66YQlrWOtj1LlOntLW
         n2vNxQzg3wZoLkp6cyOOcDsJpPJY/NR05NbAp7HdYcYM1zcmNBdCx4zT1ShiP53kkcbd
         Me31i2EEWD4Zph03k0iJm/VYPqPuhN7Sp2Zy5Ml8Fhe8rDaCmSm8BBG3cqcTz7fvIMph
         WO2d67pjLehjQB+/nPwxZGeCSV8ZsQlzQkJai4uAwniAwW3b3gJJz57TJftsY/Efjrfj
         twJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694823584; x=1695428384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=335yQJsLhz9gpnjnvQNZ790fUhzVlFLLc9Gmojq1KMc=;
        b=uw0+kRmtGmiUhYdNm2yMj8v7T2a04LdOyalk1pT9QvzKBpNvve/y0FUT7pIDK5wEAN
         3mZVsXXyIUwEXC65+psJ87GXjyO4B/CcZJbqqsW4ETYx0h+FYdPiYUIBt5ryGRBKb3ah
         v6EMl7ZrVGi2YstacrSA+9gIqj+SfyIPXwEgowzn1yifh9oQMPsHgT3Q3p23R4LcI4s9
         7qZPPqi86uTyJZGtdlKUs2ViA4aqRYfxtMdMYBdECXKgTQIMmD/g2EuW8LJP8g5H4JXR
         qh5ayH+Ax+2GaAn/2iNkPKo6EOIDFylSIS1EYVhOH1IrebAVb55sphYYjc+HJgnJey6G
         Ij4A==
X-Gm-Message-State: AOJu0Yx4cGRQaGohsLLXG9vqA1E/2JHsSDtTFopuwijSRXVy9mGj7YU2
	bciSKlrQt37BuCpqi5icimySWNudCBA90LGgkhc=
X-Google-Smtp-Source: AGHT+IE2qjYAtR6WucRzD4AoFdh957k5jPWnQdwAzSB18i2L6V+pD2Cf5pqk0qes8jxrU0yVcey63mfQibw0ohFigV8=
X-Received: by 2002:a05:6871:206:b0:1bb:583a:db4a with SMTP id
 t6-20020a056871020600b001bb583adb4amr3531688oad.44.1694823584531; Fri, 15 Sep
 2023 17:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230915070856.117514-1-wangchen20@iscas.ac.cn> <20230915-dill-gauze-922068730d7b@wendy>
In-Reply-To: <20230915-dill-gauze-922068730d7b@wendy>
From: Chen Wang <unicornxw@gmail.com>
Date: Sat, 16 Sep 2023 08:19:33 +0800
Message-ID: <CAHAQgRDjwai448hC8EATDDFX6aBcmfWvv+2huJoywxan1qYPcA@mail.gmail.com>
Subject: Re: [PATCH 00/12] Add Milk-V Pioneer RISC-V board support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jszhang@kernel.org, guoren@kernel.org, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	Wang Chen <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_171945_795469_DDFDC88E 
X-CRM114-Status: GOOD (  19.12  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPiDkuo4yMDIz5bm0OeaciDE15pel5ZGo5LqUIDE1OjI25YaZ6YGT77yaCj4KPiBIZXksCj4K
PiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCAwMzowODo1NlBNICswODAwLCBXYW5nIENoZW4gd3Jv
dGU6Cj4gPiBNaWxrLVYgUGlvbmVlciBbMV0gaXMgYSBkZXZlbG9wZXIgbW90aGVyYm9hcmQgYmFz
ZWQgb24gU09QSE9OIFNHMjA0MiBbMl0KPiA+IGluIGEgc3RhbmRhcmQgbUFUWCBmb3JtIGZhY3Rv
ci4gQWRkIG1pbmltYWwgZGV2aWNlCj4gPiB0cmVlIGZpbGVzIGZvciB0aGUgU0cyMDQyIFNPQyBh
bmQgdGhlIE1pbGstViBQaW9uZWVyIGJvYXJkLgo+Cj4gQ29vbCwgdGhhbmtzIGZvciB3b3JraW5n
IG9uIHRoaXMuCj4KPiA+Cj4gPiBOb3cgb25seSBzdXBwb3J0IGJhc2ljIHVhcnQgZHJpdmVycyB0
byBib290IHVwIGludG8gYSBiYXNpYyBjb25zb2xlLgo+ID4KPiA+IFRoZSBwYXRjaCBzZXJpZXMg
aXMgYmFzZWQgb24gdjYuNi1yYzEuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0Cj4gPiB0
aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbM10uIEhvcGUgdGhpcyBzZXJpZXMgd2lsbCBiZSBtZXJn
ZWQgc29vbi4KPiA+Cj4gPiBUaGFua3MKPiA+Cj4gPiBbMV06IGh0dHBzOi8vbWlsa3YuaW8vcGlv
bmVlcgo+ID4gWzJdOiBodHRwczovL2VuLnNvcGhnby5jb20vcHJvZHVjdC9pbnRyb2R1Y2Uvc2cy
MDQyLmh0bWwKPiA+IFszXTogaHR0cHM6Ly9naXRodWIuY29tL3VuaWNvcm54L2xpbnV4LXJpc2N2
L2NvbW1pdHMvbWlsa3YtcGlvbmVlci1taW5pbWFsCj4gPgo+ID4gRW1pbCBSZW5uZXIgQmVydGhp
bmcgKDIpOgo+ID4gICBkdC1iaW5kaW5nczogc2VyaWFsOiBzbnBzLWR3LWFwYi11YXJ0OiBBZGQg
U29waGdvIFNHMjA0MiB1YXJ0cwo+ID4gICBzZXJpYWw6IDgyNTBfZHc6IEFkZCBTb3BoZ28gU0cy
MDQyIHN1cHBvcnQKPiA+Cj4gPiBJbm9jaGkgQW1hb3RvICgxKToKPiA+ICAgZHQtYmluZGluZ3M6
IHRpbWVyOiBBZGQgU29waGdvIHNnMjA0MiBjbGludAo+ID4KPiA+IFdhbmcgQ2hlbiAoOCk6Cj4g
PiAgIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IGFkZCBtaWxrdi9zb3BoZ28KPiA+ICAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgc29waGdvIHNnMjA0MiBiaW5kaW5ncwo+ID4gICBkdC1i
aW5kaW5nczogcmlzY3Y6IEFkZCBULUhFQUQgQzkyMCBjb21wYXRpYmxlcwo+ID4gICBkdC1iaW5k
aW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBTT1BIR08ncyBTRzIwNDIgUExJQwo+ID4g
ICByaXNjdjogZHRzOiBhZGQgaW5pdGlhbCBTT1BIR08gU0cyMDQyIFNvQyBkZXZpY2UgdHJlZQo+
ID4gICByaXNjdjogZHRzOiBzb3BoZ286IGFkZCBNaWxrLVYgUGlvbmVlciBib2FyZCBkZXZpY2Ug
dHJlZQo+ID4gICByaXNjdjogZHRzOiBzb3BoZ286IEFkZCBzb3BoZ28sc2cyMDI0LXVhcnQgY29t
cGF0aWJsZXMKPiA+ICAgcmlzY3Y6IGRlZmNvbmZpZzogZW5hYmxlIFNPUEhHTyBTb0MKPiA+Cj4g
PiB4aWFvZ3VhbmcueGluZyAoMSk6Cj4gPiAgIHJpc2N2OiBBZGQgU09QSEdPIFNPQyBmYW1pbHkg
S2NvbmZpZyBzdXBwb3J0Cj4KPiBPbmUgdGhpbmcgb24gc2VuZGluZyBwYXRjaHNldHMgLSB5b3Un
dmUgbm90IHRocmVhZGVkIHRoaXMgcGF0Y2hzZXQsCj4gd2hlcmUgZWFjaCBwYXRjaCBpcyBhIHJl
cGx5IHRvIHRoZSBjb3ZlciBsZXR0ZXIuIFRoaXMgbWFrZXMgaXQgbW9yZQo+IGRpZmZpY3VsdCB0
byBhcHBseSB0aGUgc2VyaWVzIGFzIGEgaHVtYW4gJiB+aW1wb3NzaWJsZSBmb3IgdGhlCj4gYXV0
b21hdGlvbiB0byB0ZXN0IGNvcnJlY3RseS4KPiBHaXQgc2hvdWxkIGRvIHRoaXMgZm9yIHlvdSBp
ZiBydW4gc2VuZC1lbWFpbCBvbiBhbiBlbnRpcmUgZGlyZWN0b3J5LAo+IG9yIHlvdSBjYW4gcGFz
cyB0aGUgbWVzc2FnZS1pZCBvZiB0aGUgY292ZXIgbGV0dGVyIHdpdGggYW4gYXJndW1lbnQuCj4g
VGhlIGZpcnN0IG9wdGlvbiBpcyBsaWtlbHkgYSBsb3QgZWFzaWVyIGZvciB5b3UuLi4KPgo+IFRo
YW5rcywKPiBDb25vci4KCkNvbm9yLCB0aGFua3MgZm9yIHlvdXIgaW5wdXQsIEkgd2lsbCBjb3Jy
ZWN0IHRoZSBzZW5kaW5nIG9mIHBhdGNoc2V0cwppbiBuZXh0IHJldmlzaW9uLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
