Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88A7C369D5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 00:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea7anpieaoiqBZ2rEVh5QBwGPj4oE3hCo+/g6zqf3f8=; b=XqUay6purk3272
	c9Vie3FpmHsPNl4aaWkC837LbrTzaMgtovMkgjrumGA73HIxx6+HejiJhQHWzNLv/zcOpBZQLEUpg
	x2nGpSA89tUC7rqCIrrqyTfIhL503W+djXeuS39VXij5oQUQqmIaWT5JZ8gKkuV1dDwYs0SzSYpH2
	Uqvq7EbXbfUvwwfyn7xzPvokNGiZSHaIrKJFCjaktausnTO4DCHdMrlgN8w65nxc93QlzTBK3fdzJ
	W5nvtXzU6iZI2AoO713uW8t4mCbC8dvJolmbF8UTfo5Rh2TRgeTo+hfYR7MlKsYlhG6agwOgi5qzK
	dSHclZuhkygYdjGh0tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z2H-00000007vh0-2JKF;
	Tue, 29 Apr 2025 00:41:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z2E-00000007vgK-1IME
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 00:41:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ace3b03c043so835560766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745887276; x=1746492076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbaKAKCTzfmHltef4oBV78jsKmCoKC/2lN4zrIr3UH8=;
        b=eyLp6RFtul1kWgNH/8cT7DHROW60CXvjxom0yQ/oapLMCZy+gBSEJnveZrV4FxeAn0
         v64ogIa/+GRrTgm37xb6ZEoBHbpS34bV9x98KDqqNYMnVqIKg0MlhzViVrHvlYaaHL5x
         vHzKBq2f4rh1xlsENBh2a1GOGrtCbt1FgKiTrtAQcORGmKZ8TD82E8iGtYiLiZc/edcG
         +MCI+0lSTg1lxnF4am8tzX7XryrlUE2ikElYRAMw/YlWgSnLEGvmEt/Rvc4J6FBj4rzN
         3Ow9jNF7PhDK6c3VVpgdk4NBqCen7Qzv/pkBUFwwZ6PQDTH+84Vs242FBaYpfLsvoSWY
         inVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745887276; x=1746492076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbaKAKCTzfmHltef4oBV78jsKmCoKC/2lN4zrIr3UH8=;
        b=PymVkTkw8pZnTGvrRW4DWuAIcQl6rBsZNXeV/B3xVl/DkhDZwO5PiGUH2vjk7xV4Sn
         TjoE8Djpud+50Kw5TJxeloknUxlU0IKvBGye1YEoG61yFvuvcH6hX6XNMSJoMMjpQ0gT
         nPbEP3eOCpSDNc74ZiyaVi9ZSPT44N1aBi724F7V59mKT8tIWvJ7Wovw7qCgpt47kET6
         HM9KKeXrrp7JMcF4SNCqOaCXS8Z8Jqtr5u7hQSygtpUrcwUgoM8fjWdANFPPHdv75hmn
         xR6hEdRWOUa7vVXljQcVCOpJPEfjV2CmySl/XxV/eFdCz7GsljgNXEozmLrbjVfvwQ8H
         79/g==
X-Forwarded-Encrypted: i=1; AJvYcCVou8ocwyTt0T7AXlbjhZY/zqr0s5LhyMXefiK38Jf2oHDBg6thCwsLPSEAwcQafCnZ01MAq2dTKLOdvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaOiEekVZLyzKP6oD0Y/EsQbanjX+7NZ04wzvhju+ByPOPFOre
	ENl1opv8/HOdVFWLB9eJ+MPLAQUCx+yuSN7/52H4Hb+l6r5lue/53HSXzt/6c0FsLQOEBSm2Q2W
	MiSqeYCQtRKTHYz67x33Bt4k4ZLTZpDDAcc+Npw==
X-Gm-Gg: ASbGncsCFRUIL59qvC/WCzxO0HPdmFG1YTcHESEYYG6AbK1KjW+7T38kQiJ6tNQgMLt
	50IVEXark2Iy82rqZMNRc+GfjAkQUvqTZsPXhwfQUeCe1Ks/IvuruizHXEUFBXgGiJMXZ73QsOc
	Aehe/12TY+BYSyxCP+x7hQ4IgcJvmPnnrcvA==
X-Google-Smtp-Source: AGHT+IGDDd1KBmZYtGMAtcmO079rgPCkzThzjrRGdQyH+DShBHm1WziqDjfFzM1LQRG2qnLtbMLpLsYzzQQ9Ipi2Cr0=
X-Received: by 2002:a17:907:6089:b0:ac2:66ff:878 with SMTP id
 a640c23a62f3a-acec87b1b2cmr75859566b.50.1745887276408; Mon, 28 Apr 2025
 17:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-4-guodong@riscstar.com>
 <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
 <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com> <t4tnrsyl7t7hwfm752eapz3ajxkkl23nrfemw4jy6a7khi7a7u@gow3c2ba56ib>
In-Reply-To: <t4tnrsyl7t7hwfm752eapz3ajxkkl23nrfemw4jy6a7khi7a7u@gow3c2ba56ib>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 29 Apr 2025 08:41:04 +0800
X-Gm-Features: ATxdqUG3lFgkg3lNUF6_ATkNEyTDRUTSmHtumyCGNvrS81lb8iksobg6ENCiyps
Message-ID: <CAH1PCMbuP6CzA-0CWM93MifWDY-cKmvozh7SUoy0658VRssaAA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_174118_611774_DEFB82AD 
X-CRM114-Status: GOOD (  19.47  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMTI6MzLigK9BTSBVd2UgS2xlaW5lLUvDtm5pZyA8dWts
ZWluZWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIE1vbiwgQXByIDI4LCAy
MDI1IGF0IDA4OjQ2OjUwUE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBPbiBUaHUsIEFw
ciAyNCwgMjAyNSBhdCA0OjE44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcgPHVrbGVpbmVrQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiBJIHdhbnQgdG8gbWFrZSBhbGwgcHdtcyB1c2UgI3B3bS1jZWxs
cyA9IDwzPiBpbiB0aGUgbG9uZyBydW4uIENhbiB5b3UKPiA+Cj4gPiBTdXJlLiBJIGNhbiBkbyB0
aGlzLgo+ID4KPiA+ID4gcGxlYXNlIHVzZSB0aGF0IGZvciB0aGUgbmV3IGJpbmRpbmc/IChPZiBj
b3Vyc2UgdGhpcyBuZWVkcyBhZGFwdGlvbiBpbgo+ID4gPiB0aGUgYmluZGluZyBkb2MsIHRoZSBj
b2RlIHNob3VsZCBhbHJlYWR5IGJlIHByZXBhcmVkIGZvciB0aGF0LikKPiA+ID4KPiA+Cj4gPiBJ
IGdvdCB3aGF0IHlvdSBtZWFuLiBUaGUgY29kZSBjaGFuZ2UgZm9yIHRoYXQgaXMgYWxyZWFkeSBp
bnRlZ3JhdGVkIGludG8KPiA+IHY2LjE1LXJjMS4KPiA+IENvbW1pdCA4OTVmZTQ1MzdjYzggKCJw
d206IEFkZCB1cGdyYWRlIHBhdGggdG8gI3B3bS1jZWxscyA9IDwzPiBmb3IgdXNlcnMgb2YKPiA+
IG9mX3B3bV9zaW5nbGVfeGxhdGUoKSIpCj4gPgo+ID4gTm93LCBpZiBJIGNoYW5nZSB0aGlzICNw
d20tY2VsbHMgZnJvbSA8MT4gdG8gPDM+LCB3aXRob3V0IHRoZSBkdC1iaW5kaW5nIGRvYwo+ID4g
Y2hhbmdlcywgSSB3b3VsZCBleHBlY3QgdG8gc2VlIHdhcm5pbmdzICgiICNwd20tY2VsbHM6IDEg
d2FzIGV4cGVjdGVkIikgZHVyaW5nCj4gPiAgIG1ha2UgZHRic19jaGVjayBXPTMKPiA+Cj4gPiBB
bnkgc3VnZ2VzdGlvbnMgd2hlbiB0aGUgZHQtYmluZGluZyBjaGFuZ2VzIHdpbGwgYmUgbWVyZ2Vk
Pwo+ID4gb3IgSSBjYW4gYWRkIHlvdXIgcGF0Y2ggYXMgYSBkZXBlbmRlbmN5Lgo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NiNzk5ZDhhNWJiMjg0Y2Q4NjE3ODVhNjkxYjhkNWUzMjkz
MDBkOTkuMTczODg0MjkzOC5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KPgo+IEkg
ZG9uJ3Qgd2FudCB0byBtZXJnZSB0aGlzIHZlcnkgc29vbiBnaXZlbiB0aGF0IDg5NWZlNDUzN2Nj
OCBpc24ndCB0aGF0Cj4gb2xkIHlldC4gQnV0IEkgc3VnZ2VzdCB5b3UgYWRhcHQgcGF0Y2ggIzEg
dG8gcmVxdWlyZSAjcHdtLWNlbGxzID0gPDM+Cj4gZm9yIHRoZSBuZXdseSBhZGRlZCBjb21wYXRp
YmxlLgoKb2ssIEkgd2lsbCBhZGQgYSBjb25kaXRpb25hbCBjaGVjayBvZiAjcHdtLWNlbGxzIGJh
c2VkIG9uIHRoZSBjb21wYXRpYmxlLgpzcGFjZW1pdCxrMS1wd20gbXVzdCB1c2UgMzsgb3RoZXIg
Y29tcGF0aWJsZXMgdXNlIDEuCiAoaWY6dGhlbjplbHNlIGluIHRoZSBiaW5nZGluZyB5YW1sKQoK
VGhhbmtzLgpHdW9kb25nCgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
