Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3317C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biLczTxhZlHYw9G6jyR/csIBw86QRz0Pn8ozkCO72CQ=; b=BsfKE+3qzR6BXO
	nsYgfV3FdaDBIksVBbnRJhXLLiQxbSLOHh8rG58UPH+jSn5cXEPDJDFTGgOnLvg4k9X5EeeCEiGHc
	OF8fkw1kA3bR1IeyViiT0pmbrSF0RK9SlfmZY2oGQtWtkoztm20LV/XZD5Yug1h8aOjaMNkGDgvdZ
	zj5chLx08yVxEqMGkb/M+MaX36SgtxnftcGSwKg7dVA9klEHQ5qCxdC8WpT6hdBukS2+W0n+rvkdj
	0ES+4qF6hrny69ZsVO3uv0+RbkW/0rC6VX631Y44j/znZ5JxRalVwAXJno+Z6K0nejildDmRYpQ4Y
	yPvU+7W/nDZI9m6bdbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiLw-00C2wc-2h;
	Tue, 16 Jan 2024 12:15:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiLt-00C2w6-0X
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 12:15:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-559bc4b063cso301596a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 04:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705407329; x=1706012129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/kk/O+CBQq1j1li3fi1pfcRqWXCdCx2SuioSuSfFP1w=;
        b=QmCiwPLtpm18/KfilUCvkFun0BUp2ej5upbkHAlK9XW7EgSyv84oJX64JhumiWFuBg
         TK96eMVSHZ6I1ioAs5Dmg1yIkFFauxW1zb60QYiiy8Amb+0zFfx+iEmIaeFFNhCcsyHp
         Wz188eJbwyxftZmhOU4rofqYy+JlDzeTq/mcJI9f9MRrDVM6TZHaLBdSe+ktmLkXxA2Z
         qqVg9D8vHMgyuJ5XteydJVIdjj6uYmm5PMx9+/OlAQ3OQdB3QdeAgl3nGVBM5g6TLrIW
         K+D4cbJpwl4ISb6Ozaxxykb9Ulgrkz04SIwoNeawDRzQ7uDXf7dmuHr2t65CiPo06Lxz
         Cl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705407329; x=1706012129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kk/O+CBQq1j1li3fi1pfcRqWXCdCx2SuioSuSfFP1w=;
        b=IVr5fxBYqLyr6XHrE3ioszEPbAZI6zmY3bRizi7cVoHa+kn0QZh37mMG+A6WeenDWN
         7fuxVCHN3cgaolImhl2eAwR5Gl13PLOfJn6p91amxIime2R8J9tnfph+lPdgD8IzHS42
         SoZWv9h0XiNIF7eBXPgoMWmuM8s68nQcL4zBIXCs5twoUQReHjC/x9AXXbj/L+LXGQe0
         aBB7waO2hx8N6T0xd1BQi7jz5ikIcqcJs3HBUdU2xIEeL29P9vBEIps01xSF+uSIzd66
         t6s0neoP+hWph7fmh8Lzvo+5dftRV7LHZJFv97NrKwVDjqrSOZoH8YF4HWkDz+AQDdOG
         KaAA==
X-Gm-Message-State: AOJu0YwG3cQpIBzF1UoxYz2d7alP/7q9EuYFyPWJgceebg6gZXVRWEHs
	bsvoJdrZAefoDEWd6j64dscGohEYEUeFRR62Lq1YQSCuWC0=
X-Google-Smtp-Source: AGHT+IEwxFWU0HVj73235n9DWQNSKJOTuUjeFLvXg7/pyeoQbu4ZnHrHCnBnuulNQwp8FgsBy2SMgg==
X-Received: by 2002:aa7:d4cb:0:b0:54c:e28c:2086 with SMTP id t11-20020aa7d4cb000000b0054ce28c2086mr3923869edr.38.1705407329028;
        Tue, 16 Jan 2024 04:15:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id s24-20020aa7cb18000000b00558e38d4c6asm5046806edt.93.2024.01.16.04.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:15:28 -0800 (PST)
Message-ID: <52c0b805-bcbb-47e5-bbac-e527e9dc57a6@linaro.org>
Date: Tue, 16 Jan 2024 13:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
 control module
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_041533_206619_B4908838 
X-CRM114-Status: GOOD (  17.68  )
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

T24gMTYvMDEvMjAyNCAxMjozNywgQ2hlbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjQvMS8xNiAx
ODowNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTYvMDEvMjAyNCAwODoyMSwg
Q2hlbiBXYW5nIHdyb3RlOgo+Pj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9v
ay5jb20+Cj4+Pgo+Pj4gQWRkIGRvY3VtZW50YXRpb24gdG8gZGVzY3JpYmUgU29waGdvIFN5c3Rl
bSBDb250cm9sIGZvciBTRzIwNDIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1
bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+PiAtLS0KPj4+ICAgLi4uL3NvYy9zb3BoZ28vc29w
aGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwgICAgIHwgNDYgKysrKysrKysrKysrKysrKysrKwo+Pj4g
ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zb3BoZ28vc29waGdvLHNn
MjA0Mi1zeXNjdHJsLnlhbWwKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9zb3BoZ28vc29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQy
LXN5c2N0cmwueWFtbAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAw
MDAwMC4uN2I1MGJiNTZiNGNmCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwu
eWFtbAo+Pj4gQEAgLTAsMCArMSw0NiBAQAo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9zb3BoZ28vc29waGdvLHNnMjA0
Mi1zeXNjdHJsLnlhbWwjCj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4+PiArCj4+PiArdGl0bGU6IFNvcGhnbyBTRzIwNDIgU29DIHN5
c3RlbSBjb250cm9sCj4+PiArCj4+PiArbWFpbnRhaW5lcnM6Cj4+PiArICAtIENoZW4gV2FuZyA8
dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pj4gKwo+Pj4gK2Rlc2NyaXB0aW9uOgo+Pj4gKyAg
VGhlIFNvcGhnbyBzeXN0ZW0gY29udHJvbCBpcyBhIHJlZ2lzdGVycyBibG9jayAoU1lTX0NUUkwp
LCBwcm92aWRpbmcgbXVsdGlwbGUKPj4+ICsgIGxvdyBsZXZlbCBwbGF0Zm9ybSBmdW5jdGlvbnMg
bGlrZSBjaGlwIGNvbmZpZ3VyYXRpb24sIGNsb2NrIGNvbnRyb2wsIGV0Yy4KPj4+ICsKPj4+ICtw
cm9wZXJ0aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsgICAgY29uc3Q6IHNvcGhnbyxzZzIw
NDItc3lzY3RybAo+Pj4gKwo+Pj4gKyAgcmVnOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+
Pj4gKyAgY2xvY2stY29udHJvbGxlcjoKPj4+ICsgICAgIyBDaGlsZCBub2RlCj4+IERyb3AgdGhl
IGNvbW1lbnQsIGl0IGlzIG9idmlvdXMuIEl0IGNhbm5vdCBiZSBhbnl0aGluZyBlbHNlLgo+Pgo+
Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXN5c2Nsay55YW1sIwo+
Pj4gKyAgICB0eXBlOiBvYmplY3QKPj4gV2h5IGlzbid0IHRoaXMgbWVyZ2VkIGhlcmU/IFlvdSBk
byBub3QgbmVlZCB0aGUgY2hpbGQgbm9kZSByZWFsbHkuLi4KPj4gdW5sZXNzIHRoZSBjbG9jayBp
bnB1dHMgYXJlIHNwZWNpZmljIHRvIHRoYXQgY2xvY2sgY29udHJvbGxlciBhbmQgeW91Cj4+IHdp
bGwgaGF2ZSBoZXJlIG1vcmUgZGV2aWNlcz8gQnV0IHdoZXJlIGFyZSB0aGV5IGluIHN1Y2ggY2Fz
ZT8KPiBJIGRvbid0IHNlZSBtb3JlIGRldmljZXMgd2lsbCBiZSBpbmNsdWRlZCBsYXRlci4gSXQg
c2hvdWxkIGJlIG9rIHRvIAo+IG1lcmdlIHRoZW0gaW50byBvbmUuCj4+PiArCj4+PiArcmVxdWly
ZWQ6Cj4+PiArICAtIGNvbXBhdGlibGUKPj4+ICsgIC0gcmVnCj4+PiArICAtIGNsb2NrLWNvbnRy
b2xsZXIKPj4+ICsKPj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4+ICsKPj4+ICtl
eGFtcGxlczoKPj4+ICsgIC0gfAo+Pj4gKyAgICBzeXN0ZW0tY29udHJvbEAzMDAxMDAwMCB7Cj4+
IFdoeSBkaWQgeW91IGNoYW5nZSB0aGUgbmFtZT8gUGxlYXNlIHByb3ZpZGUgZGV0YWlsZWQgY2hh
bmdlbG9nIHdpdGgKPj4gZXhwbGFuYXRpb24gb2Ygc3VjaCBjaGFuZ2VzLgo+IAo+IEkgY2hhbmdl
ZCB0aGUgbmFtZSBkdWUgdG8gSSBmaW5kIHRoZSAKPiBUUk0oaHR0cHM6Ly9naXRodWIuY29tL3Nv
cGhnby9zb3BoZ28tZG9jL2Jsb2IvbWFpbi9TRzIwNDIvVFJNL3NvdXJjZS9zeXN0ZW0tY29udHJv
bC5yc3QpIAo+IGNhbGwgaXQgInN5c3RlbSBjb250cm9sIizCoCBzbyBJIGNoYW5nZWQgaXQgaW4g
djguCj4gCj4gV2hpY2ggb25lIGRvIHlvdSBwcmVmZXI/IEknbSBub3Qgc3VyZSBpZiB0aGVyZSBh
cmUgYW55IHJlcXVpcmVtZW50cyBmb3IgCj4gdGhpcz8KCk5vZGUgbmFtZXMgc2hvdWxkIGJlIGdl
bmVyaWMgYW5kIGZvbGxvdyBjb21tb24gZ3VpZGVsaW5lcywgbm90IG1hdGNoCnlvdXIgVFJNLiBQ
bGVhc2UgdXNlIHRoZSBzYW1lIG5hbWUgYWxsIG90aGVyIGRldmljZXMgdXNlIGZvciB0aGUgc2Ft
ZSBjbGFzcy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
