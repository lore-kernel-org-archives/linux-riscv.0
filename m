Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FE1C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9DOkisG/q4M1L9DiJJ8pgSjXDSYzG0MKBXqR7kOkhs=; b=WKcrCCTXApOA53
	fbNdTDzUGVp5mCXavvAQweNXFXenxWb/pBHM9nfX+9WHh/2xtFkBBHC+wnv5mTjfmmZbY67YtdK15
	DUuDJ4m13SacZENQ7Fc1hy2qnmg8CxQIilnxJqF6PoFseffih6zLFVIm5QqF2q67toVN/yyd5YGfS
	Ym7S9W2zuws+JSZ3WQ+Y1sfPSTvahcdAVovk/hEHHva3+J0PucfKpbIlHSLci0tvE25SpvUw2qayN
	K4flsvFTZqn5isA+u4uM2XaYzsHXdIdYenH9frjrN6JwSWVRFPuXE1vh3wfa01Y1Jcrqcpryg9fuQ
	GQFOH8ibE0ZNpHxukvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBzR-0000000FHTf-3qBA;
	Fri, 27 Jun 2025 16:31:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB96-0000000F89U-0le9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 15:37:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2ed1bc24fcso343526a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751038663; x=1751643463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCmaznIAEW9CdV0v3lggh2s8vZKtTSHxMp/86AwX+Gs=;
        b=mq5x/z6blsfMaCU0UNKBmJ6/USZEANt45yILQwqJpf0Moy5hmGiYPrGE1He5KP7Dry
         i0OervN0VgWjMskjjThV4nYMpDd+7V3YfK1tVaTJLy2drbmGlstx9AxvFmlbBqTMjGQX
         2YZfIRDOrK6+MN8g0YlfYFS/vhKTJ+2lu51RTDLD54IX/XzGRQfHXgHIRjsL/7CNl1RV
         /XoLyYqIYRDoJCDUue0szKid/N59TTa1K2oCmAux42C00JYHVRQp0o/CQyS1bVWxJ2rz
         o0pSzC2+t2wDC2mEcJxeeqpUE3qMB8zwdEs3JFx6V6EEnoMolJtco27svQtKszhMBj7U
         jFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038663; x=1751643463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCmaznIAEW9CdV0v3lggh2s8vZKtTSHxMp/86AwX+Gs=;
        b=QOzI88FjCWH/cJnvF3EzKfsqjWgpsRtTNwpIsaakrtwn66V1VJYj2T+gZZ7It9ReWq
         FUTK4/0GwKcbl7KVaBvJ1DO7XOCRJjvMsbg9eM/f/7AzkOJhxSSKCC6oem12Ce+XBV+/
         SQDSsY5dO4ON3g6ssEmyvMAoQLvGOMBBfIB2mgawjsyyRn680d/dHV2tUwLZjUoHKKQ/
         HErM5c0LYK7SCBQlWjQzK2VCGbxpTx8WoeHNSTZOrSInXbkXaEXRqkTYvwNGFUVitRls
         rv4V9ZJfZDKY8MA/VCi8uOjcx0Mdt8YghHv7nJLeAAREwyLAbGa1viNzpnpbt0tr3xAe
         ueRw==
X-Forwarded-Encrypted: i=1; AJvYcCXRh1qffD+41pgSqIn375VDE4+xhiZ7rEWCEEnAsd0hA8MjdzUQwZqDQznGZsIPdRQ9Ql1kgKXxQP87gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvXIXeI+Q2Zs0+N5JOmE6wg27PmsHGpUrlcSoJ4LT+s5E1DEz4
	O85j9H8kA8RB9Qt5gmbra5BjS2B1Jh2JMELFv7GMFjI+GD8RpRFmJXGfEZT41mf4IjvnkLCRexy
	9JGA0V840nj5xRE3iOb5CaWsuT/h9Edw=
X-Gm-Gg: ASbGncsDknVy9EMseNRv4Zr0ODIssdCu56q4Qqj9Di3oCfgWOGWTJUfUHnUAeG78W/S
	Z6IvhlGddtzfzBFaz3D2cJeUwXII0rZI/Pvgvb6Fy5ldGj9hex7Jqe3Zrdja4+aIL8hDf1gTprM
	Eeag0a6ehs/Ouc9g4SmsjMb+kd/LMJI5u03Wb8aF8Uook=
X-Google-Smtp-Source: AGHT+IGml+/wI/ttVJxoSaAeHmsEJgv1Qyo+AziT1f7C4wzb0+XtAzoRAvO/6UJcBeBiENnHea2kADFQnSSIKre+AeI=
X-Received: by 2002:a17:90a:e7ca:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-318c925acf9mr1963338a91.5.1751038663269; Fri, 27 Jun 2025
 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-1-0ca23747c23e@samsung.com>
 <q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
In-Reply-To: <q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 17:37:31 +0200
X-Gm-Features: Ac12FXyJg4tT9bxwLEYb_HLIZtlp-3_A8C-ynNyjXzmSe2QQtKFWNglZwQDRbqQ
Message-ID: <CANiq72nZzuqgNRU7RnUP+D2R+Oj8q9Nhje2XiyauW8Pby6UxPw@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_083744_231310_78AD5A95 
X-CRM114-Status: UNSURE (   7.88  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNToxMOKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEN1cnJlbnRseSBDT05GSUdfUFdNIGlzIGEgYm9v
bCwgc28gaXQgY2Fubm90IGJlID1tLiBCdXQgSSBjb25zaWRlcmVkCj4gbWFraW5nIFBXTSBhIHRy
aXN0YXRlIHZhcmlhYmxlLiBIb3cgd291bGQgdGhhdCBpbnRlcmZlcmUgd2l0aCBSdXN0Cj4gc3Vw
cG9ydD8KCkF0IHRoZSBtb21lbnQsIHRoZSByZXF1aXJlbWVudCB3b3VsZCBzdGlsbCBuZWVkIHRv
IGJlIGBQV009eWAgdW50aWwKdGhlIGBrZXJuZWxgIGNyYXRlIGlzIHNwbGl0LCB3aGljaCBJIGd1
ZXNzIGlzIHdoeSB0aGlzIHdhcyBoZXJlIChJCmFzc3VtZSBjb3BpZWQgZnJvbSBlbHNld2hlcmUp
LgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
