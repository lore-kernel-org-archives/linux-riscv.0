Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D2C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HqXsbeKZDEvzYsWPDDkaihWgGGL5aNbEF44Jv9o2U4I=; b=QNQLFi+siR6y9F2ZqrA5yBV4Im
	QfoUCkcQwV0iWkCtFHZWeZJTmy+ZeaR99FwXoZuZxeGRieOgn6VcnBQDevi8ppy6virXd+dlUxOy/
	4XxKouQv7imhphKsIPKtGo0qZUF2EbF0kqDe07NF6VotL2wzmZL1Mi6M10XW/lvfdEz7GcsAOZEhG
	VarB957jJgH4cRE1RUGZe4sQEj/7BBYOru479qOHn7Ca253WyGcprEvHP1sAMAzfPYss4rH9KdtWz
	TrATVJCFgNzKMNWTEDzEJf/7Nn3REWamcIFrok4+Hq5Zxpc6AjtvQwMtheOSuXROZeKKZw1DIFbnY
	PKDfy9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUAz-00000007Jg7-1g38;
	Wed, 26 Jun 2024 15:03:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUAw-00000007JfH-0SqU
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:03:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f9ffd24262so36639645ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719414189; x=1720018989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX5BuLom8gcdUTb6Qlfv9xIgyMY+J4LR2YpbCcxHoRY=;
        b=XfU7jYBi3D7U5ocUMY32E0YITFkeOta1qjOVkOu2gg6Y68xsWnaD2Er94+jLI4AGWU
         SkPrXML0EIJGbqT2lo5TopcSTpOwE/us4d7CQGiBewuBUGH1k2lFFBVyAInRK66veTBI
         aQpHm0jqh6qV5CZRXTAu6WQJFtqYmrSYQ85AcbFMvPr/u/Gt9e+dpfnA715agPpyf/PE
         YVKsdYcVgvC5FpDg2T5Xg4/2Zyg9ttqx40m2EOPi9BXM6HUTVRV1IPwxbSYwKt0bA5A8
         BIZXkkuBWPcl+QxM6u2SoSU0LwE5oEuTT5U0sln7W3e2uYrMBrUnrUSCeAFgEaf3wN8M
         cMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414189; x=1720018989;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX5BuLom8gcdUTb6Qlfv9xIgyMY+J4LR2YpbCcxHoRY=;
        b=AlM1g+lXJ/AmoAU28RSK3lqQ9GhC7g69qYKUu0y0OcuMsgbQ2ZSD4v7Y4PObHW8TSr
         YTc2BSoza1Ka6saKm9g5GO98ggSzS1c9C50O6jen//Kg00eREIYzaCH0L3/rU7bAbH21
         s3tbFAbRWi+nn/UE+51jp1JUx5mDzXfg9vlOWrC0+qWeI9bJoA5ZiCjgsJXd9GfcHQBM
         jaa1+C3fJPOleHrFlwrqIcKZ/l+nTfSseiRv0QwSkQFO9uTt5mM+sZ9hUl4iAL5JQY9G
         7gGC9aTTqTKT2VS16cFeF8DeilrxOy8Js4OOFNH8wZI7cpLE5i3XgfTHptkG92bhzIS9
         LVcg==
X-Forwarded-Encrypted: i=1; AJvYcCVi/oFUVCTP4YDDod0jszTMh+WAKOva0rDYwmIVba5+i6Vc/rPiYTp33FVy8iIipcZ2hBrgnG++yuHAKWeWildkmLu3k91+YXeeIv25AUU0
X-Gm-Message-State: AOJu0YxoywRI1yxbmotwBGh9s+KPIhIudI+yhzYp6YTJjJXenvhGwjkw
	F77xbBp7rmRPgJf4BzRdLoiXmBuLvUq0fAX1UiMMKieRAxOnkek3Bj3XD94o2oE=
X-Google-Smtp-Source: AGHT+IHj5kQUVnnlLQBZ4PjflSS1nFMEsisTzs7U5PNdPk5S86sOVMgB1vzs6n/LhHNSIfIE6CcQ6Q==
X-Received: by 2002:a17:902:e542:b0:1f9:edf6:d7a5 with SMTP id d9443c01a7336-1fa23f227c0mr125868805ad.1.1719414188845;
        Wed, 26 Jun 2024 08:03:08 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc2a7fsm99730155ad.283.2024.06.26.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:03:08 -0700 (PDT)
Date: Wed, 26 Jun 2024 08:03:08 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2024 08:03:05 PDT (-0700)
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
In-Reply-To: <CAJve8onakqwyXNcwtNOLTGah+=pbWzdNBwM64U0htyDJyY3nwQ@mail.gmail.com>
CC: Atish Patra <atishp@rivosinc.com>, haibo1.xu@intel.com,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
  aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, Ard Biesheuvel <ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xiaobo55x@gmail.com
Message-ID: <mhng-dc33bf67-dbfe-4eb5-b5f6-6c83770dcc3c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_080310_176516_63C63793 
X-CRM114-Status: GOOD (  37.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyNiBNYXkgMjAyNCAwMjoxNzo0MCBQRFQgKC0wNzAwKSwgeGlhb2JvNTV4QGdtYWls
LmNvbSB3cm90ZToKPiBraW5kbHkgcGluZyEKPgo+IEFueSBtb3JlIGNvbW1lbnRzIG9uIHRoaXMg
cGF0Y2g/CgpTb3JyeSBJIGRyb3BwZWQgdGhlIGJhbGwgb24gdGhpcyBvbmUsIGl0J3MgcXVldWVk
IHVwIGZvciBzdGFnaW5nIGFuZCAKc2hvdWxkIHNob3cgdXAgb24gZm9yLW5leHQgYXNzdW1pbmcg
aXQgcGFzc2VzIHRoZSB0ZXN0cy4KCj4KPiBUaGFua3MsCj4gSGFpYm8KPgo+IE9uIE1vbiwgQXBy
IDI5LCAyMDI0IGF0IDEwOjIy4oCvUE0gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiBIaSBAUGFsbWVyLAo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93
IHdoZXRoZXIgdGhpcyBwYXRjaCB3YXMgT0sgZm9yIHRoZSBuZXh0IFJJU0MtViBQVUxMPwo+Pgo+
PiBUaGFua3MsCj4+IEhhaWJvCj4+Cj4+IE9uIFdlZCwgTWFyIDIwLCAyMDI0IGF0IDM6NDbigK9B
TSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiAz
LzE3LzI0IDE5OjA5LCBIYWlibyBYdSB3cm90ZToKPj4gPiA+IEVuYWJsZSB0aGUgZG1pIGRyaXZl
ciBmb3IgcmlzY3Ygd2hpY2ggd291bGQgYWxsb3cgYWNjZXNzIHRoZQo+PiA+ID4gU01CSU9TIGlu
Zm8gdGhyb3VnaCBzb21lIHVzZXJzcGFjZSBmaWxlKC9zeXMvZmlybXdhcmUvZG1pLyopLgo+PiA+
ID4KPj4gPiA+IFRoZSBjaGFuZ2Ugd2FzIGJhc2VkIG9uIHRoYXQgb2YgYXJtNjQgYW5kIGhhcyBi
ZWVuIHZlcmlmaWVkCj4+ID4gPiBieSBkbWlkZWNvZGUgdG9vbC4KPj4gPiA+Cj4+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPj4gPiA+IC0tLQo+PiA+
ID4gQ2hhbmdlcyBzaW5jZSB2MQo+PiA+ID4gICAgLSBDaGFuZ2UgdG8gdXNlIG1lbXJlbWFwL21l
bXVubWFwIGZvciBkbWlfKGVhcmx5KV9yZW1hcC91bm1hcAo+PiA+ID4gICAgICBkZWZpbml0aW9u
KHN1Z2dlc3RlZCBieSBBcmQpCj4+ID4gPiAgICAtIE1pbm9yIGNsZWFuIHVwIGZvciBjb21tZW50
cyAoQXJkKQo+PiA+ID4gLS0tCj4+ID4gPiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICB8IDExICsrKysrKysrKysrCj4+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZG1pLmggICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiA+ID4gICBkcml2
ZXJzL2Zpcm13YXJlL2VmaS9yaXNjdi1ydW50aW1lLmMgfCAxMyArKysrKysrKysrKysrCj4+ID4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+PiA+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaAo+PiA+ID4KPj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gPiA+IGlu
ZGV4IDhlYmFmZTMzN2VhYy4uMzYzOTE1MWNiNGVmIDEwMDY0NAo+PiA+ID4gLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCj4+ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gPiA+IEBAIC05
NTIsNiArOTUyLDE3IEBAIGNvbmZpZyBFRkkKPj4gPiA+ICAgICAgICAgYWxsb3cgdGhlIGtlcm5l
bCB0byBiZSBib290ZWQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLiBUaGlzCj4+ID4gPiAgICAgICAg
IGlzIG9ubHkgdXNlZnVsIG9uIHN5c3RlbXMgdGhhdCBoYXZlIFVFRkkgZmlybXdhcmUuCj4+ID4g
Pgo+PiA+ID4gK2NvbmZpZyBETUkKPj4gPiA+ICsgICAgIGJvb2wgIkVuYWJsZSBzdXBwb3J0IGZv
ciBTTUJJT1MgKERNSSkgdGFibGVzIgo+PiA+ID4gKyAgICAgZGVwZW5kcyBvbiBFRkkKPj4gPiA+
ICsgICAgIGRlZmF1bHQgeQo+PiA+ID4gKyAgICAgaGVscAo+PiA+ID4gKyAgICAgICBUaGlzIGVu
YWJsZXMgU01CSU9TL0RNSSBmZWF0dXJlIGZvciBzeXN0ZW1zLgo+PiA+ID4gKwo+PiA+ID4gKyAg
ICAgICBUaGlzIG9wdGlvbiBpcyBvbmx5IHVzZWZ1bCBvbiBzeXN0ZW1zIHRoYXQgaGF2ZSBVRUZJ
IGZpcm13YXJlLgo+PiA+ID4gKyAgICAgICBIb3dldmVyLCBldmVuIHdpdGggdGhpcyBvcHRpb24s
IHRoZSByZXN1bHRhbnQga2VybmVsIHNob3VsZAo+PiA+ID4gKyAgICAgICBjb250aW51ZSB0byBi
b290IG9uIGV4aXN0aW5nIG5vbi1VRUZJIHBsYXRmb3Jtcy4KPj4gPiA+ICsKPj4gPiA+ICAgY29u
ZmlnIENDX0hBVkVfU1RBQ0tQUk9URUNUT1JfVExTCj4+ID4gPiAgICAgICBkZWZfYm9vbCAkKGNj
LW9wdGlvbiwtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD10bHMgLW1zdGFjay1wcm90ZWN0b3ItZ3Vh
cmQtcmVnPXRwIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLW9mZnNldD0wKQo+PiA+ID4KPj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtaS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9kbWkuaAo+PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uY2E3Y2NlNTU3ZWY3Cj4+ID4gPiAtLS0gL2Rldi9udWxsCj4+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtaS5oCj4+ID4gPiBAQCAtMCwwICsxLDI0IEBA
Cj4+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gPiA+ICsv
Kgo+PiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbgo+PiA+ID4g
KyAqCj4+ID4gPiArICogYmFzZWQgb24gYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWkuaAo+PiA+
ID4gKyAqCj4+ID4gPiArICogVGhpcyBmaWxlIGlzIHN1YmplY3QgdG8gdGhlIHRlcm1zIGFuZCBj
b25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPj4gPiA+ICsgKiBMaWNlbnNlLiAg
U2VlIHRoZSBmaWxlICJDT1BZSU5HIiBpbiB0aGUgbWFpbiBkaXJlY3Rvcnkgb2YgdGhpcyBhcmNo
aXZlCj4+ID4gPiArICogZm9yIG1vcmUgZGV0YWlscy4KPj4gPiA+ICsgKi8KPj4gPiA+ICsKPj4g
PiA+ICsjaWZuZGVmIF9fQVNNX0RNSV9ICj4+ID4gPiArI2RlZmluZSBfX0FTTV9ETUlfSAo+PiA+
ID4gKwo+PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+PiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+Cj4+ID4gPiArCj4+ID4gPiArI2RlZmluZSBkbWlfZWFybHlfcmVtYXAoeCwgbCkg
ICAgICAgICAgICAgICAgbWVtcmVtYXAoeCwgbCwgTUVNUkVNQVBfV0IpCj4+ID4gPiArI2RlZmlu
ZSBkbWlfZWFybHlfdW5tYXAoeCwgbCkgICAgICAgICAgICAgICAgbWVtdW5tYXAoeCkKPj4gPiA+
ICsjZGVmaW5lIGRtaV9yZW1hcCh4LCBsKSAgICAgICAgICAgICAgICAgICAgICBtZW1yZW1hcCh4
LCBsLCBNRU1SRU1BUF9XQikKPj4gPiA+ICsjZGVmaW5lIGRtaV91bm1hcCh4KSAgICAgICAgICAg
ICAgICAgbWVtdW5tYXAoeCkKPj4gPiA+ICsjZGVmaW5lIGRtaV9hbGxvYyhsKSAgICAgICAgICAg
ICAgICAga3phbGxvYyhsLCBHRlBfS0VSTkVMKQo+PiA+ID4gKwo+PiA+ID4gKyNlbmRpZgo+PiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYyBiL2Ry
aXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYwo+PiA+ID4gaW5kZXggMDk1MjVmYjVj
MjQwLi5jM2JmYjllNzdlMDIgMTAwNjQ0Cj4+ID4gPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2Vm
aS9yaXNjdi1ydW50aW1lLmMKPj4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2
LXJ1bnRpbWUuYwo+PiA+ID4gQEAgLTE1MiwzICsxNTIsMTYgQEAgdm9pZCBhcmNoX2VmaV9jYWxs
X3ZpcnRfdGVhcmRvd24odm9pZCkKPj4gPiA+ICAgewo+PiA+ID4gICAgICAgZWZpX3ZpcnRtYXBf
dW5sb2FkKCk7Cj4+ID4gPiAgIH0KPj4gPiA+ICsKPj4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBy
aXNjdl9kbWlfaW5pdCh2b2lkKQo+PiA+ID4gK3sKPj4gPiA+ICsgICAgIC8qCj4+ID4gPiArICAg
ICAgKiBPbiByaXNjdiwgRE1JIGRlcGVuZHMgb24gVUVGSSwgYW5kIGRtaV9zZXR1cCgpIG5lZWRz
IHRvCj4+ID4gPiArICAgICAgKiBiZSBjYWxsZWQgZWFybHkgYmVjYXVzZSBkbWlfaWRfaW5pdCgp
LCB3aGljaCBpcyBhbiBhcmNoX2luaXRjYWxsCj4+ID4gPiArICAgICAgKiBpdHNlbGYsIGRlcGVu
ZHMgb24gZG1pX3NjYW5fbWFjaGluZSgpIGhhdmluZyBiZWVuIGNhbGxlZCBhbHJlYWR5Lgo+PiA+
ID4gKyAgICAgICovCj4+ID4gPiArICAgICBkbWlfc2V0dXAoKTsKPj4gPiA+ICsKPj4gPiA+ICsg
ICAgIHJldHVybiAwOwo+PiA+ID4gK30KPj4gPiA+ICtjb3JlX2luaXRjYWxsKHJpc2N2X2RtaV9p
bml0KTsKPj4gPgo+PiA+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
