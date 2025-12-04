Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E08AD1D885
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSXapBFh53j+c2Aiwm9tdUIPhwS17R7GgHJTkszRAoE=; b=caE0vAlRCVgQTV
	7/PR71CqKI492lCfySM0yynTmXMWwCVZW8E5JLoIOb/Zk1fqO2WDCauims0UK+FBt7K3jVXNoRNpc
	DTJkC1Cq/awkmRsThLMgQ6iOoKQ3Eeif4SPF1d8Ft9UZE99PC5TV65QrBTNwe70Q0Pa2Hxz/7HFLI
	p9a3ZYjHdmRDVFV2fKdWCCwgzW3QCNLEki3geYsZieul1hE4NLv2GwcsLCqlSj7Xijc3X1Nxgq9Lh
	wg8ssU4HlJugsm0YcHl2bWmq+B/k4QenYrogIDPgR5UccJN0hAQMnWsG37UOS9qFvOMGTdVQc9Xzk
	a7LkLXK6e+fVQqcT58aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BQ-00000007dMK-0ySx;
	Thu, 04 Dec 2025 07:55:24 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BO-00000007dL5-2wQs
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 07:55:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-594330147efso523316e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=LYSnDssTfN1k7prxbXv/wil1t4ig7sXgj8hPy+wybNe3AZIRDGuURp32oFext4usBD
         v/g56B4hYOf7eqPB9sr0uCldksLUjrq5QF+5WQRF7Ws5xEj5uDRc5f903SP6Upm7aox/
         6mp8lRopZqEAQAwRoM19Av2seT4gAgBdan28ai+uSA2110L3cw6qyQemZ+ovfCtQ8hCe
         jUGrSNpv2CrGswjIlwCjHvy2SNvPwzxfDeVUHyW9Hy5ZRTBLf2OLd2pmwgi9kjuP+q08
         X/UO0v1TCPXZG+uI+2G1LceU90h8ZM90pvVS37xHcpmEFgXtlSnV9+Udozr0ZVbyt8B/
         8H+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=tXounpAb3LijZx4PBUOl0eAfrHKLfjv+/tUQrHkbE4kYvHPqJxpsaus6d0AGPNfKcf
         kXugqz/MKESlBMgycEmQHpZCJeNFsqeDkOVzToccs5+dFiWVbVrY8FymKgrWD7mfMJDW
         DteDbaK4LnX8jMjYCVTreVVW43IHY86m+Buc+//mqkJBsGkZU/IXqpHYwkVE4PVq3Unv
         VjcQzuaXGQ1V4R335vY+alYrVpxW/cFloe+TeJ1lezT2dw2ocjL179eWKA1U7GT1m9fk
         Nv07clYbcG75eERc4LWHMp1c2RSErOqACLdo3otEzqMjn9yweuOZqk29JJORlfiLGlpe
         M6ng==
X-Forwarded-Encrypted: i=1; AJvYcCV+8SNjdf5HA8sG4UQMZr9LumolxQdu3F+MmLH0E6IIQZMfzvNz2FeK1QUMPPy0JnLOa6XT0O1tVePvnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ndQaZctRR3e1wepr4GBMYD8H0pbXrWRBebK9vNvFIz0ieeN1
	EZUa1uruo+2KnxRJX7vChPIU3n0VTtQiTSKFKB5zFKginafizwRhQ2wG
X-Gm-Gg: ASbGnctA+fNigCntCG+XLhoXhRAvGfpU0nQzMFiKAxgFgfho5u5Uc0fVqys3l414SLp
	wFRjqEiVX72PuJSXQ6TBtA1TUviZIYOZf7/0/0bJVQzwC+ybr0MGLrnvwzi1FfyDoWoWTfhuUQ0
	F+IyAcx6Gnp1g5SBihxUb/iFX8kJhZCx15YP46S02IdmHATYB5MgMLsXl40+pZshAu3hfLejy6Z
	lDtOxWQXUa6jPMvMSmU5ZsE7mc1bEV4MUl50UciOel76EZ3ZJVcMvBIYPP7SffErJPj9f25WRxs
	Mi0QMSjJ8vc8z75w4dU9c1ENzeowidK5cRt94YzP1MfaFm+axbsPA2l28GeyZXsTsDvwRyRhv2n
	hyJ1hKWTeovh+MO47IUkMT/KApPe5bqIAyZwNx2dkxM+1yjut6NwENuUu+KCRUwGmH4Uu0Q==
X-Google-Smtp-Source: AGHT+IEldMEBa+Y+2+8e9BBmMa+iraf8wmEl/ZT2sdU4A9p2jyG2tZG76w7egCqyyaaevWjMOuPaow==
X-Received: by 2002:a05:6512:3c9c:b0:595:9d6b:1175 with SMTP id 2adb3069b0e04-597d3f27914mr1982243e87.14.1764834919940;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:51 +0100
Subject: [PATCH v5 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
MIME-Version: 1.0
Message-Id: <20251204-gcc-rust-v5-v5-1-2d4f20d86c24@gmail.com>
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
X-CRM114-CacheID: sfid-20251203_235522_774202_6602AFA3 
X-CRM114-Status: GOOD (  14.74  )
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

A subsequent commit will add a new function `bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Therefore, move this variable to a separate new `Makefile.rust` file and
include it from `scripts/Makefile` to make the exported variable
available for use in Kconfig. Place the include in the `need-compiler`
branch to avoid including it in irrelevant make targets.

Since the new file name is `Makefile.rust`, it matches an existing
MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
file is needed.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 3 ++-
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index e61f1300fea0..bdbf2025e68c 100644
--- a/Makefile
+++ b/Makefile
@@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+ifdef need-compiler
+include $(srctree)/scripts/Makefile.rust
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2603b34f9833 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
