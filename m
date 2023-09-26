Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F53E7D27A
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVNTLyQdMZT2tqmoWuNppFbK4chLI3QkvI3ZIvjMUwE=; b=zelN8Mku1FErKi
	CHMwgpHK3unKEKHIdstVcpENwPmJh+g+KnJOH1dtkYXygSndqeHpXIvrtcBzkFxOy3QoyBYPXuj0+
	/+k9uMngUKgCBE8Xu2LzkFfshAVFj4HucjLiC4RxEE8rn6u8Tz8bRRT6bcRbAEYBhxfXNMvZxZ2hw
	bWWV+ikcWSIPMKW3ryBLBWW2ee7TRi06+tQBrYn3sGkq2s28376tB+ZcVt0LfYdkq+Pfr0lxU+D7H
	BO0wKJN3T1ItuR/VJ4RcQfV+XDASfLCZapAqd7ZbuvBaVF91bHLH6FvnPb+9eV32S1BKiCBS2uMh+
	5MYXnSbtEL5zoOOKy/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5Jn-00G3Ng-28;
	Tue, 26 Sep 2023 10:29:27 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5Jk-00G3JP-11
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 10:29:26 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59f4bc88f9fso73050597b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695724159; x=1696328959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYJ+Soo11ckzYqJKoCtN3646PUEaaNXCy3bDcki6Cog=;
        b=buiJlmW1/1cZYQZ1m284qu8vyLRbyNsGMwk2Dck6RoEEfZwsj/wo/kLzsXcRpq7KuK
         xbeCb/wfrXb3t3zWhGU1OJ59Oxrs5iZH0mY/g7QN8plu15u1f3b7h7NoHRKVVzrErX4j
         WHQ0YvglM00oRNp5dvHbIbnSArgTBe4KAvhjdtR+7pHho8wHvHT8GVfHTg4NkkP1/uBs
         ugFZ6Pb08ua17JRgtQXG87JxgyiZxRzYyz5k1qbRxZhyRr8WC/iK/wNGIKKROQ5clKT1
         VS7el+Ng5n6gDFrMKNOcwMW/L2H+70LZTcqdxAnMQKZBhW7SheZmYYScFKMWK4jafy48
         IIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695724159; x=1696328959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYJ+Soo11ckzYqJKoCtN3646PUEaaNXCy3bDcki6Cog=;
        b=RgmklYMoDZEhUkLOa4MDfMluYzLt3baEZbXuamhoNz9pQ/gYgRWoRgWRnhwZ1w+KQ1
         DFzDeisV69crOtQt9NZDQJWoODrIz2F4LdC3+5hoDKWd2Lb9Qj7Jj9x+86p6F9zGQ6L3
         RZksPIzznfJRZsXBy5BuQhlX/D3VT+65OYW5PrzaROlblJc5aDv8XCPfz2dIjJ5nmop4
         XqPKK9ofuETC2RpKhOPjxTfTtRKh9U/VjtgQDhVmN6XzYOeE1kUTz/mdj9a0nQ1HgQTv
         7YngT1wDjasx0PSUyjVR6C1gDrd4qV9+2TQjY57CVtlQwuTBELwHAPHwejtBOFyVksI+
         RlAA==
X-Gm-Message-State: AOJu0YyJcIac0MuTfFJ+kdGIT5ZF38K6uJdtsww2k1hogSpG7hpb72SO
	fNpwTqqvoN0B7kISunI/ScvOYpEqGPCbam+1QmgHLRLYDDk=
X-Google-Smtp-Source: AGHT+IFTKakaIbrv91wfO1JG0RZC5COeyEoiXA2czSwspI36YNY6zBagHHFZsCsF8umYPnzXxCpgtdiPOZpK1ZMdHdI=
X-Received: by 2002:a0d:fcc6:0:b0:59b:2458:f60c with SMTP id
 m189-20020a0dfcc6000000b0059b2458f60cmr8837917ywf.28.1695724159451; Tue, 26
 Sep 2023 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <mhng-1c4de53c-6168-432c-b37a-284c90b1ed2d@palmer-ri-x1c9a>
In-Reply-To: <mhng-1c4de53c-6168-432c-b37a-284c90b1ed2d@palmer-ri-x1c9a>
From: Chen Wang <unicornxw@gmail.com>
Date: Tue, 26 Sep 2023 18:29:07 +0800
Message-ID: <CAHAQgRBAJKc+UVoH0GJb8Y3iedRLwoNsbbL9nvRLCWJ7w=uLMQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add Milk-V Pioneer RISC-V board support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	robh+dt@kernel.org, xiaoguang.xing@sophgo.com, wangchen20@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_032924_359393_BC100977 
X-CRM114-Status: GOOD (  25.66  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5LqOMjAyM+W5tDnmnIgyMOaXpeWR
qOS4iSAyMzoyMuWGmemBk++8mgo+Cj4gT24gVHVlLCAxOSBTZXAgMjAyMyAyMzozMzo0OCBQRFQg
KC0wNzAwKSwgdW5pY29ybnh3QGdtYWlsLmNvbSB3cm90ZToKPiA+IE1pbGstViBQaW9uZWVyIFsx
XSBpcyBhIGRldmVsb3BlciBtb3RoZXJib2FyZCBiYXNlZCBvbiBTT1BIT04gU0cyMDQyIFsyXQo+
ID4gaW4gYSBzdGFuZGFyZCBtQVRYIGZvcm0gZmFjdG9yLiBBZGQgbWluaW1hbCBkZXZpY2UKPiA+
IHRyZWUgZmlsZXMgZm9yIHRoZSBTRzIwNDIgU09DIGFuZCB0aGUgTWlsay1WIFBpb25lZXIgYm9h
cmQuCj4gPgo+ID4gTm93IG9ubHkgc3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZlcnMgdG8gYm9vdCB1
cCBpbnRvIGEgYmFzaWMgY29uc29sZS4KPiA+Cj4gPiBUaGFua3MsCj4gPiBDaGVuCj4gPgo+ID4g
LS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNl
ZCBvbiB2Ni42LXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QKPiA+ICAgdGhlIHBh
dGNoZXMgYXQgdGhlIGxpbmsgWzRdLgo+ID4gICAtIEltcHJvdmUgZm9ybWF0IGZvciBjb21tZW50
IG9mIGNvbW1pdG1lbnRzIGFzIHBlciBpbnB1dCBmcm9tIGxhc3QgcmV2aWV3Lgo+ID4gICAtIElt
cHJvdmUgZm9ybWF0IG9mIERUUyBhcyBwZXIgaW5wdXQgZnJvbSBsYXN0IHJldmlldy4KPiA+ICAg
LSBSZW1vdmUgbnVtYSByZWxhdGVkIHN0dWZmIGZyb20gRFRTLiBUaGlzIHBhcnQgaXMganVzdCBm
b3Igb3B0aW1pemF0aW9uLCBtYXkKPiA+ICAgICBhZGQgaXQgbGF0ZXIgaWYgcmVhbGx5IG5lZWRl
ZC4KPiA+Cj4gPiBQcmV2aW91cyB2ZXJzaW9uczoKPiA+IHYxOiBkdWUgdG8gaXQgaXMgbm90IHNl
bnQgaW4gdGhyZWFkLCBJIGhhdmUgbGlzdGVkIHBlcm1saW5rcyBvZiB0aGUgcGF0Y2hzZXQKPiA+
ICAgICBbdjEtMC8xMl0gfiBbdjEtMTIvMTJdIGhlcmUgZm9yIHF1aWNrIHJlZmVyZW5jZS4gWW91
IGNhbiBzaW1wbHkgcmV2aWV3IG9yCj4gPiAgICAgdGVzdCB0aGUgcGF0Y2hlcyBhdCB0aGUgbGlu
ayBbM10uCj4gPgo+ID4gWzFdOiBodHRwczovL21pbGt2LmlvL3Bpb25lZXIKPiA+IFsyXTogaHR0
cHM6Ly9lbi5zb3BoZ28uY29tL3Byb2R1Y3QvaW50cm9kdWNlL3NnMjA0Mi5odG1sCj4gPiBbM106
IGh0dHBzOi8vZ2l0aHViLmNvbS91bmljb3JueC9saW51eC1yaXNjdi9jb21taXRzL21pbGt2LXBp
b25lZXItbWluaW1hbAo+ID4gWzRdOiBodHRwczovL2dpdGh1Yi5jb20vdW5pY29ybngvbGludXgt
cmlzY3YvY29tbWl0cy9taWxrdi1waW9uZWVyLW1pbmltYWwtdjIKPiA+IFt2MS0wLzEyXTpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MDg1Ni4xMTc1MTQtMS13
YW5nY2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTEvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcxMDA1LjExNzU3NS0xLXdhbmdjaGVuMjBAaXNjYXMu
YWMuY24vCj4gPiBbdjEtMi8xMl06aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyMzA5MTUwNzE0MDkuMTE3NjkyLTEtd2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbi8KPiA+IFt2MS0z
LzEyXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjI0Mi4x
MTc5MzUtMS13YW5nY2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTQvMTJdOmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcyMzMzLjExNzk5MS0xLXdhbmdjaGVu
MjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtNS8xMl06aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyMzA5MTUwNzIzNTguMTE4MDQ1LTEtd2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbi8K
PiA+IFt2MS02LzEyXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkx
NTA3MjQxNS4xMTgxMDAtMS13YW5nY2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTcvMTJdOmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcyNDMxLjExODE1NC0x
LXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtOC8xMl06aHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTUwNzI0NTEuMTE4MjA5LTEtd2FuZ2NoZW4yMEBpc2Nh
cy5hYy5jbi8KPiA+IFt2MS05LzEyXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di8yMDIzMDkxNTA3MjUxNy4xMTgyNjYtMS13YW5nY2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3Yx
LTEwLzEyXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjU1
OC4xMTgzMjUtMS13YW5nY2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTExLzEyXTpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjYyNC4xMTgzODgtMS13YW5n
Y2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTEyLzEyXTpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjY1My4xMTg0NDgtMS13YW5nY2hlbjIwQGlzY2FzLmFj
LmNuLwo+ID4KPiA+IC0tLQo+ID4KPiA+IENoZW4gV2FuZyAoOCk6Cj4gPiAgIHJpc2N2OiBBZGQg
U09QSEdPIFNPQyBmYW1pbHkgS2NvbmZpZyBzdXBwb3J0Cj4gPiAgIGR0LWJpbmRpbmdzOiB2ZW5k
b3ItcHJlZml4ZXM6IGFkZCBtaWxrdi9zb3BoZ28KPiA+ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBh
ZGQgc29waGdvIHNnMjA0MiBiaW5kaW5ncwo+ID4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBU
LUhFQUQgQzkyMCBjb21wYXRpYmxlcwo+ID4gICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRy
b2xsZXI6IEFkZCBTT1BIR08ncyBTRzIwNDIgUExJQwo+ID4gICByaXNjdjogZHRzOiBhZGQgaW5p
dGlhbCBTT1BIR08gU0cyMDQyIFNvQyBkZXZpY2UgdHJlZQo+ID4gICByaXNjdjogZHRzOiBzb3Bo
Z286IGFkZCBNaWxrLVYgUGlvbmVlciBib2FyZCBkZXZpY2UgdHJlZQo+ID4gICByaXNjdjogZGVm
Y29uZmlnOiBlbmFibGUgU09QSEdPIFNvQwo+ID4KPiA+IEVtaWwgUmVubmVyIEJlcnRoaW5nICgy
KToKPiA+ICAgZHQtYmluZGluZ3M6IHNlcmlhbDogc25wcy1kdy1hcGItdWFydDogQWRkIFNvcGhn
byBTRzIwNDIgdWFydHMKPiA+ICAgc2VyaWFsOiA4MjUwX2R3OiBBZGQgU29waGdvIFNHMjA0MiBz
dXBwb3J0Cj4gPgo+ID4gSW5vY2hpIEFtYW90byAoMSk6Cj4gPiAgIGR0LWJpbmRpbmdzOiB0aW1l
cjogQWRkIFNvcGhnbyBzZzIwNDIgY2xpbnQKPiA+Cj4gPiAgLi4uL3NpZml2ZSxwbGljLTEuMC4w
LnlhbWwgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgICAgMSArCj4gPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwgICAgIHwgICAyOCArCj4gPiAgLi4uL2JpbmRpbmdz
L3NlcmlhbC9zbnBzLWR3LWFwYi11YXJ0LnlhbWwgICAgIHwgICAgMSArCj4gPiAgLi4uL2JpbmRp
bmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sICAgICAgICAgIHwgICAgOCArCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgICAgNCArCj4gPiAgTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArCj4gPiAg
YXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNSArCj4g
PiAgYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAgMSAr
Cj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUgICAgICAgICAgIHwgICAg
MyArCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNwdXMuZHRzaSAgIHwg
MTc0NCArKysrKysrKysrKysrKysrKwo+ID4gIC4uLi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1p
bGt2LXBpb25lZXIuZHRzICB8ICAgMTkgKwo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdv
L3NnMjA0Mi5kdHNpICAgICAgICB8ICA0MzkgKysrKysKPiA+ICBhcmNoL3Jpc2N2L2NvbmZpZ3Mv
ZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICAxICsKPiA+ICBkcml2ZXJzL3R0eS9zZXJp
YWwvODI1MC84MjUwX2R3LmMgICAgICAgICAgICAgfCAgICA1ICstCj4gPiAgMTUgZmlsZXMgY2hh
bmdlZCwgMjI2NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlh
bWwKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFr
ZWZpbGUKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLWNwdXMuZHRzaQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPgo+IEdpdmVuIHRoaXMg
aXMgdGhlIGZpcnN0IHNnMjA0MiBhbmQgaXQgYXBwZWFycyB0byBoYXZlIGEgZmV3IGVycmF0YSAo
dGhlCj4gRlAgcm91bmRpbmcgaXNzdWVzIGFuZCB0aGUgc3BlY2lhbCBmZW5jZSBmb3Igc3RhcnZh
dGlvbiksIEkgdGhpbmsgd2UKPiB3YW50IHRvIG1ha2Ugc3VyZSB3ZSBmaWd1cmUgb3V0IGhvdyB0
byBwcm92aWRlIHRoYXQgaW5mb3JtYXRpb24gdG8KPiB1c2Vyc3BhY2UuCj4KCkhpLCBQYWxtZXIs
CkkgZG9uJ3QgIHVuZGVyc3RhbmQgd2VsbCB3aGF0J3MgeW91ciBtZWFuaW5nIG9mICJwcm92aWRl
IHRoYXQKaW5mb3JtYXRpb24gdG8gdXNlcnNwYWNlIiwgY2FuIHlvdSBwbGVhc2UgY2xhcmlmeSBt
b3JlPwpBbmQgZm9yIHRoaXMgcGF0Y2hzZXQsIGRvIHdlIHN0aWxsIGxhY2sgc29tZXRoaW5nIGVs
c2U/IFRoaXMgcGF0Y2hzZXQKaXMgdGhlIGZpcnN0IG9uZSBmb3Igc2cyMDQyLCBidXQgSSBkb24n
dCBzZWUgdGhvc2UgaXNzdWVzIHlvdQptZW50aW9uZWQgd291bGQgYmxvY2sgaXQsIGJlY2FzdWUg
dGhlIHRhcmdldCBvZiB0aGlzIGZpcnN0IHBhdGNoc2V0IHdlCmp1c3Qgd2FudCB0byBtYWtlIHN1
cmUgdGhlIGtlcm5lbCBjYW4gYm9vdCB1cCBhbmQgd29yayB3aXRoIGEgdWFydApjb25zb2xlLgoK
VGhhbmtzIGluIGFkdi4KQ2hlbgoKCj4gPiBiYXNlLWNvbW1pdDogMGJiODBlY2MzM2E4ZmI1YTY4
MjIzNjQ0M2MxZTc0MGQ1YzkxN2QxZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
