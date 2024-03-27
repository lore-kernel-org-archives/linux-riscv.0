Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9A1C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fdB20WVpbROXPBRoKpY1pzt2bae7PSJyQHKEC9ZU+0=; b=OPBMG412Hxol/9
	kwm+yEnf4oZ68gf3rgf5YRBbnJCfR+SMWg8rHeApC+Xj04LXsQBi7yJ+rBFiJL6rzf8WynEV5M41D
	cCsqLqdKCQ/QH+MyfJVrRvPHFBKoj6JA7nukxqFK4ifCjCepiE/r7IIL+y93pOKhYmqDtHVuKqQPb
	ehZRdK6V6/uZVwvscIu4SODYsd7NNC+JA8YJqacZtdHuRxNwmReamrVfYrYFvx8O+D63xiDvSfPIo
	c6lQzJjqhG3Y8GoNSRxbpXvjJt1Vbzx8hirWadRCeg2zEBzhq4PB3DEKcxcTa74XHaPHsFkmcQAM7
	Pqqt2OB0KOwBL6I3sDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpafI-0000000BBFe-0m3R;
	Wed, 27 Mar 2024 21:18:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTZ-0000000AuBq-36YD
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Kt5T6f5KKlAqEBrctbVWHiZ4yWz8xGfDOuoPShtqdto=; b=qK0kGQUzTEaDSQ7cYJBuzcMJc9
	EfbBgST/KyenV9APqId9bNqbJ9/rxLfvHmG2YMvJjMetlM8rOpcIdleupQBT8nO3ghlWrOdfskiYy
	tbkbXh9gNarG8nsAK9bI8iE0RjS8GqhfIZLxRXTd1bJNOr7AtkgL4q9HM7STH80IgfXQ6mFoVqQWi
	JNlNHIShovIwQ+fLqD40kB+DuywqgsBd44OIn/qiyBy2xngstdQwe56JthkztWTyxT1kRyTNrfoZ7
	MpP+3jW1hgqFFcNS480+cepqrfX9aRRY6flpDSO8QjGxSZwdViGJPIO2L95q7RHfMLHNiYZ6VvYBD
	/MVC+3Aw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTU-00000004dq6-2sqP
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e0b889901bso2371785ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569734; x=1712174534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt5T6f5KKlAqEBrctbVWHiZ4yWz8xGfDOuoPShtqdto=;
        b=HCWKeHS+ePwcHUURIA8zbF8vlAXJR9pxjAgyT2XQYNhAjLF0AF/xvsHJHEkcskIGOA
         GR9SrXPLBhs/S+DD8u+VyUtYNCr46I82JzIqxbLUDIAenwv9yQwqpoXgELgAnRCwmxBV
         SfjbAsSHOnMZUKJw+LpTLxcqXNlOUJYsXbly6mS9J6x4rYVH2jI8kidx4RtNpGHBC1Th
         +F+KVFKdlVaxWjMos9cg6Ju1RkebGW3Udi1jfiGbAeKIBW0P2FlHF92KjHvb33wFeb7B
         1oh5PzAAhxXeQphHuRfxBieJEbSYW78ILzhjid8bPVXIS74DYju0Gah0S/1lXISqvswd
         Luxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569734; x=1712174534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt5T6f5KKlAqEBrctbVWHiZ4yWz8xGfDOuoPShtqdto=;
        b=tVf/sK2Sh/Mgm+p7fXQMy8CJy5lCJMfWIFLvpNwkAouhWnp50RowAA3CpgbY5yE9Jg
         0ay6xao8xGMqsNLv9YxWmN9ZyJ5oEk4pTKt951cQzG/V1NLwqdfg5s6ks6OwQEpu6/AX
         Ccx9tJVBmG0e0aaNc2PMk3m3X9Heu0QufFb76rHoTq0geKzW9Y2mZOoND3PJ0Gz2IWal
         X+h3voF0j6TifxtnbYRqI1uCS1TDvW7vRAiX0ybf6+kT921TE1nquGIHCIhPyviTS63z
         U/DbJnA9Vb7NTC9ssckqTVrdcmvKjKrL51pL9bIZJqdk6rR6RU6RhUrqMbXKoGfQby75
         oBVw==
X-Forwarded-Encrypted: i=1; AJvYcCXYdqg4Kk+us8vE0iqAEoesfWbFyKXKSxQgnj1XLWHRCF0RHpb6BDkn5/4Cl/Nq/hL9RJEeBLX4TyQyqvPw0Ji0nJnCZgQO1Ga3qX+PnqLw
X-Gm-Message-State: AOJu0YzY6eLNeaTYCKc/suboLYWHn10KiPRq8Q6Fl9EZU+Yy06TMutdF
	LOoxwdVG8iumeSLOoNyQFiHeAakFt7yZVc6m37S9nlHMpAooDwXMMLKESSqtN6c=
X-Google-Smtp-Source: AGHT+IGvbXfMD3NpHBvc61C4JrxkXrP2UbmyeCXEZSqIACFIDKyEi0FLcpBAl7w+qDDaJ12IbzUk9g==
X-Received: by 2002:a17:903:1211:b0:1e0:afa0:cc9c with SMTP id l17-20020a170903121100b001e0afa0cc9cmr851093plh.2.1711569733842;
        Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Deucher <alexander.deucher@amd.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 11/14] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Wed, 27 Mar 2024 13:00:42 -0700
Message-ID: <20240327200157.1097089-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200216_783052_41585BD8 
X-CRM114-Status: GOOD (  12.08  )
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

From: Michael Ellerman <mpe@ellerman.id.au>

The compiler flags enable altivec, but that is not required; hard-float
is sufficient for the code to build and function.

Drop altivec from the compiler flags and adjust the enable/disable code
to only enable FPU use.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 12 ++----------
 drivers/gpu/drm/amd/display/dc/dml/Makefile    |  2 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   |  2 +-
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..0de16796466b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			enable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			enable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			enable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_begin();
@@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			disable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			disable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			disable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_end();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index c4a5efd2dda5..59d3972341d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float -maltivec
+dml_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..7b51364084b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float -maltivec
+dml2_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
