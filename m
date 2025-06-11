Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C0EC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzoFI6nBIEfGGXH6ZEEGaFsZpQiYJdd7x8nSrZODxQU=; b=zsCX4h/VL06y6P
	AedHHUSr4SMYppwy/JBOKMxXmd1NCPCoGd0vzC8IWV/Oe8hyRz5PJe1M4Pwa/F2gMdVAPQzfAbLpc
	QxIncWWBH43TrSG+o6hQYSyPq7w/KKWDOqgSHdBrKQKueFxnkizGG43PncJs+YcNsHAZbYwnYIK7p
	/26FWxHXf8WiUzvCPeqpB8pEhP5Q5ThWr91Emos9Is3ljprP+gRTQpGlaJ0W8pHYVdnFDuAJY8ZAE
	PDGG5RuiKg8G4UEPiADMYu9YBac1bzGU/ewmWW2Bmv9ipAO1FA07+UDUKqWS6ZyYv2f9GHysdBl62
	t2Oc3cP0iFdqVo12v2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRZB-0000000B5TJ-2iRo;
	Wed, 11 Jun 2025 19:56:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOjZ-0000000Afs2-439O
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:55:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-312efc384fcso14085a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749660929; x=1750265729; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyNFKemnRNzyt/7LqR30HwimFe7KXWQY+EiWh5tmzaI=;
        b=Dx9dQq9/En5cj5dkNKxBvRgL5f4lLPwMPz4Uxy1nJDHhc8RzPNEsrDPUNXihK5tnR/
         T7+vkunFFiQNzolFMFhxHZff3CQPbVBA7FtLQf97ckGWVBtXKmvqicGmHKANlwh4MY/s
         NS3HhPCOT+awjFsyllj56FQnTRusezYeufBiXV0KbFLuktiYzjsh4IAGLpOvtFox5HDJ
         aNRbKTRgdqw9E4XF/PSUaavI8XwbDi0CDtjgS1gpCaeL9JHXG06eP/hlN5/cbqGdvodN
         nISJFR6jf0+HgNdFDB7U9SpEj80kJXEmtm8zy+Kpz1UEq+7vQCHFmSTrdpWsotGPDz/u
         XdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660929; x=1750265729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyNFKemnRNzyt/7LqR30HwimFe7KXWQY+EiWh5tmzaI=;
        b=NEcmV6y63msstOx9sdmYEWsW06jDhHRUh10l1HRlFB9b8YoLdcYULAA6aLCJw/rmqC
         qcC6W+gq6GQUCOXbnpnuz2X5SictUcLRwtbH1Hl2XUh+7/aPLxgqIIU8HHy/JdAEOMqD
         t0gIPnhfE+cqfC0kI08s09a37GXXefrmpgfw/8WInJHEzB5Cg2pZ3jxXpa0elTB0dBlh
         HDioE4dugCtBUrMGMgVUL1cNuXkLuq8wIZQbDE53qYd4Ay8t2iVaUa4adNPzdWhAI3dx
         loLUKiN/0LyA4cNiaDtb38QBVYEuFqda8BivnL1aE1t9iEpdKrnDrp9Pi4/0BZXLK8Xw
         ydmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPj6z4Lr1EL+SQYDl+DRva9+NCDFqI1zopCLKpaZeuz+XKmNT3V45K/PhCflarud/5Gyn6X1c6r7y9uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT6uh38euySy0yAxPx99JHHS+AEHCWE0KC9EUTpk6zdH1Iqdyj
	6UqDElpPY+jHV+xTNfV72KOsi2HPP0KQJX0Sn4Ps+Y6AEqfV8GlO87s12EbVT4nEa8i/v+fCZtf
	3YDXGszXvQlCeDILSxu+cCtBWk8BUBxY=
X-Gm-Gg: ASbGnctXZrVmaiIioWN7xepGcfg0Mv2oCqw//2Rcg9P9hw1j9sN7GmKPZzOtk2uRnRs
	G2vL2agn1cZUC9NlOAAd78iWz+yp6F7xHWHK2ZiydPIdPP9rV0jPjAcftJyaZof9zsgy5K6/Pv3
	cbr11h3dafVmhdCskC26RDsqdMMp/B2H4VBwX8IaKP0N0=
X-Google-Smtp-Source: AGHT+IE8o2IorCuFcUqW3Dxq8LkFc4fMvAMKwf+dTmyr9FxnqdwSW1OMco+JDmkRZVwCnFY7SBpojWZ8MSza5Nch4Qw=
X-Received: by 2002:a17:90b:1dcb:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-313af0f9611mr2302611a91.1.1749660929073; Wed, 11 Jun 2025
 09:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <aEifXZnLxKd2wa0w@x1> <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
In-Reply-To: <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Jun 2025 18:55:15 +0200
X-Gm-Features: AX0GCFtO16UWgR7wAnoHoWp6WjbNacZo98Lk-lDtKNRkXYeSnMBe-Yw1GCMYPlU
Message-ID: <CANiq72=88Aa-Fe0b6XiSfsOq0mM3jUw_e+DxpRRQdrdtWFJHsA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_095530_001507_22B596CC 
X-CRM114-Status: GOOD (  10.76  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNToxNOKAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gVGhlIGtlcm5lbCBjb25maWcgb3B0aW9u
IHRoYXQgaXMgZGlmZmVyZW50IG9uIG15IHNldHVwIGlzOgo+IENPTkZJR19SVVNUX0JVSUxEX0FT
U0VSVF9BTExPVz15CgpZZWFoLCBjb2RlIG11c3Qgd29yayB3aXRoIGBDT05GSUdfUlVTVF9CVUlM
RF9BU1NFUlRfQUxMT1c9bmAgLS0gdGhlCmNvbmZpZyBpcyBhbiBlc2NhcGUgaGF0Y2gganVzdCBp
biBjYXNlIGEgdXNlciB0b29sY2hhaW4gY2Fubm90IGJ1aWxkCnRoZSBjb2RlIGZvciBzb21lIHJl
YXNvbi4KCkluIG90aGVyIHdvcmRzLCBpZiBhIGBidWlsZF9hc3NlcnQhYCBpcyB0cmlnZ2VyZWQs
IHRoZW4gdGhhdCBpcyBhIGJ1ZwoobGlrZWx5IGluIG5ldyBjYWxsZXJzIG1pc3VzaW5nIGFuIEFQ
SSwgYnV0IGl0IGNvdWxkIGFsc28gYmUgaW4gdGhlCmNhbGxlZXMsIG9mIGNvdXJzZSkuCgpXZSBt
YXkgZXZlbnR1YWxseSByZW1vdmUgaXQsIG9yIHBlcmhhcHMgaW52ZXJ0IGl0cyBtZWFuaW5nIHNv
IHRoYXQKYGFsbG1vZGNvbmZpZ2AgZG9lc24ndCBlbmFibGUgaXQsIHdoaWNoIGlzIGhvdyBJIGd1
ZXNzIHlvdSBlbmRlZCB1cAp3aXRoIGl0LCByaWdodD8KCkkgaG9wZSB0aGF0IGhlbHBzLgoKQ2hl
ZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
