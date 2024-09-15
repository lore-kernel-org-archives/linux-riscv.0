Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E203C3ABA3
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 19:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx8YocKOWUIToDKgyUjcyIKg2dXWhgXKtHh1hUrvgtg=; b=wRgFdfgWNGZLXn
	HSIZq7bBtbqTTfLPO4pGRFa0Y/RwiF8FwZjaGnkPIU+mfUrxlJs2YtmZojjWTWifg10JR5NobaQc8
	vknjuRiDcTc8Jdt2Ch6aqfzrAbPirnezb8Xkj+YsEMNr8HwAr/pF3ozHNHxcUp6k4MPDadHQj4uJh
	D9jdF3mF9MTH8UY48xjz7901e76Jnlan5TQ5QVUzLMGJtgjmNM+tgslowpUiTEmIKLie42f5fypmg
	C7Ekv+4tqyVr7vUNyjffSGwiKqIYS2pagNGUjYwX46k+Li86arJO3FOJRcWFmCbpmMyirskSYF16F
	TCh/k/wA/jPzLfuRYPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spuk6-00000002YZN-2AT7;
	Sun, 15 Sep 2024 19:17:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuiz-00000002YRc-46t1;
	Sun, 15 Sep 2024 19:15:59 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d50ac2e3f8so578585a12.2;
        Sun, 15 Sep 2024 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726427757; x=1727032557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNRBqTKCLNDFBOpyROD/tyxwIsQ0nHuHbMhbWiuk2+A=;
        b=OcEefVNJkzzfVj2oED/NM/HiP35FYdK2YiP3QXLws6uc0AHxeKz9JnUBMiFoYdnSiM
         DsjfCJt888jWmd2njpRYdmr97y03x1461FPnhBi6G1qUffmnXYaweeKYZWLMG/ROlpzM
         bHjZr0aIgC3ZxQ+qASVnlKafBuTnSzv4x6HPGb5SRvRudmZ9DwMiptwNLIK5cHapSarL
         bnURxOTXUqlgPpu5r2VBlmRDeH1XbPQAjkUSIUUXK4zTJ2VGcTl4DMKOMOPkgoiJR9+u
         INAw7M8ZWDa+eSx74sv8nVmgkJcSiKsrzlpocAyBnXyh7iiwIc8BI6cBM2lqvL4dwBXF
         l8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427757; x=1727032557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNRBqTKCLNDFBOpyROD/tyxwIsQ0nHuHbMhbWiuk2+A=;
        b=ShpUcQk6cOV6VojDOrLD/qTx7/UMdT50ON2vxDhxTyno0WL4NMmkAyDsRQOMe5cISj
         IZu1yVK5nvhtY554rRVfw/jjUNLMxgnffyWjbwn99shWTxrubrxn+jloT5/xcYoPIxDU
         YY8qNZAluJIS7GVIsP6rsXGolRbfU0vWHPXNDDgeBdjM3sqzkxOAZ19Oh5aozrP/G4pC
         We9662/YUm6ngK3bte7sbI4Z0d42DJPckNOOGfOD5hBgqt1THlYIKDas3pWDYu444FwT
         ZsCo4t+RHKQsjg0p/2ZfVTVWotIzXrMxW/dUdKQl6RPO3GdkIsdvFNjX6B9MDPMaj+kL
         Hksw==
X-Forwarded-Encrypted: i=1; AJvYcCV6DLr+X4YW3yxK7hddQ7pug4wxmOk4mWo4gNOP/dknRDIuGolfMQkPz9hq3OhAoWL3TLm76V3FopuIYoA=@lists.infradead.org, AJvYcCWD0rmBWnz2Iy3n+jplK4oAssYpFDspIsM1NuOVckpW401kjzCYW1wn7p9CLCFgHAfgc28YgINGDGE3Zr7crEEP@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFoPXSC2GnX4iChoKGEEZDvPzZmt1YKMSvyUGTlBpGzO/nXZu
	L6kfv2tQ8u2PEltwQIao8NndWLrUHe4r5ps1iP0HxXt9MVkKx5uhral6b/R7MuUMn2L285WRjeS
	vSrNrTHOc3WsR7OfrshhiyHMHlZSQt6JP
X-Google-Smtp-Source: AGHT+IEZEaOGvWfSQ1PMkaaBAWgoGIZZWM1FWt0ex2FWLRyvw9E6qDkHeoNUZf9rNRieQOensoOlHkvZ8E1ihKB6Umk=
X-Received: by 2002:a17:902:ecc1:b0:206:a027:8aa3 with SMTP id
 d9443c01a7336-2076d6141a0mr84892845ad.0.1726427756913; Sun, 15 Sep 2024
 12:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud> <20240914173037.422902b9.gary@garyguo.net>
 <20240914-jitters-barber-a0e51e7b83a8@spud> <20240914-romp-clothing-965a16cb4dd4@spud>
In-Reply-To: <20240914-romp-clothing-965a16cb4dd4@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Sep 2024 21:15:44 +0200
Message-ID: <CANiq72mb7UVbeH9R3t3s7U3tuJHT86FFdsEB=v_x1KKJV9uvgQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_121558_044596_B61EAB6F 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBTZXAgMTUsIDIwMjQgYXQgMTI6MTXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVHVybmVkIGl0IG9mZiwgb25seSB0byBmaW5kIG91dCBteSBi
b2FyZCBmYXJtIGlzIG5vbi1mdW5jdGlvbmFsISBMb29rcwo+IGZpbmUgaW4gUUVNVSBob3dldmVy
IDopCgpUaGFua3MgZm9yIGNoZWNraW5nIHRoYXQgLS0gSSBoYXZlIGtlcHQgdGhlIHBhdGNoIGlu
IGBydXN0LW5leHRgCmFwcGxpZWQgc2luY2UgaXQgaXMgdW5yZWxhdGVkLgoKQ2hlZXJzLApNaWd1
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
