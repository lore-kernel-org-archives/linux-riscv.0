Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77550E9D800
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUi08E0JBsV3TJodL4aAYOvmleqLhTbZnqx9RGnlLCY=; b=NvE3YHRsg4t+Mj
	BKkR1cjl7KqyDFJ9leS/6UI+14WrkSuRCYCXYD+LhgL1SYBzUjLDtM7KtYegrQjh6rlqH7bTsF516
	TGGsyzfrPaZ3OMv0Wud5SmV8MkN3JRG+3t78LXp/zJLKwXARw4HHgoiHSF7x8cgAwh1V5TIFQho7c
	azMfVBuEDVSX59D3BYJxS0fPood+nho6flP8uQTh7siJL7fvutwpvxU4mIC5TwizXOmF57aSxn3Qy
	Rj9cKK/qNPuJvSl4XwcY9RgIlmvoj1jd0CNhKcXujzts1CiTD/ctF2MmkuXj7Cdt6yB0pA3K0Lqfj
	gyuC2LBgmeqv5yMlw4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TCX-00000004QW6-2V5d;
	Sun, 05 Apr 2026 19:32:05 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TCV-00000004QU6-04AB
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:32:04 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-127148c2112so185050c88.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=BCKAc7WttalL0OJu24Ef3j+gdUidLQGo0MvXIP2YZgkV1ZS/WRAgfTtVA5xciB9b1o
         8wKzD3P6zE0J5YuVgLxQyMw8rEqU+L93KixG87u/LWA7XItnqpqTlJcSxxtNUjbTlFDh
         /QR0B8vf517ivmEph05+lqN/wvXXApMYYHHR4XKUwcljL9d6gn8g+dEpy0lOappOp5uz
         rfNwxKyb9Z9t3LuOfsMGXeq0aITWYuedh0OgVi7MbBuRDVoAdH2SNAlZr0zfkMA8JsX3
         MlawlTWNyT2DpADBXSYxqOhKwKJvFf/0GdleS3eAA6yafq9A4dEmsWPCY8IHrWBhB84Y
         ftPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=1m6yPR7xK6PTZKri1GLW+mKnRBjWeWaYywvN7uLM+b4=;
        b=IaRopMAT7w2Qq6yOR/04NgpNqlRrsNOQE7xgRBNm+pQ1opBg9DhzRqZdWQm0P5GoxJ
         ogdW6rvfW9jWyW7PWg+rOA1XMJGyc2wHAHjl1WIcvXpEBWVUNp22BuM85jCzTejYIZUj
         Eil2089MHHGNue71i6D4Vjz2xxh+t+np4TBIi36SP61OycSXVHnHZEbwvFUTAdo2mu5F
         GxR5IsHvL3nXrPcA2u9oR3428NSjj1I6NkLokWFL84gxaJvrGO667SdnASbTGpJtDO7o
         FvvF6+WB8J1DWsxooQJ2TzuPAPWzUMLsisebCGh2MAgGcNf9rHQya1cwqq5AM1Vp10LD
         IuMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=MLPme8Q8MT6MvTD8obeAmo753QtYIn9v7/NvefZJQfDjL0L7SgDPHHjlY/TQzTIPEc
         3+/yYh5voSV1l47yr1hXCN3DCNqHxF3tdN5o8YdpS80IzY9dTjWkr5k0ky+w6TO+NoFN
         nfDyOMQ+Za+DJGAJKEkr1m+nj14bzL6aa3iiWlFgtIZhGT7snM2ujGY1XRHEzIAD/ZkB
         O5kRwiY3B6rU+o+sNpMMSWMg4ZljqrqXFwYkxjjLwiItJJ/+aUX1koRCMDTE2SVMvCx5
         90KMecjS03CMrpf3inHWwsBUKoWXxoszUTM08djZluhm9AOFoXd/LzYSaG0GD2tmWJba
         tB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=nxGpwLDHIIEG5eeKg24LdUEBaGsjbvNHH8kS9EKwMk7y1HuZRM7yfT/JJ80EUtPaTc
         ETILOXgwSVgAWmZzq1wpE0saMweTYOFuNUfeutal2ZHa0ViE9V1PeCcJRv0G1ELrrwge
         IS2SxLlPIjEOeWObAgoKlUKzgg9tbQmrEgP57hyb8PbZxXLKA0coX4fB7OFIzIpKbmMN
         mGK7xEg8U0I30K/0Quo+BgEGvfD2mScbUw1Bg1EtJJpdsL/QvMG8ASzE/MQJ5Kwfle8Y
         LIC/LW1wEaa6vEBE9UB86Y+58goUlTP3FVwZJIU1QkMQvFHrBPGZAXJoUjPBDP91GG9F
         lEWg==
X-Forwarded-Encrypted: i=1; AJvYcCVekQOA/JDWMRzC8nYq3bexs4X6dEGdR2Ch8Z9uvREkW/H4jlx8f35ZadX1SMi/SKIoFiYtJYh6tLL3Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YznijYhw91jBvz9JAr4Gam8QP0f/It8phD40j1TfxpwNYQ4L4hN
	lGhCXUrn5xsLG5qZzj5PMY8+vJpRtviO5BVrbxR0E5RVHQ0TR7TPmBBIzBSJMAiijkE3LbtlDRT
	r3ltWTZlQ5IefUW+2ODM5cC0Joq09CP0=
X-Gm-Gg: AeBDieu3ws7NWc56Rojut3Dp5Ye1pxSE2PGRJ9VO0WWh7tHn5I0nUo0blEiQO6IDTI4
	zxasFZfSk3a6yAhhX5QbnE1VI7UA9h3n4JoxURLEFGBzQuZRmTzi1xIB3+a64qWcP/HDKEAhLao
	PWO5yylJwDOujI7he//FxyfX/jFLcjlhYmNNbFu/yElsxKcnkAqlR7zHzMat7sxFaoOYjdQiDOc
	xbqQbbq2hRiM2HI89mil6PEKcVP7b34+i+Sd26zy9SuBfHoYdeCCtulEyb3TDQdcwNq7HmD4UDv
	Pudp/z6IrrCwEvrEKN59JDEJsuyW+X50fxd7yaUpNGkS4fQtp2VV+wXTQvVNJK24nTsKAEgUS1G
	UhJ40Vxt9nW0kn2/9BtFSMiPwnjKwkPem5g==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
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
X-CRM114-CacheID: sfid-20260405_123203_052364_10CC9FCD 
X-CRM114-Status: UNSURE (   9.36  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxOjAw4oCvQU0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gU29tZSBjaXRhdGlvbnMgcG9pbnRpbmcgdG8gdGhlIHVw
c3RyZWFtIGNoYW5nZXMgd291bGQgYmUgZ29vZC4KCkkgYWRkZWQgYSBjb3VwbGUgbGlua3MgYXMg
dXN1YWwsIHBsdXMgYSByZWZlcmVuY2UgdG8gY29tbWl0CjdhNWY5M2VhNTg2MiAoInJ1c3Q6IGti
dWlsZDogc2V0IGBiaW5kZ2VuYCdzIFJ1c3QgdGFyZ2V0IHZlcnNpb24iKQp0aGF0IGhhcyBtb3N0
IG9mIHRoZSBkZXRhaWxzLgoKWyBUaGUgY29tbWVudCBhbHJlYWR5IG1lbnRpb25lZCB0aGUgdmVy
c2lvbiwgYW5kIHRoZSBjb21taXQgdGhhdCBhZGRlZAp0aGF0IG1lc3NhZ2UgaGFzIHRoZSBkZXRh
aWxzLCBidXQgSSBhZ3JlZSBpdCBpcyBhIGdvb2QgaWRlYSB0byBhZGQKc29tZSByZWZlcmVuY2Vz
LiBdCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
