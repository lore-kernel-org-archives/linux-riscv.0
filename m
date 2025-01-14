Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CC2E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v34km3UDB8mHuOJFRPjt/TCz3nllpcCRMu1wuYyPQxw=; b=ry+ckzDicnTU1b
	UBDLQpDFl2Vz5JbRvDrI1DZmk/3qE//Y1NMJ467J/MIRzMT2A6Fh1bYEVRq70E8UV6LXLUjz4EFNQ
	UrUHpnzhnFDuOhBdWPYzzh0Z3hyus0s5E0iMRlZFaemqN7/C3+4mAnyT1PicqMmls7Nlbqj7T8l5X
	x1lsJN51FjzpcFSUVtKEpPJU2ZCrNwp2ECdjQVbGzX/lL6nZhtaUsZRJC8hOmSI7/ZwmY+++ktrys
	wnvT82kY4IUnn2FjKNbDv0nPCK7cSAVVZM/tp8/TBJgTshVo4ffiv8nNdDnzjGJMM9UH2UKcNeKYn
	XRhZIggd48VRwFRfKrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXclG-00000007tGf-0npY;
	Tue, 14 Jan 2025 08:58:58 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXclD-00000007tG4-26h4
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 08:58:56 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ce7935d38cso4009035ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736845134; x=1737449934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLCUr0+mY4Fp1Fz5aN4PxRwYSQhwd4Sql+mlxZE+/7Y=;
        b=X7h3T14eKO2LhVyHbUgWDFw16m2lZ4EQ7Yj/xqZm4d2fQO1+6E0fHNB5qhPIIh3J+a
         bc8C7oHonsgDmfdOemwkToMoR7vwXvjArsdbImdFO2gHflm4ttrl/2xVzg5d9E75Ky6w
         nw3ajazsod9XO/tj/sDGUZkfvomCJQRLsLq7us1NcJPN70xoCx33Uu4hb5MWxMCnpEei
         LbPOttqw/Cd6XW7xd9xG386/D55hFwHOgaI8vozO1GRTZWaonR2LovvHBZDfCndk1E7k
         HdrCrKjO2BULVd+rAz5KYdK1EL0HSMpsvRGriwBYui3x2OKQMGWJ7fcRsuJr8Hj4nXhB
         M7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845134; x=1737449934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLCUr0+mY4Fp1Fz5aN4PxRwYSQhwd4Sql+mlxZE+/7Y=;
        b=eB3EN8sfCskf92kl2m04aZawgqkdCgZTbqu3mxIEjYkT1jTiWFtRDv4/eFZ6A6n030
         n4rD5KWxxfiTFHRA3G18YDHS/7ggUbr29c+t35HgyvwGuTmOXFY0mhxwhUZ9OLZMwOm+
         dewZFdeiy1f8CgO9jFEEMHy4TTsCHrbCWh69b3PPKXdMAFOvfEJlkFLcfH49398NlYgh
         wTmK6jdbnQbj6UIqpxDwXPDhIE7iuF5N7V13iMfYS+lHJ41ZkdFT/IUr6whlu5+3Nazb
         kg4DWh7SkpJTEF9ECZDR1dEQakfYhqceYC2U/6EUkKOA0SinnaPPaFjvPdIREaUi8/Ro
         EseA==
X-Forwarded-Encrypted: i=1; AJvYcCUKPW58xYWbxCBZfIjG/QjcEN471LR0t5a6L05xWXcf35X7CAAob9dVVct3ShOXfCY05/VVPbAh5aW1Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBdqnOv52OuzOQ3EgFF+6AV/Gc17AsAl5R9koOzBaY93GWYVqB
	BIxsbHYec1lHX6Xa29rFwmPBY6SJqgL/LG774ap5ANmEfJoe4p9YLDUHg7rXwWi+H76+g49e0sH
	z+fngroJz/ngcYA1/J3ncJZeUFIDm4pBmF4kmZQ==
X-Gm-Gg: ASbGncsDvWexac/tE7tjLcW+0VoSoUVo/8DiGgIcM2dvGErsNfPxe/13/USimK+JvGp
	FVDMvw5Vs4YpDZiQ4/5VVhQL/zqIpuCUkroUzbeQ=
X-Google-Smtp-Source: AGHT+IF4JiIFs0ymxv/cCZiO0v0aCxGScX7aVuQDL9qMfuxuAyf4NwMgrnkOLP473WBBuodwLsK9P28eq5mmUdIfmaI=
X-Received: by 2002:a05:6e02:1f09:b0:3a7:8720:9de8 with SMTP id
 e9e14a558f8ab-3ce3a86a27amr185350755ab.5.1736845134268; Tue, 14 Jan 2025
 00:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
 <20250113150933.65121-4-luxu.kernel@bytedance.com> <CAAhSdy1UaFVyGMCtGHZZTuEhxGAja=9viN10SbFXKcNwjwJ8yw@mail.gmail.com>
 <CAPYmKFviTHKTH=Me74qvjFwq6JxwiCYwtrpft-jMb_SkyvRuSQ@mail.gmail.com>
In-Reply-To: <CAPYmKFviTHKTH=Me74qvjFwq6JxwiCYwtrpft-jMb_SkyvRuSQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jan 2025 14:28:43 +0530
X-Gm-Features: AbW1kvZ2xNNXWfciFcNOI-i-oS2a0Sqptsr_s5R0UPwJiHWW4_JeQgmZqSRoOWk
Message-ID: <CAAhSdy3edVEus88NiTvxQDZqstsCxwGjO-H4XThZcFxCcPGqZA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/5] irqchip/riscv-imsic: Use wmb() to
 order normal writes and IPI writes
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_005855_805364_668CA085 
X-CRM114-Status: GOOD (  25.80  )
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTI6MDnigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gSSB3YW50IHRvIGVuc3VyZSB3aGVu
IHRoZSByZWNlaXZlciBDUFUgdHJhcHMgaW50byBpbnRlcnJ1cHQsIGl0IGNhbgo+IHNlZSBhbGwg
bWVtb3J5IHVwZGF0ZXMgbWFkZSBieSB0aGUgc2VuZGVyIGJlZm9yZS4KPgo+IFRoZSBzbXBfbWJf
X2FmdGVyX2F0b21pYygpIHVzZXMgJ2ZlbmNlIHJ3LCBydycgd2hpY2ggb3JkZXJzIG5vcm1hbAo+
IG1lbW9yeSByZWFkcy93cml0ZXMuIFRoZSBJTVNJQyB3cml0ZSBpcyBhY3R1YWxseSBJTyB3cml0
ZXMgYW5kIGlzIG5vdAo+IG9yZGVyZWQgYnkgaXQuCj4KPiBTbyBJIHdvcnJ5IGluIGV4dHJlbWUg
Y2FzZXMsIHRoZSByZWNlaXZlciBDUFUgY2FuIHJlY2VpdmUgdGhlIElQSQo+IGZpcnN0LCBzZWUg
bm8gdXBkYXRlcyB0byBpcGlfbXV4X3BjcHUtPmJpdHMgYW5kIHJldHVybiBpbW1lZGlhdGVseS4K
PiBUaGVuIHRoaXMgSVBJIHdpbGwgbm90IGJlIGhhbmRsZWQgdW50aWwgYW5vdGhlciBJUEkgY29t
ZXMuCgpVc2luZyB3bWIoKSBpcyBzdGlsbCBpbmFwcHJvcHJpYXRlIGJlY2F1c2UgaWYgeW91IHdh
bnQgdG8gc2ltcGx5CmVuc3VyZSBJTyB3cml0ZXMgYXJlIG5vdCBvcmRlcmVkIGJlZm9yZSB0aGUg
bm9ybWFsIG1lbW9yeSB3cml0ZXMKdGhlbiBqdXN0IGNvbnZlcnQgd3JpdGVsX3JlbGF4ZWQoKSB0
byB3cml0ZSgpLgoKUmVnYXJkcywKQW51cAoKPgo+IEJlc3QgUmVnYXJkcywKPgo+IFh1IEx1Cj4K
PiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCAxMjozNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDg6Mzni
gK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IER1cmluZyBhbiBJUEkgcHJvY2VkdXJlLCB3ZSBuZWVkIHRvIGVuc3VyZSBhbGwgcHJldmlvdXMg
d3JpdGUgb3BlcmF0aW9ucwo+ID4gPiBhcmUgdmlzaWJsZSB0byBvdGhlciBDUFVzIGJlZm9yZSBz
ZW5kaW5nIGEgcmVhbCBJUEkuIFdlIHVzZSB3bWIoKSBiYXJyaWVyCj4gPiA+IHRvIGVuc3VyZSB0
aGlzIGFzIElNU0lDIGlzc3VlcyBJUEkgdmlhIG1taW8gd3JpdGVzLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMgfCA2ICsrKysrKwo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gPiA+IGluZGV4IDYzMDk3ZjJiYmFkZi4u
YzYzMTdjYjU1N2ZiIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLWVhcmx5LmMKPiA+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1lYXJseS5jCj4gPiA+IEBAIC0yOSw2ICsyOSwxMiBAQCBzdGF0aWMgdm9pZCBpbXNpY19pcGlf
c2VuZCh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gPiAgewo+ID4gPiAgICAgICAgIHN0cnVjdCBpbXNp
Y19sb2NhbF9jb25maWcgKmxvY2FsID0gcGVyX2NwdV9wdHIoaW1zaWMtPmdsb2JhbC5sb2NhbCwg
Y3B1KTsKPiA+ID4KPiA+ID4gKyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIEVuc3VyZSB0aGF0
IHN0b3JlcyB0byBub3JtYWwgbWVtb3J5IGFyZSB2aXNpYmxlIHRvIHRoZSBvdGhlciBDUFVzCj4g
PiA+ICsgICAgICAgICogYmVmb3JlIGlzc3VpbmcgSVBJLgo+ID4gPiArICAgICAgICAqLwo+ID4g
PiArICAgICAgIHdtYigpOwo+ID4gPiArCj4gPgo+ID4gVGhlIGltc2ljX2lwaV9zZW5kKCkgaXMg
Y2FsbGVkIHRocm91Z2ggaXBpX211eF9zZW5kX21hc2soKQo+ID4gd2hpY2ggZG9lcyBzbXBfbWJf
X2FmdGVyX2F0b21pYygpIGJlZm9yZSBjYWxsaW5nIHNvIG5vIG5lZWQKPiA+IGZvciBhbnkgYmFy
cmllciBoZXJlLiBBbHNvLCBiYXJyaWVycyBuZWVkIHRvIGJlIGluLXBhaXIgc28gYWRkaW5nCj4g
PiBhIHNpbmdsZSBiYXJyaWVyIGF0IHJhbmRvbSBsb2NhdGlvbiBpcyBpbmFwcHJvcHJpYXRlLgo+
ID4gKFJlZmVyLCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9rZXJuZWwvaXJxL2lwaS1tdXguYz9oPXY2LjEzLXJj
NyNuNzgpCj4gPgo+ID4gQmFzZWQgb24gdGhlIGFib3ZlLCB0aGlzIHBhdGNoIGlzIG5vdCBuZWVk
ZWQuCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
