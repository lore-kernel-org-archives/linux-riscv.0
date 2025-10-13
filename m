Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB3ACCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKP2gshCX0/FYWporLpwkKwOn92KtY/6I60x3uXe6cM=; b=CkrAwSKz/7MTKo
	zqB2uTth7e6lYCW4o5gW72tRosNObzHyTYaV2bTD/DxXzb7LAuug1Q9U2G5hPH6BvW61YvhzRoNDG
	v9xmgxU3XBcXPSwRcdBab6kaFZWpVT5pjwqI1rKbd7cRVLCqQXhzFqjLYauXUs/m0rRdELRhTP6Yh
	r4Z1BDsmAK6WImr+mpW60mKE4YFgc7hTiGzZXG4luRX5O05B3crlbZiPgJu1k9GLUeAt0xInMxdc/
	1vwkB254kBAGtsWy54xZCUUONrtJNVc0ouz1h8xNL6OB9h59B5nU7JJywsKDmIaqBGQHhI8+BdyTU
	g5/miSGucfGOKjm7+ooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EXO-0000000CgdD-2A16;
	Mon, 13 Oct 2025 09:08:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EXM-0000000CgcD-1Hur
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 09:08:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e704b11afso3686025e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760346490; x=1760951290; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uljRuJ22VHj4+zUjoo+jqjIn1OWN7Z5Wc/Ca9r3a1Z0=;
        b=IUxwZVHKlFRamAknHGp21HnSjoe5E+5FddrRi+VMktBN216PCblSyGKQDZVqj+FPnb
         31/713a2NorL2Rc3LAXg4CvvLdS3Mta4h+PT6ErzoyDE9MQmt6pNb2DbWT1s3d3JwN9t
         Nx6cWusN240YVrYgBXQF5oIMHpm2y3UXah7o2WOEXhERYBlnlJtRec+/9YU7io/E66zI
         1pMV9+NYu9zEGtOVvpYn5w+wV7utfRSnCgTVoBxpGrPUx9Gw+i2UHouTa0JljnaK0MOv
         fZ9rzbsjWHmLkg+FeEWWEOdmIukmfb4BncPop/V6FDHniv6VcrN9Ow4jnSSyuTltMhn7
         DdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346490; x=1760951290;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uljRuJ22VHj4+zUjoo+jqjIn1OWN7Z5Wc/Ca9r3a1Z0=;
        b=KBLefwM11OTPqzmVF4PV/VB5SC088Fi8Y4bW09iEkqP8y1MBb63t5BlO6tFpKfppOl
         IiwlI3rsUNWtXZM8Jc4F4nzKf70rH5uqy8uqWzrLnNZOX279uDGdD3QEks4tcGhXR7fv
         8xBOKTmCVdIFJ80JeZm43koLxKYfenH45y6pSJau9DshbtDyft2mNT8wpws1+kwI46Ig
         7sHFLue4GhMopTVKC2mnoO/kHC4J9zoSURj2gqvWs1ZVC2EtJ/fnhGPdqExkyZu/Twje
         jfGIe4/i9ZQwoBMUCddj/qS5VmNU/3Oxx9b5ND48eaYNaDd++TBUwWWE8md/MXDrTmUl
         aZEA==
X-Forwarded-Encrypted: i=1; AJvYcCU0jV+Wcs1tvKKjtRmGma1SeFk9au/pJHfKhQw2ubnWL0L+AyRbI4OqdS6g2hhBy7W8OoO+Yn+VSFz7ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbGLje/jb25iIuo8G/k/iMQ2snKkPNF1HSi3ecB2279v7gKXD+
	IJO5Qty3mAKvXnmnxK0kQlPoXRC2N2/CaSufvWtL0sgreCTzEPX1kYd2ENCx+xR+/eU=
X-Gm-Gg: ASbGncsepI38c/gpc9MRnkGCC+ilHzy1JKDIJWnf6FlLr++roj8FiwS6/ppU1x48v4o
	Vv91P891saPY4AHsht2Zdwbh6I1yQzjPkwEEQfb3sDccvhdZD8SMy7Rl8jngNoGH4UzfO+bGOGK
	huHr/2PnVy3YADD1fQlZBGK18VpLTsfE4M/TlRT4tV5cWsbubeOK5g13/UTYo7RRw4kd0Daz203
	TRQtk1k2nMn2g8vLgRlBa0fLcVMPD10MFdUX/QtWs2IOkzuLxo7f43LO3bH5bIGYC2yI6dALOMF
	qcLJ/LEQG+qpTXGIwv18sgvbrsWHju0WRsjnAkgS4xOyDWUXEBBSNuEeYJyS+xVTbEEpeLnXrxg
	vEoJjdPlhkAZCcUQUgD8iddLoTSygP4j7JA8YHGfh
X-Google-Smtp-Source: AGHT+IH4aeUNUT5W9XMEYelh9Cec2RyLgO01+JQO99tZJva9ApRNPDUn5vWcTl3ZQ9jNpmQOS+VA/Q==
X-Received: by 2002:a05:600c:46d1:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-46fa9a8f64fmr84122125e9.2.1760346489773;
        Mon, 13 Oct 2025 02:08:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fab524f92sm120625965e9.7.2025.10.13.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:08:09 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 13 Oct 2025 11:06:50 +0200
Message-Id: <DDH2Q0N2HLKF.2QSW4DB5FTJI6@ventanamicro.com>
Subject: Re: [PATCH v4 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid
 ext
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Conor Dooley" <conor@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Kornel_Dul=C4=99ba?=
 <mindal@semihalf.com>, "Adrien Ricciardi" <aricciardi@baylibre.com>, "James
 Morse" <james.morse@arm.com>, "Atish Kumar Patra" <atishp@rivosinc.com>,
 "Atish Patra" <atish.patra@linux.dev>, "Vasudevan Srinivasan"
 <vasu@rivosinc.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 <guo.wenjia23@zte.com.cn>, <liu.qingtao2@zte.com.cn>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <20251007-ssqosid-v4-3-e8b57e59d812@kernel.org>
 <DDDL94HT7HYF.3VU2WQYU4WZY5@ventanamicro.com> <aOqjggmTr4ioHwB/@x1>
In-Reply-To: <aOqjggmTr4ioHwB/@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020812_370133_42F462BD 
X-CRM114-Status: GOOD (  10.92  )
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

MjAyNS0xMC0xMVQxMTozNTo0Ni0wNzowMCwgRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5v
cmc+Ogo+IE9uIFRodSwgT2N0IDA5LCAyMDI1IGF0IDA4OjQ3OjI3QU0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4gMjAyNS0xMC0wN1QyMzoyMToxMi0wNzowMCwgRHJldyBGdXN0aW5p
IDxmdXN0aW5pQGtlcm5lbC5vcmc+Ogo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Fvcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9xb3MuaAo+PiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fc3JtY2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkK
Pj4gPiArewo+PiA+ICsJdTMyICpjcHVfc3JtY2ZnX3B0ciA9IHRoaXNfY3B1X3B0cigmY3B1X3Ny
bWNmZyk7Cj4+ID4gKwl1MzIgdGhyZWFkX3NybWNmZzsKPj4gPiArCj4+ID4gKwl0aHJlYWRfc3Jt
Y2ZnID0gUkVBRF9PTkNFKG5leHQtPnRocmVhZC5zcm1jZmcpOwo+PiA+ICsKPj4gPiArCWlmICh0
aHJlYWRfc3JtY2ZnICE9ICpjcHVfc3JtY2ZnX3B0cikgewo+PiAKPj4gV291bGRuJ3QgcHJldi0+
dGhyZWFkLnNybWNmZyBoYXZlIHRoZSB2YWx1ZSBvZiBDU1JfU1JNQ0ZHIHdoZW4gZXhlY3V0aW5n
Cj4+IHN3aXRjaF90bz8KPgo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLiBZZXMsIHlvdSBhcmUgcmln
aHQgdGhhdCBwcmV2LT50aHJlYWQuc3JtY2ZnIHNob3VsZAo+IGhhdmUgc2FtZSB2YWx1ZSBhcyBD
U1JfU1JNQ0ZHLiBBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCB0aGUgY3B1X3NybWNmZyBpcwo+IG5v
dCBuZWNlc3NhcnkgYXMgcHJldi0+dGhyZWFkLnNybWNmZyBzaG91bGQgaGF2ZSBzYW1lIHZhbHVl
PwoKWWVzLCBpdCB3b3VsZCBiZSBtb3JlIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBjb250ZXh0IHN3
aXRjaGVkIHN0YXRlLgpJIGp1c3Qgd2Fzbid0IHN1cmUgaWYgc3JtY2ZnIGRvZXNuJ3QgaGF2ZSBz
cGVjaWFsIHJhY2UgY29uZGl0aW9ucy4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
