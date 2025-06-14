Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F367C71141
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfeXhMpq9gk05wFtxGwrCS+CCJ7rNGkp+yfXtb2vZ8I=; b=agqbn0cd/JN2EK
	9z7+rW0uoR/axQi1w2LA5ADiz8DH4CS9M2WcVxYZTFgolA5nQ9j33DZOBkAtzIsqLMXwUMpY6fvFu
	1GKhcwF0AR+hQGoYfxK+j9a1Y7ixJhve05RDb65Au7ywRpPB6x8sIRSmYufUgd8bJJrDvD9wuaQWm
	+4kFK6ijetjLQgHm0TL2FfTxJGnvouLEoTP7yH6mTzJyMTye1cjXc42hDuTgaUTQ67Y79xa3EKIfd
	uuKmwFDb5JVvzuP0UDPMiXQpdBVy5li82IS6YwbpAhECycbGKCEP1s2UAgkzPh1MpU5ZCTLsnHQ/P
	VgOgASLnamY84oBTBDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQHdz-00000000bzD-2Pds;
	Sat, 14 Jun 2025 03:33:23 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQHdw-00000000bys-3adX
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 03:33:22 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70e6bddc30aso24520367b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 20:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749872000; x=1750476800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=sKj7gD9KQHUy6htTlCv8roAvRiUdcdesyR6PcSCdL6aGKBMecUfPa7U2sIMXVACNzV
         7rMZVK4zQtuT5hAqiXBhwOyjtaVMUKTgUOYXbBvNLUek7x0C1KQoRJuhTROmhTk3i7O7
         4IMDG8D9jBJCaxiKaKW0n2rXhKRsSrtRSVCT97gWruHWhS5elYIWCTX8kXCTz8uK7VrX
         3XEgwvqcYHKB1scV9HZTtBc6znxm8WhbQk3mhpReD27cj4IMSvFST9soFzBpgwQTmCti
         DiAZXtcUVEsSfh63Pm5YXVzMY/r75Zn3AlgqrNzFRro5rMdA1XbEbmKbbMB5pkf5VCb0
         5foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749872000; x=1750476800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=rC+23kj56fffzJ+qcAXIcjxZnOk0JdCRzhT3GKONtrhlHPDpTbYJ2jQqaCw2eYu+hz
         ++V5nP0VlrSnv8ZhIJuJIO68yju2Gjny4uw2qIwJ3ZNt2QPiBjIZ0tTVdOlpUZBeNHgf
         yBgHK/PxGGi8mOVgAaD/XX9HDs+aiuTkxJJL0UGHuB24rY904MYSY/CWk/IwAWx8SnWS
         VcZl4Lc9AE1FXyyKpa02RWt/RRA8ZMgWgdA5k4NHWPtLg6sfE9uKM3D6CUQOnZOPFw/B
         ErWAgpvGQ1E+Ck6NXZWTIwOoe0pkyTwOyZhU5lhvH2KjaqN7mZLMSkPhWj9H6Moy/u5H
         Be9A==
X-Forwarded-Encrypted: i=1; AJvYcCWRFjldSB93L41kUX314F7liSABeGlOyNDKkAfQPSyiODqenvAusyd64Xe2KEwQPoqUh9sguHozMkhJzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx007ojojhTZce6Edoq7ISU81yHTQAxC5vm1pF9I1T+L8/z5eYx
	sYvJ7MrOH/y2cNA6zw41FQfCT00zUWwqspXAmYp5dUxE9c3XQIlR/BgyOCelQWylmmA0sjK0EEB
	m5fejsRPDIFc7WVDwy+1CjkuzcCTtUnPxrdUqkTSQlg==
X-Gm-Gg: ASbGnctcdO+IEHhaj9Xp61NI0oxlpiA9yAIY3pGlxU4AYdUGzIDF1aD7OyXoPzJxIUS
	//6CeFxIlP0jBwmGVM+70XEwpeaXRWEg+KfN8gChVZ9t6JeAcUi3TdHHy44YGOCvgQv7uEqnI1H
	4HviOXxRSB6QQ9+C34ryWoGBaej1hHXx7EgS5T1P14JHs3
X-Google-Smtp-Source: AGHT+IH1Y42tC9WOhyorVoIVUzg4d8lEv7srElHPGs2Vyxp0TjD0IOF4Ys3G9cHs3FqdWdAWUdm5wif9bNpbqowU6iM=
X-Received: by 2002:a05:690c:892:b0:70f:6ec6:62b5 with SMTP id
 00721157ae682-7117547d163mr25767887b3.38.1749871999806; Fri, 13 Jun 2025
 20:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page> <20250613132227-GYB135173@gentoo>
In-Reply-To: <20250613132227-GYB135173@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 11:33:08 +0800
X-Gm-Features: AX0GCFvaqH-7lH0Zx6WGwcqUhaG1iGpayA9xWNyPAE7sjxcXfPy8V2aaJ994Vr0
Message-ID: <CAH1PCMa8DukTxxRoWBUV22zTFnSa-4pLkZjffXO2Z9s8dtpiMg@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Vivian Wang <uwu@dram.page>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_203320_897862_AF2D7420 
X-CRM114-Status: GOOD (  22.91  )
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

SGksIFlpeHVuCgpPbiBGcmksIEp1biAxMywgMjAyNSBhdCA5OjIy4oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+Cj4gSGkgVml2aWFuLCBHdW9kb25nLAo+Cj4gT24gMTE6
MDYgRnJpIDEzIEp1biAgICAgLCBWaXZpYW4gV2FuZyB3cm90ZToKPiA+IEhpIEd1b2RvbmcsCj4g
Pgo+ID4gT24gNi8xMS8yNSAyMDo1NywgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4gPHNuaXA+Cj4g
PiA+Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ID4g
KyAgICAgICAgICAgZG1hX2J1czogYnVzQDQgewo+ID4gPiArICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZG1hLXJhbmdlcyA9IDwweDAgMHgwMDAwMDAw
MCAweDAgMHgwMDAwMDAwMCAweDAgMHg4MDAwMDAwMD4sCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwweDEgMHgwMDAwMDAwMCAweDEgMHg4MDAwMDAwMCAweDMgMHgwMDAw
MDAwMD47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgcmFuZ2VzOwo+ID4gPiAgICAgICAgICAg
ICB9Owo+ID4KPiA+IENhbiB0aGUgYWRkaXRpb24gb2YgZG1hX2J1cyBhbmQgbW92ZW1lbnQgb2Yg
bm9kZXMgdW5kZXIgaXQgYmUgZXh0cmFjdGVkCj4gPiBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gsIGFu
ZCBpZGVhbGx5LCB0YWtlbiB1cCBieSBZaXh1biBMYW4gd2l0aG91dCBnb2luZwo+ID4gdGhyb3Vn
aCBkbWFlbmdpbmU/IE5vdCBzcGVjaWZpY2FsbHkgImRyYW1fcmFuZ2U0IiwgYnV0IGFsbCBvZiB0
aGVzZQo+ID4gdHJhbnNsYXRpb25zIGFmZmVjdHMgbWFueSBkZXZpY2VzIG9uIHRoZSBTb0MsIGlu
Y2x1ZGluZyBldGhlcm5ldCBhbmQKPiA+IFVTQjMuIFNlZToKPiBSaWdodCwgd2UndmUgaGFkIGFu
IG9mZmxpbmUgZGlzY3Vzc2lvbiwgYW5kIGFncmVlZCBvbiB0aGlzIC0gaGF2ZSAqYnVzCj4gcGF0
Y2hlcyBzZXBhcmF0ZWQgYW5kIGxldCBvdGhlciBwYXRjaGVzIGRlcGVuZCBvbiBpdC4KPgo+IEJ1
dCBzZWVtcyBHdW9kb25nIGZhaWxlZCB0byBkbyB0aGlzIG9yIGp1c3Qgc2VudCBvdXQgYW4gb2xk
IHZlcnNpb24KPiBvZiB0aGUgUERNQSBwYXRjaD8KCkhpLCBZaXh1bgoKSSByZWFsaXplZCB0aGF0
IHRoZXJlIGlzIHNvbWUgc29ydCBvZiBkaXNjcmVwYW5jeSBiZXR3ZWVuIG91ciB1bmRlcnN0YW5k
aW5nCmZyb20gdGhlIG9mZmxpbmUgZGlzY3Vzc2lvbi4gV2l0aCB0aGUgaW5mb3JtYXRpb24gSSBw
dXQgaW4gdGhlIG90aGVyIGVtYWlsCmVhcmxpZXIgdG9kYXksIGRvIHlvdSBzdGlsbCB0aGluayB3
ZSBzaG91bGQgc3VibWl0IG9uZSBwYXRjaCB3aGljaApjb3ZlcnMgYWxsIDYgc2VwZXJhdGVkIG1l
bW9yeSBtYXBwaW5nIGJ1c2VzIGZvciBrMS5kdHNpPwoKTGV0IG1lIGtub3cgd2hhdCBkbyB5b3Ug
dGhpbmsuIFRoYW5rIHlvdS4KCkJSLApHdW9kb25nCgo+Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNTI2LWI0LWsxLWR3YzMtdjMtdjQtMi02M2U0ZTUyNWU1Y2JAd2h1
dC5lZHUuY24vCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MTMtbmV0LWsx
LWVtYWMtdjEtMC1jYzZmOWU1MTA2NjdAaXNjYXMuYWMuY24vCj4gPgo+ID4gKEkgaGF2ZW4ndCBw
dXQgZXRoezAsMX0gdW5kZXIgZG1hX2J1czUgYmVjYXVzZSBpbiA2LjE2LXJjMSB0aGVyZSBpcwo+
ID4gbm9uZSwgYnV0IGlkZWFsbHkgd2Ugc2hvdWxkIGZpeCB0aGlzLikKPiA+Cj4gPiBETUEgYWRk
cmVzcyB0cmFuc2xhdGlvbiBkb2VzIG5vdCBkZXBlbmQgb24gUERNQS4gSXQgd291bGQgYmUgYmVz
dCBpZiB3ZQo+ID4gZ2V0IGFsbCB0aGUgcG9zc2libGUgZG1hLXJhbmdlcyBidXNlcyBoYW5kbGVk
IGluIG9uZSBwbGFjZSwgaW5zdGVhZCBvZgo+ID4gZXZlcnlvbmUgbW92aW5nIG5vZGVzIGFyb3Vu
ZC4KPiA+Cj4gSSBhZ3JlZQo+Cj4gPiBAWmUgSHVhbmc6IFRoaXMgYWZmZWN0cyB5b3VyICJNQlVT
IiBjaGFuZ2VzIGFzIHdlbGwuIFBsZWFzZSB0YWtlIGEgbG9vaywKPiA+IHRoYW5rcy4KPiA+Cj4g
PiA+Cj4gPiA+ICAgICAgICAgICAgIGdwaW86IGdwaW9AZDQwMTkwMDAgewo+ID4gPiBAQCAtNzky
LDMgKzY5MywxMjQgQEAgcHdtMTk6IHB3bUBkNDAyMmMwMCB7Cj4gPiA+ICAgICAgICAgICAgIH07
Cj4gPiA+ICAgICB9Owo+ID4gPiAgfTsKPiA+ID4gKwo+ID4gPiArJmRtYV9idXMgewo+ID4gPgo+
ID4gPiA8c25pcD4KPiA+Cj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
