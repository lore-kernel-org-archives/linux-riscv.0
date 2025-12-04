Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C33DD1D887
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMetP4flndfzH1TfhfDQ7iRLoid5f8xBtFtbn++7Mi8=; b=iQ3bey5HiUKvKX
	JTquPsssfFeOwRRHHUyo/JnA+p6X5W8BNP5Yly/11A/gRbkC9/Y9gmp3LdkWaQSkuL+58CrYKfwvC
	UCuVXXOYFxp5VcoYLEXjKByprUbt4Aaa5oWkQ3hn8BqCSSELVT3wr5aHMHe2jvWZ+tsv+sJroXPvJ
	iuZNNfWIZsD7j3jkdETq2uEPS7N6sXUO+vgcVoStAoDBX3mDmK0+kuLg5sQhmzbmsVo67LSSB6QSY
	YF9wCWDmj3fjpmNrlvRpAbr0dL0ifWHeG6KITzXYlW+v2y9jaKz9SBwhGGy0D/vQYp+xYZNYW5nFa
	1nuYPhzREQrVqG+tf1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BR-00000007dMu-2InQ;
	Thu, 04 Dec 2025 07:55:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BO-00000007dL4-2odY
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 07:55:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-597d712c0a7so362371e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=MMXxboVA3sQ2B4/Din4gJH9gXE0/adwszMTCf3DzCEjDfDOxLFq8mw8+xhYYGPU4Yz
         PRDKys0x5caq04ssDMlhuAF79Njn8HLKK4sIeGs+5j83NP9/EWpBHPXZ+PkucazGrpzN
         qfHEi+hABuuxSf+3JR3g4NjNUANT8/xMP6A3B8v43qHW41IsY4w9wzVCRbNuJ0ozJzo9
         l5KnN6WsC3VMfnG5tfEHP2nnIpbJM5FPhMb8f+Y5eLuCulNBqKpE0fostOSZUtrVPS3x
         KJaEZxaHbCX6PSr7VULZZnvOTRj9v7tP2Ysz1KVBNF/gDOsOj3xOi2cah/r9kUG300b8
         47Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=pUTw69yCBTMa4w5VBoUjpcH0xwMWBWZ7pT4qhgtQnjhp8/2pziGJnd1BKzYuzVfeUH
         sRwZTbuXFjTkVF0pm1ySAm16yCX31bYwpbfs8jjR/JoVGTcWPAb2a1NoSL97OJQCcQTh
         RAbiz/cb6OSdwZzW9DdQPI1ctsejtR9EzSaJqh0YpWIYLwba4odR8XBYxYfWntB3MWFd
         uAnig6T6ARhetuPUOlKl7/diRZfJjDOyEUC4wEGLakZJSuF0kI9/749d//a6EXCdki/E
         UzamYFF1Mj19lrl4P4LoCV2GtDx7XY50XK7ERIUuzxODYGuI6ZcL+sFwypnH7iYLKEJ7
         lcCw==
X-Forwarded-Encrypted: i=1; AJvYcCW3YWQcnwsU7OaPLYd6KR4ZKHN75VfaF5xgK7FRk/jN2Ibi+FRea2sPpw4DIC7maUDGUh2fbiqIXpKpUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLox4oywp9aTH2Ou0uw/GlRB3HUXyIYI0zOm4Ep4cS0/AvRZvM
	aUQJ0ASpuTiEo6m2NsI54k4BVtP5YHiL2/WQ/g1ftig8jOJkGu9sicWJ
X-Gm-Gg: ASbGncu1x18iGqNRO1XCluFy+qSLZueapiuI2k0cImQSLhI1skz278T/8MnUFze29ih
	PBdQf/FfK0YCUu4rjiA04G8uFlFQzPhs52Wdu3O/00zFGicIDGwY+npgYLeie4guZtXOZM0R7ZZ
	Ph9wTTogc3ysgg0ut+OwJSsVT3gW+zjDrIUXCzB3OcLxlIN8qXYzdYhZh6ifc80jufQQUw/rkpK
	pIICVUOdVKp4OnEYXNNRhwR2ZJSzpQFZ5qvgAW6xxjpbf3s1rH8e3xNKOWQK2dN/ounTCRMGHlC
	ppsbVpj/04tq1t9QyeH9zMxDGlZKaIdoXrN8P+NR+HH/q59V8407Knk2LC3SXiIb5BAlLAW/xLm
	exJf7N3MBsqk09sWb1Da6YaCmNdK7HonXj6kAXt0v23xAKIukv9ceb92Gwm2LD6HRnlUngA==
X-Google-Smtp-Source: AGHT+IHbKKwv3Cd14fMbRlzVZpxoDoNXbiyghddISZDjVQeIjBR6wf7cZ5tNAwGCF94LJdZf6RcGDg==
X-Received: by 2002:a05:6512:3f14:b0:594:27fb:e7f5 with SMTP id 2adb3069b0e04-597d3feb5f1mr1891895e87.42.1764834919370;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:18 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
Date: Thu, 04 Dec 2025 08:54:50 +0100
Message-Id: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEo+MWkC/x3MTQqAIBBA4avIrBvwJzddJVqIjjYbCy0JwrsnL
 b/Fey9UKkwVFvFCocaVjzxgJwF+dzkRchgGLbVVWs6YvMdy1wubReeip0BGkTMwirNQ5Oe/rVv
 vH4A+U+BdAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
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
X-CRM114-CacheID: sfid-20251203_235522_741224_C5BBAC57 
X-CRM114-Status: UNSURE (   8.55  )
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

Previous v4 patch:
https://lore.kernel.org/rust-for-linux/20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com/T/#t

Compared to v4, this v5:
- Placed `include Makefile.rust` under `ifdef need-compiler` branch. From my local testing, this did not cause any issues.
- The Kconfig function now only tests backend flags and has been renamed to `bindgen-option`, without depending on environment variable. Added a comment explaining the meaning of "backend".
- Improved the wording of commit messages and provided further details.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 12 deletions(-)
---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
