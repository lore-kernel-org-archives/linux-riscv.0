Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95590D1D887
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ps8N/64tc76bEmGfdzVoXusbjrKs5ALJO6cAgLrx8fI=; b=ejvu+8yVe70Aqb
	EqXIb6893BehifjSsBc4p3fjb2JrELDoM9ObIrWPaH3R+T/do0OxdHsHGFZsf9iWu5p/jm0JU64R3
	galcV8UlkDmVzL/uRf+j+CGXTM3KjMTIMu05azNc40Ct5jjQtN/kaWACm6uKuGRGkuUmI8Uz/duLa
	MgM9Jfy+35jTDv0XCg9PygLQJa1tEiQT1m67sqUWOJYoEJjL0esvuDYwvz8JKwYZbKkvW2BWY8WHw
	2e7J9soNn4FTOTwc9Bfj/bzUwc2SRhRbu5IIhvYTvPGMrt9IQCHQKZQezyxue96L+pgmEvQpjVFy6
	mPGhvDD/krfU54eKWvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BR-00000007dN3-3jJr;
	Thu, 04 Dec 2025 07:55:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BO-00000007dL6-3Kw4
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 07:55:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59581e32163so675130e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=Aw33leFfrXd4mKCKiDkjOiwt1FBC9w/TipwCaJHcaSQGdLzlzqqTl7gFZfdj2Al1SJ
         tvEkpj6k3dDfxsnH5H17iHoIlbnC7uGPMue80og8T1jL+dir1zyA07gx/4DBC/J0Phv5
         U+xkpVL55Fn5dyM0cvxf2lKTmrPf5T4fy57NjIYHjgLABV/acMuvBza5NkIL3ao2C8uo
         E1Pyn/hq5IIoRPYgfW89UitQK7V+rZsTln5xCitZ5iLKcrCg2FeFrhJoaEYy+j9hQVn+
         wJXCFGIsQTH2R4rHj4gvWnA+ek2A7eOSM1h7lrDDbkmJZgUeIuyNOlZBhz5/TeHFwGS3
         nGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=nvDdaEygU52lcxqjcdUXp7ce2f+mMWGcJbjxl6cqljZ/5ydWNz5XIE1ZmKmZ46EXe3
         rhD+JLoAgqpNBfGqeo3hMupW+ZbQZdivMPOUbrUliBf2EMBSlWxz9J1Ixig3JANLZhvR
         XygMeWqnkRjzgftZ0D/a3USUhk6ScreHdRbh2YuS9AWyzR7/yKApUhPD+IGhWiqp8+mo
         dfgsW8V3Wi+Cbv+nbu3BjjAM+rh9qz4xL1ZaHX5U0AfDm6MBcufHLoTvn3ETZTqGT8CL
         CyBowtaHJIWiBbOFNOuR0UcyVLmLv2vVZjvlTwAFE7YonrYposNKdJjwcBFieJNMiu/R
         U15w==
X-Forwarded-Encrypted: i=1; AJvYcCWPAHjroqQOpE7T/5B7/HqxOtTNhW7maPybUQESW7q14vE6olcsPv3wSM/fszN2nvuW8YafLPjXJlnoIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvEoly7ZDVRRP3XAoAkonwXD20pmmU2YF/O+xYD891lUM2JAUV
	qEfS2DCXbC6FRURYhqITX/Bm/bmRL2pmP0iHXr7KUwnSHwheE55ZctWF
X-Gm-Gg: ASbGncvHgfCXjRyMqLELo3TmsUvIuhkXpIC1EOUo0AilmQoE2EZ2S2DX9qEiVuiDfJN
	UHcDFNQ1l7/3BR/fQPcGAezRB8QFTtBleHUWGwb1aKMS2YPwDsHrD1ZVtC9OpuVNG/Aqboe2Ez1
	JtcUotruZODtQzjVRE51et85IQyxco8OjqRZ7ZiKu8tRA4EQ5lyG4FdssdYzD7H4AkJijqZY7Hn
	UYXpCmhjMTpMesQfGPimiFxmdAXBrGy1U49ZpRpNiITuVt0HjBsDOR7p3qXUvI89X5ugEFesyNW
	eZvDZsopONZV0TuSQjUuqgCkwzsFvvHO7lPRfc28BmHAMztexgdlo/YaWZOnprOwvnb8csfWW5y
	UcDA9r5kj1D4PTeAZK3NbGmzwch0voK2bUpWT1RPA5iBpIpxtHefIi95gmOm672EGUonbdg==
X-Google-Smtp-Source: AGHT+IGspx1iBq0l/KYW0BPXnBTjQSmqu1QYrFO2QolLF61uEAVSaqBKv7zpWcBgOHbRwa9f2MaI2A==
X-Received: by 2002:a05:6512:684:b0:55f:4f1f:93fa with SMTP id 2adb3069b0e04-597d66f8a45mr630014e87.42.1764834920536;
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:52 +0100
Subject: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
MIME-Version: 1.0
Message-Id: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_235522_857977_1DEB2D1D 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Asuna Yang <spriteovo@gmail.com>

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Before this commit, error messages might look like:

error: unknown argument: '-mno-riscv-attribute'
error: unsupported argument 'medany' to option '-mcmodel=' for target
'unknown'
error: unsupported option '-march=' for target ''
error: unsupported option '-mno-save-restore' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
