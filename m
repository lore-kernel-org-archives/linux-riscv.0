Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BA2C46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM9LUjIkg2Q79iNoTNMz0GG9ir8/iEOIDNgQOVAV3C0=; b=3nIDXKxYKHhBU3
	vZrPibq3EgyciRFyse2/79lU1aL5hYO/mojT1jZLwpbQ/aUF1SzjURigc+cw+J5hOOApFkBcpVAxg
	KHcKLqiZxQE3gFSbKzueNkOa2ApGOCmRb0YavlWuFSFI6Tqd/rncTPiMFNQ62/H0qzBkIs4RWZhYU
	qOWV4frrdAV4kz1ePQacogfT7G8dSwEiN7G8h6WoPqbf04zJAANFGI6de/0A+VKeD7xccjTioTTMv
	R6G75kOjjv/d9o7S44b69WciRs+oXaBLqgozmynRjsjf6O2JeiDrKrZL0RBM+XQqYJwvz10IAWdMz
	IGFNNz5en++5NoyU1KAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfRZ-00Ft8V-0q;
	Thu, 28 Dec 2023 01:44:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ7-00Fs2L-2A
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Dec 2023 01:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g3Nao5aFqcs14j7uzTeCL4obzFSkk9OE7jeAS4fIG/k=; b=KsczF6fbe0/DDSqfe/xC3RZrzN
	L1LZWP8luI0kJq32G3G8h1NUFhlR6gSWFcQTHE7r4pTjF8QPC+YbznlDK5I19/jhUNGjOzKUqpdmY
	qXVMbuZjWTvl0OPznLykC+7mcUP6DUiwS4ZsBEpCLjpaS+zFvF57+njylx4fznMLllmCaCmMqH1fx
	3lJemI59ZE4VNnvfMd15zUBOR5J8cFtmzU2AjMHU5qBoxbM4H8vg5YIJ5kQx2VcGdUrRotAzb7GX+
	VrKfHuY39dnb1oVEjtvclpI1kAIJU6jcDJmIdvZtDtGE/du4xOi28DDmiLGvmcrcTj4ZnTIiIyB7r
	Nz1ghmZQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPy-000xJd-3A
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6d9aa51571fso2622443b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727757; x=1704332557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Nao5aFqcs14j7uzTeCL4obzFSkk9OE7jeAS4fIG/k=;
        b=gazKqjBCmstrGjGvKnUJd3/I+5pV20JKgPMTIA9ulQX7WWGCVBNHsopYmRj/H5C+Fv
         /ubXg+feyGA4o8UnF4xp01ZC0KTA7l7F0rQ3US9RzaLxO8fT6qlCd1cIv9HRsjlRmNAW
         7aXARIjza302ZtwMus+YQK6tobS/uuVibO9/K/uf0OCvSTI5Lz5CtxTKfRRLQJcAYIHU
         Jt9LtuHBAMhmLxSQRBtiL9Wf0ZsbLnIvEPuYuVJs/GzzpZjQqdcuXaq1XuxasqW/hMDJ
         xE0kCYZHOq5d8z1Sqow7vcqjQTKkAWIprVe0uH2UP9IpX3fnubYzm9af5jLYTDOb/fsi
         8Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727757; x=1704332557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3Nao5aFqcs14j7uzTeCL4obzFSkk9OE7jeAS4fIG/k=;
        b=U8SEvrv/j5gOjRheI8lPNciwM4R1id1fpHG+l9bldKWi8jS59MSBrK22fGuuxl0mVZ
         8X/BoEbWy2YTiUneHopArCbnUdja7EL4sKqkAWC4ZjhFT/iKSrBNO7yPfRA39AOIYhbZ
         I9K6KOIoQeieUb7uT8k1hXXopoXcl7lMrVQP+TjZAHf6PD0hNTTUHFPW87Z85dRhyH9A
         MTnpCvknqYLmnx12XVjRoAH8L7A4amlOzYZye9mpH1yeAoRB84yiwoxX07yCnE2SW5PX
         dWx4BKq9awaYzn9n3vP2nMXpbdrnIg/S98HgWlAvb6dRWcjotdlHHpeWkPlYYZW9WmYn
         j5pQ==
X-Gm-Message-State: AOJu0Yynvezl01sQr4ceQTX4D7U/MTryM3Tjz/QMfIkUv31Vnu7ISRlF
	RSSfadtb2+7QJ5VB+KEhwQxSXp9WqJzQ4Q==
X-Google-Smtp-Source: AGHT+IF6EDv76QAoc6OEmsqDg21WkjdveqS7R2bB/shYp3RQfsvs+Kqk+D0lgj6bhfU+kuxRie9joQ==
X-Received: by 2002:aa7:91d5:0:b0:6d2:95d4:9c37 with SMTP id z21-20020aa791d5000000b006d295d49c37mr9390922pfa.30.1703727756811;
        Wed, 27 Dec 2023 17:42:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:36 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 11/14] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Wed, 27 Dec 2023 17:42:01 -0800
Message-ID: <20231228014220.3562640-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_014239_262885_6AD75768 
X-CRM114-Status: GOOD (  11.74  )
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
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
index 6042a5a6a44f..554c39024a40 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
