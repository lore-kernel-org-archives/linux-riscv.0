Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23590C43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EwIyCCph3ap9Bc8dTCHbh+HvxJjekcSCAfmNU2Poesg=; b=otPLtgHkkity7/HU7xZonVQ3KT
	R7dnd6WAVLQkGFQxoAZoroFwME16eXjHPGe8PYWyJM5AxwnllUD0HBHP86TnlNTzYWZ6ygdPPaYJ2
	Wz5x0aeqpL1MGUtS6gbd4VOKobc47044NeNDL6rwCbDQBghjJzFOcXTYnioOtYNtC84CUPij3k2rR
	Ekm6OaMaSf/GP/pAzUNsC6Kwk4wePHc8hVG33Xg53TfcHKCzGb+Ee5q2xGrSUTYSVGFzIfv85qIbK
	qiJo7p8Hch2MvET/URiXTozeuPbmpU/dmFeTgbpDQXmVBcD5EAY2cxVDc9uUMOBdKovNRCzi46+rA
	odKweRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLiZ-00000009I7b-1HJN;
	Sun, 05 Jul 2026 12:13:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLiX-00000009I7E-0WAK
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 12:13:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c988e16bb3so5122175ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783253580; cv=none;
        d=google.com; s=arc-20260327;
        b=XH4Xcm2KNVJjpRlmLp+WAgqHdbrZFjAfJQstAAe9AD36ln8zjA3hI+G+dfcIctfp5U
         V+bLmcZo+bzYPQ33fCwK0pNTDURvRCl0mRwQYPq0MISz/yD3K1oT/za/v0fWevUe2t+V
         DQeQrFpLUB6wWFuqEJwv9PFR4TG4xPuWhp2njzUvzcR17XDVx4ocK83JtBv+ny7ayeLV
         De5FGauHEl7H5OcBihGsJnD1Xt/LH/61w1sJOUMCMbWUaYsF+vuarpCIG0SmR7u75knX
         zIcJ6y2cj0CsQA/qnQM3y0oj6sdyh7lrad6rqs5+n8yJDJ0f3Iy9OPlxLfckTZOk48Ch
         WG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        fh=yqqMuFNLg1TTKdaeu9TpNmceCdT+WkE4k42EqIpv4Yk=;
        b=e5vlaNDbEEPd2t7/qP2OWOh0t5EC5d+PqQu7uoxtIN/zzxoGb3G4X0bcYgWiYMSeai
         OqefGBw58gNina2/sb3Aw8Jy43a5KsEmNf6xSq3ro/r3PjCt8JSOYo6+CoZIgIAi8oLd
         uSr+vlPxoMAWUGdcXIHPk/rCeg/XrH7WGT5erzGSvdZtaynZSqQOl4WYpGhHFUxB0oe3
         1myvK6FwE/DmrOrFbgjxusSx8VVC4szwLPQIh1eWPhMcZ2EEUqS9c0VH8RJGZ5w93pNG
         JyL12jupi6hBZzcGA6LtCMoRj1FzoNsM2Sm+dmthhdu0heeZUbySQBsxmvvJN/v9R6mY
         zQxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783253580; x=1783858380; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=so6wtm/hsXvMfKxV56vQYJnzPzbe+4e7lwDTNl/Nxz/CwOt9wub1G4ofABViTAoFI5
         Gtb5FTWMuXoPGSB880qk+RkfnT41q3Ch/5ew5MQ+xdvFyxyCGSeVpo8GibMFS68n96N9
         skCiHnRr/sDDdLvDJD30nFzD5DRVHekMrm90/JJePDcn/PWKfi2Mvk/a4FoFaI3Zuqoz
         yivhR+Fbynlw4pg4QVQhyXZtfJyVRVNJkJAPSZqyI0UY1HsORNKmGFOzqvWOFp9+7Z1R
         URZBwJZaMcQLAw7db660ng/qGtcxIcPi8hcwIJ+SmtGJgqYqUyC/46JroLq6Tf/6uPGw
         fQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253580; x=1783858380;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=b8ci6QYE4eeQ+7Y/KCEjqfy6gCsuKdj9bI/KdvsmEBnCZ1Xb7BYplFK0ge01f3l3wu
         lRdVHXJxy+YGGP8EXnRAB7DGtXzysaoJC6DX65eXG49p6LENzopvFRQww/ufwJQ57S88
         K8NIN1RsHad1rOWLHBq3mESWKAoX4F1sckmgvH459TdcN8zr0zZ1GWQMFMa+0/k1qZhg
         8T4oQ/cyokpXMfPAKx1jLir22qRijpkmA60zZKVxWyIBdoSXsTa9x99PQmHKi7oB2dmQ
         SYFoEKFJaFCr9kryBNL5Q4AQCyRRE3yfc+ZZGFVEFQ5QSjzbos3mhzYnNOPHB9p2yrw4
         ue7A==
X-Forwarded-Encrypted: i=1; AHgh+RqYxiI3i0fWWkUkt8p1F2m/QWUtnMTPS8vx+q2b3vJkWk+gEPppIwZe9OgOLFoka2xt9FzLXtUZl6aSdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxju7G6HOc8Y4dUPdGpIvLf9+tFtSbDEnC/S9dZ3K3LdLBfdVwS
	QlJ1alrcYx8Cymh0uEylRRVNtYpbqDnYb+bEgog/PZFHMGowjrdo/RQ0Rmtty73aQ+IFqyHq2bM
	ntbdQiricMoD9Zn9GIY70qN+RHDIW8+0=
X-Gm-Gg: AfdE7ck2HYsGVcoOcEsV8PikoJiW2hohe9jD3R3Ogaz1DRWOAxPZAZRO4JsythKNGM3
	VEDVrQRhMOR36kgPaVUx264vgfhZE2l7TeFUH9aWgUV0fU92EvJYIDiV5k7YQWxrh8tx3mPY/es
	Hm5glnxDHuPSxo983MGTyD8T5XcRsOyK4k97gRf/6yp9KCb88hq2djsskCVV0kW/YMRb4famlHu
	dJDEoL2FQLgaWzz8M+zuFzK8onc1nmwlInARoQvD47u01VJl/dOzruIWtT0OkcZk4MGypPjLZx9
	8SqMU8CsDMVll/XYN5QMJhBrao/53ill7GIeIi0a5tyXSyxO/9lo9w2PjSHKjgUrgsL8Vw2HwKe
	6CBKdPPPdL9N6
X-Received: by 2002:a17:90b:268f:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-382802beaa9mr4128789a91.1.1783253579563; Sun, 05 Jul 2026
 05:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
 <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com> <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
 <akmtA7EbVBdhRAOq@gurudas.dev>
In-Reply-To: <akmtA7EbVBdhRAOq@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:12:47 +0200
X-Gm-Features: AVVi8Cfl7DMeNQYuJP9tYThrU-TabLAul_khYoWVx5WCyAQG55ujZm7jKpKar4U
Message-ID: <CANiq72nESZyX95XSKC3zaog=XSQF09bYJmre0mUbtQ42-Ly6tA@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_051301_168835_BE6EF3CD 
X-CRM114-Status: GOOD (  10.11  )
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

T24gU3VuLCBKdWwgNSwgMjAyNiBhdCAzOjAy4oCvQU0gR3VydSBEYXMgU3JpbmFnZXNoIDxsaW51
eEBndXJ1ZGFzLmRldj4gd3JvdGU6Cj4KPiBCdXQgdW5mb3J0dW5hdGVseSwgc2luY2UgYGltcG9y
dHNfbGF5b3V0YCBpcyBhbiB1bnN0YWJsZSBvcHRpb24gY3VycmVudGx5IFsxXSwgaXQKPiBjYW5u
b3QgYmUgdXNlZCBzdHJhaWdodGF3YXkuCgpZZWFoLCB3ZSBhcmUgdHJ5aW5nIHRvIGdldCB0aGF0
IG9uZSBzdGFiaWxpemVkIC0tIHVwc3RyZWFtIGBydXN0Zm10YAppcyBhd2FyZSBhbmQgd29ya2lu
ZyBvbiBpdC4gTW9yZSBjb250ZXh0IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5n
L3J1c3RmbXQvaXNzdWVzLzY4MjkKICBodHRwczovL2dpdGh1Yi5jb20vUnVzdC1mb3ItTGludXgv
bGludXgvaXNzdWVzLzM5OAoKPiBIb3dldmVyLCAucnVzdGZtdC50b21sIGFscmVhZHkgaGFzIGEg
c2VjdGlvbiBvZiBjb21tZW50ZWQtb3V0IHVuc3RhYmxlIG9wdGlvbnMga2VwdAo+IGFzIGEgcmVm
ZXJlbmNlIGZvciB3aGVuIHRoZXkgc3RhYmlsaXplLiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFk
ZCBgI2ltcG9ydHNfbGF5b3V0ID0KPiAiVmVydGljYWwiYCB0aGVyZT8gSWYgc28sIEkgY2FuIGlu
Y2x1ZGUgaXQgaW4gdjIuCgpUaGF0IG1heSBiZSBhIGJpdCBjb25mdXNpbmcsIGJlY2F1c2Ugd2Ug
c3RpbGwgbmVlZCB0byBhZGQgdGhlIGAvL2AKY29tbWVudHMuIEFuZCBpZiB5b3UgYWRkIHRoZW0s
IHRoZW4gYHJ1c3RmbXRgIHdpbGwgZm9ybWF0IHByb3Blcmx5LAppLmUuIHlvdSBkb24ndCBuZWVk
IHRoZSB1bnN0YWJsZSBvcHRpb24uCgpQdXQgYW5vdGhlciB3YXk6IHRoZSBpbnRlbmRlZCB3b3Jr
ZmxvdyBpcyB0byBhZGQgdGhlIGAvL2AgYW5kIHRoZW4gdG8KcnVuIGBtYWtlIC4uLiBydXN0Zm10
YC4KCkkgaG9wZSB0aGF0IGNsYXJpZmllcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
