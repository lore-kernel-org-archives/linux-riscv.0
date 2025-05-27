Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F15C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 02:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijW6+/oDG2PPlR2ryNtuMGaiL/YRMy1GQ4uz9PVNxtQ=; b=f89Hr+Wg7QoLTx
	W7mEU/7csas4LgTAba6PpRyuQ2S93lt4MHOmWtu00TkFS5x6m7qLgEjHzLx+qdLY52/Cee8s1xB//
	NMb120QBxBoicz+w94f9H3AcjCbbYg0yRFMwSgcdd87fdq/4J5LmDyWTF5paLUm4l+klH/V9mVrtQ
	9cbGxzEU9Hwg8avm7Qu+OfuE8tuYMlE197V4fk/c+YFJQLSQDABQL1rfpjauoJSZBz0auhaNS5v5C
	yFT9VVmCrcbhie6Ni25y612k3W2dS+PtF/o1l6FQZYe+FvCqdRl1EJvQJkaMItggrxcMvobCuR0TE
	RPlkBJ5XeBUmVDeq2heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkMk-00000009n6v-2N7h;
	Tue, 27 May 2025 02:48:34 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkMh-00000009n6T-3ZZY
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 02:48:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so1916533a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748314110; x=1748918910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=UqU9Xg9Tq7lC6GKF1jML21y+/oVZozTG4JaX3EVdzzVA01eLvuIpTHQr18iXGqbeXk
         T4oEdhWedSZnNevlWXqcdJFZMugg+qVZgsd/4g6GJD+dYsKGDcVNXyU7bpjkhMFSaTUY
         mOOt0ySggnmksytyUbdIgH57kt68boBzGR0zgnSBP20O1meJxQK/PqnDtBcK94Uzw+J6
         4NQj5Hh5VMSTvcSdTVMbi1tbiz0UkmJhm08m0iNOY1Qj7ygGz5uhiwgu6ZwfsBzdrQzX
         fq1rTB4idEssH+DDFzavEPliDrGP/e8UvX6vwsGbkAyB8YDlcS0dHBJdFReIZ1TGcG/y
         9P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748314110; x=1748918910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=TYoZMCXp6O2lTyheGzOEFE1njgn3oojRdBwDTKW41JERXh9rdIjV6zDmxJ2CyUgiqQ
         PVL3BQJMaKvDARpvCQTdP9LQ8gTRsysTsh8G+FuKiiRqbHJ06vlCvIy9kGMQhoOVJsSZ
         DoD6Hs9MtrsPu0ObV+UbYW35YQmmNGsdeF0tWzhhEvyBpJjShp/8brBPT3nprYSm+9gL
         CaQ0i4JZru8qdPw1COxmr2w+iqLetlhCUcbVfWg+dkbaJbgPM5k4S+VYtSGheWbleMxB
         a6ZqdUIurMEJfkv4rM09of4Hl+1MXGXG2MJ+czw/egZpJStOQb5YK+j4FLvUOYJE7YyX
         ZAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPt0b8tw6tt8WCk/o0xy1mWnt/weqEV5wwLy/QSwXlrkD8Z3ClkNQkUfKb2YTy2p7M+a+O1itB5GjXaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3dFhKPjH4dPpiDPmek4ohbIrFM9gtzf0TR9BpfIRjvEoshkrS
	5HbliyTOUvDTKaqEMIfbgyAf6B2TtCepiC++lfKJ8DO9Bn5x+7tTBAGyrHyqX6A8P2KfY01Pqjw
	eAeo+20VfGsbNAMlWsUH9efOmhIWtRWbv2Dh4LxDjfg==
X-Gm-Gg: ASbGncvFZPj9x1Ig7RJETDskqpkU3L4Aq3S6kGmU/mjT8n6Q/pslu5N8SnSk24MOcuO
	/T8t9R6VTZeLrWyyWmag0HLFFRZzmQCfnzTJQ97KE93n2sBmI76oaA8ezkIDGN+FwuE04QNBbM0
	jZdx3Y49VtF6Zu69nCrNITnjWEK5nyQOViSw==
X-Google-Smtp-Source: AGHT+IGlQnBA51IfLDQtlV4Tsj0DcivukafO3WpRjoRYo7aZ2XNkgT/ISpHO9OKoKdboUS/Oi+TdrQgc1gVBGNRrhUg=
X-Received: by 2002:a17:907:9303:b0:ad1:d0e7:a698 with SMTP id
 a640c23a62f3a-ad8596d8c4emr1099084466b.2.1748314109982; Mon, 26 May 2025
 19:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com> <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo>
In-Reply-To: <20250526215243-GYA53128@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:48:18 +0800
X-Gm-Features: AX0GCFvI_6k3vBVjk-TWBpWmMUcHskFmulTKZz7Kxcz7kFRTgK5PHEc_K-e3F1M
Message-ID: <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
To: Yixun Lan <dlan@gentoo.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_194831_894832_E5E186C8 
X-CRM114-Status: GOOD (  13.48  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNTo1MuKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsIFV3ZSwKPgo+IE9uIDE4OjU0IE1vbiAyNiBNYXkg
ICAgICwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAyOSwgMjAyNSBh
dCAwNDo1MDo0NlBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+ID4gPiBpbmRleCAyODM2NjM2NDdh
ODYuLjE5NWViODg3NGYzYyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
cGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9z
cGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gQEAgLTIwLDQgKzIwLDExIEBAIHVhcnQwLTIt
cGlucyB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGggPSA8MzI+Owo+
ID4gPiAgICAgICAgICAgICB9Owo+ID4gPiAgICAgfTsKPiA+ID4gKyAgIHB3bTE0XzFfY2ZnOiBw
d20xNC0xLWNmZyB7Cj4gPiA+ICsgICAgICAgICAgIHB3bTE0LTEtcGlucyB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgcGlubXV4ID0gPEsxX1BBRENPTkYoNDQsIDQpPjsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICBiaWFzLXB1bGwtdXAgPSA8MD47Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgZHJpdmUtc3RyZW5ndGggPSA8MzI+Owo+ID4gPiArICAgICAgICAgICB9Owo+ID4gPiArICAg
fTsKPiA+Cj4gPiBUaGVyZSBpcyBhIG5ld2xpbmUgZXhwZWN0ZWQgYmVmb3JlIHRoZSBwd20xNC0x
LWNmZyBub2RlLCBpc24ndCB0aGVyZT8KPiA+Cj4gUmlnaHQsIEkgY291bGQgYW1lbmQgdGhpcyBh
bmQgZml4IGl0IHdoaWxlIGFwcGx5aW5nIHRoaXMgcGF0Y2gKPiAoc28gaWYgdGhlcmUgaXMgbm8g
b3RoZXIgc2VyaW91cyBpc3N1ZSwgbm8gbmVlZCB0byByZXNlbmQpCj4KClRoYW5rcywgWWl4dW4u
CgpCeSB0aGUgd2F5LCBkbyB5b3UgcGxhbiB0byB0YWtlIHBhdGNoZXMgMyBhbmQgNCBvZiB0aGlz
IHNlcmllcyBpbnRvCnlvdXIgdHJlZT8gVGhleSBvbmx5IGFwcGx5IGlmIHRoZSBTcGFjZW1pVCBy
ZXNldCBwYXRjaHNldCBpcyBhcHBsaWVkCmZpcnN0LgoKQlIsCkd1b2RvbmcKCj4gLS0KPiBZaXh1
biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
