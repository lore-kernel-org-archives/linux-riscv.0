Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA898C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekf2qRZ0aQTrLAPulJl16rA9hLquRu3HvkH6zbfZC2E=; b=y/QZMCUlDFvLUr
	+LIcubPhpeEpFl48qe8kctNzsxGsov/I+vQ74jNsvlW+4fYl7G4DiIFd7zXKEgbrAAI7/377rhXCH
	r702lzxHr7hZtkQItaiREtgmcmLOiP3hf05FjvlTQQtVRPMZ+mwZqIytc2l7dLpHwJitl/A8u7TnW
	9ZYP73PiTr/l+Mk49UxGR8xaDIdhgacnVcVjYG6rabT+xp1VprdvEKJCuCIYDMp/bsaBCH85vKpmR
	+0wDg1qh100sLbaWEpYvr4vPYU2CSSCGHITWM88NRsLyyLKCxODJLBqVXVoei9++uJjWzBw4l2K/2
	8qmvpoH4/sSIrOQ4ZYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6ry-004K2v-1x;
	Wed, 02 Aug 2023 08:06:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6ru-004K10-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:06:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31771a876b5so5508545f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963564; x=1691568364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=Adz4V7ebnS4I/sTqKU8RSqQEnKbk+n8KbATevT3pt2JKoSYYQPOQxfDEVEBfvip2nx
         AngRsIDgef7MaOxkLUmDETDs6o8j015PBBys0v/5d1MMOsHH3wCG0pMzCQ+boByDZJzW
         WXik2xuDgv/KfsnxBicFvsOoSJVq8bx2MDTxE8SLF1FC9QhLAM1J6Ux9ZeRZzpytge6i
         JbFsreahsXB+e74yq7ZevOSM9Wiyv+5NvC8D+bdJyNm5uYQd2Jz5DFeO+kjORGPLNy5y
         8ND7l4FtK3RsDrDHLAeY5MPDyZWtGoR+6ygXi0vJ9janNWqopEiqBN65X7PN//eY3QbX
         7gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963564; x=1691568364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=PuGxOznHMa7kxrg1L296dhpplljDskOir6jAAoETWUlxgtIDi83XGEzXOsJCM3z8H5
         oxXcKiCel8h/mve3L5209rqzpetd7kBIotsHtC2vBvk5aPxhzU9BR2pHOxyy7OO2A3gd
         E6xPYKTm7bNVmkyQVj6JHj7LIkNs3nrABCv3KOrx5xEnv8fqlM4AibjKZCG7KjEBmVSe
         aUxeuilSWgNQKRAMq4ZQHb0eoHJ6pl32lp2idorRxa9nYH9JWC6Fkcl2EX2xdiiZnnQi
         quBb4cOHHG7XRklhme69bY9rh+pmBp2iBdRq3pWNQNBXXA4BfAxT5a5azNi7l9mMJ3di
         5WGg==
X-Gm-Message-State: ABy/qLbKPoMKae77x+N/hVbh3dhis3r0LYDCCToh/NmwXFKUlMB+7Y/7
	n8d7JnhbU7LdMoW8boxVepvnEg==
X-Google-Smtp-Source: APBJJlG8oarSGyXOlT0EQobPAzvsBrq4qipdC0dcvV40KYMzzWjCixkSHe1ttjuuxvHCGFnvfLcJNg==
X-Received: by 2002:a5d:654b:0:b0:314:1f6:2c24 with SMTP id z11-20020a5d654b000000b0031401f62c24mr4197414wrv.36.1690963564470;
        Wed, 02 Aug 2023 01:06:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b0031773a8e5c4sm18156602wrn.37.2023.08.02.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:06:04 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Wed,  2 Aug 2023 10:03:20 +0200
Message-Id: <20230802080328.1213905-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_010606_523953_D8810584 
X-CRM114-Status: GOOD (  12.11  )
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

The current include guard prevents the inclusion of asm/perf_event.h
which uses the same include guard: fix the one in riscv_pmu.h so that it
matches the file name.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf/riscv_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43fc892aa7d9..9f70d94942e0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PERF_EVENT_H
-#define _ASM_RISCV_PERF_EVENT_H
+#ifndef _RISCV_PMU_H
+#define _RISCV_PMU_H
 
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
@@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 
 #endif /* CONFIG_RISCV_PMU */
 
-#endif /* _ASM_RISCV_PERF_EVENT_H */
+#endif /* _RISCV_PMU_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
