Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF83C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRnFtzL7gO6xZEBJHuq4quSbj7YthIUXKc9p64r2ItM=; b=W97ADgYnouq/E6
	vLKcdTmtbCA0QzL6hjk3OQLP80X31ZpLUFze/ta8W9QBF2glf8Uhm/LwREYTYTRN+eqPBQEM4dISF
	Xfz3a70ZbD4gQzOt1zKoSa3SrY95haf3suPchnBn5lE/Cbr4iWsjxX8D7mY7A07EeQdtjIwGc2NxI
	lJuPG0V/TNXX7pfWOqFAAYqU8w2wWOwgQuv9+otBOVgHfJ1/9sZjTzg8dvPaMhXivYtgDuwwQPiEQ
	0h1RqayhHgxmu2MhoYN6RIRnZh1kf98PM8j6hS+npAh3yBMt68cDIZXDR2iNdhrJ1liXBw5Iz/S6Z
	/T/k1lXwTh8JA1XHA2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1xa-00FBB5-2r;
	Thu, 27 Jul 2023 14:27:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1xW-00FB6C-2l
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:27:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3172144c084so1111465f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468036; x=1691072836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91jtKpAX8BKXnlM2DqECzDjrTgIUONnRJGEpBfq59o4=;
        b=USVtlzZpNwlYrsQ/yWuVvPJRGGc68ABNqkAYawYirkXn7ZDuug3OTHFZiUyezO7zda
         zGcr8wBTIGK2jIwXcydY8wz70yiXl/2gtFoFFqUROTaVNxkcaF1qwUTPGaWD14w2PTvO
         BIrYBbC3g+PleFK3ZHxJLfZE8n3mzvSPjUlpZH2pJJVLlQi7uMxJnDxJVgTExpOhiLwQ
         rN3BDxQ5jQZ1Y5LNxPkC6gTGFIkfNsL5zGj8utGStZ1gc6WWAqb/23rigAebUbt5YvbA
         ERiLCKS0iev3LQVaq9aa+s9Wx3HIeZ42CARfGbLjAl9BUCw3E0mlK6NA1DSEBd+uhTbm
         nZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468036; x=1691072836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91jtKpAX8BKXnlM2DqECzDjrTgIUONnRJGEpBfq59o4=;
        b=T4psfS4Dxzcx817/UhuXqs8huUS1yjV5rWA19DTE5PCfCXQTTRVQUG0k4TNLcER/Nm
         ngG3ieNAdrOlo5zyCkUdICeed0h2O1jkJPRqcHzUE+uInSCHofWVQITQsLxJg9DSfn/1
         5S3kbmJXz40vrNbdFUVlkx7sSEBKRByTO6dNceWg59iZqDRJYccTEgeznx6cTXmkmmzY
         xQ2JvXqetIQCVwOk3AX9LyDSxwrumkkIBr0TcSgzgd/8qaN2+ymsQPGzhGkSjMrflotu
         O+vlH4oMhToctYUWiE21axvMmshSRYrSA4a2d36LnSn2moD/1A9kMDDlLgtSghzIQRQk
         FZsQ==
X-Gm-Message-State: ABy/qLbuYga81Av+Fan2cISYvo+DOxmKTGSG2MfRdHA6vXFrgjtDRMCU
	XTscbYsWosMIj+/BVgxAxw4b3g==
X-Google-Smtp-Source: APBJJlGi6sdh3z78UtOfwf67hU0/mwQxZ1a4Ih0Kmo4uc5K941Szn210hkA/E32YMDfeTSdDnLxI8w==
X-Received: by 2002:a5d:428a:0:b0:317:5cfb:714e with SMTP id k10-20020a5d428a000000b003175cfb714emr2129750wrq.55.1690468035860;
        Thu, 27 Jul 2023 07:27:15 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6212000000b003143c6e09ccsm2266885wru.16.2023.07.27.07.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:27:15 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date: Thu, 27 Jul 2023 16:14:26 +0200
Message-Id: <20230727141428.962286-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_072718_924927_274FD0D4 
X-CRM114-Status: GOOD (  12.16  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 3800fab1619b..8019103aac10 100644
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
 See Documentation/arch/arm64/perf.rst for more information.
 
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
