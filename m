Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5840CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imJVALcJDJFleIqG1DXLQShwa/nL19G5d2h9oi6I7eg=; b=u2G5nVMK7uzjlO
	VcIAjybEKdSAeXFZqGUSzBYPhzyfbuQGkLUMIkY298tnZmIfa7dqzIcDYDPTiGZ6B0BlxC0BmbsNV
	Cr9OM7cE4n6Ika4PApG4fmL+VQtIMVR24cJw1m4f+4jjYSK8uvso6CJkrhXCIioidnPqUpBqveVKS
	CTd4eWDqxRy8kt/SbOGM/KhZf203mhqzxJm//Zv534O1nSXSieKv9ENQrwIUHUNl9Y/mPio5UVBS/
	nxt/Xkb6TYcXosAIDggdGk9YhWeMLZ/QljpLhpYpUKgqtb0xj+Gs0qT4zXT8idXjEScRzSmEkPZSM
	uXtqjuyTBf74BLCrzDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7go-0000000HKjj-3qbi;
	Fri, 29 Mar 2024 08:34:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bv-0000000H8ne-3GNz
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bxmfK/dV9iwtkx63gHffuqsF2FQECTKGikC6K6RCS1A=; b=IZRHky5EJafHJEWTI5O4kE9d88
	gMfAJDRn6TLHvrUcwTEgG3Wdy6IKSGIEQVIexv1/FoZQim9hJalfJ2k8F5Ldz1D1zDuUG8J+iPNjS
	KYrPeAKgI7l7Cnb56EIUbiT+tGhX8GVW6XaKt+N+WPoTO0D4ka9qaMezMaxRYu7CerWS+RoqZMbHh
	3DywSkZASdRctixlGV6n5Z+Bq1GdahCxDd7HCxDe9uiYh6Nf5KblcepIf07Mw77q3B4ozniYFvM++
	XpJETxhpIxQ+c8iAQhm3fqLSJey8+B2b+Oj7xf0GVoYRvqtf0nXJsVeJiEuhIUxnDmdtmUMPnMESQ
	uxbU4Tyg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bq-00000001Qvk-0dBU
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2a215582617so160327a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697104; x=1712301904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxmfK/dV9iwtkx63gHffuqsF2FQECTKGikC6K6RCS1A=;
        b=RUqs+OavvAIN2aHxItEDedHFDbF/9Qc/i0JJ9ZzaCsisjYXvo8RVsCq++Be9MCMAec
         ILTS21bNYXRsSoncewPm8jj4WfmY0Gtq58ut5Fvy9cXs9fdsmsdqlWCjmlmi6Wi/Nn2R
         E4fzGAEfZJdyWqR3yMgrnOe5/n3NyPEi3wx2cRlThdCe5hhZ7RihVcYNg5d/ncyKCu+m
         av99DC0GAfJfSsXHQ8QgRxwHZCraT2xoFseJ8L54ksTeKdPFoRlhZyHjzThYjR7tdpiz
         dwRqbbiQRE6cXK6ewmuNSWeD3qafn6fVI840oJaTrTpa8dsEtbA20WDWoYnNhGBrhiBG
         /Asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697104; x=1712301904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxmfK/dV9iwtkx63gHffuqsF2FQECTKGikC6K6RCS1A=;
        b=V1XdlUqO2FmVuuG+4CHgZD9ueZZeVvAsDYRQ1JGRRxloxnjzMLaJske00GAaV05k1x
         fHqSrPn2ANP1Sv9HI2ropNI2GK1SymCYNsVnVyilpaquGJIKNVkazwivSXnZ4BSfUdP9
         J/42I/FjCaTWY2Gi/6i0w+Ctslv8l+EXsVcXeQMJyDJU5O2s8yzfc7Mri9ya/Evi/Cir
         NS8FoZqgDgt8o16d2okKWzJDg5KWMQaoqXXJhBcKmg3sS29ep7BDFXQXHynul34DGEXt
         kI8awEA0y4lXkl+a1DGZi26L+vx92HvvOfZs/t0XOFcAZLmq4wSuKbTHIP6cQ04opBCV
         6bdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoFeQMW9+nfdzJZ4n9SPpogECnDxZlqWRZLSJOsvfMGeOmq42ze9XDtwQwG+wXkmsFeGof77IliQ6T4BL/kAhfYDfMr5L2SE94eUmqT7D
X-Gm-Message-State: AOJu0YwSE8Ak37Gbb37S/ogaO86jK23ALj76kGI72H05+d8hhb6uBSvM
	F4YFBl+V2naQf1jf2kaZHQk95PU+/fD+B0WL2HHbe9a2jwATipchCOb1elKTpX8=
X-Google-Smtp-Source: AGHT+IHpeVerdLnkB6vVIrwuNmVNMPefUfPXpMCtetpMqAC6/YKtxmEHNVWfJReDkAcL5lZnKsQNnw==
X-Received: by 2002:a17:90a:ff15:b0:2a0:4a22:3740 with SMTP id ce21-20020a17090aff1500b002a04a223740mr1338180pjb.49.1711697104041;
        Fri, 29 Mar 2024 00:25:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:03 -0700 (PDT)
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
Subject: [PATCH v4 12/15] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Fri, 29 Mar 2024 00:18:27 -0700
Message-ID: <20240329072441.591471-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072508_779026_E1B57570 
X-CRM114-Status: GOOD (  12.55  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
