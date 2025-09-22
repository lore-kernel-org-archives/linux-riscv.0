Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ABBCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y8x04yeCbis+8BVXRyLgFIhpIxBUvs5VzOTRQVVJPo=; b=W7NPS1MGEWulES
	/PS/1ruXjwmnpfCoEl5cRWNwxxun/VtmHPeF57AENJAlKC+S6W5EwzMMVMlyv1h/p/smNLyzlWL0j
	4+sxNmkX5izp5fF5Gnx8mcbzYCcQ3+kBlDpPaxG7PsyHu1d4q0GMlCX7Rsi/c9Re8D/yUVIwVt3Bl
	5L6rKbd2Sx3aCwxENePjQ+gpwrqCPtWwlyI0YT4vsrgHpwYqow32ofG6hDB4X5+QX7oivcvojJzl3
	DVFsH4gP4he4mGV0+wJ2NZApYssA7FxYQASZoXNzwtSruto01Z7/07Lg8uLNAmEjOY9OEVZfpkWme
	l5Z1TQc2jM35J+4yb1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bdy-00000009d3t-23C4;
	Mon, 22 Sep 2025 08:11:30 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bdw-00000009d39-3o1W
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 08:11:30 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-30cce892b7dso2665332fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758528688; x=1759133488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDTYI9b1YVpTY7QvyQYWdgeohTyw1IGddoA/28t5dEc=;
        b=h++8RmIkT0dGwIWlsavWKhljmLtZrfeuZqdS1kUeAnMV9pjBCuHtTWWsSD2dfC0zUw
         pV2hzZEoGmSRun63VR9FwlBOJXLXTD/km6OLFdrK9Kk8ZPhLVuoND/NU9pxb6xVi4T2D
         r4PiUqoAYyg5SFoyg0QC9GrylBYQknl5uAC4vpDpLXLOwvcKoJ6LIJ+9wN9p0VYyvxUc
         C6E/8n1vFnS9hh94ZjRdpfZs7oVuws/YZOz5ENKt2fp4iSy3x6AKcoDoXNOSOtomFJmt
         I5vLjunqltfy6VsM6oToQzBdyU75ikfHbPcYF/dJ0EQqIJSQmpHruY7NlNuTCOHziT9I
         4hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528688; x=1759133488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDTYI9b1YVpTY7QvyQYWdgeohTyw1IGddoA/28t5dEc=;
        b=AKRMe9LzQwVsHfL+4RfEey1XIGbKZDBktocdNCPFtdgXL3udzsc2aMrA4s75IiHLkh
         GSF91TKn4wfPaa6JIT14W7FDALhgxJrUTJF6mxp8upf5pg8HM61vAJR1tqOZCz6aiTEn
         U5VsaeAWz2CeupbF5WJQd3sZFdONi6uQyCGGYvUFgFiVRMLJ+jOV/9a205Tpu2Z8EPvn
         /KrzykoimfPHHfgsLu+Q9yp5NmgSf58mUm5NJhMkSJpV//73vuWHxPCAjPKDReS7sGu1
         rlYGd989ytGjjdXhsygBiH+d1jV0+aF2bk7pMy8bKgnTkKFx+gS1Kgwe6PgyhDUAX1ym
         Vyjw==
X-Forwarded-Encrypted: i=1; AJvYcCV2KqTo3XpEqTNR0LPHGgSQhen49IcAuPdh0e0Tf3J6TUVtHTdPamX16jJ4xg59ilLhdu6m8BY46SkyFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQmMWMGnP7nEmYXDecQIpB4XnKapbPJ+UWZNY5BXeb8gNz/H6V
	TWglSb2U7DsLXVokKaFsB84Bocped4r3mIVGowW23yt04GZFqCBJ8dafyZYkFLpi/kQadFgAIWW
	KM9DNR+N1Zd5nRrA0ovHnk/e4WJUX0DLppnjXgN9DqA==
X-Gm-Gg: ASbGncslqBgV+Fg0UUwuAEnMePUgfDeUsj9TXpIEbrAVNdNU7Z8AJtJ7ic6B3cHBUye
	s0H7iS6EzulzO7i+vHKmSg5LijFLNyQ2wZhIb/XAL4FdZEHTw+fl2cPtZ8BvlAjSgYz4WNfJPhg
	e50X7hk2iGrmJ+gupzUrOeZupmEJochBZALfjXBr+5FyQcZxw1i2ZIqCjqLsQe7hq5ibOpLNFzS
	PmL/egz91rqOE2TK8DKJmIq
X-Google-Smtp-Source: AGHT+IFXQzTCUzI8K5cHXrROdpysEPm4Z8r4rBmaaOGUzXW/yMCZuSV7TNKUMvuHBsxKrhO0g3kJ3eTx1TQ6/KU9/6g=
X-Received: by 2002:a05:6870:8a27:b0:331:cbf1:e04b with SMTP id
 586e51a60fabf-33bb506931bmr5485476fac.46.1758528687811; Mon, 22 Sep 2025
 01:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Sep 2025 16:11:15 +0800
X-Gm-Features: AS18NWC_nIPhbcA4wlMemBhePC9PC4Rh7umDJjFYuGZF1PqAVqUIfy-e4ryuzIk
Message-ID: <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011128_966210_D74CA8E3 
X-CRM114-Status: GOOD (  33.80  )
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

SGkgQ2zDqW1lbnQsCgpPbiBGcmksIFNlcCAxOSwgMjAyNSBhdCAzOjUy4oCvUE0geXVuaHVpIGN1
aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgQ2zDqW1lbnQsCj4KPiBP
biBGcmksIFNlcCAxOSwgMjAyNSBhdCAzOjE44oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+IE9uIDE5LzA5LzIwMjUgMDk6MDAs
IFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+IFVua25vd24gTk1JIGNhbiBmb3JjZSB0aGUga2VybmVs
IHRvIHJlc3BvbmQgKGUuZy4sIHBhbmljKSB3aGVuIHRoZQo+ID4gPiBzeXN0ZW0gZW5jb3VudGVy
cyB1bnJlY29nbml6ZWQgY3JpdGljYWwgaGFyZHdhcmUgZXZlbnRzLCBhaWRpbmcgaW4KPiA+ID4g
dHJvdWJsZXNob290aW5nIHN5c3RlbSBmYXVsdHMuIFRoaXMgaXMgaW1wbGVtZW50ZWQgdmlhIHRo
ZSBTdXBlcnZpc29yCj4gPiA+IFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBmcmFtZXdvcmsuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgIHwgIDEg
Kwo+ID4gPiAgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnICAgfCAxMCArKysrKwo+ID4g
PiAgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZSAgfCAgMSArCj4gPiA+ICBkcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYwo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+ID4gaW5kZXggODc0Y2MxZDc2MDNhNS4uNTgwMWY5MGE4
OGY2MiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+IEBAIC00ODEsNiArNDgx
LDcgQEAgZW51bSBzYmlfc3NlX2F0dHJfaWQgewo+ID4gPgo+ID4gPiAgI2RlZmluZSBTQklfU1NF
X0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMgICAgMHgwMDAwMDAwMAo+ID4gPiAgI2RlZmluZSBT
QklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQICAgICAgICAgICAgICAweDAwMDAwMDAxCj4g
PiA+ICsjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUkgICAgICAgICAgICAg
ICAgICAgICAgMHgwMDAwMDAwMgo+ID4KPiA+IFdhcyB0aGlzIHN1Ym1pdHRlZCB0byB0aGUgUFJT
IFdHID8gVGhpcyBhIHNwZWNpZmljYXRpb24gbW9kaWZpY2F0aW9uIHNvCj4gPiBpdCBzaG91bGQg
Z28gdGhyb3VnaCB0aGUgdXN1YWwgcHJvY2Vzcy4KPiA+Cj4gPiA+ICAjZGVmaW5lIFNCSV9TU0Vf
RVZFTlRfR0xPQkFMX0hJR0hfUFJJT19SQVMgICAweDAwMDA4MDAwCj4gPiA+ICAjZGVmaW5lIFNC
SV9TU0VfRVZFTlRfTE9DQUxfUE1VX09WRVJGTE9XICAgICAweDAwMDEwMDAwCj4gPiA+ICAjZGVm
aW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTICAgICAweDAwMTAwMDAwCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgYi9kcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4gaW5kZXggZWQ1YjY2M2FjNWY5MS4uNzQ2YmFjODYy
YWM0NiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZwo+ID4gPiBAQCAtMTIsNCAr
MTIsMTQgQEAgY29uZmlnIFJJU0NWX1NCSV9TU0UKPiA+ID4gICAgICAgICB0aGlzIG9wdGlvbiBw
cm92aWRlcyBzdXBwb3J0IHRvIHJlZ2lzdGVyIGNhbGxiYWNrcyBvbiBzcGVjaWZpYyBTU0UKPiA+
ID4gICAgICAgICBldmVudHMuCj4gPiA+Cj4gPiA+ICtjb25maWcgUklTQ1ZfU1NFX1VOS05PV05f
Tk1JCj4gPiA+ICsgICAgIGJvb2wgIkVuYWJsZSBTQkkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVu
dHMgdW5rbm93biBOTUkgc3VwcG9ydCIKPiA+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklf
U1NFCj4gPiA+ICsgICAgIGRlZmF1bHQgeQo+ID4gPiArICAgICBoZWxwCj4gPiA+ICsgICAgICAg
VGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBkZWxpdmVyaW5nIHVua25vd24gTm9uLU1h
c2thYmxlIEludGVycnVwdCAoTk1JKQo+ID4gPiArICAgICAgIG5vdGlmaWNhdGlvbnMgdmlhIHRo
ZSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBmcmFtZXdvcmsuIFdoZW4gZW5hYmxl
ZCwKPiA+ID4gKyAgICAgICB1bmtub3duIE5NSXMgY2FuIHRyaWdnZXIga2VybmVsIHJlc3BvbnNl
cyAoZS5nLiwgcGFuaWMpIGZvciB1bnJlY29nbml6ZWQgY3JpdGljYWwKPiA+ID4gKyAgICAgICBo
YXJkd2FyZSBldmVudHMsIGFpZGluZyBpbiBzeXN0ZW0gZmF1bHQgZGlhZ25vc2lzLgo+ID4gPiAr
Cj4gPiA+ICBlbmRtZW51Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiBpbmRleCBj
ODc5NWQ0YmJiMmVhLi45MjQyYzZjZDVlM2U5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L01ha2VmaWxlCj4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yv
TWFrZWZpbGUKPiA+ID4gQEAgLTEsMyArMSw0IEBACj4gPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4gPiA+Cj4gPiA+ICBvYmotJChDT05GSUdfUklTQ1ZfU0JJX1NTRSkg
ICAgICAgICAgKz0gcmlzY3Zfc2JpX3NzZS5vCj4gPiA+ICtvYmotJChDT05GSUdfUklTQ1ZfU1NF
X1VOS05PV05fTk1JKSAgKz0gc3NlX25taS5vCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5j
Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjQz
MDYzZjQyZWZmZjAKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9kcml2ZXJzL2Zpcm13
YXJlL3Jpc2N2L3NzZV9ubWkuYwo+ID4gPiBAQCAtMCwwICsxLDc3IEBACj4gPiA+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPiA+ID4gKwo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L21tLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPiA+ICsjaW5jbHVkZSA8
bGludXgvcmlzY3Zfc2JpX3NzZS5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVn
Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvc3lzY3RsLmg+Cj4gPiA+ICsKPiA+ID4gKyNpbmNs
dWRlIDxhc20vaXJxX3JlZ3MuaD4KPiA+ID4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gPiA+ICsK
PiA+ID4gK2ludCBwYW5pY19vbl91bmtub3duX25taSA9IDE7Cj4gPiA+ICtzdHJ1Y3Qgc3NlX2V2
ZW50ICpldnQ7Cj4gPiA+ICtzdGF0aWMgc3RydWN0IGN0bF90YWJsZV9oZWFkZXIgKnVua25vd25f
bm1pX3N5c2N0bF9oZWFkZXI7Cj4gPiA+ICsKPiA+ID4gK2NvbnN0IHN0cnVjdCBjdGxfdGFibGUg
dW5rbm93bl9ubWlfdGFibGVbXSA9IHsKPiA+ID4gKyAgICAgewo+ID4gPiArICAgICAgICAgICAg
IC5wcm9jbmFtZSAgICAgICA9ICJwYW5pY19lbmFibGUiLAo+ID4gPiArICAgICAgICAgICAgIC5k
YXRhICAgICAgICAgICA9ICZwYW5pY19vbl91bmtub3duX25taSwKPiA+ID4gKyAgICAgICAgICAg
ICAubWF4bGVuICAgICAgICAgPSBzaXplb2YoaW50KSwKPiA+ID4gKyAgICAgICAgICAgICAubW9k
ZSAgICAgICAgICAgPSAwNjQ0LAo+ID4gPiArICAgICAgICAgICAgIC5wcm9jX2hhbmRsZXIgICA9
IHByb2NfZG9pbnR2ZWNfbWlubWF4LAo+ID4gPiArICAgICAgICAgICAgIC5leHRyYTEgICAgICAg
ICA9IFNZU0NUTF9aRVJPLAo+ID4gPiArICAgICAgICAgICAgIC5leHRyYTIgICAgICAgICA9IFNZ
U0NUTF9PTkUsCj4gPiA+ICsgICAgIH0sCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMg
dm9pZCBubWlfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gK3sKPiA+ID4gKyAg
ICAgcHJfZW1lcmcoIk5NSSByZWNlaXZlZCBmb3IgdW5rbm93biBvbiBDUFUgJWQuXG4iLCBzbXBf
cHJvY2Vzc29yX2lkKCkpOwo+ID4gPiArCj4gPiA+ICsgICAgIGlmIChwYW5pY19vbl91bmtub3du
X25taSkKPiA+ID4gKyAgICAgICAgICAgICBubWlfcGFuaWMocmVncywgIk5NSTogTm90IGNvbnRp
bnVpbmciKTsKPiA+ID4gKwo+ID4gPiArICAgICBwcl9lbWVyZygiRGF6ZWQgYW5kIGNvbmZ1c2Vk
LCBidXQgdHJ5aW5nIHRvIGNvbnRpbnVlXG4iKTsKPiA+ID4gK30KPiA+Cj4gPiBJJ20gZGF6ZWQg
YW5kIGNvbmZ1c2VkIGFzIHdlbGwgOykgV2hhdCdzIHRoZSBwb2ludCBvZiB0aGlzIGV4Y2VwdAo+
ID4gaW50ZXJydXB0aW5nIHRoZSBrZXJuZWwgd2l0aCBhIHBhbmljID8gSXQgc2VlbXMgbGlrZSBp
dCdzIGEgYmV0dGVyIGlkZWEKPiA+IHRvIGxldCB0aGUgZmlybXdhcmUgaGFuZGxlIHRoYXQgcHJv
cGVybHkgYW5kIGRpc3BsYXkgd2hhdGV2ZXIKPiA+IGluZm9ybWF0aW9uIGFyZSBuZWVkZWQuIFdh
cyB5b3VyIGlkZWEgdG8gYWN0dWFsbHkgZm9yY2UgdGhlIGtlcm5lbCB0bwo+ID4gZW50ZXIgaW4g
c29tZSBkZWJ1ZyBtb2RlID8KPgo+IFRoZXJlIGlzIGFuIGltcG9ydGFudCBzY2VuYXJpbzogd2hl
biB0aGUga2VybmVsIGJlY29tZXMgdW5yZXNwb25zaXZlLAo+IHdlIG5lZWQgdG8gdHJpZ2dlciBh
biB1bmtub3duIE5NSSB0byBjYXVzZSB0aGUgc3lzdGVtIHRvIHBhbmljKCkgYW5kCj4gdGhlbiBj
b2xsZWN0IHRoZSB2bWNvcmUsIGFuZCBzdWNoIGEgcmVxdWlyZW1lbnQgaXMgY29tbW9uIG9uIHg4
Ngo+IHNlcnZlcnMuCj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQ2zDqW1lbnQKPiA+Cj4gPiA+
ICsKPiA+ID4gK3N0YXRpYyBpbnQgbm1pX3NzZV9oYW5kbGVyKHUzMiBldnQsIHZvaWQgKmFyZywg
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIG5taV9oYW5kbGVyKHJl
Z3MpOwo+ID4gPiArCj4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICtzdGF0aWMgaW50IHNzZV9ubWlfaW5pdCh2b2lkKQo+ID4gPiArewo+ID4gPiArICAgICBpbnQg
cmV0Owo+ID4gPiArCj4gPiA+ICsgICAgIGV2dCA9IHNzZV9ldmVudF9yZWdpc3RlcihTQklfU1NF
X0VWRU5UX0xPQ0FMX1VOS05PV05fTk1JLCAwLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbm1pX3NzZV9oYW5kbGVyLCBOVUxMKTsKClNob3VsZCB3ZSBhZGQgdGhpcyBVTktO
T1dOX05NSSBldmVudCBJRCBpbiBDaGFwdGVyIDE3IG9mIHRoZSBTQkkgc3BlYz8KCgo+ID4gPiAr
ICAgICBpZiAoSVNfRVJSKGV2dCkpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIo
ZXZ0KTsKPiA+ID4gKwo+ID4gPiArICAgICByZXQgPSBzc2VfZXZlbnRfZW5hYmxlKGV2dCk7Cj4g
PiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICBzc2VfZXZlbnRfdW5yZWdp
c3RlcihldnQpOwo+ID4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICAgIH0K
PiA+ID4gKwo+ID4gPiArICAgICB1bmtub3duX25taV9zeXNjdGxfaGVhZGVyID0gcmVnaXN0ZXJf
c3lzY3RsKCJrZXJuZWwiLCB1bmtub3duX25taV90YWJsZSk7Cj4gPiA+ICsgICAgIGlmICghdW5r
bm93bl9ubWlfc3lzY3RsX2hlYWRlcikgewo+ID4gPiArICAgICAgICAgICAgIHNzZV9ldmVudF9k
aXNhYmxlKGV2dCk7Cj4gPiA+ICsgICAgICAgICAgICAgc3NlX2V2ZW50X3VucmVnaXN0ZXIoZXZ0
KTsKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4gKyAgICAgfQo+ID4g
PiArCj4gPiA+ICsgICAgIHByX2luZm8oIlVzaW5nIFNTRSBmb3IgTk1JIGV2ZW50IGRlbGl2ZXJ5
XG4iKTsKPiA+ID4gKwo+ID4gPiArICAgICByZXR1cm4gMDsKPiA+ID4gK30KPiA+ID4gKwo+ID4g
PiArc3RhdGljIGludCBfX2luaXQgdW5rbm93X25taV9pbml0KHZvaWQpCj4gPiA+ICt7Cj4gPiA+
ICsgICAgIHJldHVybiBzc2Vfbm1pX2luaXQoKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArbGF0
ZV9pbml0Y2FsbCh1bmtub3dfbm1pX2luaXQpOwo+ID4KPgo+IFRoYW5rcywKPiBZdW5odWkKClRo
YW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
