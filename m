Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9334C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/PrmUmDk4bCAajYtc+eJoibxcuRlPoe5CiIg+XOwcE=; b=osKx5/0iaBSlW9
	L18BnZq+98p61VUO2k9m7h7hUdDBgpjf8sZRhS4KyQJqk+JdzNKF+ZcuiFJgpBZ9OXnUUshGtDrZI
	kZQPp86xMhw3Aj1SPSZaYqJs12Mo+3/Bgt7zj7CbFrSlu3Vafp6bF/AfiCzg4YxTFDXFa7EBhexee
	yjhZtT7k+ckV2IcW8e/ZHDnq7rj3eCoiZ3PFbjikls+DzWQhyCzjGEsKNu69xH8x7+v769Wq8hGQC
	Dlj7tjhbZ3xc74Qe+xbzoVFLezi2hak5rf0Q9nBG2v4QHF5waEcdZHY8CqqO21cInbzRXOogPrYUO
	CSsERFpvMv71LtygQWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRujB-0000000AbKo-26HD;
	Wed, 18 Jun 2025 15:29:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt4N-0000000AL1x-2zN5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:43:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553bcf41440so4359977e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254194; x=1750858994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
        b=r474pA0z0EBUR31W6jKcSLtU60OoPBHtIpNTQZs253sJN89vhMeBW1sTCdCgYQdZCI
         lWBDY4PmC0f0ZeCzYFT+x5MBjJj8rDyipvz/19irxi6YDqFfkw2MFeM4rxhuT2olP0Y+
         ulPc6pkM/tqIiUvC40tivkwkyZLPzt5fTV9pOtVFXWCXKe5jMjjsz5h5OcXhcVqS15qS
         SXfQ9I/hMLFWo2ds1lzdguEGx8eddHYgLydN0XuAHvlGkvGP77xH0pQ6GG4I8ZMXSWFt
         UNALLq6ETXIHCU7Yxyn+26NCX5tqgNLsZk2JhWGw3l+W5RBmyf8wFG0Pi5PEYT7vTcLA
         JL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254194; x=1750858994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
        b=sPnegwNwoJmeTG80+vo7RbHUnnAU2CV5Q/nR9ozPrYeiAZIvY3UMS9HlT07K5kayaO
         ioa5Usqdq4Dx1BeJe/D8XEVNdUUkVphwNSl9+aenmNcnpelNHtKjnJxAticK0uM5I+Qq
         8kv5MUvUExMFzDAPuFq9jBmKmSj/mZwHHRrRA2BY9nPwmMkSI56CS74nxxcCnAOdGV8r
         nrv4JouSJ/CV2OpLpveXkmyKzYelHztAnvTtjV5prkxBzHB65LSxrocG8AyaM87h4Mj8
         oX2pQ1pLg8iP5KpDyB/6+nqwFAWsKe9I9IFhSPzlH+pnjoXXO3zsY4YIroTiFD4ThP9n
         rxMw==
X-Forwarded-Encrypted: i=1; AJvYcCX5QFn9woBtsm//OjXSWmFqzRZil73zqfGCtClxJVhlqouF5SEkBf75nGAjNFXDOPs6BZJR7Wo9966UDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8qdVsMJP9GrExLr6/8aiAANahMGIblbn5HNwVpMH3us68KJg
	t2bgbq+HPAAHUCFn2ZiT4Q0RENXDT9IYwAon2As+N2TPFvsHunoGud8fRZT/zV2WnrzJsRefPnk
	HPnOZHnlgk2ubcpr0tZ8aQMu+AqxMV+tWVD181ezSbg==
X-Gm-Gg: ASbGncvnhCc8zzXBe/UdFHGljiDMXv6MOs4hSTXuIyldsxCJakDHj2w24/M4xx0PwU4
	e1uxB1txZhuhgNICrTfH7VAgWi+gqZhYkjzrwuXKSxBUH+HK9DOFnYpeNZTdEDMOKqTUIe6j3o5
	YiJb2v3dwnLrrc6YZLTOW09M8kJWU6y7BZFC3sMcmpvQut9pzgPu4Ge51SMxpr4paHZgqK2IlBW
	A==
X-Google-Smtp-Source: AGHT+IEECYD65Et/LmSBnvEiKApYIkAD1brUDvo7BBfhvnXlFl9/WYj3FARtHuaHKB5NARXPoTCzd7KIs42A0Z1Qt14=
X-Received: by 2002:a05:6512:2351:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-553b6f5a056mr4801515e87.57.1750254193987; Wed, 18 Jun 2025
 06:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:43:02 +0200
X-Gm-Features: AX0GCFv-psDNb6_Ffk6XjHdwrMsid_b9idm2knOXcGXYQtnqAYke8L-CxfsFZ0k
Message-ID: <CAMRc=MeiCT2f902h4viFbue1tejv7EGBvEjdQhOTuqDqEViwRg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_064315_750158_A031768C 
X-CRM114-Status: GOOD (  16.89  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTI6MjLigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgImdwdS1jbGtnZW4iIHJl
c2V0IHByb3BlcnR5IHRvIHRoZSBBT04gZGV2aWNlIHRyZWUgbm9kZS4gVGhpcwo+IGFsbG93cyB0
aGUgQU9OIHBvd2VyIGRvbWFpbiBkcml2ZXIgdG8gZGV0ZWN0IHRoZSBjYXBhYmlsaXR5IHRvIHBv
d2VyCj4gc2VxdWVuY2UgdGhlIEdQVSBhbmQgc3Bhd24gdGhlIG5lY2Vzc2FyeSBwd3JzZXEtdGhl
YWQtZ3B1IGF1eGlsaWFyeQo+IGRyaXZlciBmb3IgbWFuYWdpbmcgdGhlIEdQVSdzIGNvbXBsZXgg
cG93ZXIgc2VxdWVuY2UuCj4KPiBUaGlzIGNvbW1pdCBhbHNvIGFkZHMgdGhlIHByZXJlcXVpc2l0
ZQo+IGR0LWJpbmRpbmdzL3Jlc2V0L3RoZWFkLHRoMTUyMC1yZXNldC5oIGluY2x1ZGUgdG8gbWFr
ZSB0aGUKPiBUSDE1MjBfUkVTRVRfSURfR1BVX0NMS0dFTiBhdmFpbGFibGUuIFRoaXMgaW5jbHVk
ZSB3YXMgcHJldmlvdXNseQo+IGRyb3BwZWQgZHVyaW5nIGEgY29uZmxpY3QgcmVzb2x1dGlvbiBb
MV0uCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYUF2Zm4ybXEwS3NpOERG
MkB4MS8gWzFdCj4KPiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFy
by5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBz
YW1zdW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRz
aSB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IGluZGV4IDFkYjAwNTRjNGUwOTM0MDBlOWRiZWJj
ZWU1ZmNmYTViNWNhZTZlMzIuLmYzZjVkYjAyMDFhYjhjMDMwNmQ0ZDYzMDcyYTE1NzM0MzFlNTE4
OTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiBAQCAtNyw2ICs3
LDcgQEAKPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
Pgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC5oPgo+
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvdGhlYWQsdGgxNTIwLXBvd2VyLmg+Cj4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC90aGVhZCx0aDE1MjAtcmVzZXQuaD4KPgo+ICAvIHsK
PiAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwIjsKPiBAQCAtMjM0LDYgKzIzNSw4
IEBAIGFvbjogYW9uIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCx0aDE1
MjAtYW9uIjsKPiAgICAgICAgICAgICAgICAgbWJveGVzID0gPCZtYm94XzkxMHQgMT47Cj4gICAg
ICAgICAgICAgICAgIG1ib3gtbmFtZXMgPSAiYW9uIjsKPiArICAgICAgICAgICAgICAgcmVzZXRz
ID0gPCZyc3QgVEgxNTIwX1JFU0VUX0lEX0dQVV9DTEtHRU4+Owo+ICsgICAgICAgICAgICAgICBy
ZXNldC1uYW1lcyA9ICJncHUtY2xrZ2VuIjsKPiAgICAgICAgICAgICAgICAgI3Bvd2VyLWRvbWFp
bi1jZWxscyA9IDwxPjsKPiAgICAgICAgIH07Cj4KPgo+IC0tCj4gMi4zNC4xCj4KClJldmlld2Vk
LWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
