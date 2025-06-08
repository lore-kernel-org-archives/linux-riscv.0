Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C1BC5B552
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 19:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8Fw6mbUqXTxDUDADtO2TpnC5fftMmU/JsH8ayU0pxU=; b=EXdzcgx3Ckdf/S
	UegybtGyVXzUyNP7Bq77i+K9OLeMctVDZ+VyJOpEfHV/Pguy7q563jIZ47OZxZlxDmyoMzPlc2P49
	VPKrivGdv1FxjcXsNQrS1AjnfMFys7BaL6OWtV31kN6mIq7kt982hiJs4etWLppmQBd0OEdCxN9oJ
	fNO1WbIK49Wnpx7ed82YAwOwXLQHpWTEbONM6B0JQK+jn12wTQhpJqhe0OOGcDBn0bcODAL4Chzqt
	Pyn4XzUesrWcDOn7iIIpA0FL4He2s7eIchpAiKvDXrIlN1aMDRjza25FBfo2l2qoCKeVxcr1l/Ta5
	BAcXeGj8senvxZ12UU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMA8-00000002vgL-0R8l;
	Sun, 08 Jun 2025 19:58:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMA5-00000002vfz-2l2Y
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 19:58:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74800b81f1bso2753270b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749412713; x=1750017513; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=WrIvoQe1NGdL2spboJ/TcP1ksIRadBJ4+K8Mw1564X6MGSV72fEdLEgBwwbhplpOX0
         JmvxPCm6Yr2E/l08GosNYjRiYnDqcWn1aLdpkfVv4RRHxH7PcwJnAVYKz0Nsjc47ylv/
         Oy7qphySuBrZWKhz6jsYR/ZlEOmbMi9Z+t6GheaCezCpOioCHWvp2UR7mM4V21ItRng4
         OOUXnC0Hai1EPzpXUSNu5DcEBCbi0kAmc7N+V+LSbkdOPKeSKC2I21nwsF6SiERWmKCQ
         4mXZ+k6D70IJ+qcLp1/D+ZPVO9M5laePzKnTRR5qCCJNBtDl/8qtQDieZ8IphAr5uwJm
         RqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749412713; x=1750017513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=tI0zySXJEJEjwAtBAzAwsNX5c41A8OJjt9hJVaIOCMOG5zOeZPL/Id9OLwQCtw7QnR
         erN04yWisGf9+arKN1j03DRfy0MAYRSdOzqIONrZ/CDPrXvsu12gUxoPEfs8YILPUPl4
         CE8PwNtCrF/123OULPvE0ni+Gw3+JAVw/ek61eMT40u8yxNP2BX/xDAS8I/pmqe1IIoQ
         qZVMv9iz5ZDL6XItB4VyWQtPDs8SYBHH68Jv0okZZ2gPk5yL+na3dC5w/Hv9vHKjuSPz
         poXR61/lytpEHSC20kR7CQ4We78Rbabm7OiyW4SzQ7whwwXRydgr3JpLOHwhDF0HpuJ3
         +yng==
X-Forwarded-Encrypted: i=1; AJvYcCW6KoUbOAW1lOschNItz0CamW2DB0RWoYMZ8sGS8VgFWlg0qgwPXLJFy74HUP3BOhQVLv90z/mWX1gVgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMdLRdrjb5e3/4Fo2xaciUI7vT5/ZuMOSzNqEjGzppDF5NyxtD
	Av3CQP9CY1xu5HjqPNSkGA+j363RthuOcLVJeZ6PZQmInArEa8LtjtIsH0aj8HeBXLI=
X-Gm-Gg: ASbGncv9ZlOlBYu/FHEpgpk2Iu2/wh7gMLmM7zxPtEQnL4nqfHcHiscDGP5HI6ebSAS
	KrcBOK5akR/Pvu8Tu6FdGEhEBCWMDNvGjfxO5OKGFaCTeOPCt9iyAxUuNPQQuMqpGfWHDOJCQIY
	cWQ/8fHWiGZf1OU7gXtYKp5x38qgtzNpTSaK6LlwMfRyDrWp9GRECTit7yQIkUhVoZhgWzKX/XH
	hWiShhpoTLYJztI4f1uuEKqJEJiAQN/d17CAyPWTE99bqwwby+wNI5npjzB7wvAku+csUopl/U/
	qWZTaumjz0rcQz/YNWdNWRmeKsSioWik
X-Google-Smtp-Source: AGHT+IFbXbhXFIU9zLa+fXurTHgYmeXx2QZmDu603fA5wHw0+5DeqF3jW9IscpN1oxDbST4x8Tn+iw==
X-Received: by 2002:a05:6300:6c03:b0:21f:54aa:2004 with SMTP id adf61e73a8af0-21f54aa2170mr4488578637.2.1749412712968;
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee73e2asm3467343a12.29.2025.06.08.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Date: Sun, 8 Jun 2025 12:58:30 -0700
From: Drew Fustini <drew@pdp7.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEXrZvpTD30a5OhT@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1>
 <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
 <aEXBH5r05FkTxpV+@x1>
 <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_125833_934465_254CDF48 
X-CRM114-Status: GOOD (  13.33  )
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

T24gU3VuLCBKdW4gMDgsIDIwMjUgYXQgMDc6MTQ6MThQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFN1biwgSnVuIDgsIDIwMjUgYXQgNjo1OOKAr1BNIERyZXcgRnVzdGluaSA8ZHJl
d0BwZHA3LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSSdtIG5vdCBzdXJlIGlmIHRoYXQgYmluZGdlbiB3
YXJuaW5nIG1hdHRlcnM/Cj4gCj4gSWYgeW91IGRvbid0IHNlZSB0aGUgYEZyb21CeXRlc1dpdGhO
dWxFcnJvcmAgZXJyb3IsIHRoZW4gaXQgc2hvdWxkIGJlCj4gZmluZSwgYnV0IEkgd291bGQgcmVj
b21tZW5kIHVzaW5nIGEgbmV3ZXIgdmVyc2lvbiBhbnl3YXkuCj4gCj4gSSBob3BlIHRoYXQgaGVs
cHMuCj4gCj4gQ2hlZXJzLAo+IE1pZ3VlbAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9uc2Uu
IEkgc2VlbWVkIHRvIGhhdmUgdXBkYXRlZCBpdCB3aXRoOgoKIGNhcmdvIGluc3RhbGwgYmluZGdl
bi1jbGkKCkFuZCBpdCBzZWVtcyBMaW51eCBpcyBub3cgaGFwcHkgOikKCiAkIG1ha2UgTExWTT0x
IHJ1c3RhdmFpbGFibGUKIFJ1c3QgaXMgYXZhaWxhYmxlIQoKLURyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
