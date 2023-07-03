Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5E2C001B1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWs9IuRx6ebTTTMUYNnN0uVsgqPmq5/TeclAQV4llvc=; b=q4krLcTOuPKpO+
	IcQdX0juCoIp61If4Widxp+vZuzc/eDXChOWqJbyH7Unl8O3PX5X0wFOycu9/cci7O+QZd16P1A/i
	SZ492wndb6xuMzAVPwPPNspLNux8k+dUYoJ9uM/LYeWPYNMKnEtS/BFU7c6CA63vzXE0c5ovPfGqD
	L2Ide2AnN2nhU4uNrBnMG2eauW7EiJFCpo4Jv3/uQOrxHTn0uDXpCzB3uiJmwuvebw3/goWPb3E1D
	sBK71ae0Ruq8BqGOjyf3058BYFIMs2f77vR1W8em9foLvw5Na97aYZZxkZwfOMOlIO5EuDjZEirHB
	nzp7uE+CkRsxuUCdfRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ55-00AYUB-20;
	Mon, 03 Jul 2023 12:55:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ52-00AYRy-0V
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:55:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so40656665e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388899; x=1690980899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uE3ed+qOC+4qK7E+eZU16MY7i1Q8gwASW1BIqAmC4Q=;
        b=KXfBA4dwyaWINqWobrlqgGljAokB7lB0w4uxKHe+MjjhJ6MU6drG+dBCfGaLaKLMUT
         Wuytx+JAlaoQoMvARJFQzofU8Q5GBknJKHveI809sfOuLtsVEKpdVJE2YzY/h8fMbDeF
         X6Tl/vA21Rd6JLXgTd6vaeIrbZDpg680h+Bw5+mbbRRTw2bNWu7Fp6cNVTvL38Eus2oW
         SyDqueEo4VrEMYAsl2wC+zdSntnd0NLsRddgn8kGRGloRI+BAT89n4APNVJhd19yL7ow
         EbPJTQGKjjx4izcl8A4E/hsI7NjpQnr0KXB5ztqN1MWItg44Tr5R4FDFGEBBDCY7re2w
         jWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388899; x=1690980899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uE3ed+qOC+4qK7E+eZU16MY7i1Q8gwASW1BIqAmC4Q=;
        b=bGfCrJcK1OQhpHEBFT90zR7nAxtoFBhUBBt9Wajx3RhmcYox8VGqcENxrsw0uMmWkM
         hPy4RaIjNludhixsApb7W42DtHxbYXrc1hAQqVJe1emURkUjKgcP3khXB+PvGcSn51zp
         6h2gJGUF18i6flY5NIABez3tsXXs3PCrzY0sUE+N/uEVNMzRiOGttW7ytiEBxAqnDa4m
         7jBXwfWg31epIhRV05bmDHWixybpWv1AXjizWWgcQaYjHWqHL+kGkv45XoPeytS5/HtY
         NXKuG1EGtgA3xyHQpMucCaYlsDxUVMo5LD+4LQT49KDYsRtNs9uBw5nMlFZtQtDqSzkq
         XyoA==
X-Gm-Message-State: AC+VfDxuSEhxNdqQ/ke2nup0s1B5baIRc4MAsuAYptRPf688XxJtNYBk
	MFxF8BeAfBZ+zh0DJF0G7qtNMQ==
X-Google-Smtp-Source: ACHHUZ5VUOGaM9JlKwN3HlVqTZGme530byxX95CP51zvYyoKEqerS7qsgoXHhQmTbUYoVAnfzKsSQg==
X-Received: by 2002:a1c:6a0c:0:b0:3fb:bc4a:46ad with SMTP id f12-20020a1c6a0c000000b003fbbc4a46admr7766337wmc.9.1688388898687;
        Mon, 03 Jul 2023 05:54:58 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003fbc9d178a8sm8488190wmq.4.2023.07.03.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:54:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date: Mon,  3 Jul 2023 14:46:45 +0200
Message-Id: <20230703124647.215952-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_055500_196976_0FFA921B 
X-CRM114-Status: GOOD (  12.03  )
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

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d85d90f5d000..19b627883313 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,35 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
 
+When set to 1, user space can read performance monitor counter registers
+directly.
+
 See Documentation/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user space access is disabled.
+
+The default value is 1, user space can read performance monitor counter
+registers through perf, any direct access without perf intervention will trigger
+an illegal instruction.
+
+When set to 2, which enables legacy mode (user space has direct access to cycle
+and insret CSRs only). Note that this legacy value is deprecated and will be
+removed once all user space applications are fixed.
+
+Note that the time CSR is always directly accessible to all modes.
 
 pid_max
 =======
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
