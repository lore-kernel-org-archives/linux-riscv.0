Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06B0C87FD3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUA7boBkGo2QoA9wefgnYMhJ5lffTkJtJoVGMmB4SRA=; b=F8foPZY9X1mNML
	EvBbHUET3zYfB8Zuaksdv/r2TrWZIJHLCKtL4krUk4xuFR5ddMDMmpLBBC6+1dlLmCChT3eTyiEyZ
	bIIaeHohCJMW26IIu9hJ+1NzrckpHgb/ApF93pRfjf/lGfvKpTo9v0NQIYERIHGpaB1agRWShG9G4
	r7IufVQH4kS6wpHEVSPtrul3PNspNofAU3noRkQopZzuDtCAM1iVb/5V9OYFm8jRvk7vGH6Ba8T8z
	hiWi9GX6eWzwp/p16UppQX0KT9zOOHORPC/BBDXEVawh8BRs95HlkWMqD5z14ztOb8DpYZn04ReaQ
	H3xZ0hY888wFiC39S/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinDf-00000009dGh-13WF;
	Mon, 04 Aug 2025 04:54:43 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinDc-00000009dFx-3l3P
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 04:54:42 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so19030965ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 Aug 2025 21:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754283280; x=1754888080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve4t7PRwwZ+6CdX8OjiqWX7q4e7rTv0zRJjQYn4MAVE=;
        b=koxHKGynL8OhptdSZS4rqlsfz5ZuN6iD2e/5Wj5iNuNuIU9sDijd+wBaZg6z4QN8sU
         BQOVBVbcMt+z5b7OOfhSWRJM9lkZVxDaKBA1hNS54LxAHmq4p5H1u7kDRRBEdUc0aVaF
         MQamz7/S3Su7YUa2SU5mTPJK9LAU7csbgEbMjOpkjzx9f5IQe8fCuLs/IFnZcLT7hrTJ
         TXGz5zWW3iayvl4EeKjIUUVEQOGgMkykwv1SUqn3/jpT4tL15YWtnaZUdF3PtJwjmRC2
         7CJ1uUsWeAgwvRXnybIJ1CitVynjdj4+xZCtY+RRjIxDH91jodIr8/9V5bq2rPHQt629
         qxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754283280; x=1754888080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve4t7PRwwZ+6CdX8OjiqWX7q4e7rTv0zRJjQYn4MAVE=;
        b=w50xapfx0sHi+/Sw74VG/6CW4g0/hjyo8DL6AzVjWrpmh0W8bkEi1EMSXHErhhzRyO
         /PCoUvFQftG1UW/MfQIv/25kSrV4VYDHSGD/emSTofHbFux9bH8o2USjh41KicRJF+lX
         NlIhBqYzWM/SaPH8Zziyjr9AtoUiFei0i51rmwlDy8giivJrbZKXqYvHSdcnftxlTdP4
         NGiRutwWQ09AxkKiePN+Qgcmg+05zbJ1ESK6DbOE/JS+/kCFdUzOGQuPtZaL0trMwCfc
         ITlkrk+khDaQrj8fSIiQz+N2yUt1d3/4mWSfsCocWmWlqYz+CBDRgslchtnExjO34Kew
         r9lw==
X-Forwarded-Encrypted: i=1; AJvYcCXiKlavqT1sEWiUaVIlAOmT7XSbOvHrhL0jQY4dzmJuPtDrYZGAVAa1l1lbKxbF6At04EfLhnH0wRBakA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGz3Hr9293TMsWEeBSJxaNTTYsfwZRixyS9BTEMf3KUFUtfJtA
	Mv5vHWxhJssuEY4IaXRwrq4uSDPwH1p5TyBHYItX6F5ZZ2i5y8MIdBtcfm8HQn+z7up7lmG1Rh5
	P1EO5MFvffyKWEtEinhyCgI3oT/C4fgBx1FeqvEUfKA==
X-Gm-Gg: ASbGncvA6w0/33XEqT7eynGM9Bs/UAvwb6URe04djB1cq0yIaKelG4hYLz6BoY0yXlq
	pSZQwqiY/feBzphsx89YcH3uGhgA0yc2iHU49Hn2iGSUQRLru9fZA6Yg2VxL03tETMCcUtQtMvt
	XEP8pvGjOCfgT6sohNM2d8IUPKoPODX+eSLhxDflQla0fuMZLRkpu1YWQUHmToiumsE0TDOu19R
	QHaTA1lZx+J3dVfRw==
X-Google-Smtp-Source: AGHT+IGOf/eAmkl4Q0GWF4AohALUlaptRfDp1Iij/yEDJsJjyKHpMVaSn+/FjgEyVm9U379DEkNm6wknUSqAYZiC9bE=
X-Received: by 2002:a05:6e02:1b0b:b0:3e4:117d:68b3 with SMTP id
 e9e14a558f8ab-3e4160fb7a9mr156363575ab.2.1754283279671; Sun, 03 Aug 2025
 21:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250804025110.11088-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250804025110.11088-1-cuiyunhui@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Aug 2025 10:24:27 +0530
X-Gm-Features: Ac12FXyo1twqSxNMLHLAzUl4BV1Wjd1pROzrJyHs7h6O6ZZZs4qmilg-EddkdoU
Message-ID: <CAAhSdy1QDZc9LAnoZacFeQt-vCbrBCxxM4cY=EvLJXFAWifv5w@mail.gmail.com>
Subject: Re: [PATCH] perf: riscv: skip empty batches in counter start
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: atish.patra@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_215441_175724_A7A68F06 
X-CRM114-Status: GOOD (  15.14  )
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

T24gTW9uLCBBdWcgNCwgMjAyNSBhdCA4OjIx4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQXZvaWQgdW5uZWNlc3NhcnkgU0JJIGNhbGxzIHdoZW4g
c3RhcnRpbmcgbm9uLW92ZXJmbG93ZWQgY291bnRlcnMKPiBpbiBwbXVfc2JpX3N0YXJ0X292Zl9j
dHJzX3NiaSgpIGJ5IGNoZWNraW5nIGN0cl9zdGFydF9tYXNrLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
IGluZGV4IDY5OGRlOGRkZjg5NWIuLjM5NzdmNzQ4OGU0ZWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMKPiBAQCAtODc3LDggKzg3NywxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcG11X3NiaV9zdGFy
dF9vdmZfY3Ryc19zYmkoc3RydWN0IGNwdV9od19ldmVudHMgKmNwdV9od19ldnQsCj4gICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgQklUU19UT19MT05HUyhSSVNDVl9NQVhfQ09VTlRFUlMpOyBpKysp
IHsKPiAgICAgICAgICAgICAgICAgY3RyX3N0YXJ0X21hc2sgPSBjcHVfaHdfZXZ0LT51c2VkX2h3
X2N0cnNbaV0gJiB+Y3RyX292Zl9tYXNrOwo+ICAgICAgICAgICAgICAgICAvKiBTdGFydCBhbGwg
dGhlIGNvdW50ZXJzIHRoYXQgZGlkIG5vdCBvdmVyZmxvdyBpbiBhIHNpbmdsZSBzaG90ICovCj4g
LSAgICAgICAgICAgICAgIHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRF
Ul9TVEFSVCwgaSAqIEJJVFNfUEVSX0xPTkcsIGN0cl9zdGFydF9tYXNrLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIDAsIDAsIDAsIDApOwo+ICsgICAgICAgICAgICAgICBpZiAoY3RyX3N0YXJ0
X21hc2spIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfZWNhbGwoU0JJX0VYVF9QTVUs
IFNCSV9FWFRfUE1VX0NPVU5URVJfU1RBUlQsIGkgKiBCSVRTX1BFUl9MT05HLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjdHJfc3RhcnRfbWFzaywgMCwgMCwgMCwgMCk7Cj4g
KyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogUmVpbml0aWFsaXpl
IGFuZCBzdGFydCBhbGwgdGhlIGNvdW50ZXIgdGhhdCBvdmVyZmxvd2VkICovCj4gLS0KPiAyLjM5
LjUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
