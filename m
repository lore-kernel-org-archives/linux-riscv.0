Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64481CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYdYOBEnUzHyjsjcTz/sC/bq/4o3sVLMuUHW0JNTodw=; b=RczrUTPNiajh0p
	dYGjgmYrOFXIggVLj2X2xDs62i1EIixnmM6sV4LwebN9RMT5brYuabFsn8hwhY3Fso0n5tsoXHffi
	JiKgF/zYvYwXIwhH1k4id/1EYQjjmA9i912mYIixN+PSqtkbt4ApSzOG6w9RwU0YDzY/1HVG6eyX/
	Hq+1HtIy0WSadnF6e/6vkHKqpSiGBlmAP6tmZ2RCYZzf1xyBzmKRJ1j6pwNE7dG7Y/ixQ1s+bEBkH
	TwHi1qijijGdYFeobvBcooXwYAvX72uOmoyRFuJlgp6qRRgouW7b5BRIdO76pS5X0Iz4YxrFq6BzY
	Ahmh5cOkuCIeqSZLbH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3hd-0000000H17X-1G2S;
	Wed, 03 Apr 2024 16:43:09 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3hX-0000000H14t-2XQG
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 16:43:06 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-368954f98deso29211755ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1712162581; x=1712767381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ldYJZM3ZNQODceb54+safcmgQ5V5QG7ihgBUD2TQZ0=;
        b=o6+fx1OQ87Rd61VG1GJiAUvAXyyZvwh9Wrg1FFGsy5jIQFouSyMCHYHj5X8frlwBUB
         bQu3kNHJ3CW30H+vhua3xLj8tZPbsdsHwPEl115FuAuTPrImSFQqAbJ4GaxCAFxSYSW+
         rDN4pLbEPmhMQZWN+b7pZfuWpo0hxznPGqWbr0jRkSPqO46GE2EFQTbxFPHZ0GPBQHkh
         D2NZz/YiMcWCEso7LiWMXspo/Td9fthUhyp2+c6KmQ/+Rbo+kSq67bGM1Z+GEfUnjEjq
         Y1wC2H5oG1dsvgTdo+h43Od+jaRmxP7wKHEltllE0cW18TKdhxOiolM5J0bU8pFgF0Pg
         6+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162581; x=1712767381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ldYJZM3ZNQODceb54+safcmgQ5V5QG7ihgBUD2TQZ0=;
        b=X44kMaQIcJ7E8+1K7KCxGOdA37R7FC0lZ501T+pKVHHgZjpyTWIsgf7CwZCQ9U1yAV
         VrPesmXJOi/6S09s4kUKAgj1wHxEKE1YCbN5VayfyjCJHQFQTGpnzRY7jWT+y3Tyk+eG
         dtCMs20VbBsVPBA7io7JR/7tr0SqrDucVUB0mNrL0NbICRnmL+hxpADbBhSWncneQEBy
         bWAi5Pn0XRVfayybKaTLLZpSyL0KImCsNO0ew9NFpNWXiXY7tmvR6DOlrS8DzgjcgWAd
         B40cl7MoOSo8GE4v6rww9DLDqj/wn4eI0yWOGJX5lVTDDS6ccdykXOIJOlOXy0XU5f3C
         1fYw==
X-Forwarded-Encrypted: i=1; AJvYcCVB1b9+dFyqbqMtxeMja+4TNF/j4FBT04UDhKmtoyda+7BHoGfcaabO24gcLgodF3cplN84j2WvzhMkffcnBuR9NXSEYcJQ7lGHJXCH6p7s
X-Gm-Message-State: AOJu0YzQjlN9WpdlgNG4TopweT7mRkg8ewGvjdJedqaRVQGOSp6KP5JZ
	o4jnn58TbbQX35er+2i6r/jFd18VWOQ8uMhfzJMXsycyJpG2tSvmGxdbbomH7ge+hWLJ829Ctru
	6ZmkqSV/zaTcwUzE9Pe0yO9x2BLmtEoJH/1mD2A==
X-Google-Smtp-Source: AGHT+IETZsCmYZR+7MNOTFHFuZFLWE66bnvv0TlpnZS/RG9obXEpluMFpdguyK8UQZTF5zYgpmG2F2lenvvxyMTZHlc=
X-Received: by 2002:a05:6e02:1caf:b0:369:95dc:e4ed with SMTP id
 x15-20020a056e021caf00b0036995dce4edmr136568ill.15.1712162581079; Wed, 03 Apr
 2024 09:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CA+V-a8tGucbJ87hsMQDEgcor5BzDmB_WnRsEn6c9F_HzucWLXQ@mail.gmail.com>
 <CAK9=C2VgiRcQjBEPmZjdcMf221omKS8ntdcenSE7G__4xYcCUA@mail.gmail.com> <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
In-Reply-To: <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Apr 2024 22:12:49 +0530
Message-ID: <CAAhSdy15r+mx8+HYV5Xe9BYTy0BYk50Nds=qgfBwosEDb63aNw@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_094303_970083_290CCFAE 
X-CRM114-Status: GOOD (  22.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMywgMjAyNCBhdCA5OjE54oCvUE0gTGFkLCBQcmFiaGFrYXIKPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDMsIDIwMjQgYXQgMzox
N+KAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDI6MDHigK9QTSBMYWQsIFByYWJoYWthcgo+ID4gPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQW51cCwKPiA+
ID4KPiA+ID4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgOTo0MeKAr0FNIEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoZSBQTElDIGRy
aXZlciBkb2VzIG5vdCByZXF1aXJlIHZlcnkgZWFybHkgaW5pdGlhbGl6YXRpb24gc28gY29udmVy
dAo+ID4gPiA+IGl0IGludG8gYSBwbGF0Zm9ybSBkcml2ZXIuCj4gPiA+ID4KPiA+ID4gPiBBZnRl
ciBjb252ZXJzaW9uLCB0aGUgUExJQyBkcml2ZXIgaXMgcHJvYmVkIGFmdGVyIENQVXMgYXJlIGJy
b3VnaHQtdXAKPiA+ID4gPiBzbyBzZXR1cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhhbmRs
ZXIgb2YgYWxsIG9ubGluZSBDUFVzIGFyZQo+ID4gPiA+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQ
TElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0Zm9ybXMgd2l0aCBtdWx0aXBsZQo+ID4gPiA+IFBM
SUMgaW5zdGFuY2VzLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8IDEwMSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggc2VlbXMgdG8gaGF2ZSBicm9rZW4gdGhpbmdz
IG9uIFJaL0ZpdmUgU29DLCBhZnRlciByZXZlcnRpbmcKPiA+ID4gdGhpcyBwYXRjaCBJIGdldCB0
byBib290IGl0IGJhY2sgYWdhaW4gb24gdjYuOS1yYzIuIExvb2tzIGxpa2UgdGhlcmUKPiA+ID4g
aXMgc29tZSBwcm9iZSBvcmRlciBpc3N1ZSBhZnRlciBzd2l0Y2hpbmcgdG8gcGxhdGZvcm0gZHJp
dmVyPwo+ID4KPiA+IFllcywgdGhpcyBpcyBtb3N0IGxpa2VseSByZWxhdGVkIHRvIHByb2JlIG9y
ZGVyaW5nIGJhc2VkIG9uIHlvdXIgRFQuCj4gPgo+ID4gQ2FuIHlvdSBzaGFyZSB0aGUgZmFpbGlu
ZyBib290IGxvZyBhbmQgRFQgPwo+Cj4gbm9uIHdvcmtpbmcgY2FzZSwgaHR0cHM6Ly9wYXN0ZS5k
ZWJpYW4ubmV0LzEzMTI5NDcvCgo+IGFmdGVyIHJldmVydGluZywgaHR0cHM6Ly9wYXN0ZS5kZWJp
YW4ubmV0LzEzMTI5NDgvCj4gKGF0dGFjaGVkIGlzIHRoZSBEVEIpCgpDYW4geW91IGFkZCAiY29u
c29sZT10dHlTQzAsMTE1MjAwIiB0byBrZXJuZWwgcGFyYW1ldGVycyBhbmQKc2hhcmUgdXBkYXRl
ZCBib290IGxvZ3MgPwoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
