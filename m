Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A34C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 02:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZmgopsoZEvuTd3ysRXrGbZxn4uo8zlvMO+g4dgKErM=; b=YaIq4l7uDU6rlR
	wwy2h4/cWOglEoU5SjKJZUf3Pt2VaYGSCXHKmQxoBQOUOTtcVJmfGrie5PbE7/JWl9wn1CVVrpL5t
	f0AZY3J7sRd85zaUHAIrel77RvB4LPCHLDG2fLOFTwMaoUdu0qk+SMPghJ/t6LrO60Yv+XHIFW35h
	Y7CxiS9iSR8t9w6bfMXDLWPS3yrm0op2+FEiWyd71xUIig/UcpHZcxuu6svSFC9i9SJ1oY0CNIUIw
	Bf7meUn6hI1GFANo+F/egbAR8sSptgnjAKZ3IA3g9QYF1erXkcTe0xCmP2E9mjUjGhs8OyJZofH9Q
	6igUKarsHAdLqaj1sCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6KD-0000000ErXp-3Nfd;
	Fri, 12 Apr 2024 02:07:34 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6KA-0000000ErTk-2ONZ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 02:07:32 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6154a1812ffso4503807b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712887644; x=1713492444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQm9N6HlYQFv2uqQbKzOf53M4hr41FQjJSq0UsW2Bjw=;
        b=d2THkt4jmVYGxcpRxsAz7POLDrwIp5dxFP/k6FPTXZtj8Mq7UBH8XV8ix+dmIwNR+c
         HgYfOohf+N5yFfXn6Fip9bH37H7eJS96TLrEOJLaMCHttWO3Go29DD0MRIXxde/RgqyD
         p1XxaX9Ek7FsRUs/lS5mD94CTii2fxvvRSCiD3nrTh4+XvNY6T1wwONiDO29wGBr7kBn
         xbz+FV1QZyyeo5ji0p1wl7FY0d0N0PDEqdY2hbCVhL7Svkl1JK+4qjq3Q2ZlCZyt7bNQ
         LM5C53BuBKueyve8RQKsju0gCZ3MqCVVIYbqtoSJAcKGV7f/PpZUNsO+Vn/0qjTsr692
         iGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712887644; x=1713492444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQm9N6HlYQFv2uqQbKzOf53M4hr41FQjJSq0UsW2Bjw=;
        b=kPhWEWchCu04BH1KZcqVqZIPoNQkV8dJdUfY6nPs5MLjDd2aJcsCNDmB2pfOeSQuwt
         juEIFbcexMIDIi8ovOQM8QxU1jMSCB0ReBYPOsxmsonYyLrmGcd8mnLZiESLrVH7NUQg
         Ng+SkdSkNGdA66DqClHtKIjODTP4C/LlkadeqlwFnhvTzAAvBqtidsLbiOZJ7UYHnyJV
         qjSdxbjKRRRmMrwbABq7oZEFcKuWEtlS+j4wvxEDn64eNgj2oV81IPuoQg14AkuIHGmc
         cbiVfTJCzYP8S9+sD/l1/vQkdXvyqqNpu7i/b1Nw0ca13lloFDhQwqExu1p7blXqtnaA
         4xZA==
X-Gm-Message-State: AOJu0YwbyRmTq5Qj4lfJU/+nq0y/DUBG6LJVArbSwZ1rvq0dkxWgoYA4
	WxVuqZsjtsSQqxfGW4iFHg8F3jizT8CSTTOdPMCG44nucaeR8Pc20GxSteNCfTIlXgHgys58Mu7
	VcRxthCciU3Z77Zj4OcBxt6vdGmVIMiqTctE8XPIlJkzRxIdwiZBuzw==
X-Google-Smtp-Source: AGHT+IEyah2wqUDUWwo2dw/PFJAZ80ndyEe9wSUytDMdW7m4oK2cK2GqDd50cMMO1kXUDCo8ycdzX/F5kxc1yT2BDdc=
X-Received: by 2002:a0d:d614:0:b0:615:16a1:4a04 with SMTP id
 y20-20020a0dd614000000b0061516a14a04mr1202091ywd.31.1712887643882; Thu, 11
 Apr 2024 19:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-3-nylon.chen@sifive.com> <f5ukvah2ujko2iht3pd5jxq5kaukbs5z3pn5s7qwcnx4aqr3yv@mwtbwkcfa44a>
 <CAHh=Yk8MXy73d8M1J5bVu4spDMbjQDneVTqA=Ts=SGPDO7PXMQ@mail.gmail.com>
In-Reply-To: <CAHh=Yk8MXy73d8M1J5bVu4spDMbjQDneVTqA=Ts=SGPDO7PXMQ@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 12 Apr 2024 10:07:12 +0800
Message-ID: <CAHh=Yk-WmzJe0vb+noX8Gb13BL2SOB=MwSB=F9nH_G-j9zi1Lw@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] pwm: sifive: change the PWM algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_190730_795273_4AB24578 
X-CRM114-Status: GOOD (  29.40  )
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

Tnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiDmlrwgMjAyNOW5tDTmnIgy5pelIOmA
seS6jCDkuIrljYgxMDowOOWvq+mBk++8mgo+Cj4gVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIwMjTlubQz5pyIMTnml6Ug6YCx5LqMIOS4iuWN
iDI6MTblr6vpgZPvvJoKPiA+Cj4gPiBPbiBUaHUsIEZlYiAyMiwgMjAyNCBhdCAwNDoxMjozMFBN
ICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJl
c2VudHMgdGhlIHB1bHNlIGluYWN0aXZlIHRpbWUsIGFuZCB0aGUgcmVzdWx0Cj4gPiA+IG9mIHRo
aXMgYWxnb3JpdGhtIGlzIHRoZSBwdWxzZSBhY3RpdmUgdGltZS4KPiA+ID4gVGhlcmVmb3JlLCB3
ZSBtdXN0IHJldmVyc2UgdGhlIHJlc3VsdC4KPiA+ID4KPiA+ID4gVGhlIHJlZmVyZW5jZSBpcyBT
aUZpdmUgRlU3NDAtQzAwMCBNYW51YWxbMF0KPiA+ID4KPiA+ID4gTGluazogaHR0cHM6Ly9zaWZp
dmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJlNjAwLTFmOTMtNGY0MS1iMmQ4LTg2ZWQ4YjE2
YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBkZiBbMF0KPiA+ID4KPiA+ID4gQ28tZGV2ZWxv
cGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBWaW5j
ZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMTAgKysrKysrLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+
ID4gPiBpbmRleCBlYWJkZGI3Yzc4MjAuLmE1ODZjZmU0MTkxYiAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYwo+ID4gPiBAQCAtMTEwLDkgKzExMCwxMCBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfZ2V0
X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUp
Cj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSA9IHB3
bV9zaWZpdmVfY2hpcF90b19kZGF0YShjaGlwKTsKPiA+ID4gLSAgICAgdTMyIGR1dHksIHZhbDsK
PiA+ID4gKyAgICAgdTMyIGR1dHksIHZhbCwgaW5hY3RpdmU7Cj4gPiA+Cj4gPiA+IC0gICAgIGR1
dHkgPSByZWFkbChkZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdNQ01QKHB3bS0+aHdwd20pKTsK
PiA+ID4gKyAgICAgaW5hY3RpdmUgPSByZWFkbChkZGF0YS0+cmVncyArIFBXTV9TSUZJVkVfUFdN
Q01QKHB3bS0+aHdwd20pKTsKPiA+ID4gKyAgICAgZHV0eSA9ICgxVSA8PCBQV01fU0lGSVZFX0NN
UFdJRFRIKSAtIDEgLSBpbmFjdGl2ZTsKPiA+ID4KPiA+ID4gICAgICAgc3RhdGUtPmVuYWJsZWQg
PSBkdXR5ID4gMDsKPiA+ID4KPiA+ID4gQEAgLTEyMyw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IHB3
bV9zaWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKPiA+ID4gICAgICAgc3RhdGUtPnBlcmlvZCA9IGRkYXRhLT5yZWFsX3BlcmlvZDsK
PiA+ID4gICAgICAgc3RhdGUtPmR1dHlfY3ljbGUgPQo+ID4gPiAgICAgICAgICAgICAgICh1NjQp
ZHV0eSAqIGRkYXRhLT5yZWFsX3BlcmlvZCA+PiBQV01fU0lGSVZFX0NNUFdJRFRIOwo+ID4gPiAt
ICAgICBzdGF0ZS0+cG9sYXJpdHkgPSBQV01fUE9MQVJJVFlfSU5WRVJTRUQ7Cj4gPiA+ICsgICAg
IHN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7Cj4gPiA+Cj4gPiA+ICAgICAg
IHJldHVybiAwOwo+ID4gPiAgfQo+ID4gPiBAQCAtMTM5LDcgKzE0MCw3IEBAIHN0YXRpYyBpbnQg
cHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNl
ICpwd20sCj4gPiA+ICAgICAgIGludCByZXQgPSAwOwo+ID4gPiAgICAgICB1MzIgZnJhYzsKPiA+
ID4KPiA+ID4gLSAgICAgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9MQVJJVFlfSU5WRVJT
RUQpCj4gPiA+ICsgICAgIGlmIChzdGF0ZS0+cG9sYXJpdHkgIT0gUFdNX1BPTEFSSVRZX05PUk1B
TCkKPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4KPiA+ID4gICAgICAg
Y3VyX3N0YXRlID0gcHdtLT5zdGF0ZTsKPiA+ID4gQEAgLTE1OSw2ICsxNjAsNyBAQCBzdGF0aWMg
aW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rl
dmljZSAqcHdtLAo+ID4gPiAgICAgICBmcmFjID0gRElWNjRfVTY0X1JPVU5EX0NMT1NFU1QobnVt
LCBzdGF0ZS0+cGVyaW9kKTsKSGkgVXdlLAo+ID4gPiAgICAgICAvKiBUaGUgaGFyZHdhcmUgY2Fu
bm90IGdlbmVyYXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCkRvIHlvdSBtZWFuIHRoYXQgaWYgdGhl
IGluZmVyZW5jZSBpcyBjb3JyZWN0LCB0aGlzIGNvbW1lbnQgc2hvdWxkIGJlIG1vZGlmaWVkPwo+
ID4KPiA+IElzIHRoaXMgc3RpbGwgdHJ1ZSBub3cgdGhhdCB3ZSBrbm93IHRoYXQgUFdNX1NJRklW
RV9QV01DTVAgaXMgdGhlCj4gPiBpbmFjdGl2ZSB0aW1lIGluIGEgcGVyaW9kPyBJZiB5b3UgZml4
IHRoYXQsIHRoZSBzYW1lIGNsYWltIGluIHRoZSBoZWFkZXIKPiA+IG9mIHRoZSBkcml2ZXIgbmVl
ZHMgYWRhcHRpb24sIHRvby4KPiBJIGJlbGlldmUgdGhlIHN0YXRlbWVudCBpcyB0cnVlLCBidXQg
SSBkb24ndCBrbm93IHdoaWNoIHBhcnQgdGhlCj4gZHJpdmVyIGhlYWRlciBmaWxlIHJlZmVycyB0
by4KPiA+Cj4gPiA+ICAgICAgIGZyYWMgPSBtaW4oZnJhYywgKDFVIDw8IFBXTV9TSUZJVkVfQ01Q
V0lEVEgpIC0gMSk7Cj4gPiA+ICsgICAgIGZyYWMgPSAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURU
SCkgLSAxIC0gZnJhYzsKPiA+Cj4gPiBJIGxpa2UgdGhlIGFkZGl0aW9uYWwgdmFyaWFibGUgaW4g
cHdtX3NpZml2ZV9nZXRfc3RhdGUoKS4gQ2FuIHlvdSBwbGVhc2UKPiA+IGFkZCBvbmUgaGVyZSwg
dG9vPwo+IGdvdCBpdAo+ID4KPiA+ID4gICAgICAgbXV0ZXhfbG9jaygmZGRhdGEtPmxvY2spOwo+
ID4gPiAgICAgICBpZiAoc3RhdGUtPnBlcmlvZCAhPSBkZGF0YS0+YXBwcm94X3BlcmlvZCkgewo+
ID4KPiBUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGltZSB0byBoZWxwIG1lIHJldmlldyBteSBp
bXBsZW1lbnRhdGlvbi4KPgo+IE55bG9uCj4gPiBCZXN0IHJlZ2FyZHMKPiA+IFV3ZQo+ID4KPiA+
IC0tCj4gPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2Ug
S2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiA+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25z
ICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
