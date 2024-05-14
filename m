Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399FC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yebnz7P+StnQahaOKM79bKoiANeFAAJH32QQzjidI2o=; b=Pp/N9kOs6JVbm8
	wJYIHTu73TqJyVFJ6sN1Q/khpcjE2nTYltvb0bV3Asm4MqqMhPxIh+N9ayJixGBY4rzWJZqdfF6un
	eCZB6aRjgcmxCyC9RHl+O8XRwlVQ6OdbQazRSdyBEiL0Pyu4FpkCpchGipQlZNHVUIpvLXhEzHqlI
	u5b0pQap/gVZXf6UdKURWKyifDt3XCKPGPz0jt/VHkAOH0H+hMK6TJvlLSWkFMjtn8MxH7VJ+u7V6
	rPJFvWk9BRVXLaXgf6QQEshekQZDrJU8jf/jpqWPM9jr/IsKVQ3t6nUdzZhrbgOMWPe3Nhvowm0P8
	QGqGiwsEKZugcICVB2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tY9-0000000GFG2-37wg;
	Tue, 14 May 2024 14:54:41 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tY6-0000000GFCi-2fGJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:54:40 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-36c90b7f4a5so20375605ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715698467; x=1716303267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Z82cBCgLMv0ZYRz/HRSf8L92nhc1deFHJBIJjw5gOc=;
        b=2xog2fDIUhcQsGsSPJhYyPT4jZia1Ic1U6TUuZSi/UiNlex4UabpV0yK4b1TiLL1hU
         NCXiNupY/HyLJzZsEjtADYzoVVrxOh45hAoYE/ZwrOHbx3IYM0b2srheDfbEOsjgpA3r
         TfOSMSL4SndNQ+ck/ZoSZFZnaBvKN50AKgniNhUB5tVgpSuogCIFUJCscZaX1hZIVyqJ
         fChTkITIvJEh3ZMkYG1SH6caIxQcRjbvYyNyJFLNAWl+ReaqBGIPQxx5BPRm0pyQMGbd
         swvEKkAo6Nt+vtteXY8Uen10HccJBdCnlCj7ofkv11UlepvaZdfeeoYwLNScBIdXEcmH
         nhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715698467; x=1716303267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Z82cBCgLMv0ZYRz/HRSf8L92nhc1deFHJBIJjw5gOc=;
        b=DhWOk3EJo13XAABInhm1vjntasEEUALEEdXo6+CFBmJJnDXwrDFf/nwTv3+OuTKn9w
         Gc33H2kZ6WtX+RIMuvzItYD0b6kPpTAW+TihzByjE3yh6waX2XHP4TXwtabZ78l7jieI
         U7YlP8H4QjKCbUF51lv0HLX8QndpN/DruZB7U23hhT/2+RJlXA9QHA51FyxqdxbP3G7Q
         AAR9kqULExsdN8keeJv6N5m1USlFoKB20+MNDEevMBnIUd4iCFLlYjpjNp2Hlv4JZEsm
         PhnEfFNzPrUZwONlSq44Tnegdy+pRSXyRqBXzl31yALgkb+wGQzwZsqkBxXygdBn/Pcz
         kjpA==
X-Forwarded-Encrypted: i=1; AJvYcCWsKLetlMxbKnGHvF7xy2qTn3NKQCjaB3hCnRMpTxJ0sfxwWZZuNHYjIB4KiQre8ej8mn11FPn8sTS00TpqGLuP5pzorSQaA94WYReMmUfZ
X-Gm-Message-State: AOJu0YyoiyULqDW9JP6Vkx2Dfadb+H8yfzFnqVYk6Iu7pbZnd+OniTEf
	fxTXYwqzruXlV1YoGRgYmjuIwJceEp36gvv003XLGW9XmD0U2Uenfihcnx/asRkOowOqlhk5JQs
	wzg6X/xDAxCWKQt5PpFsZuRil0zgI+Yzl9alovg==
X-Google-Smtp-Source: AGHT+IGCHJkMeiCD73H8EU7f+DvHYW9crMlnudeHRZ1GpJ+PgJcHJr4CDLf335JWUQeU2X9JLK6YCyrTqcy9lzrchQ8=
X-Received: by 2002:a05:6e02:1385:b0:369:976a:584a with SMTP id
 e9e14a558f8ab-36cc12aaaeemr122086975ab.6.1715698467288; Tue, 14 May 2024
 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
 <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
 <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
 <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com> <CAAhSdy1SDd=VUqDQA0T5n9LwHo=3uGzFq1dUcbDFcB3aBdaioA@mail.gmail.com>
In-Reply-To: <CAAhSdy1SDd=VUqDQA0T5n9LwHo=3uGzFq1dUcbDFcB3aBdaioA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 May 2024 20:24:15 +0530
Message-ID: <CAAhSdy33DcNw+pbDRrR=hBH86kwvu3xZbomQby8XhRXcc-exqQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Nick Hu <nick.hu@sifive.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, palmer@dabbelt.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_075438_699595_99FFB04D 
X-CRM114-Status: GOOD (  47.17  )
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

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgNzo1M+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgTmljaywKPgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDI0IGF0
IDM6MjDigK9QTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhp
IFVsZiwKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgdmFsdWFibGUgc3VnZ2VzdGlvbi4KPiA+
IEkgc2luY2VyZWx5IGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbmRpbmcgdG8geW91
ciBtZXNzYWdlLiBXZQo+ID4gaGF2ZSBkaWxpZ2VudGx5IHdvcmtlZCBvbiBleHBlcmltZW50aW5n
IHdpdGggdGhlIHN1Z2dlc3Rpb24geW91Cj4gPiBwcm92aWRlZC4KPiA+Cj4gPiBBcyBwZXIgeW91
ciByZWNvbW1lbmRhdGlvbiwgd2UgaGF2ZSBpbmNvcnBvcmF0ZWQgdGhlICJwb3dlci1kb21haW5z
PTw+Cj4gPiBwcm9wZXJ0eSIgaW50byB0aGUgY29uc3VtZXIncyBub2RlLCByZXN1bHRpbmcgaW4g
bW9kaWZpY2F0aW9ucyB0byB0aGUKPiA+IERUUyBhcyBpbGx1c3RyYXRlZCBiZWxvdzoKPiA+Cj4g
PiBjcHVzIHsKPiA+ICAgICAuLi4KPiA+ICAgICAgZG9tYWluLWlkbGUtc3RhdGVzIHsKPiA+ICAg
ICAgICAgICAgQ0xVU1RFUl9TTEVFUDpjbHVzdGVyLXNsZWVwIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiZG9tYWluLWlkbGUtc3RhdGUiOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgLi4uCj4gPiAgICAgICAgICAgICB9Cj4gPiAgICAgIH0KPiA+ICAgICAg
cG93ZXItZG9tYWlucyB7Cj4gPiAgICAgICAgICAgICAuLi4KPiA+ICAgICAgICAgICAgIC4uLgo+
ID4gICAgICAgICAgICAgQ0xVU1RFUl9QRDogY2x1c3RlcnBkIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgZG9tYWluLWlkbGUtc3RhdGVzID0gPCZDTFVTVEVSX1NMRUVQPjsKPiA+ICAgICAgICAg
ICAgIH07Cj4gPiAgICAgIH0KPiA+IH0KPiA+IHNvYyB7Cj4gPiAgICAgICBkZXZpY2VBQHh4eHsK
PiA+ICAgICAgICAgICAgICAuLi4KPiA+ICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZD
TFVTVEVSX1BEPjsKPiA+ICAgICAgICAgICAgICAuLi4KPiA+ICAgICAgIH0KPiA+IH0KPiA+Cj4g
PiBIb3dldmVyLCB0aGlzIGFkanVzdG1lbnQgaGFzIGxlZCB0byBhbiBpc3N1ZSB3aGVyZSB0aGUg
cHJvYmUgZm9yCj4gPiAnZGV2aWNlQScgaXMgZGVmZXJyZWQgYnkgJ2RldmljZV9saW5rc19jaGVj
a19zdXBwbGllcnMoKScgd2l0aGluCj4gPiAncmVhbGx5X3Byb2JlKCknLiBJbiBhbiBhdHRlbXB0
IHRvIG1pdGlnYXRlIHRoaXMgaXNzdWUsIHdlCj4gPiBleHBlcmltZW50ZWQgd2l0aCBhIHdvcmth
cm91bmQgYnkgYWRkaW5nIHRoZSBhdHRyaWJ1dGUKPiA+ICJzdGF0dXM9ImRpc2FibGVkIiIgdG8g
dGhlICdDTFVTVEVSX1BEJyBub2RlLiBUaGlzIGFjdGlvbiBhaW1lZCB0bwo+ID4gcHJldmVudCB0
aGUgY3JlYXRpb24gb2YgYSBkZXZpY2UgbGluayBiZXR3ZWVuICdkZXZpY2VBJyBhbmQKPiA+ICdD
TFVTVEVSX1BEJy4gTmV2ZXJ0aGVsZXNzLCB3ZSByZW1haW4gdW5jZXJ0YWluIGFib3V0IHRoZQo+
ID4gYXBwcm9wcmlhdGVuZXNzIG9mIHRoaXMgc29sdXRpb24uCj4gPgo+ID4gRG8geW91IGhhdmUg
c3VnZ2VzdGlvbnMgb24gaG93IHRvIGVmZmVjdGl2ZWx5IGFkZHJlc3MgdGhpcyBpc3N1ZT8KPgo+
IEkgdG90YWxseSBtaXNzZWQgdGhpcyBlbWFpbCBzaW5jZSBJIHdhcyBub3QgQ0MnZWQgc29ycnkg
YWJvdXQgdGhhdC4gUGxlYXNlCj4gdXNlIGdldF9tYWludGFpbmVycy5wbCB3aGVuIHNlbmRpbmcg
cGF0Y2hlcy4KCkkgc3RhbmQgY29ycmVjdGVkLiBUaGlzIHBhdGNoIGhhZCBsYW5kZWQgaW4gdGhl
ICJzcGFtIiBmb2xkZXIuIEkgZG9uJ3Qga25vdyB3aHkuCgpSZWdhcmRzLApBbnVwCgo+Cj4gVGhl
IGdlbnBkX2FkZF9wcm92aWRlcigpIChjYWxsZWQgYnkgb2ZfZ2VucGRfYWRkX3Byb3ZpZGVyX3Np
bXBsZSgpKQo+IGRvZXMgbWFyayB0aGUgcG93ZXItZG9tYWluIERUIG5vZGUgYXMgaW5pdGlhbGl6
ZWQgKGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQoKSkKPiBzbyBhZnRlciB0aGUgY3B1aWRsZS1yaXNj
di1zYmkgZHJpdmVyIGlzIHByb2JlZCB0aGUgJ2RldmljZUEnIGRlcGVuZGVuY3kgaXMKPiByZXNv
bHZlZCBhbmQgJ2RldmljZUEnIHNob3VsZCBiZSBwcm9iZWQgdW5sZXNzIHRoZXJlIGFyZSBvdGhl
ciB1bm1ldAo+IGRlcGVuZGVuY2llcy4KPgo+IFRyeSBhZGRpbmcgIiNkZWZpbmUgREVCVUciIGJl
Zm9yZSBhbGwgaW5jbHVkZXMgaW4gZHJpdmVycy9jb3JlL2Jhc2UuYwo+IGFuZCBhZGQgImxvZ2xl
dmVsPTgiIGluIGtlcm5lbCBwYXJhbWV0ZXJzLCB0aGlzIHdpbGwgcHJpbnQgcHJvZHVjZXItY29u
c3VtZXIKPiBsaW5rYWdlIG9mIGFsbCBkZXZpY2VzLgo+Cj4gTWFya2luZyB0aGUgcG93ZXItZG9t
YWluIERUIG5vZGUgYXMgImRpc2FibGVkIiBpcyBjZXJ0YWlubHkgbm90IHRoZQo+IHJpZ2h0IHdh
eS4KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IE5pY2sKPiA+Cj4g
PiBPbiBUdWUsIEFwciAzMCwgMjAyNCBhdCA0OjEz4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5z
c29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIDI5IEFwciAyMDI0IGF0
IDE4OjI2LCBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gT24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMTI6MjLigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIFVsZgo+ID4gPiA+ID4KPiA+
ID4gPiA+IE9uIE1vbiwgQXByIDI5LCAyMDI0IGF0IDEwOjMy4oCvUE0gVWxmIEhhbnNzb24gPHVs
Zi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBN
b24sIDI2IEZlYiAyMDI0IGF0IDA3OjUxLCBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdy
b3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gV2hlbiB0aGUgY3B1cyBpbiB0aGUgc2Ft
ZSBjbHVzdGVyIGFyZSBhbGwgaW4gdGhlIGlkbGUgc3RhdGUsIHRoZSBrZXJuZWwKPiA+ID4gPiA+
ID4gPiBtaWdodCBwdXQgdGhlIGNsdXN0ZXIgaW50byBhIGRlZXBlciBsb3cgcG93ZXIgc3RhdGUu
IENhbGwgdGhlCj4gPiA+ID4gPiA+ID4gY2x1c3Rlcl9wbV9lbnRlcigpIGJlZm9yZSBlbnRlcmlu
ZyB0aGUgbG93IHBvd2VyIHN0YXRlIGFuZCBjYWxsIHRoZQo+ID4gPiA+ID4gPiA+IGNsdXN0ZXJf
cG1fZXhpdCgpIGFmdGVyIHRoZSBjbHVzdGVyIHdva2VuIHVwLgo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJIHdhcyBub3QgY2NlZCB0aGlzIHBhdGNoLCBidXQgbm90aWNl
ZCB0aGF0IHRoaXMgcGF0Y2ggZ290IHF1ZXVlZCB1cAo+ID4gPiA+ID4gPiByZWNlbnRseS4gU29y
cnkgZm9yIG5vdCBub3RpY2luZyBlYXJsaWVyLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJZiBu
b3QgdG9vIGxhdGUsIGNhbiB5b3UgcGxlYXNlIGRyb3AvcmV2ZXJ0IGl0PyBXZSBzaG91bGQgcmVh
bGx5IG1vdmUKPiA+ID4gPiA+ID4gYXdheSBmcm9tIHRoZSBDUFUgY2x1c3RlciBub3RpZmllcnMu
IFNlZSBtb3JlIGluZm9ybWF0aW9uIGJlbG93Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyB8IDI0
ICsrKysrKysrKysrKysrKysrKysrKystLQo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyBiL2Ry
aXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiA+ID4gPiA+ID4gaW5kZXggZTgw
OTRmYzkyNDkxLi4yOThkYzc2YTAwY2YgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJz
L2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ID4gPiA+ID4gPiA+IEBAIC0zOTQsNiArMzk0
LDcgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9wZF9wb3dlcl9vZmYoc3RydWN0IGdlbmVyaWNf
cG1fZG9tYWluICpwZCkKPiA+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+ICAgICAgICAgc3Ry
dWN0IGdlbnBkX3Bvd2VyX3N0YXRlICpzdGF0ZSA9ICZwZC0+c3RhdGVzW3BkLT5zdGF0ZV9pZHhd
Owo+ID4gPiA+ID4gPiA+ICAgICAgICAgdTMyICpwZF9zdGF0ZTsKPiA+ID4gPiA+ID4gPiArICAg
ICAgIGludCByZXQ7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmICghc3Rh
dGUtPmRhdGEpCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+
ID4gPiA+IEBAIC00MDEsNiArNDAyLDEwIEBAIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcGRfcG93
ZXJfb2ZmKHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqcGQpCj4gPiA+ID4gPiA+ID4gICAgICAg
ICBpZiAoIXNiaV9jcHVpZGxlX3BkX2FsbG93X2RvbWFpbl9zdGF0ZSkKPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ICsgICAgICAgcmV0ID0gY3B1X2NsdXN0ZXJfcG1fZW50ZXIoKTsKPiA+ID4gPiA+ID4gPiArICAg
ICAgIGlmIChyZXQpCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJhdGhlciB0aGFuIHVzaW5nIHRoZSBDUFUgY2x1c3RlciBu
b3RpZmllcnMsIGNvbnN1bWVycyBvZiB0aGUgZ2VucGQKPiA+ID4gPiA+ID4gY2FuIHJlZ2lzdGVy
IHRoZW1zZWx2ZXMgdG8gcmVjZWl2ZSBnZW5wZCBvbi9vZmYgbm90aWZpZXJzLgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBJbiBvdGhlciB3b3Jkcywgbm9uZSBvZiB0aGlzIHNob3VsZCBiZSBuZWVk
ZWQsIHJpZ2h0Pwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sh
Cj4gPiA+ID4gPiBNYXliZSBJIG1pc3Mgc29tZXRoaW5nLCBJJ20gd29uZGVyaW5nIGFib3V0IGEg
Y2FzZSBsaWtlIGJlbG93Ogo+ID4gPiA+ID4gSWYgd2UgaGF2ZSBhIHNoYXJlZCBMMiBjYWNoZSBj
b250cm9sbGVyIGluc2lkZSB0aGUgY3B1IGNsdXN0ZXIgcG93ZXIKPiA+ID4gPiA+IGRvbWFpbiBh
bmQgd2UgYWRkIHRoaXMgY29udHJvbGxlciB0byBiZSBhIGNvbnN1bWVyIG9mIHRoZSBwb3dlcgo+
ID4gPiA+ID4gZG9tYWluLCBTaG91bGRuJ3QgdGhlIGdlbnBkIGludm9rZSB0aGUgZG9tYWluIGlk
bGUgb25seSBhZnRlciB0aGUKPiA+ID4gPiA+IHNoYXJlZCBMMiBjYWNoZSBjb250cm9sbGVyIGlz
IHN1c3BlbmRlZD8KPiA+ID4gPiA+IElzIHRoZXJlIGEgd2F5IHRoYXQgd2UgY2FuIHB1dCB0aGUg
TDIgY2FjaGUgZG93biB3aGlsZSBhbGwgY3B1cyBpbiB0aGUKPiA+ID4gPiA+IHNhbWUgY2x1c3Rl
ciBhcmUgaWRsZT8KPiA+ID4gPiA+ID4gWy4uLl0KPiA+ID4gPiBTb3JyeSwgSSBtYWRlIHNvbWUg
bWlzdGFrZSBpbiBteSBzZWNvbmQgcXVlc3Rpb24uCj4gPiA+ID4gVXBkYXRlIHRoZSBxdWVzdGlv
biBoZXJlOgo+ID4gPiA+IElzIHRoZXJlIGEgd2F5IHRoYXQgd2UgY2FuIHNhdmUgdGhlIEwyIGNh
Y2hlIHN0YXRlcyB3aGlsZSBhbGwgY3B1cyBpbiB0aGUKPiA+ID4gPiBzYW1lIGNsdXN0ZXIgYXJl
IGlkbGUgYW5kIHRoZSBjbHVzdGVyIGNvdWxkIGJlIHBvd2VyZWQgZG93bj8KPiA+ID4KPiA+ID4g
SWYgdGhlIEwyIGNhY2hlIGlzIGEgY29uc3VtZXIgb2YgdGhlIGNsdXN0ZXIsIHRoZSBjb25zdW1l
ciBkcml2ZXIgZm9yCj4gPiA+IHRoZSBMMiBjYWNoZSBzaG91bGQgcmVnaXN0ZXIgZm9yIGdlbnBk
IG9uL29mZiBub3RpZmllcnMuCj4gPiA+Cj4gPiA+IFRoZSBkZXZpY2UgcmVwcmVzZW50aW5nIHRo
ZSBMMiBjYWNoZSBuZWVkcyB0byBiZSBlbmFibGVkIGZvciBydW50aW1lCj4gPiA+IFBNLCB0byBi
ZSB0YWtlbiBpbnRvIGFjY291bnQgY29ycmVjdGx5IGJ5IHRoZSBjbHVzdGVyIGdlbnBkLiBJbiB0
aGlzCj4gPiA+IGNhc2UsIHRoZSBkZXZpY2Ugc2hvdWxkIG1vc3QgbGlrZWx5IHJlbWFpbiBydW50
aW1lIHN1c3BlbmRlZCwgYnV0Cj4gPiA+IGluc3RlYWQgcmVseSBvbiB0aGUgZ2VucGQgb24vb2Zm
IG5vdGlmaWVycyB0byB1bmRlcnN0YW5kIHdoZW4KPiA+ID4gc2F2ZS9yZXN0b3JlIG9mIHRoZSBj
YWNoZSBzdGF0ZXMgc2hvdWxkIGJlIGRvbmUuCj4gPiA+Cj4gPiA+IEtpbmQgcmVnYXJkcwo+ID4g
PiBVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
