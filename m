Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485B9CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 05:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zWConJM1iGrcUHOQwN8iGGwf4rU/1Wix2fFX5s5ci0=; b=0Z2+03L8zk3Nle
	qodFnjn5izeIp9g8E3QJxL79aoO/Eihcu4MBdIVLvSomyKIT0QYjjL1ntaNFIN22rUBzmtHHDyUOf
	MaohzQne7llc1RFZB1iRYwi+sfbvyEEBvzeE95X1fAZ046EhFL6fuq4two5bpnLQvxbD6xNrO95Xv
	nG281mTiJbob20kd+GD/D/saR41DbuHbNrmKv9cTCihSr1XDn2ByYWu9NkKh9MYakUTL6DsWgZc+J
	QRW5rPD9ujpQfSDBG55R5PwVUSd4EyIjWblPDdVdM0+kEKvGd+qdQidvS3K9w3Kenbh0wQhE2oTDa
	w4lYlY3fA3pvdnVmDRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vEG-0000000CNZW-0eT2;
	Tue, 23 Sep 2025 05:06:16 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vEB-0000000CNYM-1lgv
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 05:06:14 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-42571b8abbaso25479145ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 22:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758603970; x=1759208770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+BozLEV3M5HFvnO6spU5aK5mXn77UxIipfobMtOevc=;
        b=ij8BUz8pRtosOLOUCs1U1QF958jdOHYL5F3IbnPRlLzrcSjickjzI75yI0BgS1y7nu
         4RnuKPKBf/wYSYZDKjeRmSvkj5hCcEcl6OjVGx80ZowgVqu90eWVuE7dQ2SDrdBRRRu1
         CRG2/F1hUwVAPThtyQY5dLJoTcUSM1UH50iDwaWHqcW2a9K5Gs0MSqMEkybAFRVketDY
         rRo+IxwQ/wagCj0FeU6IOrQkJb6yvcVm4IGP3RXZoH+aWrgiqKC+2nmI1OPt1H/aiudv
         f1f5PZjQZkX1bf5sAbZtDQKpqNxH+E4OFZ7p3boO+v75Ab1+69mMKBqklCV806IAE4j+
         +6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758603970; x=1759208770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+BozLEV3M5HFvnO6spU5aK5mXn77UxIipfobMtOevc=;
        b=g+qEOFJ4kND2NIZ1o+N6pJ/DCllmnUNfLld1h9ndYTVxSivlMTDfv6+6sZeX8Vkd5q
         Q3N2i3Lw+Ij8WCF7SNtAa/3tmjjd7ESKr84YFHGiZhXhr/DUskf1EphkNq3hsU/JM6Hi
         KN1XkR7NnjLrAFxbdtpWu302lsgxRJJgQkqn8xhKbJF4rTNVw4uqscXaHKaP00ZeAFTn
         kBmLfDbyXuW4onK/ausGvA2ZUWqbxIeYB36YFjCnUap8Wjf7XMW4jJAaTY79DkIHgaxs
         iJeV1M8DjUXckn0lJOXn+epIxKFmbjys+AH+ZwEJ/+N8mdzsXs/pAZqX0WK5NDDAUBmG
         dG3A==
X-Forwarded-Encrypted: i=1; AJvYcCXVSiiD7VpbU00X3LpkT2URCrPG8uqd90lRQYdFgMUi7JtrMQJXC7NgdtZ1wN/xqlQiYhcE3c8NTUT6Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySXP3m6vI7cxpDcHklL6cuGD6r2bFc99a328POV8EXSK2PK4sA
	Q/OYs2O9FVzUOSPR37dcM4syk5V3AiFZeQYA55X06ilkV2V7qn3W8W9+6KttwSp0UT/l05QuAHm
	Tl6ENh/S0iyqFs9M5gcLFtBf/O+7gGWOGVFy7osNLwg==
X-Gm-Gg: ASbGncvPiCB9ls3XBebHbSi0UToIDsQhpakOu+fxnuNtqHCoBKFCMnUxMCy9JrO3PS9
	swm1b61dKN3AMMqRZM/4txtr0DTAWkmYOGtq6vxC2bd+i8nyGxSOC5BoNVX3xX6ky96WqltF/N1
	MniVt5RUUBLDmbGSHcCANeiXeaLTrTspYJ0e4l/QbCZIEvMYf2TuuyUGPp+8hzDV8CBPPvTdGBg
	IZvlUos8FKcjSZpPHy57DDZDXheqzaDQaI5ojtb
X-Google-Smtp-Source: AGHT+IFPzBj9cvcCxvfYV4AAndyg6lGBppbSsKACXmClezws1hELgG2i965acf/otg6nsNQhfO4Ome6gfhrCG4p8Jd4=
X-Received: by 2002:a05:6e02:16c9:b0:424:7f6c:78c5 with SMTP id
 e9e14a558f8ab-42581e1723amr19435825ab.7.1758603970187; Mon, 22 Sep 2025
 22:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
 <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
 <CAAhSdy3ioaOBxO++XBBWfx9RRH-7BJQDLR0q6sSEr2m8W2cdwg@mail.gmail.com> <CAEEQ3wmDFfmbr0fGxNUOX16p0b5zeR8bKTDTePuCFPYaKOyuqg@mail.gmail.com>
In-Reply-To: <CAEEQ3wmDFfmbr0fGxNUOX16p0b5zeR8bKTDTePuCFPYaKOyuqg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Sep 2025 10:35:58 +0530
X-Gm-Features: AS18NWDPWs1SxPcSj_YWUsuS2lkU6YvNufUXIqsGGfl7idfocTAilPqNT7_nbKo
Message-ID: <CAAhSdy2e90AhkWaaCWsyEjRpovQbS9eBNpC60bLsLTLqUEWSkw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_220611_729302_2A7FCE3C 
X-CRM114-Status: GOOD (  40.04  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgNToyOOKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCA2OjQw4oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gT24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTo0MuKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQ2zDqW1lbnQsCj4gPiA+
Cj4gPiA+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDM6NTLigK9QTSB5dW5odWkgY3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBDbMOpbWVudCwK
PiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDM6MTjigK9QTSBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gMTkvMDkvMjAyNSAwOTowMCwgWXVuaHVpIEN1aSB3cm90
ZToKPiA+ID4gPiA+ID4gVW5rbm93biBOTUkgY2FuIGZvcmNlIHRoZSBrZXJuZWwgdG8gcmVzcG9u
ZCAoZS5nLiwgcGFuaWMpIHdoZW4gdGhlCj4gPiA+ID4gPiA+IHN5c3RlbSBlbmNvdW50ZXJzIHVu
cmVjb2duaXplZCBjcml0aWNhbCBoYXJkd2FyZSBldmVudHMsIGFpZGluZyBpbgo+ID4gPiA+ID4g
PiB0cm91Ymxlc2hvb3Rpbmcgc3lzdGVtIGZhdWx0cy4gVGhpcyBpcyBpbXBsZW1lbnRlZCB2aWEg
dGhlIFN1cGVydmlzb3IKPiA+ID4gPiA+ID4gU29mdHdhcmUgRXZlbnRzIChTU0UpIGZyYW1ld29y
ay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgfCAgMSArCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L0tjb25maWcgICB8IDEwICsrKysrCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L01ha2VmaWxlICB8ICAxICsKPiA+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ID4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gPiA+ID4gPiBpbmRleCA4
NzRjYzFkNzYwM2E1Li41ODAxZjkwYTg4ZjYyIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKPiA+ID4gPiA+ID4gQEAgLTQ4MSw2ICs0ODEsNyBAQCBlbnVtIHNiaV9z
c2VfYXR0cl9pZCB7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfSElHSF9QUklPX1JBUyAgICAweDAwMDAwMDAwCj4gPiA+ID4gPiA+ICAjZGVmaW5l
IFNCSV9TU0VfRVZFTlRfTE9DQUxfRE9VQkxFX1RSQVAgICAgICAgICAgICAgIDB4MDAwMDAwMDEK
PiA+ID4gPiA+ID4gKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktOT1dOX05NSSAgICAg
ICAgICAgICAgICAgICAgICAweDAwMDAwMDAyCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2FzIHRoaXMg
c3VibWl0dGVkIHRvIHRoZSBQUlMgV0cgPyBUaGlzIGEgc3BlY2lmaWNhdGlvbiBtb2RpZmljYXRp
b24gc28KPiA+ID4gPiA+IGl0IHNob3VsZCBnbyB0aHJvdWdoIHRoZSB1c3VhbCBwcm9jZXNzLgo+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfSElHSF9Q
UklPX1JBUyAgIDB4MDAwMDgwMDAKPiA+ID4gPiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9M
T0NBTF9QTVVfT1ZFUkZMT1cgICAgIDB4MDAwMTAwMDAKPiA+ID4gPiA+ID4gICNkZWZpbmUgU0JJ
X1NTRV9FVkVOVF9MT0NBTF9MT1dfUFJJT19SQVMgICAgIDB4MDAxMDAwMDAKPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZyBiL2RyaXZlcnMvZmly
bXdhcmUvcmlzY3YvS2NvbmZpZwo+ID4gPiA+ID4gPiBpbmRleCBlZDViNjYzYWM1ZjkxLi43NDZi
YWM4NjJhYzQ2IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L0tjb25maWcKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmln
Cj4gPiA+ID4gPiA+IEBAIC0xMiw0ICsxMiwxNCBAQCBjb25maWcgUklTQ1ZfU0JJX1NTRQo+ID4g
PiA+ID4gPiAgICAgICAgIHRoaXMgb3B0aW9uIHByb3ZpZGVzIHN1cHBvcnQgdG8gcmVnaXN0ZXIg
Y2FsbGJhY2tzIG9uIHNwZWNpZmljIFNTRQo+ID4gPiA+ID4gPiAgICAgICAgIGV2ZW50cy4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gK2NvbmZpZyBSSVNDVl9TU0VfVU5LTk9XTl9OTUkKPiA+ID4g
PiA+ID4gKyAgICAgYm9vbCAiRW5hYmxlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyB1
bmtub3duIE5NSSBzdXBwb3J0Igo+ID4gPiA+ID4gPiArICAgICBkZXBlbmRzIG9uIFJJU0NWX1NC
SV9TU0UKPiA+ID4gPiA+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiA+ID4gPiA+ICsgICAgIGhlbHAK
PiA+ID4gPiA+ID4gKyAgICAgICBUaGlzIG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIGRlbGl2
ZXJpbmcgdW5rbm93biBOb24tTWFza2FibGUgSW50ZXJydXB0IChOTUkpCj4gPiA+ID4gPiA+ICsg
ICAgICAgbm90aWZpY2F0aW9ucyB2aWEgdGhlIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIChT
U0UpIGZyYW1ld29yay4gV2hlbiBlbmFibGVkLAo+ID4gPiA+ID4gPiArICAgICAgIHVua25vd24g
Tk1JcyBjYW4gdHJpZ2dlciBrZXJuZWwgcmVzcG9uc2VzIChlLmcuLCBwYW5pYykgZm9yIHVucmVj
b2duaXplZCBjcml0aWNhbAo+ID4gPiA+ID4gPiArICAgICAgIGhhcmR3YXJlIGV2ZW50cywgYWlk
aW5nIGluIHN5c3RlbSBmYXVsdCBkaWFnbm9zaXMuCj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
IGVuZG1lbnUKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yv
TWFrZWZpbGUgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlCj4gPiA+ID4gPiA+IGlu
ZGV4IGM4Nzk1ZDRiYmIyZWEuLjkyNDJjNmNkNWUzZTkgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+ID4gPiBAQCAtMSwzICsxLDQgQEAKPiA+
ID4gPiA+ID4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gIG9iai0kKENPTkZJR19SSVNDVl9TQklfU1NFKSAgICAgICAgICArPSByaXNj
dl9zYmlfc3NlLm8KPiA+ID4gPiA+ID4gK29iai0kKENPTkZJR19SSVNDVl9TU0VfVU5LTk9XTl9O
TUkpICArPSBzc2Vfbm1pLm8KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9zc2Vfbm1pLmMKPiA+
ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwMC4uNDMwNjNmNDJlZmZmMAo+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4gPiA+ID4gPiA+IEBAIC0w
LDAgKzEsNzcgQEAKPiA+ID4gPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wKwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiA+
ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9ubWkuaD4KPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxs
aW51eC9yaXNjdl9zYmlfc3NlLmg+Cj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQv
ZGVidWcuaD4KPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zeXNjdGwuaD4KPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiArI2luY2x1ZGUgPGFzbS9pcnFfcmVncy5oPgo+ID4gPiA+ID4gPiAr
I2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiAraW50IHBhbmlj
X29uX3Vua25vd25fbm1pID0gMTsKPiA+ID4gPiA+ID4gK3N0cnVjdCBzc2VfZXZlbnQgKmV2dDsK
PiA+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgY3RsX3RhYmxlX2hlYWRlciAqdW5rbm93bl9ubWlf
c3lzY3RsX2hlYWRlcjsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArY29uc3Qgc3RydWN0IGN0
bF90YWJsZSB1bmtub3duX25taV90YWJsZVtdID0gewo+ID4gPiA+ID4gPiArICAgICB7Cj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgLnByb2NuYW1lICAgICAgID0gInBhbmljX2VuYWJsZSIsCj4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgLmRhdGEgICAgICAgICAgID0gJnBhbmljX29uX3Vua25v
d25fbm1pLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgIC5tYXhsZW4gICAgICAgICA9IHNpemVv
ZihpbnQpLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgIC5tb2RlICAgICAgICAgICA9IDA2NDQs
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgLnByb2NfaGFuZGxlciAgID0gcHJvY19kb2ludHZl
Y19taW5tYXgsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgLmV4dHJhMSAgICAgICAgID0gU1lT
Q1RMX1pFUk8sCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgLmV4dHJhMiAgICAgICAgID0gU1lT
Q1RMX09ORSwKPiA+ID4gPiA+ID4gKyAgICAgfSwKPiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIG5taV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiArICAgICBwcl9lbWVyZygiTk1JIHJlY2Vp
dmVkIGZvciB1bmtub3duIG9uIENQVSAlZC5cbiIsIHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAgICAgaWYgKHBhbmljX29uX3Vua25vd25fbm1pKQo+ID4g
PiA+ID4gPiArICAgICAgICAgICAgIG5taV9wYW5pYyhyZWdzLCAiTk1JOiBOb3QgY29udGludWlu
ZyIpOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgIHByX2VtZXJnKCJEYXplZCBhbmQg
Y29uZnVzZWQsIGJ1dCB0cnlpbmcgdG8gY29udGludWVcbiIpOwo+ID4gPiA+ID4gPiArfQo+ID4g
PiA+ID4KPiA+ID4gPiA+IEknbSBkYXplZCBhbmQgY29uZnVzZWQgYXMgd2VsbCA7KSBXaGF0J3Mg
dGhlIHBvaW50IG9mIHRoaXMgZXhjZXB0Cj4gPiA+ID4gPiBpbnRlcnJ1cHRpbmcgdGhlIGtlcm5l
bCB3aXRoIGEgcGFuaWMgPyBJdCBzZWVtcyBsaWtlIGl0J3MgYSBiZXR0ZXIgaWRlYQo+ID4gPiA+
ID4gdG8gbGV0IHRoZSBmaXJtd2FyZSBoYW5kbGUgdGhhdCBwcm9wZXJseSBhbmQgZGlzcGxheSB3
aGF0ZXZlcgo+ID4gPiA+ID4gaW5mb3JtYXRpb24gYXJlIG5lZWRlZC4gV2FzIHlvdXIgaWRlYSB0
byBhY3R1YWxseSBmb3JjZSB0aGUga2VybmVsIHRvCj4gPiA+ID4gPiBlbnRlciBpbiBzb21lIGRl
YnVnIG1vZGUgPwo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUgaXMgYW4gaW1wb3J0YW50IHNjZW5hcmlv
OiB3aGVuIHRoZSBrZXJuZWwgYmVjb21lcyB1bnJlc3BvbnNpdmUsCj4gPiA+ID4gd2UgbmVlZCB0
byB0cmlnZ2VyIGFuIHVua25vd24gTk1JIHRvIGNhdXNlIHRoZSBzeXN0ZW0gdG8gcGFuaWMoKSBh
bmQKPiA+ID4gPiB0aGVuIGNvbGxlY3QgdGhlIHZtY29yZSwgYW5kIHN1Y2ggYSByZXF1aXJlbWVu
dCBpcyBjb21tb24gb24geDg2Cj4gPiA+ID4gc2VydmVycy4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBDbMOpbWVudAo+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArc3RhdGljIGludCBubWlfc3NlX2hhbmRsZXIodTMyIGV2
dCwgdm9pZCAqYXJnLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiA+ID4gK3sKPiA+ID4g
PiA+ID4gKyAgICAgbm1pX2hhbmRsZXIocmVncyk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
KyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
K3N0YXRpYyBpbnQgc3NlX25taV9pbml0KHZvaWQpCj4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+
ICsgICAgIGludCByZXQ7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAgICAgZXZ0ID0gc3Nl
X2V2ZW50X3JlZ2lzdGVyKFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUksIDAsCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubWlfc3NlX2hhbmRsZXIsIE5V
TEwpOwo+ID4gPgo+ID4gPiBTaG91bGQgd2UgYWRkIHRoaXMgVU5LTk9XTl9OTUkgZXZlbnQgSUQg
aW4gQ2hhcHRlciAxNyBvZiB0aGUgU0JJIHNwZWM/Cj4gPgo+ID4gVGhlIHJhdGlmaWVkIFNCSSB2
My4wIGRlZmluZXMgYSAiU29mdHdhcmUgaW5qZWN0ZWQgbG9jYWwgZXZlbnQiIChJRCAweGZmZmYw
MDAwKQo+ID4gd2hpY2ggY2FuIGJlIHVzZWQgdG8gaW5qZWN0IHBhbmljKCkgb24gYSBwYXJ0aWN1
bGFyIEhBUlQgZnJvbSBhbm90aGVyIEhBUlQuCj4KPiBIYXMgU0JJX1NTRV9FVkVOVF9MT0NBTF9T
T0ZUV0FSRSAoMHhmZmZmMDAwMCkgYmVlbiBnaXZlbiBtZWFuaW5nCj4gY3VycmVudGx5PyBUaGUg
c2NlbmFyaW8gb2YgdGhlIHVua25vd24gTk1JIGlzIHRoYXQgYWZ0ZXIgYSBIQVJUCj4gcmVjZWl2
ZXMgYW4gaW50ZXJydXB0IGZyb20gdGhlIHBsYXRmb3JtLCBNLW1vZGUgcmVzcG9uZHMgdG8gdGhp
cwo+IGludGVycnVwdCBhbmQgdGhlbiBlbnRlcnMgUy1tb2RlIHRvIGV4ZWN1dGUgdGhlIHJlZ2lz
dGVyZWQgaGFuZGxlci4KPiBDYW4gU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRSBiZSB1c2Vk
IGRpcmVjdGx5PwoKSXQncyBhIHNvZnR3YXJlIGluamVjdGVkIGV2ZW50IHdpdGggbG93ZXIgcHJp
b3JpdHkgd2hpY2ggY2FuIGJlIHVzZWQgYnkKc3VwZXJ2aXNvciBzb2Z0d2FyZSBvbiBhIEhBUlQg
dG8gaW5qZWN0IGFuIGV2ZW50IHRvIGFub3RoZXIgSEFSVC4KCklmIHlvdSBuZWVkIGEgcGxhdGZv
cm0gc3BlY2lmaWMgZXZlbnQgdGhlbiB0aGVyZSBhcmUgbXVsdGlwbGUgcmFuZ2VzCndpdGggZGlm
ZmVyZW50IHByaW9yaXR5LWxldmVscy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
