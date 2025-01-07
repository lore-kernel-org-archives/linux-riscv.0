Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048A6E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKvsICVjShJfoQCKthDvdbMI8S49BW3rd0CUAOqj3z4=; b=HBUSqq5by7j1wL
	IaFROEjWwKrqVVM2/IdXIeGYRAcJwBH4htydy9FfXsrRK3Id52Xn4sq2mMp75jX9rKLMINzVNOBEx
	kHMBUOL+X8HAKpjOKEMxfLn2hQ+fbO02vvm+fiDLWB03IywZXgovgLYfFxtAyjQQL3LCKnsPdXYq0
	+Ebu8JONWae2oRW4x+/KjS+3goa36K3Jwi7Fd7IPL3fn/H2C4aTXXfZQ9Ep/uQm46R1+u+5dGUjPt
	yC+iqsRecrMXKWJRp8EjmjgFROBOMtrMdXLD18GiwglZsQvdYVPmupyEG4o1lY9sbbcDy8NApHcJD
	DNMubI8OKYzPLra7rXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4xN-00000003wDw-37i8;
	Tue, 07 Jan 2025 08:28:57 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4xI-00000003wB1-1Pke
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 08:28:56 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so9034400137.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 00:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736238531; x=1736843331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KppWSIngGaY7dPjUjaUwC/ZQsQtvE8wkP05GAZfgcbM=;
        b=QGIv6zoHmD88Na1w8AWG/3AVhNQ5dl5DGKw7R/QqLnFE6kVfR70ulL1wV5+ehjMEbJ
         lRjhXTDZSeaUB4R2ICEEwaEl1o3vXS+HE5VkG4cDZu5et1VC3j4R2GZhzsorXOz4GTe7
         vSxzpvAdFnU++BeGi1qWuwngekNbwGuddmEJb9GJPN6Dcnwd0hZhE4VAOHEmqUlYUMZf
         FV/8yQAnxxm5TLIebtwOhH3wVwIGG0T/p1e8HtR6UIOU6LhF40AiEx9WFmJ26SWz25nw
         YcZhAXMK54s9fwOGdstGqFFatpxNKFroFamj/7KIxzfcPYYysjD7di+tFeyqpnqR4h9K
         fhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736238531; x=1736843331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KppWSIngGaY7dPjUjaUwC/ZQsQtvE8wkP05GAZfgcbM=;
        b=F9w8nrqA5Kktr0UJ+5V3yJG0Spb/NSpUOJSSUMVNct0rRwWTeZb/a10tRSla6SWIOo
         uMzTRWyEHvVE08kHv61vp3v7BSurcgZnGhfEPQOYccqekX874qQymxDfQhcNG4ocz9Ia
         9mtUBCi/D5qGNCoP1uFVEOM9zVo5kTQQjc5abvNQgwVYuIV7he7+hGFOR6DfDYKV8egT
         vuXRdKfxn1/8b7IXmaVro0P1qyCCmw+zpX4FGg0a1UYu8+jtkJ+jlFIH7pmsmB2M5iHo
         q77MwheDmtlGu/b2VhN5HTXanwpUvCtyNnW5YPvf0tfftqCw5RxgLEkro4End0aVgLXS
         jatQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfDYiqCddlL/fuQjiffUxk4XPBqp4NWm6WX/H3k2zamQwlYsIFr5lqYYcCUtXW8udTmlEmundZGoKbeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjNTu2OUG14xadIddpiQS5A1Ehv0Xz0fTMcW+jO1GxX5XV7ACe
	USdCDkgJD3hMQOIHi1JaBuKhMPtFG5PP1/zr81YQYcx4GxLBB2Wy/tZ1dFBdfutctsZEbrWnd/F
	yK2MQAGVnY4i0MoLwcxbgauOeoAM2RVerH2Oq1HlMQAnqPdrZhfU=
X-Gm-Gg: ASbGncvLwAUuZEKgi3vRJqXOpM1DsVSxgNIk1JevKhQfhyo6m0hs0dhyIEZKRYjUgVr
	CPyHZdXOV/MLOC851QTBnWfqfFhTyv+MK2pggJRpE
X-Google-Smtp-Source: AGHT+IFRlyN63rDxZSRVE78WlCeoEuMuGOCLoomP75LzMdg4FjXQSjVinxY9uwYfnRZePt4VYnzvFEkA9dHEIzOx7qA=
X-Received: by 2002:a05:6102:548f:b0:4b2:ae3e:3ff with SMTP id
 ada2fe7eead31-4b2cc48a5eemr42728948137.27.1736238530976; Tue, 07 Jan 2025
 00:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com> <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
 <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com>
 <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
 <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com>
 <p6rqpx3yrn2ib4ulmby7tbnpbg4bjyt4dt6snrmhuyw6hx6izl@lywssban54et>
 <CAHh=Yk-iFGULUQc-U-PNjx-st7d5KER3J+t54SNERVaNr++qoQ@mail.gmail.com> <c5zjujxi7wsuabdpttojkrwnvkwna56gz3gnapxskg7tdzmo2f@frvbwzguizdt>
In-Reply-To: <c5zjujxi7wsuabdpttojkrwnvkwna56gz3gnapxskg7tdzmo2f@frvbwzguizdt>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 7 Jan 2025 16:28:40 +0800
X-Gm-Features: AbW1kvaf4bo-YxvlaMSY-WcDD0SjBcDDTRKQ82-uo3kHXd1gXlTC1T4DmcDAT0s
Message-ID: <CAHh=Yk8U+NK=Sk2UkwjL284-RJR3BLDUe+WCPXm_nH5J6soqPA@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nylon Chen <nylon7717@gmail.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_002852_390015_CB9197F5 
X-CRM114-Status: GOOD (  10.67  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI1
5bm0MeaciDfml6Ug6YCx5LqMIOS4i+WNiDEyOjUy5a+r6YGT77yaCj4KPiBIZWxsbyBOeWxvbiwK
Pgo+IE9uIE1vbiwgSmFuIDA2LCAyMDI1IGF0IDA1OjAwOjMyUE0gKzA4MDAsIE55bG9uIENoZW4g
d3JvdGU6Cj4gPiBIaSBVd2UsIEkgaGF2ZSBtYWRlIHRoZSBmb2xsb3dpbmcgYWRqdXN0bWVudHMg
YmFzZWQgb24geW91cgo+ID4gcmVxdWlyZW1lbnRzLiBEb2VzIHRoaXMgYWxpZ24gd2l0aCB3aGF0
IHlvdSBoYWQgaW4gbWluZD8KPiA+IC0gcGVyaW9kCj4gPiBzZXEgNTAwMCAxIDE1MDAwIHwgd2hp
bGUgcmVhZCBwOyBkbyBlY2hvICRwID4KPiA+IC9zeXMvY2xhc3MvcHdtL3B3bWNoaXAwL3B3bTAv
cGVyaW9kIGVjaG8gIlRlc3RpbmcgcGVyaW9kOiAkcCIgZG9uZQo+ID4KPiA+IC0gZHV0eSBjeWNs
ZQo+ID4gZm9yIGR1dHkgaW4gJChzZXEgMCAxIDEwMDAwKTsgZG8gZWNobyAkZHV0eSA+Cj4gPiAv
c3lzL2NsYXNzL3B3bS9wd21jaGlwMC9wd20wL2R1dHlfY3ljbGUgZWNobyAiVGVzdGluZyBkdXR5
IGN5Y2xlOgo+ID4gJGR1dHkiIGRvbmUKPgo+IFRoYXQgKyBkb2luZyB0aGUgc2FtZSB0ZXN0IGJh
Y2t3YXJkcyAoaS5lLiB1c2luZyBzZXEgMTUwMDAgLTEgNTAwMCBmb3IKPiB0aGUgcGVyaW9kIHRl
c3QgYW5kIHNlcSAxMDAwMCAtMSAwIGZvciBkdXR5X2N5Y2xlKSBzaG91bGQgY2F0Y2ggbW9zdAo+
IHJvdW5kaW5nIGJ1Z3MuCj4KSGkgVXdlLCBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBub3cg
KHRlc3RpbmcgbXVzdCBjb25zaWRlciBib3RoCmJhY2t3YXJkcyBhbmQgZm9yd2FyZHMpLgoKVGhh
bmsgeW91IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gZXhwbGFpbiBpdCB0byBtZS4KPiBCZXN0IHJl
Z2FyZHMKPiBVd2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
