Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BC8C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QxMZd7ta7zP8Da1PPnn2VroGrI9dRXKh7fHRzlRCVQ=; b=V+6QYHTYIjTTvJ
	51IgyRykUg1WT/IoR/Ap2CN9XCsM57vgSP7h6NsRLFdRC+n+GZrrDVfBGI3ZrfcOGU4E7y6LEDgoE
	ZKpm1SC/nQUzTdW9KgKdUFVtwKDNZxz3AnswrJ18db3jk2ISaxAXLzHZdyisMTihqskwI87msezF5
	Pbp5IXVUKScrJ3S4KC5oOxlZ5TbiEIYuKxSCgjRlzkm7JV5oUJCwJje0s8MwJPfRQ5qACEVOEuoW6
	GKoJokbvF/JM4R+yFrdDIFasGfVMedGJMvNnFT6kuZ1UMpy9xbH+OeBuRub9cMDiHQ6w/46uvMICu
	QQ5UCMNRGISgUeJcsMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5SC-002WrL-0o;
	Thu, 24 Aug 2023 08:12:32 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5S8-002Wp5-2H
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 08:12:30 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcce32ccd4so7396071fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692864730; x=1693469530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XtVGHBP9P4Y0/4aCrjzc4LTdRWVLOhNvr5Izw4+meus=;
        b=dZ6YmH7CjijVQfN8DUwJxq3sSNJMl9fKS5JusKVl1G2LsaF6mtsNp3moXTsnrFVaCp
         euuoHhX6ONNWDr0/1VLomDnhMbvcAV3js1Yn64RCFOnD4ka9ixfQHZ0K8WceCm9Tm22l
         OD05FRhpO3epEqXNGRhiTwMMIiFTiSPqHcoU1qXJxtrvOyGiSztrMU8Zc4VGC5TRYS5h
         zCU1IL6qNyuWdsyqUorykTxD20PJL3yaP5MOE7dV22kkAYfaPqt7KPA8hSJrFfc7R+gl
         SfoJwT81NjdXQr5MBWDh9BZjP5UWJg6+a6/pbSApAVZFGKBxZw6/PiTX5Vjq+zpFXHAL
         /yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864730; x=1693469530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtVGHBP9P4Y0/4aCrjzc4LTdRWVLOhNvr5Izw4+meus=;
        b=IUlBPjxkVm4110weXMaSOroYK1trSc9BBHEsPLch3CEA3rrfd/RiALbeYC6D5l1Mxq
         VgtktKXSl6wVRxeMpmLyx9Lo+8RfBkEdekGsguY5MVowByUrFrBD89UGyfpmATXORc2v
         yvGRN85jbr2hKYxdCPTGVtqVPA8se0AZMY5vr/hnwfD380Q1zW/QIYkHr3RYk74mCD5x
         t/61vgKd4wj1Ya7DOWueXj7CnTAAW7htN0wK4b4j8KEqCUCBDeod9Kzm/hqrKaPPEZDh
         C9O+OIGyqbnMhGdnwr2ENmQr89rStetK5lcnLXypXiWm+UtR6fDo6mZ4VPxS5EhtdHMe
         gW2g==
X-Gm-Message-State: AOJu0YzI67RQ2UNOGpX+4edt6MBux282CnQvbMEG1Tb5zOclJzPT2qm4
	rIBFj1riP9Iaiy26SJQemMZlfQ==
X-Google-Smtp-Source: AGHT+IFN3hm3+YpJmRPKQh2EefYd8Tq9QDpzMIJzXNlZVipOpMuMUz91qN0BxQYT8twM2HtDhC25EA==
X-Received: by 2002:a19:7516:0:b0:4fe:5838:3dbf with SMTP id y22-20020a197516000000b004fe58383dbfmr9712509lfe.1.1692864729534;
        Thu, 24 Aug 2023 01:12:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:81c2:f100:1b1d:60bf:66d8:40d6? ([2a01:cb15:81c2:f100:1b1d:60bf:66d8:40d6])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003feee8d8011sm1832770wmi.41.2023.08.24.01.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:12:08 -0700 (PDT)
Message-ID: <d3696b2a-3d21-4ab6-8cef-20b8ee21742f@rivosinc.com>
Date: Thu, 24 Aug 2023 10:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] riscv: Deduplicate IRQ stack switching
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song
 <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230815203442.1608773-8-samitolvanen@google.com>
 <20230815203442.1608773-10-samitolvanen@google.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20230815203442.1608773-10-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_011228_966850_06F49321 
X-CRM114-Status: GOOD (  21.21  )
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

CgpPbiAxNS8wOC8yMDIzIDIyOjM0LCBTYW1pIFRvbHZhbmVuIHdyb3RlOgo+IFdpdGggQ09ORklH
X0lSUV9TVEFDS1MsIHdlIHN3aXRjaCB0byBhIHNlcGFyYXRlIHBlci1DUFUgSVJRIHN0YWNrCj4g
YmVmb3JlIGNhbGxpbmcgaGFuZGxlX3Jpc2N2X2lycSBvciBfX2RvX3NvZnRpcnEuIFdlIGN1cnJl
bnRseQo+IGhhdmUgZHVwbGljYXRlIGlubGluZSBhc3NlbWJseSBzbmlwcGV0cyBmb3Igc3RhY2sg
c3dpdGNoaW5nIGluCj4gYm90aCBjb2RlIHBhdGhzLiBOb3cgdGhhdCB3ZSBjYW4gYWNjZXNzIHBl
ci1DUFUgdmFyaWFibGVzIGluCj4gYXNzZW1ibHksIGltcGxlbWVudCBjYWxsX29uX2lycV9zdGFj
ayBpbiBhc3NlbWJseSwgYW5kIHVzZSB0aGF0Cj4gaW5zdGVhZCBvZiByZWR1ZGFudCBpbmxpbmUg
YXNzZW1ibHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVu
QGdvb2dsZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgICAg
fCAgNSArKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oIHwgIDMgKysr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgfCAzMiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMgICAgICAgICAgICB8
IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jICAgICAgICAgIHwgMjkgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FzbS5oCj4gaW5kZXggYmZiNGMyNmYxMTNjLi44ZTQ0NmJlMmQ1N2MgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLmgKPiBAQCAtMTA0LDYgKzEwNCwxMSBAQAo+ICAuZW5kbQo+ICAjZW5kaWYgLyog
Q09ORklHX1NNUCAqLwo+ICAKPiArLm1hY3JvIGxvYWRfcGVyX2NwdSBkc3QgcHRyIHRtcAo+ICsJ
YXNtX3Blcl9jcHUgXGRzdCBccHRyIFx0bXAKPiArCVJFR19MIFxkc3QsIDAoXGRzdCkKPiArLmVu
ZG0KPiArCj4gIAkvKiBzYXZlIGFsbCBHUHMgZXhjZXB0IHgxIH4geDUgKi8KPiAgCS5tYWNybyBz
YXZlX2Zyb21feDZfdG9feDMxCj4gIAlSRUdfUyB4NiwgIFBUX1QxKHNwKQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pcnFfc3RhY2suaAo+IGluZGV4IGU0MDQyZDI5NzU4MC4uNjQ0MWRlZDNiMGNmIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxX3N0YWNrLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oCj4gQEAgLTEyLDYgKzEyLDkgQEAKPiAgCj4g
IERFQ0xBUkVfUEVSX0NQVSh1bG9uZyAqLCBpcnFfc3RhY2tfcHRyKTsKPiAgCj4gK2FzbWxpbmth
Z2Ugdm9pZCBjYWxsX29uX2lycV9zdGFjayhzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiArCQkJCSAg
dm9pZCAoKmZ1bmMpKHN0cnVjdCBwdF9yZWdzICopKTsKPiArCj4gICNpZmRlZiBDT05GSUdfVk1B
UF9TVEFDSwo+ICAvKgo+ICAgKiBUbyBlbnN1cmUgdGhhdCBWTUFQJ2Qgc3RhY2sgb3ZlcmZsb3cg
ZGV0ZWN0aW9uIHdvcmtzIGNvcnJlY3RseSwgYWxsIFZNQVAnZAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+IGluZGV4
IDNkMTFhYTNhZjEwNS4uMzk4NzVmNWUwOGE2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gQEAgLTIxOCw2
ICsyMTgsMzggQEAgU1lNX0NPREVfU1RBUlQocmV0X2Zyb21fZm9yaykKPiAgCXRhaWwgc3lzY2Fs
bF9leGl0X3RvX3VzZXJfbW9kZQo+ICBTWU1fQ09ERV9FTkQocmV0X2Zyb21fZm9yaykKPiAgCj4g
KyNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ICsvKgo+ICsgKiB2b2lkIGNhbGxfb25faXJxX3N0
YWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICsgKiAJCSAgICAgICAgICB2b2lkICgqZnVuYyko
c3RydWN0IHB0X3JlZ3MgKikpOwo+ICsgKgo+ICsgKiBDYWxscyBmdW5jKHJlZ3MpIHVzaW5nIHRo
ZSBwZXItQ1BVIElSUSBzdGFjay4KPiArICovCj4gK1NZTV9GVU5DX1NUQVJUKGNhbGxfb25faXJx
X3N0YWNrKQo+ICsJLyogQ3JlYXRlIGEgZnJhbWUgcmVjb3JkIHRvIHNhdmUgcmEgYW5kIHMwIChm
cCkgKi8KPiArCWFkZGkJc3AsIHNwLCAtUklTQ1ZfU1pQVFIKPiArCVJFR19TCXJhLCAoc3ApCj4g
KwlhZGRpCXNwLCBzcCwgLVJJU0NWX1NaUFRSCj4gKwlSRUdfUwlzMCwgKHNwKQo+ICsJYWRkaQlz
MCwgc3AsIDIqUklTQ1ZfU1pQVFIKCkhpIFNhbWksCgpTb21lIGRlZmluZXMgZm9yIHN0YWNrIGZy
YW1lIG9mZnNldHMgY291bGQgYmUgYWRkZWQgaW4gYXNtLW9mZnNldHMgZm9yCnRoZSBvZmZzZXRz
OgoKCURFRklORShTVEFDS0ZSQU1FX1NJWkVfT05fU1RBQ0ssIEFMSUdOKHNpemVvZihzdHJ1Y3Qg
c3RhY2tmcmFtZSksClNUQUNLX0FMSUdOKSk7CglPRkZTRVQoU1RBQ0tGUkFNRV9GUCwgc3RhY2tm
cmFtZSwgZnApOwoJT0ZGU0VUKFNUQUNLRlJBTUVfUkEsIHN0YWNrZnJhbWUsIHJhKTsKCkFuZCB5
b3UgY2FuIHByb2JhYmx5IGluY3JlbWVudCB0aGUgc3RhY2sgYXQgb25jZSAoc2F2aW5nIHR3byBh
ZGRpIGluCnByb2xvZ3VlL2VwaWxvZ3VlKSBmb3IgYm90aCBSQSBhbmQgRlAgYW5kIHJldXNlIHRo
ZSBhc20tb2Zmc2V0cyBkZWZpbmVzOgoKCWFkZGkJc3AsIHNwLCAtU1RBQ0tGUkFNRV9TSVpFX09O
X1NUQUNLCglSRUdfUwlyYSwgU1RBQ0tGUkFNRV9SQShzcCkKCVJFR19TCXMwLCBTVEFDS0ZSQU1F
X0ZQKHNwKQoJYWRkaQlzMCwgc3AsIFNUQUNLRlJBTUVfU0laRV9PTl9TVEFDSwoKQ2zDqW1lbnQK
Cj4gKwo+ICsJLyogU3dpdGNoIHRvIHRoZSBwZXItQ1BVIElSUSBzdGFjayBhbmQgY2FsbCB0aGUg
aGFuZGxlciAqLwo+ICsJbG9hZF9wZXJfY3B1IHQwLCBpcnFfc3RhY2tfcHRyLCB0MQo+ICsJbGkJ
dDEsIElSUV9TVEFDS19TSVpFCj4gKwlhZGQJc3AsIHQwLCB0MQo+ICsJamFscglhMQo+ICsKPiAr
CS8qIFN3aXRjaCBiYWNrIHRvIHRoZSB0aHJlYWQgc3RhY2sgYW5kIHJlc3RvcmUgcmEgYW5kIHMw
ICovCj4gKwlhZGRpCXNwLCBzMCwgLTIqUklTQ1ZfU1pQVFIKPiArCVJFR19MCXMwLCAoc3ApCj4g
KwlhZGRpCXNwLCBzcCwgUklTQ1ZfU1pQVFIKPiArCVJFR19MCXJhLCAoc3ApCj4gKwlhZGRpCXNw
LCBzcCwgUklTQ1ZfU1pQVFIKPiArCj4gKwlyZXQKPiArU1lNX0ZVTkNfRU5EKGNhbGxfb25faXJx
X3N0YWNrKQo+ICsjZW5kaWYgLyogQ09ORklHX0lSUV9TVEFDS1MgKi8KPiArCj4gIC8qCj4gICAq
IEludGVnZXIgcmVnaXN0ZXIgY29udGV4dCBzd2l0Y2gKPiAgICogVGhlIGNhbGxlZS1zYXZlZCBy
ZWdpc3RlcnMgbXVzdCBiZSBzYXZlZCBhbmQgcmVzdG9yZWQuCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2lycS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKPiBpbmRleCBkMDU3
N2NjNmEwODEuLjk1ZGFmZGNiZDEzNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9p
cnEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCj4gQEAgLTYxLDMyICs2MSwxNiBA
QCBzdGF0aWMgdm9pZCBpbml0X2lycV9zdGFja3Modm9pZCkKPiAgI2VuZGlmIC8qIENPTkZJR19W
TUFQX1NUQUNLICovCj4gIAo+ICAjaWZkZWYgQ09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RB
Q0sKPiArc3RhdGljIHZvaWQgX19fZG9fc29mdGlycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAr
ewo+ICsJX19kb19zb2Z0aXJxKCk7Cj4gK30KPiArCj4gIHZvaWQgZG9fc29mdGlycV9vd25fc3Rh
Y2sodm9pZCkKPiAgewo+IC0jaWZkZWYgQ09ORklHX0lSUV9TVEFDS1MKPiAtCWlmIChvbl90aHJl
YWRfc3RhY2soKSkgewo+IC0JCXVsb25nICpzcCA9IHBlcl9jcHUoaXJxX3N0YWNrX3B0ciwgc21w
X3Byb2Nlc3Nvcl9pZCgpKQo+IC0JCQkJCSsgSVJRX1NUQUNLX1NJWkUvc2l6ZW9mKHVsb25nKTsK
PiAtCQlfX2FzbV9fIF9fdm9sYXRpbGUoCj4gLQkJImFkZGkJc3AsIHNwLCAtIlJJU0NWX1NaUFRS
ICAiXG4iCj4gLQkJUkVHX1MiICByYSwgKHNwKQkJXG4iCj4gLQkJImFkZGkJc3AsIHNwLCAtIlJJ
U0NWX1NaUFRSICAiXG4iCj4gLQkJUkVHX1MiICBzMCwgKHNwKQkJXG4iCj4gLQkJImFkZGkJczAs
IHNwLCAyKiJSSVNDVl9TWlBUUiAiXG4iCj4gLQkJIm1vdmUJc3AsICVbc3BdCQlcbiIKPiAtCQki
Y2FsbAlfX2RvX3NvZnRpcnEJCVxuIgo+IC0JCSJhZGRpCXNwLCBzMCwgLTIqIlJJU0NWX1NaUFRS
IlxuIgo+IC0JCVJFR19MIiAgczAsIChzcCkJCVxuIgo+IC0JCSJhZGRpCXNwLCBzcCwgIlJJU0NW
X1NaUFRSICAgIlxuIgo+IC0JCVJFR19MIiAgcmEsIChzcCkJCVxuIgo+IC0JCSJhZGRpCXNwLCBz
cCwgIlJJU0NWX1NaUFRSICAgIlxuIgo+IC0JCToKPiAtCQk6IFtzcF0gInIiIChzcCkKPiAtCQk6
ICJhMCIsICJhMSIsICJhMiIsICJhMyIsICJhNCIsICJhNSIsICJhNiIsICJhNyIsCj4gLQkJICAi
dDAiLCAidDEiLCAidDIiLCAidDMiLCAidDQiLCAidDUiLCAidDYiLAo+IC0JCSAgIm1lbW9yeSIp
Owo+IC0JfSBlbHNlCj4gLSNlbmRpZgo+ICsJaWYgKG9uX3RocmVhZF9zdGFjaygpKQo+ICsJCWNh
bGxfb25faXJxX3N0YWNrKE5VTEwsIF9fX2RvX3NvZnRpcnEpOwo+ICsJZWxzZQo+ICAJCV9fZG9f
c29mdGlycSgpOwo+ICB9Cj4gICNlbmRpZiAvKiBDT05GSUdfSEFWRV9TT0ZUSVJRX09OX09XTl9T
VEFDSyAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IGRlYjIxNDRkOTE0My4uODMzMTliNjgxNmRhIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCj4gQEAgLTM1MCwzMSArMzUwLDEwIEBAIHN0YXRpYyB2b2lkIG5vaW5z
dHIgaGFuZGxlX3Jpc2N2X2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgYXNtbGlua2FnZSB2
b2lkIG5vaW5zdHIgZG9faXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gIAlpcnFlbnRy
eV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfZW50ZXIocmVncyk7Cj4gLSNpZmRlZiBDT05GSUdf
SVJRX1NUQUNLUwo+IC0JaWYgKG9uX3RocmVhZF9zdGFjaygpKSB7Cj4gLQkJdWxvbmcgKnNwID0g
cGVyX2NwdShpcnFfc3RhY2tfcHRyLCBzbXBfcHJvY2Vzc29yX2lkKCkpCj4gLQkJCQkJKyBJUlFf
U1RBQ0tfU0laRS9zaXplb2YodWxvbmcpOwo+IC0JCV9fYXNtX18gX192b2xhdGlsZSgKPiAtCQki
YWRkaQlzcCwgc3AsIC0iUklTQ1ZfU1pQVFIgICJcbiIKPiAtCQlSRUdfUyIgIHJhLCAoc3ApCQlc
biIKPiAtCQkiYWRkaQlzcCwgc3AsIC0iUklTQ1ZfU1pQVFIgICJcbiIKPiAtCQlSRUdfUyIgIHMw
LCAoc3ApCQlcbiIKPiAtCQkiYWRkaQlzMCwgc3AsIDIqIlJJU0NWX1NaUFRSICJcbiIKPiAtCQki
bW92ZQlzcCwgJVtzcF0JCVxuIgo+IC0JCSJtb3ZlCWEwLCAlW3JlZ3NdCQlcbiIKPiAtCQkiY2Fs
bAloYW5kbGVfcmlzY3ZfaXJxCVxuIgo+IC0JCSJhZGRpCXNwLCBzMCwgLTIqIlJJU0NWX1NaUFRS
IlxuIgo+IC0JCVJFR19MIiAgczAsIChzcCkJCVxuIgo+IC0JCSJhZGRpCXNwLCBzcCwgIlJJU0NW
X1NaUFRSICAgIlxuIgo+IC0JCVJFR19MIiAgcmEsIChzcCkJCVxuIgo+IC0JCSJhZGRpCXNwLCBz
cCwgIlJJU0NWX1NaUFRSICAgIlxuIgo+IC0JCToKPiAtCQk6IFtzcF0gInIiIChzcCksIFtyZWdz
XSAiciIgKHJlZ3MpCj4gLQkJOiAiYTAiLCAiYTEiLCAiYTIiLCAiYTMiLCAiYTQiLCAiYTUiLCAi
YTYiLCAiYTciLAo+IC0JCSAgInQwIiwgInQxIiwgInQyIiwgInQzIiwgInQ0IiwgInQ1IiwgInQ2
IiwKPiAtCQkgICJtZW1vcnkiKTsKPiAtCX0gZWxzZQo+IC0jZW5kaWYKPiArCj4gKwlpZiAoSVNf
RU5BQkxFRChDT05GSUdfSVJRX1NUQUNLUykgJiYgb25fdGhyZWFkX3N0YWNrKCkpCj4gKwkJY2Fs
bF9vbl9pcnFfc3RhY2socmVncywgaGFuZGxlX3Jpc2N2X2lycSk7Cj4gKwllbHNlCj4gIAkJaGFu
ZGxlX3Jpc2N2X2lycShyZWdzKTsKPiAgCj4gIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
