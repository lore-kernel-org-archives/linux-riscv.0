Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A73ACAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFTurW9CD2A0NUP3SbxYHYX7Q3n+PE4LjTw/0AYqbCk=; b=u8NFYZjhFvoZc9
	KyKPCtKLWTTI5HQ2AKvbwWTg2XD53lnA2WOs2k4UQHnU21FCCMw0yzNbGOvxYPvqEDroKeW2JPqIO
	Sth3TV9Ti4Li4zvx+pI+OqB4KTpyEx4tSP5yvgfLZoY+/BKLRONzFlMlhVmuB1Kp4WSIneENEwwI5
	S3/slOkVEmtySB0UdTRxLgXsviMPwZWVXHU1ZMD6HhLQntpPSsm7chj97AFaE2YO4sYUquMx8nLbO
	mRmNb2lTDqEcrOpa+k8WCNW1ZsCecd1s85fAZZfZ0dpaK5gV2iacPy0a+tuH0zyNuwdsIEYAuvpuJ
	OWgvbq55myJ0GNQyo9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw236-00000008zSB-29ZM;
	Tue, 09 Sep 2025 17:22:32 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw04l-0000000801Y-1VMH
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 15:16:09 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0472bd218bso883303866b.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430965; x=1758035765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=dTXkonhGBey2WoNS6BmzvpABED+KulAoytTDZ0R959mQiS+sBkb2n7PbcGSn+vnrkf
         Ybjs9WuN1DYrcn7wfReoB+r+UMm0A3LA+bQddydTrcgipWfRKzrI7e5rcG8gP5RSQTq5
         ZX9afgXumBVeZbxZjZ6MoQmfCqwBUJYUCNoGnsZhDdqUa0ve58AyH8Myjm/wS/HJcKUl
         WE2sUXs4e2kmLfvasBgTu4urFgb83oX9snbqwa7uKCYPfqRFWKurOwj6vhZyEYEi8M9V
         Vr0+EuqYWjYX8zo9RSBmFwUkxL3N8hoyjaiXe/Pc2/1JB37lKLoH7UYStxDVFQV9ImG5
         TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430965; x=1758035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=wyOX9iuILSj5PARzcz+o2vqCfC+m60Xik9lf6qmd+IwGgae+U1IR7iYnaIoL7bx2Fx
         0ol+IsMYyMJkHF3OQ//Q7gtlppQFVLHszCdnHiLywA1AS9sT6NNDHM6ou34yJoR8vgeA
         Bn2EEgW9jkNsN346HjXpm7Rsmc32IGFr3nti+1qCLNY6ZFj/OSuVYdYeVg5g4jG1ZO9l
         syXf/IHRmKQ8+flwvrTPnuK9jJ29+u8vaw5woPGw8EQ7AJgoD480EbCdP7vuUiVVikCP
         9nA3jYe4pYHtyQgr1cvWvv///rr59C5C22AWucX/nub43jy7PZMhmaGMEB7Ec9xgEHqP
         CJcg==
X-Forwarded-Encrypted: i=1; AJvYcCXiscQyEqLtx68FUr6yIciUG61B+2WQnuWyX9CsZXMHh0geX8IzhPsuS0KFV7jm3hlnDQRUIlSD0beQiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJlcyLMYjgvyCnPh4xMxnZrJJWg3Tda9JCTOUWznygKncidfz+
	pj6q6zbLrSc0NjZjRMsa1pfLtwzJ8MDZwgPsOsnBuyRvOBewWQ4+Khp4op5uZ8Vok+f5LlXAnXS
	Ec+czVNfRtrWEviQ9FzEtBqjtpGkTJRE=
X-Gm-Gg: ASbGncubWXm9MSpTEne72Sy/1Yrfp7RiyPylqcJRrs/+6U95Zhy6WghVyvlnGwRAZH8
	Zd9QuXPbmYqUbhcBZPt254PbqAdEUwl0CG4Dm3fA7oQmAZt+LlY3EkD6NeASTg1atdvfFtmIAno
	mOxcN/lqAqnnMG5gwseiq0jy/jcJomAL8zJDUef7T9/JHNwizXB62Ve1QodG0w6YCk5YTrtf9Hq
	rIsHL/TNw==
X-Google-Smtp-Source: AGHT+IGeaHcV2kH627FcZIyd8vYLnu/2Up2e6b2i9sBG/bmosVjOp6dqHGnQ87UTIB1WpGArwM97TNlubL6NJn+jj/k=
X-Received: by 2002:a17:907:7e8c:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b04b1003707mr1194942566b.0.1757430964857; Tue, 09 Sep 2025
 08:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:15:28 +0300
X-Gm-Features: Ac12FXySsG8IXlocwCfN3VG6y5KLpIc0a90AoYqlSY-xU72GOTjlNCZIc8n9fs0
Message-ID: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_081607_396379_1946CA60 
X-CRM114-Status: GOOD (  20.82  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCA1OjA14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4gT24gVHVlLCBTZXAgOSwgMjAyNSBhdCA0OjAy4oCvUE0gQW5k
eSBTaGV2Y2hlbmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiBP
biBUdWUsIFNlcCAwOSwgMjAyNSBhdCAwMzo1Njo0MVBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3
c2tpIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDM6NDfigK9QTSBBbmR5IFNo
ZXZjaGVua28KPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6CgouLi4K
Cj4gPiA+ID4gVEJILCBJIHRoaW5rIHRob3NlIDYgYWxsIG1hZGUgdGhlIHNhbWUgbWlzdGFrZSwg
aS5lLiB0aGlua2luZyBvZiB0aGUgY29tcG91bmQKPiA+ID4gPiBsaXRlcmFsIGFzIGEgY2FzdC4g
V2hpY2ggaXMgbm90IQo+ID4gPgo+ID4gPiBXaGF0IGRvIHlvdSBzdWdnZXN0Pwo+ID4KPiA+IFdy
aXRlIGl0IGluIGxlc3Mgb2RkIHdheSA6LSkKPiA+Cj4gPiBmb28gPSAoc3RydWN0IGJhcikgeyAu
Li4gfTsKPgo+IEkgZG9uJ3QgZ2V0IHlvdXIgcmVhc29uaW5nLiB0eXBlb2YoKSBpdHNlbGYgaXMg
d2VsbCBlc3RhYmxpc2hlZCBpbiB0aGUKPiBrZXJuZWwgYW5kIGRvZXNuJ3QKPgo+IGZvbyA9IChz
dHJ1Y3QgYmFyKXsgLi4uIH07Cj4KPiBldmFsdWF0ZSB0byB0aGUgc2FtZSB0aGluZyBhcwo+Cj4g
Zm9vID0gKHR5cGVvZihmb28pKXsgLi4uIH07Cj4KPiA/IElzbid0IGl0IHN0aWxsIHRoZSBzYW1l
IGNvbXBvdW5kIGxpdGVyYWw/CgpJdCBtYWtlcyBpdCBzbywgYnV0IHR5cGVvZigpIHVzdWFsbHkg
aXMgdXNlZCBmb3IgY2FzdHMgYW5kIG5vdCBmb3IKY29tcG91bmQgbGl0ZXJhbHMuIFRoYXQncyAo
dXNhZ2UgdHlwZW9mKCkgZm9yIGNvbXBvdW5kIGxpdGVyYWxzKSB3aGF0CkkgYW0gYWdhaW5zdCBp
biB0aGlzIGNhc2UuCgo+ID4gPiBBbmQgYXJlIHdlIG5vdCBhbGxvd2VkIHRvIHVzZSBDOTkgZmVh
dHVyZXMgbm93IGFueXdheT8KPiA+Cj4gPiBJdCdzIGZpbmUsIGl0J3Mgbm90IGFib3V0IHRoZSBD
IHN0YW5kYXJkIG51bWJlci4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5r
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
