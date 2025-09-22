Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B5CAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WcsK1jy0+hDl+bW93zr5GWykz+5CJcN0Duf2+p8cwg=; b=wlBWgRGILcc56x
	RMuBu/eJssoTPr5FdM1V7cz7PrbaotpR+UZ9rUOJWyFeD/P2/3e10FvhVfz/ACU6Wn5qsurJCZ7uU
	G7sRrYv/TjcpxhiqxYAV/KKXmbUCHLIxn+KXwHAFfSllQwa8Cu/ubxr6RwS8Uw7eu2zaoMdB7oMVk
	ESfbxDGBRQ7dq9ilDGNRw6mEUd5Gh7lcRfvhqMp2cE0JbIch4qz/P5oqRKwZD3HLJAEpD2bq/JZlg
	I0mX3wDSTabiG4iGUZ/r6bFrPWzfpHHsfjF9gmF+tcfZI4Cvzav6cNzdz6V4ThddB7ApRsu8AqBlL
	lMH8CtYmm4jO/2OiW/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dxa-0000000A5NJ-2PH9;
	Mon, 22 Sep 2025 10:39:54 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dxX-0000000A5M3-3DZy
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 10:39:53 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-8b0055cbd0fso216150939f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758537591; x=1759142391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKKYBW3TEit9DV3MnVC+0Xh5Lri4Ge0jB2/Y1Xi7PgY=;
        b=mt5ZKy2oKeVR/1UX/bTTi4qBjUuZk+tHVeRquDpTt7rAloitchzddp93gA77Oyi8iC
         XDOp/8rDG4XQizv3xcxpu+MheSnghH4LyvJfJHu3Nwn5YXDQt9RsK5vlzPLGX2oi7xC1
         PVCYE6dp3DU7qzPQ9j08wlrg9nl2tjCzV911FfyanltoWQNkqIWmdYJ0KRighiE/y0D4
         9pFt251yxfXhU4WuW9AjYO0ODEMzn7vRmkLQJXL8ofqb/UADnT41P3s/dgqm3MFQFIAK
         bkmf1UnXQRoffCQMdMEo0TQepUwpiM8ECTF/QBm5DCxKLeMDxtjt/VYyoeYfB8n26b3m
         vv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758537591; x=1759142391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKKYBW3TEit9DV3MnVC+0Xh5Lri4Ge0jB2/Y1Xi7PgY=;
        b=TsNQ2z8VJBkVHFC9/lEpkqCisiVtAABqXFVKP+1f1kBA2xrELZE03lEPzuldOKjiwz
         NQona2D7bHE/aPS+m+g55/IlFmicWoxl8EB373wyiT6g8JZjXzVYsYCFb12JfvobkPsk
         umBNDGBFa9Dot6F4yRaePDS/e/vOaygd4A9w1daKm3Rrfh1Z7KASj+i+P0EHVMy/5ApI
         G6jgnYkkE9cqTbmPkVA/wiBmBpLERzt3HNWRBZKBaW4UR6ZUlmdLytrY5tCgEy7sLDTI
         Icm5uSZ5NdFrrwtDxESJuXRFNY7nTv+c43VOooQDo/RWJSNOyWDImwXeBGDGTT4LusXQ
         UM0g==
X-Forwarded-Encrypted: i=1; AJvYcCUPoZoRtM6QK5kAdSKcbCSRO+159Lwd4A7fvjXmcdQN0rQuXMWwL7M49MqeO/umC633tFWEsuCY5zzwkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4MMI6ZIjdShWvaNYCGDej2yTFiBw8VxJOW66f+1jVvdn8w9id
	Ym/D2jtdhQ6PJJNH5NtuX/kOMQnDEgZxDxZeLxJnK+FkaR34kHSJdF9Xg1+pyjIzbNsZpVgfEQm
	vyKwgEaQ8j2BPFJ6tAxULdCSEkdtqS/Ms4z+INkSpqQ==
X-Gm-Gg: ASbGncvhaHgfyUd/n3LXIpWzlkQonIVzQ7i11+Hnd4342ROPS17GTJ9sRc7stiL69oC
	pfSQfmrIfu4O1uW21DuXIzIOmJz0WF/rsMGRXT+AQhfygwcUQhrR+D6aNn8HRYXAKWwjGUFCYDe
	L+7GdVpRmCf1Z4oieVtM+pPX5ew1+PGUCowu4cC0pzon+qjM5zaP9BJg88U8a8+IMd4q719gNd5
	hVPUcIYv3Ah1KFqC/AA6nCBygtJ+oN898hxoS3i
X-Google-Smtp-Source: AGHT+IFqGdebv6+dbsAdCn6tm5poQkoAGXJ+MYESTNHbfomqc5g/QGl3VYxeUqw42DtXEAPiFmWASIlo4+PXvlYRB6k=
X-Received: by 2002:a05:6e02:12c8:b0:425:7974:fe3e with SMTP id
 e9e14a558f8ab-425797500ccmr46686815ab.17.1758537590596; Mon, 22 Sep 2025
 03:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com> <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
In-Reply-To: <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 16:09:39 +0530
X-Gm-Features: AS18NWDdIl_oVq2lFdvJg5TQaiARn3GFkx7edDGcTJYNE-HcnObbBa-06mo7hiU
Message-ID: <CAAhSdy3ioaOBxO++XBBWfx9RRH-7BJQDLR0q6sSEr2m8W2cdwg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_033952_061786_39CF0433 
X-CRM114-Status: GOOD (  36.37  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTo0MuKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIENsw6ltZW50LAo+Cj4gT24gRnJpLCBTZXAgMTks
IDIwMjUgYXQgMzo1MuKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3
cm90ZToKPiA+Cj4gPiBIaSBDbMOpbWVudCwKPiA+Cj4gPiBPbiBGcmksIFNlcCAxOSwgMjAyNSBh
dCAzOjE44oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gT24gMTkvMDkvMjAyNSAwOTowMCwgWXVuaHVpIEN1aSB3
cm90ZToKPiA+ID4gPiBVbmtub3duIE5NSSBjYW4gZm9yY2UgdGhlIGtlcm5lbCB0byByZXNwb25k
IChlLmcuLCBwYW5pYykgd2hlbiB0aGUKPiA+ID4gPiBzeXN0ZW0gZW5jb3VudGVycyB1bnJlY29n
bml6ZWQgY3JpdGljYWwgaGFyZHdhcmUgZXZlbnRzLCBhaWRpbmcgaW4KPiA+ID4gPiB0cm91Ymxl
c2hvb3Rpbmcgc3lzdGVtIGZhdWx0cy4gVGhpcyBpcyBpbXBsZW1lbnRlZCB2aWEgdGhlIFN1cGVy
dmlzb3IKPiA+ID4gPiBTb2Z0d2FyZSBFdmVudHMgKFNTRSkgZnJhbWV3b3JrLgo+ID4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgIHwg
IDEgKwo+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgICB8IDEwICsrKysr
Cj4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUgIHwgIDEgKwo+ID4gPiA+
ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYyB8IDc3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9zc2Vf
bm1pLmMKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gPiA+IGluZGV4IDg3NGNj
MWQ3NjAzYTUuLjU4MDFmOTBhODhmNjIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2Jp
LmgKPiA+ID4gPiBAQCAtNDgxLDYgKzQ4MSw3IEBAIGVudW0gc2JpX3NzZV9hdHRyX2lkIHsKPiA+
ID4gPgo+ID4gPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfSElHSF9QUklPX1JBUyAg
ICAweDAwMDAwMDAwCj4gPiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVf
VFJBUCAgICAgICAgICAgICAgMHgwMDAwMDAwMQo+ID4gPiA+ICsjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfVU5LTk9XTl9OTUkgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMgo+ID4g
Pgo+ID4gPiBXYXMgdGhpcyBzdWJtaXR0ZWQgdG8gdGhlIFBSUyBXRyA/IFRoaXMgYSBzcGVjaWZp
Y2F0aW9uIG1vZGlmaWNhdGlvbiBzbwo+ID4gPiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgdXN1
YWwgcHJvY2Vzcy4KPiA+ID4KPiA+ID4gPiAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9I
SUdIX1BSSU9fUkFTICAgMHgwMDAwODAwMAo+ID4gPiA+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
TE9DQUxfUE1VX09WRVJGTE9XICAgICAweDAwMDEwMDAwCj4gPiA+ID4gICNkZWZpbmUgU0JJX1NT
RV9FVkVOVF9MT0NBTF9MT1dfUFJJT19SQVMgICAgIDB4MDAxMDAwMDAKPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9y
aXNjdi9LY29uZmlnCj4gPiA+ID4gaW5kZXggZWQ1YjY2M2FjNWY5MS4uNzQ2YmFjODYyYWM0NiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4g
PiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4gPiBAQCAtMTIsNCAr
MTIsMTQgQEAgY29uZmlnIFJJU0NWX1NCSV9TU0UKPiA+ID4gPiAgICAgICAgIHRoaXMgb3B0aW9u
IHByb3ZpZGVzIHN1cHBvcnQgdG8gcmVnaXN0ZXIgY2FsbGJhY2tzIG9uIHNwZWNpZmljIFNTRQo+
ID4gPiA+ICAgICAgICAgZXZlbnRzLgo+ID4gPiA+Cj4gPiA+ID4gK2NvbmZpZyBSSVNDVl9TU0Vf
VU5LTk9XTl9OTUkKPiA+ID4gPiArICAgICBib29sICJFbmFibGUgU0JJIFN1cGVydmlzb3IgU29m
dHdhcmUgRXZlbnRzIHVua25vd24gTk1JIHN1cHBvcnQiCj4gPiA+ID4gKyAgICAgZGVwZW5kcyBv
biBSSVNDVl9TQklfU1NFCj4gPiA+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiA+ID4gKyAgICAgaGVs
cAo+ID4gPiA+ICsgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBkZWxpdmVy
aW5nIHVua25vd24gTm9uLU1hc2thYmxlIEludGVycnVwdCAoTk1JKQo+ID4gPiA+ICsgICAgICAg
bm90aWZpY2F0aW9ucyB2aWEgdGhlIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIChTU0UpIGZy
YW1ld29yay4gV2hlbiBlbmFibGVkLAo+ID4gPiA+ICsgICAgICAgdW5rbm93biBOTUlzIGNhbiB0
cmlnZ2VyIGtlcm5lbCByZXNwb25zZXMgKGUuZy4sIHBhbmljKSBmb3IgdW5yZWNvZ25pemVkIGNy
aXRpY2FsCj4gPiA+ID4gKyAgICAgICBoYXJkd2FyZSBldmVudHMsIGFpZGluZyBpbiBzeXN0ZW0g
ZmF1bHQgZGlhZ25vc2lzLgo+ID4gPiA+ICsKPiA+ID4gPiAgZW5kbWVudQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2Fy
ZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+IGluZGV4IGM4Nzk1ZDRiYmIyZWEuLjkyNDJjNmNkNWUz
ZTkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiA+ID4gPiBAQCAt
MSwzICsxLDQgQEAKPiA+ID4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
ID4gPiA+Cj4gPiA+ID4gIG9iai0kKENPTkZJR19SSVNDVl9TQklfU1NFKSAgICAgICAgICArPSBy
aXNjdl9zYmlfc3NlLm8KPiA+ID4gPiArb2JqLSQoQ09ORklHX1JJU0NWX1NTRV9VTktOT1dOX05N
SSkgICs9IHNzZV9ubWkubwo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jp
c2N2L3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4gPiA+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi40MzA2M2Y0
MmVmZmYwCj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jCj4gPiA+ID4gQEAgLTAsMCArMSw3NyBAQAo+ID4gPiA+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPiA+ID4gPiArCj4gPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9tbS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9yaXNjdl9zYmlfc3NlLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9zY2hlZC9kZWJ1Zy5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvc3lzY3RsLmg+Cj4gPiA+
ID4gKwo+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL2lycV9yZWdzLmg+Cj4gPiA+ID4gKyNpbmNsdWRl
IDxhc20vc2JpLmg+Cj4gPiA+ID4gKwo+ID4gPiA+ICtpbnQgcGFuaWNfb25fdW5rbm93bl9ubWkg
PSAxOwo+ID4gPiA+ICtzdHJ1Y3Qgc3NlX2V2ZW50ICpldnQ7Cj4gPiA+ID4gK3N0YXRpYyBzdHJ1
Y3QgY3RsX3RhYmxlX2hlYWRlciAqdW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlcjsKPiA+ID4gPiAr
Cj4gPiA+ID4gK2NvbnN0IHN0cnVjdCBjdGxfdGFibGUgdW5rbm93bl9ubWlfdGFibGVbXSA9IHsK
PiA+ID4gPiArICAgICB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAucHJvY25hbWUgICAgICAgPSAi
cGFuaWNfZW5hYmxlIiwKPiA+ID4gPiArICAgICAgICAgICAgIC5kYXRhICAgICAgICAgICA9ICZw
YW5pY19vbl91bmtub3duX25taSwKPiA+ID4gPiArICAgICAgICAgICAgIC5tYXhsZW4gICAgICAg
ICA9IHNpemVvZihpbnQpLAo+ID4gPiA+ICsgICAgICAgICAgICAgLm1vZGUgICAgICAgICAgID0g
MDY0NCwKPiA+ID4gPiArICAgICAgICAgICAgIC5wcm9jX2hhbmRsZXIgICA9IHByb2NfZG9pbnR2
ZWNfbWlubWF4LAo+ID4gPiA+ICsgICAgICAgICAgICAgLmV4dHJhMSAgICAgICAgID0gU1lTQ1RM
X1pFUk8sCj4gPiA+ID4gKyAgICAgICAgICAgICAuZXh0cmEyICAgICAgICAgPSBTWVNDVExfT05F
LAo+ID4gPiA+ICsgICAgIH0sCj4gPiA+ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMg
dm9pZCBubWlfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiArewo+ID4gPiA+
ICsgICAgIHByX2VtZXJnKCJOTUkgcmVjZWl2ZWQgZm9yIHVua25vd24gb24gQ1BVICVkLlxuIiwg
c21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKHBhbmljX29u
X3Vua25vd25fbm1pKQo+ID4gPiA+ICsgICAgICAgICAgICAgbm1pX3BhbmljKHJlZ3MsICJOTUk6
IE5vdCBjb250aW51aW5nIik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHByX2VtZXJnKCJEYXpl
ZCBhbmQgY29uZnVzZWQsIGJ1dCB0cnlpbmcgdG8gY29udGludWVcbiIpOwo+ID4gPiA+ICt9Cj4g
PiA+Cj4gPiA+IEknbSBkYXplZCBhbmQgY29uZnVzZWQgYXMgd2VsbCA7KSBXaGF0J3MgdGhlIHBv
aW50IG9mIHRoaXMgZXhjZXB0Cj4gPiA+IGludGVycnVwdGluZyB0aGUga2VybmVsIHdpdGggYSBw
YW5pYyA/IEl0IHNlZW1zIGxpa2UgaXQncyBhIGJldHRlciBpZGVhCj4gPiA+IHRvIGxldCB0aGUg
ZmlybXdhcmUgaGFuZGxlIHRoYXQgcHJvcGVybHkgYW5kIGRpc3BsYXkgd2hhdGV2ZXIKPiA+ID4g
aW5mb3JtYXRpb24gYXJlIG5lZWRlZC4gV2FzIHlvdXIgaWRlYSB0byBhY3R1YWxseSBmb3JjZSB0
aGUga2VybmVsIHRvCj4gPiA+IGVudGVyIGluIHNvbWUgZGVidWcgbW9kZSA/Cj4gPgo+ID4gVGhl
cmUgaXMgYW4gaW1wb3J0YW50IHNjZW5hcmlvOiB3aGVuIHRoZSBrZXJuZWwgYmVjb21lcyB1bnJl
c3BvbnNpdmUsCj4gPiB3ZSBuZWVkIHRvIHRyaWdnZXIgYW4gdW5rbm93biBOTUkgdG8gY2F1c2Ug
dGhlIHN5c3RlbSB0byBwYW5pYygpIGFuZAo+ID4gdGhlbiBjb2xsZWN0IHRoZSB2bWNvcmUsIGFu
ZCBzdWNoIGEgcmVxdWlyZW1lbnQgaXMgY29tbW9uIG9uIHg4Ngo+ID4gc2VydmVycy4KPiA+Cj4g
PiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4KPiA+ID4gQ2zDqW1lbnQKPiA+ID4KPiA+ID4gPiArCj4g
PiA+ID4gK3N0YXRpYyBpbnQgbm1pX3NzZV9oYW5kbGVyKHUzMiBldnQsIHZvaWQgKmFyZywgc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBubWlfaGFuZGxlcihy
ZWdzKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4g
PiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgc3NlX25taV9pbml0KHZvaWQpCj4gPiA+ID4gK3sKPiA+
ID4gPiArICAgICBpbnQgcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBldnQgPSBzc2VfZXZl
bnRfcmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktOT1dOX05NSSwgMCwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm1pX3NzZV9oYW5kbGVyLCBOVUxMKTsKPgo+
IFNob3VsZCB3ZSBhZGQgdGhpcyBVTktOT1dOX05NSSBldmVudCBJRCBpbiBDaGFwdGVyIDE3IG9m
IHRoZSBTQkkgc3BlYz8KClRoZSByYXRpZmllZCBTQkkgdjMuMCBkZWZpbmVzIGEgIlNvZnR3YXJl
IGluamVjdGVkIGxvY2FsIGV2ZW50IiAoSUQgMHhmZmZmMDAwMCkKd2hpY2ggY2FuIGJlIHVzZWQg
dG8gaW5qZWN0IHBhbmljKCkgb24gYSBwYXJ0aWN1bGFyIEhBUlQgZnJvbSBhbm90aGVyIEhBUlQu
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
