Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63898CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xvgWSXC+U2TO0cZLZTQ/ptMyXDlVICh7XgCRroxoLs=; b=K6+wra9QsMPqxz
	utmPXhfHulSNhDa6NBcrv+QeeCyQAj2gdi/uX27dSMwwWxspaXhx5Qitqb08FAcjort6Z2at9DVcW
	Nnd3NZnhY/qRjhSWFgAzDFqtZ0+LLB4f60IGFb/2i4sPhNldE1i7a+U2Fg49/N4v0wOAw8Vh39SP9
	DlsdusbNQ3GqvJScbjXyDpUQbdTx8KT+1D4wQMJL4fhUQWoz9Nvue/vQzkGplgt7jfF0cIgDWf0x1
	cUFhmZu9UctVlNlpaQ9K/sXDKyr3Hkvw8rP5DjjxXJc6azFsYyFxqTjYONiAarCmPkqGRRba0XGPR
	mj7szj1Wpp7zeCslUlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGzN-00000000Wlk-1zoS;
	Thu, 18 Sep 2025 15:56:05 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGzJ-00000000WkS-15LV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:56:04 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6296f6ce5ddso547852d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758210960; x=1758815760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdfK/q+Pwfof78/WFiIzEJbNGwk57mdR4QjuAR4qnWM=;
        b=U+7TTjgQoHz3zhr3WDYcdwJsMtwrt1rciulCoAHbOXIZlPlENSKue5vmTq1jk+7LG9
         SA7Z4f8+46lpriDptiLWqhtYJ7mH4aO/OPqWLt1mJABU8Mf3cIyxOHHr1d1BddHZ5Si8
         SoJZ7djCx3hhWsmoIUB5uGdbyNvkMNslMXntfX7S7RRsUGwDvecIe8TCs32lAK/TaWzR
         GYeLewgInPVYj8HVXK18EtkTBD6WkxpSaP8dW6wIXkXc3yglizRUCCwFmdM+NMAgQ2UW
         Fe9XwopNhLm7UGtjPCg76HNOiUtFKRb/sCOdg+UzhRHCO7yH7NHHPWLEraxQ2X+BkGK5
         ZRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210960; x=1758815760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdfK/q+Pwfof78/WFiIzEJbNGwk57mdR4QjuAR4qnWM=;
        b=C7wOsJxnW6xiaaccMPX4YyynpdsIE3UruIWpwjVyF/W0Kp3yHV2B6dBKJmvq07jaQ7
         7WfWxEHlB0LdhLVjzfON3VJNyhflnNzURmE4JgCcir6WP8pnX3rp+qQN5U8RgFx/G57Z
         uAgj1HfhirXpZr3q7M5721QLjbI9+ZToqYsJnJRqwd/VxSZprmPkovfJOSjDnfY6G08g
         5JAnGNrjNyPciY6tm7c3ASQ8tva1ldlo6a2GYSt0BqHMY50Tap0UydWRGqZfKmkYSGAH
         sP7QZ+c74mIvYFBnjlfWL3HBTOmh2mu3kw0oDXM8loRpFQZTyDTaYQPWcq1JCEDVfh7j
         Yt1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYkAJ9ZfB85Ze7201jTYY/245sPWpZWneygbCBrY2s0egEkfSblTd6LyqhYiEhMKxpwRtvwlPA7n5UxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4qVF0E/FseidaVp4GtAtNay/nMlgAqgZBIEx8+QBGr9JCLO1
	5alvZoM82UYBnHGjuyCWlyDyq/QOZ7IQAaPNUFcfJUIJc3LM/uChfiA3wh+0zswLhrvef0alr/D
	N1IEvC1SphAB59wCwW7wqAV7k9ltuB6O0bBvlQNNoZQ==
X-Gm-Gg: ASbGncs2m3HOwLQzqSAeEiSune4WlrDb7xeYlUM5OqyScPmRbzogi7C9zGTjaz5tU+L
	KCwftZktxxpPbVsSruGyOeY4hJHoPgP/i0rfucq4scjN/vRCd/ELzABV/qG0XkAH8bx+aRzalDt
	sHC5TGjkJnowzscRNCp2mMFwhR7PuTYCt1l/fOfQ6+MELaOrv3o2DPDHQy3+R/OW4rcvTujmobL
	/OhasKsnsdXwbYKBIqGjcEJllE=
X-Google-Smtp-Source: AGHT+IEECGH2G8e/CDH9F0qac/7FZa5yDye+HQmQVSLPgRHzbQeecfKUO0vMmnt8GIhKDbVRf8GMagQg2WceGWP5ZzQ=
X-Received: by 2002:a05:690e:1559:20b0:628:9b45:5e29 with SMTP id
 956f58d0204a3-6347f544d01mr24918d50.15.1758210958918; Thu, 18 Sep 2025
 08:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250818074906.2907277-1-uwu@icenowy.me> <20250818074906.2907277-3-uwu@icenowy.me>
 <CAPDyKFombYNFvTsChewQ6cFY2woS+vSb1YUV0Bp_+DcigrFFXA@mail.gmail.com> <89ed15328b73b191fe152cf8559b92239b5596bd.camel@icenowy.me>
In-Reply-To: <89ed15328b73b191fe152cf8559b92239b5596bd.camel@icenowy.me>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:55:23 +0200
X-Gm-Features: AS18NWAOrRn2SPBMcr_jo91dsxsIlLlmmb44l-SPKPjXdyTcSw8dHOMtiv-1B0s
Message-ID: <CAPDyKFoQuLKwf69YK7ynj-HeWXsMzguYBtbOy8HE5X_jb1dUpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: thead: create auxiliary device for rebooting
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_085601_324563_9D80F85D 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVGh1LCAxOCBTZXB0IDIwMjUgYXQgMTc6NDQsIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPiB3cm90ZToKPgo+IOWcqCAyMDI1LTA5LTA05pif5pyf5Zub55qEIDEyOjE0ICswMjAw77yM
VWxmIEhhbnNzb27lhpnpgZPvvJoKPiA+IE9uIE1vbiwgMTggQXVnIDIwMjUgYXQgMDk6NDksIElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIHJlYm9v
dCAvIHBvd2VyIG9mZiBvcGVyYXRpb25zIHJlcXVpcmUgY29tbXVuaWNhdGlvbiB3aXRoIHRoZQo+
ID4gPiBBT04KPiA+ID4gZmlybXdhcmUgdG9vLgo+ID4gPgo+ID4gPiBBcyB0aGUgZHJpdmVyIGlz
IGFscmVhZHkgcHJlc2VudCwgY3JlYXRlIGFuIGF1eGlsaWFyeSBkZXZpY2Ugd2l0aAo+ID4gPiBu
YW1lCj4gPiA+ICJyZWJvb3QiIHRvIG1hdGNoIHRoYXQgZHJpdmVyLCBhbmQgcGFzcyB0aGUgQU9O
IGNoYW5uZWwgYnkgdXNpbmcKPiA+ID4gcGxhdGZvcm1fZGF0YS4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+IC0tLQo+ID4gPiAg
ZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jIHwgMzUKPiA+ID4gKysr
KysrKysrKysrKysrKysrKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BtZG9t
YWluL3RoZWFkL3RoMTUyMC1wbS1kb21haW5zLmMKPiA+ID4gYi9kcml2ZXJzL3BtZG9tYWluL3Ro
ZWFkL3RoMTUyMC1wbS1kb21haW5zLmMKPiA+ID4gaW5kZXggOTA0MGI2OThlN2Y3Zi4uODI4NWY1
NTI4OTdiMCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAt
cG0tZG9tYWlucy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcG1kb21haW4vdGhlYWQvdGgxNTIwLXBt
LWRvbWFpbnMuYwo+ID4gPiBAQCAtMTI5LDEyICsxMjksMzkgQEAgc3RhdGljIHZvaWQgdGgxNTIw
X3BkX2luaXRfYWxsX29mZihzdHJ1Y3QKPiA+ID4gZ2VuZXJpY19wbV9kb21haW4gKipkb21haW5z
LAo+ID4gPiAgICAgICAgIH0KPiA+ID4gIH0KPiA+ID4KPiA+ID4gLXN0YXRpYyB2b2lkIHRoMTUy
MF9wZF9wd3JzZXFfdW5yZWdpc3Rlcl9hZGV2KHZvaWQgKmFkZXYpCj4gPiA+ICtzdGF0aWMgdm9p
ZCB0aDE1MjBfcGRfdW5yZWdpc3Rlcl9hZGV2KHZvaWQgKmFkZXYpCj4gPiA+ICB7Cj4gPiA+ICAg
ICAgICAgYXV4aWxpYXJ5X2RldmljZV9kZWxldGUoYWRldik7Cj4gPiA+ICAgICAgICAgYXV4aWxp
YXJ5X2RldmljZV91bmluaXQoYWRldik7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50
IHRoMTUyMF9wZF9yZWJvb3RfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdAo+ID4gPiB0
aDE1MjBfYW9uX2NoYW4gKmFvbl9jaGFuKQo+ID4gPiArewo+ID4gPiArICAgICAgIHN0cnVjdCBh
dXhpbGlhcnlfZGV2aWNlICphZGV2Owo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICBhZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCphZGV2KSwgR0ZQX0tF
Uk5FTCk7Cj4gPiA+ICsgICAgICAgaWYgKCFhZGV2KQo+ID4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBhZGV2LT5uYW1lID0gInJlYm9vdCI7
Cj4gPiA+ICsgICAgICAgYWRldi0+ZGV2LnBhcmVudCA9IGRldjsKPiA+ID4gKyAgICAgICBhZGV2
LT5kZXYucGxhdGZvcm1fZGF0YSA9IGFvbl9jaGFuOwo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0
ID0gYXV4aWxpYXJ5X2RldmljZV9pbml0KGFkZXYpOwo+ID4gPiArICAgICAgIGlmIChyZXQpCj4g
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0
ID0gYXV4aWxpYXJ5X2RldmljZV9hZGQoYWRldik7Cj4gPiA+ICsgICAgICAgaWYgKHJldCkgewo+
ID4gPiArICAgICAgICAgICAgICAgYXV4aWxpYXJ5X2RldmljZV91bmluaXQoYWRldik7Cj4gPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArICAgICAgIH0KPiA+ID4gKwo+ID4g
PiArICAgICAgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LAo+ID4gPiB0aDE1
MjBfcGRfdW5yZWdpc3Rlcl9hZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYWRldik7Cj4gPgo+ID4gV2UgaGF2ZSBkZXZtX2F1eGlsaWFyeV9kZXZpY2Vf
Y3JlYXRlKCkgbm93LCBJIHN1Z2dlc3Qgd2UgdXNlIHRoYXQKPiA+IGluc3RlYWQuCj4KPiBTaG91
bGQgSSBzZW5kIGEgdjIgdG8gY29udmVydCB0byB1c2UgdGhpcz8KClBsZWFzZSBkbywgdGhlbiBJ
IGFtIHJlYWR5IHRvIHBpY2sgdXAgdGhlIHNlcmllcy4KClsuLi5dCgpLaW5kIHJlZ2FyZHMKVWZm
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
