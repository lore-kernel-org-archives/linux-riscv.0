Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C9CC7115C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jun 2025 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRD4SAj/eHr/+2B9aVqMlmn7VocGsjYuxfIKwLcV2Dc=; b=SrGiybBGtbs4r/
	DP4xmLTa9Lta2FNmzv4rFjXLpFodL18gnzwBJNbLJvYlo4W87UgiPXUThUV/YNl0tI6UoQvEAIBd2
	TFf888c1xUmpMxC7oGQq9y5k4OOoFRkTeKzRvhqribexIFc4tjPETCl9LrF6w7P0od4VHZmqdQnkk
	jQc3Je9DfWhdoZql2n9hoa91bZtf/hbMz7C5vcNQd69MLUVpV/XxljpMZLTfCgREq6ASISFLFMeIA
	2Q4KpXYeN8r8Ps057fQ0qqJSwuSwYohMxJ1Qx61LeUYPj8Bu0ZHHf5xg494FrdwDiO8kokLVkjnAK
	l1oBAtoQHZmvYyVkWBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxDf-0000000HQYI-2mum;
	Sat, 21 Jun 2025 12:21:15 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxDd-0000000HQXz-30EY
	for linux-riscv@lists.infradead.org;
	Sat, 21 Jun 2025 12:21:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-312efc384fcso329456a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750508473; x=1751113273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJSNLN94yCCCB04rPzGHW0u9z5VpgtHFtBKWC0jstGM=;
        b=lOdD+JBQRlolDEsr0urVXKXQAMp24Y9WmfiFyNJ44+tTyghKZH4fnHNvJ0Ah0KcZmT
         wB1IcEpwAx2TPlx65Ld+2IZ3p7eQ6vvvJyeeBRUoaIcCZGApAP6WQWxEPnQ3X6QFvfJg
         cGkhNvKTepo8oL90IdCqO0+uwFtgrKLj0uXddPob4HonmIzbhTggbmvknPqclytU64fi
         SoBsG0pxvlk/uudH3Qvw3r+LuPD4uVEW8sm6KPdH9kdG9BkGjLJA8SqTmFjUyL9IXMQ3
         EkQh2WSv0LthZ0F1VhhqgyymavyCgCk6sA/5DrYbZOdTRQLGIKuCLTT8MuAfoWP2c+AM
         qZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750508473; x=1751113273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJSNLN94yCCCB04rPzGHW0u9z5VpgtHFtBKWC0jstGM=;
        b=w2C2W8eT9yZN+a+tAJ3G+mt2n4CAXr4INehjhzT7OVboP7y2cu9He2QfauTnKt/9ON
         79beZKZVTP3iIaV6cwDW/md3IaK+2ahlxesKKnMDzYOzKO8nxIIuAFsD69jPf/WKxkTY
         HsSnADCJUA/3QeW2ayV+Es4gRjdrYSquzGyMqCGySSWDaKKb2k20Ufv6RxTpGDExOM8U
         I1klbd5CE8tm4JCr2v/IJg8uOmclAqYPlTuECP+IpEKjRYptCEU8HzdAqpRi0QobLgiE
         KnhIFv2HL+cSIv0fMxIRfkg/TVmqkz/CdYmcGv7Az7SdRd6xDAMY9evZTAz+/Du6D8z6
         q2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVrH3q253AtmHmMUQ3WWWWjbvGhDHHG5VvT1izfjtm44sU2DeXFLv4Wb8hEFpK9zMjYmxkYC7Ljaab84g==@lists.infradead.org
X-Gm-Message-State: AOJu0YygKhhf62LL6BiPIMFGggb3FpQrT5xoAzn0WmrdpJvU+4n46VCG
	7l24CvVKdS7pxMyHMd/66mZ0KfL3cEqCOIXH7VMPyBNmkLKTMvdCV7FgkBAZLzK1pixRjwx4gru
	81gaCaqv6wbehy7/3k3qtCuQqupqTjGE=
X-Gm-Gg: ASbGncvg0eWO9w8P+mjWMopOAC7rsC/4vOGA7U7vtVC8dp1+RJz/h2mXxpubR5zWMAS
	6Sn+tied3LoeEkeUEyu2q/NMG1gzkwhMZc82SKHLA/frx7s0F02O0azqnqh865xyD2nqItI5DSI
	IUFFwG7514Ab+t92hzcPhIbO3WKWfX0/gP22GMMwNVh6I=
X-Google-Smtp-Source: AGHT+IHBkoA8R73wdbCEFSmfGebQhGfDwh3U+PqjqU9Rd7GJGvM7aIk3FgAkUqqEjAXM3xI4sgTT1lGB5ApP/eWh1zs=
X-Received: by 2002:a17:90b:57ec:b0:311:9c9a:58e8 with SMTP id
 98e67ed59e1d1-3159d90f997mr3211194a91.7.1750508472604; Sat, 21 Jun 2025
 05:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed@eucas1p2.samsung.com>
 <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
 <aFSw44++s7xMkJ9I@x1>
In-Reply-To: <aFSw44++s7xMkJ9I@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 14:21:00 +0200
X-Gm-Features: Ac12FXwlYvFTtsebXFsluqzoJQuMLv7aX97g0RdMlPc1xrNUVWgbbVLGEB9yHw4
Message-ID: <CANiq72=YsoFSSm9QU0W2ZQseeQTWFNkXYVR1mODdv3HHg-0PAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Drew Fustini <fustini@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_052113_752406_96E1E236 
X-CRM114-Status: UNSURE (   6.25  )
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

T24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgMjo1MuKAr0FNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IERpZCBJIGRvIHNvbWV0aGluZyB3cm9uZz8KCk5vIC0tIHRo
ZSBmaWxlIGp1c3QgZG9lc24ndCBleGlzdCBpbiB0aGUgcGF0Y2hlcy4KCkNoZWVycywKTWlndWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
