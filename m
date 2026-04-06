Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F87F46C46
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ffgl29sqzzHR2g40V7YfTwfhkCbm3uhXbPduKwDP9k=; b=kFbysL+yWxONPx
	1ikGMqQLNuZ5PPkjGEeRMIqMOZxgU7KfKETgg6xMWOzvsOzLYrDEq5CS8Lv5zhuMKLxvv6FxYF73O
	o8EwaybFq2eYTIDKH59I/Q6nVwD57/3yI96+zjICJJw+Jgu3hYlJmBsVvFsOusAvnedDxIwPnouAB
	g8fPmMuUKMBpSmNiBodOzbZCOvU14w6/qdKCQXWD7DLUUZdxWewOfPESCtaYWkT3yKr+BoBktRV3N
	THJY+5H+kI3Xe5WrSr17o3ME8Y6VyepHIWeJ80lTJRHWzNsYJmqt/Rkk5STLiNbgsD/HYua48LdQg
	JH/9Urst88jLC9P+9WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l5c-00000005Coe-0Clj;
	Mon, 06 Apr 2026 14:38:08 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l5Z-00000005Co3-1adX
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 14:38:06 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2d13cab02d0so2844eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=jJDWQJvBVZcprp68aMwMMKxhYYsgc+cSDwaZvpKXQB3A0piuSdfBt8eG3OngENF+YC
         RmAabz8z+HUdGTGR/A/WXfL55pdg3eFbgZ6TVAbi0c6WbELCt08ENabXeiNP58FrSNNn
         h3ZgeD819WpXUFx3+MNY8p1Uu6jv8c2elbqAuhTKZ2stz+SctL3ntlijMyJrTirHBYpT
         Zff6nw0gXDcvw2HZaQv1P7sVxQLykMDMi8I6/Kj3vnicwOJp0YEpxoCLSFzFeZWEDOLy
         1gyrO1x+dqxr4Plgt0ed0YJbz4N+tyNNOVSzFzH3rsNoVXDGVBOtXyeS3en+JkTBb9/5
         +6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=7N1U7tX8O3dCTLxVfS8HDPM2m8vSvL/dvSsIgODkDzY=;
        b=ce9nVI7rK4qz0PS6p2Ar8KAK41CmqLFvUcVaz+V8CkTyxjZ3imUgx2WIMlGKCnydiZ
         dzQj1hgl+nodMMdx9YaS7SnXLweg9jP/a99Cs/m51bJR6a3fm/7IzCMfQG+7Mgw2lJL4
         8WDFDV7/pxoy7H1KiJM485nYlEX+cl/Hyia/lJX73Fy7Wzs/2sLPN/ucNzkmlCkIGj5u
         kLfYhXci7DaFUGqBdQpaBv7wN6Wy4zyHZTy4S9UBdLPA4X5PbwoUZ5onEHjQ9hYeJeZU
         4bgr6YhdxXSujID1q7zAOJHV566ZvXWeUQrzr+6KPSV47R3y1mt2K2zBGFXoNZg3uDaN
         TYww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=SgaXmol4Nah34qrjH7YaatzXN1WLz7lSxkTg8rPxVPdeHCNz1IpZ4PBiP/lNUo0uAY
         XXOuewFM3HyX57XbnF5G8mjsJlvZhstDIaUMjV0QuW6aljB8iqfArX2OeFyeHs7PN/Jl
         +uRcvhlCQRBZnoRZxa+1f0UaequOcLp5MbhE3oHpkZJQH1JcXbftPB26LhznYZIf/Y4N
         foSQNgfQDuRRTbgbvCM3fClHNvq6YcOxOTZM7SiGwisuaGSHLipQH1V/rCij1+PNeFpC
         gVnQqA1auxXn8aGSJmFWmSfwVMsnPG9hpqI/CM802iQ1BbFZAKi6nLR9hNmpgUSR4SHp
         9lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=Tz072Nr6dVoV3O94C3mW840H2e4fC3UISwne3f6FaNAJWhx12h+3IQEd4g0CgO6078
         GaX0wC1oy5JU6ElbpARi/Y/IEnPnNVYI+7c8ICAJP3m//yD3+joi+ba/zE94O5QK7maH
         KG9XmUBGt507VCcLeOHR8vtcnROZrU/gbl96zUQl7NjIaIHY3YtqkACm6s+PR12Wo4Es
         IeW147DLmZm7hOqAzPtsTvGSUZePASJUH4MHPqJQkZXNlzxBQDg2a2nokP2Yi9Bt4HGP
         LrTGJWYT+vUBIYbOvtRx87qMpPTCsxrx9O/Q6EzAreS1QVwF6+vUI8Cv6legqhDDQ6wp
         tglg==
X-Forwarded-Encrypted: i=1; AJvYcCW7lzv9/lJPOhmGkMi777Qd1qoCv1Ap2vZ/30Z2VsXORJzpCfbj2Nh4OO7h24SE719lZzzjx+mwzF+NdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBcUBNYHt0QPSiDbBFz6XyqWQ7z0Imkelde7x/f/CxW2CLoU1A
	rusmLRL/MjY2oWCCnOuSs4HikP2AsuWPGdnWODwMv0iZAH0KuaUQ/GsGwh2WPUB71jimR+gjvq5
	l9YiSuaWjN9SOFhdCqUf6EJ+fHnjReQo=
X-Gm-Gg: AeBDieshHGveR0tokTJz2AvAHwsklrF/PojF+ST/aZtUDu2vBIn1rCiG7yHrj2F42yb
	T4O39fQS4z967ySbjKyAZLe60nFmztVyrYvmxfOlW5VzdnEKsG8aha96OukOuz9IH+vTZAkrRHg
	kqKINgpVHpM55xqjI6DkoSeDrFS90rF6MNDsuZkAYJE868Uf1vRgx6zIm4k84zsbo9uHlDxYOBO
	qy/LiacKV0H6xCw7I8ru/F/4m10uyh3kM/q91MkhuPKdGxL+aAHpaNQlp4Qd4+qxW7zkkAiJNdZ
	m/ArN4DtJpr7GXtPrJIhjPpastlrT1jTkFYlwV5EgkDngI/aCfMlhMzHSnq9QIXQutQrmiay41c
	MjgUE38Q97i+BFunwt9wwYeoucscYIg6Snw==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_073805_419596_1343DD6A 
X-CRM114-Status: UNSURE (   8.27  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCA0OjI54oCvUE0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQ291bGQgeW91IGFkZCBhIHJlZmVyZW5jZSB0byB0aGUg
dXBzdHJlYW0gYnVnIHJlcG9ydCBbMF0gaGVyZT8KCk9mIGNvdXJzZSwgdGhhbmtzIGZvciB0aGUg
dGFncyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
