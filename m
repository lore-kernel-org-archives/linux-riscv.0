Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A6CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/p7dho5bR4+rN7T/6LuGux4r57zngdyKqv7rdFYmDo=; b=yTAguSFx+bsS9r
	BrFCfAZiO7TpDVune6GvlotFvst3BSsRoN9yCqXCj0RhqPYVUAg8AbSia0mJHrwQdmVzvv7ntz9HY
	NGAtSNH6w6xXxhSV3N0ImCfOttQJxPSwIp3C2zls6/DF6FAhBn9HQEE2yk43+QoEz6k7wiufB874b
	qR8+RxHtT1TM0OYJOPwoWLCdNQPAZPnMxLN7AHSaHR9A9XZ963/KNfs0Y7fuTn7JQ9C9vFr6USd9Y
	5aI1BtTwvnaPV9ygDuR1Ld5H4dUUPM17ZoWV/VCN/Y2nonwsGCPGqaL3TWTfqnd05sfV8zC/rIebo
	uMh9eNUwTy0RafpnpmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVut-000000029Dq-1T2a;
	Fri, 19 Sep 2025 07:52:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVus-000000029D0-2xSa
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gP5v61DcWR0npM9XGzP9QRf4i7M8VdPYZ8EzlkbskQY=; b=oLskHnfdSlHhHS5qBiVaIEdThr
	SS1KxD8l6kwuS5XrfvOnzgKkJ8T7R1bDLZ+mif39f3qTyYy0a4j3tHJR8v1ZEGUSOMVUOhu/r11ng
	31OiGehs2LKFHp1ZPafapTVHClvqx3wE+KHzxnz0wxfjzRlE5duZ6YVI6DQy5Wk7QHj/S55DQAoV9
	udDBIL40BWvRsXG0V7oSr4Ijs2TWCXZADyzj+aiYQEPhl9wfdGOpj5X4bW4RgAeecl9cX7QPxwXSa
	ReNgFCesiW6B5LjDjSxhj554APAZUHWg8h36FFQouumXwlaesFDmRUSRpyYLQispWejoRanUq4TGW
	e1LwP8Ow==;
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVup-00000007mN7-2B9A
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:52:25 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-330d1565844so1144190fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758268337; x=1758873137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP5v61DcWR0npM9XGzP9QRf4i7M8VdPYZ8EzlkbskQY=;
        b=Q6+KHG5/5di3F8S34aqwoeiorQoklO+bEnUVht5mTNLlhQRhI4MIGeijKooSfLXy7P
         tWahZqKVFbEd9Zee6f2hro3y28VP/x62UdMUaSK7DYF+skrrN/NlfBoaPMYT6VcFT7qF
         7ZENxNMQgblTW3H6m8FRm4hsqxzK83ZgLWH1uG/8njcNo3rIjwqfK/eLKsQoRDuNps1V
         s7ub2RfVVOI5aK4fvrHFsNvP6NKvK0T0psMpFedjfNDTQOzxqSn8cV5rq4MrQfe2UMVx
         ffVRdgRDpMOr8QsRbGQ6ZvBeHz01+PEHogAHLVUbc4hfsj7uLnVrdfG//vPgi/YDcC0o
         ye+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268337; x=1758873137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gP5v61DcWR0npM9XGzP9QRf4i7M8VdPYZ8EzlkbskQY=;
        b=vpwmI/zo/d3LDCvor9EGxFJPu2tUwQ1Of8DBpfW0/UISs4WWcMzMiuQi95k3JbUisT
         F2DbaUojHQbN0DxXp+AURT79reyXFlBiKKv5tM1y+u83ddyg2ASl7L9zhftyXdOQtdA7
         ai31aDU6RmyN8IgrxIYVc+5PYZgsFSbAHxPHumFPdLiHeWTfZ/fz30Hn86+TjHk7u2AO
         kzwPHh8raZpgCobF/uHwzEPnWmb3uJXBJZEaYVxRua3dZ9CefhRaF8cxL3b494AONmON
         fOrc3NpjoUebfJX41UH6pQ0aw9ZinfMF/S0M8fiNgJyZYwGLjcCIiOD3QP5pFOk8w3rN
         g9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRhGX5rXapOjGYISiv5AhmU8KfP3lswpn+++q3dGNmi4TK3noqjut04Gho0tz1HDn88B3drJx1tOVSJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg4jus87r+Dw0dTWcvMspQH1vzBtUjBsquiZEFXd/kVA8tqzBl
	tmvg1356QdIM1x9q8alKND2OppSa2bmnE7ANcRFAKfpLA09FvqKg0Dx7eGMczNzZIrMdUd3GJMV
	D8a8qKqQrX6bgzDmZiYweJP1H0ltQ+6osEzcPh9M2Ig==
X-Gm-Gg: ASbGncuKwTErIVSnU08Uvtc28WCYlUMv0shoiEBbQo+sdkFABSzqz/xdWCXJDSN78Qp
	4VMmPgSBIYCnZCY3lBq5cLb1e/9YOFdFSJoYfIUhu2bLpTk/POHfXACUFwvAdTEHkATCoLXoh6h
	5EDxOGbRgQrgudx3u9+n7vW6eUEI/nmqKWl/AlVkxkcWLU5IBSTzl60T6tRR18RRaVBGWf8T3Ng
	f9/LXM08ubRY/WAZrzh
X-Google-Smtp-Source: AGHT+IEBnW4z9AmI4VxlHxhjfD0na9kXgwRmbwPRjQzLSxtLo50CDbAwqixrAUkenpe9jUFSM4wSS6MadHv2IdRBbEY=
X-Received: by 2002:a05:6871:7a14:b0:315:a087:71e5 with SMTP id
 586e51a60fabf-33bb3ff70a2mr1263523fac.25.1758268337126; Fri, 19 Sep 2025
 00:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
In-Reply-To: <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Sep 2025 15:52:05 +0800
X-Gm-Features: AS18NWDYFZfpbhYXFeekhZPcceSOGnqbfdDxxsO6hWHlOxekMpKbAiofdZPa31c
Message-ID: <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085223_948623_D5B0020F 
X-CRM114-Status: GOOD (  31.43  )
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

SGkgQ2zDqW1lbnQsCgpPbiBGcmksIFNlcCAxOSwgMjAyNSBhdCAzOjE44oCvUE0gQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxOS8wOS8yMDI1
IDA5OjAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gVW5rbm93biBOTUkgY2FuIGZvcmNlIHRoZSBr
ZXJuZWwgdG8gcmVzcG9uZCAoZS5nLiwgcGFuaWMpIHdoZW4gdGhlCj4gPiBzeXN0ZW0gZW5jb3Vu
dGVycyB1bnJlY29nbml6ZWQgY3JpdGljYWwgaGFyZHdhcmUgZXZlbnRzLCBhaWRpbmcgaW4KPiA+
IHRyb3VibGVzaG9vdGluZyBzeXN0ZW0gZmF1bHRzLiBUaGlzIGlzIGltcGxlbWVudGVkIHZpYSB0
aGUgU3VwZXJ2aXNvcgo+ID4gU29mdHdhcmUgRXZlbnRzIChTU0UpIGZyYW1ld29yay4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgIHwgIDEgKwo+ID4gIGRy
aXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZyAgIHwgMTAgKysrKysKPiA+ICBkcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L01ha2VmaWxlICB8ICAxICsKPiA+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L3NzZV9ubWkuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4g
PiBpbmRleCA4NzRjYzFkNzYwM2E1Li41ODAxZjkwYTg4ZjYyIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaAo+ID4gQEAgLTQ4MSw2ICs0ODEsNyBAQCBlbnVtIHNiaV9zc2VfYXR0cl9pZCB7Cj4g
Pgo+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ISUdIX1BSSU9fUkFTICAgIDB4MDAw
MDAwMDAKPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfRE9VQkxFX1RSQVAgICAgICAg
ICAgICAgIDB4MDAwMDAwMDEKPiA+ICsjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9X
Tl9OTUkgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMgo+Cj4gV2FzIHRoaXMgc3VibWl0
dGVkIHRvIHRoZSBQUlMgV0cgPyBUaGlzIGEgc3BlY2lmaWNhdGlvbiBtb2RpZmljYXRpb24gc28K
PiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgdXN1YWwgcHJvY2Vzcy4KPgo+ID4gICNkZWZpbmUg
U0JJX1NTRV9FVkVOVF9HTE9CQUxfSElHSF9QUklPX1JBUyAgIDB4MDAwMDgwMDAKPiA+ICAjZGVm
aW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VX09WRVJGTE9XICAgICAweDAwMDEwMDAwCj4gPiAg
I2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0xPV19QUklPX1JBUyAgICAgMHgwMDEwMDAwMAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZyBiL2RyaXZlcnMv
ZmlybXdhcmUvcmlzY3YvS2NvbmZpZwo+ID4gaW5kZXggZWQ1YjY2M2FjNWY5MS4uNzQ2YmFjODYy
YWM0NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZwo+ID4g
KysrIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMTIsNCArMTIsMTQg
QEAgY29uZmlnIFJJU0NWX1NCSV9TU0UKPiA+ICAgICAgICAgdGhpcyBvcHRpb24gcHJvdmlkZXMg
c3VwcG9ydCB0byByZWdpc3RlciBjYWxsYmFja3Mgb24gc3BlY2lmaWMgU1NFCj4gPiAgICAgICAg
IGV2ZW50cy4KPiA+Cj4gPiArY29uZmlnIFJJU0NWX1NTRV9VTktOT1dOX05NSQo+ID4gKyAgICAg
Ym9vbCAiRW5hYmxlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyB1bmtub3duIE5NSSBz
dXBwb3J0Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfU1NFCj4gPiArICAgICBkZWZh
dWx0IHkKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBw
b3J0IGZvciBkZWxpdmVyaW5nIHVua25vd24gTm9uLU1hc2thYmxlIEludGVycnVwdCAoTk1JKQo+
ID4gKyAgICAgICBub3RpZmljYXRpb25zIHZpYSB0aGUgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVu
dHMgKFNTRSkgZnJhbWV3b3JrLiBXaGVuIGVuYWJsZWQsCj4gPiArICAgICAgIHVua25vd24gTk1J
cyBjYW4gdHJpZ2dlciBrZXJuZWwgcmVzcG9uc2VzIChlLmcuLCBwYW5pYykgZm9yIHVucmVjb2du
aXplZCBjcml0aWNhbAo+ID4gKyAgICAgICBoYXJkd2FyZSBldmVudHMsIGFpZGluZyBpbiBzeXN0
ZW0gZmF1bHQgZGlhZ25vc2lzLgo+ID4gKwo+ID4gIGVuZG1lbnUKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9N
YWtlZmlsZQo+ID4gaW5kZXggYzg3OTVkNGJiYjJlYS4uOTI0MmM2Y2Q1ZTNlOSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiA+IEBAIC0xLDMgKzEsNCBAQAo+ID4gICMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+Cj4gPiAgb2JqLSQoQ09ORklHX1JJU0NWX1NC
SV9TU0UpICAgICAgICAgICs9IHJpc2N2X3NiaV9zc2Uubwo+ID4gK29iai0kKENPTkZJR19SSVND
Vl9TU0VfVU5LTk9XTl9OTUkpICArPSBzc2Vfbm1pLm8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25t
aS5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNDMw
NjNmNDJlZmZmMAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9y
aXNjdi9zc2Vfbm1pLmMKPiA+IEBAIC0wLDAgKzEsNzcgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCsKPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiA+
ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jpc2N2X3NiaV9z
c2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvZGVidWcuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvc3lzY3RsLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9pcnFfcmVncy5oPgo+ID4g
KyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gPiArCj4gPiAraW50IHBhbmljX29uX3Vua25vd25fbm1p
ID0gMTsKPiA+ICtzdHJ1Y3Qgc3NlX2V2ZW50ICpldnQ7Cj4gPiArc3RhdGljIHN0cnVjdCBjdGxf
dGFibGVfaGVhZGVyICp1bmtub3duX25taV9zeXNjdGxfaGVhZGVyOwo+ID4gKwo+ID4gK2NvbnN0
IHN0cnVjdCBjdGxfdGFibGUgdW5rbm93bl9ubWlfdGFibGVbXSA9IHsKPiA+ICsgICAgIHsKPiA+
ICsgICAgICAgICAgICAgLnByb2NuYW1lICAgICAgID0gInBhbmljX2VuYWJsZSIsCj4gPiArICAg
ICAgICAgICAgIC5kYXRhICAgICAgICAgICA9ICZwYW5pY19vbl91bmtub3duX25taSwKPiA+ICsg
ICAgICAgICAgICAgLm1heGxlbiAgICAgICAgID0gc2l6ZW9mKGludCksCj4gPiArICAgICAgICAg
ICAgIC5tb2RlICAgICAgICAgICA9IDA2NDQsCj4gPiArICAgICAgICAgICAgIC5wcm9jX2hhbmRs
ZXIgICA9IHByb2NfZG9pbnR2ZWNfbWlubWF4LAo+ID4gKyAgICAgICAgICAgICAuZXh0cmExICAg
ICAgICAgPSBTWVNDVExfWkVSTywKPiA+ICsgICAgICAgICAgICAgLmV4dHJhMiAgICAgICAgID0g
U1lTQ1RMX09ORSwKPiA+ICsgICAgIH0sCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBu
bWlfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICBwcl9lbWVy
ZygiTk1JIHJlY2VpdmVkIGZvciB1bmtub3duIG9uIENQVSAlZC5cbiIsIHNtcF9wcm9jZXNzb3Jf
aWQoKSk7Cj4gPiArCj4gPiArICAgICBpZiAocGFuaWNfb25fdW5rbm93bl9ubWkpCj4gPiArICAg
ICAgICAgICAgIG5taV9wYW5pYyhyZWdzLCAiTk1JOiBOb3QgY29udGludWluZyIpOwo+ID4gKwo+
ID4gKyAgICAgcHJfZW1lcmcoIkRhemVkIGFuZCBjb25mdXNlZCwgYnV0IHRyeWluZyB0byBjb250
aW51ZVxuIik7Cj4gPiArfQo+Cj4gSSdtIGRhemVkIGFuZCBjb25mdXNlZCBhcyB3ZWxsIDspIFdo
YXQncyB0aGUgcG9pbnQgb2YgdGhpcyBleGNlcHQKPiBpbnRlcnJ1cHRpbmcgdGhlIGtlcm5lbCB3
aXRoIGEgcGFuaWMgPyBJdCBzZWVtcyBsaWtlIGl0J3MgYSBiZXR0ZXIgaWRlYQo+IHRvIGxldCB0
aGUgZmlybXdhcmUgaGFuZGxlIHRoYXQgcHJvcGVybHkgYW5kIGRpc3BsYXkgd2hhdGV2ZXIKPiBp
bmZvcm1hdGlvbiBhcmUgbmVlZGVkLiBXYXMgeW91ciBpZGVhIHRvIGFjdHVhbGx5IGZvcmNlIHRo
ZSBrZXJuZWwgdG8KPiBlbnRlciBpbiBzb21lIGRlYnVnIG1vZGUgPwoKVGhlcmUgaXMgYW4gaW1w
b3J0YW50IHNjZW5hcmlvOiB3aGVuIHRoZSBrZXJuZWwgYmVjb21lcyB1bnJlc3BvbnNpdmUsCndl
IG5lZWQgdG8gdHJpZ2dlciBhbiB1bmtub3duIE5NSSB0byBjYXVzZSB0aGUgc3lzdGVtIHRvIHBh
bmljKCkgYW5kCnRoZW4gY29sbGVjdCB0aGUgdm1jb3JlLCBhbmQgc3VjaCBhIHJlcXVpcmVtZW50
IGlzIGNvbW1vbiBvbiB4ODYKc2VydmVycy4KCj4KPiBUaGFua3MsCj4KPiBDbMOpbWVudAo+Cj4g
PiArCj4gPiArc3RhdGljIGludCBubWlfc3NlX2hhbmRsZXIodTMyIGV2dCwgdm9pZCAqYXJnLCBz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICBubWlfaGFuZGxlcihyZWdzKTsK
PiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHNz
ZV9ubWlfaW5pdCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAg
ICBldnQgPSBzc2VfZXZlbnRfcmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktOT1dOX05N
SSwgMCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubWlfc3NlX2hhbmRsZXIs
IE5VTEwpOwo+ID4gKyAgICAgaWYgKElTX0VSUihldnQpKQo+ID4gKyAgICAgICAgICAgICByZXR1
cm4gUFRSX0VSUihldnQpOwo+ID4gKwo+ID4gKyAgICAgcmV0ID0gc3NlX2V2ZW50X2VuYWJsZShl
dnQpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBzc2VfZXZlbnRfdW5y
ZWdpc3RlcihldnQpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+
ID4gKwo+ID4gKyAgICAgdW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlciA9IHJlZ2lzdGVyX3N5c2N0
bCgia2VybmVsIiwgdW5rbm93bl9ubWlfdGFibGUpOwo+ID4gKyAgICAgaWYgKCF1bmtub3duX25t
aV9zeXNjdGxfaGVhZGVyKSB7Cj4gPiArICAgICAgICAgICAgIHNzZV9ldmVudF9kaXNhYmxlKGV2
dCk7Cj4gPiArICAgICAgICAgICAgIHNzZV9ldmVudF91bnJlZ2lzdGVyKGV2dCk7Cj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcHJf
aW5mbygiVXNpbmcgU1NFIGZvciBOTUkgZXZlbnQgZGVsaXZlcnlcbiIpOwo+ID4gKwo+ID4gKyAg
ICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHVua25vd19u
bWlfaW5pdCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBzc2Vfbm1pX2luaXQoKTsKPiA+
ICt9Cj4gPiArCj4gPiArbGF0ZV9pbml0Y2FsbCh1bmtub3dfbm1pX2luaXQpOwo+CgpUaGFua3Ms
Cll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
