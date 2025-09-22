Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC70CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GIsR3ef/d//xtit2jePlmKRna7x0lzeT5mpuSQOHdg=; b=jdQRPiUnPxnngs
	HCnFVxNPzvS/B/gAzL3yLUyBcCz05HyEfIfnS6QukONVSwoiO99zqvN2iwT1W6fY6LR+djknmlK09
	DuwKhnZBaUd0JKj37xmaGz+ljfJBMg6Y6+oVJDIdTJp4v9vcGhT+rwKj5XbctUulz6lCXoKbapXqZ
	tCzBDvW+40NmSLd070Yv+hxG/K16+8zXEn9qRB17Wh5KIo7nGl8dwHJ9oay5qtxGW2z17C25q+baR
	S7ijlWCGBZa0vzWxggqrPX+Hm/xXsG9kL9hA0bG+4OJ1WOKJuGTJwAQE4BqGcB71utDt/oLqU28PA
	srxSJay7Bu6xnQ6XAiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fBT-0000000AGgR-1eZR;
	Mon, 22 Sep 2025 11:58:19 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fBQ-0000000AGfw-2QiS
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 11:58:18 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-34207c1bdaeso246826fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758542294; x=1759147094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHVHNKzjAmVSWuUaTlYGOUC+2+S4tCnVfERUbvElmqo=;
        b=e6eSem+eHDDy0xehBbem/w2roGpCHDbxf2T1ZyEt3vezu+WE2NiMGYrmmKA8fHZqaX
         Ex9yRYEX1lf1rIePxDBp3DznYZkEu8aZBa6DvqMIQenC1SRckZvYQmP2f6NHHgbeSXeD
         oJiNBV1I2goBC6EbqvN0Tx0SA2GLZVvJqPlsrdXdB492N3abletoBC6T7M3Ug/6Mr1HH
         DeVHrEKnffwUsHLu6BvMZsF1Vwgefg5oyFjYgnejN7wT4dqs7JkiGiPS2lR4fo5VTluZ
         8QUtPjtWgcUKaJRw62ohLv+6XMpTKarmaj4GskKMOooOEtUshrX99DcvvHGPoiirQ6Il
         0Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542294; x=1759147094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHVHNKzjAmVSWuUaTlYGOUC+2+S4tCnVfERUbvElmqo=;
        b=XQs1TY5nMWNnrio1qF8JyvoyHkw3jHDz8Ckn0kmll4O/VpWBGtJNlt27JDrmQFy0Ce
         QtXAo++3F/4ieFbWsmAzw+JYyrqukA7sqERUJNBn1QnrDk82eeUlyMsawxHs/WKFB23Z
         rkBLdo/FzmqUe5q1Ztb2O22kygHufyrbjCneCzOp7LqqrZ9apeVZ13djyLKNNbx32UBm
         USb9YFIMB3IRHPau77WX/QJUoDtUZHzioUeS3r6n1OwsceoyXC33MYg9n964Hxc/XMZa
         Cn1DitRG4NaTHtmehXYDgIS4UgAhG7jdaR+Hnsp2LYN32SthmTt+2hWqcU4axRFNRpRP
         oE0g==
X-Forwarded-Encrypted: i=1; AJvYcCU2iaL77lBDABceSG3TrRoyXR5GjyUzAyN0b/igUD2JKgFH1FQTE5O4a/nalP30LKPQROt/ybDjA06fWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxamhjjKevYmw8MiqPttHqgdMr1h5AHrM34MTbHBbI4bYZzVdif
	Pvn/PSA0zT0rG1Y4VkBeuGUgUqWksjjMseE9TPR7TmHeB/jUU9MlnsSmAthLdfBAS46szZXCHYu
	KzD0TK8TJHVE8P14cEfcdJdZUQWp2OB8F7vKFI+K9dw==
X-Gm-Gg: ASbGncuWoeTs+sSH9RRHvmhn59sXhSuublQSXFGG34EfMA1VuH/GHL2Eml4IWllgQH9
	N5wLAuy8Aw8vS2RQmz4pEx52xVRMLEPg681aHkHHPxW0q90CUar6WQtQcPr6oNhbe8ocVPGg7m0
	KgctzcyVJHZ48tnmXYQuTfSzGLDO/x8r4KPkS2LcBxoGEws0L/DE/x86RSPywLgqEAhdWS+ugVt
	PYdjmqviMejPg==
X-Google-Smtp-Source: AGHT+IFJaMyLLCh1Xm+EZRUU2+rVaRKBzkqwv8+0XArTrfmXbw0CF/H9pB9vYB/gkBfkl/r0bzWiKcLdIy2R5yrNQnM=
X-Received: by 2002:a05:6870:a0b1:b0:30c:839:bb78 with SMTP id
 586e51a60fabf-33bb0bd0756mr6178956fac.0.1758542294547; Mon, 22 Sep 2025
 04:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
 <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com> <CAAhSdy3ioaOBxO++XBBWfx9RRH-7BJQDLR0q6sSEr2m8W2cdwg@mail.gmail.com>
In-Reply-To: <CAAhSdy3ioaOBxO++XBBWfx9RRH-7BJQDLR0q6sSEr2m8W2cdwg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Sep 2025 19:58:03 +0800
X-Gm-Features: AS18NWBB7CIpnNNnwnsIJI6KeeoQ1Ich7LHywJ7i-hVNXt5nzQMuy6tJsG4YhD0
Message-ID: <CAEEQ3wmDFfmbr0fGxNUOX16p0b5zeR8bKTDTePuCFPYaKOyuqg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_045816_916833_5B9357EA 
X-CRM114-Status: GOOD (  37.56  )
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

SGkgQW51cCwKCk9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDY6NDDigK9QTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDE6
NDLigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkgQ2zDqW1lbnQsCj4gPgo+ID4gT24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMzo1MuKAr1BN
IHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
SGkgQ2zDqW1lbnQsCj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDM6MTjigK9Q
TSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4KPiA+ID4gPgo+ID4gPiA+IE9uIDE5LzA5LzIwMjUgMDk6MDAsIFl1bmh1aSBDdWkgd3Jv
dGU6Cj4gPiA+ID4gPiBVbmtub3duIE5NSSBjYW4gZm9yY2UgdGhlIGtlcm5lbCB0byByZXNwb25k
IChlLmcuLCBwYW5pYykgd2hlbiB0aGUKPiA+ID4gPiA+IHN5c3RlbSBlbmNvdW50ZXJzIHVucmVj
b2duaXplZCBjcml0aWNhbCBoYXJkd2FyZSBldmVudHMsIGFpZGluZyBpbgo+ID4gPiA+ID4gdHJv
dWJsZXNob290aW5nIHN5c3RlbSBmYXVsdHMuIFRoaXMgaXMgaW1wbGVtZW50ZWQgdmlhIHRoZSBT
dXBlcnZpc29yCj4gPiA+ID4gPiBTb2Z0d2FyZSBFdmVudHMgKFNTRSkgZnJhbWV3b3JrLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCAgICAgfCAgMSArCj4gPiA+ID4gPiAgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29u
ZmlnICAgfCAxMCArKysrKwo+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZp
bGUgIHwgIDEgKwo+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jIHwg
NzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9maXJtd2FyZS9yaXNjdi9zc2Vfbm1pLmMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKPiA+ID4gPiA+IGluZGV4IDg3NGNjMWQ3NjAzYTUuLjU4MDFmOTBhODhmNjIgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ID4gPiBAQCAtNDgxLDYg
KzQ4MSw3IEBAIGVudW0gc2JpX3NzZV9hdHRyX2lkIHsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgI2Rl
ZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMgICAgMHgwMDAwMDAwMAo+ID4g
PiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJBUCAgICAgICAgICAg
ICAgMHgwMDAwMDAwMQo+ID4gPiA+ID4gKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktO
T1dOX05NSSAgICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDAyCj4gPiA+ID4KPiA+ID4gPiBX
YXMgdGhpcyBzdWJtaXR0ZWQgdG8gdGhlIFBSUyBXRyA/IFRoaXMgYSBzcGVjaWZpY2F0aW9uIG1v
ZGlmaWNhdGlvbiBzbwo+ID4gPiA+IGl0IHNob3VsZCBnbyB0aHJvdWdoIHRoZSB1c3VhbCBwcm9j
ZXNzLgo+ID4gPiA+Cj4gPiA+ID4gPiAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9ISUdI
X1BSSU9fUkFTICAgMHgwMDAwODAwMAo+ID4gPiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9M
T0NBTF9QTVVfT1ZFUkZMT1cgICAgIDB4MDAwMTAwMDAKPiA+ID4gPiA+ICAjZGVmaW5lIFNCSV9T
U0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTICAgICAweDAwMTAwMDAwCj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnIGIvZHJpdmVycy9maXJtd2Fy
ZS9yaXNjdi9LY29uZmlnCj4gPiA+ID4gPiBpbmRleCBlZDViNjYzYWM1ZjkxLi43NDZiYWM4NjJh
YzQ2IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmln
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4gPiA+
IEBAIC0xMiw0ICsxMiwxNCBAQCBjb25maWcgUklTQ1ZfU0JJX1NTRQo+ID4gPiA+ID4gICAgICAg
ICB0aGlzIG9wdGlvbiBwcm92aWRlcyBzdXBwb3J0IHRvIHJlZ2lzdGVyIGNhbGxiYWNrcyBvbiBz
cGVjaWZpYyBTU0UKPiA+ID4gPiA+ICAgICAgICAgZXZlbnRzLgo+ID4gPiA+ID4KPiA+ID4gPiA+
ICtjb25maWcgUklTQ1ZfU1NFX1VOS05PV05fTk1JCj4gPiA+ID4gPiArICAgICBib29sICJFbmFi
bGUgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIHVua25vd24gTk1JIHN1cHBvcnQiCj4g
PiA+ID4gPiArICAgICBkZXBlbmRzIG9uIFJJU0NWX1NCSV9TU0UKPiA+ID4gPiA+ICsgICAgIGRl
ZmF1bHQgeQo+ID4gPiA+ID4gKyAgICAgaGVscAo+ID4gPiA+ID4gKyAgICAgICBUaGlzIG9wdGlv
biBlbmFibGVzIHN1cHBvcnQgZm9yIGRlbGl2ZXJpbmcgdW5rbm93biBOb24tTWFza2FibGUgSW50
ZXJydXB0IChOTUkpCj4gPiA+ID4gPiArICAgICAgIG5vdGlmaWNhdGlvbnMgdmlhIHRoZSBTdXBl
cnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBmcmFtZXdvcmsuIFdoZW4gZW5hYmxlZCwKPiA+
ID4gPiA+ICsgICAgICAgdW5rbm93biBOTUlzIGNhbiB0cmlnZ2VyIGtlcm5lbCByZXNwb25zZXMg
KGUuZy4sIHBhbmljKSBmb3IgdW5yZWNvZ25pemVkIGNyaXRpY2FsCj4gPiA+ID4gPiArICAgICAg
IGhhcmR3YXJlIGV2ZW50cywgYWlkaW5nIGluIHN5c3RlbSBmYXVsdCBkaWFnbm9zaXMuCj4gPiA+
ID4gPiArCj4gPiA+ID4gPiAgZW5kbWVudQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxl
Cj4gPiA+ID4gPiBpbmRleCBjODc5NWQ0YmJiMmVhLi45MjQyYzZjZDVlM2U5IDEwMDY0NAo+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+ID4gQEAgLTEsMyArMSw0
IEBACj4gPiA+ID4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiA+
ID4KPiA+ID4gPiA+ICBvYmotJChDT05GSUdfUklTQ1ZfU0JJX1NTRSkgICAgICAgICAgKz0gcmlz
Y3Zfc2JpX3NzZS5vCj4gPiA+ID4gPiArb2JqLSQoQ09ORklHX1JJU0NWX1NTRV9VTktOT1dOX05N
SSkgICs9IHNzZV9ubWkubwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUv
cmlzY3Yvc3NlX25taS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9zc2Vfbm1pLmMKPiA+ID4g
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi40
MzA2M2Y0MmVmZmYwCj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYwo+ID4gPiA+ID4gQEAgLTAsMCArMSw3NyBAQAo+
ID4gPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxs
aW51eC9ubWkuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcmlzY3Zfc2JpX3NzZS5oPgo+
ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9kZWJ1Zy5oPgo+ID4gPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9zeXNjdGwuaD4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNt
L2lycV9yZWdzLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ICtpbnQgcGFuaWNfb25fdW5rbm93bl9ubWkgPSAxOwo+ID4gPiA+ID4gK3N0cnVj
dCBzc2VfZXZlbnQgKmV2dDsKPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IGN0bF90YWJsZV9oZWFk
ZXIgKnVua25vd25fbm1pX3N5c2N0bF9oZWFkZXI7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArY29u
c3Qgc3RydWN0IGN0bF90YWJsZSB1bmtub3duX25taV90YWJsZVtdID0gewo+ID4gPiA+ID4gKyAg
ICAgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAucHJvY25hbWUgICAgICAgPSAicGFuaWNfZW5h
YmxlIiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgLmRhdGEgICAgICAgICAgID0gJnBhbmljX29u
X3Vua25vd25fbm1pLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAubWF4bGVuICAgICAgICAgPSBz
aXplb2YoaW50KSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgLm1vZGUgICAgICAgICAgID0gMDY0
NCwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgLnByb2NfaGFuZGxlciAgID0gcHJvY19kb2ludHZl
Y19taW5tYXgsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5leHRyYTEgICAgICAgICA9IFNZU0NU
TF9aRVJPLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAuZXh0cmEyICAgICAgICAgPSBTWVNDVExf
T05FLAo+ID4gPiA+ID4gKyAgICAgfSwKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gK3N0YXRpYyB2b2lkIG5taV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPiA+
ID4gK3sKPiA+ID4gPiA+ICsgICAgIHByX2VtZXJnKCJOTUkgcmVjZWl2ZWQgZm9yIHVua25vd24g
b24gQ1BVICVkLlxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgIGlmIChwYW5pY19vbl91bmtub3duX25taSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
bm1pX3BhbmljKHJlZ3MsICJOTUk6IE5vdCBjb250aW51aW5nIik7Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICBwcl9lbWVyZygiRGF6ZWQgYW5kIGNvbmZ1c2VkLCBidXQgdHJ5aW5nIHRvIGNv
bnRpbnVlXG4iKTsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4KPiA+ID4gPiBJJ20gZGF6ZWQgYW5kIGNv
bmZ1c2VkIGFzIHdlbGwgOykgV2hhdCdzIHRoZSBwb2ludCBvZiB0aGlzIGV4Y2VwdAo+ID4gPiA+
IGludGVycnVwdGluZyB0aGUga2VybmVsIHdpdGggYSBwYW5pYyA/IEl0IHNlZW1zIGxpa2UgaXQn
cyBhIGJldHRlciBpZGVhCj4gPiA+ID4gdG8gbGV0IHRoZSBmaXJtd2FyZSBoYW5kbGUgdGhhdCBw
cm9wZXJseSBhbmQgZGlzcGxheSB3aGF0ZXZlcgo+ID4gPiA+IGluZm9ybWF0aW9uIGFyZSBuZWVk
ZWQuIFdhcyB5b3VyIGlkZWEgdG8gYWN0dWFsbHkgZm9yY2UgdGhlIGtlcm5lbCB0bwo+ID4gPiA+
IGVudGVyIGluIHNvbWUgZGVidWcgbW9kZSA/Cj4gPiA+Cj4gPiA+IFRoZXJlIGlzIGFuIGltcG9y
dGFudCBzY2VuYXJpbzogd2hlbiB0aGUga2VybmVsIGJlY29tZXMgdW5yZXNwb25zaXZlLAo+ID4g
PiB3ZSBuZWVkIHRvIHRyaWdnZXIgYW4gdW5rbm93biBOTUkgdG8gY2F1c2UgdGhlIHN5c3RlbSB0
byBwYW5pYygpIGFuZAo+ID4gPiB0aGVuIGNvbGxlY3QgdGhlIHZtY29yZSwgYW5kIHN1Y2ggYSBy
ZXF1aXJlbWVudCBpcyBjb21tb24gb24geDg2Cj4gPiA+IHNlcnZlcnMuCj4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBUaGFua3MsCj4gPiA+ID4KPiA+ID4gPiBDbMOpbWVudAo+ID4gPiA+Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArc3RhdGljIGludCBubWlfc3NlX2hhbmRsZXIodTMyIGV2dCwgdm9pZCAq
YXJnLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArICAgICBu
bWlfaGFuZGxlcihyZWdzKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIHJldHVybiAwOwo+
ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgaW50IHNzZV9ubWlfaW5p
dCh2b2lkKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgIGludCByZXQ7Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArICAgICBldnQgPSBzc2VfZXZlbnRfcmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9M
T0NBTF9VTktOT1dOX05NSSwgMCwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBubWlfc3NlX2hhbmRsZXIsIE5VTEwpOwo+ID4KPiA+IFNob3VsZCB3ZSBhZGQgdGhpcyBV
TktOT1dOX05NSSBldmVudCBJRCBpbiBDaGFwdGVyIDE3IG9mIHRoZSBTQkkgc3BlYz8KPgo+IFRo
ZSByYXRpZmllZCBTQkkgdjMuMCBkZWZpbmVzIGEgIlNvZnR3YXJlIGluamVjdGVkIGxvY2FsIGV2
ZW50IiAoSUQgMHhmZmZmMDAwMCkKPiB3aGljaCBjYW4gYmUgdXNlZCB0byBpbmplY3QgcGFuaWMo
KSBvbiBhIHBhcnRpY3VsYXIgSEFSVCBmcm9tIGFub3RoZXIgSEFSVC4KCkhhcyBTQklfU1NFX0VW
RU5UX0xPQ0FMX1NPRlRXQVJFICgweGZmZmYwMDAwKSBiZWVuIGdpdmVuIG1lYW5pbmcKY3VycmVu
dGx5PyBUaGUgc2NlbmFyaW8gb2YgdGhlIHVua25vd24gTk1JIGlzIHRoYXQgYWZ0ZXIgYSBIQVJU
CnJlY2VpdmVzIGFuIGludGVycnVwdCBmcm9tIHRoZSBwbGF0Zm9ybSwgTS1tb2RlIHJlc3BvbmRz
IHRvIHRoaXMKaW50ZXJydXB0IGFuZCB0aGVuIGVudGVycyBTLW1vZGUgdG8gZXhlY3V0ZSB0aGUg
cmVnaXN0ZXJlZCBoYW5kbGVyLgpDYW4gU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRSBiZSB1
c2VkIGRpcmVjdGx5PwoKCj4KPiBSZWdhcmRzLAo+IEFudXAKClRoYW5rcywKWXVuaHVpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
