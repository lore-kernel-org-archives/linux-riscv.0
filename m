Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309A4EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSBu47+YP9xAzljhkzgogIazVLd9bdRxFwhCyhWaicg=; b=DbaCZnCm1V6YmP
	VpzbSnNkjxx0+IVvfvzGeQuV4V3/ob6dCYbcc/Lz0CWiC0Y4H384FNGR99o4OzhbAFU+tgQ2zPheJ
	1ia9qWU+6POgWDtf/4iW8WpPGHOabTMW1WQl8RdHqa/KZ3Imvty+ZsdvRydiogCUoX57KuLKrRjiS
	XDNyrF7T+5IGixNJlRUhd0uvtUZPeOcCWV5eXrDcziqshcOToJYBJjjEnqxEPxJmndaB5qEMfcowU
	qToPboQNzXe0oQ7ok/afp6xre58STMn1gYAcsfpIyZOqEcD2XiJph7XxNR3KytOEiyzeMhKbZyYRs
	O8NXOBPvLa9g4sVg+4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9ad-003Bcm-1y;
	Fri, 30 Jun 2023 08:34:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9aa-003BaZ-1T
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:34:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3141f73568fso884385f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114083; x=1690706083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N3S2PdFA0VnOMrqOiiJN/oJrFso6OovUf1itxoBYAA=;
        b=J5Sn0TMa0823JltcKEUSImQM6e0Z43AXFTNAAN1zqIBSWgR1tJ1Eg/He+/E288Nuc6
         AiyPl3/mzz7/zpY0QSkNwH2x57OXfJxna4a2FF8tBbBwJE+W1DnoEz0LKGRiK4PgcPCU
         po/VfBnBmAiZTj1BZuiuDn8AgiOei/Wz/lcP8Xk2igyM/S8bCC98ZSXOv592eNKw+nIG
         NmwcFrPAEBYmkK1d/ZvVdkOrhalki00+AidE81IPGrA95cXp/6BmiEEQgAA9qlU7fNQM
         etWeXu/FmWC+q12PA+iyqB0oMo5nmGNbzuc1QFNCOu3aUh+9hzI4u0M/PfvWaI+aG/HP
         wz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114083; x=1690706083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0N3S2PdFA0VnOMrqOiiJN/oJrFso6OovUf1itxoBYAA=;
        b=WYTViA8eSuDqTpV5m2NflmcuYsStRDKgr5Pts3rRRhb5zz2m/14jlwwmlFxYMy6GIg
         y+fAI7S93nOR6PZpX91Z2wAaM4YxS0o+3ClmXmQdfNvmjUOMmCXUesDyqxIFGu4pdaXW
         pCO5tN9OVsbKOFiptWcUZI1GasUz7bkktC7HvsGbhpkuSiD6l7WcjVaMakbVr5cpQU3v
         wvlw0DP1gKyU38o99zyjO3NfFwvM+Sp6pdw9u2lJohYOyaf6P7Z+josIkz3SqWxkpM4J
         Yo07XMhZAQPgB2vrGnNhrMJplUf5x/+utMWZc9OP5eV255hSO44sExtVG7D7kCkyHGTI
         M/dQ==
X-Gm-Message-State: ABy/qLZl8nHPNjfnurx3x5EL2P9ZeSkXjjPL7ZZPwnJrLmrVKiXfYOPW
	wfWyzuuFqf8iw4+gYFBWsgNQ9g==
X-Google-Smtp-Source: APBJJlEgKPYrVDEFl+Qq2I9oLtumgWiJSroN7sH+vO/yUwUUT/VtoZcK+tKhR7P0/qWi0SE0EQP+OA==
X-Received: by 2002:a5d:518c:0:b0:314:fe8:94d8 with SMTP id k12-20020a5d518c000000b003140fe894d8mr1704004wrv.31.1688114083209;
        Fri, 30 Jun 2023 01:34:43 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a11-20020a056000050b00b003110dc7f408sm17885607wrf.41.2023.06.30.01.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:34:42 -0700 (PDT)
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
Subject: [PATCH v3 03/10] riscv: Make legacy counter enum match the HW numbering
Date: Fri, 30 Jun 2023 10:30:06 +0200
Message-Id: <20230630083013.102334-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013448_494061_4FFF5A68 
X-CRM114-Status: GOOD (  12.68  )
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..6a000abc28bb 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 
 #define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_INSTRET	2
 
 static bool pmu_init_done;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
