Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3380FECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcsfE5vn1w53RyxpvXn0h3VQpGZi5foyMZqFN383r3I=; b=QTcZJAoBxrADRW
	a8NDP3fZSQrejAuSMAznGxe6Gwf4qPduI9oQw+724JLS3b/qrE4d8Q9Qermm+5m+aDRs7ESRrzQFQ
	/OhyTFlpQzfnppoCKnHYuAHmqT2zdP7CBwFvqIBIbDrofW2BOFJcU7texNuoyluYDk+Uf4TADAtmz
	WLr5U4j4JxymdmTVj1c+D9XR4iUriKH/QK8FP4x7SlThvxkLQ7qEQ5N05WN2oPLcLsCf0BtPuFMXL
	w+3YEb26iU7Lmeftnb1DmavApG84JrwizHRy806Qm8LMefAMK6Zvqj5wzYxsHcKl4xYNSnFM1b1DN
	eSPBR4yzMRIc1HiRj1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVd1-00DIbn-BO; Sat, 03 Sep 2022 16:04:15 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVcy-00DIXk-N1
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:04:14 +0000
Received: by mail-lj1-x229.google.com with SMTP id k18so5037982lji.13
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=L8GMbRKuQ9DT2VE5i0gWP/9BXKg4sL+fluq++DQyW+c=;
        b=KF83nBzgcSkc/eohDbcMVm5JXXxt19mkmcMUbY9dxURmUWxt/detrHb0XufHNEJmOM
         UUoQU2qf8VrSKqEsSB3Wt99uHnkTFZl/pVhs5eTpebBommPoERFs1t5CdbOH4tYkUvuy
         LHNHuVWT7z6g4fPwh01Uav64zqJe2dvjg+LOXhn5Sl/4vDu/VB6z38uH8SqjAMV2G8OY
         Zokt9rb1vVizWrrp+DFVf/TWOuvtltB9riIQhlA38b3IrHQwvJGxaZSbVTzT3nQUIySa
         O1ADU9OPBkIS2BaEud24dQGAbcWZ52PFqvlZMqyOQoWM9sT0xWLMHPfEevuXVp2p7Ok+
         ULhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=L8GMbRKuQ9DT2VE5i0gWP/9BXKg4sL+fluq++DQyW+c=;
        b=y/74o5zM98hBjB5RFd9Wft7KgEFps+DFdvVmon2tgj41kKWPqfGmBhqv/PW+n3ml2v
         5IRRh3eNGorvnQKNnpVItkLxvhK0qkjgOv8Sr9ibgkCeWP1VDpdrJlEttMQ06NdpRAHQ
         NkFlSqBwI5DDr7VuuCco2/WtCK+cjX9snrcrUMT1O4xvVoihFgxhXWO/VHYtCcV4/0Ti
         vtV4w1MgmVTHZMVR1+ObWdsuWOuJOqEwmA+eRFMCd3nTcjiCHU7B/5KwWZbqDGiPhqHC
         zVJ3EwKKL5lLerzOXfsqkg4BMwAHZwwgYLL0lIFx9CyIsoKopA1BHqGTbF/vJKb37EZa
         Q2Pg==
X-Gm-Message-State: ACgBeo2kXSjQ326n2L2oZURuctceG5DQ8WMTa69OwlM/vz21CO3nsXBi
	WG3MZVfFZ0BNTh8LhqCxmyYlKxJBCXwHj+39yOaiVg==
X-Google-Smtp-Source: AA6agR6DAkGpMzDwe6apYm3JX3aQOgsbMIf5DPR85Q8YOdtO7X3YSFpsIEJenniS61oEntoGQMrkRuxHKNAoc5GNkSA=
X-Received: by 2002:a05:651c:b2c:b0:261:d82f:75b8 with SMTP id
 b44-20020a05651c0b2c00b00261d82f75b8mr11584677ljr.266.1662221048166; Sat, 03
 Sep 2022 09:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220830044642.566769-1-apatel@ventanamicro.com>
 <20220830044642.566769-4-apatel@ventanamicro.com> <13199249.VsHLxoZxqI@diego>
In-Reply-To: <13199249.VsHLxoZxqI@diego>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Sep 2022 21:33:57 +0530
Message-ID: <CAK9=C2XR+3bezgSAYsr08rZq=B9VLR0Aef3icBQRi9-FNyB8kQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] RISC-V: Implement arch specific PMEM APIs
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_090412_817009_008AF307 
X-CRM114-Status: GOOD (  24.66  )
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

T24gVGh1LCBTZXAgMSwgMjAyMiBhdCA5OjA4IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IEFtIERpZW5zdGFnLCAzMC4gQXVndXN0IDIw
MjIsIDA2OjQ2OjQxIENFU1Qgc2NocmllYiBBbnVwIFBhdGVsOgo+ID4gVGhlIE5WRElNTSBQTUVN
IGRyaXZlciBleHBlY3RzIGFyY2ggc3BlY2lmaWMgQVBJcyBmb3IgY2FjaGUgbWFpbnRlbmFuY2UK
PiA+IGFuZCBpZiBhcmNoIGRvZXMgbm90IHByb3ZpZGUgdGhlc2UgQVBJcyB0aGVuIE5WRElNTSBQ
TUVNIGRyaXZlciB3aWxsCj4gPiBhbHdheXMgdXNlIE1FTVJFTUFQX1dUIHRvIG1hcCBwZXJzaXN0
ZW50IG1lbW9yeSB3aGljaCBpbi10dXJuIG1hcHMgYXMKPiA+IFVDIG1lbW9yeSB0eXBlIGRlZmlu
ZWQgYnkgdGhlIFJJU0MtViBTdnBibXQgc3BlY2lmaWNhdGlvbi4KPiA+Cj4gPiBOb3cgdGhhdCB0
aGUgU3ZwYm10IGFuZCBaaWNib20gc3VwcG9ydCBpcyBhdmFpbGFibGUgaW4gUklTQy1WIGtlcm5l
bCwKPiA+IHdlIGltcGxlbWVudCBQTUVNIEFQSXMgdXNpbmcgQUxUX0NNT19PUCgpIG1hY3JvcyBz
byB0aGF0IHRoZSBOVkRJTU0KPiA+IFBNRU0gZHJpdmVyIGNhbiB1c2UgTUVNUkVNQVBfV0IgdG8g
bWFwIHBlcnNpc3RlbnQgbWVtb3J5Lgo+Cj4gWmljYm9tIGlzIGRldGVjdGVkIGF0IHJ1bnRpbWUs
IHRob3VnaCB0aGF0IGtjb25maWcgc2V0dGluZyBjaGFuZ2VzIHRoZQo+IGJlaGF2aW91ciBmb3Ig
dGhlIG1lbXJlbWFwLXR5cGUgYXQgY29tcGlsZS10aW1lLiBTbyB3aGF0IGhhcHBlbnMgb24KPiBz
eXN0ZW1zIG5vdCB1c2luZyB6aWNib20gKG9yIGFub3RoZXIgY21vLXZhcmlhbnQpID8KCk9uIGEg
c3lzdGVtIHdpdGhvdXQgWmljYm9tIChvciBzb21lIG90aGVyIGNtby12YXJpYW50KSwgdGhlIFBN
RU0gcmVhZAp3aWxsIGFsd2F5cyB3b3JrIGJ1dCBQTUVNIHdyaXRlcyB3aWxsIG5vdCBiZSByZWxp
YWJsZS4KCkN1cnJlbnRseSwgdGhlIGdlbmVyaWMgUE1FTSBkcml2ZXIgaGFzIG5vIHByb3Zpc2lv
biB0byBhbGxvdyBhcmNoIGNvZGUgdG8KZGlzYWJsZSBjYWNoZWFibGUgbWFwcGluZyBhdCBib290
LXRpbWUuCgpNYXliZSB3ZSBjYW4gYWRkIFdBUk5fT05DRSgpIGZvciB0aGUgY2FzZSB3aGVuIGFy
Y2hfeHl6X3BtZW0oKQppcyBjYWxsZWQgb24gYSBzeXN0ZW0gbm90IGhhdmluZyBaaWNib20gPwoK
UmVnYXJkcywKQW51cAoKPgo+Cj4gSGVpa28KPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBNYXl1cmVz
aCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
TWF5dXJlc2ggQ2hpdGFsZSA8bWNoaXRhbGVAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
YXJjaC9yaXNjdi9LY29uZmlnICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L21tL01ha2VmaWxl
IHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvbW0vcG1lbS5jICAgfCAyMSArKysrKysrKysrKysrKysr
KysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9tbS9wbWVtLmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCAwZWJkOGRhMzg4
ZDguLjM3ZDYzNzBkMjljMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMjUsNiArMjUsNyBAQCBjb25maWcgUklT
Q1YKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4gPiAgICAgICBzZWxl
Y3QgQVJDSF9IQVNfS0NPVgo+ID4gICAgICAgc2VsZWN0IEFSQ0hfSEFTX01NSU9XQgo+ID4gKyAg
ICAgc2VsZWN0IEFSQ0hfSEFTX1BNRU1fQVBJCj4gPiAgICAgICBzZWxlY3QgQVJDSF9IQVNfUFRF
X1NQRUNJQUwKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19TRVRfRElSRUNUX01BUCBpZiBNTVUK
PiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19TRVRfTUVNT1JZIGlmIE1NVQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L21tL01ha2VmaWxlCj4gPiBp
bmRleCBkNzZhYWJmNGI5NGQuLjNiMzY4ZTU0N2Y4MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvbW0vTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKPiA+IEBAIC0z
MSwzICszMSw0IEBAIGVuZGlmCj4gPgo+ID4gIG9iai0kKENPTkZJR19ERUJVR19WSVJUVUFMKSAr
PSBwaHlzYWRkci5vCj4gPiAgb2JqLSQoQ09ORklHX1JJU0NWX0RNQV9OT05DT0hFUkVOVCkgKz0g
ZG1hLW5vbmNvaGVyZW50Lm8KPiA+ICtvYmotJChDT05GSUdfQVJDSF9IQVNfUE1FTV9BUEkpICs9
IHBtZW0ubwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vcG1lbS5jIGIvYXJjaC9yaXNj
di9tbS9wbWVtLmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjA4OWRmOTJhZTg3Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9t
bS9wbWVtLmMKPiA+IEBAIC0wLDAgKzEsMjEgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMAo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIFZlbnRhbmEg
TWljcm8gU3lzdGVtcyBJbmMuCj4gPiArICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2V4
cG9ydC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9saWJudmRpbW0uaD4KPiA+ICsKPiA+ICsjaW5j
bHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiA+ICsKPiA+ICt2b2lkIGFyY2hfd2JfY2FjaGVfcG1l
bSh2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICBBTFRfQ01PX09QKGNs
ZWFuLCBhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gK30KPiA+ICtFWFBP
UlRfU1lNQk9MX0dQTChhcmNoX3diX2NhY2hlX3BtZW0pOwo+ID4gKwo+ID4gK3ZvaWQgYXJjaF9p
bnZhbGlkYXRlX3BtZW0odm9pZCAqYWRkciwgc2l6ZV90IHNpemUpCj4gPiArewo+ID4gKyAgICAg
QUxUX0NNT19PUChpbnZhbCwgYWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiA+
ICt9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoYXJjaF9pbnZhbGlkYXRlX3BtZW0pOwo+ID4KPgo+
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
