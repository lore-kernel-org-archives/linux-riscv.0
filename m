Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC093C54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvlCfkhBbEfRZAzm0VTQeKtpsJU9E3jeltRTR8hLjAA=; b=FykssXaMbqMzTj
	pLmha+mztiQsgFL1mb3XlSiLfCr8AmeqF511oFgfCAzSHdFxghmG9aeOVsCRwF6GJNsNoE0xzcBLx
	aO5E290khoiJehfLLzPpKEdaCUy85xRV9K4E4d5kBjTYc3g2shw20H3NIEBdADVA1qNs7J9ssN991
	Ru44SEksmNufdd3ROi7P+NAUikuwAWURfrIy5EZv8yj/+OJjw3O584C760PSQLim4hUSLijsjs7w6
	UUuzHPBFFmq1MtC5lSQDPbgb/a8rC/mK3bNiME5mPC/qaIgNf+4w29Nn1vEyQr+SlvuvKojZKznuy
	SmM/0T1vxqMkeiF5hO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpr0e-0000000ENce-1VwU;
	Thu, 28 Mar 2024 14:45:40 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpr0c-0000000ENc3-32vH
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 14:45:39 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609f1b77728so11357747b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 07:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637136; x=1712241936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fjaRGcSgf8xsTZBcLTiZ5jbt+B1Ifd5p00AndFjlLw=;
        b=SGCM34GQayZhUiuBW1ey3QEzzxvbJgjV5elx7Ucy0G/sKn8lgpYc5/UX5gAePtFiiw
         VexCCuk5Yuuw7Bsf0ryi2Q+ejWFFG7MjAoMgEohnV9z0tPtNoWSUYYpKXiTFmE0EkjKe
         wAuvOSRRJIWin7EYxb3cjorvICeOYIBw0YdgED1a4oGhlzKBn0XVmOwglrc7pxzrgCl6
         S3cCTxB02OJX/LNlZQs0YoZqkZK9jFBcdQMaAbJVjaCwrxElWbS/6sgP92xhH1wYPtdB
         3xtfxO6xyGFX2/6ghJdEEulfcO8XZZ1sq+h2GE/OSt+J8v6OsRA0greglzdXSoJ5vqxM
         F2rw==
X-Forwarded-Encrypted: i=1; AJvYcCXcGBoDBHTsK3BxpRInnWiWTCEKotH3ehhC0XwAUq6K06soL8InR0a4o7cED7CwYy+HOlcvaDKfvjoFW6CKh+cSjhEdJcM55eiNlpg8GKKC
X-Gm-Message-State: AOJu0YyEQL+1qTs9TWxHrQUKIQwr35ILX7lw9B1+OOKgu+6rcMohzXhc
	IT3NQQpwmqwPcZj5TUfWx8kMTBhqXCwIsKCjJYh/G3SHcWY7AQf/02fuLVgsT68=
X-Google-Smtp-Source: AGHT+IHVQZVX87fiVNPabnHb5WtJw/utdWWAFqZ2nRdS84Wqb5+IWHPTpaqIZZecGGr2p+0u6VaigQ==
X-Received: by 2002:a0d:d9d5:0:b0:611:9f44:3d4c with SMTP id b204-20020a0dd9d5000000b006119f443d4cmr2963876ywe.12.1711637136179;
        Thu, 28 Mar 2024 07:45:36 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id o9-20020a81c909000000b00610b532f8cbsm326728ywi.36.2024.03.28.07.45.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:45:36 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso1030819276.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 07:45:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPibdmrLV7GwF0cNY9DVo4/cM7F1mxvpmJMI3HHmv6BhRlkMXfiLGpmI+v0TOU18iYiij/5lU4+8CMbHntoNx7BOLQBPu4xhlCpNGyu6CJ
X-Received: by 2002:a25:ff19:0:b0:dc7:32ea:c89f with SMTP id
 c25-20020a25ff19000000b00dc732eac89fmr2988417ybe.15.1711637135802; Thu, 28
 Mar 2024 07:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240327054537.424980-1-samuel.holland@sifive.com>
In-Reply-To: <20240327054537.424980-1-samuel.holland@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Mar 2024 15:45:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7HoJc+67VkqZk+KH8LzauQoTofP2ZrALvbpAtnbNRtw@mail.gmail.com>
Message-ID: <CAMuHMdX7HoJc+67VkqZk+KH8LzauQoTofP2ZrALvbpAtnbNRtw@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: Partially convert to a platform driver
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_074538_788965_5566A300 
X-CRM114-Status: GOOD (  16.24  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgNjo0NeKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiBDb21taXQgOGVjOTliMDMz
MTQ3ICgiaXJxY2hpcC9zaWZpdmUtcGxpYzogQ29udmVydCBQTElDIGRyaXZlciBpbnRvIGEKPiBw
bGF0Zm9ybSBkcml2ZXIiKSBicm9rZSBjY2FjaGUgaW5pdGlhbGl6YXRpb24gYmVjYXVzZSB0aGUg
UExJQyBJUlEKPiBkb21haW4gaXMgbm8gbG9uZ2VyIGF2YWlsYWJsZSBkdXJpbmcgYW4gYXJjaF9p
bml0Y2FsbDoKPgo+ICAgWyAgICAwLjA4NzIyOV0gaXJxOiBubyBpcnEgZG9tYWluIGZvdW5kIGZv
ciBpbnRlcnJ1cHQtY29udHJvbGxlckBjMDAwMDAwICEKPiAgIFsgICAgMC4wODcyNTVdIENDQUNI
RTogQ291bGQgbm90IHJlcXVlc3QgSVJRIDAKPgo+IEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgSVJR
IGhhbmRsaW5nIGNvZGUgdG8gYSBwbGF0Zm9ybSBkcml2ZXIuCj4KPiBGaXhlczogOGVjOTliMDMz
MTQ3ICgiaXJxY2hpcC9zaWZpdmUtcGxpYzogQ29udmVydCBQTElDIGRyaXZlciBpbnRvIGEgcGxh
dGZvcm0gZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KClRoYW5rcywgdGhpcyBmaXhlcyB0aGUgU3RhcmxpZ2h0IGJvb3Qg
ZmFpbHVyZSBJIGRpZG4ndCBnZXQgdG8gYmlzZWN0IHlldC4KVGVzdGVkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
