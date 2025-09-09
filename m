Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93327CAC58C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZvgdodrUtNAgjy0R7DmRK9UxWY3fyhHkAUjzYO5wIWI=; b=YpoUWPNfM5ViTbv/Jza3xdQb4R
	eeCHTdAg5oXGSo1zyZJXdMxLxxtAPizq2+DzBEDtECdZaXIakjrsk4LNUC+rZWmAJmUjmDk0u0rTF
	NT2iYD1theHWMkv2s+fZogiUjTv53HhSN6X+5g+9G9cGJYL4sJ1cJtoK2O3sgP6TC5nEekUrHsooZ
	G8Y16F1TnDYee3x2P7sUCC5s5hsawZP/BOAMtjrIThkAG1VZ/wf3hDZbdwJmuhj82WB5WY6c1JHdT
	BQU/41rtTRh0O44vJEHFe5V93SLwksDhDI+ud6zCmfJo3IO2XOfMLw/i42CX6FQAO7OKaoNNZLvI6
	sMcfGvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nh-00000008Ntb-1flt;
	Tue, 09 Sep 2025 16:02:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyKh-00000007M0Y-0TOl
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 13:24:28 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-33730e1cda7so51521341fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757424265; x=1758029065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=GQrb03GkAt4JwD5Dp7AbgHKpFXOW2pja9QCWMP6vuIrm7NWHQU8Rwpfe/F49fZ+d0b
         GjHlfoTTtbUv+5PkTkGl6M6/vskL6a0vbdQA2KYgaXphpUN669+xQ/HEXGyq366FF7h6
         9ZgxeV6/7G94pXdi+XEPC941F7XMPd1IprXz642+QIDN8XEEjdEQ0dz5StPQwBDotxuS
         MAK5g9dT+RfJckrHlUtvB+qFXHawIJ7qXSfhUe0Oxj4GrNUQTxj4W9/U9MTvN/i5Y3Cc
         F+qxJ5MyMOt3f2klrrWHXlHOIcFOYpMJXImwg4Fk9nyqtJOfnxrgtheaLCD8giC5QzZj
         ttgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424265; x=1758029065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=wY7VdtUZUYdbZ5r/8Jc/upfLejG752pPCRCnk/zQcQc2caBFZn7JGXSjJ0jy35c/+e
         669iTkdKzaPbgxttTNFyoo5k08U22HjSfhPLCzte75bQW8dnc9m1nbhk6pEuGU8D9sFi
         HdN/vpLjwADDlNIGN2TMs5NjKZ0iDoRTz+aft+Eu1J79oHbauGQF2T9xg/Y6TMloApm0
         y+IR/tcmrmKYkI8bIN+r6UqmwL6fRuGnKuVIPj0MjlAjtaa7kBxvU1gVgEn8HWsezLBt
         XJDGHyt6nHEJxT+7GvbKDvfI5bLwim3+5FWlHggMESWbOGu1JSeGHjogG6K/r6Cast30
         k31g==
X-Forwarded-Encrypted: i=1; AJvYcCV2PQTOrqWHEiRTVCCzUq9EQdE4+nwzQBz39hyS6Snd8H2//XyjcLuudFF9Sngo+tvx0NQP3PBLu5l0kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9FRk30uMNalbvqWih8WqJHtw0PA3tdkmVBxYqROq0laZHdalM
	7UDXM84gWRYbyB4oqJbX71HpHHsGGcBDjcQqG96QtTZUTE/+gwKubQohc5SSZqwgDrrMN2KRfu/
	eZTx4JAjZxrmOirRrdgNn9uwnNvS5obDBxi7QOzrxig==
X-Gm-Gg: ASbGnctarbLUZH8g4oWRymUuW0IzhogZaC7KFl1YRWNPrCRTKMWhe2xZ01SaydM9OLP
	GOapwOVwaWtmfG47KSYSS3zqoSSSrpIC2gdSmR4UTRuWd1H1XKD+R0Ce+x0IY69MBvILBST116r
	wWtiS2Q+60GsTm1FYK36PaBZ8iefERfE9/uXpHzqFKBP2StHvv4jlXJZm4I99qClAlC0eg5CZab
	ChEiJGdmrLmuU8IuviNSJLfnBNWIHKA4bIlBGE=
X-Google-Smtp-Source: AGHT+IGqxpMTWwovk8l5WQ5dYhWUYy4ZcII/K/jrdWFPYe7kT1CZQHo3Y8LCGp8PKQqEA3qrGlITiYRoPcmLayU54qE=
X-Received: by 2002:a05:651c:b12:b0:336:dd88:69e0 with SMTP id
 38308e7fff4ca-33b57c39f8cmr32465971fa.29.1757424264537; Tue, 09 Sep 2025
 06:24:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
Date: Tue, 9 Sep 2025 08:24:23 -0500
X-Gm-Features: Ac12FXwbBQSlPLH49oae8yjyXj1ugyDMbkjsHTtBWh1WBSZW49QTty0I4jg5ioo
Message-ID: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_062427_157969_6DEF1E6B 
X-CRM114-Status: GOOD (  21.45  )
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

T24gVHVlLCA5IFNlcCAyMDI1IDE1OjEzOjA0ICswMjAwLCBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gc2FpZDoKPiBPbiBUdWUsIFNlcCAwOSwgMjAyNSBhdCAw
MTozNTowNFBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+PiBPbiBUdWUsIFNl
cCA5LCAyMDI1IGF0IDE6MzHigK9QTSBBbmR5IFNoZXZjaGVua28KPj4gPGFuZHJpeS5zaGV2Y2hl
bmtvQGludGVsLmNvbT4gd3JvdGU6Cj4+ID4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMTE6MTU6
NDBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPgo+IC4uLgo+Cj4+ID4gPiAr
ICAgICBjb25maWcgPSAodHlwZW9mKGNvbmZpZykpewo+PiA+Cj4+ID4gVGhpcyBsb29rcyB1bnVz
dWFsLiBXaHkgY2FuJ3QgcHJvcGVybHkgZm9ybWVkIGNvbXBvdW5kIGxpdGVyYWwgYmUgdXNlZCBh
cyBpbgo+PiA+IG1hbnkgb3RoZXIgcGxhY2VzIGluIHRoZSBrZXJuZWw/Cj4+Cj4+IEl0IGlzIGNv
cnJlY3QgQwo+Cj4gSWYgaXQgY29tcGlsZXMsIGl0IGRvZXNuJ3QgbWVhbiBpdCdzIGNvcnJlY3Qg
QywgaXQgbWlnaHQgYmUgbm9uLXN0YW5kYXJkLgo+IEhhdmUgeW91IGNoZWNrZWQgd2l0aCB0aGUg
c3RhbmRhcmQgKG5vdGUsIEkgcmVhZCB0aGF0IHBhcnQgaW4gdGhlIHBhc3QsCj4gYnV0IEkgbWF5
IGZvcmdvdCB0aGUgZGV0YWlscywgc28gSSBkb24ndCBrbm93IHRoZSBhbnN3ZXIgdG8gdGhpcyk/
Cj4KCkl0J3MgYSBHTlUgZXh0ZW5zaW9uIGFscmlnaHQgYnV0IGl0J3Mgc3VwcG9ydGVkIGluIHRo
ZSBrZXJuZWwgYXMgaXQgZXZhbHVhdGVzCnRvIGEgc2ltcGxlIGNhc3QuCgo+PiBhbmQgY2hlY2tw
YXRjaCBkb2Vzbid0IHJhaXNlIGFueSB3YXJuaW5ncy4KPgo+IGNoZWNrcGF0Y2ggaXMgZmFyIGZy
b20gYmVpbmcgdXNlZnVsIGluIHRoZSBxdWVzdGlvbnMgbGlrZSB0aGlzLgo+IEl0IGZhbHNlIHBv
c2l0aXZlbHkgY29tcGxhaW5zIGZvciBmb3JfZWFjaCooKSBtYWNyb3MgYWxsIG92ZXIKPiB0aGUg
a2VybmVsLCBmb3IgZXhhbXBsZS4KPgo+PiBJdCdzIHRoZQo+PiBzYW1lIGtpbmQgb2YgYXJndW1l
bnQgYXMgYmV0d2VlbiBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgZm9vKSkgdnMKPj4ga21hbGxvYyhz
aXplb2YoZikpLgo+Cj4gTWF5YmUsIGJ1dCBpdCBpbnRyb2R1Y2VzIGEgbmV3IHN0eWxlIHdoaWxl
IGFsbCBvdGhlciBjYXNlcyB1c2UgdGhlIG90aGVyLAo+IF9lc3RhYmxpc2hlZF8gc3R5bGUuIFNv
IHdlIGhhdmUgYSBwcmVjZWRlbnQgYW5kIHRoZSBmb3JtIHRoZSBjb2RlIGlzIHdyaXR0ZW4KPiBp
biBpcyBhZ2FpbnN0IHRoZSBkZSBmYWN0byB1c2FnZSBvZiB0aGUgY29tcG91bmQgbGl0ZXJhbHMu
Cj4KCkl0IG1heSBub3QgYmUgKnZlcnkqIGNvbW1vbiBidXQgaXQncyBoYXJkbHkgbmV3IHN0eWxl
OgoKJCBnaXQgZ3JlcCAtUCAiXCh0eXBlb2ZcKC4qXClcKSA/XHsiIHwgd2MKICAgIDEwOCAgICAg
NTI5ICAgIDczMTUKCkJhcnQKCj4+IEkgZ3Vlc3MgaXQncyBwZXJzb25hbCB0YXN0ZSBidXQgSSBs
aWtlIHRoaXMgdmVyc2lvbiBiZXR0ZXIuCj4KPiBJbiBrZXJuZWwgd2UgYWxzbyB0cnkgdG8gYmUg
Y29uc2lzdGVudC4gVGhpcyBhZGQgaW5jb25zaXN0ZW5jeS4gQW0gSSB3cm9uZz8KPgo+PiA+ID4g
KyAgICAgICAgICAgICAuZGV2ID0gJnBkZXYtPmRldiwKPj4gPiA+ICsgICAgICAgICAgICAgLnN6
ID0gNCwKPj4gPiA+ICsgICAgICAgICAgICAgLmRhdCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BJ
TlIsCj4+ID4gPiArICAgICAgICAgICAgIC5zZXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT1VU
UiwKPj4gPiA+ICsgICAgICAgICAgICAgLmRpcm91dCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BP
RVIsCj4+ID4gPiArICAgICB9Owo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNo
ZXZjaGVua28KPgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
